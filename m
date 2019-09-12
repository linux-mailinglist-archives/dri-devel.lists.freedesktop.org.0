Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D9B0D1B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886976ECBB;
	Thu, 12 Sep 2019 10:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AA646ECBD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:43:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 21B3772167; Thu, 12 Sep 2019 10:43:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111667] gem_render_copy failing on CCS subtests
Date: Thu, 12 Sep 2019 10:43:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mika.kahola@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111667-502-sGmIhTox6B@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111667-502@http.bugs.freedesktop.org/>
References: <bug-111667-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2137761546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2137761546==
Content-Type: multipart/alternative; boundary="15682849850.c1C6AB.25474"
Content-Transfer-Encoding: 7bit


--15682849850.c1C6AB.25474
Date: Thu, 12 Sep 2019 10:43:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111667

--- Comment #1 from Mika Kahola <mika.kahola@intel.com> ---
Test results show as=20
./tests/gem_render_copy
IGT-Version: 1.24-g07f67caf (x86_64) (Linux: 5.3.0-rc8-CI-CI_DIS_719+ x86_6=
4)
Starting subtest: linear
Subtest linear: SUCCESS (0,255s)
Starting subtest: x-tiled
Subtest x-tiled: SUCCESS (0,251s)
Starting subtest: y-tiled
Subtest y-tiled: SUCCESS (0,252s)
Starting subtest: yf-tiled
Subtest yf-tiled: SUCCESS (0,237s)
Starting subtest: y-tiled-ccs-to-linear
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest y-tiled-ccs-to-linear failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-linear: FAIL (41,146s)
Starting subtest: y-tiled-ccs-to-x-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest y-tiled-ccs-to-x-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-x-tiled: FAIL (46,971s)
Starting subtest: y-tiled-ccs-to-y-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest y-tiled-ccs-to-y-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-y-tiled: FAIL (47,999s)
Starting subtest: y-tiled-ccs-to-yf-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest y-tiled-ccs-to-yf-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-yf-tiled: FAIL (47,992s)
Starting subtest: yf-tiled-ccs-to-linear
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest yf-tiled-ccs-to-linear failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-linear: FAIL (49,025s)
Starting subtest: yf-tiled-ccs-to-x-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest yf-tiled-ccs-to-x-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-x-tiled: FAIL (47,999s)
Starting subtest: yf-tiled-ccs-to-y-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest yf-tiled-ccs-to-y-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-y-tiled: FAIL (47,998s)
Starting subtest: yf-tiled-ccs-to-yf-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [<unknown>+0xb946f500]
Subtest yf-tiled-ccs-to-yf-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data->devi=
d)
>=3D 9
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [<unknown>+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-yf-tiled: FAIL (47,992s)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682849850.c1C6AB.25474
Date: Thu, 12 Sep 2019 10:43:05 +0000
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
          bz_status_NEW "
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667">bug 11166=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mika.kahola&#64;intel.com" title=3D"Mika Kahola &lt;mika.kahola&#64;intel.c=
om&gt;"> <span class=3D"fn">Mika Kahola</span></a>
</span></b>
        <pre>Test results show as=20
./tests/gem_render_copy
IGT-Version: 1.24-g07f67caf (x86_64) (Linux: 5.3.0-rc8-CI-CI_DIS_719+ x86_6=
4)
Starting subtest: linear
Subtest linear: SUCCESS (0,255s)
Starting subtest: x-tiled
Subtest x-tiled: SUCCESS (0,251s)
Starting subtest: y-tiled
Subtest y-tiled: SUCCESS (0,252s)
Starting subtest: yf-tiled
Subtest yf-tiled: SUCCESS (0,237s)
Starting subtest: y-tiled-ccs-to-linear
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest y-tiled-ccs-to-linear failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-linear: FAIL (41,146s)
Starting subtest: y-tiled-ccs-to-x-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest y-tiled-ccs-to-x-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-x-tiled: FAIL (46,971s)
Starting subtest: y-tiled-ccs-to-y-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest y-tiled-ccs-to-y-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-y-tiled: FAIL (47,999s)
Starting subtest: y-tiled-ccs-to-yf-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest y-tiled-ccs-to-yf-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x1006401a at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest y-tiled-ccs-to-yf-tiled: FAIL (47,992s)
Starting subtest: yf-tiled-ccs-to-linear
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest yf-tiled-ccs-to-linear failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-linear: FAIL (49,025s)
Starting subtest: yf-tiled-ccs-to-x-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest yf-tiled-ccs-to-x-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-x-tiled: FAIL (47,999s)
Starting subtest: yf-tiled-ccs-to-y-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest yf-tiled-ccs-to-y-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-y-tiled: FAIL (47,998s)
Starting subtest: yf-tiled-ccs-to-yf-tiled
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
Stack trace:
  #0 ../lib/igt_core.c:1674 __igt_fail_assert()
  #1 ../tests/i915/gem_render_copy.c:479 scratch_buf_check()
  #2 [&lt;unknown&gt;+0xb946f500]
Subtest yf-tiled-ccs-to-yf-tiled failed.
**** DEBUG ****
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) DEBUG: Test requirement passed: intel_gen(data-&gt;d=
evid)
<span class=3D"quote">&gt;=3D 9</span >
(gem_render_copy:4311) CRITICAL: Test assertion failure function
scratch_buf_check, file ../tests/i915/gem_render_copy.c:491:
(gem_render_copy:4311) CRITICAL: Failed assertion: buf_val =3D=3D ref_val
(gem_render_copy:4311) CRITICAL: Expected 0xff449bbb, found 0x00000000 at
(10,10)
(gem_render_copy:4311) igt_core-INFO: Stack trace:
(gem_render_copy:4311) igt_core-INFO:   #0 ../lib/igt_core.c:1674
__igt_fail_assert()
(gem_render_copy:4311) igt_core-INFO:   #1 ../tests/i915/gem_render_copy.c:=
479
scratch_buf_check()
(gem_render_copy:4311) igt_core-INFO:   #2 [&lt;unknown&gt;+0xb946f500]
****  END  ****
Subtest yf-tiled-ccs-to-yf-tiled: FAIL (47,992s)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682849850.c1C6AB.25474--

--===============2137761546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2137761546==--
