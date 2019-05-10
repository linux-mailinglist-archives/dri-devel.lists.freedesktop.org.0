Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B219C91
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 13:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF64C89B46;
	Fri, 10 May 2019 11:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3B3189BA5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 11:28:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E0DF77215A; Fri, 10 May 2019 11:28:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110248] IGT Meson build fails when "-Dbuild_tests=false" option
 is used
Date: Fri, 10 May 2019 11:28:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110248-502-PAtFwTPv9Y@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110248-502@http.bugs.freedesktop.org/>
References: <bug-110248-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1827920507=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1827920507==
Content-Type: multipart/alternative; boundary="15574877222.5c0a0Ada.30325"
Content-Transfer-Encoding: 7bit


--15574877222.5c0a0Ada.30325
Date: Fri, 10 May 2019 11:28:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110248

--- Comment #2 from Eero Tamminen <eero.t.tamminen@intel.com> ---
Thanks, I can verify that the Meson doesn't anymore fail.

However, it doesn't seem to disable all tests:
----------------------------------------------------------------
$ grep tests intel-gpu-tools_build.log
Message: Build tests: No
[3/328] Compiling C object
'lib/tests/lib@tests@@igt_can_fail_simple@exe/igt_can_fail_simple.c.o'.
[4/328] Compiling C object
'lib/tests/lib@tests@@igt_timeout@exe/igt_timeout.c.o'.
[5/328] Compiling C object
'lib/tests/lib@tests@@igt_can_fail@exe/igt_can_fail.c.o'.
[6/328] Compiling C object
'lib/tests/lib@tests@@igt_no_subtest@exe/igt_no_subtest.c.o'.
[7/328] Compiling C object
'lib/tests/lib@tests@@igt_simple_test_subtests@exe/igt_simple_test_subtests=
.c.o'.
[8/328] Compiling C object
'lib/tests/lib@tests@@igt_list_only@exe/igt_list_only.c.o'.
[10/328] Compiling C object
'lib/tests/lib@tests@@igt_fork_helper@exe/igt_fork_helper.c.o'.
[11/328] Compiling C object
'lib/tests/lib@tests@@igt_invalid_subtest_name@exe/igt_invalid_subtest_name=
.c.o'.
[12/328] Compiling C object
'lib/tests/lib@tests@@igt_segfault@exe/igt_segfault.c.o'.
[15/328] Compiling C object
'lib/tests/lib@tests@@igt_no_exit@exe/igt_no_exit.c.o'.
[17/328] Compiling C object 'lib/tests/lib@tests@@igt_fork@exe/igt_fork.c.o=
'.
[18/328] Compiling C object
'lib/tests/lib@tests@@igt_subtest_group@exe/igt_subtest_group.c.o'.
[22/328] Compiling C object
'lib/tests/lib@tests@@igt_exit_handler@exe/igt_exit_handler.c.o'.
[23/328] Compiling C object
'lib/tests/lib@tests@@igt_simulation@exe/igt_simulation.c.o'.
[30/328] Compiling C object
'lib/tests/lib@tests@@igt_hdmi_inject@exe/igt_hdmi_inject.c.o'.
[37/328] Compiling C object 'lib/tests/lib@tests@@igt_stats@exe/igt_stats.c=
.o'.
[45/328] Compiling C object
'lib/tests/lib@tests@@igt_assert@exe/igt_assert.c.o'.
----------------------------------------------------------------

Are these built on purpose even with tests building disabled?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574877222.5c0a0Ada.30325
Date: Fri, 10 May 2019 11:28:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - IGT Meson build fails when &quot;-Dbuild_tests=
=3Dfalse&quot; option is used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110248#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - IGT Meson build fails when &quot;-Dbuild_tests=
=3Dfalse&quot; option is used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110248">bug 11024=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eero.t.tamminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#=
64;intel.com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span></b>
        <pre>Thanks, I can verify that the Meson doesn't anymore fail.

However, it doesn't seem to disable all tests:
----------------------------------------------------------------
$ grep tests intel-gpu-tools_build.log
Message: Build tests: No
[3/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_can_fail_simple&#64;exe/igt_can_fail_=
simple.c.o'.
[4/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_timeout&#64;exe/igt_timeout.c.o'.
[5/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_can_fail&#64;exe/igt_can_fail.c.o'.
[6/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_no_subtest&#64;exe/igt_no_subtest.c.o=
'.
[7/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_simple_test_subtests&#64;exe/igt_simp=
le_test_subtests.c.o'.
[8/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_list_only&#64;exe/igt_list_only.c.o'.
[10/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_fork_helper&#64;exe/igt_fork_helper.c=
.o'.
[11/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_invalid_subtest_name&#64;exe/igt_inva=
lid_subtest_name.c.o'.
[12/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_segfault&#64;exe/igt_segfault.c.o'.
[15/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_no_exit&#64;exe/igt_no_exit.c.o'.
[17/328] Compiling C object 'lib/tests/lib&#64;tests&#64;&#64;igt_fork&#64;=
exe/igt_fork.c.o'.
[18/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_subtest_group&#64;exe/igt_subtest_gro=
up.c.o'.
[22/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_exit_handler&#64;exe/igt_exit_handler=
.c.o'.
[23/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_simulation&#64;exe/igt_simulation.c.o=
'.
[30/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_hdmi_inject&#64;exe/igt_hdmi_inject.c=
.o'.
[37/328] Compiling C object 'lib/tests/lib&#64;tests&#64;&#64;igt_stats&#64=
;exe/igt_stats.c.o'.
[45/328] Compiling C object
'lib/tests/lib&#64;tests&#64;&#64;igt_assert&#64;exe/igt_assert.c.o'.
----------------------------------------------------------------

Are these built on purpose even with tests building disabled?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574877222.5c0a0Ada.30325--

--===============1827920507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1827920507==--
