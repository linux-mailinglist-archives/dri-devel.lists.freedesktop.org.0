Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38251AF0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 20:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7464389D99;
	Mon, 24 Jun 2019 18:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4E6089D99
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 18:48:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DC4FF72167; Mon, 24 Jun 2019 18:48:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110984] Vulkan shows stuttering issues on Vega 10 w/
 gnome-shell on Wayland
Date: Mon, 24 Jun 2019 18:48:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: lyude@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110984-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1268989426=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1268989426==
Content-Type: multipart/alternative; boundary="15614020860.9e25b4E.24908"
Content-Transfer-Encoding: 7bit


--15614020860.9e25b4E.24908
Date: Mon, 24 Jun 2019 18:48:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110984

            Bug ID: 110984
           Summary: Vulkan shows stuttering issues on Vega 10 w/
                    gnome-shell on Wayland
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: lyude@redhat.com

When testing the latest kernel from drm-tip (as of writing, this is
294d5056c1f3 ("drm-tip: 2019y-06m-24d-17h-20m-57s UTC integration manifest"=
) ),
running vulkan-cube on a gnome-shell wayland session (so, since vulkan-cube
doesn't support native wayland this means it's running through Xwayland) sh=
ows
pretty significant stuttering issues. See the video here for what it looks
like:

https://people.freedesktop.org/~lyudess/archive/06-24-2019/VID_20190624_140=
614.mp4

This was reproduced with a Vega 10 Pro SSG:

26:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Vega 10 XT [Radeon PRO SSG] [1002:6862]

Mesa version: 19.0.6-1.fc30
gnome-shell version: 3.32.2-2.fc30
Xwayland version: 1.20.4-3.fc30

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614020860.9e25b4E.24908
Date: Mon, 24 Jun 2019 18:48:06 +0000
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
   title=3D"NEW - Vulkan shows stuttering issues on Vega 10 w/ gnome-shell =
on Wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110984">110984</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Vulkan shows stuttering issues on Vega 10 w/ gnome-shell on W=
ayland
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
          <td>lyude&#64;redhat.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When testing the latest kernel from drm-tip (as of writing, th=
is is
294d5056c1f3 (&quot;drm-tip: 2019y-06m-24d-17h-20m-57s UTC integration mani=
fest&quot;) ),
running vulkan-cube on a gnome-shell wayland session (so, since vulkan-cube
doesn't support native wayland this means it's running through Xwayland) sh=
ows
pretty significant stuttering issues. See the video here for what it looks
like:

<a href=3D"https://people.freedesktop.org/~lyudess/archive/06-24-2019/VID_2=
0190624_140614.mp4">https://people.freedesktop.org/~lyudess/archive/06-24-2=
019/VID_20190624_140614.mp4</a>

This was reproduced with a Vega 10 Pro SSG:

26:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Vega 10 XT [Radeon PRO SSG] [1002:6862]

Mesa version: 19.0.6-1.fc30
gnome-shell version: 3.32.2-2.fc30
Xwayland version: 1.20.4-3.fc30</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614020860.9e25b4E.24908--

--===============1268989426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1268989426==--
