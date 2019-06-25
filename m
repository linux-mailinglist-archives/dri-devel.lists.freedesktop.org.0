Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50C54E7B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 14:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4460A6E0EB;
	Tue, 25 Jun 2019 12:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 210DE6E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 12:12:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1D4A372167; Tue, 25 Jun 2019 12:12:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Tue, 25 Jun 2019 12:12:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: etienne_lorrain@yahoo.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-iLEoHD60VR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0332250287=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0332250287==
Content-Type: multipart/alternative; boundary="15614647301.cb9Efeeec.2317"
Content-Transfer-Encoding: 7bit


--15614647301.cb9Efeeec.2317
Date: Tue, 25 Jun 2019 12:12:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #25 from Etienne Lorrain <etienne_lorrain@yahoo.fr> ---
(In reply to Etienne Lorrain from comment #24)
> The script (attached to this bug) to install latest AMD drivers on ubuntu
> 19.04 for a RX590 on a Ryzen threadripper works for me, but leads to a
> Segmentation fault at address 0x0 of /usr/lib/xorg/Xorg seen in
> .local/share/xorg/Xorg.0.log
>=20
> Solution for me was to:
> sudo mv /usr/share/X11/xorg.conf.d/10-amdgpu.conf
> /usr/share/X11/xorg.conf.d/10-amdgpu.conf.bak
> sudo mv /usr/share/X11/xorg.conf.d/00-amdgpu.conf
> /usr/share/X11/xorg.conf.d/00-amdgpu.conf.bak
> as proposed by axlc in https://community.amd.com/thread/227165
> Then I had to reboot the PC, no more "loop login".

A shorter solution is to comment out (by adding # as first char) the line:
ModulePath "/opt/amdgpu/lib/xorg/modules"
in 00-amdgpu.conf and rename both files as their original names.

Maybe to use /usr/lib/xorg/modules/libglamoregl.so instead of
/opt/amdgpu/lib/xorg/modules/libglamoregl.so, different files with same nam=
es.
Or to use /usr/lib/xorg/modules/drivers/amdgpu_drv.so instead of
/opt/amdgpu/lib/xorg/modules/drivers/amdgpu_drv.so, different files with sa=
me
names.
There is only two real files in /opt/amdgpu/lib/xorg/modules/.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614647301.cb9Efeeec.2317
Date: Tue, 25 Jun 2019 12:12:10 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
etienne_lorrain&#64;yahoo.fr" title=3D"Etienne Lorrain &lt;etienne_lorrain&=
#64;yahoo.fr&gt;"> <span class=3D"fn">Etienne Lorrain</span></a>
</span></b>
        <pre>(In reply to Etienne Lorrain from <a href=3D"show_bug.cgi?id=
=3D110795#c24">comment #24</a>)
<span class=3D"quote">&gt; The script (attached to this bug) to install lat=
est AMD drivers on ubuntu
&gt; 19.04 for a RX590 on a Ryzen threadripper works for me, but leads to a
&gt; Segmentation fault at address 0x0 of /usr/lib/xorg/Xorg seen in
&gt; .local/share/xorg/Xorg.0.log
&gt;=20
&gt; Solution for me was to:
&gt; sudo mv /usr/share/X11/xorg.conf.d/10-amdgpu.conf
&gt; /usr/share/X11/xorg.conf.d/10-amdgpu.conf.bak
&gt; sudo mv /usr/share/X11/xorg.conf.d/00-amdgpu.conf
&gt; /usr/share/X11/xorg.conf.d/00-amdgpu.conf.bak
&gt; as proposed by axlc in <a href=3D"https://community.amd.com/thread/227=
165">https://community.amd.com/thread/227165</a>
&gt; Then I had to reboot the PC, no more &quot;loop login&quot;.</span >

A shorter solution is to comment out (by adding # as first char) the line:
ModulePath &quot;/opt/amdgpu/lib/xorg/modules&quot;
in 00-amdgpu.conf and rename both files as their original names.

Maybe to use /usr/lib/xorg/modules/libglamoregl.so instead of
/opt/amdgpu/lib/xorg/modules/libglamoregl.so, different files with same nam=
es.
Or to use /usr/lib/xorg/modules/drivers/amdgpu_drv.so instead of
/opt/amdgpu/lib/xorg/modules/drivers/amdgpu_drv.so, different files with sa=
me
names.
There is only two real files in /opt/amdgpu/lib/xorg/modules/.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614647301.cb9Efeeec.2317--

--===============0332250287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0332250287==--
