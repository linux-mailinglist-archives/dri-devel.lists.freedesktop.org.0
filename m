Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EEAE583
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E208926B;
	Mon, 29 Apr 2019 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36BAB8926A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:54:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 336CC72155; Mon, 29 Apr 2019 14:54:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104345] X-Server hangs with showing scrambled picture, sound
 still playing.
Date: Mon, 29 Apr 2019 14:54:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernhardu@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-104345-502-CwHowcLSq0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104345-502@http.bugs.freedesktop.org/>
References: <bug-104345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1366095722=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1366095722==
Content-Type: multipart/alternative; boundary="15565496801.4dadD5A0a.24440"
Content-Transfer-Encoding: 7bit


--15565496801.4dadD5A0a.24440
Date: Mon, 29 Apr 2019 14:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104345

--- Comment #14 from bernhardu <bernhardu@mailbox.org> ---
This sample happend while just browsing in firefox inside a plasma desktop,
running in amd64 debian buster.


[138335.303379] amdgpu 0000:08:00.0: GPU fault detected: 147 0x0a704402 for
process Xorg pid 1129 thread Xorg:cs0 pid 1161
[138335.303387] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x0012014E
[138335.303391] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E044002
[138335.303396] amdgpu 0000:08:00.0: VM fault (0x02, vmid 7, pasid 32768) at
page 1179982, read from 'TC1' (0x54433100) (68)
[138335.313378] amdgpu 0000:08:00.0: GPU fault detected: 147 0x08904802 for
process kwin_x11 pid 1350 thread kwin_x11:cs0 pid 1568
[138335.313384] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00120712
[138335.313388] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x02048002
[138335.313393] amdgpu 0000:08:00.0: VM fault (0x02, vmid 1, pasid 32773) at
page 1181458, read from 'TC0' (0x54433000) (72)
[139983.820484] amdgpu 0000:08:00.0: GPU fault detected: 147 0x00004802 for
process Xorg pid 1129 thread Xorg:cs0 pid 1161
[139983.820491] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000800
[139983.820495] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0C048002
[139983.820500] amdgpu 0000:08:00.0: VM fault (0x02, vmid 6, pasid 32768) at
page 2048, read from 'TC0' (0x54433000) (72)
[139994.156833] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D14610386, emitted seq=3D14610389
[139994.156840] [drm] GPU recovery disabled.
[140167.215046] INFO: task kworker/u32:3:15564 blocked for more than 120
seconds.
[140167.215053]       Tainted: G           OE     4.19.0-4-amd64 #1 Debian
4.19.28-2
[140167.215055] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[140167.215058] kworker/u32:3   D    0 15564      2 0x80000000
[140167.215080] Workqueue: events_unbound commit_work [drm_kms_helper]
[140167.215083] Call Trace:
[140167.215093]  ? __schedule+0x2a2/0x870
[140167.215098]  ? __switch_to_asm+0x40/0x70
[140167.215102]  schedule+0x28/0x80
[140167.215106]  schedule_timeout+0x26d/0x390
[140167.215204]  ? dce110_timing_generator_get_position+0x5b/0x70 [amdgpu]
[140167.215300]  ? dce110_timing_generator_get_crtc_scanoutpos+0x70/0xb0
[amdgpu]
[140167.215305]  dma_fence_default_wait+0x238/0x2a0
[140167.215310]  ? dma_fence_release+0x90/0x90
[140167.215314]  dma_fence_wait_timeout+0xdd/0x100
[140167.215319]  reservation_object_wait_timeout_rcu+0x173/0x280
[140167.215420]  amdgpu_dm_do_flip+0x112/0x340 [amdgpu]
[140167.215523]  amdgpu_dm_atomic_commit_tail+0x750/0xdb0 [amdgpu]
[140167.215528]  ? wait_for_completion_timeout+0x3b/0x1a0
[140167.215531]  ? __switch_to_asm+0x34/0x70
[140167.215535]  ? __switch_to_asm+0x40/0x70
[140167.215538]  ? __switch_to_asm+0x34/0x70
[140167.215541]  ? __switch_to_asm+0x40/0x70
[140167.215555]  commit_tail+0x3d/0x70 [drm_kms_helper]
[140167.215562]  process_one_work+0x1a7/0x3a0
[140167.215566]  worker_thread+0x30/0x390
[140167.215571]  ? create_worker+0x1a0/0x1a0
[140167.215573]  kthread+0x112/0x130
[140167.215577]  ? kthread_bind+0x30/0x30
[140167.215581]  ret_from_fork+0x22/0x40
[140241.805748] sysrq: SysRq : Keyboard mode set to system default


