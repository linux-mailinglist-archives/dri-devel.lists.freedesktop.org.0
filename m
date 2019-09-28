Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDFC1002
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 09:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71C6E0C6;
	Sat, 28 Sep 2019 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D30286E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 07:02:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CDB0A72162; Sat, 28 Sep 2019 07:02:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 28 Sep 2019 07:02:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-bTV6VLR6bP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1816098538=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1816098538==
Content-Type: multipart/alternative; boundary="15696541689.fBCc.367"
Content-Transfer-Encoding: 7bit


--15696541689.fBCc.367
Date: Sat, 28 Sep 2019 07:02:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #108 from Wilko Bartels <me@jasondaigo.de> ---
Did u try the amdgpu-pro driver as well?
i just did four runs of glmark and it just went through for me. going up to
1600mhz shader clock. tested both closed and opensource drivers. vega pulse
here.

mesa result:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2014.03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   Radeon RX Vega (VEGA10, DRM 3.33.0, 5.3.1-arch1-1-ARCH, =
LLVM
8.0.1)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.1.7
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 8617 FrameTime: 0.116 ms
[build] use-vbo=3Dtrue: FPS: 10534 FrameTime: 0.095 ms
[texture] texture-filter=3Dnearest: FPS: 11214 FrameTime: 0.089 ms
[texture] texture-filter=3Dlinear: FPS: 11274 FrameTime: 0.089 ms
[texture] texture-filter=3Dmipmap: FPS: 10197 FrameTime: 0.098 ms
[shading] shading=3Dgouraud: FPS: 9790 FrameTime: 0.102 ms
[shading] shading=3Dblinn-phong-inf: FPS: 10979 FrameTime: 0.091 ms
[shading] shading=3Dphong: FPS: 10167 FrameTime: 0.098 ms
[shading] shading=3Dcel: FPS: 9662 FrameTime: 0.103 ms
[bump] bump-render=3Dhigh-poly: FPS: 9830 FrameTime: 0.102 ms
[bump] bump-render=3Dnormals: FPS: 10151 FrameTime: 0.099 ms
[bump] bump-render=3Dheight: FPS: 10870 FrameTime: 0.092 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 12008 FrameTime: 0.083 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 10876 FrameTime: 0=
.092
ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 10232 FrameTime: 0.0=
98 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4: FPS:
6842 FrameTime: 0.146 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] effect=3Dshadow:windows=3D4: FPS: 7934 FrameTime: 0.126 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dmap:
FPS: 1770 FrameTime: 0.565 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dsubdata:
FPS: 2308 FrameTime: 0.433 ms
[buffer]
columns=3D200:interleave=3Dtrue:update-dispersion=3D0.9:update-fraction=3D0=
.5:update-method=3Dmap:
FPS: 1875 FrameTime: 0.533 ms
[ideas] speed=3Dduration: FPS: 4475 FrameTime: 0.223 ms
[jellyfish] <default>: FPS: 9499 FrameTime: 0.105 ms
[terrain] <default>: FPS: 2593 FrameTime: 0.386 ms
[shadow] <default>: FPS: 9423 FrameTime: 0.106 ms
[refract] <default>: FPS: 6008 FrameTime: 0.166 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D0: FPS: 11364 FrameTime: 0=
.088 ms
[conditionals] fragment-steps=3D5:vertex-steps=3D0: FPS: 10816 FrameTime: 0=
.092 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D5: FPS: 12000 FrameTime: 0=
.083 ms
[function] fragment-complexity=3Dlow:fragment-steps=3D5: FPS: 10932 FrameTi=
me:
0.091 ms
[function] fragment-complexity=3Dmedium:fragment-steps=3D5: FPS: 11690 Fram=
eTime:
0.086 ms
[loop] fragment-loop=3Dfalse:fragment-steps=3D5:vertex-steps=3D5: FPS: 11119
FrameTime: 0.090 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dfalse:vertex-steps=3D5: FPS: 1=
1003
FrameTime: 0.091 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dtrue:vertex-steps=3D5: FPS: 12=
886
FrameTime: 0.078 ms
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
                                  glmark2 Score: 9119=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

