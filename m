Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F79C501
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 19:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE146E116;
	Sun, 25 Aug 2019 17:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFFAD6E116
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 17:10:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B841572161; Sun, 25 Aug 2019 17:10:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 25 Aug 2019 17:10:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-s9DLdQwJzv@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0057116856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0057116856==
Content-Type: multipart/alternative; boundary="15667530510.bDfE7367.4482"
Content-Transfer-Encoding: 7bit


--15667530510.bDfE7367.4482
Date: Sun, 25 Aug 2019 17:10:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #1 from Marko Popovic <popovic.marko@protonmail.com> ---
Adding error log from Manjaro:
avg 23 16:05:37 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D1742, emitted seq=3D1743
avg 23 16:05:37 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 975 thread gnome-shell:cs0 pid=
 988
avg 23 16:05:37 Marko-PC kernel: [drm] GPU recovery disabled.

Pretty much same-type error happens in different situations and very often =
at
random while using the desktop. These 2 logs one is from launching an OpenGL
from Citra emulator which is reproducable every time and the second one from
Manjaro is while browsing the Gnome shell and it would crash without any cl=
ear
triggers.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667530510.bDfE7367.4482
Date: Sun, 25 Aug 2019 17:10:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>Adding error log from Manjaro:
avg 23 16:05:37 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D1742, emitted seq=3D1743
avg 23 16:05:37 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 975 thread gnome-shell:cs0 pid=
 988
avg 23 16:05:37 Marko-PC kernel: [drm] GPU recovery disabled.

Pretty much same-type error happens in different situations and very often =
at
random while using the desktop. These 2 logs one is from launching an OpenGL
from Citra emulator which is reproducable every time and the second one from
Manjaro is while browsing the Gnome shell and it would crash without any cl=
ear
triggers.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667530510.bDfE7367.4482--

--===============0057116856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0057116856==--
