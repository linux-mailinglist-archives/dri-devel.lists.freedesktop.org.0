Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC899D3D97
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36D36EC05;
	Fri, 11 Oct 2019 10:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95A786EC05
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:41:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 927DB7296E; Fri, 11 Oct 2019 10:41:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111979] [5.2/5.3][drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
 *ERROR* Waiting for fences timed out or interrupted!
Date: Fri, 11 Oct 2019 10:41:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111979-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1537107335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1537107335==
Content-Type: multipart/alternative; boundary="15707904761.8bfDe976.29169"
Content-Transfer-Encoding: 7bit


--15707904761.8bfDe976.29169
Date: Fri, 11 Oct 2019 10:41:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111979

            Bug ID: 111979
           Summary: [5.2/5.3][drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
                    *ERROR* Waiting for fences timed out or interrupted!
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: udovdh@xs4all.nl

Seen on both AMD 2400g and 3400g APU's, we find these in dmesg of 5.3.5.:

   85.232749] fuse: init (API version 7.31)
[18161.173791] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[18166.037697] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[18171.153568] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[18186.261621] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

or on 5.2.17 sometimes:

[ 7596.392996] sd 11:0:0:0: [sde] Synchronize Cache(10) failed: Result:
hostbyte=3D0x01 driverbyte=3D0x00
[97954.657336] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[97959.535278] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2542528, emitted seq=3D2542531
[97959.535342] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[97959.535346] [drm] GPU recovery disabled.

Then the graphics stop working and the machine GUI is unusable until reboot.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15707904761.8bfDe976.29169
Date: Fri, 11 Oct 2019 10:41:16 +0000
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
   title=3D"NEW - [5.2/5.3][drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERR=
OR* Waiting for fences timed out or interrupted!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111979">111979</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[5.2/5.3][drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* =
Waiting for fences timed out or interrupted!
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
          <td>udovdh&#64;xs4all.nl
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Seen on both AMD 2400g and 3400g APU's, we find these in dmesg=
 of 5.3.5.:

   85.232749] fuse: init (API version 7.31)
[18161.173791] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[18166.037697] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[18171.153568] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[18186.261621] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered

or on 5.2.17 sometimes:

[ 7596.392996] sd 11:0:0:0: [sde] Synchronize Cache(10) failed: Result:
hostbyte=3D0x01 driverbyte=3D0x00
[97954.657336] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[97959.535278] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2542528, emitted seq=3D2542531
[97959.535342] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[97959.535346] [drm] GPU recovery disabled.

Then the graphics stop working and the machine GUI is unusable until reboot=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15707904761.8bfDe976.29169--

--===============1537107335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1537107335==--
