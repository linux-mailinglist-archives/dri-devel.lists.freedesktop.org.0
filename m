Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46955ADA1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E5E10E191;
	Sat, 25 Jun 2022 23:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145610E191
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:52:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C9ED60FBF
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B7DC3411C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656201173;
 bh=JaF/w7CE56HPhSP1f2ZgNRnhHUIA5AX7DFzYeukgQ1o=;
 h=From:To:Subject:Date:From;
 b=IYv48G3f+96l+E7gP6RY+k7YcZgdhiL4cmkkn7dhmzgcWNH5+VGUEjevpnKYp/IgH
 B87jta2AlvSkO9EFZFkUus8CE6ceb0DTwj9KRveMNWQDRsknKx3WYS9fnAnsqzrjyJ
 bUIMcGK4mZ7lo0Y+eP4rv29h70gRHKUkJGxtaLrh4pn+RehWBP984BeTgPlyHAjpDO
 TZbCSFrVSAnl8KvgVA0ubxu4oCyymTaSqSlzYMY9nkMbCt3+zETWlNXnG/z1dWhQ2i
 aEiAfA3vgCAdv/bUWOkpBgzXcIrmxPfoZVQ1pWY0+P6d/NDeJgrRta473af9+fH7K4
 7IXkX0Ka1UMbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BDC1DCAC6E2; Sat, 25 Jun 2022 23:52:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] New: amdgpu [gfxhub] page fault (src_id:0 ring:173
 vmid:1 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sat, 25 Jun 2022 23:52:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216173-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

            Bug ID: 216173
           Summary: amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
                    pasid:32769, for process Xorg pid 2994 thread Xorg:cs0
                    pid 3237)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19-rc3
          Hardware: i386
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: witold.baryluk+kernel@gmail.com
        Regression: No

This appears to be a regression in 5.19-rc3 (and rc2, didn't test before th=
at).
It works fine on 5.18.7. Both custom build. And also no issues on 5.18.0.

Debian, amd64.

44:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
21 [Radeon RX 6800/6800 XT / 6900 XT] (rev c0)

CPU: AMD Threadripper 2950X, stock
Memory: 8x32GB ECC
Motherboard: MSI MEG Creation X399


Booting looks fine, but when Xorg server starts, the screen looks corrupted,
and it takes seconds until screen freezes and is not responding.

Dmesg output:


[  140.683672] amdgpu 0000:44:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:173 vmid:1 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid
3237)
[  140.683678] amdgpu 0000:44:00.0: amdgpu:   in page starting at address
0x0000800106ef5000 from client 0x1b (UTCL2)
[  140.683681] amdgpu 0000:44:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x0014115B
[  140.683682] amdgpu 0000:44:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[  140.683684] amdgpu 0000:44:00.0: amdgpu:      MORE_FAULTS: 0x1
[  140.683685] amdgpu 0000:44:00.0: amdgpu:      WALKER_ERROR: 0x5
[  140.683686] amdgpu 0000:44:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[  140.683686] amdgpu 0000:44:00.0: amdgpu:      MAPPING_ERROR: 0x1
[  140.683687] amdgpu 0000:44:00.0: amdgpu:      RW: 0x1
...
[  151.015508] gmc_v10_0_process_interrupt: 699 callbacks suppressed
...


Eventually resets, but still not usable:

[  161.261520] amdgpu 0000:44:00.0: amdgpu: IH ring buffer overflow
(0x0008D620, 0x00002680, 0x0000D640)
[  161.270648] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D100, emitted seq=3D103
[  161.270854] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 2994 thread Xorg:cs0 pid 3237
[  161.271004] amdgpu 0000:44:00.0: amdgpu: GPU reset begin!
[  161.830407] amdgpu 0000:44:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[  161.830517] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
[  162.084366] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* failed to halt cp g=
fx
[  162.101328] [drm] free PSP TMR buffer
[  162.149879] CPU: 15 PID: 188 Comm: kworker/u128:14 Tainted: G        W  =
 E=20=20
  5.19.0-rc3 #1
