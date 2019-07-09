Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FD62F38
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 06:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9DB89740;
	Tue,  9 Jul 2019 04:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C30189DC9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 04:14:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0999B72167; Tue,  9 Jul 2019 04:14:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109246] HDMI connected monitors fail to sleep and instead turn
 back on when amdgpu.dc=1
Date: Tue, 09 Jul 2019 04:14:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: valentinesd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109246-502-avgET26dxm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109246-502@http.bugs.freedesktop.org/>
References: <bug-109246-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0568834147=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0568834147==
Content-Type: multipart/alternative; boundary="15626456740.2b8AF4.16091"
Content-Transfer-Encoding: 7bit


--15626456740.2b8AF4.16091
Date: Tue, 9 Jul 2019 04:14:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109246

--- Comment #22 from valentinesd@gmail.com ---
This is happening to me as well.

RX570 w/ Acer H236HL Dual head, both inputs HDMI

I didn't have this issue with the same monitors and an nvidia card, so it s=
eems
specific to the amdgpu driver.

The monitors seem to lose signal (which is normal), then perform an auto in=
put
cycle which then wakes the monitors back up.  The backlight will come on and
display the mouse cursor on a black screen.

I experience this with both Xorg and Wayland.

Unfortunately I can't disable auto input on my monitors, as the previous
workaround suggests.  Just disabling DDC/CI didn't help.

Adding amdgpu.dc=3D0 to linux cmdline resolves the issue for me, but I'm
concerned that may preclude my system from gaining newer features.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626456740.2b8AF4.16091
Date: Tue, 9 Jul 2019 04:14:34 +0000
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
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HDMI connected monitors fail to sleep and instead turn ba=
ck on when amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109246">bug 10924=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
valentinesd&#64;gmail.com" title=3D"valentinesd&#64;gmail.com">valentinesd&=
#64;gmail.com</a>
</span></b>
        <pre>This is happening to me as well.

RX570 w/ Acer H236HL Dual head, both inputs HDMI

I didn't have this issue with the same monitors and an nvidia card, so it s=
eems
specific to the amdgpu driver.

The monitors seem to lose signal (which is normal), then perform an auto in=
put
cycle which then wakes the monitors back up.  The backlight will come on and
display the mouse cursor on a black screen.

I experience this with both Xorg and Wayland.

Unfortunately I can't disable auto input on my monitors, as the previous
workaround suggests.  Just disabling DDC/CI didn't help.

Adding amdgpu.dc=3D0 to linux cmdline resolves the issue for me, but I'm
concerned that may preclude my system from gaining newer features.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626456740.2b8AF4.16091--

--===============0568834147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0568834147==--
