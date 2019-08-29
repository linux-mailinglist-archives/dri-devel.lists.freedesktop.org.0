Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81600A28B3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 23:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B45A6E21C;
	Thu, 29 Aug 2019 21:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5ACE56E21F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 21:16:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 57ECE72161; Thu, 29 Aug 2019 21:16:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Thu, 29 Aug 2019 21:16:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111414-502-mr9AVW5ycY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111414-502@http.bugs.freedesktop.org/>
References: <bug-111414-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0168545522=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0168545522==
Content-Type: multipart/alternative; boundary="15671133833.6E05.4707"
Content-Transfer-Encoding: 7bit


--15671133833.6E05.4707
Date: Thu, 29 Aug 2019 21:16:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

--- Comment #7 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
@Marek

This one could be CLOSED.
Your commit SOLVED it.

My reported 'mpv' bug is compilation related.

mpv: ../src/gallium/state_trackers/vdpau/vdpau_private.h:138:
FormatYCBCRToPipe: Assertion `0' failed.

openSUSE Tumbleweed's Mesa 19.1.5 fine (release ?!).

Mesa git with LLVM 10.0.0, gcc 9.1.1

meson ../ --strip --buildtype release ... is fine, too.

But

meson ../ --strip --buildtype debugoptimized ... is brocken, now.

Worked for ages, before.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671133833.6E05.4707
Date: Thu, 29 Aug 2019 21:16:23 +0000
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
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">bug 11141=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>&#64;Marek

This one could be CLOSED.
Your commit SOLVED it.

My reported 'mpv' bug is compilation related.

mpv: ../src/gallium/state_trackers/vdpau/vdpau_private.h:138:
FormatYCBCRToPipe: Assertion `0' failed.

openSUSE Tumbleweed's Mesa 19.1.5 fine (release ?!).

Mesa git with LLVM 10.0.0, gcc 9.1.1

meson ../ --strip --buildtype release ... is fine, too.

But

meson ../ --strip --buildtype debugoptimized ... is brocken, now.

Worked for ages, before.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671133833.6E05.4707--

--===============0168545522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0168545522==--
