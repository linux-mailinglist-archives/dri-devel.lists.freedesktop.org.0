Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC686AFD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 22:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF976E8B6;
	Thu,  8 Aug 2019 20:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49A4A6E8B6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 20:00:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 417DF72167; Thu,  8 Aug 2019 20:00:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111334] amdgpu-pro-19.20-812932 fails to compile DKMS
Date: Thu, 08 Aug 2019 20:00:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gustavo.diaz@gdnet.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111334-502-UnltMeEfcz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111334-502@http.bugs.freedesktop.org/>
References: <bug-111334-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1273332693=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1273332693==
Content-Type: multipart/alternative; boundary="15652944210.DCd0F496a.32273"
Content-Transfer-Encoding: 7bit


--15652944210.DCd0F496a.32273
Date: Thu, 8 Aug 2019 20:00:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111334

--- Comment #1 from Gustavo A. D=C3=ADaz <gustavo.diaz@gdnet.com.ar> ---
Ok, fixed. The problem was that KDE neon modify the file /etc/os-release. T=
he
install script run fine since I've modified it (instead of os-releast) from:

case "$ID" in
        ubuntu|linuxmint|debian)

to:

case "$ID" in
        ubuntu|linuxmint|debian|neon)

and then I think DRM_VERSION is empty because of modified ID in os-release.

I think there must a way to support this, since KDE Neon is Ubuntu LTS base=
d.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652944210.DCd0F496a.32273
Date: Thu, 8 Aug 2019 20:00:21 +0000
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
   title=3D"NEW - amdgpu-pro-19.20-812932 fails to compile DKMS"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111334#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu-pro-19.20-812932 fails to compile DKMS"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111334">bug 11133=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gustavo.diaz&#64;gdnet.com.ar" title=3D"Gustavo A. D=C3=ADaz &lt;gustavo.di=
az&#64;gdnet.com.ar&gt;"> <span class=3D"fn">Gustavo A. D=C3=ADaz</span></a>
</span></b>
        <pre>Ok, fixed. The problem was that KDE neon modify the file /etc/=
os-release. The
install script run fine since I've modified it (instead of os-releast) from:

case &quot;$ID&quot; in
        ubuntu|linuxmint|debian)

to:

case &quot;$ID&quot; in
        ubuntu|linuxmint|debian|neon)

and then I think DRM_VERSION is empty because of modified ID in os-release.

I think there must a way to support this, since KDE Neon is Ubuntu LTS base=
d.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652944210.DCd0F496a.32273--

--===============1273332693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1273332693==--
