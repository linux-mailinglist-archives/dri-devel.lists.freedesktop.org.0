Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190FD28ECD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 03:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7036E02D;
	Fri, 24 May 2019 01:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 861A76E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:29:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B3E472167; Fri, 24 May 2019 01:29:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110749] [Vega 11] [amdgpu retry page fault
 VM_L2_PROTECTION_FAULT_STATUS] System lock up during playing Steam version of
 Saints Row 3
Date: Fri, 24 May 2019 01:29:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: evvke@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110749-502-B72tmFPT3S@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110749-502@http.bugs.freedesktop.org/>
References: <bug-110749-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1910623225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1910623225==
Content-Type: multipart/alternative; boundary="15586613820.DC60365.3067"
Content-Transfer-Encoding: 7bit


--15586613820.DC60365.3067
Date: Fri, 24 May 2019 01:29:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110749

--- Comment #1 from Cyrax <evvke@hotmail.com> ---
OS : Arch Linux with linux-next-git kernel
https://aur.archlinux.org/packages/linux-next-git

With latest libdrm-git, mesa-git and llvm-git packages installed.

local/linux-next-git 20190523.r0.gf48b97e163b3-1
    The Linux-next-git kernel and modules
local/linux-next-git-headers 20190523.r0.gf48b97e163b3-1
    Header files and scripts for building modules for Linux-next-git kernel

local/lib32-libdrm-git 2.4.98.r16.g922d9299-2
    Userspace interface to kernel DRM services, git 32-bit version
local/libdrm-git 2.4.98.r16.g922d9299-1
    Userspace interface to kernel DRM services, master git version

local/lib32-llvm-git 9.0.0_r317246.30905a375ea-1
    Collection of modular and reusable compiler and toolchain technologies
(32-bit, git)
local/lib32-llvm-libs-git 9.0.0_r317246.30905a375ea-1
    Collection of modular and reusable compiler and toolchain technologies
(32-bit, git)
local/llvm-git 9.0.0_r317246.30905a375ea-1
    LLVM development version. includes clang and many other tools
local/llvm-libs-git 9.0.0_r317246.30905a375ea-1
    runtime libraries for llvm-git

local/lib32-mesa-git 19.2.0_devel.111192.8d386e6eef8-1
    an open-source implementation of the OpenGL specification, git version
local/mesa-git 19.2.0_devel.111192.8d386e6eef8-1
    an open-source implementation of the OpenGL specification, git version

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586613820.DC60365.3067
Date: Fri, 24 May 2019 01:29:42 +0000
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
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749">bug 11074=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
evvke&#64;hotmail.com" title=3D"Cyrax &lt;evvke&#64;hotmail.com&gt;"> <span=
 class=3D"fn">Cyrax</span></a>
</span></b>
        <pre>OS : Arch Linux with linux-next-git kernel
<a href=3D"https://aur.archlinux.org/packages/linux-next-git">https://aur.a=
rchlinux.org/packages/linux-next-git</a>

With latest libdrm-git, mesa-git and llvm-git packages installed.

local/linux-next-git 20190523.r0.gf48b97e163b3-1
    The Linux-next-git kernel and modules
local/linux-next-git-headers 20190523.r0.gf48b97e163b3-1
    Header files and scripts for building modules for Linux-next-git kernel

local/lib32-libdrm-git 2.4.98.r16.g922d9299-2
    Userspace interface to kernel DRM services, git 32-bit version
local/libdrm-git 2.4.98.r16.g922d9299-1
    Userspace interface to kernel DRM services, master git version

local/lib32-llvm-git 9.0.0_r317246.30905a375ea-1
    Collection of modular and reusable compiler and toolchain technologies
(32-bit, git)
local/lib32-llvm-libs-git 9.0.0_r317246.30905a375ea-1
    Collection of modular and reusable compiler and toolchain technologies
(32-bit, git)
local/llvm-git 9.0.0_r317246.30905a375ea-1
    LLVM development version. includes clang and many other tools
local/llvm-libs-git 9.0.0_r317246.30905a375ea-1
    runtime libraries for llvm-git

local/lib32-mesa-git 19.2.0_devel.111192.8d386e6eef8-1
    an open-source implementation of the OpenGL specification, git version
local/mesa-git 19.2.0_devel.111192.8d386e6eef8-1
    an open-source implementation of the OpenGL specification, git version<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586613820.DC60365.3067--

--===============1910623225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1910623225==--
