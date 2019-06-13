Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC743410
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F00897DC;
	Thu, 13 Jun 2019 08:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0D23897E4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:23:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ADF9A72167; Thu, 13 Jun 2019 08:23:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110907] Xorg 1.19.6 segfaults at address 0x6d with mesa 19.1
Date: Thu, 13 Jun 2019 08:23:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110907-502-xuXdZUZ0FO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110907-502@http.bugs.freedesktop.org/>
References: <bug-110907-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1928958093=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1928958093==
Content-Type: multipart/alternative; boundary="15604141882.c43F1FA0A.18898"
Content-Transfer-Encoding: 7bit


--15604141882.c43F1FA0A.18898
Date: Thu, 13 Jun 2019 08:23:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110907

--- Comment #1 from Michel D=C3=A4nzer <michel@daenzer.net> ---
[     4.187] (EE) 3: /opt/mesa-latest/x86_64/radeonsi_dri.so
(0x7f5f52ac0000+0x1b9335) [0x7f5f52c79335]
[     4.187] (EE) 4: /usr/lib/x86_64-linux-gnu/dri/radeonsi_dri.so
(0x7f5f4528c000+0x264dce) [0x7f5f454f0dce]

Looks like there's a mix between radeonsi_dri.so from Ubuntu packages and f=
rom
AMD release packages. IIIRC this could happen when the former were upgraded
after the latter were installed. Try re-installing the latter.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604141882.c43F1FA0A.18898
Date: Thu, 13 Jun 2019 08:23:08 +0000
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
   title=3D"NEW - Xorg 1.19.6 segfaults at address 0x6d with mesa 19.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110907#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg 1.19.6 segfaults at address 0x6d with mesa 19.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110907">bug 11090=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>[     4.187] (EE) 3: /opt/mesa-latest/x86_64/radeonsi_dri.so
(0x7f5f52ac0000+0x1b9335) [0x7f5f52c79335]
[     4.187] (EE) 4: /usr/lib/x86_64-linux-gnu/dri/radeonsi_dri.so
(0x7f5f4528c000+0x264dce) [0x7f5f454f0dce]

Looks like there's a mix between radeonsi_dri.so from Ubuntu packages and f=
rom
AMD release packages. IIIRC this could happen when the former were upgraded
after the latter were installed. Try re-installing the latter.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604141882.c43F1FA0A.18898--

--===============1928958093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1928958093==--
