Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40875420F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 11:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7D892BE;
	Wed, 12 Jun 2019 09:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8DAE892BE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:36:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A51E772167; Wed, 12 Jun 2019 09:36:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110862] Dual-monitors invalid state after turning on
Date: Wed, 12 Jun 2019 09:36:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110862-502-Q1UNns7qpX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110862-502@http.bugs.freedesktop.org/>
References: <bug-110862-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1993686176=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1993686176==
Content-Type: multipart/alternative; boundary="15603321881.a0cae0D13.30378"
Content-Transfer-Encoding: 7bit


--15603321881.a0cae0D13.30378
Date: Wed, 12 Jun 2019 09:36:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110862

Michel D=C3=A4nzer <michel@daenzer.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #8 from Michel D=C3=A4nzer <michel@daenzer.net> ---
The xrandr output is probably different in the bad case as well, isn't it?

From the bad case Xorg log file:

 [421376.800] (II) AMDGPU(0): Allocate new frame buffer 2160x738

This means Xorg calls into the driver to resize the desktop to 2160x738 (wh=
ich
explains why that area is OK, whereas the remaining area has undefined
contents). This is most likely in turn due to a client (probably some compo=
nent
of the desktop environment you're using) requesting so via the RandR extens=
ion.
So it's either a bug in that or in the X server, not in the driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603321881.a0cae0D13.30378
Date: Wed, 12 Jun 2019 09:36:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Dual-monitors invalid state after turning =
on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110862">bug 11086=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Dual-monitors invalid state after turning =
on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110862#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Dual-monitors invalid state after turning =
on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110862">bug 11086=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>The xrandr output is probably different in the bad case as wel=
l, isn't it?

From the bad case Xorg log file:

 [421376.800] (II) AMDGPU(0): Allocate new frame buffer 2160x738

This means Xorg calls into the driver to resize the desktop to 2160x738 (wh=
ich
explains why that area is OK, whereas the remaining area has undefined
contents). This is most likely in turn due to a client (probably some compo=
nent
of the desktop environment you're using) requesting so via the RandR extens=
ion.
So it's either a bug in that or in the X server, not in the driver.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603321881.a0cae0D13.30378--

--===============1993686176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1993686176==--
