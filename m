Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11D3397B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 22:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A758933C;
	Mon,  3 Jun 2019 20:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FFB589330
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 20:03:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0704672167; Mon,  3 Jun 2019 20:03:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Mon, 03 Jun 2019 20:03:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-uxE6dNPwXZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1584309014=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1584309014==
Content-Type: multipart/alternative; boundary="15595922280.6216.13865"
Content-Transfer-Encoding: 7bit


--15595922280.6216.13865
Date: Mon, 3 Jun 2019 20:03:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #82 from Matt Coffin <mcoffin13@gmail.com> ---
I am also experiencing this issue.

* Kernel: 5.1.3-arch2-1-ARCH
* LLVM 8.0.0
* AMDVLK (dev branch pulled 20190602)
* Mesa 19.0.4
* Card: XFX Radeon RX 590

I've seen this error, bug 105733, bug 105152, bug 107536, and bug 109955 all
repeatable (which one each time appears to be non-deterministic) with the s=
ame
process.

I just launch "House Flipper" from Steam (DX11 title), with DXVK 1.2.1, on
either the mesa RADV or AMDVLK vulkan implementations.

At 2560x1440 resolution (both 60Hz and 144Hz refresh rates), the crash(es)
occur. At 1080p@60Hz, I get no crashes, but they come back if I disable v-s=
ync
and framerate limiting.

I logged power consumption with `sensors | egrep '^power' | awk '{ print $1=
 " "
$2; }'`, and found that the crash often occurs soon after the card hits its
maximum power draw at around 190W.

I don't have much experience debugging or developing software at the
kernel/driver level, but I'm happy to help with providing information as I =
go
through the learning process here. I'll compile the amd-staging-drm-next ke=
rnel
later tonight and post some results and logs.

Please let me know if there's more information I could provide that may be =
of
use here. Thanks for your hard work!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595922280.6216.13865
Date: Mon, 3 Jun 2019 20:03:48 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c82">Comme=
nt # 82</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>I am also experiencing this issue.

* Kernel: 5.1.3-arch2-1-ARCH
* LLVM 8.0.0
* AMDVLK (dev branch pulled 20190602)
* Mesa 19.0.4
* Card: XFX Radeon RX 590

I've seen this error, <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Amdgpu randomly hangs and only ssh works.=
 Mouse cursor moves sometimes but does nothing. Keyboard stops working."
   href=3D"show_bug.cgi?id=3D105733">bug 105733</a>, <a class=3D"bz_bug_lin=
k=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Display artifacts related to DCC on radeonsi"
   href=3D"show_bug.cgi?id=3D105152">bug 105152</a>, <a class=3D"bz_bug_lin=
k=20
          bz_status_NEW "
   title=3D"NEW - gfx_v8_0_priv_reg_irq [amdgpu]] *ERROR* Illegal register =
access in command stream"
   href=3D"show_bug.cgi?id=3D107536">bug 107536</a>, and <a class=3D"bz_bug=
_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"show_bug.cgi?id=3D109955">bug 109955</a> all
repeatable (which one each time appears to be non-deterministic) with the s=
ame
process.

I just launch &quot;House Flipper&quot; from Steam (DX11 title), with DXVK =
1.2.1, on
either the mesa RADV or AMDVLK vulkan implementations.

At 2560x1440 resolution (both 60Hz and 144Hz refresh rates), the crash(es)
occur. At 1080p&#64;60Hz, I get no crashes, but they come back if I disable=
 v-sync
and framerate limiting.

I logged power consumption with `sensors | egrep '^power' | awk '{ print $1=
 &quot; &quot;
$2; }'`, and found that the crash often occurs soon after the card hits its
maximum power draw at around 190W.

I don't have much experience debugging or developing software at the
kernel/driver level, but I'm happy to help with providing information as I =
go
through the learning process here. I'll compile the amd-staging-drm-next ke=
rnel
later tonight and post some results and logs.

Please let me know if there's more information I could provide that may be =
of
use here. Thanks for your hard work!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595922280.6216.13865--

--===============1584309014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1584309014==--