amdgpu-pro result:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2014.03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     ATI Technologies Inc.
    GL_RENDERER:   Radeon RX Vega
    GL_VERSION:    4.6.13572 Compatibility Profile Context
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 3727 FrameTime: 0.268 ms
[build] use-vbo=3Dtrue: FPS: 9516 FrameTime: 0.105 ms
[texture] texture-filter=3Dnearest: FPS: 7346 FrameTime: 0.136 ms
[texture] texture-filter=3Dlinear: FPS: 9236 FrameTime: 0.108 ms
[texture] texture-filter=3Dmipmap: FPS: 9161 FrameTime: 0.109 ms
[shading] shading=3Dgouraud: FPS: 9184 FrameTime: 0.109 ms
[shading] shading=3Dblinn-phong-inf: FPS: 9363 FrameTime: 0.107 ms
[shading] shading=3Dphong: FPS: 9424 FrameTime: 0.106 ms
[shading] shading=3Dcel: FPS: 9060 FrameTime: 0.110 ms
[bump] bump-render=3Dhigh-poly: FPS: 9047 FrameTime: 0.111 ms
[bump] bump-render=3Dnormals: FPS: 8804 FrameTime: 0.114 ms
[bump] bump-render=3Dheight: FPS: 9156 FrameTime: 0.109 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 9121 FrameTime: 0.110 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 8866 FrameTime: 0.=
113 ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 8286 FrameTime: 0.12=
1 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4: FPS:
3789 FrameTime: 0.264 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] effect=3Dshadow:windows=3D4: FPS: 4491 FrameTime: 0.223 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dmap:
FPS: 1026 FrameTime: 0.975 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dsubdata:
FPS: 2228 FrameTime: 0.449 ms
[buffer]
columns=3D200:interleave=3Dtrue:update-dispersion=3D0.9:update-fraction=3D0=
.5:update-method=3Dmap:
FPS: 1275 FrameTime: 0.784 ms
[ideas] speed=3Dduration: FPS: 4038 FrameTime: 0.248 ms
[jellyfish] <default>: FPS: 7342 FrameTime: 0.136 ms
[terrain] <default>: FPS: 790 FrameTime: 1.266 ms
[shadow] <default>: FPS: 6002 FrameTime: 0.167 ms
[refract] <default>: FPS: 4273 FrameTime: 0.234 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D0: FPS: 9208 FrameTime: 0.=
109 ms
[conditionals] fragment-steps=3D5:vertex-steps=3D0: FPS: 8964 FrameTime: 0.=
112 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D5: FPS: 8984 FrameTime: 0.=
111 ms
[function] fragment-complexity=3Dlow:fragment-steps=3D5: FPS: 9360 FrameTim=
e: 0.107
ms
[function] fragment-complexity=3Dmedium:fragment-steps=3D5: FPS: 9214 Frame=
Time:
0.109 ms
[loop] fragment-loop=3Dfalse:fragment-steps=3D5:vertex-steps=3D5: FPS: 8945
FrameTime: 0.112 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dfalse:vertex-steps=3D5: FPS: 9=
218
FrameTime: 0.108 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dtrue:vertex-steps=3D5: FPS: 90=
77
FrameTime: 0.110 ms
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
                                  glmark2 Score: 7197=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696541689.fBCc.367
Date: Sat, 28 Sep 2019 07:02:48 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c108">Comm=
ent # 108</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>Did u try the amdgpu-pro driver as well?
i just did four runs of glmark and it just went through for me. going up to
1600mhz shader clock. tested both closed and opensource drivers. vega pulse
here.

mesa result:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2014.03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   Radeon RX Vega (VEGA10, DRM 3.33.0, 5.3.1-arch1-1-ARCH, =
LLVM
8.0.1)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.1.7
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 8617 FrameTime: 0.116 ms
[build] use-vbo=3Dtrue: FPS: 10534 FrameTime: 0.095 ms
[texture] texture-filter=3Dnearest: FPS: 11214 FrameTime: 0.089 ms
[texture] texture-filter=3Dlinear: FPS: 11274 FrameTime: 0.089 ms
[texture] texture-filter=3Dmipmap: FPS: 10197 FrameTime: 0.098 ms
[shading] shading=3Dgouraud: FPS: 9790 FrameTime: 0.102 ms
[shading] shading=3Dblinn-phong-inf: FPS: 10979 FrameTime: 0.091 ms
[shading] shading=3Dphong: FPS: 10167 FrameTime: 0.098 ms
[shading] shading=3Dcel: FPS: 9662 FrameTime: 0.103 ms
[bump] bump-render=3Dhigh-poly: FPS: 9830 FrameTime: 0.102 ms
[bump] bump-render=3Dnormals: FPS: 10151 FrameTime: 0.099 ms
[bump] bump-render=3Dheight: FPS: 10870 FrameTime: 0.092 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 12008 FrameTime: 0.083 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 10876 FrameTime: 0=
.092
ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 10232 FrameTime: 0.0=
98 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4: FPS:
6842 FrameTime: 0.146 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] effect=3Dshadow:windows=3D4: FPS: 7934 FrameTime: 0.126 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dmap:
FPS: 1770 FrameTime: 0.565 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dsubdata:
FPS: 2308 FrameTime: 0.433 ms
[buffer]
columns=3D200:interleave=3Dtrue:update-dispersion=3D0.9:update-fraction=3D0=
.5:update-method=3Dmap:
FPS: 1875 FrameTime: 0.533 ms
[ideas] speed=3Dduration: FPS: 4475 FrameTime: 0.223 ms
[jellyfish] &lt;default&gt;: FPS: 9499 FrameTime: 0.105 ms
[terrain] &lt;default&gt;: FPS: 2593 FrameTime: 0.386 ms
[shadow] &lt;default&gt;: FPS: 9423 FrameTime: 0.106 ms
[refract] &lt;default&gt;: FPS: 6008 FrameTime: 0.166 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D0: FPS: 11364 FrameTime: 0=
.088 ms
[conditionals] fragment-steps=3D5:vertex-steps=3D0: FPS: 10816 FrameTime: 0=
.092 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D5: FPS: 12000 FrameTime: 0=
.083 ms
[function] fragment-complexity=3Dlow:fragment-steps=3D5: FPS: 10932 FrameTi=
me:
0.091 ms
[function] fragment-complexity=3Dmedium:fragment-steps=3D5: FPS: 11690 Fram=
eTime:
0.086 ms
[loop] fragment-loop=3Dfalse:fragment-steps=3D5:vertex-steps=3D5: FPS: 11119
FrameTime: 0.090 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dfalse:vertex-steps=3D5: FPS: 1=
1003
FrameTime: 0.091 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dtrue:vertex-steps=3D5: FPS: 12=
886
FrameTime: 0.078 ms
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
                                  glmark2 Score: 9119=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

