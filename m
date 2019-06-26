Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1655DD4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 03:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE36E201;
	Wed, 26 Jun 2019 01:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 161E76E201
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:39:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 131A672167; Wed, 26 Jun 2019 01:39:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Wed, 26 Jun 2019 01:39:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: marschall@gmail.com
X-Bugzilla-Status: VERIFIED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-110795-502-Hzmjr0oYwL@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1053696578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1053696578==
Content-Type: multipart/alternative; boundary="15615131540.E96C.13353"
Content-Transfer-Encoding: 7bit


--15615131540.E96C.13353
Date: Wed, 26 Jun 2019 01:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

Felipe Marschall <marschall@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|INVALID                     |WORKSFORME
             Status|RESOLVED                    |VERIFIED

--- Comment #26 from Felipe Marschall <marschall@gmail.com> ---
(In reply to Rolf from comment #3)
> If anyone else finds themselves in this fix by installing this driver, the
> only way to get apt-get working again is to forcefully remove all of the
> files using:
>=20
> sudo dpkg --force-all -P [package name]
>=20
> Here is the list of miss-installed packages:
>=20
>=20
> The following packages have unmet dependencies:
>  amdgpu-dkms : Depends: amdgpu-core but it is not going to be installed
>  amdgpu-lib : Depends: amdgpu-core (=3D 19.10-785425) but it is not going=
 to
> be installed
>  ...

It happened to me now...
I managed to fix it by booting into recovery, enabling network and then
running:

dpkg --remove --force-remove-reinstreq amdgpu amdgpu-core amdgpu-dkms
amdgpu-lib glamor-amdgpu gst-omx-amdgpu libdrm-amdgpu-amdgpu1
libdrm-amdgpu-common libdrm2-amdgpu  libegl1-amdgpu-mesa
libegl1-amdgpu-mesa-drivers libgbm1-amdgpu libgl1-amdgpu-mesa-dri
libgl1-amdgpu-mesa-glx libglapi-amdgpu-mesa  libgles1-amdgpu-mesa
libgles2-amdgpu-mesa libllvm7.1-amdgpu libomxil-bellagio-bin libomxil-bella=
gio0
libosmesa6-amdgpu  libwayland-amdgpu-client0 libwayland-amdgpu-egl1
libwayland-amdgpu-server0 libxatracker2-amdgpu mesa-amdgpu-omx-drivers=20
mesa-amdgpu-va-drivers mesa-amdgpu-vdpau-drivers
xserver-xorg-amdgpu-video-amdgpu

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15615131540.E96C.13353
Date: Wed, 26 Jun 2019 01:39:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:marschall=
&#64;gmail.com" title=3D"Felipe Marschall &lt;marschall&#64;gmail.com&gt;">=
 <span class=3D"fn">Felipe Marschall</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_VERIFIED  bz_closed"
   title=3D"VERIFIED WORKSFORME - Unable to install on latest Ubuntu (19.04=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>WORKSFORME
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>VERIFIED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_VERIFIED  bz_closed"
   title=3D"VERIFIED WORKSFORME - Unable to install on latest Ubuntu (19.04=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_VERIFIED  bz_closed"
   title=3D"VERIFIED WORKSFORME - Unable to install on latest Ubuntu (19.04=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
marschall&#64;gmail.com" title=3D"Felipe Marschall &lt;marschall&#64;gmail.=
com&gt;"> <span class=3D"fn">Felipe Marschall</span></a>
</span></b>
        <pre>(In reply to Rolf from <a href=3D"show_bug.cgi?id=3D110795#c3"=
>comment #3</a>)
<span class=3D"quote">&gt; If anyone else finds themselves in this fix by i=
nstalling this driver, the
&gt; only way to get apt-get working again is to forcefully remove all of t=
he
&gt; files using:
&gt;=20
&gt; sudo dpkg --force-all -P [package name]
&gt;=20
&gt; Here is the list of miss-installed packages:
&gt;=20
&gt;=20
&gt; The following packages have unmet dependencies:
&gt;  amdgpu-dkms : Depends: amdgpu-core but it is not going to be installed
&gt;  amdgpu-lib : Depends: amdgpu-core (=3D 19.10-785425) but it is not go=
ing to
&gt; be installed
&gt;  ...</span >

It happened to me now...
I managed to fix it by booting into recovery, enabling network and then
running:

dpkg --remove --force-remove-reinstreq amdgpu amdgpu-core amdgpu-dkms
amdgpu-lib glamor-amdgpu gst-omx-amdgpu libdrm-amdgpu-amdgpu1
libdrm-amdgpu-common libdrm2-amdgpu  libegl1-amdgpu-mesa
libegl1-amdgpu-mesa-drivers libgbm1-amdgpu libgl1-amdgpu-mesa-dri
libgl1-amdgpu-mesa-glx libglapi-amdgpu-mesa  libgles1-amdgpu-mesa
libgles2-amdgpu-mesa libllvm7.1-amdgpu libomxil-bellagio-bin libomxil-bella=
gio0
libosmesa6-amdgpu  libwayland-amdgpu-client0 libwayland-amdgpu-egl1
libwayland-amdgpu-server0 libxatracker2-amdgpu mesa-amdgpu-omx-drivers=20
mesa-amdgpu-va-drivers mesa-amdgpu-vdpau-drivers
xserver-xorg-amdgpu-video-amdgpu</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15615131540.E96C.13353--

--===============1053696578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1053696578==--
