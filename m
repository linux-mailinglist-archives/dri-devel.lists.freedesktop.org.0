Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCF2133F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 06:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD4D89815;
	Fri, 17 May 2019 04:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E40C289823
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 04:52:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E0CC372167; Fri, 17 May 2019 04:52:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110257] Major artifacts in mpeg2 vaapi hw decoding
Date: Fri, 17 May 2019 04:52:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: randrik@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110257-502-VNcPd7bSee@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110257-502@http.bugs.freedesktop.org/>
References: <bug-110257-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0139936752=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139936752==
Content-Type: multipart/alternative; boundary="15580687393.9a8de1.2332"
Content-Transfer-Encoding: 7bit


--15580687393.9a8de1.2332
Date: Fri, 17 May 2019 04:52:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110257

--- Comment #2 from Andrew Randrianasulu <randrik@mail.ru> ---
wasn't this fixed by
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dd507bcdcf26b417dea20109=
0165af651253b6b11=20

----------
st/va: reverse qt matrix back to its original order
The quantiser matrix that VAAPI provides has been applied with inverse z-sc=
an.
However, what we expect in MPEG2 picture description is the original order.
Therefore, we need to reverse it back to its original order.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D110257
Cc: mesa-stable@lists.freedesktop.org
----------

I can only test with Cinelerra-GG, and my nv92 crad decodes 1080p25 mpeg2 v=
ery
slowly (video decoder clock problem) - but for me images were ok!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15580687393.9a8de1.2332
Date: Fri, 17 May 2019 04:52:19 +0000
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
   title=3D"NEW - Major artifacts in mpeg2 vaapi hw decoding"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110257#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Major artifacts in mpeg2 vaapi hw decoding"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110257">bug 11025=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>wasn't this fixed by
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dd507bcdcf26b=
417dea201090165af651253b6b11">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3Dd507bcdcf26b417dea201090165af651253b6b11</a>=20

----------
st/va: reverse qt matrix back to its original order
The quantiser matrix that VAAPI provides has been applied with inverse z-sc=
an.
However, what we expect in MPEG2 picture description is the original order.
Therefore, we need to reverse it back to its original order.

Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Major artifacts in mpeg2 vaapi hw decoding"
   href=3D"show_bug.cgi?id=3D110257">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110257</a>
Cc: <a href=3D"mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#6=
4;lists.freedesktop.org</a>
----------

I can only test with Cinelerra-GG, and my nv92 crad decodes 1080p25 mpeg2 v=
ery
slowly (video decoder clock problem) - but for me images were ok!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15580687393.9a8de1.2332--

--===============0139936752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0139936752==--
