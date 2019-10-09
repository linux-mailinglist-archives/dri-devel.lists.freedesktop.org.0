Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031AD196A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 22:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB266E314;
	Wed,  9 Oct 2019 20:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EF4E6E314
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 20:10:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EF9F672158; Wed,  9 Oct 2019 20:10:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111948] [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT when
 logging into KDE with kernel 5.3.0-rc1 and newer
Date: Wed, 09 Oct 2019 20:10:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@forsaken.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111948-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2084153918=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2084153918==
Content-Type: multipart/alternative; boundary="15706518360.01D344D.31446"
Content-Transfer-Encoding: 7bit


--15706518360.01D344D.31446
Date: Wed, 9 Oct 2019 20:10:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111948

            Bug ID: 111948
           Summary: [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT when
                    logging into KDE with kernel 5.3.0-rc1 and newer
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@forsaken.se

Created attachment 145692
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145692&action=3Dedit
dmesg for 5.3.0-rc1

Hi,

I'm getting this problem when I log into KDE (5.16.5) if I use kernel 5.3.0=
-rc1
or newer including 5.4.0-rc2, it happens every time, the splash show for a =
few
seconds and then the screen goes black and it comes back garbled.

I've done a bisect between 5.2 and 5.3.0-rc1:

52d2d44eee8091e740d0d275df1311fb8373c9a9 is the first bad commit

This is a merge commit though...

[   19.840654] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:144 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840656] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a021000 from 27
[   19.840657] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101121
[   19.840661] amdgpu 0000:0a:00.0: [gfxhub] retry page fault (src_id:0 rin=
g:0
vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840662] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a036000 from 27
[   19.840662] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840665] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840666] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a037000 from 27
[   19.840666] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840670] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840670] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840671] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840674] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840675] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840675] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840679] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840679] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840680] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840683] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:128 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840683] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a025000 from 27
[   19.840684] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840690] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840690] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a05b000 from 27
[   19.840691] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840694] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840695] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a05b000 from 27
[   19.840695] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840698] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840699] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a058000 from 27
[   19.840699] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   25.066367] [drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences
timed out or interrupted!
[   25.066369] [drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences
timed out or interrupted!
[   30.194884] [drm:amdgpu_job_timedout] *ERROR* ring sdma0 timeout, signal=
ed
seq=3D491, emitted seq=3D493
[   30.194886] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss
ksplashqml pid 4333 thread ksplashqml:cs0 pid 4336
[   30.194889] amdgpu 0000:0a:00.0: GPU reset begin!
[   30.195169] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered

I've attached the dmesg log.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706518360.01D344D.31446
Date: Wed, 9 Oct 2019 20:10:36 +0000
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
   title=3D"NEW - [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT when log=
ging into KDE with kernel 5.3.0-rc1 and newer"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111948">111948</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT when logging=
 into KDE with kernel 5.3.0-rc1 and newer
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
          <td>critical
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
          <td>freedesktop&#64;forsaken.se
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145692=
" name=3D"attach_145692" title=3D"dmesg for 5.3.0-rc1">attachment 145692</a=
> <a href=3D"attachment.cgi?id=3D145692&amp;action=3Dedit" title=3D"dmesg f=
or 5.3.0-rc1">[details]</a></span>
dmesg for 5.3.0-rc1

Hi,

I'm getting this problem when I log into KDE (5.16.5) if I use kernel 5.3.0=
-rc1
or newer including 5.4.0-rc2, it happens every time, the splash show for a =
few
seconds and then the screen goes black and it comes back garbled.

I've done a bisect between 5.2 and 5.3.0-rc1:

52d2d44eee8091e740d0d275df1311fb8373c9a9 is the first bad commit

This is a merge commit though...

[   19.840654] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:144 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840656] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a021000 from 27
[   19.840657] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101121
[   19.840661] amdgpu 0000:0a:00.0: [gfxhub] retry page fault (src_id:0 rin=
g:0
vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840662] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a036000 from 27
[   19.840662] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840665] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840666] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a037000 from 27
[   19.840666] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840670] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840670] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840671] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840674] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840675] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840675] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840679] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840679] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a035000 from 27
[   19.840680] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840683] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:128 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840683] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a025000 from 27
[   19.840684] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840690] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840690] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a05b000 from 27
[   19.840691] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840694] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840695] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a05b000 from 27
[   19.840695] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   19.840698] amdgpu 0000:0a:00.0: [gfxhub] no-retry page fault (src_id:0
ring:157 vmid:1 pasid:32769, for process X pid 4118 thread X:cs0 pid 4169)
[   19.840699] amdgpu 0000:0a:00.0:   in page starting at address
0x000080010a058000 from 27
[   19.840699] amdgpu 0000:0a:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[   25.066367] [drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences
timed out or interrupted!
[   25.066369] [drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences
timed out or interrupted!
[   30.194884] [drm:amdgpu_job_timedout] *ERROR* ring sdma0 timeout, signal=
ed
seq=3D491, emitted seq=3D493
[   30.194886] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss
ksplashqml pid 4333 thread ksplashqml:cs0 pid 4336
[   30.194889] amdgpu 0000:0a:00.0: GPU reset begin!
[   30.195169] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered

I've attached the dmesg log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706518360.01D344D.31446--

--===============2084153918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2084153918==--
