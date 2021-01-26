Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DE303DCD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 13:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D276E42C;
	Tue, 26 Jan 2021 12:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC616E42C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 12:54:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5743823109
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 12:54:55 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 47393809B0; Tue, 26 Jan 2021 12:54:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Tue, 26 Jan 2021 12:54:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-CMyI6pbtv9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211349

--- Comment #5 from bolando@163.com ---
    I have tested with many kernels  and firmwares but failed ! To compare with
Ubuntu 20.4 LTS kern log,my kern log lack of "kfd: added device" and  "amdgpu
0000:06:00.0: amdgpu: Topology: Add APU node [0x0:0x0]". It seems sdma0 and vcn
bug,with some memoery faults. This is mail error log.


Jan 26 09:58:07 Pink kernel: [   69.141903] [drm:amdgpu_ib_ring_tests [amdgpu]]
*ERROR* IB test failed on sdma0 (-110).
Jan 26 09:58:07 Pink kernel: [   69.145985] amdgpu 0000:06:00.0: amdgpu:
[gfxhub0] no-retry page fault (src_id:0 ring:157 vmid:10 pasid:0, for process 
pid 0 thread  pid 0)
Jan 26 09:58:07 Pink kernel: [   69.146002] amdgpu 0000:06:00.0: amdgpu:   in
page starting at address 0x000000f40021b000 from client 27
Jan 26 09:58:07 Pink kernel: [   69.146012] amdgpu 0000:06:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00A00B3A
Jan 26 09:58:07 Pink kernel: [   69.146020] amdgpu 0000:06:00.0: amdgpu: ^I
Faulty UTCL2 client ID: CPC (0x5)
Jan 26 09:58:07 Pink kernel: [   69.146027] amdgpu 0000:06:00.0: amdgpu: ^I
MORE_FAULTS: 0x0
Jan 26 09:58:07 Pink kernel: [   69.146033] amdgpu 0000:06:00.0: amdgpu: ^I
WALKER_ERROR: 0x5
Jan 26 09:58:07 Pink kernel: [   69.146040] amdgpu 0000:06:00.0: amdgpu: ^I
PERMISSION_FAULTS: 0x3
Jan 26 09:58:07 Pink kernel: [   69.146046] amdgpu 0000:06:00.0: amdgpu: ^I
MAPPING_ERROR: 0x1
Jan 26 09:58:07 Pink kernel: [   69.146052] amdgpu 0000:06:00.0: amdgpu: ^I RW:
0x0
Jan 26 09:58:07 Pink kernel: [   69.146067] amdgpu 0000:06:00.0: amdgpu:
[gfxhub0] no-retry page fault (src_id:0 ring:157 vmid:10 pasid:0, for process 
pid 0 thread  pid 0)
Jan 26 09:58:07 Pink kernel: [   69.146077] amdgpu 0000:06:00.0: amdgpu:   in
page starting at address 0x000000f40021b000 from client 27
Jan 26 09:58:07 Pink kernel: [   69.146086] amdgpu 0000:06:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00A00B3A
Jan 26 09:58:07 Pink kernel: [   69.146094] amdgpu 0000:06:00.0: amdgpu: ^I
Faulty UTCL2 client ID: CPC (0x5)
Jan 26 09:58:07 Pink kernel: [   69.146100] amdgpu 0000:06:00.0: amdgpu: ^I
MORE_FAULTS: 0x0
Jan 26 09:58:07 Pink kernel: [   69.146106] amdgpu 0000:06:00.0: amdgpu: ^I
WALKER_ERROR: 0x5
Jan 26 09:58:07 Pink kernel: [   69.146112] amdgpu 0000:06:00.0: amdgpu: ^I
PERMISSION_FAULTS: 0x3
Jan 26 09:58:07 Pink kernel: [   69.146118] amdgpu 0000:06:00.0: amdgpu: ^I
MAPPING_ERROR: 0x1
Jan 26 09:58:07 Pink kernel: [   69.146124] amdgpu 0000:06:00.0: amdgpu: ^I RW:
0x0
Jan 26 09:58:07 Pink kernel: [   69.146514] mce: [Hardware Error]: Machine
check events logged
Jan 26 09:58:07 Pink kernel: [   69.146526] mce: [Hardware Error]: CPU 0:
Machine Check: 0 Bank 20: dc2030000001085b
Jan 26 09:58:07 Pink kernel: [   69.146533] mce: [Hardware Error]: TSC
52c0cc15a4 ADDR 7ffcffffff40 SYND 5b240204 IPID 2e00000000 
Jan 26 09:58:07 Pink kernel: [   69.146545] mce: [Hardware Error]: PROCESSOR
2:810f10 TIME 1611655087 SOCKET 0 APIC 0 microcode 8101016
Jan 26 09:58:08 Pink kernel: [   70.150550] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:10 Pink kernel: [   71.172270] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:11 Pink kernel: [   72.193987] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:12 Pink kernel: [   73.215700] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:13 Pink kernel: [   74.237417] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:14 Pink kernel: [   75.259129] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:15 Pink kernel: [   76.280848] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:16 Pink kernel: [   77.302559] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:17 Pink kernel: [   78.324274] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:18 Pink kernel: [   79.345988] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, trying to reset the VCPU!!!
Jan 26 09:58:18 Pink kernel: [   79.366046] [drm:vcn_v1_0_set_powergating_state
[amdgpu]] *ERROR* VCN decode not responding, giving up!!!
Jan 26 09:58:18 Pink kernel: [   79.366067]
[drm:amdgpu_device_ip_set_powergating_state [amdgpu]] *ERROR*
set_powergating_state of IP block <vcn_v1_0> failed -1
Jan 26 09:58:18 Pink kernel: [   79.366137] amdgpu 0000:06:00.0: amdgpu:
[mmhub0] no-retry page fault (src_id:0 ring:16 vmid:0 pasid:0, for process  pid
0 thread  pid 0)
Jan 26 09:58:18 Pink kernel: [   79.366150] amdgpu 0000:06:00.0: amdgpu:   in
page starting at address 0x0000000000000000 from client 18
Jan 26 09:58:18 Pink kernel: [   79.366159] amdgpu 0000:06:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000420
Jan 26 09:58:18 Pink kernel: [   79.366166] amdgpu 0000:06:00.0: amdgpu: ^I
Faulty UTCL2 client ID: VCN (0x2)
Jan 26 09:58:18 Pink kernel: [   79.366172] amdgpu 0000:06:00.0: amdgpu: ^I
MORE_FAULTS: 0x0
Jan 26 09:58:18 Pink kernel: [   79.366177] amdgpu 0000:06:00.0: amdgpu: ^I
WALKER_ERROR: 0x0
Jan 26 09:58:18 Pink kernel: [   79.366182] amdgpu 0000:06:00.0: amdgpu: ^I
PERMISSION_FAULTS: 0x2
Jan 26 09:58:18 Pink kernel: [   79.366187] amdgpu 0000:06:00.0: amdgpu: ^I
MAPPING_ERROR: 0x0
Jan 26 09:58:18 Pink kernel: [   79.366192] amdgpu 0000:06:00.0: amdgpu: ^I RW:
0x0
Jan 26 09:58:19 Pink kernel: [   80.405920] amdgpu 0000:06:00.0:
[drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on vcn_dec (-110).
Jan 26 09:58:20 Pink kernel: [   81.429922] amdgpu 0000:06:00.0:
[drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on vcn_enc0 (-110).
Jan 26 09:58:21 Pink kernel: [   82.453922] amdgpu 0000:06:00.0:
[drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on vcn_enc1 (-110).
Jan 26 09:59:18 Pink kernel: Kernel logging (proc) stopped.
Jan 26 09:59:18 Pink kernel: Kernel log daemon terminating.
Jan 26 10:00:07 Pink kernel: klogd 1.5.1, log source = /proc/kmsg started.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