amdgpu-pro result:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2014.03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     ATI Technologies Inc.
    GL_RENDERER:   Radeon RX Vega
    GL_VERSION:    4.6.13572 Compatibility Profile Context
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 3727 FrameTime: 0.268 ms
[build] use-vbo=3Dtrue: FPS: 9516 FrameTime: 0.105 ms
[texture] texture-filter=3Dnearest: FPS: 7346 FrameTime: 0.136 ms
[texture] texture-filter=3Dlinear: FPS: 9236 FrameTime: 0.108 ms
[texture] texture-filter=3Dmipmap: FPS: 9161 FrameTime: 0.109 ms
[shading] shading=3Dgouraud: FPS: 9184 FrameTime: 0.109 ms
[shading] shading=3Dblinn-phong-inf: FPS: 9363 FrameTime: 0.107 ms
[shading] shading=3Dphong: FPS: 9424 FrameTime: 0.106 ms
[shading] shading=3Dcel: FPS: 9060 FrameTime: 0.110 ms
[bump] bump-render=3Dhigh-poly: FPS: 9047 FrameTime: 0.111 ms
[bump] bump-render=3Dnormals: FPS: 8804 FrameTime: 0.114 ms
[bump] bump-render=3Dheight: FPS: 9156 FrameTime: 0.109 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 9121 FrameTime: 0.110 ms
libpng warning: iCCP: known incorrect sRGB profile
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 8866 FrameTime: 0.=
113 ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 8286 FrameTime: 0.12=
1 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4: FPS:
3789 FrameTime: 0.264 ms
libpng warning: iCCP: known incorrect sRGB profile
[desktop] effect=3Dshadow:windows=3D4: FPS: 4491 FrameTime: 0.223 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dmap:
FPS: 1026 FrameTime: 0.975 ms
[buffer]
columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fraction=3D=
0.5:update-method=3Dsubdata:
FPS: 2228 FrameTime: 0.449 ms
[buffer]
columns=3D200:interleave=3Dtrue:update-dispersion=3D0.9:update-fraction=3D0=
.5:update-method=3Dmap:
FPS: 1275 FrameTime: 0.784 ms
[ideas] speed=3Dduration: FPS: 4038 FrameTime: 0.248 ms
[jellyfish] &lt;default&gt;: FPS: 7342 FrameTime: 0.136 ms
[terrain] &lt;default&gt;: FPS: 790 FrameTime: 1.266 ms
[shadow] &lt;default&gt;: FPS: 6002 FrameTime: 0.167 ms
[refract] &lt;default&gt;: FPS: 4273 FrameTime: 0.234 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D0: FPS: 9208 FrameTime: 0.=
109 ms
[conditionals] fragment-steps=3D5:vertex-steps=3D0: FPS: 8964 FrameTime: 0.=
112 ms
[conditionals] fragment-steps=3D0:vertex-steps=3D5: FPS: 8984 FrameTime: 0.=
111 ms
[function] fragment-complexity=3Dlow:fragment-steps=3D5: FPS: 9360 FrameTim=
e: 0.107
ms
[function] fragment-complexity=3Dmedium:fragment-steps=3D5: FPS: 9214 Frame=
Time:
0.109 ms
[loop] fragment-loop=3Dfalse:fragment-steps=3D5:vertex-steps=3D5: FPS: 8945
FrameTime: 0.112 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dfalse:vertex-steps=3D5: FPS: 9=
218
FrameTime: 0.108 ms
[loop] fragment-steps=3D5:fragment-uniform=3Dtrue:vertex-steps=3D5: FPS: 90=
77
FrameTime: 0.110 ms
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
                                  glmark2 Score: 7197=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696541689.fBCc.367--

--===============1816098538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1816098538==--
