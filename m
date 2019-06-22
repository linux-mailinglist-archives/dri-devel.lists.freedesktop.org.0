Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0B4F345
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 04:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF1D6E94F;
	Sat, 22 Jun 2019 02:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3545D6E94F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 02:48:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2B44772167; Sat, 22 Jun 2019 02:48:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110961] Are provoded libdrm packages completely open source?
Date: Sat, 22 Jun 2019 02:48:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110961-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0877522379=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0877522379==
Content-Type: multipart/alternative; boundary="15611716890.50dbDD.28264"
Content-Transfer-Encoding: 7bit


--15611716890.50dbDD.28264
Date: Sat, 22 Jun 2019 02:48:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110961

            Bug ID: 110961
           Summary: Are provoded libdrm packages completely open source?
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ashark@linuxcomp.ru

19.20-812932 release for Ubuntu

Provided libdrm related packages have MIT licence. But are they built
completely from open source? In the changelog I can see that it is some
amd-mainline-hybrid-master20190125. And actually if I omit these packages w=
hile
using proprietay OpenGL, applications crashes; and clinfo utility crashes w=
ith
segfault. I tested it in Ubuntu 18.04.2, in Ubuntu 19.04 and in Arch Linux.=
 In
Ubuntu 19.04 the repo's libraries have the same version as provided in bund=
led
archive. But it was still failing with them (I even tried to place repo's
libraries to /opt location, it did not help).

I want to avoid needing of installation of these libdrm packages
(libdrm-amdgpu-amdgpu1, libdrm-amdgpu-common, libdrm2-amdgpu) because I am
repacking amdgpu-pro for arch linux. Is that possible?

If not, then why do not name these packages and their libraries with -pro
prefix?

Ideally, I want it to use libdrm provided by arch linux. In that case I cou=
ld
even repack all other files to the normal system paths instead of placing a=
ll
to /opt.

List of packages that I still use for Arch are:
libdrm-amdgpu-amdgpu1: provides libdrm_amdgpu.so.1.0.0
libdrm-amdgpu-common: provides amdgpu.ids file that slightly differs from
Arch's standard one
libdrm2-amdgpu: provides 91-amdgpu-pro-modeset.rules libdrm.so.2.4.0
libkms.so.1.0.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611716890.50dbDD.28264
Date: Sat, 22 Jun 2019 02:48:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Are provoded libdrm packages completely open source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961">110961</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Are provoded libdrm packages completely open source?
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu-pro
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ashark&#64;linuxcomp.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>19.20-812932 release for Ubuntu

Provided libdrm related packages have MIT licence. But are they built
completely from open source? In the changelog I can see that it is some
amd-mainline-hybrid-master20190125. And actually if I omit these packages w=
hile
using proprietay OpenGL, applications crashes; and clinfo utility crashes w=
ith
segfault. I tested it in Ubuntu 18.04.2, in Ubuntu 19.04 and in Arch Linux.=
 In
Ubuntu 19.04 the repo's libraries have the same version as provided in bund=
led
archive. But it was still failing with them (I even tried to place repo's
libraries to /opt location, it did not help).

I want to avoid needing of installation of these libdrm packages
(libdrm-amdgpu-amdgpu1, libdrm-amdgpu-common, libdrm2-amdgpu) because I am
repacking amdgpu-pro for arch linux. Is that possible?

If not, then why do not name these packages and their libraries with -pro
prefix?

Ideally, I want it to use libdrm provided by arch linux. In that case I cou=
ld
even repack all other files to the normal system paths instead of placing a=
ll
to /opt.

List of packages that I still use for Arch are:
libdrm-amdgpu-amdgpu1: provides libdrm_amdgpu.so.1.0.0
libdrm-amdgpu-common: provides amdgpu.ids file that slightly differs from
Arch's standard one
libdrm2-amdgpu: provides 91-amdgpu-pro-modeset.rules libdrm.so.2.4.0
libkms.so.1.0.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611716890.50dbDD.28264--

--===============0877522379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0877522379==--
