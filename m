Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54095B4655E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0B10EC5D;
	Fri,  5 Sep 2025 21:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ig8EmHZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010D410E144;
 Fri,  5 Sep 2025 21:18:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DA3CE4E40C28;
 Fri,  5 Sep 2025 21:17:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9698B6060B;
 Fri,  5 Sep 2025 21:17:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F44A102F1C42; 
 Fri,  5 Sep 2025 23:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757107078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=DgYRrJrzvubzihzt6Q31QGoqsGh9M3HMY0a8wrCkXZg=;
 b=Ig8EmHZQEMxWCfM1LbiKpfocow8NHZCT/5rJilOAnTYa7tJ/S1zHGO1GPNSzV9/u0HHkAm
 CQoBV9KIYW3b5Jc4UiqfI9yNPW5WAaQwFOcKj1RX8nyhwCagaCUPlh3DeL0s6H6r6SIxuk
 tMlAwZe8mGn7bdaTY1AsM4mtJ9P2WEogXVo89uLY+6KVqr0REfFqzjPwkxvVSreSfvCaC2
 /DJv6WgMOOpREAbIy96Nz78fdMTMGm2I82ConsEeJbd1O47wFhlx8Y10iJmO3cD1ohWP1/
 BS7RtZuBPkl1IWHO4vY9VLyxUHCef9DipFGB/oisRkMi8sNw0GxpGU8FyfCZPw==
Message-ID: <688fa38c-a86b-4de7-ba0f-becd098b8bdc@bootlin.com>
Date: Fri, 5 Sep 2025 23:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/58] selftests-dyndbg: add a dynamic_debug run_tests
 target
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com, groeck@google.com, yanivt@google.com,
 bleung@google.com, quic_saipraka@quicinc.com, will@kernel.org,
 catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
 arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com
References: <20250803035816.603405-1-jim.cromie@gmail.com>
 <20250803035816.603405-18-jim.cromie@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250803035816.603405-18-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 03/08/2025 à 05:57, Jim Cromie a écrit :
