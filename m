Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9EA8A860
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB7010E382;
	Tue, 15 Apr 2025 19:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XDjAZ+cU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E104310E382;
 Tue, 15 Apr 2025 19:47:10 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ef60e500d7so54375447b3.0; 
 Tue, 15 Apr 2025 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744746430; x=1745351230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5bSHJdQC3WrPn0Czdv6CK3Q3wQ60dPv5EscshlCojg=;
 b=XDjAZ+cUieVnr+CcCqmUS3jeQNm5BYN3GFXD+xD55/kM+p8t8nk9vtTFZGxCYzlHAy
 3vTaVabr/iUFCtepjHDiT4iG6hyaduGUI4XLZoktvupr/QdUKkafCCw3Pqvq8IKtJPwK
 j22O1aXaFHwdCZrVZyW8Hl4+yLRGhMLzpDJNIbdH1Bu2FFvQXoLOO3v+aLZleOUivTKd
 gGlXWefJG7rBCk0qHalj86G9iCrFxYPdIMA9u7eoTJw8sIsfuTv5A9v4TyuHXbitd8QV
 Sy6lD/QwT/dbZhHeJmYt2AR+vUnQ0tOl3cXtAHvjJfbdLP1LkQ31DZYuC4kVqB2gaOtU
 pSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746430; x=1745351230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5bSHJdQC3WrPn0Czdv6CK3Q3wQ60dPv5EscshlCojg=;
 b=BOd+tKxzi2EaFQKOSWR4ys3rAnx3/i5MX91rMRkRJkUU1RojU7YynRvE0Xb4iHEbCX
 9S0cwQFHcVnmyV4KZoI5pR7Vdy35LS2WyTXM99PhnHuc0hF2jrNiLHTt4fBr4uiZkCpe
 AGUY1f1nCiGC0NL0KdK0QAEgWNvWCV1mUUInMKJKhOiRa6CJ3z5N32olGaKCdQGrUFpB
 r/9ls6zJgAaE/0H4Js3xjgY8WMlIjWa3lOtEFi6KMfQxgVDTlgEp0PWn21J8l9pIHdny
 e/Y44KNI3w4ktYi/ovG+KwwosB2fHvTfmeNHVGFHl5T8umiSjn1bxsVAUmNTTB8e2INF
 b7EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/WIvTSWLz+NNy3kZF0objV+R8Yg1cUVPzTVC4q4jIW4EyWarBvp+zrVVWBr078hjqirCNbTOf@lists.freedesktop.org,
 AJvYcCVB2cBsFN3h0WPb1dZKMR5EKvM5w9/Lir6X/DUYu7sVXztPi8ZRwjuSmIntpKm+n30rQDA17rTsCp45@lists.freedesktop.org,
 AJvYcCW9YA/GgdKorn1aM45QiCb3XPIImaG6zb7yhLOXQIy0eH2TPBY1nlnCzJ3q/BSjl19fJPi22bUb3CYLqH9ojg==@lists.freedesktop.org,
 AJvYcCXDi7drQDH6D2enWXrxFOiqbsDLb/cT8r5B+B6+/pamATxMwvhkIKgY46r9hzgSRchz6WbziFvPce2C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP0YnmxKZcKtYdHbTiPwXoNU1t1ZpKaXMfVtb0wliRFj/YNez0
 pzDYqyBUwJBbFw3bVT42Vpm3pHu8tGGXkH9N+UPw2i89363PSX7FUVM/R6Oz12tdn1JnG5hBbJn
 oxZeXhTkuw8Zw9jYC+Ze+N0H0jCs=
X-Gm-Gg: ASbGncu2g0RE0lhcT9x6PcjiXWeaxGiofY0kuXXpBSZdWt4oaWcbXx6pdnTa/PF/Ixj
 58kwMpMT3nxQ7RNKwDztqXwA+OXYWM50cb0LuFUgfl+F0KvwuuXY68K09+1VYFMOPFirjO+AOzS
 mo66XQvNDnbbDfWkm/n4BK
X-Google-Smtp-Source: AGHT+IEPWlHNJ/J606yeAJ/37YZzyfmcVwbkzN/jQDQ6gWyJt2gOriur1mC9teoFSDpGwD/HV3OUjAxF2pESuc72fFs=
X-Received: by 2002:a05:690c:650a:b0:6fe:bfb9:549c with SMTP id
 00721157ae682-706acea400amr10030247b3.1.1744746429820; Tue, 15 Apr 2025
 12:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-19-jim.cromie@gmail.com>
 <a9d025a6-a880-469b-9863-aab104260122@bootlin.com>