What can I do to get this bug forward?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565496801.4dadD5A0a.24440
Date: Mon, 29 Apr 2019 14:54:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server hangs with showing scrambled picture, sound stil=
l playing."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104345#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server hangs with showing scrambled picture, sound stil=
l playing."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104345">bug 10434=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bernhardu&#64;mailbox.org" title=3D"bernhardu &lt;bernhardu&#64;mailbox.org=
&gt;"> <span class=3D"fn">bernhardu</span></a>
</span></b>
        <pre>This sample happend while just browsing in firefox inside a pl=
asma desktop,
running in amd64 debian buster.


[138335.303379] amdgpu 0000:08:00.0: GPU fault detected: 147 0x0a704402 for
process Xorg pid 1129 thread Xorg:cs0 pid 1161
[138335.303387] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x0012014E
[138335.303391] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E044002
[138335.303396] amdgpu 0000:08:00.0: VM fault (0x02, vmid 7, pasid 32768) at
page 1179982, read from 'TC1' (0x54433100) (68)
[138335.313378] amdgpu 0000:08:00.0: GPU fault detected: 147 0x08904802 for
process kwin_x11 pid 1350 thread kwin_x11:cs0 pid 1568
[138335.313384] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00120712
[138335.313388] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x02048002
[138335.313393] amdgpu 0000:08:00.0: VM fault (0x02, vmid 1, pasid 32773) at
page 1181458, read from 'TC0' (0x54433000) (72)
[139983.820484] amdgpu 0000:08:00.0: GPU fault detected: 147 0x00004802 for
process Xorg pid 1129 thread Xorg:cs0 pid 1161
[139983.820491] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000800
[139983.820495] amdgpu 0000:08:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0C048002
[139983.820500] amdgpu 0000:08:00.0: VM fault (0x02, vmid 6, pasid 32768) at
page 2048, read from 'TC0' (0x54433000) (72)
[139994.156833] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D14610386, emitted seq=3D14610389
[139994.156840] [drm] GPU recovery disabled.
[140167.215046] INFO: task kworker/u32:3:15564 blocked for more than 120
seconds.
[140167.215053]       Tainted: G           OE     4.19.0-4-amd64 #1 Debian
4.19.28-2
[140167.215055] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&q=
uot; disables
this message.
[140167.215058] kworker/u32:3   D    0 15564      2 0x80000000
[140167.215080] Workqueue: events_unbound commit_work [drm_kms_helper]
[140167.215083] Call Trace:
[140167.215093]  ? __schedule+0x2a2/0x870
[140167.215098]  ? __switch_to_asm+0x40/0x70
[140167.215102]  schedule+0x28/0x80
[140167.215106]  schedule_timeout+0x26d/0x390
[140167.215204]  ? dce110_timing_generator_get_position+0x5b/0x70 [amdgpu]
[140167.215300]  ? dce110_timing_generator_get_crtc_scanoutpos+0x70/0xb0
[amdgpu]
[140167.215305]  dma_fence_default_wait+0x238/0x2a0
[140167.215310]  ? dma_fence_release+0x90/0x90
[140167.215314]  dma_fence_wait_timeout+0xdd/0x100
[140167.215319]  reservation_object_wait_timeout_rcu+0x173/0x280
[140167.215420]  amdgpu_dm_do_flip+0x112/0x340 [amdgpu]
[140167.215523]  amdgpu_dm_atomic_commit_tail+0x750/0xdb0 [amdgpu]
[140167.215528]  ? wait_for_completion_timeout+0x3b/0x1a0
[140167.215531]  ? __switch_to_asm+0x34/0x70
[140167.215535]  ? __switch_to_asm+0x40/0x70
[140167.215538]  ? __switch_to_asm+0x34/0x70
[140167.215541]  ? __switch_to_asm+0x40/0x70
[140167.215555]  commit_tail+0x3d/0x70 [drm_kms_helper]
[140167.215562]  process_one_work+0x1a7/0x3a0
[140167.215566]  worker_thread+0x30/0x390
[140167.215571]  ? create_worker+0x1a0/0x1a0
[140167.215573]  kthread+0x112/0x130
[140167.215577]  ? kthread_bind+0x30/0x30
[140167.215581]  ret_from_fork+0x22/0x40
[140241.805748] sysrq: SysRq : Keyboard mode set to system default


What can I do to get this bug forward?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565496801.4dadD5A0a.24440--

--===============1366095722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1366095722==--
