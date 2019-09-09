Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB7BAD1A5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 03:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031189704;
	Mon,  9 Sep 2019 01:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E383089704
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 01:47:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D5EA372167; Mon,  9 Sep 2019 01:47:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111591] [radeonsi/Navi] The Bard's Tale IV causes a GPU hang
Date: Mon, 09 Sep 2019 01:47:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111591-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1376170174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1376170174==
Content-Type: multipart/alternative; boundary="15679936510.56D5de4.4894"
Content-Transfer-Encoding: 7bit


--15679936510.56D5de4.4894
Date: Mon, 9 Sep 2019 01:47:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111591

            Bug ID: 111591
           Summary: [radeonsi/Navi] The Bard's Tale IV causes a GPU hang
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: shtetldik@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

When running the Bard's Tale IV, in the beginning of the game, if I turn
around, it consistently is causing a GPU hang. And I see this in dmesg:

[ 4246.501534] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 4251.365674] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D178390, emitted seq=3D178392
[ 4251.365740] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process BardsTale4-Linu pid 7251 thread BardsTale4:cs0 pid 7292
[ 4251.365742] [drm] GPU recovery disabled.

GPU: Sapphire Pulse RX 5700 XT
Kernel: 5.3.0-rc8+
OpenGL renderer string: AMD NAVI10 (DRM 3.33.0, 5.3.0-rc8+, LLVM 10.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.3.0-devel
(git-87fa8d9ebc)
Game version: GOG, release 1.0.0 (version 4.20.1 / 32050).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679936510.56D5de4.4894
Date: Mon, 9 Sep 2019 01:47:31 +0000
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
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591">111591</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[radeonsi/Navi] The Bard's Tale IV causes a GPU hang
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>shtetldik&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When running the Bard's Tale IV, in the beginning of the game,=
 if I turn
around, it consistently is causing a GPU hang. And I see this in dmesg:

[ 4246.501534] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 4251.365674] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D178390, emitted seq=3D178392
[ 4251.365740] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process BardsTale4-Linu pid 7251 thread BardsTale4:cs0 pid 7292
[ 4251.365742] [drm] GPU recovery disabled.

GPU: Sapphire Pulse RX 5700 XT
Kernel: 5.3.0-rc8+
OpenGL renderer string: AMD NAVI10 (DRM 3.33.0, 5.3.0-rc8+, LLVM 10.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.3.0-devel
(git-87fa8d9ebc)
Game version: GOG, release 1.0.0 (version 4.20.1 / 32050).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679936510.56D5de4.4894--

--===============1376170174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1376170174==--