[  162.149883] Hardware name: Micro-Star International Co., Ltd. MS-7B92/MEG
X399 CREATION (MS-7B92), BIOS 1.30 03/25/2019
[  162.149884] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sche=
d]
[  162.149890] Call Trace:
[  162.149892]  <TASK>
[  162.149893]  dump_stack_lvl+0x34/0x45
[  162.149898]  amdgpu_do_asic_reset+0x1b/0x3db [amdgpu]
[  162.150047]  amdgpu_device_gpu_recover_imp.cold+0x57e/0x910 [amdgpu]
[  162.150194]  amdgpu_job_timedout+0x14b/0x180 [amdgpu]
[  162.150323]  ? finish_task_switch.isra.0+0x7d/0x270
[  162.150326]  drm_sched_job_timedout+0x5b/0xf0 [gpu_sched]
[  162.150330]  process_one_work+0x1ab/0x300
[  162.150332]  worker_thread+0x48/0x3c0
[  162.150334]  ? rescuer_thread+0x3c0/0x3c0
[  162.150336]  kthread+0xd1/0x100
[  162.150338]  ? kthread_complete_and_exit+0x20/0x20
[  162.150339]  ret_from_fork+0x1f/0x30
[  162.150342]  </TASK>
[  162.150351] amdgpu 0000:44:00.0: amdgpu: MODE1 reset
[  162.150354] amdgpu 0000:44:00.0: amdgpu: GPU mode1 reset
[  162.150417] amdgpu 0000:44:00.0: amdgpu: GPU smu mode1 reset
[  162.653371] amdgpu 0000:44:00.0: amdgpu: GPU reset succeeded, trying to
resume
[  162.653516] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[  162.653537] [drm] VRAM is lost due to GPU reset!
[  162.653541] [drm] PSP is resuming...
[  162.834166] [drm] reserve 0xa00000 from 0x8001000000 for PSP TMR
[  162.948850] amdgpu 0000:44:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[  162.948853] amdgpu 0000:44:00.0: amdgpu: SMU is resuming...
[  162.948884] amdgpu 0000:44:00.0: amdgpu: use vbios provided pptable
[  163.025704] amdgpu 0000:44:00.0: amdgpu: SMU is resumed successfully!
[  163.027473] [drm] DMUB hardware initialized: version=3D0x02020003
[  163.280274] [drm] kiq ring mec 2 pipe 1 q 0
[  163.284624] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[  163.284906] [drm] JPEG decode initialized successfully.
[  163.284926] amdgpu 0000:44:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on
hub 0
[  163.284928] amdgpu 0000:44:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[  163.284930] amdgpu 0000:44:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[  163.284931] amdgpu 0000:44:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[  163.284932] amdgpu 0000:44:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[  163.284934] amdgpu 0000:44:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[  163.284935] amdgpu 0000:44:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[  163.284936] amdgpu 0000:44:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[  163.284937] amdgpu 0000:44:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[  163.284938] amdgpu 0000:44:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng =
11
on hub 0
[  163.284940] amdgpu 0000:44:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[  163.284941] amdgpu 0000:44:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[  163.284942] amdgpu 0000:44:00.0: amdgpu: ring sdma2 uses VM inv eng 14 on
hub 0
[  163.284943] amdgpu 0000:44:00.0: amdgpu: ring sdma3 uses VM inv eng 15 on
hub 0
[  163.284944] amdgpu 0000:44:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng =
0 on
hub 1
[  163.284945] amdgpu 0000:44:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv en=
g 1
on hub 1
[  163.284947] amdgpu 0000:44:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv en=
g 4
on hub 1
[  163.284948] amdgpu 0000:44:00.0: amdgpu: ring vcn_dec_1 uses VM inv eng =
5 on
hub 1
[  163.284949] amdgpu 0000:44:00.0: amdgpu: ring vcn_enc_1.0 uses VM inv en=
g 6
on hub 1
[  163.284950] amdgpu 0000:44:00.0: amdgpu: ring vcn_enc_1.1 uses VM inv en=
g 7
on hub 1
[  163.284951] amdgpu 0000:44:00.0: amdgpu: ring jpeg_dec uses VM inv eng 8=
 on
hub 1
[  163.292565] amdgpu 0000:44:00.0: amdgpu: recover vram bo from shadow sta=
rt
[  163.292579] amdgpu 0000:44:00.0: amdgpu: recover vram bo from shadow done
[  163.292582] [drm] Skip scheduling IBs!
[  163.292583] [drm] Skip scheduling IBs!
[  163.292598] amdgpu 0000:44:00.0: amdgpu: GPU reset(3) succeeded!
[  163.292618] [drm] Skip scheduling IBs!
[  163.292626] [drm] Skip scheduling IBs!
[  163.292629] [drm] Skip scheduling IBs!
[  163.989966] usb usb8-port1: Cannot enable. Maybe the USB cable is bad?
[  166.265393] amdgpu_cs_ioctl: 3200 callbacks suppressed
[  166.265397] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  166.265812] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  166.282284] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  166.283327] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  171.486759] amdgpu_cs_ioctl: 65 callbacks suppressed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
