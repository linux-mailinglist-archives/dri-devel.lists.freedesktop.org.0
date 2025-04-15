Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCDA89941
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FB110E6DE;
	Tue, 15 Apr 2025 10:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P77bJ0mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E3010E6D2;
 Tue, 15 Apr 2025 10:02:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC08E4322E;
 Tue, 15 Apr 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744711339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7GBErYHk9KHj13CcC6AmSVZPHLdbXrP3zEWDiOrrt8I=;
 b=P77bJ0mTzzdj1K9JYFMlp59dKz8ORM5BHaFHsHnhJ5kZSc4g2RhaCjoGpmUFWH/+nz5X20
 rn9txMGJwhlnm70lFYi9a1zrjMR3tPjF62E9RUR9CsFhDtOUp5Wldb5PLgUZMN2DgNYI8Q
 cTDMiDFq/6vi/iuG8Q9PPMAqyYQzpUUHhPCOCbWfHwP47a69ikSqzFVnumhnaPOd2Kms1M
 +BXlmhD9oPJYBPhXd6AVUyFayY6DmJlPFaozBukJ13WHhK6VJMWUfwVs1JSIrHt5C33qKT
 LRzyrbe+2hQN0JlZNLklg6qaXFrJybrvQ0duny30g/GtoNc6iri5zhwvQFXepg==
Message-ID: <a9d025a6-a880-469b-9863-aab104260122@bootlin.com>
Date: Tue, 15 Apr 2025 12:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 18/54] selftests-dyndbg: add
 tools/testing/selftests/dynamic_debug/*
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-19-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250402174156.1246171-19-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 02/04/2025 à 19:41, Jim Cromie a écrit :
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
>     	  --user root -v -p 4 -a dynamic_debug.verbose=3 V=1 \
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
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
> -r3 turn off green at end
>      drop config dep on TEST_DYNAMIC_DEBUG,
>      since basic-test uses builtin params
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
> enables several classes, and count them.  It could be re-written to
> work for the builtin module also, but builtin test modules are not a
> common or desirable build/config.
> 
> CONFIG_TEST_DYNAMIC_DEBUG=m && CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m
> 
> test_mod_submod() recaps the bug found in DRM-CI where drivers werent
> enabled by drm.debug=<bits>.  It modprobes both test_dynamic_debug &
> test_dynamic_debug_submod, so it depends on a loadable modules config.
> 
> It could be rewritten to work in a builtin parent config; DRM=y is
> common enough to be pertinent, but testing that config also wouldn't
> really test anything more fully than all-loadable modules, since they
> default together.
> 
> generalize-test-env
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
> index 1c5fcbd9e408..1192ad6c65c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8140,6 +8140,7 @@ S:	Maintained
>   F:	include/linux/dynamic_debug.h
>   F:	lib/dynamic_debug.c
>   F:	lib/test_dynamic_debug*.c
> +F:	tools/testing/selftests/dynamic_debug/*
>   
>   DYNAMIC INTERRUPT MODERATION
>   M:	Tal Gilboa <talgi@nvidia.com>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 8daac70c2f9d..b6a323c7f986 100644
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
> index 000000000000..6d06fa7f1040
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
> index 000000000000..0f906ff53908
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
> index 000000000000..465fad3f392c
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


