Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41EB2ACA
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 11:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98836F4FA;
	Sat, 14 Sep 2019 09:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 605066F4F7
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 09:18:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 56E9772167; Sat, 14 Sep 2019 09:18:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111685] [Polaris 30] [Bisected] Kernel BUG during boot when
 amdgpu.dpm=0
Date: Sat, 14 Sep 2019 09:18:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: omar.squircleart@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111685-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1808776502=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1808776502==
Content-Type: multipart/alternative; boundary="15684527050.565eb.26920"
Content-Transfer-Encoding: 7bit


--15684527050.565eb.26920
Date: Sat, 14 Sep 2019 09:18:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111685

            Bug ID: 111685
           Summary: [Polaris 30] [Bisected] Kernel BUG during boot when
                    amdgpu.dpm=3D0
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: omar.squircleart@gmail.com

Created attachment 145359
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145359&action=3Dedit
Bisect log

To reproduce, pass the parameter amdgpu.dpm=3D0 to a kernel v5.2 or higher.=
 The
kernel will hang at boot. v5.1 boots correctly.

I have bisected the kernel between v5.1 and v5.2, the bisect log is attached
below.

The last three lines from the log are as follow, the full log is attached
below:

kernel: BUG: unable to handle page fault for address: ffff91fe41bdf5f8
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15684527050.565eb.26920
Date: Sat, 14 Sep 2019 09:18:25 +0000
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
   title=3D"NEW - [Polaris 30] [Bisected] Kernel BUG during boot when amdgp=
u.dpm=3D0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111685">111685</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Polaris 30] [Bisected] Kernel BUG during boot when amdgpu.dp=
m=3D0
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>omar.squircleart&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145359=
" name=3D"attach_145359" title=3D"Bisect log">attachment 145359</a> <a href=
=3D"attachment.cgi?id=3D145359&amp;action=3Dedit" title=3D"Bisect log">[det=
ails]</a></span>
Bisect log

To reproduce, pass the parameter amdgpu.dpm=3D0 to a kernel v5.2 or higher.=
 The
kernel will hang at boot. v5.1 boots correctly.

I have bisected the kernel between v5.1 and v5.2, the bisect log is attached
below.

The last three lines from the log are as follow, the full log is attached
below:

kernel: BUG: unable to handle page fault for address: ffff91fe41bdf5f8
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15684527050.565eb.26920--

--===============1808776502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1808776502==--
