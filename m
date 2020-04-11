Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B49181A4E33
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 07:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0226ED5D;
	Sat, 11 Apr 2020 05:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91D26ED5D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 05:40:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204609] amdgpu: powerplay failed send message
Date: Sat, 11 Apr 2020 05:40:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@edpnet.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204609-2300-cPYkqYLuRQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204609-2300@https.bugzilla.kernel.org/>
References: <bug-204609-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204609

Janpieter Sollie (janpieter.sollie@edpnet.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |janpieter.sollie@edpnet.be

--- Comment #6 from Janpieter Sollie (janpieter.sollie@edpnet.be) ---
I hope this is the right place to add some comments:
Using 5.5.14, when the GPU runs at full speed, it seems to overheat after some
time.
I'd expect powerplay to take care of this critical temperature and slow down
the GPU.
instead, the GPU overheats and a system reset is neccessary.
The log is flooded with:
Apr 11 06:45:54 linuxserver kernel: amdgpu 0000:05:00.0: GPU reset begin!
Apr 11 06:45:54 linuxserver kernel: [drm] Timeout wait for RLC serdes 0,0
Apr 11 06:45:56 linuxserver last message repeated 4 times
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 133 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 5e ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 145 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 146 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 148 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 145 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 146 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 16a ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 186 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 54 ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  last message was failed ret is 65535
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay] 
Apr 11 06:45:57 linuxserver kernel:  failed to send message 13d ret is 65535 
Apr 11 06:45:57 linuxserver kernel: amdgpu: [powerplay]

Then after some time, the kernel realizes it did something wrong, but it seems
too late:

[  509.939497] amdgpu: [powerplay] Failed to force to switch arbf0!
[  509.939497] amdgpu: [powerplay] [disable_dpm_tasks] Failed to disable DPM!
[  509.939513] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspend
of IP block <powerplay> failed -22
[  510.203234] amdgpu 0000:05:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[  510.203254] [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[  510.313006] AMD-Vi: Completion-Wait loop timed out
[  510.730195] cp is busy, skip halt cp
[  510.744990] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdcf0]
[  510.993797] rlc is busy, skip halt rlc
[  511.312957] AMD-Vi: Completion-Wait loop timed out
[  511.522695] AMD-Vi: Completion-Wait loop timed out
[  511.742668] AMD-Vi: Completion-Wait loop timed out
[  511.746867] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd20]
[  512.748750] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd50]
[  513.321957] AMD-Vi: Completion-Wait loop timed out
[  513.751042] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd80]
[  514.042800] AMD-Vi: Completion-Wait loop timed out
[  514.334864] AMD-Vi: Completion-Wait loop timed out
[  514.752927] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cddb0]
[  515.754389] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdde0]
[  516.312673] AMD-Vi: Completion-Wait loop timed out
[  516.756573] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde10]
[  517.312656] AMD-Vi: Completion-Wait loop timed out
[  517.532684] AMD-Vi: Completion-Wait loop timed out
[  517.752651] AMD-Vi: Completion-Wait loop timed out
[  517.758146] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde40]
[  518.760028] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde70]
[  519.312662] AMD-Vi: Completion-Wait loop timed out
[  519.762162] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdea0]
[  520.312672] AMD-Vi: Completion-Wait loop timed out
[  520.764042] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cded0]
[  521.765666] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf00]
[  522.202677] AMD-Vi: Completion-Wait loop timed out
[  522.325004] AMD-Vi: Completion-Wait loop timed out
[  522.767854] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf30]
[  523.312674] AMD-Vi: Completion-Wait loop timed out
[  523.769682] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf60]
[  524.771306] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf90]
[  525.333114] AMD-Vi: Completion-Wait loop timed out
[  525.773456] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdfc0]
[  526.312664] AMD-Vi: Completion-Wait loop timed out
[  526.532660] AMD-Vi: Completion-Wait loop timed out
[  526.752666] AMD-Vi: Completion-Wait loop timed out
[  526.775065] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdff0]
[  527.776943] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc020]
[  528.352697] AMD-Vi: Completion-Wait loop timed out
[  528.779083] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc050]
[  529.312668] AMD-Vi: Completion-Wait loop timed out
[  529.781014] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc080]
[  530.352680] AMD-Vi: Completion-Wait loop timed out
[  530.782583] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc0b0]
[  531.338487] AMD-Vi: Completion-Wait loop timed out
[  531.784769] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc0e0]
[  532.102727] AMD-Vi: Completion-Wait loop timed out
[  532.282673] AMD-Vi: Completion-Wait loop timed out
[  532.786342] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc110]
[  533.788221] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc140]
[  534.790101] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc170]
[  535.791982] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc1a0]
[  536.793860] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc1d0]
[  537.795741] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc200]
[  538.797620] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc230]
[  539.799500] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc260]
[  540.801380] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc290]
[  541.803259] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc2c0]
[  542.362673] AMD-Vi: Completion-Wait loop timed out
[  542.805139] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc2f0]
[  543.807018] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc320]
[  544.808898] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc350]
[  545.810778] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc380]
[  546.812657] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc3b0]
[  547.814537] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc3e0]
[  548.816416] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc410]
[  549.818297] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc440]
[  550.820423] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc470]
[  551.822055] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc4a0]
[  552.823933] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc4d0]
[  553.825812] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc500]
[  554.780267] ------------[ cut here ]------------
[  554.780272] NETDEV WATCHDOG: eth0 (r8169): transmit queue 0 timed out
[  554.780284] WARNING: CPU: 7 PID: 0 at dev_watchdog+0x203/0x210
[  554.780285] Modules linked in: amdgpu gpu_sched ttm backlight btrfs
blake2b_generic xor raid6_pq wmi_bmof uas aacraid kvm irqbypass k10temp
i2c_piix4 pinctrl_amd wmi efivarfs                                              
[  554.780297] CPU: 7 PID: 0 Comm: swapper/7 Not tainted 5.5.14 #23
[  554.780298] Hardware name: Gigabyte Technology Co., Ltd. X570 UD/X570 UD,
BIOS F10 11/15/2019
[  554.780300] RIP: 0010:dev_watchdog+0x203/0x210
[  554.780302] Code: 85 c0 75 e8 eb a8 4c 89 ef c6 05 81 44 b8 00 01 e8 72 8e
fc ff 44 89 e1 48 89 c2 4c 89 ee 48 c7 c7 18 61 40 ae e8 1d 1a 96 ff <0f> 0b eb
89 66 0f 1f 84 00 00 00 00 00 48 83 ec 38 48 89 5c 24 08                        
[  554.780303] RSP: 0018:ffff94c7402ece80 EFLAGS: 00010282
[  554.780304] RAX: 0000000000000039 RBX: ffff891eb1437600 RCX:
000000000000057b
[  554.780305] RDX: 0000000000000001 RSI: 0000000000000086 RDI:
ffffffffaeb45284
[  554.780306] RBP: ffff891eb160a3b8 R08: 0000000000000001 R09:
000000000000057b
[  554.780306] R10: ffff891ecf352694 R11: 0000000000000003 R12:
0000000000000000
[  554.780307] R13: ffff891eb160a000 R14: ffff891eb6fd7b40 R15:
0000000000000000
[  554.780308] FS:  0000000000000000(0000) GS:ffff891eb6fc0000(0000)
knlGS:0000000000000000
[  554.780309] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  554.780310] CR2: 00007fc22629e120 CR3: 00000005d3676000 CR4:
00000000001406e0
[  554.780311] Call Trace:
[  554.780312]  <IRQ>
[  554.780314]  ? qdisc_destroy+0x100/0x100
[  554.780317]  call_timer_fn+0x26/0x120
[  554.780320]  run_timer_softirq+0x317/0x990
[  554.780324]  ? tick_sched_timer+0x40/0x90
[  554.780327]  ? tick_sched_do_timer+0x50/0x50
[  554.780330]  ? __hrtimer_run_queues+0xe6/0x230
[  554.780333]  __do_softirq+0xd2/0x2c1
[  554.780337]  irq_exit+0x9f/0xb0
[  554.780340]  smp_apic_timer_interrupt+0x5b/0x110
[  554.780342]  apic_timer_interrupt+0xf/0x20
[  554.780343]  </IRQ>
[  554.780346] RIP: 0010:cpuidle_enter_state+0xaa/0x3b0
[  554.780348] Code: c4 0f 1f 44 00 00 31 ff e8 33 7b a1 ff 80 7c 24 0b 00 74
12 9c 58 f6 c4 02 0f 85 d6 02 00 00 31 ff e8 fa fa a5 ff fb 45 85 ed <0f> 88 32
02 00 00 49 63 c5 be 68 00 00 00 4c 2b 24 24 48 89 c2 48                        
[  554.780349] RSP: 0018:ffff94c74016fe80 EFLAGS: 00000202 ORIG_RAX:
ffffffffffffff13
[  554.780350] RAX: ffff891eb6fe5b00 RBX: ffff891eb2e92400 RCX:
000000000000001f
[  554.780351] RDX: 0000000000000000 RSI: 00000000239f54c3 RDI:
0000000000000000
[  554.780351] RBP: ffffffffae677f60 R08: 000000812b7afba2 R09:
000000000000000a
[  554.780352] R10: ffff891eb6fe4ca4 R11: ffff891eb6fe4c84 R12:
000000812b7afba2
[  554.780353] R13: 0000000000000002 R14: 0000000000000002 R15:
ffff891eb3b7d780
[  554.780356]  cpuidle_enter+0x32/0x50
[  554.780358]  do_idle+0x1ac/0x240
[  554.780360]  cpu_startup_entry+0x14/0x20
[  554.780363]  start_secondary+0x121/0x140
[  554.780365]  secondary_startup_64+0xa4/0xb0
[  554.780367] ---[ end trace 5eec21faf2ea881a ]---
[  554.827691] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc530]
[  554.983928] AMD-Vi: Completion-Wait loop timed out
[  555.658233] AMD-Vi: Completion-Wait loop timed out
[  555.829571] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc560]
[  556.831452] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc590]
[  557.833654] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc5c0]
[  557.974883] AMD-Vi: Completion-Wait loop timed out
[  558.835196] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc5f0]
[  559.837390] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc620]
[  559.981300] AMD-Vi: Completion-Wait loop timed out
[  560.644002] AMD-Vi: Completion-Wait loop timed out
[  560.838960] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc650]
[  561.840852] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc680]
[  562.522699] AMD-Vi: Completion-Wait loop timed out
[  562.842731] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc6b0]
[  563.393037] AMD-Vi: Completion-Wait loop timed out
[  563.844878] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc6e0]
[  564.846490] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc710]
[  564.992680] AMD-Vi: Completion-Wait loop timed out
[  565.848371] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc740]
[  566.372652] AMD-Vi: Completion-Wait loop timed out
[  566.850250] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc770]
[  567.562710] AMD-Vi: Completion-Wait loop timed out
[  567.852129] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc7a0]
[  568.854275] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc7d0]
[  569.856125] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc800]
[  570.122729] AMD-Vi: Completion-Wait loop timed out
[  570.352753] AMD-Vi: Completion-Wait loop timed out
[  570.495300] AMD-Vi: Completion-Wait loop timed out
[  570.858101] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc830]
[  571.132718] AMD-Vi: Completion-Wait loop timed out
[  571.859650] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc860]
[  572.132723] AMD-Vi: Completion-Wait loop timed out
[  572.861901] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc890]
[  573.132695] AMD-Vi: Completion-Wait loop timed out
[  573.322662] AMD-Vi: Completion-Wait loop timed out
[  573.863407] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc8c0]
[  574.865592] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc8f0]
[  575.132729] AMD-Vi: Completion-Wait loop timed out
[  575.482664] AMD-Vi: Completion-Wait loop timed out
[  575.867167] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc920]
[  576.132710] AMD-Vi: Completion-Wait loop timed out
[  576.869376] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc950]
[  577.132698] AMD-Vi: Completion-Wait loop timed out
[  577.870928] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc980]
[  578.132728] AMD-Vi: Completion-Wait loop timed out
[  578.872806] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc9b0]
[  579.132725] AMD-Vi: Completion-Wait loop timed out
[  579.874967] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc9e0]
[  580.132735] AMD-Vi: Completion-Wait loop timed out
[  580.876556] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cca10]
[  581.152501] AMD-Vi: Completion-Wait loop timed out
[  581.878448] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cca40]
[  582.880314] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cca70]
[  583.132723] AMD-Vi: Completion-Wait loop timed out
[  583.882215] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccaa0]
[  584.132700] AMD-Vi: Completion-Wait loop timed out
[  584.884525] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccad0]
[  585.132690] AMD-Vi: Completion-Wait loop timed out
[  585.255215] AMD-Vi: Completion-Wait loop timed out
[  585.377424] AMD-Vi: Completion-Wait loop timed out
[  585.499284] AMD-Vi: Completion-Wait loop timed out
[  585.885962] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccb00]
[  586.158322] AMD-Vi: Completion-Wait loop timed out
[  586.888362] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccb30]
[  587.132690] AMD-Vi: Completion-Wait loop timed out
[  587.722648] AMD-Vi: Completion-Wait loop timed out
[  587.890136] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccb60]
[  588.891605] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccb90]
[  589.032741] AMD-Vi: Completion-Wait loop timed out
[  589.893482] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccbc0]
[  590.132654] AMD-Vi: Completion-Wait loop timed out
[  590.895361] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccbf0]
[  591.132680] AMD-Vi: Completion-Wait loop timed out
[  591.897228] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccc20]
[  592.132678] AMD-Vi: Completion-Wait loop timed out
[  592.762697] AMD-Vi: Completion-Wait loop timed out
[  592.899123] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccc50]
[  593.142698] AMD-Vi: Completion-Wait loop timed out
[  593.900986] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccc80]
[  594.142715] AMD-Vi: Completion-Wait loop timed out
[  594.902879] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cccb0]
[  595.142720] AMD-Vi: Completion-Wait loop timed out
[  595.742686] AMD-Vi: Completion-Wait loop timed out
[  595.904744] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccce0]
[  596.906619] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccd10]
[  597.162370] AMD-Vi: Completion-Wait loop timed out
[  597.802698] AMD-Vi: Completion-Wait loop timed out
[  597.908500] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccd40]
[  598.418738] AMD-Vi: Completion-Wait loop timed out
[  598.910399] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccd70]
[  599.912278] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccda0]
[  600.423790] AMD-Vi: Completion-Wait loop timed out
[  600.914157] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccdd0]
[  601.916038] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cce00]
[  602.917916] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cce30]
[  603.919797] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cce60]
[  604.921677] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cce90]
[  605.923858] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccec0]
[  606.925715] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccef0]
[  607.927315] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccf20]
[  608.929195] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccf50]
[  609.931443] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccf80]
[  610.822665] AMD-Vi: Completion-Wait loop timed out
[  610.932953] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccfb0]
[  611.934834] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38ccfe0]
[  612.936713] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd010]
[  613.938592] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd040]
[  614.922675] AMD-Vi: Completion-Wait loop timed out
[  614.940457] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd070]
[  615.170144] AMD-Vi: Completion-Wait loop timed out
[  615.342644] AMD-Vi: Completion-Wait loop timed out
[  615.942353] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd0a0]
[  616.162765] AMD-Vi: Completion-Wait loop timed out
[  616.944220] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd0d0]
[  617.142695] AMD-Vi: Completion-Wait loop timed out
[  617.265181] AMD-Vi: Completion-Wait loop timed out
[  617.946111] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd100]
[  618.195682] AMD-Vi: Completion-Wait loop timed out
[  618.948247] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd130]
[  619.152673] AMD-Vi: Completion-Wait loop timed out
[  619.949872] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd160]
[  620.952034] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd190]
[  621.152719] AMD-Vi: Completion-Wait loop timed out
[  621.953621] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd1c0]
[  622.431668] AMD-Vi: Completion-Wait loop timed out
[  622.752699] AMD-Vi: Completion-Wait loop timed out
[  622.955511] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd1f0]
[  623.562702] AMD-Vi: Completion-Wait loop timed out
[  623.957395] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd220]
[  624.174481] AMD-Vi: Completion-Wait loop timed out
[  624.959281] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd250]
[  625.152876] AMD-Vi: Completion-Wait loop timed out
[  625.961420] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd280]
[  626.172590] AMD-Vi: Completion-Wait loop timed out
[  626.963024] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd2b0]
[  627.122734] AMD-Vi: Completion-Wait loop timed out
[  627.245266] AMD-Vi: Completion-Wait loop timed out
[  627.419709] AMD-Vi: Completion-Wait loop timed out
[  627.632702] AMD-Vi: Completion-Wait loop timed out
[  627.964908] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd2e0]
[  628.086894] AMD-Vi: Completion-Wait loop timed out
[  628.208778] AMD-Vi: Completion-Wait loop timed out
[  628.932712] AMD-Vi: Completion-Wait loop timed out
[  628.966770] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd310]
[  629.193296] AMD-Vi: Completion-Wait loop timed out
[  629.968668] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd340]
[  630.970636] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd370]
[  631.972423] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd3a0]
[  632.974307] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd3d0]
[  633.976183] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd400]
[  634.978063] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd430]
[  635.980329] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd460]
[  636.981822] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd490]
[  637.983702] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd4c0]
[  638.985583] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd4f0]
[  639.948979] AMD-Vi: Completion-Wait loop timed out
[  639.987812] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd520]
[  640.989340] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd550]
[  641.991223] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd580]
[  642.993102] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd5b0]
[  643.994981] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd5e0]
[  644.996861] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd610]
[  645.998742] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd640]
[  647.000639] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd670]
[  648.002500] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd6a0]
[  649.004380] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd6d0]
[  649.951428] AMD-Vi: Completion-Wait loop timed out
[  650.006524] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd700]
[  651.008140] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd730]
[  652.010320] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd760]
[  653.011895] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd790]
[  654.013761] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd7c0]
[  655.015655] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd7f0]
[  656.017520] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd820]
[  657.019414] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd850]
[  658.021295] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd880]
[  658.282669] AMD-Vi: Completion-Wait loop timed out
[  659.023492] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd8b0]
[  659.931699] AMD-Vi: Completion-Wait loop timed out
[  660.025325] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd8e0]
[  661.026933] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd910]
[  661.499977] amdgpu 0000:05:00.0: GPU BACO reset
[  661.500426] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  661.500430] amdgpu: [powerplay] 
                failed to send message 170 ret is 65535 
