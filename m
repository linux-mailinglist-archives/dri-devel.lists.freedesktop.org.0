Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432083C949
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 12:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C8E891BE;
	Tue, 11 Jun 2019 10:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7311891C0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:46:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A3FA872167; Tue, 11 Jun 2019 10:46:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110883] [Regression linux 5.2-rc4][bisected] hang on boot
Date: Tue, 11 Jun 2019 10:46:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: freedesktop@sibrenvasse.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110883-502-v7KLtIkI6n@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110883-502@http.bugs.freedesktop.org/>
References: <bug-110883-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0416324745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0416324745==
Content-Type: multipart/alternative; boundary="15602499741.b5FaD0d9.10601"
Content-Transfer-Encoding: 7bit


--15602499741.b5FaD0d9.10601
Date: Tue, 11 Jun 2019 10:46:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110883

--- Comment #5 from Sibren Vasse <freedesktop@sibrenvasse.nl> ---
A (similar) patch was already submitted to amd-gfx
(https://lists.freedesktop.org/archives/amd-gfx/2019-June/034946.html)
However, applying this to v5.2-rc4 does not solve the issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602499741.b5FaD0d9.10601
Date: Tue, 11 Jun 2019 10:46:14 +0000
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
   title=3D"NEW - [Regression linux 5.2-rc4][bisected] hang on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression linux 5.2-rc4][bisected] hang on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110883">bug 11088=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;sibrenvasse.nl" title=3D"Sibren Vasse &lt;freedesktop&#64;s=
ibrenvasse.nl&gt;"> <span class=3D"fn">Sibren Vasse</span></a>
</span></b>
        <pre>A (similar) patch was already submitted to amd-gfx
(<a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2019-June/034946=
.html">https://lists.freedesktop.org/archives/amd-gfx/2019-June/034946.html=
</a>)
However, applying this to v5.2-rc4 does not solve the issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602499741.b5FaD0d9.10601--

--===============0416324745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0416324745==--
