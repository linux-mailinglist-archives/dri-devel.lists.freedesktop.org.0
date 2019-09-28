Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD0C0EF3
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 02:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99E66E2E1;
	Sat, 28 Sep 2019 00:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 839666E2E1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 00:14:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7A22E72162; Sat, 28 Sep 2019 00:14:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111847] Radeon 7, no audio over hdmi 2.0 4k and accelerated
 audio over displayport in fullhd display
Date: Sat, 28 Sep 2019 00:14:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: sebastianlacuesta@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111847-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0970364197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0970364197==
Content-Type: multipart/alternative; boundary="15696296660.89bFaf.4586"
Content-Transfer-Encoding: 7bit


--15696296660.89bFaf.4586
Date: Sat, 28 Sep 2019 00:14:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111847

            Bug ID: 111847
           Summary: Radeon 7, no audio over hdmi 2.0 4k and accelerated
                    audio over displayport in fullhd display
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: sebastianlacuesta@gmail.com

When I connect a fullhd monitor over display port and a 4k tv over hdmi at
60Hz, then sound is like accelerated on monitor and completely absent on tv.
Using my soundcard, sound it's good.
Hdmi cable is 2.0. Videocard is Radeon 7. I'm using amdgpu kernel module.

Some info about packages:

$ uname -a
Linux debian 5.2.0-2-amd64 #1 SMP Debian 5.2.9-2 (2019-08-21) x86_64 GNU/Li=
nux

$ dpkg -s mesa-vulkan-drivers:amd64
Package: mesa-vulkan-drivers
Status: install ok installed
Priority: optional
Section: libs
Installed-Size: 11750
Maintainer: Debian X Strike Force <debian-x@lists.debian.org>
Architecture: amd64
Multi-Arch: same
Source: mesa
Version: 19.2.0~rc4-1
Provides: vulkan-icd
Depends: libvulkan1, libc6 (>=3D 2.29), libdrm-amdgpu1 (>=3D 2.4.97), libdr=
m2 (>=3D
2.4.89), libelf1 (>=3D 0.142), libexpat1 (>=3D 2.0.1), libgcc1 (>=3D 1:3.4)=
, libllvm9
(>=3D 1:9~svn298832-1~), libstdc++6 (>=3D 5.2), libwayland-client0 (>=3D 1.=
15.0),
libx11-xcb1, libxcb-dri3-0 (>=3D 1.13), libxcb-present0, libxcb-randr0 (>=
=3D 1.13),
libxcb-sync1, libxcb1 (>=3D 1.9.2), libxshmfence1, zlib1g (>=3D 1:1.1.4)
Description: Mesa Vulkan graphics drivers
 Vulkan is a low-overhead 3D graphics and compute API. This package
 includes Vulkan drivers provided by the Mesa project.
Homepage: https://mesa3d.org/

Feel free to ask for more info. I'm glad to help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696296660.89bFaf.4586
Date: Sat, 28 Sep 2019 00:14:26 +0000
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
   title=3D"NEW - Radeon 7, no audio over hdmi 2.0 4k and accelerated audio=
 over displayport in fullhd display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111847">111847</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Radeon 7, no audio over hdmi 2.0 4k and accelerated audio ove=
r displayport in fullhd display
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>sebastianlacuesta&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When I connect a fullhd monitor over display port and a 4k tv =
over hdmi at
60Hz, then sound is like accelerated on monitor and completely absent on tv.
Using my soundcard, sound it's good.
Hdmi cable is 2.0. Videocard is Radeon 7. I'm using amdgpu kernel module.

Some info about packages:

$ uname -a
Linux debian 5.2.0-2-amd64 #1 SMP Debian 5.2.9-2 (2019-08-21) x86_64 GNU/Li=
nux

$ dpkg -s mesa-vulkan-drivers:amd64
Package: mesa-vulkan-drivers
Status: install ok installed
Priority: optional
Section: libs
Installed-Size: 11750
Maintainer: Debian X Strike Force &lt;<a href=3D"mailto:debian-x&#64;lists.=
debian.org">debian-x&#64;lists.debian.org</a>&gt;
Architecture: amd64
Multi-Arch: same
Source: mesa
Version: 19.2.0~rc4-1
Provides: vulkan-icd
Depends: libvulkan1, libc6 (&gt;=3D 2.29), libdrm-amdgpu1 (&gt;=3D 2.4.97),=
 libdrm2 (&gt;=3D
2.4.89), libelf1 (&gt;=3D 0.142), libexpat1 (&gt;=3D 2.0.1), libgcc1 (&gt;=
=3D 1:3.4), libllvm9
(&gt;=3D 1:9~svn298832-1~), libstdc++6 (&gt;=3D 5.2), libwayland-client0 (&=
gt;=3D 1.15.0),
libx11-xcb1, libxcb-dri3-0 (&gt;=3D 1.13), libxcb-present0, libxcb-randr0 (=
&gt;=3D 1.13),
libxcb-sync1, libxcb1 (&gt;=3D 1.9.2), libxshmfence1, zlib1g (&gt;=3D 1:1.1=
.4)
Description: Mesa Vulkan graphics drivers
 Vulkan is a low-overhead 3D graphics and compute API. This package
 includes Vulkan drivers provided by the Mesa project.
Homepage: <a href=3D"https://mesa3d.org/">https://mesa3d.org/</a>

Feel free to ask for more info. I'm glad to help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696296660.89bFaf.4586--

--===============0970364197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0970364197==--
