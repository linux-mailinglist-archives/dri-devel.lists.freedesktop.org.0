Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5CF2AE00
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 07:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EEE89395;
	Mon, 27 May 2019 05:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E189781
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 05:28:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6835A72167; Mon, 27 May 2019 05:28:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109022] ring gfx timeout during particular shader generation on
 yuzu emulator
Date: Mon, 27 May 2019 05:28:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: glencoesmith@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109022-502-NgK2Wvk0z8@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0925918407=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0925918407==
Content-Type: multipart/alternative; boundary="15589349372.F8cabCae.17904"
Content-Transfer-Encoding: 7bit


--15589349372.F8cabCae.17904
Date: Mon, 27 May 2019 05:28:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109022

--- Comment #18 from glencoesmith@hotmail.com ---
(In reply to e88z4 from comment #14)
> I tried to reproduce this bug again with latest mesa master (659aa3dd651).
> My kernel is 5.1.3 and yuzu-canary #2318. The behaviour of the softlock is
> slightly changed. Yuzu didn't crash anymore but rendering was super slow.=
 I
> was able to kill the application without using SSH. The following error w=
as
> produced from dmesg.
>=20
> [ 5179.131132] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5183.739102] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5189.883024] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5193.979037] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5204.218939] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5214.458837] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5224.698730] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5229.818653] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5234.938622] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5234.938680] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5241.850516] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5245.178534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered
> [ 5251.322426] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting
> for fences timed out.
> [ 5255.418427] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> but soft recovered



Yay, progress

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589349372.F8cabCae.17904
Date: Mon, 27 May 2019 05:28:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022">bug 10902=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
glencoesmith&#64;hotmail.com" title=3D"glencoesmith&#64;hotmail.com">glenco=
esmith&#64;hotmail.com</a>
</span></b>
        <pre>(In reply to e88z4 from <a href=3D"show_bug.cgi?id=3D109022#c1=
4">comment #14</a>)
<span class=3D"quote">&gt; I tried to reproduce this bug again with latest =
mesa master (659aa3dd651).
&gt; My kernel is 5.1.3 and yuzu-canary #2318. The behaviour of the softloc=
k is
&gt; slightly changed. Yuzu didn't crash anymore but rendering was super sl=
ow. I
&gt; was able to kill the application without using SSH. The following erro=
r was
&gt; produced from dmesg.
&gt;=20
&gt; [ 5179.131132] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5183.739102] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5189.883024] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5193.979037] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5204.218939] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5214.458837] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5224.698730] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5229.818653] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5234.938622] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5234.938680] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5241.850516] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5245.178534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered
&gt; [ 5251.322426] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Wai=
ting
&gt; for fences timed out.
&gt; [ 5255.418427] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; but soft recovered</span >



Yay, progress</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589349372.F8cabCae.17904--

--===============0925918407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0925918407==--
