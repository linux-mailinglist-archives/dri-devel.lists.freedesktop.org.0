Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E91D920A6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 11:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934586E0ED;
	Mon, 19 Aug 2019 09:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAC0E6E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:49:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C0BC072161; Mon, 19 Aug 2019 09:49:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111416] 4k 60hz on RX 560 over HDMI = no sound
Date: Mon, 19 Aug 2019 09:49:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@azelphur.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111416-502-knGK8TOAky@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111416-502@http.bugs.freedesktop.org/>
References: <bug-111416-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1128804264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1128804264==
Content-Type: multipart/alternative; boundary="15662081450.7dF7d30.8312"
Content-Transfer-Encoding: 7bit


--15662081450.7dF7d30.8312
Date: Mon, 19 Aug 2019 09:49:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111416

--- Comment #6 from Alfie Day <freedesktop@azelphur.com> ---
Hi, based on your comment I went and plugged my nvidia machine into the TV
using the same cable and port. I then used xvidtune -show to extract the
modeline it was using: "3840x2160"   593.41   3840 4016 4104 4400   2160 21=
68
2178 2250 +hsync +vsync

I applied that modeline to the machine with the RX 560 in it, and still no
sound. However, I made a weird discovery while switching the cable between =
the
two machines. If I switch to 4k 60hz on the RX 560, then I pull the HDMI ca=
ble
out, and plug it back in again, I get sound at 4k 60hz. So that works as a
workaround. If I reboot, no sound again.

I have elimniated pulseaudio as a possibility by running

pasuspender -- speaker-test --nloops=3D1 --channels=3D2 --test=3Dwav --devi=
ce=3Dhw:1,9

At 30hz, it works, at 60hz, it doesn't (Unless I replug the cable, then it
does)

I am attaching new dmesg and Xorg logs. Booting at 60hz (and thus having no
sound) and then replugging the HDMI cable (which gets me sound)

I can also simply turn my TV off and on again instead of unplugging /
replugging the cable, sound also works if I boot the computer with the TV o=
ff,
and then turn the TV on after X has started.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662081450.7dF7d30.8312
Date: Mon, 19 Aug 2019 09:49:05 +0000
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
   title=3D"NEW - 4k 60hz on RX 560 over HDMI =3D no sound"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111416#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4k 60hz on RX 560 over HDMI =3D no sound"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111416">bug 11141=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;azelphur.com" title=3D"Alfie Day &lt;freedesktop&#64;azelph=
ur.com&gt;"> <span class=3D"fn">Alfie Day</span></a>
</span></b>
        <pre>Hi, based on your comment I went and plugged my nvidia machine=
 into the TV
using the same cable and port. I then used xvidtune -show to extract the
modeline it was using: &quot;3840x2160&quot;   593.41   3840 4016 4104 4400=
   2160 2168
2178 2250 +hsync +vsync

I applied that modeline to the machine with the RX 560 in it, and still no
sound. However, I made a weird discovery while switching the cable between =
the
two machines. If I switch to 4k 60hz on the RX 560, then I pull the HDMI ca=
ble
out, and plug it back in again, I get sound at 4k 60hz. So that works as a
workaround. If I reboot, no sound again.

I have elimniated pulseaudio as a possibility by running

pasuspender -- speaker-test --nloops=3D1 --channels=3D2 --test=3Dwav --devi=
ce=3Dhw:1,9

At 30hz, it works, at 60hz, it doesn't (Unless I replug the cable, then it
does)

I am attaching new dmesg and Xorg logs. Booting at 60hz (and thus having no
sound) and then replugging the HDMI cable (which gets me sound)

I can also simply turn my TV off and on again instead of unplugging /
replugging the cable, sound also works if I boot the computer with the TV o=
ff,
and then turn the TV on after X has started.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662081450.7dF7d30.8312--

--===============1128804264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1128804264==--