> Add a selftest script for dynamic-debug.  The config requires
> CONFIG_TEST_DYNAMIC_DEBUG=m and CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m,
> which tacitly requires either CONFIG_DYNAMIC_DEBUG=y or
> CONFIG_DYNAMIC_DEBUG_CORE=y
> 
> ATM this has just basic_tests(), which modify pr_debug() flags in the
> builtin params module.  This means they're available to manipulate and
> observe the effects in "cat control".
> 
> This is backported from another feature branch; the support-fns (thx
> Lukas) have unused features at the moment, they'll get used shortly.
> 
> The script enables simple virtme-ng testing:
> 
>     [jimc@gandalf b0-ftrace]$ vrun_t
>     virtme-ng 1.32+115.g07b109d
>     doing: vng --name v6.14-rc4-60-gd5f48427de0c \
> 	  --user root -v -p 4 -a dynamic_debug.verbose=3 V=1 \
> 	  -- ../tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
>     virtme: waiting for virtiofsd to start
>     ..
> 
> And add dynamic_debug to TARGETS, so `make run_tests` sees it properly
> 
> For the impatient, set TARGETS explicitly:
> 
>    bash-5.2# make TARGETS=dynamic_debug run_tests
>    make[1]: ...
>    TAP version 13
>    1..1
>    [   35.552922] dyndbg: read 3 bytes from userspace
>    [   35.553099] dyndbg: query 0: "=_" mod:*
>    [   35.553544] dyndbg: processed 1 queries, with 1778 matches, 0 errs
> 
> NOTES
> 
> - check KCONFIG_CONFIG to avoid silly fails
> 
> Several tests are dependent upon config choices. Lets avoid failing
> where that is noise.
> 
> The KCONFIG_CONFIG var exists to convey the config-file around.  If
> the var names a file, read it and extract the relevant CONFIG items,
> and use them to skip the dependent tests, thus avoiding the fails that
> would follow, and the disruption to whatever CI is running these
> selftests.
> 
> If the envar doesn't name a config-file, ".config" is assumed.
> 
> CONFIG_DYNAMIC_DEBUG=y:
> 
> basic-tests() and comma-terminator-tests() test for the presence of
> the builtin pr_debugs in module/main.c, which I deemed stable and
> therefore safe to count.  That said, the test fails if only
> CONFIG_DYNAMIC_DEBUG_CORE=y is set.  It could be rewritten to test
> against test-dynamic-debug.ko, but that just trades one config
> dependence for another.
> 
> CONFIG_TEST_DYNAMIC_DEBUG=m
> 
> As written, test_percent_splitting() modprobes test_dynamic_debug,
> enables several classes, and counts them.  It could be re-written to
> work for the builtin module also, but builtin test modules are not a
> common or desirable build/config.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
> -r3 turn off green at end
>      drop config dep on TEST_DYNAMIC_DEBUG,
>      since basic-test uses builtin params
> ---
>   MAINTAINERS                                   |   1 +
>   tools/testing/selftests/Makefile              |   1 +
>   .../testing/selftests/dynamic_debug/Makefile  |   9 +
>   tools/testing/selftests/dynamic_debug/config  |   7 +
>   .../dynamic_debug/dyndbg_selftest.sh          | 257 ++++++++++++++++++
>   5 files changed, 275 insertions(+)
>   create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
>   create mode 100644 tools/testing/selftests/dynamic_debug/config
>   create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0b444e5fd5ad..4259d63c431a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8455,6 +8455,7 @@ S:	Maintained
>   F:	include/linux/dynamic_debug.h
>   F:	lib/dynamic_debug.c
>   F:	lib/test_dynamic_debug.c
> +F:	tools/testing/selftests/dynamic_debug/*
>   
>   DYNAMIC INTERRUPT MODERATION
>   M:	Tal Gilboa <talgi@nvidia.com>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 339b31e6a6b59..e13b55510e31d 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -26,6 +26,7 @@ TARGETS += drivers/net/team
>   TARGETS += drivers/net/virtio_net
>   TARGETS += drivers/platform/x86/intel/ifs
>   TARGETS += dt
> +TARGETS += dynamic_debug
>   TARGETS += efivarfs
>   TARGETS += exec
>   TARGETS += fchmodat2
> diff --git a/tools/testing/selftests/dynamic_debug/Makefile b/tools/testing/selftests/dynamic_debug/Makefile
> new file mode 100644
> index 0000000000000..6d06fa7f10405
> --- /dev/null
> +++ b/tools/testing/selftests/dynamic_debug/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# borrowed from Makefile for user memory selftests
> +
> +# No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
> +all:
> +
> +TEST_PROGS := dyndbg_selftest.sh
> +
> +include ../lib.mk
> diff --git a/tools/testing/selftests/dynamic_debug/config b/tools/testing/selftests/dynamic_debug/config
> new file mode 100644
> index 0000000000000..0f906ff539081
> --- /dev/null
> +++ b/tools/testing/selftests/dynamic_debug/config
> @@ -0,0 +1,7 @@
> +
> +# basic tests ref the builtin params module
> +CONFIG_DYNAMIC_DEBUG=m
> +
> +# more testing is possible with these
> +# CONFIG_TEST_DYNAMIC_DEBUG=m
> +# CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m
> diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> new file mode 100755
> index 0000000000000..465fad3f392cc
> --- /dev/null
> +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> @@ -0,0 +1,257 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +V=${V:=0}  # invoke as V=1 $0  for global verbose
> +RED="\033[0;31m"
> +GREEN="\033[0;32m"
> +YELLOW="\033[0;33m"
> +BLUE="\033[0;34m"
> +MAGENTA="\033[0;35m"
> +CYAN="\033[0;36m"
> +NC="\033[0;0m"
> +error_msg=""
> +
> +[ -e /proc/dynamic_debug/control ] || {
> +    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=y ${NC}"
> +    exit 0 # nothing to test here, no good reason to fail.
> +}
> +
> +# need info to avoid failures due to untestable configs
> +
> +[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=".config"
> +if [ -f "$KCONFIG_CONFIG" ]; then
> +    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
> +    grep -q "CONFIG_DYNAMIC_DEBUG=y" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=$?
> +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=m" $KCONFIG_CONFIG ; LACK_TMOD=$?
> +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m" $KCONFIG_CONFIG ; LACK_TMOD_SUBMOD=$?
> +    if [ $V -eq 1 ]; then
> +	echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
> +	echo LACK_TMOD: $LACK_TMOD
> +	echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
> +    fi
> +else
> +    LACK_DD_BUILTIN=0
> +    LACK_TMOD=0
> +    LACK_TMOD_SUBMOD=0
> +fi

Nitpick for the sh file: is it normal to have inconsistent indenting ?(4
space, tabs, 8 spaces)

> +function vx () {
> +    echo $1 > /sys/module/dynamic_debug/parameters/verbose
> +}
> +
> +function ddgrep () {
> +    grep $1 /proc/dynamic_debug/control
> +}
> +
> +function doprints () {
> +    cat /sys/module/test_dynamic_debug/parameters/do_prints
> +}
> +
> +function ddcmd () {
> +    exp_exit_code=0
> +    num_args=$#
> +    if [ "${@:$#}" = "pass" ]; then
> +	num_args=$#-1
> +    elif [ "${@:$#}" = "fail" ]; then
> +        num_args=$#-1
> +	exp_exit_code=1
> +    fi
> +    args=${@:1:$num_args}
> +    output=$((echo "$args" > /proc/dynamic_debug/control) 2>&1)
> +    exit_code=$?
> +    error_msg=$(echo $output | cut -d ":" -f 5 | sed -e 's/^[[:space:]]*//')
> +    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
> +}
> +
> +function handle_exit_code() {
> +    local exp_exit_code=0
> +    [ $# == 4 ] && exp_exit_code=$4
> +    if [ $3 -ne $exp_exit_code ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$1 $2() expected to exit with code $exp_exit_code"
> +	[ $3 == 1 ] && echo "Error: '$error_msg'"
> +        exit
> +    fi
> +}
> +
> +# $1 - pattern to match, pattern in $1 is enclosed by spaces for a match ""\s$1\s"
> +# $2 - number of times the pattern passed in $1 is expected to match
> +# $3 - optional can be set either to "-r" or "-v"
> +#       "-r" means relaxed matching in this case pattern provided in $1 is passed
> +#       as is without enclosing it with spaces
> +#       "-v" prints matching lines
> +# $4 - optional when $3 is set to "-r" then $4 can be used to pass "-v"
> +function check_match_ct {
> +    pattern="\s$1\s"
> +    exp_cnt=0
> +
> +    [ "$3" == "-r" ] && pattern="$1"
> +    let cnt=$(ddgrep "$pattern" | wc -l)
> +    if [ $V -eq 1 ] || [ "$3" == "-v" ] || [ "$4" == "-v" ]; then
> +        echo -ne "${BLUE}" && ddgrep $pattern && echo -ne "${NC}"
> +    fi
> +    [ $# -gt 1 ] && exp_cnt=$2
> +    if [ $cnt -ne $exp_cnt ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO check failed expected $exp_cnt on $1, got $cnt"
> +        exit
> +    else
> +        echo ": $cnt matches on $1"
> +    fi
> +}
> +
> +# $1 - trace instance name
> +# #2 - if > 0 then directory is expected to exist, if <= 0 then otherwise
> +# $3 - "-v" for verbose
> +function check_trace_instance_dir {
> +    if [ -e /sys/kernel/tracing/instances/$1 ]; then
> +        if [ "$3" == "-v" ] ; then
> +            echo "ls -l /sys/kernel/tracing/instances/$1: "
> +            ls -l /sys/kernel/tracing/instances/$1
> +        fi
> +	if [ $2 -le 0 ]; then
> +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
> +		    '/sys/kernel/tracing/instances/$1' does exist"
> +	    exit
> +	fi
> +    else
> +	if [ $2 -gt 0 ]; then
> +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace instance \
> +		    '/sys/kernel/tracing/instances/$1' does not exist"
> +	    exit
> +        fi
> +    fi
> +}
> +
> +function tmark {
> +    echo $* > /sys/kernel/tracing/trace_marker
> +}
> +
> +# $1 - trace instance name
> +# $2 - line number
> +# $3 - if > 0 then the instance is expected to be opened, otherwise
> +# the instance is expected to be closed
> +function check_trace_instance {
> +    output=$(tail -n9 /proc/dynamic_debug/control | grep ": Opened trace instances" \
> +	    | xargs -n1 | grep $1)
> +    if [ "$output" != $1 ] && [ $3 -gt 0 ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not opened"
> +        exit
> +    fi
> +    if [ "$output" == $1 ] && [ $3 -le 0 ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not closed"
> +        exit
> +    fi
> +}
> +
> +function is_trace_instance_opened {
> +    check_trace_instance $1 $BASH_LINENO 1
> +}
> +
> +function is_trace_instance_closed {
> +    check_trace_instance $1 $BASH_LINENO 0
> +}
> +
> +# $1 - trace instance directory to delete
> +# $2 - if > 0 then directory is expected to be deleted successfully, if <= 0 then otherwise
> +function del_trace_instance_dir() {
> +    exp_exit_code=1
> +    [ $2 -gt 0 ] && exp_exit_code=0
> +    output=$((rmdir /sys/kernel/debug/tracing/instances/$1) 2>&1)
> +    exit_code=$?
> +    error_msg=$(echo $output | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//')
> +    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
> +}
> +
> +function error_log_ref {
> +    # to show what I got
> +    : echo "# error-log-ref: $1"
> +    : echo cat \$2
> +}
> +
> +function ifrmmod {
> +    lsmod | grep $1 2>&1>/dev/null && rmmod $1
> +}
> +
> +# $1 - text to search for
> +function search_trace() {
> +    search_trace_name 0 1 $1
> +}
> +
> +# $1 - trace instance name, 0 for global event trace
> +# $2 - line number counting from the bottom
> +# $3 - text to search for
> +function search_trace_name() {
> +	if [ "$1" = "0" ]; then
> +	    buf=$(cat /sys/kernel/debug/tracing/trace)
> +	    line=$(tail -$2 /sys/kernel/debug/tracing/trace | head -1 | sed -e 's/^[[:space:]]*//')
> +	else
> +	    buf=$(cat /sys/kernel/debug/tracing/instances/$1/trace)
> +	    line=$(tail -$2 /sys/kernel/debug/tracing/instances/$1/trace | head -1 | \
> +		   sed -e 's/^[[:space:]]*//')
> +	fi
> +	if [ $2 = 0 ]; then
> +	    # whole-buf check
> +	    output=$(echo $buf | grep "$3")
> +	else
> +	    output=$(echo $line | grep "$3")
> +	fi
> +	if [ "$output" = "" ]; then
> +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO search for '$3' failed \
> +		    in line '$line' or '$buf'"
> +	    exit
> +	fi
> +	if [ $V = 1 ]; then
> +	    echo -e "${MAGENTA}: search_trace_name in $1 found: \n$output \nin:${BLUE} $buf ${NC}"
> +        fi
> +}
> +
> +# $1 - error message to check
> +function check_err_msg() {
> +    if [ "$error_msg" != "$1" ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error message '$error_msg' \
> +		does not match with '$1'"
> +        exit
> +    fi
> +}
> +
> +function basic_tests {
> +    echo -e "${GREEN}# BASIC_TESTS ${NC}"
> +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
> +    ddcmd =_ # zero everything
> +    check_match_ct =p 0
> +
> +    # module params are builtin to handle boot args
> +    check_match_ct '\[params\]' 4 -r
> +    ddcmd module params +mpf
> +    check_match_ct =pmf 4
> +
> +    # multi-cmd input, newline separated, with embedded comments
> +    cat <<"EOF" > /proc/dynamic_debug/control
> +      module params =_				# clear params
> +      module params +mf				# set flags
> +      module params func parse_args +sl		# other flags
> +EOF
> +    check_match_ct =mf 3
> +    check_match_ct =mfsl 1
> +    ddcmd =_
> +}
> +
> +tests_list=(
> +    basic_tests
> +)
> +
> +# Run tests
> +
> +ifrmmod test_dynamic_debug_submod
> +ifrmmod test_dynamic_debug
> +
> +for test in "${tests_list[@]}"
> +do
> +    $test
> +    echo ""
> +done
> +echo -en "${GREEN}# Done on: "
> +date
> +echo -en "${NC}"

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

