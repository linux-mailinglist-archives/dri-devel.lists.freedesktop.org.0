Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB616397
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 14:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2CD6E7CE;
	Tue,  7 May 2019 12:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C88AC6E7C8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 12:19:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C54F77215A; Tue,  7 May 2019 12:19:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105819] Window system hang due to GPU Fault
Date: Tue, 07 May 2019 12:19:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwb@420blaze.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105819-502-HnQGGLiFN7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105819-502@http.bugs.freedesktop.org/>
References: <bug-105819-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0578574886=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0578574886==
Content-Type: multipart/alternative; boundary="15572315903.A3f4d.26835"
Content-Transfer-Encoding: 7bit


--15572315903.A3f4d.26835
Date: Tue, 7 May 2019 12:19:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105819

--- Comment #12 from xom <cwb@420blaze.it> ---
Only solution to this problem I have found is to downgrade to LTS 4.14 kern=
el.
GPU has never had any issues in windows.=20=20

Linux abyss 4.14.116-1-lts414 #1 SMP Tue May 7 01:33:27 MDT 2019 x86_64
GNU/Linux

xom[~]$ glxinfo | grep OpenGL
OpenGL vendor string: X.Org
OpenGL renderer string: Radeon RX 580 Series (POLARIS10, DRM 3.19.0,
4.14.116-1-lts414, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.3
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.3
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572315903.A3f4d.26835
Date: Tue, 7 May 2019 12:19:50 +0000
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
   title=3D"NEW - Window system hang due to GPU Fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105819#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Window system hang due to GPU Fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105819">bug 10581=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cwb&#64;420blaze.it" title=3D"xom &lt;cwb&#64;420blaze.it&gt;"> <span class=
=3D"fn">xom</span></a>
</span></b>
        <pre>Only solution to this problem I have found is to downgrade to =
LTS 4.14 kernel.
GPU has never had any issues in windows.=20=20

Linux abyss 4.14.116-1-lts414 #1 SMP Tue May 7 01:33:27 MDT 2019 x86_64
GNU/Linux

xom[~]$ glxinfo | grep OpenGL
OpenGL vendor string: X.Org
OpenGL renderer string: Radeon RX 580 Series (POLARIS10, DRM 3.19.0,
4.14.116-1-lts414, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.3
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.3
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572315903.A3f4d.26835--

--===============0578574886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0578574886==--
