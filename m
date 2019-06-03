Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D33385E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 20:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6E89339;
	Mon,  3 Jun 2019 18:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 239A98930F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 18:41:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1D2DB72167; Mon,  3 Jun 2019 18:41:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110777] Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)
Date: Mon, 03 Jun 2019 18:41:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: antonh@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110777-502-zq3FsQMUb9@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110777-502@http.bugs.freedesktop.org/>
References: <bug-110777-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0613523189=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0613523189==
Content-Type: multipart/alternative; boundary="15595872930.fF6FBE273.26947"
Content-Transfer-Encoding: 7bit


--15595872930.fF6FBE273.26947
Date: Mon, 3 Jun 2019 18:41:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110777

--- Comment #2 from antonh@gmx.de ---
The issue is fully fixed on kernel master (currently I am using commit
460b48a0fefce25beb0fc0139e721c5691d65d7f) when reverting
drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c back to the state it was
around kernel 5.0.13.

https://git.archlinux.org/linux.git/tree/drivers/gpu/drm/amd/powerplay/hwmg=
r/vega10_hwmgr.c?h=3Dv5.0.13-arch1

I will start bisecting soon to figure out the exact commit that has caused =
the
issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595872930.fF6FBE273.26947
Date: Mon, 3 Jun 2019 18:41:33 +0000
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
   title=3D"NEW - Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110777#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110777">bug 11077=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
antonh&#64;gmx.de" title=3D"antonh&#64;gmx.de">antonh&#64;gmx.de</a>
</span></b>
        <pre>The issue is fully fixed on kernel master (currently I am usin=
g commit
460b48a0fefce25beb0fc0139e721c5691d65d7f) when reverting
drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c back to the state it was
around kernel 5.0.13.

<a href=3D"https://git.archlinux.org/linux.git/tree/drivers/gpu/drm/amd/pow=
erplay/hwmgr/vega10_hwmgr.c?h=3Dv5.0.13-arch1">https://git.archlinux.org/li=
nux.git/tree/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c?h=3Dv5.0.13=
-arch1</a>

I will start bisecting soon to figure out the exact commit that has caused =
the
issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595872930.fF6FBE273.26947--

--===============0613523189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0613523189==--
