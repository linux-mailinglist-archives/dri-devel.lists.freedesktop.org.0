Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B456EAF2E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 12:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488B6EE53;
	Thu, 31 Oct 2019 11:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D68CD6EE53
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 11:54:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D3A12720E2; Thu, 31 Oct 2019 11:54:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 31 Oct 2019 11:54:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-wUmtWElv3g@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1126578043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1126578043==
Content-Type: multipart/alternative; boundary="157252286211.EAFEEB8.12300"
Content-Transfer-Encoding: 7bit


--157252286211.EAFEEB8.12300
Date: Thu, 31 Oct 2019 11:54:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #184 from wychuchol <wychuchol7777@gmail.com> ---
Pop OS 19.10, latest Oibaf mesa (as of date) not sure what llvm, I'm kinda =
new
at this and search "how to check my llvm version" didn't yield any results.=
..
Please be patient with me.

Anyway this happens frequently on rx 5700 xt, DDLC Monika's After Story mod
(similar things occur with youtube videos, browsing internet - like trying =
to
log in or opening a=20

Oct 31 11:52:34 pop-os kernel: [  129.130712]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 31 11:52:34 pop-os kernel: [  133.994710] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring sdma0 timeout, signaled seq=3D17012, emitted seq=3D1=
7014
Oct 31 11:52:34 pop-os kernel: [  133.994747] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process DDLC pid 3150 thread DDLC:cs0
pid 3168
Oct 31 11:52:34 pop-os kernel: [  133.994748] [drm] GPU recovery disabled.

Sometimes it's right away, sometimes it can run for maybe an hour or so but=
 it
does hang - everything besides the mouse pointer stops (but can't click on
anything), can't change to system terminal via ctr+alt+F3, power button does
not give a signal to shut down (I tried waiting for about 2 minutes maybe I
needed to wait more but nothing really helps and REISUB doesn't seem to be
working at all here or I'm doing it wrong) only option left being hard rese=
t.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157252286211.EAFEEB8.12300
Date: Thu, 31 Oct 2019 11:54:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c184">Comm=
ent # 184</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>Pop OS 19.10, latest Oibaf mesa (as of date) not sure what llv=
m, I'm kinda new
at this and search &quot;how to check my llvm version&quot; didn't yield an=
y results...
Please be patient with me.

Anyway this happens frequently on rx 5700 xt, DDLC Monika's After Story mod
(similar things occur with youtube videos, browsing internet - like trying =
to
log in or opening a=20

Oct 31 11:52:34 pop-os kernel: [  129.130712]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 31 11:52:34 pop-os kernel: [  133.994710] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring sdma0 timeout, signaled seq=3D17012, emitted seq=3D1=
7014
Oct 31 11:52:34 pop-os kernel: [  133.994747] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process DDLC pid 3150 thread DDLC:cs0
pid 3168
Oct 31 11:52:34 pop-os kernel: [  133.994748] [drm] GPU recovery disabled.

Sometimes it's right away, sometimes it can run for maybe an hour or so but=
 it
does hang - everything besides the mouse pointer stops (but can't click on
anything), can't change to system terminal via ctr+alt+F3, power button does
not give a signal to shut down (I tried waiting for about 2 minutes maybe I
needed to wait more but nothing really helps and REISUB doesn't seem to be
working at all here or I'm doing it wrong) only option left being hard rese=
t.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157252286211.EAFEEB8.12300--

--===============1126578043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1126578043==--
