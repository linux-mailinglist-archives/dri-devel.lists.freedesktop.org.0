Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C31BAB97
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 22:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C256E882;
	Sun, 22 Sep 2019 20:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C54B66E887
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 20:13:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C2C4472162; Sun, 22 Sep 2019 20:13:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Sun, 22 Sep 2019 20:13:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-ZkyBaeEHrx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2024022749=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2024022749==
Content-Type: multipart/alternative; boundary="15691831974.A09A86Fdf.14295"
Content-Transfer-Encoding: 7bit


--15691831974.A09A86Fdf.14295
Date: Sun, 22 Sep 2019 20:13:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #24 from towo@siduction.org ---
Same problem here on my Ideapad 330

Machine:   Type: Laptop System: LENOVO product: 81D2 v: Lenovo ideapad
330-15ARR serial: <root required>=20
           Mobo: LENOVO model: LNVNB161216 v: SDK0J40709 WIN serial: <root
required> UEFI: LENOVO v: 7VCN47WW date: 04/25/2019=20
Graphics:  Device-1: AMD Raven Ridge [Radeon Vega Series / Radeon Vega Mobi=
le
Series] driver: amdgpu v: kernel=20
           Display: server: X.org 1.20.4 driver: amdgpu,ati unloaded:
fbdev,modesetting,vesa tty: 211x40

I have not used suspend. Lightdm starts without problem.
Cinnamon is working fine but XFCE4 ends up with that kernel oops and black
screen.
I have found out, that the compositor in xfwm4 is the culprint, if i disable
that compositor, xfce is running fine. Even if i use compton as compositor,
xfce is starting fine.

Then i also reveted=20

https://github.com/freedesktop/xorg-xf86-video-amdgpu/commit/a2b32e72fdaff3=
007a79b84929997d8176c2d512

and now xfce is running without problem/black screen with internal composit=
or
activated.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15691831974.A09A86Fdf.14295
Date: Sun, 22 Sep 2019 20:13:17 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
towo&#64;siduction.org" title=3D"towo&#64;siduction.org">towo&#64;siduction=
.org</a>
</span></b>
        <pre>Same problem here on my Ideapad 330

Machine:   Type: Laptop System: LENOVO product: 81D2 v: Lenovo ideapad
330-15ARR serial: &lt;root required&gt;=20
           Mobo: LENOVO model: LNVNB161216 v: SDK0J40709 WIN serial: &lt;ro=
ot
required&gt; UEFI: LENOVO v: 7VCN47WW date: 04/25/2019=20
Graphics:  Device-1: AMD Raven Ridge [Radeon Vega Series / Radeon Vega Mobi=
le
Series] driver: amdgpu v: kernel=20
           Display: server: X.org 1.20.4 driver: amdgpu,ati unloaded:
fbdev,modesetting,vesa tty: 211x40

I have not used suspend. Lightdm starts without problem.
Cinnamon is working fine but XFCE4 ends up with that kernel oops and black
screen.
I have found out, that the compositor in xfwm4 is the culprint, if i disable
that compositor, xfce is running fine. Even if i use compton as compositor,
xfce is starting fine.

Then i also reveted=20

<a href=3D"https://github.com/freedesktop/xorg-xf86-video-amdgpu/commit/a2b=
32e72fdaff3007a79b84929997d8176c2d512">https://github.com/freedesktop/xorg-=
xf86-video-amdgpu/commit/a2b32e72fdaff3007a79b84929997d8176c2d512</a>

and now xfce is running without problem/black screen with internal composit=
or
activated.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15691831974.A09A86Fdf.14295--

--===============2024022749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2024022749==--
