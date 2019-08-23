Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8759A8FA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697036EBCC;
	Fri, 23 Aug 2019 07:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 990686EBCC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:37:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 951DC72161; Fri, 23 Aug 2019 07:37:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Fri, 23 Aug 2019 07:37:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ubuntu@technic.sk
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-wl9IF0wAsi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0374046623=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0374046623==
Content-Type: multipart/alternative; boundary="15665458291.C3601E750.1349"
Content-Transfer-Encoding: 7bit


--15665458291.C3601E750.1349
Date: Fri, 23 Aug 2019 07:37:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #32 from Tomas <ubuntu@technic.sk> ---
Hi,

I have applied the patch to drivers amdgpu-pro-19.30-855429-ubuntu-18.04, a=
nd
something is wrong. The process doesn't find as seems some components?
See output i got on the cli. Have I overlooked something?

$ ./install-amdgpu-pro-19.30-855429-on-ubuntu19.04-v06.sh=20
dpkg-deb: building package 'amdgpu-core' in
'amdgpu-core_19.30-855429_all.no_ub_ver_chk.deb'.
dpkg-deb: building package 'amdgpu-pro-hwe' in
'amdgpu-pro-hwe_19.30-855429_amd64.no_ag-hwe_dep.deb'.
dpkg-deb: building package 'amdgpu-pro-lib32' in
'amdgpu-pro-lib32_19.30-855429_amd64.no_ag-hwe_and_ag-lib32_dep.deb'.
Creating local repository...
Installing OpenGL PRO...
[sudo] password for user:=20
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package amdgpu-pro-hwe
E: Unable to locate package amdgpu-pro-lib32
Installing OpenCL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package clinfo-amdgpu-pro
E: Unable to locate package opencl-orca-amdgpu-pro-icd
E: Unable to locate package opencl-orca-amdgpu-pro-icd:i386
E: Unable to locate package opencl-amdgpu-pro-icd
Installing Vulkan PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package vulkan-amdgpu-pro
E: Unable to locate package vulkan-amdgpu-pro:i386
All done, enjoy!
This script was prepared for you by Andrew Shark, the author of LinuxComp
Tutorial youtube channel. If you liked it, please let me know =3D)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15665458291.C3601E750.1349
Date: Fri, 23 Aug 2019 07:37:09 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ubuntu&#64;technic.sk" title=3D"Tomas &lt;ubuntu&#64;technic.sk&gt;"> <span=
 class=3D"fn">Tomas</span></a>
</span></b>
        <pre>Hi,

I have applied the patch to drivers amdgpu-pro-19.30-855429-ubuntu-18.04, a=
nd
something is wrong. The process doesn't find as seems some components?
See output i got on the cli. Have I overlooked something?

$ ./install-amdgpu-pro-19.30-855429-on-ubuntu19.04-v06.sh=20
dpkg-deb: building package 'amdgpu-core' in
'amdgpu-core_19.30-855429_all.no_ub_ver_chk.deb'.
dpkg-deb: building package 'amdgpu-pro-hwe' in
'amdgpu-pro-hwe_19.30-855429_amd64.no_ag-hwe_dep.deb'.
dpkg-deb: building package 'amdgpu-pro-lib32' in
'amdgpu-pro-lib32_19.30-855429_amd64.no_ag-hwe_and_ag-lib32_dep.deb'.
Creating local repository...
Installing OpenGL PRO...
[sudo] password for user:=20
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package amdgpu-pro-hwe
E: Unable to locate package amdgpu-pro-lib32
Installing OpenCL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package clinfo-amdgpu-pro
E: Unable to locate package opencl-orca-amdgpu-pro-icd
E: Unable to locate package opencl-orca-amdgpu-pro-icd:i386
E: Unable to locate package opencl-amdgpu-pro-icd
Installing Vulkan PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
E: Unable to locate package vulkan-amdgpu-pro
E: Unable to locate package vulkan-amdgpu-pro:i386
All done, enjoy!
This script was prepared for you by Andrew Shark, the author of LinuxComp
Tutorial youtube channel. If you liked it, please let me know =3D)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15665458291.C3601E750.1349--

--===============0374046623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0374046623==--
