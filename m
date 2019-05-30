Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC52E9ED
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 02:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD16E218;
	Thu, 30 May 2019 00:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B90706E218
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 00:59:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B1D0572167; Thu, 30 May 2019 00:59:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Thu, 30 May 2019 00:59:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: rolf@lagrangepoint.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-jTBNl8TILH@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0808405794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0808405794==
Content-Type: multipart/alternative; boundary="15591779630.66dB1f42.5888"
Content-Transfer-Encoding: 7bit


--15591779630.66dB1f42.5888
Date: Thu, 30 May 2019 00:59:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #3 from Rolf <rolf@lagrangepoint.io> ---
If anyone else finds themselves in this fix by installing this driver, the =
only
way to get apt-get working again is to forcefully remove all of the files
using:

sudo dpkg --force-all -P [package name]

Here is the list of miss-installed packages:


The following packages have unmet dependencies:
 amdgpu-dkms : Depends: amdgpu-core but it is not going to be installed
 amdgpu-lib : Depends: amdgpu-core (=3D 19.10-785425) but it is not going t=
o be
installed
 glamor-amdgpu : Depends: amdgpu-core but it is not going to be installed
 gst-omx-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libdrm-amdgpu-common : Depends: amdgpu-core but it is not going to be
installed
 libdrm2-amdgpu:i386 : Depends: amdgpu-core:i386
 libdrm2-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libegl1-amdgpu-mesa:i386 : Depends: amdgpu-core:i386
 libegl1-amdgpu-mesa : Depends: amdgpu-core but it is not going to be insta=
lled
 libgbm1-amdgpu:i386 : Depends: amdgpu-core:i386
 libgbm1-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libgl1-amdgpu-mesa-dri:i386 : Depends: amdgpu-core:i386
                               Recommends: libtxc-dxtn-s2tc0:i386 but it is=
 not
installable or
                                           libtxc-dxtn0:i386 but it is not
installable
 libgl1-amdgpu-mesa-dri : Depends: amdgpu-core but it is not going to be
installed
                          Recommends: libtxc-dxtn-s2tc0 but it is not
installable or
                                      libtxc-dxtn0 but it is not installable
 libglapi-amdgpu-mesa:i386 : Depends: amdgpu-core:i386
 libglapi-amdgpu-mesa : Depends: amdgpu-core but it is not going to be
installed
 libllvm7.1-amdgpu:i386 : Depends: amdgpu-core:i386
 libllvm7.1-amdgpu : Depends: amdgpu-core but it is not going to be install=
ed
 libwayland-amdgpu-client0:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-client0 : Depends: amdgpu-core but it is not going to be
installed
 libwayland-amdgpu-egl1:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-egl1 : Depends: amdgpu-core but it is not going to be
installed
 libwayland-amdgpu-server0:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-server0 : Depends: amdgpu-core but it is not going to be
installed
 mesa-amdgpu-va-drivers:i386 : Depends: amdgpu-core:i386
 mesa-amdgpu-va-drivers : Depends: amdgpu-core but it is not going to be
installed
 mesa-amdgpu-vdpau-drivers:i386 : Depends: amdgpu-core:i386
 mesa-amdgpu-vdpau-drivers : Depends: amdgpu-core but it is not going to be
installed
 xserver-xorg-amdgpu-video-amdgpu : Depends: amdgpu-core but it is not goin=
g to
be installed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591779630.66dB1f42.5888
Date: Thu, 30 May 2019 00:59:23 +0000
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
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rolf&#64;lagrangepoint.io" title=3D"Rolf &lt;rolf&#64;lagrangepoint.io&gt;"=
> <span class=3D"fn">Rolf</span></a>
</span></b>
        <pre>If anyone else finds themselves in this fix by installing this=
 driver, the only
way to get apt-get working again is to forcefully remove all of the files
using:

sudo dpkg --force-all -P [package name]

Here is the list of miss-installed packages:


The following packages have unmet dependencies:
 amdgpu-dkms : Depends: amdgpu-core but it is not going to be installed
 amdgpu-lib : Depends: amdgpu-core (=3D 19.10-785425) but it is not going t=
o be
installed
 glamor-amdgpu : Depends: amdgpu-core but it is not going to be installed
 gst-omx-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libdrm-amdgpu-common : Depends: amdgpu-core but it is not going to be
installed
 libdrm2-amdgpu:i386 : Depends: amdgpu-core:i386
 libdrm2-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libegl1-amdgpu-mesa:i386 : Depends: amdgpu-core:i386
 libegl1-amdgpu-mesa : Depends: amdgpu-core but it is not going to be insta=
lled
 libgbm1-amdgpu:i386 : Depends: amdgpu-core:i386
 libgbm1-amdgpu : Depends: amdgpu-core but it is not going to be installed
 libgl1-amdgpu-mesa-dri:i386 : Depends: amdgpu-core:i386
                               Recommends: libtxc-dxtn-s2tc0:i386 but it is=
 not
installable or
                                           libtxc-dxtn0:i386 but it is not
installable
 libgl1-amdgpu-mesa-dri : Depends: amdgpu-core but it is not going to be
installed
                          Recommends: libtxc-dxtn-s2tc0 but it is not
installable or
                                      libtxc-dxtn0 but it is not installable
 libglapi-amdgpu-mesa:i386 : Depends: amdgpu-core:i386
 libglapi-amdgpu-mesa : Depends: amdgpu-core but it is not going to be
installed
 libllvm7.1-amdgpu:i386 : Depends: amdgpu-core:i386
 libllvm7.1-amdgpu : Depends: amdgpu-core but it is not going to be install=
ed
 libwayland-amdgpu-client0:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-client0 : Depends: amdgpu-core but it is not going to be
installed
 libwayland-amdgpu-egl1:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-egl1 : Depends: amdgpu-core but it is not going to be
installed
 libwayland-amdgpu-server0:i386 : Depends: amdgpu-core:i386
 libwayland-amdgpu-server0 : Depends: amdgpu-core but it is not going to be
installed
 mesa-amdgpu-va-drivers:i386 : Depends: amdgpu-core:i386
 mesa-amdgpu-va-drivers : Depends: amdgpu-core but it is not going to be
installed
 mesa-amdgpu-vdpau-drivers:i386 : Depends: amdgpu-core:i386
 mesa-amdgpu-vdpau-drivers : Depends: amdgpu-core but it is not going to be
installed
 xserver-xorg-amdgpu-video-amdgpu : Depends: amdgpu-core but it is not goin=
g to
be installed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591779630.66dB1f42.5888--

--===============0808405794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0808405794==--
