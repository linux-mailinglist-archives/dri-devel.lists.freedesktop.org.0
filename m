Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1467354D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 19:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F236E5FB;
	Wed, 24 Jul 2019 17:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D1A16E604
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 17:24:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3A06572167; Wed, 24 Jul 2019 17:24:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110347] pp_od_clk_voltage mV cap ignored
Date: Wed, 24 Jul 2019 17:24:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bednarczyk.pawel@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110347-502-RpSoK7SrZb@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110347-502@http.bugs.freedesktop.org/>
References: <bug-110347-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1795376885=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1795376885==
Content-Type: multipart/alternative; boundary="15639890572.CB3D37B9c.19987"
Content-Transfer-Encoding: 7bit


--15639890572.CB3D37B9c.19987
Date: Wed, 24 Jul 2019 17:24:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110347

--- Comment #6 from bednarczyk.pawel@outlook.com ---
just tried against the latest kernel git master with AMD's latest AMD GPU t=
ree
baked on top of that and my voltage is still shooting up to 1200m when the =
card
raches P7:

OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        910mV
3:       1138Mhz        920mV
4:       1195Mhz        925mV
5:       1250Mhz        935mV
6:       1425Mhz        940mV
7:       1475Mhz        950mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        850mV
2:        800Mhz        910mV
3:       1025Mhz        950mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV


If I cheat and set P6=3DP7 as follows:

OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        910mV
3:       1138Mhz        920mV
4:       1195Mhz        925mV
5:       1250Mhz        935mV
6:       1425Mhz        940mV
7:       1425Mhz        950mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        850mV
2:        800Mhz        910mV
3:       1025Mhz        950mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV

then voltage stays at 950mV as it should. There's a problem somewhere when =
the
card switches to P7.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15639890572.CB3D37B9c.19987
Date: Wed, 24 Jul 2019 17:24:17 +0000
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
   title=3D"NEW - pp_od_clk_voltage mV cap ignored"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110347#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pp_od_clk_voltage mV cap ignored"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110347">bug 11034=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bednarczyk.pawel&#64;outlook.com" title=3D"bednarczyk.pawel&#64;outlook.com=
">bednarczyk.pawel&#64;outlook.com</a>
</span></b>
        <pre>just tried against the latest kernel git master with AMD's lat=
est AMD GPU tree
baked on top of that and my voltage is still shooting up to 1200m when the =
card
raches P7:

OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        910mV
3:       1138Mhz        920mV
4:       1195Mhz        925mV
5:       1250Mhz        935mV
6:       1425Mhz        940mV
7:       1475Mhz        950mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        850mV
2:        800Mhz        910mV
3:       1025Mhz        950mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV


If I cheat and set P6=3DP7 as follows:

OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        910mV
3:       1138Mhz        920mV
4:       1195Mhz        925mV
5:       1250Mhz        935mV
6:       1425Mhz        940mV
7:       1425Mhz        950mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        850mV
2:        800Mhz        910mV
3:       1025Mhz        950mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV

then voltage stays at 950mV as it should. There's a problem somewhere when =
the
card switches to P7.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15639890572.CB3D37B9c.19987--

--===============1795376885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1795376885==--
