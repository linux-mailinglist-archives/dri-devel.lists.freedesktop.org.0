Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E3E7081
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 12:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E5E6E0C6;
	Mon, 28 Oct 2019 11:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B90BF6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 11:37:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A70FB720E2; Mon, 28 Oct 2019 11:37:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112148] Broken colors on RX 5700 with adjusted brightness
Date: Mon, 28 Oct 2019 11:37:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mlichvar@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112148-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0854835676=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0854835676==
Content-Type: multipart/alternative; boundary="15722626230.C2bC.15882"
Content-Transfer-Encoding: 7bit


--15722626230.C2bC.15882
Date: Mon, 28 Oct 2019 11:37:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112148

            Bug ID: 112148
           Summary: Broken colors on RX 5700 with adjusted brightness
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mlichvar@redhat.com

I have an RX 5700 card connected to a monitor which doesn't display dark co=
lors
very well. The brightness needs to be adjusted in software. I use the xcalib
tool like this:

xcalib -c
xcalib -a -b 10 -co 90

This displays dark colors well, but some images/videos have weird artifacts.
After playing with a color picker it looks like colors that have the green
component zero are much brighter than they should be. For example, color
#750000 is much brighter than #750100. I'll attach some images that show the
problem.

When the monitor is connected to a different computer (with a non-AMD GPU)
configured with the same xcalib commands, the problem disappears, so it see=
ms
to be specific to the hardware/driver.

Please let me know if you need more information.

Installed packages:
kernel-5.3.6-300.fc31.x86_64
xorg-x11-server-Xorg-1.20.5-7.fc31.x86_64
xorg-x11-drv-amdgpu-19.1.0-1.fc31.x86_64
mesa-dri-drivers-19.2.0-1.fc31.x86_64
xcalib-0.8-24.fc31.x86_64

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722626230.C2bC.15882
Date: Mon, 28 Oct 2019 11:37:03 +0000
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
   title=3D"NEW - Broken colors on RX 5700 with adjusted brightness"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112148">112148</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Broken colors on RX 5700 with adjusted brightness
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
          <td>mlichvar&#64;redhat.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have an RX 5700 card connected to a monitor which doesn't di=
splay dark colors
very well. The brightness needs to be adjusted in software. I use the xcalib
tool like this:

xcalib -c
xcalib -a -b 10 -co 90

This displays dark colors well, but some images/videos have weird artifacts.
After playing with a color picker it looks like colors that have the green
component zero are much brighter than they should be. For example, color
#750000 is much brighter than #750100. I'll attach some images that show the
problem.

When the monitor is connected to a different computer (with a non-AMD GPU)
configured with the same xcalib commands, the problem disappears, so it see=
ms
to be specific to the hardware/driver.

Please let me know if you need more information.

Installed packages:
kernel-5.3.6-300.fc31.x86_64
xorg-x11-server-Xorg-1.20.5-7.fc31.x86_64
xorg-x11-drv-amdgpu-19.1.0-1.fc31.x86_64
mesa-dri-drivers-19.2.0-1.fc31.x86_64
xcalib-0.8-24.fc31.x86_64</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722626230.C2bC.15882--

--===============0854835676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0854835676==--
