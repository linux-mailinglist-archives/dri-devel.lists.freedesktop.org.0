Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C001F1282
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770716EC90;
	Wed,  6 Nov 2019 09:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57D9F6EC94
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:40:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 51640720E2; Wed,  6 Nov 2019 09:40:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 06 Nov 2019 09:40:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: smith-erc@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-ZVO7f9KFfH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1731971679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1731971679==
Content-Type: multipart/alternative; boundary="15730332395.c1a7fa.789"
Content-Transfer-Encoding: 7bit


--15730332395.c1a7fa.789
Date: Wed, 6 Nov 2019 09:40:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #211 from Marco Liedtke <smith-erc@gmx.de> ---
Hi folks,

i am new to bugreporting, but due to having a new system and this bug, i wa=
nt
to contribute something to this situation.

I have almost the same behavior as stated in comment 1.

My Xorg freezes every session no matter what i do. I could only get the last
dmesg befor i had to hard reboot over ssh, cause this was the only thing
working.

2 Examples:
[ 1184.577790] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!
[ 1189.697729] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D53043, emitted seq=3D53045
[ 1189.697797] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 1398 thread Xorg:cs0 pid 1409
[ 1189.697799] [drm] GPU recovery disabled.


[ 708.286318] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!
[ 713.406528] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=3D104848, emitted seq=3D104850
[ 713.406594] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informatio=
n:
process Xorg pid 1402 thread Xorg:cs0 pid 1414
[ 713.406596] [drm] GPU recovery disabled.


I have already set AMD_DEBUG=3Dnodam in /etc/environment and in ~/.profile.
Last time i played World of Tanks via Wine and DXVK the same freeze occured,
again the same error that xorg pid timed out...

It is happenening after 1 Minute logged in or 1 hour.

My System specs are:
R7 3700x
Powercolor R5700XT Red Dragon Silent Bios enabled
Gigabyte X570 I Aourus Pro WIFI
UBUNTU 18.04.3 LTS with Kernel 5.3.8 and Padoka unstable PPA (Mesa 19.3)

I have no NVME SSD and i have no Monitoring applications running.

Tests done:

-With Kernel 4.15 standrad Ubuntu Kernel and AMDGPU-PRO installed, everythi=
ng
runs fine without a freeze.
- With Kernel 4.18 and Mesa 19.0.8 no freezes occured, kernel does not
recognize rx5700, so no amdgpu modul is loaded.

freezes occured with kernel 5.3.7 and 5.3.8 and in combination with padoka =
and
oibaf ppa (Mesa 19.3).

If i can help with further information pls guide me to dig in my system the
infos u need.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730332395.c1a7fa.789
Date: Wed, 6 Nov 2019 09:40:39 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c211">Comm=
ent # 211</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
smith-erc&#64;gmx.de" title=3D"Marco Liedtke &lt;smith-erc&#64;gmx.de&gt;">=
 <span class=3D"fn">Marco Liedtke</span></a>
</span></b>
        <pre>Hi folks,

i am new to bugreporting, but due to having a new system and this bug, i wa=
nt
to contribute something to this situation.

I have almost the same behavior as stated in <a href=3D"show_bug.cgi?id=3D1=
11481#c1">comment 1</a>.

My Xorg freezes every session no matter what i do. I could only get the last
dmesg befor i had to hard reboot over ssh, cause this was the only thing
working.

2 Examples:
[ 1184.577790] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!
[ 1189.697729] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D53043, emitted seq=3D53045
[ 1189.697797] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 1398 thread Xorg:cs0 pid 1409
[ 1189.697799] [drm] GPU recovery disabled.


[ 708.286318] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!
[ 713.406528] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=3D104848, emitted seq=3D104850
[ 713.406594] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informatio=
n:
process Xorg pid 1402 thread Xorg:cs0 pid 1414
[ 713.406596] [drm] GPU recovery disabled.


I have already set AMD_DEBUG=3Dnodam in /etc/environment and in ~/.profile.
Last time i played World of Tanks via Wine and DXVK the same freeze occured,
again the same error that xorg pid timed out...

It is happenening after 1 Minute logged in or 1 hour.

My System specs are:
R7 3700x
Powercolor R5700XT Red Dragon Silent Bios enabled
Gigabyte X570 I Aourus Pro WIFI
UBUNTU 18.04.3 LTS with Kernel 5.3.8 and Padoka unstable PPA (Mesa 19.3)

I have no NVME SSD and i have no Monitoring applications running.

Tests done:

-With Kernel 4.15 standrad Ubuntu Kernel and AMDGPU-PRO installed, everythi=
ng
runs fine without a freeze.
- With Kernel 4.18 and Mesa 19.0.8 no freezes occured, kernel does not
recognize rx5700, so no amdgpu modul is loaded.

freezes occured with kernel 5.3.7 and 5.3.8 and in combination with padoka =
and
oibaf ppa (Mesa 19.3).

If i can help with further information pls guide me to dig in my system the
infos u need.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730332395.c1a7fa.789--

--===============1731971679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1731971679==--
