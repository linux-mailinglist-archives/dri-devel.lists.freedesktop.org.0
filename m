Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47058B1B9D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 12:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB536EF0B;
	Fri, 13 Sep 2019 10:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C59F6EF0B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 10:39:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 234E672167; Fri, 13 Sep 2019 10:39:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111682] use-after-free in amdgpu_vm_update_directories
Date: Fri, 13 Sep 2019 10:39:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111682-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0164694040=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0164694040==
Content-Type: multipart/alternative; boundary="15683711400.bF751C.13940"
Content-Transfer-Encoding: 7bit


--15683711400.bF751C.13940
Date: Fri, 13 Sep 2019 10:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111682

            Bug ID: 111682
           Summary: use-after-free in amdgpu_vm_update_directories
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pierre-eric.pelloux-prayer@amd.com

Created attachment 145345
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145345&action=3Dedit
dmesg output

When using amdgpu.vm_update_mode=3D3 the following error appears after some=
 time
(ranging from a few minutes to a few hours):

BUG: KASAN: use-after-free in amdgpu_vm_update_directories

I attached the relevant dmesg part.

Notes:
- happens on Navi10 and gfx9 (probably also on other cards but I didn't try)
- reproduced on 865b4ca43816e113996c3be571d4998b6daf5f1 and
20d6b9c3b7f40ec427af912d140f2be0de098d2d

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683711400.bF751C.13940
Date: Fri, 13 Sep 2019 10:39:00 +0000
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
   title=3D"NEW - use-after-free in amdgpu_vm_update_directories"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111682">111682</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>use-after-free in amdgpu_vm_update_directories
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>not set
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
          <td>pierre-eric.pelloux-prayer&#64;amd.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145345=
" name=3D"attach_145345" title=3D"dmesg output">attachment 145345</a> <a hr=
ef=3D"attachment.cgi?id=3D145345&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

When using amdgpu.vm_update_mode=3D3 the following error appears after some=
 time
(ranging from a few minutes to a few hours):

BUG: KASAN: use-after-free in amdgpu_vm_update_directories

I attached the relevant dmesg part.

Notes:
- happens on Navi10 and gfx9 (probably also on other cards but I didn't try)
- reproduced on 865b4ca43816e113996c3be571d4998b6daf5f1 and
20d6b9c3b7f40ec427af912d140f2be0de098d2d</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683711400.bF751C.13940--

--===============0164694040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0164694040==--
