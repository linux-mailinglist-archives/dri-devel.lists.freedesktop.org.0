Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E380CBF
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 23:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D7389CA2;
	Sun,  4 Aug 2019 21:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C595689C9B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 21:33:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BFFB672167; Sun,  4 Aug 2019 21:33:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110199] [amdgpu] Screen flickering when using a 75Hz monitor
 paired with an RX 480 GPU
Date: Sun, 04 Aug 2019 21:33:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: 192k@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110199-502-YPy2LEnYp2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110199-502@http.bugs.freedesktop.org/>
References: <bug-110199-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1973737553=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1973737553==
Content-Type: multipart/alternative; boundary="15649544246.BfAA2a52E.10446"
Content-Transfer-Encoding: 7bit


--15649544246.BfAA2a52E.10446
Date: Sun, 4 Aug 2019 21:33:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110199

--- Comment #13 from 192k@protonmail.com ---
I can confirm this issue exists on rx560

i have discovered a workaround,=20

if you copy the stock powerplaytable to a file with
cat /sys/class/drm/card0/device/pp_table > pptable

then load the stock pptable with

sudo bash -c 'echo pptable > /sys/class/drm/card0/device/pp_table'

the flickering goes away without having to lock the mclk to the highest sta=
te

it may also be related to https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0347
this bug.
by default at boot the voltage for the highest pstate is the maximum allowa=
ble
voltage(1150mv) not the powerplay defined voltage of 1025mv, all other psta=
tes
are not effected

this is also corrected after reloading the pptable manually.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649544246.BfAA2a52E.10446
Date: Sun, 4 Aug 2019 21:33:44 +0000
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
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199">bug 11019=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
192k&#64;protonmail.com" title=3D"192k&#64;protonmail.com">192k&#64;protonm=
ail.com</a>
</span></b>
        <pre>I can confirm this issue exists on rx560

i have discovered a workaround,=20

if you copy the stock powerplaytable to a file with
cat /sys/class/drm/card0/device/pp_table &gt; pptable

then load the stock pptable with

sudo bash -c 'echo pptable &gt; /sys/class/drm/card0/device/pp_table'

the flickering goes away without having to lock the mclk to the highest sta=
te

it may also be related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pp_od_clk_voltage mV cap ignored"
   href=3D"show_bug.cgi?id=3D110347">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110347</a>
this bug.
by default at boot the voltage for the highest pstate is the maximum allowa=
ble
voltage(1150mv) not the powerplay defined voltage of 1025mv, all other psta=
tes
are not effected

this is also corrected after reloading the pptable manually.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649544246.BfAA2a52E.10446--

--===============1973737553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1973737553==--
