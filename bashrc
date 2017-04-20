# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

alias brokerlist='norhosts=$(scp broker.prod.ltp.ec2.external:/etc/hosts /dev/stdout | cat); ec2hosts=$(scp broker.prod.nor.external:/etc/hosts /dev/stdout); allhosts=$(echo "$norhosts"; echo "$ec2hosts"); echo "$allhosts" |  sort -n | uniq | grep --invert "^::1\|127\.0\.0\.1" | cut -d " " -f 2 | sort'
