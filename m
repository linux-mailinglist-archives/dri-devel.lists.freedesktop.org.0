Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C434F0B2D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 01:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B52F6EBA4;
	Wed,  6 Nov 2019 00:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CA326EBAF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 00:43:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 19637720E2; Wed,  6 Nov 2019 00:43:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 06 Nov 2019 00:43:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-5bTpeSntv9@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0115668736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0115668736==
Content-Type: multipart/alternative; boundary="15730010001.c9dec3.1824"
Content-Transfer-Encoding: 7bit


--15730010001.c9dec3.1824
Date: Wed, 6 Nov 2019 00:43:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #209 from L.S.S. <ragnaros39216@yandex.com> ---
Really?!

Although I haven't really used the card under Windows, if similar behaviors
happen on Windows as well then either something's really really wrong here.

I haven't tested gaming on Manjaro yet, but at least with amdgpu-pro stuffs=
 on
Manjaro the sdma0 freezes with Nemo stopped happening.

On the other hand, video card recovery is not yet matured on Linux yet, but=
 on
Windows it has already been available thanks to the WDDM, though you cannot
completely rely on it, as some apps can still misbehave if the driver has b=
een
crashed for at least once in the system lifecycle, and it may eventually fa=
il
to recover at some point later on.

Which brand of the Radeon RX 5700/XT are you using? For me I'm using a 50th
Anniversary edition. How's the thermal condition when you play games on the
card? It's possible the card might have weird behavior if it's under load w=
ith
temperature near triple digits (something that I personally would never all=
ow).

I have a PCI slot fan set (consists of 3 slim fans which is around the same
length as the card itself) placed beneath the card, blowing upwards, and it
seems very effective. With the help of its own blower fans, the card mainta=
ins
a steady 50 celsius under load.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730010001.c9dec3.1824
Date: Wed, 6 Nov 2019 00:43:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c209">Comm=
ent # 209</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ragnaros39216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.=
com&gt;"> <span class=3D"fn">L.S.S.</span></a>
</span></b>
        <pre>Really?!

Although I haven't really used the card under Windows, if similar behaviors
happen on Windows as well then either something's really really wrong here.

I haven't tested gaming on Manjaro yet, but at least with amdgpu-pro stuffs=
 on
Manjaro the sdma0 freezes with Nemo stopped happening.

On the other hand, video card recovery is not yet matured on Linux yet, but=
 on
Windows it has already been available thanks to the WDDM, though you cannot
completely rely on it, as some apps can still misbehave if the driver has b=
een
crashed for at least once in the system lifecycle, and it may eventually fa=
il
to recover at some point later on.

Which brand of the Radeon RX 5700/XT are you using? For me I'm using a 50th
Anniversary edition. How's the thermal condition when you play games on the
card? It's possible the card might have weird behavior if it's under load w=
ith
temperature near triple digits (something that I personally would never all=
ow).

I have a PCI slot fan set (consists of 3 slim fans which is around the same
length as the card itself) placed beneath the card, blowing upwards, and it
seems very effective. With the help of its own blower fans, the card mainta=
ins
a steady 50 celsius under load.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730010001.c9dec3.1824--

--===============0115668736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0115668736==--
