Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84FDE09A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 23:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34247893C9;
	Sun, 20 Oct 2019 21:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F096898CC
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 21:07:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B831720E2; Sun, 20 Oct 2019 21:07:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 20 Oct 2019 21:07:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@doridian.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-xWtj1IMAQ5@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0678547745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0678547745==
Content-Type: multipart/alternative; boundary="15716056462.aafaFD6A.7142"
Content-Transfer-Encoding: 7bit


--15716056462.aafaFD6A.7142
Date: Sun, 20 Oct 2019 21:07:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #115 from Mark Dietzer <freedesktop@doridian.net> ---
For me it seems to happen commonly when I watch 60fps video (YouTube) using
Firefox on my RX 5700 XT (currently on Fedora 31 with latest distro package=
s).
Even 4K video at 30fps does not seem to cause any issues.

I have not yet managed to reproduce the hang in gaming or benchmark use (no
matter if OpenGL or Vulkan)

The first time this happened today it was accompanied by the following kern=
el
messages and led to a full lockup of graphics until reboot:
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0x36, response 0xfffffffb, param=
 0x0
amdgpu: [powerplay] Failed to send message 0x36, response 0xfffffffb param =
0x0
amdgpu: [powerplay] [smu_v11_0_get_power_limit] get PPT limit failed!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D202333, emitted seq=3D202336
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process  pi=
d 0
thread  pid 0

The second time, it was only a short (few seconds) hang and yielded the
following kernel output, currently still up and running after that message:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716056462.aafaFD6A.7142
Date: Sun, 20 Oct 2019 21:07:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c115">Comm=
ent # 115</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;doridian.net" title=3D"Mark Dietzer &lt;freedesktop&#64;dor=
idian.net&gt;"> <span class=3D"fn">Mark Dietzer</span></a>
</span></b>
        <pre>For me it seems to happen commonly when I watch 60fps video (Y=
ouTube) using
Firefox on my RX 5700 XT (currently on Fedora 31 with latest distro package=
s).
Even 4K video at 30fps does not seem to cause any issues.

I have not yet managed to reproduce the hang in gaming or benchmark use (no
matter if OpenGL or Vulkan)

The first time this happened today it was accompanied by the following kern=
el
messages and led to a full lockup of graphics until reboot:
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
amdgpu: [powerplay] Failed to send message 0x36, response 0xfffffffb, param=
 0x0
amdgpu: [powerplay] Failed to send message 0x36, response 0xfffffffb param =
0x0
amdgpu: [powerplay] [smu_v11_0_get_power_limit] get PPT limit failed!
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb, param =
0x80
amdgpu: [powerplay] Failed to send message 0xe, response 0xfffffffb param 0=
x80
amdgpu: [powerplay] Failed to export SMU metrics table!
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D202333, emitted seq=3D202336
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process  pi=
d 0
thread  pid 0

The second time, it was only a short (few seconds) hang and yielded the
following kernel output, currently still up and running after that message:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716056462.aafaFD6A.7142--

--===============0678547745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0678547745==--
