Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D742BC53
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 01:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAB189AB5;
	Mon, 27 May 2019 23:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC90A89AB5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 23:14:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A962C72167; Mon, 27 May 2019 23:14:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109022] ring gfx timeout during particular shader generation on
 yuzu emulator
Date: Mon, 27 May 2019 23:14:14 +0000
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
Message-ID: <bug-109022-502-rYFuFqmdHs@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1716310594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1716310594==
Content-Type: multipart/alternative; boundary="15589988542.e1cB.27955"
Content-Transfer-Encoding: 7bit


--15589988542.e1cB.27955
Date: Mon, 27 May 2019 23:14:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109022

--- Comment #20 from e88z4 <felix.adrianto@gmail.com> ---
Hi Timothy,=20

I have tried your suggestion on the other bug reporting
https://bugs.freedesktop.org/show_bug.cgi?id=3D110472

You suggested to add an environment variable
allow_glsl_extension_directive_midshader=3Dtrue. This doesn't resolve the i=
ssue.=20

I also noticed that the yuzu developers followed your suggestion from your =
bug
reporting ticket https://github.com/yuzu-emu/yuzu/issues/2523
I decided to compile the latest source code with the merged code but the is=
sue
is not yet resolved. One thing that I noticed is the "ring fgx timeout" err=
or
message is no longer being produced". Instead error messages below are
reproduced continuously until I kill the application.=20


May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu:
amdgpu_cs_query_fence_status failed.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu:
amdgpu_cs_query_fence_status failed.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:25 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:25 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.

I will produce the apitrace shortly and will post it on a share location.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589988542.e1cB.27955
Date: Mon, 27 May 2019 23:14:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022#c20">Comme=
nt # 20</a>
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
        <pre>Hi Timothy,=20

I have tried your suggestion on the other bug reporting
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphical Fault (Desktop Freeze) on Specific OpenGL Appli=
cation"
   href=3D"show_bug.cgi?id=3D110472">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110472</a>

You suggested to add an environment variable
allow_glsl_extension_directive_midshader=3Dtrue. This doesn't resolve the i=
ssue.=20

I also noticed that the yuzu developers followed your suggestion from your =
bug
reporting ticket <a href=3D"https://github.com/yuzu-emu/yuzu/issues/2523">h=
ttps://github.com/yuzu-emu/yuzu/issues/2523</a>
I decided to compile the latest source code with the merged code but the is=
sue
is not yet resolved. One thing that I noticed is the &quot;ring fgx timeout=
&quot; error
message is no longer being produced&quot;. Instead error messages below are
reproduced continuously until I kill the application.=20


May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu:
amdgpu_cs_query_fence_status failed.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu:
amdgpu_cs_query_fence_status failed.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:21 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:25 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:25 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.
May 27 18:53:29 htpc org.gnome.Shell.desktop[1578]: amdgpu: The CS has been
cancelled because the context is lost.

I will produce the apitrace shortly and will post it on a share location.</=
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

--15589988542.e1cB.27955--

--===============1716310594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1716310594==--
