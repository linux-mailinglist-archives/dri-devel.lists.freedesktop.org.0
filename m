Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60774983B2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0586E9C0;
	Wed, 21 Aug 2019 18:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 232B26E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:53:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1FA2672161; Wed, 21 Aug 2019 18:53:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 21 Aug 2019 18:53:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-AxFE7XgepT@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1690118391=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1690118391==
Content-Type: multipart/alternative; boundary="15664136061.FD5fC22E.25457"
Content-Transfer-Encoding: 7bit


--15664136061.FD5fC22E.25457
Date: Wed, 21 Aug 2019 18:53:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #34 from tempel.julian@gmail.com ---
Thank you for being still with me on this.

I've downgraded to stock packages provided by Arch stable repository, which=
 is:
xorg-server 1.20.5
xf86-video-amdgpu 19.0.1
mesa  19.1.4
stock (read: no) xorg config
no custom kernel parameters (except of of disabling intel_pstate, see new
dmesg.log attached)

And I've also installed amd-staging-drm-next (6c7a8d5c0772) just like you.

But: The issue is unchanged. To further illustrate the issue, I've recorded=
 a
capture of it in the game TESV: Oblivion in D9VK (no difference to WineD3D =
or
Gallium Nine regarding this issue).

The capturing process in OBS Studio via Xcomposite breaks pageflipping, but=
 I
can turn it on again via TearFree which I enable via hotkey on the fly. The
result 100% matches running the game with modesetting DDX or amdgpu.dc=3D0 =
(no
spikes) vs. xf86-video-amdgpu + amdgpu.dc=3D1 (nasty spikes).

Hitman 2 is a bit different, as it doesn't show render spikes for me either=
 (I
think I was first mistaken regarding that difference, sorry for the confusi=
on),
but the mouse input just blocks/skips heavily and is even more unplayable t=
han
Oblivion/Skyrim etc.

I was just writing this while I read your new reply. I'll gladly try what y=
ou
have suggested.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664136061.FD5fC22E.25457
Date: Wed, 21 Aug 2019 18:53:26 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Thank you for being still with me on this.

I've downgraded to stock packages provided by Arch stable repository, which=
 is:
xorg-server 1.20.5
xf86-video-amdgpu 19.0.1
mesa  19.1.4
stock (read: no) xorg config
no custom kernel parameters (except of of disabling intel_pstate, see new
dmesg.log attached)

And I've also installed amd-staging-drm-next (6c7a8d5c0772) just like you.

But: The issue is unchanged. To further illustrate the issue, I've recorded=
 a
capture of it in the game TESV: Oblivion in D9VK (no difference to WineD3D =
or
Gallium Nine regarding this issue).

The capturing process in OBS Studio via Xcomposite breaks pageflipping, but=
 I
can turn it on again via TearFree which I enable via hotkey on the fly. The
result 100% matches running the game with modesetting DDX or amdgpu.dc=3D0 =
(no
spikes) vs. xf86-video-amdgpu + amdgpu.dc=3D1 (nasty spikes).

Hitman 2 is a bit different, as it doesn't show render spikes for me either=
 (I
think I was first mistaken regarding that difference, sorry for the confusi=
on),
but the mouse input just blocks/skips heavily and is even more unplayable t=
han
Oblivion/Skyrim etc.

I was just writing this while I read your new reply. I'll gladly try what y=
ou
have suggested.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664136061.FD5fC22E.25457--

--===============1690118391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1690118391==--