[  662.028971] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd940]
[  662.029967] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  662.029972] amdgpu: [powerplay] 
                failed to send message 171 ret is 65535 
[  662.212850] AMD-Vi: Completion-Wait loop timed out
[  663.030684] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd970]
[  663.322861] AMD-Vi: Completion-Wait loop timed out
[  664.032575] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd9a0]
[  665.034779] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cd9d0]
[  666.036657] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cda00]
[  666.509973] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for
more than 5secs aborting
[  666.510006] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios
stuck executing C48A (len 62, WS 0, PS 0) @ 0xC4A6
[  666.510039] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios
stuck executing B104 (len 183, WS 0, PS 8) @ 0xB11F
[  666.510039] [drm] asic atom init failed!
[  666.510041] amdgpu 0000:05:00.0: GPU reset succeeded, trying to resume
[  666.791060] amdgpu 0000:05:00.0: Wait for MC idle timedout !
[  667.038533] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cda30]
[  667.072001] amdgpu 0000:05:00.0: Wait for MC idle timedout !
[  667.072024] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  667.072035] [drm] VRAM is lost due to GPU reset!
[  667.078459] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  667.078462] amdgpu: [powerplay] 
                failed to send message 252 ret is 65535 
[  667.078467] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  667.078470] amdgpu: [powerplay] 
                failed to send message 253 ret is 65535 
