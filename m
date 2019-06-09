Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BDE3A5EB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 15:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9A89170;
	Sun,  9 Jun 2019 13:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2E1D89170
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 13:29:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AA13C72167; Sun,  9 Jun 2019 13:29:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110866] Revert 8059add0478e29cb641936011a8fcc9ce9fd80be for
 stable 5.1.x
Date: Sun, 09 Jun 2019 13:29:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrndda@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 bug_file_loc op_sys bug_status bug_severity priority component assigned_to
 reporter
Message-ID: <bug-110866-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1378256961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1378256961==
Content-Type: multipart/alternative; boundary="15600869780.3fa62.14689"
Content-Transfer-Encoding: 7bit


--15600869780.3fa62.14689
Date: Sun, 9 Jun 2019 13:29:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110866

            Bug ID: 110866
           Summary: Revert 8059add0478e29cb641936011a8fcc9ce9fd80be for
                    stable 5.1.x
           Product: DRI
           Version: unspecified
          Hardware: Other
               URL: https://bugzilla.kernel.org/show_bug.cgi?id=3D203679
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: nrndda@gmail.com

Kernel 5.0 marked as EOL and 5.1 is broken for RADV VR on Steam.
Copy of description from kernel bugzilla:
Original commit 8059add0478e29cb641936011a8fcc9ce9fd80be
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
drivers/gpu/drm/drm_ioctl.c?id=3D8059add0478e29cb641936011a8fcc9ce9fd80be)
was added in 5.1 merge cycle and reverted by
dbb92471674a48892f5e50779425e03388073ab9
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Ddbb92471674a48892f5e50779425e03388073ab9)
in 5.2. So radv is still broken in 5.1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15600869780.3fa62.14689
Date: Sun, 9 Jun 2019 13:29:38 +0000
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
   title=3D"NEW - Revert 8059add0478e29cb641936011a8fcc9ce9fd80be for stabl=
e 5.1.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110866">110866</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Revert 8059add0478e29cb641936011a8fcc9ce9fd80be for stable 5.=
1.x
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
          <th>URL</th>
          <td>https://bugzilla.kernel.org/show_bug.cgi?id=3D203679
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
          <td>nrndda&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kernel 5.0 marked as EOL and 5.1 is broken for RADV VR on Stea=
m.
Copy of description from kernel bugzilla:
Original commit 8059add0478e29cb641936011a8fcc9ce9fd80be
(<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/drivers/gpu/drm/drm_ioctl.c?id=3D8059add0478e29cb641936011a8fcc9=
ce9fd80be">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/drivers/gpu/drm/drm_ioctl.c?id=3D8059add0478e29cb641936011a8fcc9c=
e9fd80be</a>)
was added in 5.1 merge cycle and reverted by
dbb92471674a48892f5e50779425e03388073ab9
(<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Ddbb92471674a48892f5e50779425e03388073ab9">https://git.kern=
el.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Ddbb92471674=
a48892f5e50779425e03388073ab9</a>)
in 5.2. So radv is still broken in 5.1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15600869780.3fa62.14689--

--===============1378256961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1378256961==--
