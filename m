Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A3A69B2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B879E892B7;
	Tue,  3 Sep 2019 13:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 626B3892B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:25:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5ED3A72161; Tue,  3 Sep 2019 13:25:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110850] Vlc fails to decode video using vaapi
Date: Tue, 03 Sep 2019 13:25:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kle@bluewin.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110850-502-B5PExnRsAF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110850-502@http.bugs.freedesktop.org/>
References: <bug-110850-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1405701499=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1405701499==
Content-Type: multipart/alternative; boundary="15675171302.A6DAEfd.11167"
Content-Transfer-Encoding: 7bit


--15675171302.A6DAEfd.11167
Date: Tue, 3 Sep 2019 13:25:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110850

--- Comment #1 from C. Leu <kle@bluewin.ch> ---
(In reply to Akarshan Biswas from comment #0)

I can confirm a similar issue. In my case, the problem occurs on older Rade=
on
hardware (HD 3650) which uses the r600 driver. The result is the same, no
hardware acceleration is possible through the integrated unified video deco=
der
(UVD). CPU has around 100% load.

It seems that the VA-API is broken, at least for certain systems.

Mesa version: 19.0.8

OS: Kubuntu 18.04.3 LTS with kernel 5.0.0-27

Kaffeine: 2.0.18

Error message:

libva info: VA-API version 1.1.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/r600_drv_video.so
libva info: Found init function __vaDriverInit_1_1
libva info: va_openDriver() returns 0
[00007fabb0002bd0] glconv_vaapi_x11 gl error: vaDeriveImage: invalid
VAImageFormat
[00007fabbc1cbe10] main video output error: video output creation failed
[00007fabe8031800] main decoder error: failed to create video output

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675171302.A6DAEfd.11167
Date: Tue, 3 Sep 2019 13:25:30 +0000
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
   title=3D"NEW - Vlc fails to decode video using vaapi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110850#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Vlc fails to decode video using vaapi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110850">bug 11085=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kle&#64;bluewin.ch" title=3D"C. Leu &lt;kle&#64;bluewin.ch&gt;"> <span clas=
s=3D"fn">C. Leu</span></a>
</span></b>
        <pre>(In reply to Akarshan Biswas from <a href=3D"show_bug.cgi?id=
=3D110850#c0">comment #0</a>)

I can confirm a similar issue. In my case, the problem occurs on older Rade=
on
hardware (HD 3650) which uses the r600 driver. The result is the same, no
hardware acceleration is possible through the integrated unified video deco=
der
(UVD). CPU has around 100% load.

It seems that the VA-API is broken, at least for certain systems.

Mesa version: 19.0.8

OS: Kubuntu 18.04.3 LTS with kernel 5.0.0-27

Kaffeine: 2.0.18

Error message:

libva info: VA-API version 1.1.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/r600_drv_video.so
libva info: Found init function __vaDriverInit_1_1
libva info: va_openDriver() returns 0
[00007fabb0002bd0] glconv_vaapi_x11 gl error: vaDeriveImage: invalid
VAImageFormat
[00007fabbc1cbe10] main video output error: video output creation failed
[00007fabe8031800] main decoder error: failed to create video output</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675171302.A6DAEfd.11167--

--===============1405701499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1405701499==--