In-Reply-To: <a9d025a6-a880-469b-9863-aab104260122@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 13:46:43 -0600
X-Gm-Features: ATxdqUHksEi3iKhM-FzZLOPzOVcMKG31wVf1FvqKmpw3lDXWIjQ3-6Oq7hxhTv8
Message-ID: <CAJfuBxz8xjfd-QghhvQQfEYUavC+5W8HNeVTa5v_-DrAh1ofvA@mail.gmail.com>
Subject: Re: [PATCH v3 18/54] selftests-dyndbg: add
 tools/testing/selftests/dynamic_debug/*
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 15, 2025 at 4:02=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > Add a selftest script for dynamic-debug.  The config requires
> > CONFIG_TEST_DYNAMIC_DEBUG=3Dm and CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=3Dm,
> > which tacitly requires either CONFIG_DYNAMIC_DEBUG=3Dy or
> > CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> >
> > ATM this has just basic_tests(), which modify pr_debug() flags in the
> > builtin params module.  This means they're available to manipulate and
> > observe the effects in "cat control".
> >
> > This is backported from another feature branch; the support-fns (thx
> > Lukas) have unused features at the moment, they'll get used shortly.
> >
> > The script enables simple virtme-ng testing:
> >
> >     [jimc@gandalf b0-ftrace]$ vrun_t
> >     virtme-ng 1.32+115.g07b109d
> >     doing: vng --name v6.14-rc4-60-gd5f48427de0c \
> >         --user root -v -p 4 -a dynamic_debug.verbose=3D3 V=3D1 \
> >         -- ../tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> >     virtme: waiting for virtiofsd to start
> >     ..
> >
> > And add dynamic_debug to TARGETS, so `make run_tests` sees it properly
> >
> > For the impatient, set TARGETS explicitly:
> >
> >    bash-5.2# make TARGETS=3Ddynamic_debug run_tests
> >    make[1]: ...
> >    TAP version 13
> >    1..1
> >    [   35.552922] dyndbg: read 3 bytes from userspace
> >    [   35.553099] dyndbg: query 0: "=3D_" mod:*
> >    [   35.553544] dyndbg: processed 1 queries, with 1778 matches, 0 err=
s
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> > -r3 turn off green at end
> >      drop config dep on TEST_DYNAMIC_DEBUG,
> >      since basic-test uses builtin params
> >
> > - check KCONFIG_CONFIG to avoid silly fails
> >
> > Several tests are dependent upon config choices. Lets avoid failing
> > where that is noise.
> >
> > The KCONFIG_CONFIG var exists to convey the config-file around.  If
> > the var names a file, read it and extract the relevant CONFIG items,
> > and use them to skip the dependent tests, thus avoiding the fails that
> > would follow, and the disruption to whatever CI is running these
> > selftests.
> >
> > If the envar doesn't name a config-file, ".config" is assumed.
> >
> > CONFIG_DYNAMIC_DEBUG=3Dy:
> >
> > basic-tests() and comma-terminator-tests() test for the presence of
> > the builtin pr_debugs in module/main.c, which I deemed stable and
> > therefore safe to count.  That said, the test fails if only
> > CONFIG_DYNAMIC_DEBUG_CORE=3Dy is set.  It could be rewritten to test
> > against test-dynamic-debug.ko, but that just trades one config
> > dependence for another.
> >
> > CONFIG_TEST_DYNAMIC_DEBUG=3Dm
> >
> > As written, test_percent_splitting() modprobes test_dynamic_debug,
> > enables several classes, and count them.  It could be re-written to
> > work for the builtin module also, but builtin test modules are not a
> > common or desirable build/config.
> >
> > CONFIG_TEST_DYNAMIC_DEBUG=3Dm && CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=3Dm
> >
> > test_mod_submod() recaps the bug found in DRM-CI where drivers werent
> > enabled by drm.debug=3D<bits>.  It modprobes both test_dynamic_debug &
> > test_dynamic_debug_submod, so it depends on a loadable modules config.
> >
> > It could be rewritten to work in a builtin parent config; DRM=3Dy is
> > common enough to be pertinent, but testing that config also wouldn't
> > really test anything more fully than all-loadable modules, since they
> > default together.
> >
> > generalize-test-env
> > ---
> >   MAINTAINERS                                   |   1 +
> >   tools/testing/selftests/Makefile              |   1 +
> >   .../testing/selftests/dynamic_debug/Makefile  |   9 +
> >   tools/testing/selftests/dynamic_debug/config  |   7 +
> >   .../dynamic_debug/dyndbg_selftest.sh          | 257 +++++++++++++++++=
+
> >   5 files changed, 275 insertions(+)
> >   create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
> >   create mode 100644 tools/testing/selftests/dynamic_debug/config
> >   create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selft=
est.sh
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1c5fcbd9e408..1192ad6c65c1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8140,6 +8140,7 @@ S:      Maintained
> >   F:  include/linux/dynamic_debug.h
> >   F:  lib/dynamic_debug.c
> >   F:  lib/test_dynamic_debug*.c
> > +F:   tools/testing/selftests/dynamic_debug/*
> >
> >   DYNAMIC INTERRUPT MODERATION
> >   M:  Tal Gilboa <talgi@nvidia.com>
> > diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests=
/Makefile
> > index 8daac70c2f9d..b6a323c7f986 100644
> > --- a/tools/testing/selftests/Makefile
> > +++ b/tools/testing/selftests/Makefile
> > @@ -26,6 +26,7 @@ TARGETS +=3D drivers/net/team
> >   TARGETS +=3D drivers/net/virtio_net
> >   TARGETS +=3D drivers/platform/x86/intel/ifs
> >   TARGETS +=3D dt
> > +TARGETS +=3D dynamic_debug
> >   TARGETS +=3D efivarfs
> >   TARGETS +=3D exec
> >   TARGETS +=3D fchmodat2
> > diff --git a/tools/testing/selftests/dynamic_debug/Makefile b/tools/tes=
ting/selftests/dynamic_debug/Makefile
> > new file mode 100644
> > index 000000000000..6d06fa7f1040
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# borrowed from Makefile for user memory selftests
> > +
> > +# No binaries, but make sure arg-less "make" doesn't trigger "run_test=
s"
> > +all:
> > +
> > +TEST_PROGS :=3D dyndbg_selftest.sh
> > +
> > +include ../lib.mk
> > diff --git a/tools/testing/selftests/dynamic_debug/config b/tools/testi=
ng/selftests/dynamic_debug/config
> > new file mode 100644
> > index 000000000000..0f906ff53908
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/config
> > @@ -0,0 +1,7 @@
> > +
> > +# basic tests ref the builtin params module
> > +CONFIG_DYNAMIC_DEBUG=3Dm
> > +
> > +# more testing is possible with these
> > +# CONFIG_TEST_DYNAMIC_DEBUG=3Dm
> > +# CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=3Dm
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > new file mode 100755
> > index 000000000000..465fad3f392c
> > --- /dev/null
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > @@ -0,0 +1,257 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +V=3D${V:=3D0}  # invoke as V=3D1 $0  for global verbose
> > +RED=3D"\033[0;31m"
> > +GREEN=3D"\033[0;32m"
> > +YELLOW=3D"\033[0;33m"
> > +BLUE=3D"\033[0;34m"
> > +MAGENTA=3D"\033[0;35m"
> > +CYAN=3D"\033[0;36m"
> > +NC=3D"\033[0;0m"
> > +error_msg=3D""
> > +
> > +[ -e /proc/dynamic_debug/control ] || {
> > +    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=3Dy ${NC}=
"
> > +    exit 0 # nothing to test here, no good reason to fail.
> > +}
> > +
> > +# need info to avoid failures due to untestable configs
> > +
> > +[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=3D".config"
> > +if [ -f "$KCONFIG_CONFIG" ]; then
> > +    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
> > +    grep -q "CONFIG_DYNAMIC_DEBUG=3Dy" $KCONFIG_CONFIG ; LACK_DD_BUILT=
IN=3D$?
> > +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=3Dm" $KCONFIG_CONFIG ; LACK_TMO=
D=3D$?
> > +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=3Dm" $KCONFIG_CONFIG ; L=
ACK_TMOD_SUBMOD=3D$?
> > +    if [ $V -eq 1 ]; then
> > +     echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
> > +     echo LACK_TMOD: $LACK_TMOD
> > +     echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
> > +    fi
> > +else
> > +    LACK_DD_BUILTIN=3D0
> > +    LACK_TMOD=3D0
> > +    LACK_TMOD_SUBMOD=3D0
> > +fi
>
> Nitpick for the sh file: is it normal to have inconsistent indenting ?(4
> space, tabs, 8 spaces)
>

hmm.
I just checked scripts/bpf_doc.py
it uses 4 space indents, I didnt check for tabs.

But I will go look for inconsistencies and mixes of spaces & tabs

> > +function vx () {
> > +    echo $1 > /sys/module/dynamic_debug/parameters/verbose
> > +}
> > +
> > +function ddgrep () {
> > +    grep $1 /proc/dynamic_debug/control
> > +}
> > +
> > +function doprints () {
> > +    cat /sys/module/test_dynamic_debug/parameters/do_prints
> > +}
> > +
> > +function ddcmd () {
> > +    exp_exit_code=3D0
> > +    num_args=3D$#
> > +    if [ "${@:$#}" =3D "pass" ]; then
> > +     num_args=3D$#-1
> > +    elif [ "${@:$#}" =3D "fail" ]; then
> > +        num_args=3D$#-1
> > +     exp_exit_code=3D1
> > +    fi
> > +    args=3D${@:1:$num_args}
> > +    output=3D$((echo "$args" > /proc/dynamic_debug/control) 2>&1)
> > +    exit_code=3D$?
> > +    error_msg=3D$(echo $output | cut -d ":" -f 5 | sed -e 's/^[[:space=
:]]*//')
> > +    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
> > +}
> > +
> > +function handle_exit_code() {
> > +    local exp_exit_code=3D0
> > +    [ $# =3D=3D 4 ] && exp_exit_code=3D$4
> > +    if [ $3 -ne $exp_exit_code ]; then
> > +        echo -e "${RED}: $BASH_SOURCE:$1 $2() expected to exit with co=
de $exp_exit_code"
> > +     [ $3 =3D=3D 1 ] && echo "Error: '$error_msg'"
> > +        exit
> > +    fi
> > +}
> > +
> > +# $1 - pattern to match, pattern in $1 is enclosed by spaces for a mat=
ch ""\s$1\s"
> > +# $2 - number of times the pattern passed in $1 is expected to match
> > +# $3 - optional can be set either to "-r" or "-v"
> > +#       "-r" means relaxed matching in this case pattern provided in $=
1 is passed
> > +#       as is without enclosing it with spaces
> > +#       "-v" prints matching lines
> > +# $4 - optional when $3 is set to "-r" then $4 can be used to pass "-v=
"
> > +function check_match_ct {
> > +    pattern=3D"\s$1\s"
> > +    exp_cnt=3D0
> > +
> > +    [ "$3" =3D=3D "-r" ] && pattern=3D"$1"
> > +    let cnt=3D$(ddgrep "$pattern" | wc -l)
> > +    if [ $V -eq 1 ] || [ "$3" =3D=3D "-v" ] || [ "$4" =3D=3D "-v" ]; t=
hen
> > +        echo -ne "${BLUE}" && ddgrep $pattern && echo -ne "${NC}"
> > +    fi
> > +    [ $# -gt 1 ] && exp_cnt=3D$2
> > +    if [ $cnt -ne $exp_cnt ]; then
> > +        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO check failed expect=
ed $exp_cnt on $1, got $cnt"
> > +        exit
> > +    else
> > +        echo ": $cnt matches on $1"
> > +    fi
> > +}
> > +
> > +# $1 - trace instance name
> > +# #2 - if > 0 then directory is expected to exist, if <=3D 0 then othe=
rwise
> > +# $3 - "-v" for verbose
> > +function check_trace_instance_dir {
> > +    if [ -e /sys/kernel/tracing/instances/$1 ]; then
> > +        if [ "$3" =3D=3D "-v" ] ; then
> > +            echo "ls -l /sys/kernel/tracing/instances/$1: "
> > +            ls -l /sys/kernel/tracing/instances/$1
> > +        fi
> > +     if [ $2 -le 0 ]; then
> > +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace ins=
tance \
> > +                 '/sys/kernel/tracing/instances/$1' does exist"
> > +         exit
> > +     fi
> > +    else
> > +     if [ $2 -gt 0 ]; then
> > +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error trace ins=
tance \
> > +                 '/sys/kernel/tracing/instances/$1' does not exist"
> > +         exit
> > +        fi
> > +    fi
> > +}
> > +
> > +function tmark {
> > +    echo $* > /sys/kernel/tracing/trace_marker
> > +}
> > +
> > +# $1 - trace instance name
> > +# $2 - line number
> > +# $3 - if > 0 then the instance is expected to be opened, otherwise
> > +# the instance is expected to be closed
> > +function check_trace_instance {
> > +    output=3D$(tail -n9 /proc/dynamic_debug/control | grep ": Opened t=
race instances" \
> > +         | xargs -n1 | grep $1)
> > +    if [ "$output" !=3D $1 ] && [ $3 -gt 0 ]; then
> > +        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not open=
ed"
> > +        exit
> > +    fi
> > +    if [ "$output" =3D=3D $1 ] && [ $3 -le 0 ]; then
> > +        echo -e "${RED}: $BASH_SOURCE:$2 trace instance $1 is not clos=
ed"
> > +        exit
> > +    fi
> > +}
> > +
> > +function is_trace_instance_opened {
> > +    check_trace_instance $1 $BASH_LINENO 1
> > +}
> > +
> > +function is_trace_instance_closed {
> > +    check_trace_instance $1 $BASH_LINENO 0
> > +}
> > +
> > +# $1 - trace instance directory to delete
> > +# $2 - if > 0 then directory is expected to be deleted successfully, i=
f <=3D 0 then otherwise
> > +function del_trace_instance_dir() {
> > +    exp_exit_code=3D1
> > +    [ $2 -gt 0 ] && exp_exit_code=3D0
> > +    output=3D$((rmdir /sys/kernel/debug/tracing/instances/$1) 2>&1)
> > +    exit_code=3D$?
> > +    error_msg=3D$(echo $output | cut -d ":" -f 3 | sed -e 's/^[[:space=
:]]*//')
> > +    handle_exit_code $BASH_LINENO $FUNCNAME $exit_code $exp_exit_code
> > +}
> > +
> > +function error_log_ref {
> > +    # to show what I got
> > +    : echo "# error-log-ref: $1"
> > +    : echo cat \$2
> > +}
> > +
> > +function ifrmmod {
> > +    lsmod | grep $1 2>&1>/dev/null && rmmod $1
> > +}
> > +
> > +# $1 - text to search for
> > +function search_trace() {
> > +    search_trace_name 0 1 $1
> > +}
> > +
> > +# $1 - trace instance name, 0 for global event trace
> > +# $2 - line number counting from the bottom
> > +# $3 - text to search for
> > +function search_trace_name() {
> > +     if [ "$1" =3D "0" ]; then
> > +         buf=3D$(cat /sys/kernel/debug/tracing/trace)
> > +         line=3D$(tail -$2 /sys/kernel/debug/tracing/trace | head -1 |=
 sed -e 's/^[[:space:]]*//')
> > +     else
> > +         buf=3D$(cat /sys/kernel/debug/tracing/instances/$1/trace)
> > +         line=3D$(tail -$2 /sys/kernel/debug/tracing/instances/$1/trac=
e | head -1 | \
> > +                sed -e 's/^[[:space:]]*//')
> > +     fi
> > +     if [ $2 =3D 0 ]; then
> > +         # whole-buf check
> > +         output=3D$(echo $buf | grep "$3")
> > +     else
> > +         output=3D$(echo $line | grep "$3")
> > +     fi
> > +     if [ "$output" =3D "" ]; then
> > +            echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO search for '$3'=
 failed \
> > +                 in line '$line' or '$buf'"
> > +         exit
> > +     fi
> > +     if [ $V =3D 1 ]; then
> > +         echo -e "${MAGENTA}: search_trace_name in $1 found: \n$output=
 \nin:${BLUE} $buf ${NC}"
> > +        fi
> > +}
> > +
> > +# $1 - error message to check
> > +function check_err_msg() {
> > +    if [ "$error_msg" !=3D "$1" ]; then
> > +        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO error message '$err=
or_msg' \
> > +             does not match with '$1'"
> > +        exit
> > +    fi
> > +}
> > +
> > +function basic_tests {
> > +    echo -e "${GREEN}# BASIC_TESTS ${NC}"
> > +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > +     echo "SKIP"
> > +     return
> > +    fi
> > +    ddcmd =3D_ # zero everything
> > +    check_match_ct =3Dp 0
> > +
> > +    # module params are builtin to handle boot args
> > +    check_match_ct '\[params\]' 4 -r
> > +    ddcmd module params +mpf
> > +    check_match_ct =3Dpmf 4
> > +
> > +    # multi-cmd input, newline separated, with embedded comments
> > +    cat <<"EOF" > /proc/dynamic_debug/control
> > +      module params =3D_                               # clear params
> > +      module params +mf                              # set flags
> > +      module params func parse_args +sl              # other flags
> > +EOF
> > +    check_match_ct =3Dmf 3
> > +    check_match_ct =3Dmfsl 1
> > +    ddcmd =3D_
> > +}
> > +
> > +tests_list=3D(
> > +    basic_tests
> > +)
> > +
> > +# Run tests
> > +
> > +ifrmmod test_dynamic_debug_submod
> > +ifrmmod test_dynamic_debug
> > +
> > +for test in "${tests_list[@]}"
> > +do
> > +    $test
> > +    echo ""
> > +done
> > +echo -en "${GREEN}# Done on: "
> > +date
> > +echo -en "${NC}"
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
