Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052811CD22
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 18:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0488891F4;
	Tue, 14 May 2019 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05901891F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:37:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 01F2A721CD; Tue, 14 May 2019 16:37:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110677] Can't invert screen colors by adjusting the gamma ramp
Date: Tue, 14 May 2019 16:37:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vladzzag@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110677-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0428597042=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0428597042==
Content-Type: multipart/alternative; boundary="15578518490.cFf9.3564"
Content-Transfer-Encoding: 7bit


--15578518490.cFf9.3564
Date: Tue, 14 May 2019 16:37:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110677

            Bug ID: 110677
           Summary: Can't invert screen colors by adjusting the gamma ramp
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: vladzzag@gmail.com

On X11, there are several ways KWin can invert screen colors: either by usi=
ng
an OpenGL-based effect, or by adjusting the gamma ramp. While the former
approach works well on most hardware, we experience some issues with the la=
tter
approach on AMD hardware.

After adjusting the gamma ramp, the screen is filled with mostly white colo=
r.

Steps to reproduce:
* Open System Settings, go to Shortcuts, select KWin component under Global
Shortcuts tab, assign custom shortcut to "Invert Screen Colors";
* Press the shortcut.

(or just use xcalib -i)

Observed results:
The screen is filled with mostly white color.

Expected results:
Inverted screen.

Hardware: Radeon RX 580
Mesa: 19.0.3
Linux: 5.0.13
xorg: 1.20.4

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578518490.cFf9.3564
Date: Tue, 14 May 2019 16:37:29 +0000
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
   title=3D"NEW - Can't invert screen colors by adjusting the gamma ramp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110677">110677</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Can't invert screen colors by adjusting the gamma ramp
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
          <td>vladzzag&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On X11, there are several ways KWin can invert screen colors: =
either by using
an OpenGL-based effect, or by adjusting the gamma ramp. While the former
approach works well on most hardware, we experience some issues with the la=
tter
approach on AMD hardware.

After adjusting the gamma ramp, the screen is filled with mostly white colo=
r.

Steps to reproduce:
* Open System Settings, go to Shortcuts, select KWin component under Global
Shortcuts tab, assign custom shortcut to &quot;Invert Screen Colors&quot;;
* Press the shortcut.

(or just use xcalib -i)

Observed results:
The screen is filled with mostly white color.

Expected results:
Inverted screen.

Hardware: Radeon RX 580
Mesa: 19.0.3
Linux: 5.0.13
xorg: 1.20.4</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578518490.cFf9.3564--

--===============0428597042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0428597042==--
