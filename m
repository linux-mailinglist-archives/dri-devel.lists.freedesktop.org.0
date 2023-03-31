Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C836D1517
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 03:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63C10E077;
	Fri, 31 Mar 2023 01:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06510E077
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:43:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D85626228B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 454ABC433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680227033;
 bh=5ROPiVT2xDVcCukMjSvIpvXeqEUkNwRZdViy6uyvr6Y=;
 h=From:To:Subject:Date:From;
 b=YsS4bn31Y2Z7GioKv/mmgXOG6wu7BQ/P+Tc+i4mOoHnp56vtK3bEy9PhaLzdiHmJM
 0dEdjsO83lKFMVwTRN6b4g0n6z3cwHJSjVieBrZ8XEBjyl8JhcDrPwgtj0U9YmfG74
 p7fvnR6q3+9QjqPgLqO+im8iM66dkp/I/lHG/Op9+bLokM1sJv6LHx1exDb6F7+IP/
 Iw+1CuiT2pvWpXY0Iw+ohoJWpZ9rgb/byKQWhzlHSafaHu5crgbKuJhLncsC2OOCfb
 yqX3ptpKilcG5pQLM1YyLm/l+OsC/OMsRAZ/KkcmBmqid4+e+CYltXnupIpwynse3B
 ubKcL0zV7ibtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 26474C43141; Fri, 31 Mar 2023 01:43:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] New: ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Fri, 31 Mar 2023 01:43:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

            Bug ID: 217278
           Summary: ast 0000:03:00.0: PM: **** DPM device timeout ****
                    during S4 resuming
           Product: Drivers
           Version: 2.5
    Kernel Version: v6.3-rc4
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: wendy.wang@intel.com
        Regression: No

On Intel Emerald Rapids Server
ast driver will trigger unrecoverable kernel panic during S4 resuming.
If add "modprobe.blacklist=3Dast" kernel parameter to disable ast driver
Can avoid the kernel call trace.

