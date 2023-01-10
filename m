Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3F664629
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5610E136;
	Tue, 10 Jan 2023 16:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8178710E136
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:33:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6BD9B810F8;
 Tue, 10 Jan 2023 16:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6146BC433EF;
 Tue, 10 Jan 2023 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673368386;
 bh=jr2pZ/UMSVbzFz+1Yzl7inZVl9e465D9yUp1u1Q4HWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7wt/qBGpMLMnFKAje0arJvY70Oha1GtNVBT+xWhFCRXff+9DF1wRT4Qi/08nQVml
 ihEBcGs8VyZpZ/9JKk9kHo526BcTr8k15x7tpYABUT5CWIYapwnuAKWaCxrcGsGJga
 rL93WMGmKJSYCtTWaInqH4F34bYdAZaONc9FOo9jHjITGdoCfXPpqrvSdvrLket1Ld
 r2M+QMwzm/lhOeExENNU/Cx/754P1AEgmEBFzjNeMktDgKEKTkmRifKgsviIBKnwuu
 TMoftNzLEwl+JLQCgQ89tSznHlsVNM/rQ/w9E83eK6T1zXIZyNMuW6+GdRIZLz6Ame
 M9M5vnSyBqxPw==
Date: Tue, 10 Jan 2023 16:32:59 +0000
From: Will Deacon <will@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: next-20230110: arm64: defconfig+kselftest config boot failed -
 Unable to handle kernel paging request at virtual address fffffffffffffff8
Message-ID: <20230110163258.GC9436@willie-the-truck>
References: <CA+G9fYsns3krivbPSjQ1c1EQpVyd-bkW84MaUvqMTQr9c=iEaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsns3krivbPSjQ1c1EQpVyd-bkW84MaUvqMTQr9c=iEaw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Aishwarya TCV <aishwarya.tcv@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, regressions@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, nathan@kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, james.clark@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+ James and Nathan]

On Tue, Jan 10, 2023 at 09:44:40PM +0530, Naresh Kamboju wrote:
> [ please ignore this email if this regression already reported ]
> 
> Today's Linux next tag next-20230110 boot passes with defconfig but
> boot fails with
> defconfig + kselftest merge config on arm64 devices and qemu-arm64.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> We are bisecting this problem and get back to you shortly.
> 
> GOOD: next-20230109  (defconfig + kselftests configs)
> BAD: next-20230110 (defconfig + kselftests configs)

I couldn't find a kselftests .config in the tree (assumedly I'm just ont
looking hard enough), but does that happen to enable CONFIG_STACK_TRACER=y?

