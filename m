Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CF25725
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 20:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E72892D7;
	Tue, 21 May 2019 18:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15FB3892D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 18:00:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 121B472167; Tue, 21 May 2019 18:00:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110214] radeonsi: xterm scrollback buffer disappears while
 Shift+PgUp and Shift+PgDn
Date: Tue, 21 May 2019 18:00:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: diego.viola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110214-502-DO3lvvk4Oe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110214-502@http.bugs.freedesktop.org/>
References: <bug-110214-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0752347091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0752347091==
Content-Type: multipart/alternative; boundary="15584616410.71C10FDfe.2762"
Content-Transfer-Encoding: 7bit


--15584616410.71C10FDfe.2762
Date: Tue, 21 May 2019 18:00:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110214

--- Comment #93 from Diego Viola <diego.viola@gmail.com> ---
I just tried to reproduce this issue (xterm bug) with sway today and noticed
that I can't reproduce it under sway.

The bug can still be reproduced with weston and i3.

- sway 1.0-8
- xorg-server-xwayland 1.20.4-1
- mesa 19.0.4-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584616410.71C10FDfe.2762
Date: Tue, 21 May 2019 18:00:41 +0000
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
   title=3D"NEW - radeonsi: xterm scrollback buffer disappears while Shift+=
PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214#c93">Comme=
nt # 93</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeonsi: xterm scrollback buffer disappears while Shift+=
PgUp and Shift+PgDn"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214">bug 11021=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
diego.viola&#64;gmail.com" title=3D"Diego Viola &lt;diego.viola&#64;gmail.c=
om&gt;"> <span class=3D"fn">Diego Viola</span></a>
</span></b>
        <pre>I just tried to reproduce this issue (xterm bug) with sway tod=
ay and noticed
that I can't reproduce it under sway.

The bug can still be reproduced with weston and i3.

- sway 1.0-8
- xorg-server-xwayland 1.20.4-1
- mesa 19.0.4-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584616410.71C10FDfe.2762--

--===============0752347091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0752347091==--
