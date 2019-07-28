Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CAE77FE7
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 16:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BB689C46;
	Sun, 28 Jul 2019 14:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 771FD89C46
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 14:44:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 72B1F72167; Sun, 28 Jul 2019 14:44:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] RX 560x is very slow
Date: Sun, 28 Jul 2019 14:44:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: alfabuster@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0713081705=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0713081705==
Content-Type: multipart/alternative; boundary="15643250951.610fA.15284"
Content-Transfer-Encoding: 7bit


--15643250951.610fA.15284
Date: Sun, 28 Jul 2019 14:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

            Bug ID: 111240
           Summary: RX 560x is very slow
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: highest
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: alfabuster@gmail.com

Created attachment 144897
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144897&action=3Dedit
Unigine_Heaven-4.0 around 27 fps

I have laptop ASUS TUF Gaming with Ubuntu 19.04, but graphics card rx 560x =
very
slow on linux system.


DRI_PRIME=3D1 glxinfo | grep OpenGL=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
OpenGL vendor string: X.Org
OpenGL renderer string: Radeon RX 560 Series (POLARIS11, DRM 3.27.0,
5.0.0-21-generic, LLVM 8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.2.0-devel (git-2f92=
360
2019-07-26 disco-oibaf-ppa)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:


glxinfo | grep OpenGL=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
OpenGL vendor string: X.Org
OpenGL renderer string: AMD RAVEN (DRM 3.27.0, 5.0.0-21-generic, LLVM 8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.2.0-devel (git-2f92=
360
2019-07-26 disco-oibaf-ppa)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:

I tried run Unigine_Heaven-4.0. I've got around 27 fps on basic preset...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643250951.610fA.15284
Date: Sun, 28 Jul 2019 14:44:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">111240</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>RX 560x is very slow
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>highest
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alfabuster&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144897=
" name=3D"attach_144897" title=3D"Unigine_Heaven-4.0 around 27 fps">attachm=
ent 144897</a> <a href=3D"attachment.cgi?id=3D144897&amp;action=3Dedit" tit=
le=3D"Unigine_Heaven-4.0 around 27 fps">[details]</a></span>
Unigine_Heaven-4.0 around 27 fps

I have laptop ASUS TUF Gaming with Ubuntu 19.04, but graphics card rx 560x =
very
slow on linux system.


DRI_PRIME=3D1 glxinfo | grep OpenGL=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
OpenGL vendor string: X.Org
OpenGL renderer string: Radeon RX 560 Series (POLARIS11, DRM 3.27.0,
5.0.0-21-generic, LLVM 8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.2.0-devel (git-2f92=
360
2019-07-26 disco-oibaf-ppa)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:


glxinfo | grep OpenGL=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
OpenGL vendor string: X.Org
OpenGL renderer string: AMD RAVEN (DRM 3.27.0, 5.0.0-21-generic, LLVM 8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.2.0-devel
(git-2f92360 2019-07-26 disco-oibaf-ppa)
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.2.0-devel (git-2f92=
360
2019-07-26 disco-oibaf-ppa)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:

I tried run Unigine_Heaven-4.0. I've got around 27 fps on basic preset...</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643250951.610fA.15284--

--===============0713081705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0713081705==--