If so, since you're using clang, I wonder if this is an issue with
68a63a412d18 ("arm64: Fix build with CC=clang, CONFIG_FTRACE=y and
CONFIG_STACK_TRACER=y")?

Please let us know how the bisection goes...

Will

> kernel crash log [1]:
> 
> [   15.302140] Unable to handle kernel paging request at virtual
> address fffffffffffffff8
> [   15.309906] Mem abort info:
> [   15.312659]   ESR = 0x0000000096000004
> [   15.316365]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   15.321626]   SET = 0, FnV = 0
> [   15.324644]   EA = 0, S1PTW = 0
> [   15.327744]   FSC = 0x04: level 0 translation fault
> [   15.332619] Data abort info:
> [   15.335422]   ISV = 0, ISS = 0x00000004
> [   15.339226]   CM = 0, WnR = 0
> [   15.342154] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000001496c000
> [   15.348795] [fffffffffffffff8] pgd=0000000000000000, p4d=0000000000000000
> [   15.355524] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [   15.361729] Modules linked in: meson_gxl dwmac_generic
> snd_soc_meson_gx_sound_card snd_soc_meson_card_utils lima gpu_sched
> drm_shmem_helper meson_drm drm_dma_helper crct10dif_ce meson_ir
> rc_core meson_dw_hdmi dw_hdmi meson_canvas dwmac_meson8b
> stmmac_platform meson_rng stmmac rng_core cec meson_gxbb_wdt
> drm_display_helper snd_soc_meson_aiu snd_soc_meson_codec_glue pcs_xpcs
> snd_soc_meson_t9015 amlogic_gxl_crypto crypto_engine display_connector
> snd_soc_simple_amplifier drm_kms_helper drm nvmem_meson_efuse
> [   15.405976] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted
> 6.2.0-rc3-next-20230110 #1
> [   15.413563] Hardware name: Libre Computer AML-S905X-CC (DT)
> [   15.419086] Workqueue: events_unbound deferred_probe_work_func
> [   15.424863] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   15.431762] pc : of_drm_find_bridge+0x38/0x70 [drm]
> [   15.436594] lr : of_drm_find_bridge+0x20/0x70 [drm]
> [   15.441423] sp : ffff80000a04b9b0
> [   15.444700] x29: ffff80000a04b9b0 x28: ffff000008de5810 x27: ffff000008de5808
> [   15.451772] x26: ffff000008de5800 x25: ffff0000084cb8b0 x24: ffff000001223c00
> [   15.458844] x23: 0000000000000000 x22: 0000000000000001 x21: ffff00007fa61a28
> [   15.465917] x20: ffff0000084ca080 x19: ffff00007fa61a28 x18: ffff0000019bd700
> [   15.472989] x17: 6d64685f77645f6e x16: ffffffffffffffff x15: 0000000000000004
> [   15.480062] x14: ffff800009bab410 x13: 0000000000000000 x12: 0000000000000003
> [   15.487135] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [   15.494207] x8 : ffff8000010a70a0 x7 : 64410079616b6f01 x6 : 8041640000000003
> [   15.501279] x5 : 0300000000644100 x4 : 0000000000000080 x3 : 0041640000000000
> [   15.508352] x2 : ffff000001128000 x1 : 0000000000000000 x0 : 0000000000000000
> [   15.515426] Call trace:
> [   15.517863] Insufficient stack space to handle exception!
> [   15.517867] ESR: 0x0000000096000047 -- DABT (current EL)
> [   15.517871] FAR: 0xffff80000a047ff0
> [   15.517873] Task stack:     [0xffff80000a048000..0xffff80000a04c000]
> [   15.517877] IRQ stack:      [0xffff800008008000..0xffff80000800c000]
> [   15.517880] Overflow stack: [0xffff00007d9c1320..0xffff00007d9c2320]
> [   15.517884] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted
> 6.2.0-rc3-next-20230110 #1
> [   15.517890] Hardware name: Libre Computer AML-S905X-CC (DT)
> [   15.517895] Workqueue: events_unbound deferred_probe_work_func
> [   15.517915] pstate: 800003c5 (Nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   15.517923] pc : el1_abort+0x4/0x5c
> [   15.517932] lr : el1h_64_sync_handler+0x60/0xac
> [   15.517939] sp : ffff80000a048020
> [   15.517941] x29: ffff80000a048020 x28: ffff000001128000 x27: ffff000008de5808
> [   15.517950] x26: ffff000008de5800 x25: ffff80000a04b608 x24: ffff000001128000
> [   15.517957] x23: 00000000a00000c5 x22: ffff8000080321dc x21: ffff80000a048180
> [   15.517965] x20: ffff8000098e1000 x19: ffff80000a048290 x18: ffff0000019bd700
> [   15.517972] x17: 0000000000000011 x16: ffffffffffffffff x15: 0000000000000004
> [   15.517979] x14: ffff800009bab410 x13: 0000000000000000 x12: 0000000000000000
> [   15.517986] x11: 0000000000000030 x10: ffff800009013a1c x9 : ffff8000090401a0
> [   15.517994] x8 : 0000000000000025 x7 : 205d363234353135 x6 : 352e35312020205b
> [   15.518001] x5 : ffff800009f766b7 x4 : ffff800008fe695c x3 : 000000000000000c
> [   15.518008] x2 : 0000000096000004 x1 : 0000000096000004 x0 : ffff80000a048030
> [   15.518017] Kernel panic - not syncing: kernel stack overflow
> [   15.518020] SMP: stopping secondary CPUs
> [   15.518027] Kernel Offset: disabled
> [   15.518029] CPU features: 0x00000,01000100,0000421b
> [   15.518034] Memory Limit: none
> [   15.679388] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> 
> 
> [1]
> https://storage.kernelci.org/next/master/next-20230110/arm64/defconfig/clang-16/lab-broonie/kselftest-arm64-meson-gxl-s905x-libretech-cc.html
> https://storage.kernelci.org/next/master/next-20230110/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/kselftest-arm64-sc7180-trogdor-lazor-limozeen.html
> https://storage.kernelci.org/next/master/next-20230110/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/kselftest-arm64-mt8173-elm-hana.html
> 
> Test case details:
> https://linux.kernelci.org/test/plan/id/63bd1bbadefcf2bc871d3ae5/
> https://linux.kernelci.org/test/case/id/63bd1bbadefcf2bc871d3ae6/
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.2.0-rc3-next-20230110 (KernelCI@build-j815994-arm64-clang-16-defconfig-2qclb) (Debian clang version 16.0.0 (++20230109071901+ba7af0bf6932-1~exp1~20230109071950.525), Debian LLD 16.0.0) #1 SMP PREEMPT Tue Jan 10 05:18:28 UTC 2023
> [    0.000000] Machine model: Libre Computer AML-S905X-CC
> [    0.000000] efi: UEFI not found.
> [    0.000000] OF: fdt: Reserved memory: failed to reserve memory for node 'hwrom@0': base 0x0000000000000000, size 16 MiB
> [    0.000000] OF: fdt: Reserved memory: failed to reserve memory for node 'secmon@10000000': base 0x0000000010000000, size 2 MiB
> [    0.000000] Reserved memory: created CMA memory pool at 0x000000006ac00000, size 256 MiB
> [    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x000000007fe5afff]
> [    0.000000] NUMA: NODE_DATA [mem 0x7fa3ba00-0x7fa3dfff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000007fe5afff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000004ffffff]
> [    0.000000]   node   0: [mem 0x0000000005000000-0x00000000072fffff]
> [    0.000000]   node   0: [mem 0x0000000007300000-0x000000007fe5afff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fe5afff]
> [    0.000000] On node 0, zone DMA: 421 pages in unavailable ranges
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.2
> [    0.000000] percpu: Embedded 21 pages/cpu s48808 r8192 d29016 u86016
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Fallback order for Node 0: 0 
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 515681
> [    0.000000] Policy zone: DMA
> [    0.000000] Kernel command line: console=ttyAML0,115200n8 root=/dev/nfs rw nfsroot=192.168.56.75:/var/lib/lava/dispatcher/tmp/81075/extract-nfsrootfs-bawzp4kx,tcp,hard  ip=dhcp
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> [    0.000000] Memory: 1686928K/2095468K available (16576K kernel code, 3912K rwdata, 9348K rodata, 2048K init, 609K bss, 146396K reserved, 262144K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
> [    0.000000] 	Trampoline variant of Tasks RCU enabled.
> [    0.000000] 	Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GIC: Using split EOI/Deactivate mode
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
> [    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
> [    0.001262] Console: colour dummy device 80x25
> [    0.001343] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=96000)
> [    0.001355] pid_max: default: 32768 minimum: 301
> [    0.001416] LSM: initializing lsm=capability,integrity
> [    0.001519] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.001536] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.002983] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.002999] cblist_init_generic: Setting shift to 2 and lim to 1.
> [    0.003067] cblist_init_generic: Setting shift to 2 and lim to 1.
> [    0.003215] rcu: Hierarchical SRCU implementation.
> [    0.003219] rcu: 	Max phase no-delay instances is 1000.
> [    0.005690] EFI services will not be available.
> [    0.006042] smp: Bringing up secondary CPUs ...
> [    0.006566] Detected VIPT I-cache on CPU1
> [    0.006686] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.007302] Detected VIPT I-cache on CPU2
> [    0.007411] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> [    0.008012] Detected VIPT I-cache on CPU3
> [    0.008124] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
> [    0.008207] smp: Brought up 1 node, 4 CPUs
> [    0.008214] SMP: Total of 4 processors activated.
> [    0.008218] CPU features: detected: 32-bit EL0 Support
> [    0.008221] CPU features: detected: 32-bit EL1 Support
> [    0.008227] CPU features: detected: CRC32 instructions
> [    0.008289] CPU: All CPU(s) started at EL2
> [    0.008369] alternatives: applying system-wide alternatives
> [    0.010507] devtmpfs: initialized
> [    0.016604] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.016635] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> [    0.022569] pinctrl core: initialized pinctrl subsystem
> [    0.024617] DMI not present or invalid.
> [    0.025263] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.026298] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
> [    0.026578] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.026739] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.026812] audit: initializing netlink subsys (disabled)
> [    0.027009] audit: type=2000 audit(0.024:1): state=initialized audit_enabled=0 res=1
> [    0.028249] thermal_sys: Registered thermal governor 'step_wise'
> [    0.028261] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.028350] cpuidle: using governor menu
> [    0.028609] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.028710] ASID allocator initialised with 65536 entries
> [    0.030589] Serial: AMBA PL011 UART driver
> [    0.050210] platform c883a000.hdmi-tx: Fixing up cyclic dependency with d0100000.vpu
> [    0.052573] platform cvbs-connector: Fixing up cyclic dependency with d0100000.vpu
> [    0.053502] platform hdmi-connector: Fixing up cyclic dependency with c883a000.hdmi-tx
> [    0.057055] KASLR disabled due to lack of seed
> [    0.057777] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.057789] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.057796] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.057799] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
> [    0.057804] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.057807] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.057812] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.057816] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
> [    0.059511] ACPI: Interpreter disabled.
> [    0.062687] iommu: Default domain type: Translated 
> [    0.062700] iommu: DMA domain TLB invalidation policy: strict mode 
> [    0.063020] SCSI subsystem initialized
> [    0.063390] usbcore: registered new interface driver usbfs
> [    0.063414] usbcore: registered new interface driver hub
> [    0.063439] usbcore: registered new device driver usb
> [    0.064563] pps_core: LinuxPPS API ver. 1 registered
> [    0.064569] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.064583] PTP clock support registered
> [    0.064756] EDAC MC: Ver: 3.0.0
> [    0.066616] FPGA manager framework
> [    0.066716] Advanced Linux Sound Architecture Driver Initialized.
> [    0.067663] vgaarb: loaded
> [    0.068065] clocksource: Switched to clocksource arch_sys_counter
> [    0.068286] VFS: Disk quotas dquot_6.6.0
> [    0.068322] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.068521] pnp: PnP ACPI: disabled
> [    0.074398] NET: Registered PF_INET protocol family
> [    0.074701] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.076378] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
> [    0.076413] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.076426] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.076550] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linear)
> [    0.076935] TCP: Hash tables configured (established 16384 bind 16384)
> [    0.077063] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
> [    0.077117] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
> [    0.077290] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.077723] RPC: Registered named UNIX socket transport module.
> [    0.077733] RPC: Registered udp transport module.
> [    0.077735] RPC: Registered tcp transport module.
> [    0.077738] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.077748] PCI: CLS 0 bytes, default 64
> [    0.077971] Unpacking initramfs...
> [    0.078619] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
> [    0.079173] kvm [1]: IPA Size Limit: 40 bits
> [    0.081299] kvm [1]: vgic interrupt IRQ9
> [    0.081396] kvm [1]: Hyp mode initialized successfully
> [    0.082801] Initialise system trusted keyrings
> [    0.083076] workingset: timestamp_bits=42 max_order=19 bucket_order=0
> [    0.083475] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.083847] NFS: Registering the id_resolver key type
> [    0.083886] Key type id_resolver registered
> [    0.083891] Key type id_legacy registered
> [    0.083924] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [    0.083929] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [    0.084203] 9p: Installing v9fs 9p2000 file system support
> [    0.116765] Key type asymmetric registered
> [    0.116781] Asymmetric key parser 'x509' registered
> [    0.116866] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [    0.116873] io scheduler mq-deadline registered
> [    0.116878] io scheduler kyber registered
> [    0.118617] irq_meson_gpio: 110 to 8 gpio interrupt mux initialized
> [    0.135078] EINJ: ACPI disabled.
> [    0.159731] soc soc0: Amlogic Meson GXL (S905X) Revision 21:d (84:2) Detected
> [    0.170927] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.174933] SuperH (H)SCI(F) driver initialized
> [    0.175827] c81004c0.serial: ttyAML0 at MMIO 0xc81004c0 (irq = 18, base_baud = 1500000) is a meson_uart
> [    0.175899] printk: console [ttyAML0] enabled
> [    1.019195] Freeing initrd memory: 18984K
> [    1.021972] msm_serial: driver initialized
> [    1.180405] loop: module loaded
> [    1.181719] megasas: 07.719.03.00-rc1
> [    1.190027] tun: Universal TUN/TAP device driver, 1.6
> [    1.191319] thunder_xcv, ver 1.0
> [    1.192716] thunder_bgx, ver 1.0
> [    1.195853] nicpf, ver 1.0
> [    1.200523] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
> [    1.205678] hns3: Copyright (c) 2017 Huawei Corporation.
> [    1.210989] hclge is initializing
> [    1.214237] e1000: Intel(R) PRO/1000 Network Driver
> [    1.219037] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    1.224758] e1000e: Intel(R) PRO/1000 Network Driver
> [    1.229646] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    1.235529] igb: Intel(R) Gigabit Ethernet Network Driver
> [    1.240858] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    1.246400] igbvf: Intel(R) Gigabit Virtual Function Network Driver
> [    1.252588] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> [    1.259016] sky2: driver version 1.30
> [    1.264029] VFIO - User Level meta-driver version: 0.3
> [    1.271574] usbcore: registered new interface driver usb-storage
> [    1.277325] i2c_dev: i2c /dev entries driver
> [    1.285686] ghes_edac: GHES probing device list is empty
> [    1.288566] sdhci: Secure Digital Host Controller Interface driver
> [    1.294400] sdhci: Copyright(c) Pierre Ossman
> [    1.299968] Synopsys Designware Multimedia Card Interface Driver
> [    1.306409] sdhci-pltfm: SDHCI platform and OF driver helper
> [    1.306491] meson-gx-mmc d0074000.mmc: allocated mmc-pwrseq
> [    1.315815] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.323914] meson-sm: secure-monitor enabled
> [    1.326541] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
> [    1.333638] usbcore: registered new interface driver usbhid
> [    1.337865] usbhid: USB HID core driver
> [    1.343235] platform-mhu c883c404.mailbox: Platform MHU Mailbox registered
> [    1.353900] meson-gx-mmc d0074000.mmc: no support for card's volts
> [    1.354576] mmc1: error -22 whilst initialising SDIO card
> [    1.363208] NET: Registered PF_PACKET protocol family
> [    1.365029] 9pnet: Installing 9P2000 support
> [    1.369232] Key type dns_resolver registered
> [    1.381879] registered taskstats version 1
> [    1.382017] Loading compiled-in X.509 certificates
> [    1.412271] dwc3-meson-g12a d0078080.usb: USB2 ports: 2
> [    1.412313] dwc3-meson-g12a d0078080.usb: USB3 ports: 0
> [    1.954364] dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
> [    1.956005] dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
> [    1.963329] dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
> [    1.973363] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [    1.975374] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
> [    1.983114] xhci-hcd xhci-hcd.0.auto: USB3 root hub has no ports
> [    1.988914] xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
> [    1.998271] xhci-hcd xhci-hcd.0.auto: irq 25, io mem 0xc9000000
> [    2.004858] hub 1-0:1.0: USB hub found
> [    2.007818] hub 1-0:1.0: 2 ports detected
> [    2.017395] scpi_protocol scpi: SCP Protocol legacy pre-1.0 firmware
> [    2.017951] mdson-gx-mmc d0072000.mmc: Got CD GPIO
> omain-0 init dvfs: 4
> [    2.052159] Trying to probe devices needed for running init ...
> [    2.089199] mmc0: new high speed SDXC card at address 59b4
> [    2.089955] mmcblk0: mmc0:59b4 SD128 119 GiB 
> [    2.096589]  mmcblk0: p1 p2 p3
> [    2.096916] mmcblk0: p3 size 1224704 extends beyond EOD, truncated
> [    2.264087] usb 1-1: new high-speed USB device number 2 using xhci-hcd
> [    2.453974] hub 1-1:1.0: USB hub found
> [    2.454695] hub 1-1:1.0: 4 ports detected
> [    2.466394] mmc1: Card stuck being busy! __mmc_poll_for_busy
> [   12.266087] platform c883455c.eth-phy-mux: deferred probe pending
> [   14.337755] ALSA device list:
> [   14.337936]   No soundcards found.
> [   14.351381] Freeing unused kernel memory: 2048K
> [   14.352541] Run /init as init process
> Loading, please wait...
> Starting version 247.3-7+deb11u1
> [   15.002694] gxl-crypto c883e000.crypto: will run requests pump with realtime priority
> [   15.010106] random: crng init done
> [   15.016152] gxl-crypto c883e000.crypto: will run requests pump with realtime priority
> [   15.040684] meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
> [   15.041672] meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
> [   15.056432] Registered IR keymap rc-empty
> [   15.056572] rc rc0: meson-ir as /devices/platform/soc/c8100000.bus/c8100580.ir/rc/rc0
> [   15.063474] input: meson-ir as /devices/platform/soc/c8100000.bus/c8100580.ir/rc/rc0/input0
> [   15.071611] meson8b-dwmac c9410000.ethernet: PTP uses main clock
> [   15.076297] meson-ir c8100580.ir: receiver initialized
> [   15.085541] meson-drm d0100000.vpu: Queued 2 outputs on vpu
> [   15.091067] meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
> [   15.093562] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
> [   15.094603] meson8b-dwmac c9410000.ethernet: 	DWMAC1000
> [   15.105478] meson-drm d0100000.vpu: Failed to find HDMI transceiver bridge
> [   15.108754] meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
> [   15.119838] lima d00c0000.gpu: gp - mali450 version major 0 minor 0
> [   15.122817] meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
> [   15.122827] meson8b-dwmac c9410000.ethernet: COE Type 2
> [   15.122833] meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
> [   15.122837] meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
> [   15.122986] meson8b-dwmac c9410000.ethernet: Normal descriptors
> [   15.141218] meson-drm d0100000.vpu: Queued 2 outputs on vpu
> [   15.141615] meson8b-dwmac c9410000.ethernet: Ring mode enabled
> [   15.150744] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
> [   15.154970] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [   15.159175] lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0
> [   15.161436] meson-drm d0100000.vpu: Failed to find HDMI transceiver bridge
> [   15.168933] lima d00c0000.gpu: pp1 - mali450 version major 0 minor 0
> [   15.206102] meson-drm d0100000.vpu: Queued 2 outputs on vpu
> [   15.209608] lima d00c0000.gpu: pp2 - mali450 version major 0 minor 0
> [   15.217027] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
> [   15.221169] lima d00c0000.gpu: l2 cache 8K, 4-way, 64byte cache line, 128bit external bus
> [   15.231561] meson-drm d0100000.vpu: Failed to find HDMI transceiver bridge
> [   15.238133] lima d00c0000.gpu: l2 cache 64K, 4-way, 64byte cache line, 128bit external bus
> [   15.253879] lima d00c0000.gpu: bus rate = 166666667
> [   15.257128] lima d00c0000.gpu: mod rate = 24000000
> [   15.261862] lima d00c0000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> [   15.286143] [drm] Initialized lima 1.1.0 20191231 for d00c0000.gpu on minor 1
> [   15.292259] meson-drm d0100000.vpu: Queued 2 outputs on vpu
> [   15.293715] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
> [   15.302140] Unable to handle kernel paging request at virtual address fffffffffffffff8
> [   15.309906] Mem abort info:
> [   15.312659]   ESR = 0x0000000096000004
> [   15.316365]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   15.321626]   SET = 0, FnV = 0
> [   15.324644]   EA = 0, S1PTW = 0
> [   15.327744]   FSC = 0x04: level 0 translation fault
> [   15.332619] Data abort info:
> [   15.335422]   ISV = 0, ISS = 0x00000004
> [   15.339226]   CM = 0, WnR = 0
> [   15.342154] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000001496c000
> [   15.348795] [fffffffffffffff8] pgd=0000000000000000, p4d=0000000000000000
> [   15.355524] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [   15.361729] Modules linked in: meson_gxl dwmac_generic snd_soc_meson_gx_sound_card snd_soc_meson_card_utils lima gpu_sched drm_shmem_helper meson_drm drm_dma_helper crct10dif_ce meson_ir rc_core meson_dw_hdmi dw_hdmi meson_canvas dwmac_meson8b stmmac_platform meson_rng stmmac rng_core cec meson_gxbb_wdt drm_display_helper snd_soc_meson_aiu snd_soc_meson_codec_glue pcs_xpcs snd_soc_meson_t9015 amlogic_gxl_crypto crypto_engine display_connector snd_soc_simple_amplifier drm_kms_helper drm nvmem_meson_efuse
> [   15.405976] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc3-next-20230110 #1
> [   15.413563] Hardware name: Libre Computer AML-S905X-CC (DT)
> [   15.419086] Workqueue: events_unbound deferred_probe_work_func
> [   15.424863] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   15.431762] pc : of_drm_find_bridge+0x38/0x70 [drm]
> [   15.436594] lr : of_drm_find_bridge+0x20/0x70 [drm]
> [   15.441423] sp : ffff80000a04b9b0
> [   15.444700] x29: ffff80000a04b9b0 x28: ffff000008de5810 x27: ffff000008de5808
> [   15.451772] x26: ffff000008de5800 x25: ffff0000084cb8b0 x24: ffff000001223c00
> [   15.458844] x23: 0000000000000000 x22: 0000000000000001 x21: ffff00007fa61a28
> [   15.465917] x20: ffff0000084ca080 x19: ffff00007fa61a28 x18: ffff0000019bd700
> [   15.472989] x17: 6d64685f77645f6e x16: ffffffffffffffff x15: 0000000000000004
> [   15.480062] x14: ffff800009bab410 x13: 0000000000000000 x12: 0000000000000003
> [   15.487135] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [   15.494207] x8 : ffff8000010a70a0 x7 : 64410079616b6f01 x6 : 8041640000000003
> [   15.501279] x5 : 0300000000644100 x4 : 0000000000000080 x3 : 0041640000000000
> [   15.508352] x2 : ffff000001128000 x1 : 0000000000000000 x0 : 0000000000000000
> [   15.515426] Call trace:
> [   15.517863] Insufficient stack space to handle exception!
> [   15.517867] ESR: 0x0000000096000047 -- DABT (current EL)
> [   15.517871] FAR: 0xffff80000a047ff0
> [   15.517873] Task stack:     [0xffff80000a048000..0xffff80000a04c000]
> [   15.517877] IRQ stack:      [0xffff800008008000..0xffff80000800c000]
> [   15.517880] Overflow stack: [0xffff00007d9c1320..0xffff00007d9c2320]
> [   15.517884] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc3-next-20230110 #1
> [   15.517890] Hardware name: Libre Computer AML-S905X-CC (DT)
> [   15.517895] Workqueue: events_unbound deferred_probe_work_func
> [   15.517915] pstate: 800003c5 (Nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   15.517923] pc : el1_abort+0x4/0x5c
> [   15.517932] lr : el1h_64_sync_handler+0x60/0xac
> [   15.517939] sp : ffff80000a048020
> [   15.517941] x29: ffff80000a048020 x28: ffff000001128000 x27: ffff000008de5808
> [   15.517950] x26: ffff000008de5800 x25: ffff80000a04b608 x24: ffff000001128000
> [   15.517957] x23: 00000000a00000c5 x22: ffff8000080321dc x21: ffff80000a048180
> [   15.517965] x20: ffff8000098e1000 x19: ffff80000a048290 x18: ffff0000019bd700
> [   15.517972] x17: 0000000000000011 x16: ffffffffffffffff x15: 0000000000000004
> [   15.517979] x14: ffff800009bab410 x13: 0000000000000000 x12: 0000000000000000
> [   15.517986] x11: 0000000000000030 x10: ffff800009013a1c x9 : ffff8000090401a0
> [   15.517994] x8 : 0000000000000025 x7 : 205d363234353135 x6 : 352e35312020205b
> [   15.518001] x5 : ffff800009f766b7 x4 : ffff800008fe695c x3 : 000000000000000c
> [   15.518008] x2 : 0000000096000004 x1 : 0000000096000004 x0 : ffff80000a048030
> [   15.518017] Kernel panic - not syncing: kernel stack overflow
> [   15.518020] SMP: stopping secondary CPUs
> [   15.518027] Kernel Offset: disabled
> [   15.518029] CPU features: 0x00000,01000100,0000421b
> [   15.518034] Memory Limit: none
> [   15.679388] ---[ end Kernel panic - not syncing: kernel stack overflow ]---

