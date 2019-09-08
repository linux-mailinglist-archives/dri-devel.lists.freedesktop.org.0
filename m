Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF8DACA50
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 04:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB6D89D81;
	Sun,  8 Sep 2019 02:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A18AF89D81
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 02:02:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9D50872161; Sun,  8 Sep 2019 02:02:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sun, 08 Sep 2019 02:02:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-qwW0lwa8Uo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0511913057=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0511913057==
Content-Type: multipart/alternative; boundary="15679081381.De34B8.28534"
Content-Transfer-Encoding: 7bit


--15679081381.De34B8.28534
Date: Sun, 8 Sep 2019 02:02:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #16 from Andrew Sheldon <asheldon55@gmail.com> ---
One possibility could be to create a custom modeline, perhaps trying refresh
rates between 30-60hz (starting with 45hz), so you can find a point where t=
he
high idle power usage kicks in. Reduced blanking modes could be useful if i=
t's
a case of bandwidth.

See: https://github.com/kevinlekiller/cvt_modeline_calculator_12

Something like this, using just xrandr (-b option indicating reduced blanki=
ng
v2 mode):

./cvt12 5120 1440 45 -b

Which yields:
Modeline "5120x1440_45.00_rb2"  344.21  5120 5128 5160 5200  1440 1457 1465
1471 +hsync -vsync

Then:
xrandr --output DisplayPort-2 --newmode "5120x1440_45.00_rb2" 344.21  5120 =
5128
5160 5200  1440 1457 1465 1471 +hsync -vsync

xrandr --output DisplayPort-2 --addmode DisplayPort-2 "5120x1440_45.00_rb2"

xrandr --output DisplayPort-2 --mode "5120x1440_45.00_rb2"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679081381.De34B8.28534
Date: Sun, 8 Sep 2019 02:02:18 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>One possibility could be to create a custom modeline, perhaps =
trying refresh
rates between 30-60hz (starting with 45hz), so you can find a point where t=
he
high idle power usage kicks in. Reduced blanking modes could be useful if i=
t's
a case of bandwidth.

See: <a href=3D"https://github.com/kevinlekiller/cvt_modeline_calculator_12=
">https://github.com/kevinlekiller/cvt_modeline_calculator_12</a>

Something like this, using just xrandr (-b option indicating reduced blanki=
ng
v2 mode):

./cvt12 5120 1440 45 -b

Which yields:
Modeline &quot;5120x1440_45.00_rb2&quot;  344.21  5120 5128 5160 5200  1440=
 1457 1465
1471 +hsync -vsync

Then:
xrandr --output DisplayPort-2 --newmode &quot;5120x1440_45.00_rb2&quot; 344=
.21  5120 5128
5160 5200  1440 1457 1465 1471 +hsync -vsync

xrandr --output DisplayPort-2 --addmode DisplayPort-2 &quot;5120x1440_45.00=
_rb2&quot;

xrandr --output DisplayPort-2 --mode &quot;5120x1440_45.00_rb2&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679081381.De34B8.28534--

--===============0511913057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0511913057==--
