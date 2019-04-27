Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E7B324
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 11:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FB8929F;
	Sat, 27 Apr 2019 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08F8089259
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 09:20:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 050F77215F; Sat, 27 Apr 2019 09:20:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Sat, 27 Apr 2019 09:20:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supercoolemail@seznam.cz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: version resolution bug_status
Message-ID: <bug-108893-502-0RVPoe1vPU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0515396483=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0515396483==
Content-Type: multipart/alternative; boundary="15563568581.48F589Ad3.5845"
Content-Transfer-Encoding: 7bit


--15563568581.48F589Ad3.5845
Date: Sat, 27 Apr 2019 09:20:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

supercoolemail@seznam.cz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|18.3                        |19.0
         Resolution|INVALID                     |---
             Status|RESOLVED                    |REOPENED

--- Comment #4 from supercoolemail@seznam.cz ---
Sigh, this is actually real problem. Maybe now it's different problem but
behavior is exactly the same.=20
With LIBGL_ALWAYS_SOFTWARE=3D1 redrawing is instant, otherwise moving to
different items of same menu takes 5-6 seconds and going to different menu
takes even longer.

Might be related: performance in game is very bad. I get 3-4 FPS with
LIBGL_ALWAYS_SOFTWARE=3D1 in one place and only 8 FPS without. However, whe=
n I
pin game to single core, then I get 1 FPS without LIBGL_ALWAYS_SOFTWARE=3D1=
 but
it won't even past loadscreen with it.
This is not only game that suffers from low FPS due to "fake" CPU bottlenec=
k.
The other is Sacred, which also happens to use Direct3D/DDraw, runs better =
with
LIBGL_ALWAYS_SOFTWARE=3D1 than without. Without it, I get around 5 FPS in o=
ne
city and 100 % one core usage, with it it is at least playable (Gallium HUD
does not work with LIBGL_ALWAYS_SOFTWARE=3D1, so I don't know numbers).

Hardware: Ryzen 7 1700, RX 580

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15563568581.48F589Ad3.5845
Date: Sat, 27 Apr 2019 09:20:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:supercool=
email&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">supercoolemail&=
#64;seznam.cz</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>18.3
           </td>
           <td>19.0
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
supercoolemail&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">superc=
oolemail&#64;seznam.cz</a>
</span></b>
        <pre>Sigh, this is actually real problem. Maybe now it's different =
problem but
behavior is exactly the same.=20
With LIBGL_ALWAYS_SOFTWARE=3D1 redrawing is instant, otherwise moving to
different items of same menu takes 5-6 seconds and going to different menu
takes even longer.

Might be related: performance in game is very bad. I get 3-4 FPS with
LIBGL_ALWAYS_SOFTWARE=3D1 in one place and only 8 FPS without. However, whe=
n I
pin game to single core, then I get 1 FPS without LIBGL_ALWAYS_SOFTWARE=3D1=
 but
it won't even past loadscreen with it.
This is not only game that suffers from low FPS due to &quot;fake&quot; CPU=
 bottleneck.
The other is Sacred, which also happens to use Direct3D/DDraw, runs better =
with
LIBGL_ALWAYS_SOFTWARE=3D1 than without. Without it, I get around 5 FPS in o=
ne
city and 100 % one core usage, with it it is at least playable (Gallium HUD
does not work with LIBGL_ALWAYS_SOFTWARE=3D1, so I don't know numbers).

Hardware: Ryzen 7 1700, RX 580</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15563568581.48F589Ad3.5845--

--===============0515396483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0515396483==--