[=C2=A0 456.012967] CPU251 is up
[=C2=A0 456.015985] smpboot: ++++++++++++++++++++=3D_---CPU UP=C2=A0 252
[=C2=A0 456.022183] smpboot: Booting Node 1 Processor 252 APIC 0xf9
[=C2=A0 456.028552] smpboot: Setting warm reset code and vector.
[=C2=A0 456.034650] smpboot: Asserting INIT
[=C2=A0 456.038648] smpboot: Waiting for send to finish...
[=C2=A0 456.044128] smpboot: Deasserting INIT
[=C2=A0 456.048334] smpboot: Waiting for send to finish...
[=C2=A0 456.053818] smpboot: #startup loops: 2
[=C2=A0 456.058131] smpboot: Sending STARTUP #1
[=C2=A0 456.062542] smpboot: After apic_write
[=C2=A0 456.066768] smpboot: Startup point 1
[=C2=A0 456.070898] smpboot: Waiting for send to finish...
[=C2=A0 456.076398] smpboot: Sending STARTUP #2
[=C2=A0 456.080832] smpboot: After apic_write
[=C2=A0 456.085082] smpboot: Startup point 1
[=C2=A0 456.089215] smpboot: Waiting for send to finish...
[=C2=A0 456.094718] smpboot: After Startup
[=C2=A0 456.124666] microcode: Load ucode for AP
[=C2=A0 456.129185] microcode: __load_ucode_intel: cp_data =3D 0x0000000000=
000000
cp_size =3D 0x0
000000000000 cp_size =3D 0x0ack at about 00000000937ed697
[=C2=A0 456.310542] smpboot: Stack at about 000000007168126e
[=C2=A0 456.316238] microcode: mc_cpu_starting: CPU253, err: 3
[=C2=A0 456.359827] CPU253 is up
[=C2=A0 456.362823] smpboot: ++++++++++++++++++++=3D_---CPU UP=C2=A0 254
[=C2=A0 456.369003] smpboot: Booting Node 1 Processor 254 APIC 0xfd
[=C2=A0 456.375378] smpboot: Setting warm reset code and vector.
[=C2=A0 456.381450] smpboot: Asserting INIT
[=C2=A0 456.385449] smpboot: Waiting for send to finish...
[=C2=A0 456.390924] smpboot: Deasserting INIT
[=C2=A0 456.395144] smpboot: Waiting for send to finish...
[=C2=A0 456.400590] smpboot: #startup loops: 2
[=C2=A0 456.404900] smpboot: Sending STARTUP #1
[=C2=A0 456.409299] smpboot: After apic_write
[=C2=A0 456.413555] smpboot: Startup point 1
[=C2=A0 456.417686] smpboot: Waiting for send to finish...
[=C2=A0 456.423193] smpboot: Sending STARTUP #2
[=C2=A0 456.427619] smpboot: After apic_write
[=C2=A0 456.431869] smpboot: Startup point 1
[=C2=A0 456.435993] smpboot: Waiting for send to finish...
[=C2=A0 456.441476] smpboot: After Startup
[=C2=A0 456.469575] microcode: Load ucode for AP
[=C2=A0 456.474101] microcode: __load_ucode_intel: cp_data =3D 0x0000000000=
000000
cp_size =3D 0x0
[=C2=A0 456.483382] smpboot: Stack [=C2=A0 457.507476] ttyS ttyS0: 1 input =
overrun(s)
[=C2=A0 457.509389] power_meter ACPI000D:00: Found ACPI power meter.
[=C2=A0 457.519717] serial 00:04: activated
[=C2=A0 457.524889] serial 00:05: activated
[=C2=A0 457.543671] nvme nvme0: 8/0/0 default/read/poll queues
[=C2=A0 457.840429] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[=C2=A0 457.847500] ata6: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.853654] ata5: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.859819] ata1: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.865967] ata8: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.872129] ata4: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.878292] ata2: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.884470] ata3: SATA link down (SStatus 4 SControl 300)
[=C2=A0 457.890626] ata7.00: supports DRM functions and may not be fully ac=
cessible
[=C2=A0 457.900562] ata7.00: supports DRM functions and may not be fully ac=
cessible
[=C2=A0 457.909510] ata7.00: configured for UDMA/133
[=C2=A0 458.532192] virbr0: port 1(ens3) entered disabled state
[=C2=A0 461.085827] igb 0000:27:00.0 ens1: igb: ens1 NIC Link is Up 1000 Mb=
ps Full
Duplex, Flow Control: RX
[=C2=A0 461.233851] igb 0000:a8:00.0 ens3: igb: ens3 NIC Link is Up 1000 Mb=
ps Full
Duplex, Flow Control: RX
[=C2=A0 461.347436] virbr0: port 1(ens3) entered blocking state
[=C2=A0 461.353412] virbr0: port 1(ens3) entered forwarding state
[=C2=A0 461.377813] igc 0000:01:00.0 enp1s0: NIC Link is Up 1000 Mbps Full =
Duplex,
Flow Control: RX/TX
[=C2=A0 469.667476] ast 0000:03:00.0: PM: **** DPM device timeout ****
[=C2=A0 469.674142] Call Trace:
[=C2=A0 469.676983]=C2=A0 <TASK>
[=C2=A0 469.679427]=C2=A0 __schedule+0x27a/0x6e0
[=C2=A0 469.683446]=C2=A0 ? _raw_spin_unlock_irqrestore+0x22/0x40
[=C2=A0 469.689117]=C2=A0 schedule+0x61/0xe0
[=C2=A0 469.692739]=C2=A0 schedule_timeout+0x7a/0xf0
[=C2=A0 469.697126]=C2=A0 ? __pfx_process_timeout+0x10/0x10
[=C2=A0 469.702216]=C2=A0 msleep+0x2d/0x40
[=C2=A0 469.705623]=C2=A0 ast_dp_launch+0x36/0xc0 [ast]
[=C2=A0 469.710328]=C2=A0 ast_post_gpu+0x1fa/0x240 [ast]
[=C2=A0 469.715096]=C2=A0 ast_pm_thaw+0x16/0x20 [ast]
[=C2=A0 469.719554]=C2=A0 pci_pm_thaw+0x44/0xa0
[=C2=A0 469.723450]=C2=A0 ? __pfx_pci_pm_thaw+0x10/0x10
[=C2=A0 469.728146]=C2=A0 dpm_run_callback+0x95/0x200
[=C2=A0 469.732653]=C2=A0 device_resume+0xea/0x210
[=C2=A0 469.736865]=C2=A0 ? __pfx_dpm_watchdog_handler+0x10/0x10
[=C2=A0 469.742413]=C2=A0 async_resume+0x1e/0x60
[=C2=A0 469.746401]=C2=A0 async_run_entry_fn+0x39/0x140
[=C2=A0 469.751098]=C2=A0 process_one_work+0x196/0x3c0
[=C2=A0 469.755691]=C2=A0 worker_thread+0x51/0x3a0
[=C2=A0 469.759902]=C2=A0 ? __pfx_worker_thread+0x10/0x10
[=C2=A0 469.764792]=C2=A0 kthread+0xea/0x120
[=C2=A0 469.768405]=C2=A0 ? __pfx_kthread+0x10/0x10
[=C2=A0 469.772695]=C2=A0 ret_from_fork+0x29/0x50
[=C2=A0 469.776793]=C2=A0 </TASK>
[=C2=A0 469.779346] Kernel panic - not syncing: ast 0000:03:00.0: unrecover=
able
failure
[=C2=A0 469.787630] CPU: 153 PID: 0 Comm: swapper/153 Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
6.3.0-rc4-2023-03-28-intel-next-02154-g257279c18b21 #1
[=C2=A0 469.800891] Hardware name: Intel Corporation ArcherCity/ArcherCity,=
 BIOS
