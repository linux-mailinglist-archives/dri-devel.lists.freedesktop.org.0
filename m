Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B531F6CFC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FC76E851;
	Mon, 11 Nov 2019 02:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C90D6E846
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 02:50:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0980E720E2; Mon, 11 Nov 2019 02:50:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 11 Nov 2019 02:50:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: hamz_23@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-O8rX6ZChM1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1622250883=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1622250883==
Content-Type: multipart/alternative; boundary="15734406140.7aFFdA28.20460"
Content-Transfer-Encoding: 7bit


--15734406140.7aFFdA28.20460
Date: Mon, 11 Nov 2019 02:50:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #227 from John H <hamz_23@hotmail.com> ---
Hi all.

For the last couple weeks I have been following this thread and just wanted=
 to
reprot my experiences findings. First off, my machine's specs:

AMD Ryzen 3700X
Aorus X570 Pro Wifi motherboard
32 GB (16x2) DDR4 3200 RAM
PowerColor Red Devil 5700XT Graphics
Various SSD / HDD all on SATA.
Windows 10 / Debian Sid

Debian Sid: Kernel 5.3.10, Mesa 19.2.3, LLVM 9 as of writing this.

In the whole time I have had this graphics card (October 21 onwards) I dont
think I have had any crashes / freezes on the desktop or during browsing
through Chromium. However, I have hard freezes when playing games. A specif=
ic
one I can reproduce EVERY. SINGLE. TIME. was when playing Unreal Tournament=
 3
via Steam proton. The "Shangri La" map i encountered lockups anywhere from a
few seconds to a few minutes into the game. Forcing me to hit the reset but=
ton.
I was able to SSH in via my phone before resetting and looking at dmesg said
something about amdgpu GPU recovery failed.=20

My 5700XT, has a dual BIOS's. One overclocked, the other for "silent". By
default the switch was in the OC position, earlier today I flipped it to
silent. and since then, NO freezes in UT whatsoever! I figured the factory
overclock PowerColor implemented on this card was just a touch too high and=
 is
therefore unstable. Forza 6 Apex in Windows 10 also hard freezes my PC, for=
cing
me to reset. That problem also has been eliminated since flipping the switc=
h. A
slight performance loss but I'll take the stability anyday.


TL;DR - If your Navi card has dual BIOS, try switching to the lower clocked
BIOS if you haven't already. it may just help. Certainly, I'll report back =
if I
find any other issues in Debian that is linked to this gfx card

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734406140.7aFFdA28.20460
Date: Mon, 11 Nov 2019 02:50:14 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c227">Comm=
ent # 227</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hamz_23&#64;hotmail.com" title=3D"John H &lt;hamz_23&#64;hotmail.com&gt;"> =
<span class=3D"fn">John H</span></a>
</span></b>
        <pre>Hi all.

For the last couple weeks I have been following this thread and just wanted=
 to
reprot my experiences findings. First off, my machine's specs:

AMD Ryzen 3700X
Aorus X570 Pro Wifi motherboard
32 GB (16x2) DDR4 3200 RAM
PowerColor Red Devil 5700XT Graphics
Various SSD / HDD all on SATA.
Windows 10 / Debian Sid

Debian Sid: Kernel 5.3.10, Mesa 19.2.3, LLVM 9 as of writing this.

In the whole time I have had this graphics card (October 21 onwards) I dont
think I have had any crashes / freezes on the desktop or during browsing
through Chromium. However, I have hard freezes when playing games. A specif=
ic
one I can reproduce EVERY. SINGLE. TIME. was when playing Unreal Tournament=
 3
via Steam proton. The &quot;Shangri La&quot; map i encountered lockups anyw=
here from a
few seconds to a few minutes into the game. Forcing me to hit the reset but=
ton.
I was able to SSH in via my phone before resetting and looking at dmesg said
something about amdgpu GPU recovery failed.=20

My 5700XT, has a dual BIOS's. One overclocked, the other for &quot;silent&q=
uot;. By
default the switch was in the OC position, earlier today I flipped it to
silent. and since then, NO freezes in UT whatsoever! I figured the factory
overclock PowerColor implemented on this card was just a touch too high and=
 is
therefore unstable. Forza 6 Apex in Windows 10 also hard freezes my PC, for=
cing
me to reset. That problem also has been eliminated since flipping the switc=
h. A
slight performance loss but I'll take the stability anyday.


TL;DR - If your Navi card has dual BIOS, try switching to the lower clocked
BIOS if you haven't already. it may just help. Certainly, I'll report back =
if I
find any other issues in Debian that is linked to this gfx card</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734406140.7aFFdA28.20460--

--===============1622250883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1622250883==--
