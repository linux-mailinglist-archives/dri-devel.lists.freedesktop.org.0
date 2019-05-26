Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFF2AC9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 01:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CB8897FD;
	Sun, 26 May 2019 23:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C458897FD
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 23:19:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 593F472167; Sun, 26 May 2019 23:19:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109022] ring gfx timeout during particular shader generation on
 yuzu emulator
Date: Sun, 26 May 2019 23:19:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: felix.adrianto@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109022-502-UZdoiwifAe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109022-502@http.bugs.freedesktop.org/>
References: <bug-109022-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1152803981=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1152803981==
Content-Type: multipart/alternative; boundary="15589127591.7fc6.25182"
Content-Transfer-Encoding: 7bit


--15589127591.7fc6.25182
Date: Sun, 26 May 2019 23:19:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109022

--- Comment #14 from e88z4 <felix.adrianto@gmail.com> ---
I tried to reproduce this bug again with latest mesa master (659aa3dd651). =
My
kernel is 5.1.3 and yuzu-canary #2318. The behaviour of the softlock is
slightly changed. Yuzu didn't crash anymore but rendering was super slow. I=
 was
able to kill the application without using SSH. The following error was
produced from dmesg.

[ 5179.131132] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5183.739102] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5189.883024] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5193.979037] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5204.218939] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5214.458837] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5224.698730] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5229.818653] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5234.938622] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5234.938680] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5241.850516] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5245.178534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5251.322426] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5255.418427] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589127591.7fc6.25182
Date: Sun, 26 May 2019 23:19:19 +0000
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
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022">bug 10902=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
felix.adrianto&#64;gmail.com" title=3D"e88z4 &lt;felix.adrianto&#64;gmail.c=
om&gt;"> <span class=3D"fn">e88z4</span></a>
</span></b>
        <pre>I tried to reproduce this bug again with latest mesa master (6=
59aa3dd651). My
kernel is 5.1.3 and yuzu-canary #2318. The behaviour of the softlock is
slightly changed. Yuzu didn't crash anymore but rendering was super slow. I=
 was
able to kill the application without using SSH. The following error was
produced from dmesg.

[ 5179.131132] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5183.739102] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5189.883024] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5193.979037] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5204.218939] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5214.458837] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5224.698730] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5229.818653] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5234.938622] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5234.938680] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5241.850516] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5245.178534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 5251.322426] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5255.418427] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589127591.7fc6.25182--

--===============1152803981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1152803981==--
