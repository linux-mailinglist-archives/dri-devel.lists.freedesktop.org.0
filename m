Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBC793A1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 21:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7988D89885;
	Mon, 29 Jul 2019 19:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1B416E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 19:15:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB06172168; Mon, 29 Jul 2019 19:15:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111231] random VM_L2_PROTECTION_FAULTs when loading a world in
 minetest on AMD ryzen 2200G integrated graphics
Date: Mon, 29 Jul 2019 19:15:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111231-502-gFZqCVZeWm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111231-502@http.bugs.freedesktop.org/>
References: <bug-111231-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0380907623=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0380907623==
Content-Type: multipart/alternative; boundary="15644277561.C0FcEEb7.30932"
Content-Transfer-Encoding: 7bit


--15644277561.C0FcEEb7.30932
Date: Mon, 29 Jul 2019 19:15:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111231

--- Comment #14 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
The apitrace no longer causes issues on my system either if I use
AMD_DEBUG=3Dnodpbb . I also decided to try this on minetest and *so far* (b=
earing
in mind the issue was indetermistic in the first place, so a decisive rulin=
g is
near impossible) I have not re-incurred a crash.

Interestingly, what I have noticed is that sometimes when minetest did not =
lock
up my system before, the loading bar would suffer mild graphical corruption
(bits of the black border go white) - quite difficult to capture on camera =
due
to being so fleeting. So far with nodpbb I have yet to observe these artefa=
cts
again.

I did try launching a minetest world with AMD_DEBUG=3Dcheck_vm instead, how=
ever I
somehow still managed to get a lock-up that way with similar graphical
corruption as the bug description. Alas it seems my btrfs root decided to e=
at
my dmesg log file when I had to force power off, so unable to see if it was=
 the
dreaded VM_L2_PROTECTION_FAULT again >:(

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644277561.C0FcEEb7.30932
Date: Mon, 29 Jul 2019 19:15:56 +0000
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
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231">bug 11123=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>The apitrace no longer causes issues on my system either if I =
use
AMD_DEBUG=3Dnodpbb . I also decided to try this on minetest and *so far* (b=
earing
in mind the issue was indetermistic in the first place, so a decisive rulin=
g is
near impossible) I have not re-incurred a crash.

Interestingly, what I have noticed is that sometimes when minetest did not =
lock
up my system before, the loading bar would suffer mild graphical corruption
(bits of the black border go white) - quite difficult to capture on camera =
due
to being so fleeting. So far with nodpbb I have yet to observe these artefa=
cts
again.

I did try launching a minetest world with AMD_DEBUG=3Dcheck_vm instead, how=
ever I
somehow still managed to get a lock-up that way with similar graphical
corruption as the bug description. Alas it seems my btrfs root decided to e=
at
my dmesg log file when I had to force power off, so unable to see if it was=
 the
dreaded VM_L2_PROTECTION_FAULT again &gt;:(</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644277561.C0FcEEb7.30932--

--===============0380907623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0380907623==--
