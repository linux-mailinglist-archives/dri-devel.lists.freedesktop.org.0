Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42EB53E9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 19:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5976ED19;
	Tue, 17 Sep 2019 17:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 118246ED19
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 17:20:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0E31A72167; Tue, 17 Sep 2019 17:20:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Tue, 17 Sep 2019 17:20:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-L5Mua4lvar@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2057983255=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2057983255==
Content-Type: multipart/alternative; boundary="15687408290.559a7b3.17990"
Content-Transfer-Encoding: 7bit


--15687408290.559a7b3.17990
Date: Tue, 17 Sep 2019 17:20:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #82 from tempel.julian@gmail.com ---
(In reply to Andrew Eikum from comment #81)
> I've submitted a patch to Wine to throttle our calls to XResetScreenSaver=
 to
> once every five seconds: https://source.winehq.org/patches/data/169958
>=20
> However, I'd argue our previous behavior isn't obviously wrong. What we w=
ere
> doing was calling XResetScreenSaver each time we received user input on a
> joystick in order to delay the screensaver coming up despite no
> keyboard/mouse input. It's not obvious that this behavior was incorrect. =
Are
> you sure you shouldn't be able to handle this behavior from a client?

Thank you. Subjectively, I'd say it completely solves the issue. I don't see
any noteworthy spikes in frametime graphs and I haven't noticed any suspici=
ous
stutter/blocking until now (will do some more tests to be sure).
I'd be very happy if this could be included in 4.17 to increase chances tha=
t it
gets picked up by one of the next Proton releases.

It'd be interesting to know at what calling rate the display driver starts =
to
have issues.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687408290.559a7b3.17990
Date: Tue, 17 Sep 2019 17:20:29 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c82">Comme=
nt # 82</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Andrew Eikum from <a href=3D"show_bug.cgi?id=3D11=
0659#c81">comment #81</a>)
<span class=3D"quote">&gt; I've submitted a patch to Wine to throttle our c=
alls to XResetScreenSaver to
&gt; once every five seconds: <a href=3D"https://source.winehq.org/patches/=
data/169958">https://source.winehq.org/patches/data/169958</a>
&gt;=20
&gt; However, I'd argue our previous behavior isn't obviously wrong. What w=
e were
&gt; doing was calling XResetScreenSaver each time we received user input o=
n a
&gt; joystick in order to delay the screensaver coming up despite no
&gt; keyboard/mouse input. It's not obvious that this behavior was incorrec=
t. Are
&gt; you sure you shouldn't be able to handle this behavior from a client?<=
/span >

Thank you. Subjectively, I'd say it completely solves the issue. I don't see
any noteworthy spikes in frametime graphs and I haven't noticed any suspici=
ous
stutter/blocking until now (will do some more tests to be sure).
I'd be very happy if this could be included in 4.17 to increase chances tha=
t it
gets picked up by one of the next Proton releases.

It'd be interesting to know at what calling rate the display driver starts =
to
have issues.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687408290.559a7b3.17990--

--===============2057983255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2057983255==--
