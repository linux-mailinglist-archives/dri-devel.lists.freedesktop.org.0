Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F49DDB0F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 22:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBD89CE3;
	Sat, 19 Oct 2019 20:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29D5989D2E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 20:57:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 26CDD720E2; Sat, 19 Oct 2019 20:57:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 19 Oct 2019 20:57:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jeremy.attali@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-c1QGa1FSdH@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0248601716=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0248601716==
Content-Type: multipart/alternative; boundary="15715186652.E86C2E69.1790"
Content-Transfer-Encoding: 7bit


--15715186652.E86C2E69.1790
Date: Sat, 19 Oct 2019 20:57:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #111 from Jeremy Attali <jeremy.attali@gmail.com> ---
I confirm I'm also still getting some hangs from time to time. Mostly I thi=
nk
after a resume from Suspend.


pacman -Q linux linux-firmware {,lib32-}{mesa-git,vulkan-radeon-git,libdrm}

linux 5.3.6.arch1-1
linux-firmware 20190923.417a9c6-1
mesa-git 1:19.3.0_devel.116317.268e0e01f37-1
vulkan-radeon-git 1:19.3.0_devel.116317.268e0e01f37-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.116317.268e0e01f37-1
lib32-vulkan-radeon-git 1:19.3.0_devel.116317.268e0e01f37-1
lib32-libdrm 2.4.99-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715186652.E86C2E69.1790
Date: Sat, 19 Oct 2019 20:57:45 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c111">Comm=
ent # 111</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy.attali&#64;gmail.com" title=3D"Jeremy Attali &lt;jeremy.attali&#64;g=
mail.com&gt;"> <span class=3D"fn">Jeremy Attali</span></a>
</span></b>
        <pre>I confirm I'm also still getting some hangs from time to time.=
 Mostly I think
after a resume from Suspend.


pacman -Q linux linux-firmware {,lib32-}{mesa-git,vulkan-radeon-git,libdrm}

linux 5.3.6.arch1-1
linux-firmware 20190923.417a9c6-1
mesa-git 1:19.3.0_devel.116317.268e0e01f37-1
vulkan-radeon-git 1:19.3.0_devel.116317.268e0e01f37-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.116317.268e0e01f37-1
lib32-vulkan-radeon-git 1:19.3.0_devel.116317.268e0e01f37-1
lib32-libdrm 2.4.99-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715186652.E86C2E69.1790--

--===============0248601716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0248601716==--
