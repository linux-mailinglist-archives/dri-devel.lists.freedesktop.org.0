Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B5AAAAD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 20:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93E66E0D5;
	Thu,  5 Sep 2019 18:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B0AE6E0D5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 18:16:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4577172161; Thu,  5 Sep 2019 18:16:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Thu, 05 Sep 2019 18:16:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-tRDhxj2gUP@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0805498784=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0805498784==
Content-Type: multipart/alternative; boundary="15677074191.8bDF2D.25663"
Content-Transfer-Encoding: 7bit


--15677074191.8bDF2D.25663
Date: Thu, 5 Sep 2019 18:16:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #15 from Robert <freedesktop@postfach.xyz> ---
Thanks Ilia for your comment! I get this output from "xrandr":

"""
Screen 0: minimum 320 x 200, current 5120 x 1440, maximum 16384 x 16384
DisplayPort-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1 disconnected (normal left inverted right x axis y axis)
DisplayPort-2 connected primary 5120x1440+0+0 (normal left inverted right x
axis y axis) 1200mm x 340mm
   5120x1440     60.00 +  30.00*+
   3840x1080     60.00 +
   3840x2160     60.00    30.00=20=20
   1920x1200     60.00=20=20
   1920x1080     60.00    59.94=20=20
   1600x1200     60.00=20=20
   1680x1050     60.00=20=20
   1600x900      60.00=20=20
   1280x1024     60.02=20=20
   1440x900      60.00=20=20
   1280x800      59.81=20=20
   1152x864      59.97=20=20
   1280x720      60.00    59.94=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   720x480       60.00    59.94=20=20
   640x480       60.00    59.94=20=20
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
"""

So from what I can see only one monitor reported.

But I figured out something else: If I change the refresh rate from 60Hz to
30Hz I get 8W idle power consumption... Umpf... Now I've a big screen, kinda
high end graphics card and 30Hz refresh rate :D It basically works but movi=
ng
windows a little bit faster or moving the mouse pointer around looks
"interesting". Haven't tested any games with that refresh rate but I guess =
it
also looks "interesting" ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677074191.8bDF2D.25663
Date: Thu, 5 Sep 2019 18:16:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>Thanks Ilia for your comment! I get this output from &quot;xra=
ndr&quot;:

&quot;&quot;&quot;
Screen 0: minimum 320 x 200, current 5120 x 1440, maximum 16384 x 16384
DisplayPort-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1 disconnected (normal left inverted right x axis y axis)
DisplayPort-2 connected primary 5120x1440+0+0 (normal left inverted right x
axis y axis) 1200mm x 340mm
   5120x1440     60.00 +  30.00*+
   3840x1080     60.00 +
   3840x2160     60.00    30.00=20=20
   1920x1200     60.00=20=20
   1920x1080     60.00    59.94=20=20
   1600x1200     60.00=20=20
   1680x1050     60.00=20=20
   1600x900      60.00=20=20
   1280x1024     60.02=20=20
   1440x900      60.00=20=20
   1280x800      59.81=20=20
   1152x864      59.97=20=20
   1280x720      60.00    59.94=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   720x480       60.00    59.94=20=20
   640x480       60.00    59.94=20=20
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
&quot;&quot;&quot;

So from what I can see only one monitor reported.

But I figured out something else: If I change the refresh rate from 60Hz to
30Hz I get 8W idle power consumption... Umpf... Now I've a big screen, kinda
high end graphics card and 30Hz refresh rate :D It basically works but movi=
ng
windows a little bit faster or moving the mouse pointer around looks
&quot;interesting&quot;. Haven't tested any games with that refresh rate bu=
t I guess it
also looks &quot;interesting&quot; ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677074191.8bDF2D.25663--

--===============0805498784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0805498784==--
