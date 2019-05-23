Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6173285E3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 20:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CB26E05F;
	Thu, 23 May 2019 18:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D465D6E063
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 18:25:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D118B72167; Thu, 23 May 2019 18:25:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110217] RX580: screen turns black or flickers until forced
 reconfiguration
Date: Thu, 23 May 2019 18:25:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: numzer0@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110217-502-FsNLgpsl0V@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110217-502@http.bugs.freedesktop.org/>
References: <bug-110217-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0242949320=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0242949320==
Content-Type: multipart/alternative; boundary="15586359233.Eb5354f.4899"
Content-Transfer-Encoding: 7bit


--15586359233.Eb5354f.4899
Date: Thu, 23 May 2019 18:25:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110217

--- Comment #3 from numzer0@yandex.ru ---
New information:

1. Screen turns black at module insertion, be it during bootup or later. But
resuming from hibernation works.

2. On the system, the converter I use is problematic itself. When I connect=
 it
to another PC, HDMI port is shown as =E2=80=9Cconnected=E2=80=9D *until* I =
connect a=C2=A0monitor to
the=C2=A0converter. Then, everything works but HDMI port is displayed as
=E2=80=9Cdisconnected=E2=80=9D in xrandr.

After updating the system, flicker seems to happen in X only, despite the
=E2=80=9CTearFree=E2=80=9D option. Virtual consoles work well, albeit use t=
he same mode (i.e.
no mode change on VT switch). Not sure was that the case earlier.

Also, after last hibernation, the old trick with resetting mode didn=E2=80=
=99t help,
flicker continues. New X instances flicker as well.=20

New kernel: Linux 5.1.2-arch1-1-ARCH
New X driver: xf86-video-amdgpu 19.0.1-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586359233.Eb5354f.4899
Date: Thu, 23 May 2019 18:25:23 +0000
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
   title=3D"NEW - RX580: screen turns black or flickers until forced reconf=
iguration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110217#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX580: screen turns black or flickers until forced reconf=
iguration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110217">bug 11021=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
numzer0&#64;yandex.ru" title=3D"numzer0&#64;yandex.ru">numzer0&#64;yandex.r=
u</a>
</span></b>
        <pre>New information:

1. Screen turns black at module insertion, be it during bootup or later. But
resuming from hibernation works.

2. On the system, the converter I use is problematic itself. When I connect=
 it
to another PC, HDMI port is shown as =E2=80=9Cconnected=E2=80=9D *until* I =
connect a=C2=A0monitor to
the=C2=A0converter. Then, everything works but HDMI port is displayed as
=E2=80=9Cdisconnected=E2=80=9D in xrandr.

After updating the system, flicker seems to happen in X only, despite the
=E2=80=9CTearFree=E2=80=9D option. Virtual consoles work well, albeit use t=
he same mode (i.e.
no mode change on VT switch). Not sure was that the case earlier.

Also, after last hibernation, the old trick with resetting mode didn=E2=80=
=99t help,
flicker continues. New X instances flicker as well.=20

New kernel: Linux 5.1.2-arch1-1-ARCH
New X driver: xf86-video-amdgpu 19.0.1-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586359233.Eb5354f.4899--

--===============0242949320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0242949320==--
