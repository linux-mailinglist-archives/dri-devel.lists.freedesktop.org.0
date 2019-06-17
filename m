Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8F47A4A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 08:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901698915B;
	Mon, 17 Jun 2019 06:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4636B8915B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 06:56:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4300D72167; Mon, 17 Jun 2019 06:56:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTA5MjhdIHd4NTEwMCBncHUgY3Jhc2jvvIHvvIHvvIHvvIE=?=
Date: Mon, 17 Jun 2019 06:56:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: baopeng88_com@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110928-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0147586857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0147586857==
Content-Type: multipart/alternative; boundary="15607545940.72bDaec.24690"
Content-Transfer-Encoding: 7bit


--15607545940.72bDaec.24690
Date: Mon, 17 Jun 2019 06:56:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110928

            Bug ID: 110928
           Summary: wx5100 gpu crash=EF=BC=81=EF=BC=81=EF=BC=81=EF=BC=81
           Product: DRI
           Version: DRI git
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: baopeng88_com@163.com

When we used wx5100 for rendering and encoding, we encountered some gpu han=
gs.
This situation is very bad and must be resolved by rebooting. The log
information is as follows. Please help analyze, thank you very much.
situation 1:
2019-06-16T14:39:24.708544+08:00|err|kernel[-]|[398383.549799] amdgpu
0005:01:00.0: GPU fault detected: 146 0x04203d0c for process a.babycard.ssvs
pid 330210 thread RenderThread pid 330511
2019-06-16T14:39:24.708703+08:00|err|kernel[-]|[398383.549803] amdgpu
0005:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00102184
2019-06-16T14:39:24.708812+08:00|err|kernel[-]|[398383.549805] amdgpu
0005:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0D03D014
2019-06-16T14:39:24.708908+08:00|err|kernel[-]|[398383.549809] amdgpu
0005:01:00.0: VM fault (0x14, vmid 6, pasid 33627) at page 1057156, write f=
rom
'SDM1' (0x53444d31) (61)

After the GPU fault, about 17 seconds later:

2019-06-16T14:39:41.924400+08:00|err|kernel[-]|[398400.765123]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vce0 timeout, signaled
seq=3D3868950, emitted seq=3D3868954
2019-06-16T14:39:41.924463+08:00|info|kernel[-]|[398400.765132] [drm] GPU
recovery disabled.

situation 2=EF=BC=9A
[Thu Jun  6 22:00:14 2019] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring =
gfx
timeout, signaled seq=3D919191055, emitted seq=3D919191057
[Thu Jun  6 22:00:14 2019] [drm] GPU recovery disabled.
[Thu Jun  6 22:00:16 2019] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
sdma1 timeout, signaled seq=3D101603699, emitted seq=3D101603701
[Thu Jun  6 22:00:16 2019] [drm] GPU recovery disabled.

situation 3:
2019-06-16T14:59:05.248325+08:00|err|kernel[-]|[399194.411704]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=3D230984670, emitted seq=3D230984673
2019-06-16T14:59:05.248404+08:00|info|kernel[-]|[399194.411708] [drm] GPU
recovery disabled.

can you help me to analyze these situations to solve these problems? thank =
you.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607545940.72bDaec.24690
Date: Mon, 17 Jun 2019 06:56:34 +0000
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
   title=3D"NEW - wx5100 gpu crash=EF=BC=81=EF=BC=81=EF=BC=81=EF=BC=81"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110928">110928</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>wx5100 gpu crash=EF=BC=81=EF=BC=81=EF=BC=81=EF=BC=81
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
          <td>All
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
          <td>critical
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
          <td>baopeng88_com&#64;163.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When we used wx5100 for rendering and encoding, we encountered=
 some gpu hangs.
This situation is very bad and must be resolved by rebooting. The log
information is as follows. Please help analyze, thank you very much.
situation 1:
2019-06-16T14:39:24.708544+08:00|err|kernel[-]|[398383.549799] amdgpu
0005:01:00.0: GPU fault detected: 146 0x04203d0c for process a.babycard.ssvs
pid 330210 thread RenderThread pid 330511
2019-06-16T14:39:24.708703+08:00|err|kernel[-]|[398383.549803] amdgpu
0005:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00102184
2019-06-16T14:39:24.708812+08:00|err|kernel[-]|[398383.549805] amdgpu
0005:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0D03D014
2019-06-16T14:39:24.708908+08:00|err|kernel[-]|[398383.549809] amdgpu
0005:01:00.0: VM fault (0x14, vmid 6, pasid 33627) at page 1057156, write f=
rom
'SDM1' (0x53444d31) (61)

After the GPU fault, about 17 seconds later:

2019-06-16T14:39:41.924400+08:00|err|kernel[-]|[398400.765123]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vce0 timeout, signaled
seq=3D3868950, emitted seq=3D3868954
2019-06-16T14:39:41.924463+08:00|info|kernel[-]|[398400.765132] [drm] GPU
recovery disabled.

situation 2=EF=BC=9A
[Thu Jun  6 22:00:14 2019] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring =
gfx
timeout, signaled seq=3D919191055, emitted seq=3D919191057
[Thu Jun  6 22:00:14 2019] [drm] GPU recovery disabled.
[Thu Jun  6 22:00:16 2019] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
sdma1 timeout, signaled seq=3D101603699, emitted seq=3D101603701
[Thu Jun  6 22:00:16 2019] [drm] GPU recovery disabled.

situation 3:
2019-06-16T14:59:05.248325+08:00|err|kernel[-]|[399194.411704]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=3D230984670, emitted seq=3D230984673
2019-06-16T14:59:05.248404+08:00|info|kernel[-]|[399194.411708] [drm] GPU
recovery disabled.

can you help me to analyze these situations to solve these problems? thank =
you.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607545940.72bDaec.24690--

--===============0147586857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0147586857==--
