Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5790A98
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 23:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27236E3B0;
	Fri, 16 Aug 2019 21:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C2576E3B0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 21:58:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4402C7215A; Fri, 16 Aug 2019 21:58:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111412] 4k 60hz unavailable RX 560 over HDMI
Date: Fri, 16 Aug 2019 21:58:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@azelphur.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111412-502-4r7o4iefQJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111412-502@http.bugs.freedesktop.org/>
References: <bug-111412-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1649533673=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1649533673==
Content-Type: multipart/alternative; boundary="15659927240.c1e9E4C.23267"
Content-Transfer-Encoding: 7bit


--15659927240.c1e9E4C.23267
Date: Fri, 16 Aug 2019 21:58:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111412

--- Comment #2 from Alfie Day <freedesktop@azelphur.com> ---
trek00 from IRC found this bug report:
https://bugs.freedesktop.org/show_bug.cgi?id=3D104412#c14

which mentions running these commands, which seems to work and enable 4k60 =
over
HDMI.

xrandr --newmode "mymode" 594  3840 4016 4104 4400  2160 2168 2178 2250 +hs=
ync
+vsync
xrandr --addmode HDMI-A-0 mymode
xrandr --output HDMI-A-0 --mode mymode

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659927240.c1e9E4C.23267
Date: Fri, 16 Aug 2019 21:58:44 +0000
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
   title=3D"NEW - 4k 60hz unavailable RX 560 over HDMI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111412#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4k 60hz unavailable RX 560 over HDMI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111412">bug 11141=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;azelphur.com" title=3D"Alfie Day &lt;freedesktop&#64;azelph=
ur.com&gt;"> <span class=3D"fn">Alfie Day</span></a>
</span></b>
        <pre>trek00 from IRC found this bug report:
<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - RX 460 HDMI 4k 60fps not working, DisplayPort =
is."
   href=3D"show_bug.cgi?id=3D104412#c14">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D104412#c14</a>

which mentions running these commands, which seems to work and enable 4k60 =
over
HDMI.

xrandr --newmode &quot;mymode&quot; 594  3840 4016 4104 4400  2160 2168 217=
8 2250 +hsync
+vsync
xrandr --addmode HDMI-A-0 mymode
xrandr --output HDMI-A-0 --mode mymode</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659927240.c1e9E4C.23267--

--===============1649533673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1649533673==--
