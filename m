Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50AE6521F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 08:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEEC89F43;
	Thu, 11 Jul 2019 06:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D82A389F43
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 06:55:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CE27E72167; Thu, 11 Jul 2019 06:55:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111103] [Patch] to compile amdgpu-dkms 19.20 on debian stretch
 & buster
Date: Thu, 11 Jul 2019 06:55:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabstz-it@yahoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111103-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1802522875=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1802522875==
Content-Type: multipart/alternative; boundary="15628281550.aE1E71B.12921"
Content-Transfer-Encoding: 7bit


--15628281550.aE1E71B.12921
Date: Thu, 11 Jul 2019 06:55:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111103

            Bug ID: 111103
           Summary: [Patch] to compile amdgpu-dkms 19.20 on debian stretch
                    & buster
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: fabstz-it@yahoo.fr

Created attachment 144757
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144757&action=3Dedit
[Patch] to compile amdgpu-dkms 19.20 on debian stretch & buster

Hello,

Please find attached a patch so that one can compile the amdgpu-dkms 19.20
driver toward kernel 4.19 on debian stretch (with stretch-backports), and a=
lso
on debian buster (version 10) which runs linux-4.19

The patch is made of:
 - a change to the Makefile so that it can compile well on debian and find =
the
kernel version (using [make kernelversion])
 - a few changes to the code in file amdgpu_mn.c

Appearently, in 19.20 there are still some problems to compile towards 4.19
because some #ifdef don't seem correct because "mmu_notifier_range" doesn't
exist in 4.19.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15628281550.aE1E71B.12921
Date: Thu, 11 Jul 2019 06:55:55 +0000
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
   title=3D"NEW - [Patch] to compile amdgpu-dkms 19.20 on debian stretch &a=
mp; buster"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111103">111103</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Patch] to compile amdgpu-dkms 19.20 on debian stretch &amp; =
buster
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>normal
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
          <td>fabstz-it&#64;yahoo.fr
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144757=
" name=3D"attach_144757" title=3D"[Patch] to compile amdgpu-dkms 19.20 on d=
ebian stretch &amp; buster">attachment 144757</a> <a href=3D"attachment.cgi=
?id=3D144757&amp;action=3Dedit" title=3D"[Patch] to compile amdgpu-dkms 19.=
20 on debian stretch &amp; buster">[details]</a></span> <a href=3D'page.cgi=
?id=3Dsplinter.html&amp;bug=3D111103&amp;attachment=3D144757'>[review]</a>
[Patch] to compile amdgpu-dkms 19.20 on debian stretch &amp; buster

Hello,

Please find attached a patch so that one can compile the amdgpu-dkms 19.20
driver toward kernel 4.19 on debian stretch (with stretch-backports), and a=
lso
on debian buster (version 10) which runs linux-4.19

The patch is made of:
 - a change to the Makefile so that it can compile well on debian and find =
the
kernel version (using [make kernelversion])
 - a few changes to the code in file amdgpu_mn.c

Appearently, in 19.20 there are still some problems to compile towards 4.19
because some #ifdef don't seem correct because &quot;mmu_notifier_range&quo=
t; doesn't
exist in 4.19.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15628281550.aE1E71B.12921--

--===============1802522875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1802522875==--
