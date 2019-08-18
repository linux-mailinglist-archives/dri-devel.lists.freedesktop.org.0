Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13991494
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 06:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2535D6E0A2;
	Sun, 18 Aug 2019 04:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAE026E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 04:36:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DEC7972161; Sun, 18 Aug 2019 04:36:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111415] BUG: kernel NULL pointer dereference - supervisor read
 access in kernel mode
Date: Sun, 18 Aug 2019 04:36:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tseewald@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111415-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1456764834=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1456764834==
Content-Type: multipart/alternative; boundary="15661029990.FfDd68.21853"
Content-Transfer-Encoding: 7bit


--15661029990.FfDd68.21853
Date: Sun, 18 Aug 2019 04:36:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111415

            Bug ID: 111415
           Summary: BUG: kernel NULL pointer dereference - supervisor read
                    access in kernel mode
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: tseewald@gmail.com

Created attachment 145088
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145088&action=3Dedit
dmesg of freeze

Distribution: Fedora 30
Kernel: 5.2.8
Mesa: 19.1.4
GPU: RX 560

Problem:
While browsing the internet using Chromium my entire machine froze, it was
completely unresponsive to input but audio continued to play.


Snippet of BUG:

[173497.820810] BUG: kernel NULL pointer dereference, address: 000000000000=
02b4
[173497.820815] #PF: supervisor read access in kernel mode
[173497.820817] #PF: error_code(0x0000) - not-present page
[173497.820818] PGD 0 P4D 0=20
[173497.820822] Oops: 0000 [#1] SMP PTI
[173497.820825] CPU: 2 PID: 21197 Comm: kworker/u8:2 Not tainted
5.2.8-200.fc30.x86_64 #1
[173497.820826] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./Z77 Extreme4, BIOS P2.90 07/11/2013
[173497.820839] Workqueue: events_unbound commit_work [drm_kms_helper]
[173497.820953] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]

See attached dmesg for full message.

Let me know if you need any additional information.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15661029990.FfDd68.21853
Date: Sun, 18 Aug 2019 04:36:39 +0000
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
   title=3D"NEW - BUG: kernel NULL pointer dereference - supervisor read ac=
cess in kernel mode"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111415">111415</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: kernel NULL pointer dereference - supervisor read access=
 in kernel mode
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
          <td>medium
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
          <td>tseewald&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145088=
" name=3D"attach_145088" title=3D"dmesg of freeze">attachment 145088</a> <a=
 href=3D"attachment.cgi?id=3D145088&amp;action=3Dedit" title=3D"dmesg of fr=
eeze">[details]</a></span>
dmesg of freeze

Distribution: Fedora 30
Kernel: 5.2.8
Mesa: 19.1.4
GPU: RX 560

Problem:
While browsing the internet using Chromium my entire machine froze, it was
completely unresponsive to input but audio continued to play.


Snippet of BUG:

[173497.820810] BUG: kernel NULL pointer dereference, address: 000000000000=
02b4
[173497.820815] #PF: supervisor read access in kernel mode
[173497.820817] #PF: error_code(0x0000) - not-present page
[173497.820818] PGD 0 P4D 0=20
[173497.820822] Oops: 0000 [#1] SMP PTI
[173497.820825] CPU: 2 PID: 21197 Comm: kworker/u8:2 Not tainted
5.2.8-200.fc30.x86_64 #1
[173497.820826] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./Z77 Extreme4, BIOS P2.90 07/11/2013
[173497.820839] Workqueue: events_unbound commit_work [drm_kms_helper]
[173497.820953] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]

See attached dmesg for full message.

Let me know if you need any additional information.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15661029990.FfDd68.21853--

--===============1456764834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1456764834==--
