Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91FE59AE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 12:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886E66EC13;
	Sat, 26 Oct 2019 10:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 060006EC0F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 10:48:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 02C05720E2; Sat, 26 Oct 2019 10:48:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Sat, 26 Oct 2019 10:48:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: rafnews@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-7yDuxJux55@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0701508345=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0701508345==
Content-Type: multipart/alternative; boundary="15720869271.ff1e.3692"
Content-Transfer-Encoding: 7bit


--15720869271.ff1e.3692
Date: Sat, 26 Oct 2019 10:48:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #37 from Alain Roger <rafnews@gmail.com> ---
Hi I'm under KUbuntu 19.04 (KDE as environment) x64 and with AMD R7-560 usi=
ng
kernal 5.x (but also v4.9.x).

When i run the script for ubuntu 19.04, i got the following things:


dpkg-deb: building package 'amdgpu-core' in
'amdgpu-core_19.30-855429_all.no_ub_ver_chk.deb'.
dpkg-deb: building package 'amdgpu-pro-hwe' in
'amdgpu-pro-hwe_19.30-855429_amd64.no_ag-hwe_dep.deb'.
dpkg-deb: building package 'amdgpu-pro-lib32' in
'amdgpu-pro-lib32_19.30-855429_amd64.no_ag-hwe_and_ag-lib32_dep.deb'.
Creating local repository...
Installing OpenGL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
amdgpu-pro-hwe is already the newest version (19.30-855429).
amdgpu-pro-lib32 is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
dpkg: dependency problems prevent configuration of amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because the error message
indicates its a followup error from a previous failure.
                                 No apport report written because MaxReport=
s is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
               Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
Installing OpenCL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
clinfo-amdgpu-pro is already the newest version (19.30-855429).
opencl-amdgpu-pro-icd is already the newest version (19.30-855429).
opencl-orca-amdgpu-pro-icd:i386 is already the newest version (19.30-855429=
).
opencl-orca-amdgpu-pro-icd is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          dpkg: dependency problems prevent configuration of
amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because MaxReports is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
        Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
Installing Vulkan PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
vulkan-amdgpu-pro is already the newest version (19.30-855429).
vulkan-amdgpu-pro:i386 is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
dpkg: dependency problems prevent configuration of amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because the error message
indicates its a followup error from a previous failure.
                                 No apport report written because MaxReport=
s is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
               Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
All done, enjoy!
This script was prepared for you by Andrew Shark, the author of LinuxComp
Tutorial youtube channel. If you liked it, please let me know =3D)




Since, computer is very slow to display browser HTML5 games as also to run
Resolve 16.

I need to have AMD drivers working as i need to use Resolve (as alternative=
 to
After Effect under linux). On my laptop i have NVidia with a 7 years old
graphic card and Resolve works, so it's clearly an AMD driver issue. That's=
 why
your work and help is very useful for all AMD users :D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720869271.ff1e.3692
Date: Sat, 26 Oct 2019 10:48:47 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rafnews&#64;gmail.com" title=3D"Alain Roger &lt;rafnews&#64;gmail.com&gt;">=
 <span class=3D"fn">Alain Roger</span></a>
</span></b>
        <pre>Hi I'm under KUbuntu 19.04 (KDE as environment) x64 and with A=
MD R7-560 using
kernal 5.x (but also v4.9.x).

When i run the script for ubuntu 19.04, i got the following things:


dpkg-deb: building package 'amdgpu-core' in
'amdgpu-core_19.30-855429_all.no_ub_ver_chk.deb'.
dpkg-deb: building package 'amdgpu-pro-hwe' in
'amdgpu-pro-hwe_19.30-855429_amd64.no_ag-hwe_dep.deb'.
dpkg-deb: building package 'amdgpu-pro-lib32' in
'amdgpu-pro-lib32_19.30-855429_amd64.no_ag-hwe_and_ag-lib32_dep.deb'.
Creating local repository...
Installing OpenGL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
amdgpu-pro-hwe is already the newest version (19.30-855429).
amdgpu-pro-lib32 is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
dpkg: dependency problems prevent configuration of amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because the error message
indicates its a followup error from a previous failure.
                                 No apport report written because MaxReport=
s is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
               Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
Installing OpenCL PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
clinfo-amdgpu-pro is already the newest version (19.30-855429).
opencl-amdgpu-pro-icd is already the newest version (19.30-855429).
opencl-orca-amdgpu-pro-icd:i386 is already the newest version (19.30-855429=
).
opencl-orca-amdgpu-pro-icd is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          dpkg: dependency problems prevent configuration of
amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because MaxReports is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
        Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
Installing Vulkan PRO...
Reading package lists... Done
Building dependency tree=20=20=20=20=20=20=20
Reading state information... Done
vulkan-amdgpu-pro is already the newest version (19.30-855429).
vulkan-amdgpu-pro:i386 is already the newest version (19.30-855429).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
4 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up amdgpu-dkms (19.30-855429) ...
Removing old amdgpu-19.30-855429 DKMS files...

------------------------------
Deleting module version: 19.30-855429
completely from the DKMS tree.
------------------------------
Done.
Loading new amdgpu-19.30-855429 DKMS files...
Building for 5.3.7-050307-generic
Building for architecture x86_64
Building initial module for 5.3.7-050307-generic
ERROR (dkms apport): kernel package linux-headers-5.3.7-050307-generic is n=
ot
supported
Error! Bad return status for module build on kernel: 5.3.7-050307-generic
(x86_64)
Consult /var/lib/dkms/amdgpu/19.30-855429/build/make.log for more informati=
on.
dpkg: error processing package amdgpu-dkms (--configure):
 installed amdgpu-dkms package post-installation script subprocess returned
error exit status 10
dpkg: dependency problems prevent configuration of amdgpu-hwe:
 amdgpu-hwe depends on amdgpu-dkms (=3D 19.30-855429); however:
  Package amdgpu-dkms is not configured yet.

dpkg: error processing package amdgpu-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:
 amdgpu-pro-hwe depends on amdgpu-hwe (=3D 19.30-855429); however:
  Package amdgpu-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-hwe (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.30-855429) | amdgpu-pro-hwe=
 (=3D
19.30-855429); however:
  Package amdgpu-pro is not installed.
  Package amdgpu-pro-hwe is not configured yet.

dpkg: error processing package amdgpu-pro-lib32 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup
error from a previous failure.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                          No apport report written because the error message
indicates its a followup error from a previous failure.
                                 No apport report written because MaxReport=
s is
reached already
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
               Errors were encountered while processing:
 amdgpu-dkms
 amdgpu-hwe
 amdgpu-pro-hwe
 amdgpu-pro-lib32
E: Sub-process /usr/bin/dpkg returned an error code (1)
All done, enjoy!
This script was prepared for you by Andrew Shark, the author of LinuxComp
Tutorial youtube channel. If you liked it, please let me know =3D)




Since, computer is very slow to display browser HTML5 games as also to run
Resolve 16.

I need to have AMD drivers working as i need to use Resolve (as alternative=
 to
After Effect under linux). On my laptop i have NVidia with a 7 years old
graphic card and Resolve works, so it's clearly an AMD driver issue. That's=
 why
your work and help is very useful for all AMD users :D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720869271.ff1e.3692--

--===============0701508345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0701508345==--
