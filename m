Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3A9C4C9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 18:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52898933D;
	Sun, 25 Aug 2019 16:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D4D489F1B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 16:09:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9300D72161; Sun, 25 Aug 2019 16:09:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111483] FreeSync LFC breaks under certain circumstances,
 causing either tearing or stutter
Date: Sun, 25 Aug 2019 16:09:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111483-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1563822718=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1563822718==
Content-Type: multipart/alternative; boundary="15667493710.b8E5fF4.26081"
Content-Transfer-Encoding: 7bit


--15667493710.b8E5fF4.26081
Date: Sun, 25 Aug 2019 16:09:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111483

            Bug ID: 111483
           Summary: FreeSync LFC breaks under certain circumstances,
                    causing either tearing or stutter
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: tempel.julian@gmail.com

I've noticed that there sometimes was tearing (vsync off) when framerate was
below VRR range minimum (which is 40 - 144Hz in my case), e.g. in some game=
's
videos that run with 30fps and probably also if framerate rapidly drops bel=
ow
VRR range.

I found a way to reliably reproduce the issue during actual game rendering:
Start vkquake and load a level. Game's default limiter is set to 200. Open
game's console via tilde key (English keyboard layout, button below ESC) and
set fps to 35 (should be below any display's VRR range minimum) by typing
"host_maxfps 35".
-> FreeSync LFC should be broken now and show tearing if vsync isn't turned=
 on.
When changing again to a value that's inside the VRR range, e.g. 100, VRR w=
orks
perfectly again. When switching back to 35, it's once again broken.
The Windows driver doesn't seem to show this issue.

linux 5.2.9 (also tested drm-next branch)
xf86-video-amdgpu-git e6fce59a071220967fcd4e2c9e4a262c72870761
RX 570
radv of mesa-git ACO branch fc0fdb637b4a028816f5a59b14eda07612e1bc9b

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667493710.b8E5fF4.26081
Date: Sun, 25 Aug 2019 16:09:31 +0000
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
   title=3D"NEW - FreeSync LFC breaks under certain circumstances, causing =
either tearing or stutter"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111483">111483</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>FreeSync LFC breaks under certain circumstances, causing eith=
er tearing or stutter
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
          <td>tempel.julian&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I've noticed that there sometimes was tearing (vsync off) when=
 framerate was
below VRR range minimum (which is 40 - 144Hz in my case), e.g. in some game=
's
videos that run with 30fps and probably also if framerate rapidly drops bel=
ow
VRR range.

I found a way to reliably reproduce the issue during actual game rendering:
Start vkquake and load a level. Game's default limiter is set to 200. Open
game's console via tilde key (English keyboard layout, button below ESC) and
set fps to 35 (should be below any display's VRR range minimum) by typing
&quot;host_maxfps 35&quot;.
-&gt; FreeSync LFC should be broken now and show tearing if vsync isn't tur=
ned on.
When changing again to a value that's inside the VRR range, e.g. 100, VRR w=
orks
perfectly again. When switching back to 35, it's once again broken.
The Windows driver doesn't seem to show this issue.

linux 5.2.9 (also tested drm-next branch)
xf86-video-amdgpu-git e6fce59a071220967fcd4e2c9e4a262c72870761
RX 570
radv of mesa-git ACO branch fc0fdb637b4a028816f5a59b14eda07612e1bc9b</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667493710.b8E5fF4.26081--

--===============1563822718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1563822718==--