[  667.078475] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  667.078478] amdgpu: [powerplay] 
                failed to send message 250 ret is 65535 
[  667.078482] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  667.078485] amdgpu: [powerplay] 
                failed to send message 251 ret is 65535 
[  667.078490] amdgpu: [powerplay] 
                last message was failed ret is 65535
[  667.078493] amdgpu: [powerplay] 
                failed to send message 254 ret is 65535 
[  667.359635] [drm] Timeout wait for RLC serdes 0,0
[  667.532814] AMD-Vi: Completion-Wait loop timed out
[  667.642202] amdgpu 0000:05:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[  667.642234] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <gfx_v8_0> failed -110
[  667.642248] amdgpu 0000:05:00.0: GPU reset(1) failed
[  667.642254] amdgpu 0000:05:00.0: GPU reset end with ret = -110
[  668.040077] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cda60]
[  669.041972] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cda90]
[  669.935488] AMD-Vi: Completion-Wait loop timed out
[  670.044252] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdac0]
[  670.442094] AMD-Vi: Completion-Wait loop timed out
[  671.045731] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdaf0]
[  672.047610] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdb20]
[  673.049491] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdb50]
[  674.051372] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdb80]
[  674.486333] AMD-Vi: Completion-Wait loop timed out
[  675.053248] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdbb0]
[  676.055131] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdbe0]
[  677.057009] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdc10]
[  678.058890] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdc40]
[  678.139982] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=62707, emitted seq=62707
[  678.140007] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process FahCore_22 pid 2578 thread FahCore_22 pid 2578
[  678.140010] amdgpu 0000:05:00.0: GPU reset begin!
[  679.060768] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdc70]
[  680.062646] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdca0]
[  681.064529] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdcd0]
[  682.066407] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd00]
[  683.068288] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd30]
[  684.070168] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd60]
[  684.983051] AMD-Vi: Completion-Wait loop timed out
[  685.072590] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdd90]
[  686.073927] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cddc0]
[  687.075806] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cddf0]
[  688.077686] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde20]
[  688.522654] AMD-Vi: Completion-Wait loop timed out
[  688.993059] AMD-Vi: Completion-Wait loop timed out
[  689.080106] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde50]
[  690.081445] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cde80]
[  690.442645] AMD-Vi: Completion-Wait loop timed out
[  690.565105] AMD-Vi: Completion-Wait loop timed out
[  691.042626] AMD-Vi: Completion-Wait loop timed out
[  691.083326] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdeb0]
[  691.457452] AMD-Vi: Completion-Wait loop timed out
[  692.085204] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdee0]
[  692.371165] AMD-Vi: Completion-Wait loop timed out
[  693.087661] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf10]
[  693.562673] AMD-Vi: Completion-Wait loop timed out
[  693.685128] AMD-Vi: Completion-Wait loop timed out
[  694.088963] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf40]
[  694.561050] AMD-Vi: Completion-Wait loop timed out
[  695.090844] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdf70]
[  696.092724] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdfa0]
[  697.094602] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cdfd0]
[  698.096483] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc000]
[  699.098362] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc030]
[  700.100242] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc060]
[  701.102121] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc090]
[  704.982748] AMD-Vi: Completion-Wait loop timed out
[  705.143108] AMD-Vi: Completion-Wait loop timed out
[  705.461695] AMD-Vi: Completion-Wait loop timed out
[  705.841814] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc0c0]
[  706.843693] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc0f0]
[  707.665828] AMD-Vi: Completion-Wait loop timed out
[  707.832667] AMD-Vi: Completion-Wait loop timed out
[  707.845907] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc120]
[  708.075426] AMD-Vi: Completion-Wait loop timed out
[  708.227112] AMD-Vi: Completion-Wait loop timed out
[  708.432515] AMD-Vi: Completion-Wait loop timed out
[  708.585303] AMD-Vi: Completion-Wait loop timed out
[  708.847456] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc150]
[  709.062654] AMD-Vi: Completion-Wait loop timed out
[  709.466507] AMD-Vi: Completion-Wait loop timed out
[  709.649581] AMD-Vi: Completion-Wait loop timed out
[  709.849332] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc180]
[  710.851518] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc1b0]
[  711.062646] AMD-Vi: Completion-Wait loop timed out
[  711.442631] AMD-Vi: Completion-Wait loop timed out
[  711.565105] AMD-Vi: Completion-Wait loop timed out
[  711.853091] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc1e0]
[  712.062645] AMD-Vi: Completion-Wait loop timed out
[  712.470212] AMD-Vi: Completion-Wait loop timed out
[  712.854970] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc210]
[  713.062647] AMD-Vi: Completion-Wait loop timed out
[  713.473707] AMD-Vi: Completion-Wait loop timed out
[  713.856851] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc240]
[  714.062685] AMD-Vi: Completion-Wait loop timed out
[  714.442634] AMD-Vi: Completion-Wait loop timed out
[  714.572640] AMD-Vi: Completion-Wait loop timed out
[  714.733053] AMD-Vi: Completion-Wait loop timed out
[  714.859000] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc270]
[  715.112641] AMD-Vi: Completion-Wait loop timed out
[  715.469298] AMD-Vi: Completion-Wait loop timed out
[  715.860629] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc2a0]
[  716.183121] AMD-Vi: Completion-Wait loop timed out
[  716.467638] AMD-Vi: Completion-Wait loop timed out
[  716.762649] AMD-Vi: Completion-Wait loop timed out
[  716.862490] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc2d0]
[  717.224081] AMD-Vi: Completion-Wait loop timed out
[  717.442631] AMD-Vi: Completion-Wait loop timed out
[  717.864369] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc300]
[  718.213053] AMD-Vi: Completion-Wait loop timed out
[  718.466026] AMD-Vi: Completion-Wait loop timed out
[  718.762637] AMD-Vi: Completion-Wait loop timed out
[  718.866250] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc330]
[  719.212740] AMD-Vi: Completion-Wait loop timed out
[  719.464608] AMD-Vi: Completion-Wait loop timed out
[  719.606456] AMD-Vi: Completion-Wait loop timed out
[  719.868108] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc360]
[  720.092954] AMD-Vi: Completion-Wait loop timed out
[  720.522641] AMD-Vi: Completion-Wait loop timed out
[  720.869991] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc390]
[  721.871885] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc3c0]
[  722.512997] AMD-Vi: Completion-Wait loop timed out
[  722.874078] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc3f0]
[  723.105790] AMD-Vi: Completion-Wait loop timed out
[  723.249442] AMD-Vi: Completion-Wait loop timed out
[  723.415385] AMD-Vi: Completion-Wait loop timed out
[  723.553623] AMD-Vi: Completion-Wait loop timed out
[  723.693712] AMD-Vi: Completion-Wait loop timed out
[  723.817076] AMD-Vi: Completion-Wait loop timed out
[  723.875626] iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
device=05:00.0 address=0x5f38cc420]

