Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2DE9C5EF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 21:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA308989F;
	Sun, 25 Aug 2019 19:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2BE489AC3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 19:49:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 161BA7215A; Sun, 25 Aug 2019 19:49:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109534] Crash in Minecraft due to a swp[chan] assertion fail in
 src/gallium/drivers/r600/sb/sb_ir.cpp
 alu_packed_node::update_packed_items
Date: Sun, 25 Aug 2019 19:49:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vanyasmart@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109534-502-9EOHnHBmUw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109534-502@http.bugs.freedesktop.org/>
References: <bug-109534-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0403240209=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0403240209==
Content-Type: multipart/alternative; boundary="15667625791.ac0AB5F.558"
Content-Transfer-Encoding: 7bit


--15667625791.ac0AB5F.558
Date: Sun, 25 Aug 2019 19:49:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109534

--- Comment #6 from vanyasmart@gmail.com ---
I've again faced with this issue on Ubuntu 18.04 with Mesa 19.1.4 from
x-swat-ppa.

After some digging I've found that current problem may not be related to Me=
sa,
but may be related to JVM (like in #33175, which has similar symptoms, but
different exception).

So I've tried to run Minecraft on latest Oracle JRE, and it seems like the
problem has gone.

Also, I think that problem may be not in OpenJRE code, but in the way how
OpenJRE package built, because, as I said, everything worked for me on Open=
SUSE
Tumbleweed / Mesa 19.0 / OpenJRE 11, while on Ubuntu 18.04 / Mesa 19.1.4 /
OpenJRE 11 doesn't.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667625791.ac0AB5F.558
Date: Sun, 25 Aug 2019 19:49:39 +0000
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
   title=3D"NEW - Crash in Minecraft due to a swp[chan] assertion fail in s=
rc/gallium/drivers/r600/sb/sb_ir.cpp alu_packed_node::update_packed_items"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109534#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in Minecraft due to a swp[chan] assertion fail in s=
rc/gallium/drivers/r600/sb/sb_ir.cpp alu_packed_node::update_packed_items"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109534">bug 10953=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vanyasmart&#64;gmail.com" title=3D"vanyasmart&#64;gmail.com">vanyasmart&#64=
;gmail.com</a>
</span></b>
        <pre>I've again faced with this issue on Ubuntu 18.04 with Mesa 19.=
1.4 from
x-swat-ppa.

After some digging I've found that current problem may not be related to Me=
sa,
but may be related to JVM (like in #33175, which has similar symptoms, but
different exception).

So I've tried to run Minecraft on latest Oracle JRE, and it seems like the
problem has gone.

Also, I think that problem may be not in OpenJRE code, but in the way how
OpenJRE package built, because, as I said, everything worked for me on Open=
SUSE
Tumbleweed / Mesa 19.0 / OpenJRE 11, while on Ubuntu 18.04 / Mesa 19.1.4 /
OpenJRE 11 doesn't.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667625791.ac0AB5F.558--

--===============0403240209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0403240209==--
