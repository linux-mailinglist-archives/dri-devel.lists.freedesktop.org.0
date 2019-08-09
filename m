Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7F86EB6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 02:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A01D6ECE2;
	Fri,  9 Aug 2019 00:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 046A56ECE2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 00:15:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 00BDC72167; Fri,  9 Aug 2019 00:15:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Fri, 09 Aug 2019 00:15:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-Tif3QIbJlK@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1971174611=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1971174611==
Content-Type: multipart/alternative; boundary="15653097321.4c1b.2228"
Content-Transfer-Encoding: 7bit


--15653097321.4c1b.2228
Date: Fri, 9 Aug 2019 00:15:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #2 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
RX 580 / NIR
amd-staging-drm-next
Mesa git
Firefox 68.0.1

[42489.228053] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[42494.348053] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[42508.171689] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!

[42513.035801] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

[42556.811021] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[42561.418927] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

[42571.658863] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653097321.4c1b.2228
Date: Fri, 9 Aug 2019 00:15:32 +0000
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
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>RX 580 / NIR
amd-staging-drm-next
Mesa git
Firefox 68.0.1

[42489.228053] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[42494.348053] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[42508.171689] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!

[42513.035801] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

[42556.811021] [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR*
Waiting for fences timed out or interrupted!=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
[42561.418927] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

[42571.658863] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
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

--15653097321.4c1b.2228--

--===============1971174611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1971174611==--
