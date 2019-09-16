Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33DB37E4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 12:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22C892CD;
	Mon, 16 Sep 2019 10:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAECC892CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:17:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D288472167; Mon, 16 Sep 2019 10:17:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111691] hardware cursor corruption w/ AMD 5700 XT
Date: Mon, 16 Sep 2019 10:17:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: a@bailtree.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111691-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1164830098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1164830098==
Content-Type: multipart/alternative; boundary="15686290400.DBF3ae0E.12118"
Content-Transfer-Encoding: 7bit


--15686290400.DBF3ae0E.12118
Date: Mon, 16 Sep 2019 10:17:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111691

            Bug ID: 111691
           Summary: hardware cursor corruption w/ AMD 5700 XT
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: a@bailtree.co.uk

Created attachment 145372
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145372&action=3Dedit
video of the cursors motion when moving the mouse at a reasonable speed

Overview: After updating kernel to 5.3rc + firmware from
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/ I am experiencin=
g a
very laggy and erratic cursor when using a Radeon 5700 XT

Steps to Reproduce: Use a navi10 card with the latest kernel and firmware.
Tried many desktop environments with both Xorg and Wayland

Build Date & Hardware: Built September 2019. AMD Radeon 5700 XT


Additional Builds and Platforms: Issue doesn't occur if I use a Radeon RX 5=
80
instead of the navi card and isn't triggered on Windows 7/10

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686290400.DBF3ae0E.12118
Date: Mon, 16 Sep 2019 10:17:20 +0000
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
   title=3D"NEW - hardware cursor corruption w/ AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691">111691</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>hardware cursor corruption w/ AMD 5700 XT
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
          <td>a&#64;bailtree.co.uk
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145372=
" name=3D"attach_145372" title=3D"video of the cursors motion when moving t=
he mouse at a reasonable speed">attachment 145372</a> <a href=3D"attachment=
.cgi?id=3D145372&amp;action=3Dedit" title=3D"video of the cursors motion wh=
en moving the mouse at a reasonable speed">[details]</a></span>
video of the cursors motion when moving the mouse at a reasonable speed

Overview: After updating kernel to 5.3rc + firmware from
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a> I am experiencin=
g a
very laggy and erratic cursor when using a Radeon 5700 XT

Steps to Reproduce: Use a navi10 card with the latest kernel and firmware.
Tried many desktop environments with both Xorg and Wayland

Build Date &amp; Hardware: Built September 2019. AMD Radeon 5700 XT


Additional Builds and Platforms: Issue doesn't occur if I use a Radeon RX 5=
80
instead of the navi card and isn't triggered on Windows 7/10</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686290400.DBF3ae0E.12118--

--===============1164830098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1164830098==--
