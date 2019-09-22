Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B0BA280
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5E16E8DF;
	Sun, 22 Sep 2019 12:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B12B06E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 06:28:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AA21172162; Sun, 22 Sep 2019 06:28:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 22 Sep 2019 06:28:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jeremy.attali@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-wi9JvBQS6a@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1153267770=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1153267770==
Content-Type: multipart/alternative; boundary="15691336945.e3BF9c6a.19473"
Content-Transfer-Encoding: 7bit


--15691336945.e3BF9c6a.19473
Date: Sun, 22 Sep 2019 06:28:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #60 from Jeremy Attali <jeremy.attali@gmail.com> ---
Setting AMD_DEBUG=3Dnodma did not work for me. I have an AMD Radeon RX 5700=
 XT.
Experiencing many crashes after a few minutes playing DOOM (OpenGL).

My packages are the following:

> pacman -Q linux linux-firmware-agd5f-radeon-navi10 {,lib32-}{mesa-git,vul=
kan-radeon-git,libdrm}
linux 5.3.arch1-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-libdrm 2.4.99-1

I have an apitrace file but it's 3GB, not sure where I can upload it for
someone to investigate (if that can help let me know I'll figure something).

Error log is the same as Marko Popovic from the first comment:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled
seq=3D48914, emitted seq=3D48916
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
DOOMx64.exe pid 3123 thread DOOMx64.ex:cs0 pid 3172

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15691336945.e3BF9c6a.19473
Date: Sun, 22 Sep 2019 06:28:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c60">Comme=
nt # 60</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy.attali&#64;gmail.com" title=3D"Jeremy Attali &lt;jeremy.attali&#64;g=
mail.com&gt;"> <span class=3D"fn">Jeremy Attali</span></a>
</span></b>
        <pre>Setting AMD_DEBUG=3Dnodma did not work for me. I have an AMD R=
adeon RX 5700 XT.
Experiencing many crashes after a few minutes playing DOOM (OpenGL).

My packages are the following:

<span class=3D"quote">&gt; pacman -Q linux linux-firmware-agd5f-radeon-navi=
10 {,lib32-}{mesa-git,vulkan-radeon-git,libdrm}</span >
linux 5.3.arch1-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-libdrm 2.4.99-1

I have an apitrace file but it's 3GB, not sure where I can upload it for
someone to investigate (if that can help let me know I'll figure something).

Error log is the same as Marko Popovic from the first comment:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled
seq=3D48914, emitted seq=3D48916
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
DOOMx64.exe pid 3123 thread DOOMx64.ex:cs0 pid 3172</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15691336945.e3BF9c6a.19473--

--===============1153267770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1153267770==--
