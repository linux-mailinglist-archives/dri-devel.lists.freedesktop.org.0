Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7D13E3F
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 09:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3728957D;
	Sun,  5 May 2019 07:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1425D8957D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 07:49:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B4DB7215A; Sun,  5 May 2019 07:49:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110214] radeonsi: xterm scrollback buffer disappears while
 Shift+PgUp and Shift+PgDn
Date: Sun, 05 May 2019 07:49:56 +0000
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
Message-ID: <bug-110214-502-5qBh4GvD4a@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1179434245=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1179434245==
Content-Type: multipart/alternative; boundary="15570425950.1C28BAfE.25987"
Content-Transfer-Encoding: 7bit


--15570425950.1C28BAfE.25987
Date: Sun, 5 May 2019 07:49:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110214

--- Comment #88 from Diego Viola <diego.viola@gmail.com> ---
(In reply to komqinxit from comment #87)
> Another similar bug.
> xfce4-terminal leaves a large black area at the bottom when it renders
> 'dmesg' or 'cat /etc/passwd'.
>=20
> AMD Ryzen 3 2200G.
> Arch Linux.
> Mesa 19.0.3-1

I can reproduce this, it happens for me with xfce4-terminal and also
gnome-terminal and most other VTE-based terminals.

I also noticed that setting R600_DEBUG=3Dnodpbb and
MESA_EXTENSION_OVERRIDE=3D"-GL_NV_texture_barrier" does not seem to help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570425950.1C28BAfE.25987
Date: Sun, 5 May 2019 07:49:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110214#c88">Comme=
nt # 88</a>
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
        <pre>(In reply to komqinxit from <a href=3D"show_bug.cgi?id=3D11021=
4#c87">comment #87</a>)
<span class=3D"quote">&gt; Another similar bug.
&gt; xfce4-terminal leaves a large black area at the bottom when it renders
&gt; 'dmesg' or 'cat /etc/passwd'.
&gt;=20
&gt; AMD Ryzen 3 2200G.
&gt; Arch Linux.
&gt; Mesa 19.0.3-1</span >

I can reproduce this, it happens for me with xfce4-terminal and also
gnome-terminal and most other VTE-based terminals.

I also noticed that setting R600_DEBUG=3Dnodpbb and
MESA_EXTENSION_OVERRIDE=3D&quot;-GL_NV_texture_barrier&quot; does not seem =
to help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570425950.1C28BAfE.25987--

--===============1179434245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1179434245==--
