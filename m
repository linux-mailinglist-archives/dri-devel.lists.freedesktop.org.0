Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7FF3398B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EEB89339;
	Mon,  3 Jun 2019 20:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1EB588933C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 20:10:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1B72E72167; Mon,  3 Jun 2019 20:10:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 03 Jun 2019 20:10:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-oCikataeGh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0508532885=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0508532885==
Content-Type: multipart/alternative; boundary="15595926261.ca259e.15217"
Content-Transfer-Encoding: 7bit


--15595926261.ca259e.15217
Date: Mon, 3 Jun 2019 20:10:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #26 from Matt Coffin <mcoffin13@gmail.com> ---
For reproducability, here's what I've been using. (I can reproduce this cra=
sh
on both the RADV and AMDVLK Vulkan implementations, and can reproduce it bo=
th
on top of sway 1.1 (wayland), and xfce4 (X11)).

* 5.1.3-arch2-1-ARCH
* LLVM 8.0.0
* mesa/vulkan-radeon: 19.0.4
* AMDVLK: (dev branch from nighttime Mountain time 20190602)
* DXVK: winelib version - release 1.2.1

I run "House Flipper" from Steam with DXVK_FILTER_DEVICE_NAME=3D590.

On 1080p@60Hz with v-sync, it runs quite well and stable (for hours). If I
disable v-sync and framerate limiting, the crash occurs within a minute
usually.

At 2560x1440 resolution, no refresh rate works in a stable mannner, but I h=
ave
tried both 60Hz and 144Hz.

With the game rendering 1080p but scaling up to a 2560x1440 display, I saw =
it
crash once, but was unable to duplicate it again.

I'm new to low-level development, and would like to help. If I can provide =
any
information since I can reliably reproduce the issue, I'd love to. Let me k=
now
what would be useful and I'd be happy to get it out to you.

I've also seen the bugs listed in my other comment on the other bug here:
https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c82

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595926261.ca259e.15217
Date: Mon, 3 Jun 2019 20:10:26 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>For reproducability, here's what I've been using. (I can repro=
duce this crash
on both the RADV and AMDVLK Vulkan implementations, and can reproduce it bo=
th
on top of sway 1.1 (wayland), and xfce4 (X11)).

* 5.1.3-arch2-1-ARCH
* LLVM 8.0.0
* mesa/vulkan-radeon: 19.0.4
* AMDVLK: (dev branch from nighttime Mountain time 20190602)
* DXVK: winelib version - release 1.2.1

I run &quot;House Flipper&quot; from Steam with DXVK_FILTER_DEVICE_NAME=3D5=
90.

On 1080p&#64;60Hz with v-sync, it runs quite well and stable (for hours). I=
f I
disable v-sync and framerate limiting, the crash occurs within a minute
usually.

At 2560x1440 resolution, no refresh rate works in a stable mannner, but I h=
ave
tried both 60Hz and 144Hz.

With the game rendering 1080p but scaling up to a 2560x1440 display, I saw =
it
crash once, but was unable to duplicate it again.

I'm new to low-level development, and would like to help. If I can provide =
any
information since I can reliably reproduce the issue, I'd love to. Let me k=
now
what would be useful and I'd be happy to get it out to you.

I've also seen the bugs listed in my other comment on the other bug here:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"show_bug.cgi?id=3D102322#c82">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D102322#c82</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595926261.ca259e.15217--

--===============0508532885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0508532885==--
