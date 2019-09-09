Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F252ADE1B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 19:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5889C6A;
	Mon,  9 Sep 2019 17:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 416E189C6A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 17:38:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3E96972167; Mon,  9 Sep 2019 17:38:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111620] [regression][bisected] Virtual Reality HMDs fail to
 power off when SteamVR closes
Date: Mon, 09 Sep 2019 17:38:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: andresx7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111620-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1281950351=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1281950351==
Content-Type: multipart/alternative; boundary="15680507101.AEC0EFe.9321"
Content-Transfer-Encoding: 7bit


--15680507101.AEC0EFe.9321
Date: Mon, 9 Sep 2019 17:38:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111620

            Bug ID: 111620
           Summary: [regression][bisected] Virtual Reality HMDs fail to
                    power off when SteamVR closes
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: andresx7@gmail.com

When SteamVR is closed the attached HMD no longer powers off. This is due to
the display still being driven by the GPU.

The first bad commit for this behaviour is:
"drm/amd/display: Allow commits with no planes active"
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3Dbc92c06525e5865c94256ef0227bfe870c095823

My understanding is that the commit above does fix a bug in amdgpu/dc. Howe=
ver,
due to current Xorg versions failing to shut down outputs after re-claiming=
 a
drm lease, this commit ends up breaking userspace.

Following is the x server patch to help illustrate what X is doing incorrec=
tly:
https://gitlab.freedesktop.org/xorg/xserver/merge_requests/279

Additional reference:
https://github.com/ValveSoftware/SteamVR-for-Linux/issues/235

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680507101.AEC0EFe.9321
Date: Mon, 9 Sep 2019 17:38:30 +0000
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
   title=3D"NEW - [regression][bisected] Virtual Reality HMDs fail to power=
 off when SteamVR closes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111620">111620</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][bisected] Virtual Reality HMDs fail to power off=
 when SteamVR closes
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
          <td>andresx7&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When SteamVR is closed the attached HMD no longer powers off. =
This is due to
the display still being driven by the GPU.

The first bad commit for this behaviour is:
&quot;drm/amd/display: Allow commits with no planes active&quot;
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/commit/?id=3Dbc92c06525e5865c94256ef0227bfe870c095823">https://git.kernel.=
org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dbc92c06525e5865c=
94256ef0227bfe870c095823</a>

My understanding is that the commit above does fix a bug in amdgpu/dc. Howe=
ver,
due to current Xorg versions failing to shut down outputs after re-claiming=
 a
drm lease, this commit ends up breaking userspace.

Following is the x server patch to help illustrate what X is doing incorrec=
tly:
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/merge_requests/279">=
https://gitlab.freedesktop.org/xorg/xserver/merge_requests/279</a>

Additional reference:
<a href=3D"https://github.com/ValveSoftware/SteamVR-for-Linux/issues/235">h=
ttps://github.com/ValveSoftware/SteamVR-for-Linux/issues/235</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680507101.AEC0EFe.9321--

--===============1281950351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1281950351==--