EGSDCRB1.SYS.0100.D45.2303121331 03/12/2023
[=C2=A0 469.812782] Call Trace:
[=C2=A0 469.815614]=C2=A0 <IRQ>
[=C2=A0 469.817926]=C2=A0 dump_stack_lvl+0x36/0x50
[=C2=A0 469.822124]=C2=A0 panic+0x343/0x350
[=C2=A0 469.825665]=C2=A0 ? __pfx_dpm_watchdog_handler+0x10/0x10
[=C2=A0 469.831240]=C2=A0 ? __pfx_dpm_watchdog_handler+0x10/0x10
[=C2=A0 469.836775]=C2=A0 dpm_watchdog_handler+0x56/0x60
[=C2=A0 469.841571]=C2=A0 call_timer_fn+0x2b/0x140
[=C2=A0 469.845766]=C2=A0 __run_timers.part.0+0x1e7/0x280
[=C2=A0 469.850652]=C2=A0 ? tick_sched_timer+0x73/0x90
[=C2=A0 469.855257]=C2=A0 ? _raw_spin_lock_irq+0x18/0x30
[=C2=A0 469.860041]=C2=A0 ? __hrtimer_run_queues+0x13c/0x2d0
[=C2=A0 469.865220]=C2=A0 ? lapic_timer_shutdown.part.0+0x33/0x50
[=C2=A0 469.870897]=C2=A0 ? lapic_timer_shutdown+0x14/0x20
[=C2=A0 469.875882]=C2=A0 run_timer_softirq+0x35/0x70
[=C2=A0 469.880361]=C2=A0 __do_softirq+0x102/0x31d
[=C2=A0 469.884545]=C2=A0 irq_exit_rcu+0xc1/0x130
[=C2=A0 469.888663]=C2=A0 sysvec_apic_timer_interrupt+0xa2/0xd0
[=C2=A0 469.894150]=C2=A0 </IRQ>
[=C2=A0 469.896589]=C2=A0 <TASK>
[=C2=A0 469.899023]=C2=A0 asm_sysvec_apic_timer_interrupt+0x1a/0x20
[=C2=A0 469.904892] RIP: 0010:cpuidle_enter_state+0xd0/0x420
[=C2=A0 469.910547] Code: ff ff 8b 53 04 49 89 c5 8b 05 84 b5 ff 00 85 c0 0=
f 8f e3
02 00 00 31 ff e8 6d ab e7 fe 45 84 ff 0f 85 e3 01 00 00 fb 45 85 f6 <0f> 8=
8 1e
01 00 00 48 8b 04 24 49 63 ce 48 6b d1 68 49 29 c5 48 89
[=C2=A0 469.931691] RSP: 0000:ff85092306c3fe88 EFLAGS: 00000206
[=C2=A0 469.937654] RAX: ff44661abdc40000 RBX: ffb7091ad765af00 RCX:
0000000000000000
[=C2=A0 469.945736] RDX: 0000000000000099 RSI: ffffffff99c06314 RDI:
ffffffff99c0ac47
[=C2=A0 469.953814] RBP: 0000000000000003 R08: ffffffca120fb4c4 R09:
000000004b4b4b4b
[=C2=A0 469.961903] R10: 0000000000000010 R11: 00000000000025d6 R12:
ffffffff9a27c940
[=C2=A0 469.970007] R13: 0000006d5a5cd0ff R14: 0000000000000003 R15:
0000000000000000
[=C2=A0 469.978117]=C2=A0 ? cpuidle_enter_state+0xc3/0x420
[=C2=A0 469.983056]=C2=A0 cpuidle_enter+0x2d/0x40
[=C2=A0 469.987155]=C2=A0 cpuidle_idle_call+0x101/0x170
[=C2=A0 469.991825]=C2=A0 do_idle+0x74/0xc0
[=C2=A0 469.995336]=C2=A0 cpu_startup_entry+0x1d/0x20
[=C2=A0 469.999822]=C2=A0 start_secondary+0x12d/0x130
[=C2=A0 470.004310]=C2=A0 secondary_startup_64_no_verify+0xe0/0xeb
[=C2=A0 470.010063]=C2=A0 </TASK>
[=C2=A0 470.125520] Kernel Offset: 0x17000000 from 0xffffffff81000000 (relo=
cation
range: 0xffffffff80000000-0xffffffffbfffffff)
[=C2=A0 470.575721] ---[ end Kernel panic - not syncing: ast 0000:03:00.0:
unrecoverable failure ]---

[root@emr-2s7 ~]# lspci -vvv -s 03:00.0
03:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics
Family (rev 52) (prog-if 00 [VGA controller])
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: ASPEED Technology, In=
c. ASPEED Graphics Family
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster- Sp=
ecCycle- MemWINV- VGASnoop- ParErr+
Stepping- SERR+ FastB2B- DisINTx-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB2B=
- ParErr- DEVSEL=3Dmedium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to IRQ 16
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NUMA node: 0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMMU group: 72
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at 94000000 (32=
-bit, non-prefetchable) [size=3D16M]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 1: Memory at 95000000 (32=
-bit, non-prefetchable) [size=3D256K]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 2: I/O ports at 1000 [siz=
e=3D128]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [40] Power Managem=
ent version 3
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [50] MSI: Enable- =
Count=3D1/4 Maskable- 64bit+
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Address: 0000000000000000=C2=A0 Data: 0000
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel modules: ast

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
