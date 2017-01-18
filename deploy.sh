#!/bin/sh
# Tomcat Servlet Engine

case "$1" in
 'start')
        if [ -f /root/mohan/apache-tomcat-8.5.5/bin/startup.sh ];
          then
            echo $"Starting Tomcat"
            /bin/su - root -c /root/mohan/apache-tomcat-8.5.5/bin/startup.sh
        fi
        ;;
 'stop')
        if [ -f /root/mohan/apache-tomcat-8.5.5/bin/shutdown.sh ];
          then
          echo $"Stopping Tomcat"
          /bin/su - root -c /root/mohan/apache-tomcat-8.5.5/bin/shutdown.sh
rm -rf /root/mohan/apache-tomcat-8.5.5/webapps/CounterWebApp*
echo "clean the war files"
scp /root/hcl-verizon/slave1/workspace/DEV-TO-QA-OPS/BRANCH-QA1/target/CounterWebApp* /root/mohan/apache-tomcat-8.5.5/webapps/
echo "copy the latest war files"
        fi
        ;;
 *)
	echo "Usage: $0 { start | stop }"
	;;
esac
exit 0	