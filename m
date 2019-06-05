Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED9365F8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 22:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B524895E1;
	Wed,  5 Jun 2019 20:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EA74896C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 20:50:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8B47172167; Wed,  5 Jun 2019 20:50:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Wed, 05 Jun 2019 20:50:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-AsfVmNpeoi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1271762817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1271762817==
Content-Type: multipart/alternative; boundary="15597678093.6499.17524"
Content-Transfer-Encoding: 7bit


--15597678093.6499.17524
Date: Wed, 5 Jun 2019 20:50:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #39 from Richard Thier <u9vata@gmail.com> ---
First I went on to strace a bit and measure directly...

10 sec glxgears - lastfast 17.x:

- 2105 ioctl calls
- 6 DRM_IOCTL_RADEON_GEM_CREATE
- 7 DRM_IOCTL_GEM_CLOSE

10 sec glxgears - patched 19.x:

- 2916 ioctl calls
- 712 DRM_IOCTL_RADEON_GEM_CREATE
- 713 DRM_IOCTL_GEM_CLOSE

In comparison this is the unpatched 19.x originally (10 sec):

-> 12466 (any) ioctl calls
-> 3111 DRM_IOCTL_RADEON_GEM_CREATE
-> 3112 DRM_IOCTL_GEM_CLOSE

Surely it is already an order of magnitude better now, but maybe still not =
as
best as it should be. As I told you, when bisecting there was a point I saw
this happening and it was hinting there are two issues - but one is much
smaller.

glxgears however runs roughly the same FPS now. Maybe things start to slow =
down
if I run out of CPU power as glxgears don't run out now - neither tuxracer,=
 but
will try heavy things like mount&blade: warband... it was working well befo=
re..

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597678093.6499.17524
Date: Wed, 5 Jun 2019 20:50:09 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>First I went on to strace a bit and measure directly...

10 sec glxgears - lastfast 17.x:

- 2105 ioctl calls
- 6 DRM_IOCTL_RADEON_GEM_CREATE
- 7 DRM_IOCTL_GEM_CLOSE

10 sec glxgears - patched 19.x:

- 2916 ioctl calls
- 712 DRM_IOCTL_RADEON_GEM_CREATE
- 713 DRM_IOCTL_GEM_CLOSE

In comparison this is the unpatched 19.x originally (10 sec):

-&gt; 12466 (any) ioctl calls
-&gt; 3111 DRM_IOCTL_RADEON_GEM_CREATE
-&gt; 3112 DRM_IOCTL_GEM_CLOSE

Surely it is already an order of magnitude better now, but maybe still not =
as
best as it should be. As I told you, when bisecting there was a point I saw
this happening and it was hinting there are two issues - but one is much
smaller.

glxgears however runs roughly the same FPS now. Maybe things start to slow =
down
if I run out of CPU power as glxgears don't run out now - neither tuxracer,=
 but
will try heavy things like mount&amp;blade: warband... it was working well =
before..</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597678093.6499.17524--

--===============1271762817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1271762817==--
