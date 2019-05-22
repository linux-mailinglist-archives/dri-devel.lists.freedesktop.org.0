Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C325BF5
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 04:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1BB89581;
	Wed, 22 May 2019 02:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B3B689581
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 02:41:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 81EA472162; Wed, 22 May 2019 02:41:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110721] graphics corruption on steam client with mesa 19.1.0
 rc3 on polaris
Date: Wed, 22 May 2019 02:41:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rropid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110721-502-uJiGU6nFPW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110721-502@http.bugs.freedesktop.org/>
References: <bug-110721-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1800647286=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1800647286==
Content-Type: multipart/alternative; boundary="15584929051.bfF1a1f.13340"
Content-Transfer-Encoding: 7bit


--15584929051.bfF1a1f.13340
Date: Wed, 22 May 2019 02:41:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

--- Comment #1 from rropid@gmail.com ---
I get similar corruption in Chromium and Visual Studio Code with Mesa
19.1.0-rc3. There was no problem with 19.1.0-rc2.

This is on Archlinux, kernel 5.1.3, the card is an RX480. I tried compiling
Mesa with both LLVM 8 and 9 (r360929).

It's very visible in Chromium when Chromium is started with parameters that
enable its hardware acceleration:

chromium \
--ignore-gpu-blacklist \
--enable-gpu-rasterization \
--enable-native-gpu-memory-buffers \
--enable-zero-copy \
--disable-gpu-driver-bug-workarounds

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584929051.bfF1a1f.13340
Date: Wed, 22 May 2019 02:41:45 +0000
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
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721">bug 11072=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rropid&#64;gmail.com" title=3D"rropid&#64;gmail.com">rropid&#64;gmail.com</=
a>
</span></b>
        <pre>I get similar corruption in Chromium and Visual Studio Code wi=
th Mesa
19.1.0-rc3. There was no problem with 19.1.0-rc2.

This is on Archlinux, kernel 5.1.3, the card is an RX480. I tried compiling
Mesa with both LLVM 8 and 9 (r360929).

It's very visible in Chromium when Chromium is started with parameters that
enable its hardware acceleration:

chromium \
--ignore-gpu-blacklist \
--enable-gpu-rasterization \
--enable-native-gpu-memory-buffers \
--enable-zero-copy \
--disable-gpu-driver-bug-workarounds</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584929051.bfF1a1f.13340--

--===============1800647286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1800647286==--