And all devices linked to the PCI bridge utimately fail (net, usb, SATA + SAS
controller,...) where the SAS controller seems to be the most angry about it:

Apr 11 06:56:09 linuxserver kernel: aacraid 0000:04:00.0: Issuing IOP reset
Apr 11 06:56:16 linuxserver kernel: sysrq: Emergency Sync
Apr 11 06:56:24 linuxserver kernel: <28>udevd[902]: worker [2699]
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:01.0/0000:04:00.0/host12/target12:1:46/12:1:46:0/block/sdk
is taking a long time
Apr 11 06:56:24 linuxserver kernel: <28>udevd[902]: worker [2697]
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:01.0/0000:04:00.0/host12/target12:1:18/12:1:18:0/block/sdi
is taking a long time
Apr 11 06:56:24 linuxserver kernel: <28>udevd[902]: worker [2698]
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:01.0/0000:04:00.0/host12/target12:1:36/12:1:36:0/block/sdj
is taking a long time
Apr 11 06:56:24 linuxserver kernel: <28>udevd[902]: worker [2696]
/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:01.0/0000:04:00.0/host12/target12:1:1/12:1:1:0/block/sdh
is taking a long time
Apr 11 06:57:29 linuxserver kernel: sd 12:0:1:0: Device offlined - not ready
after error recovery

... and a reboot is neccessary. I need to use "echo b > /proc/sysrq-trigger"
because the normal way is not possible.

so, while powerplay is working until some point, it is way too late to make the
CPU not overheat.

in "sensors", I saw the fan is only running at 70% when at 72 degrees, so maybe
some more agressive power / fan management would do the job?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
