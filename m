Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF0F54AE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 20:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E86FA6D;
	Fri,  8 Nov 2019 19:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9085C6FA6A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 19:55:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8D276720E2; Fri,  8 Nov 2019 19:55:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108965] [CI][BAT] igt@amdgpu_amd_basic@userptr - dmesg-warn -
 general protection fault: 0000 [#1] PREEMPT SMP PTI
Date: Fri, 08 Nov 2019 19:55:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harish.chegondi@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108965-502-xJ2ZpwxSWN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108965-502@http.bugs.freedesktop.org/>
References: <bug-108965-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1541122083=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1541122083==
Content-Type: multipart/alternative; boundary="15732429351.f083bDC.24240"
Content-Transfer-Encoding: 7bit


--15732429351.f083bDC.24240
Date: Fri, 8 Nov 2019 19:55:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108965

--- Comment #3 from harish.chegondi@intel.com ---
There are two issues associated with this bug:

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7252/fi-kbl-8809g/igt@amdgp=
u_amd_basic@semaphore.html

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7252/fi-kbl-8809g/igt@amdgp=
u_amd_basic@userptr.html

While the CI buglog indicates that the last failure happened almost 5 months
ago and there have been 1517 covered runs since the last failure, the userp=
tr
test (link mentioned above) has been failing consistently but with a differ=
ent
failure signature (probably the reason why the issue filter is not catching
it?)

The userptr test has been failing recently with "No such device" error with=
 the
signature below.

(amd_basic:3914) CRITICAL: Test assertion failure function amdgpu_userptr_t=
est,
file ../tests/amdgpu/amd_basic.c:1335:
(amd_basic:3914) CRITICAL: Failed assertion: r =3D=3D 0
(amd_basic:3914) CRITICAL: Last errno: 19, No such device
(amd_basic:3914) CRITICAL: error: -19 !=3D 0
(amd_basic:3914) igt_core-INFO: Stack trace:
(amd_basic:3914) igt_core-INFO:   #0 ../lib/igt_core.c:1716 __igt_fail_asse=
rt()
(amd_basic:3914) igt_core-INFO:   #1 ../tests/amdgpu/amd_basic.c:1324
__real_main1383()
(amd_basic:3914) igt_core-INFO:   #2 [main+0x30]

On the other hand the semaphore test has been consistently passing in the
recent runs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732429351.f083bDC.24240
Date: Fri, 8 Nov 2019 19:55:35 +0000
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
   title=3D"NEW - [CI][BAT] igt&#64;amdgpu_amd_basic&#64;userptr - dmesg-wa=
rn - general protection fault: 0000 [#1] PREEMPT SMP PTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108965#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT] igt&#64;amdgpu_amd_basic&#64;userptr - dmesg-wa=
rn - general protection fault: 0000 [#1] PREEMPT SMP PTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108965">bug 10896=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
harish.chegondi&#64;intel.com" title=3D"harish.chegondi&#64;intel.com">hari=
sh.chegondi&#64;intel.com</a>
</span></b>
        <pre>There are two issues associated with this bug:

<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7252/fi-kbl-8809=
g/igt&#64;amdgpu_amd_basic&#64;semaphore.html">https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_7252/fi-kbl-8809g/igt&#64;amdgpu_amd_basic&#64;semaphor=
e.html</a>

<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7252/fi-kbl-8809=
g/igt&#64;amdgpu_amd_basic&#64;userptr.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_7252/fi-kbl-8809g/igt&#64;amdgpu_amd_basic&#64;userptr.ht=
ml</a>

While the CI buglog indicates that the last failure happened almost 5 months
ago and there have been 1517 covered runs since the last failure, the userp=
tr
test (link mentioned above) has been failing consistently but with a differ=
ent
failure signature (probably the reason why the issue filter is not catching
it?)

The userptr test has been failing recently with &quot;No such device&quot; =
error with the
signature below.

(amd_basic:3914) CRITICAL: Test assertion failure function amdgpu_userptr_t=
est,
file ../tests/amdgpu/amd_basic.c:1335:
(amd_basic:3914) CRITICAL: Failed assertion: r =3D=3D 0
(amd_basic:3914) CRITICAL: Last errno: 19, No such device
(amd_basic:3914) CRITICAL: error: -19 !=3D 0
(amd_basic:3914) igt_core-INFO: Stack trace:
(amd_basic:3914) igt_core-INFO:   #0 ../lib/igt_core.c:1716 __igt_fail_asse=
rt()
(amd_basic:3914) igt_core-INFO:   #1 ../tests/amdgpu/amd_basic.c:1324
__real_main1383()
(amd_basic:3914) igt_core-INFO:   #2 [main+0x30]

On the other hand the semaphore test has been consistently passing in the
recent runs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732429351.f083bDC.24240--

--===============1541122083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1541122083==--
