Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C591148
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44506E9E7;
	Sat, 17 Aug 2019 15:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB19A6E4D2;
 Sat, 17 Aug 2019 12:50:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so4120685wrq.2;
 Sat, 17 Aug 2019 05:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=dygwo4q/2E93O7AvOTcv1nPbZeZYONT84LSU8Oy7/TE=;
 b=ZKCz+23yWSFKzJnNfm59trjM/TRqtEhU4UWEDFTtthSQxKKZ+/PKKU5b2d0PKX8jM+
 +U3USF6gz1y0klSRCPjGBqDbWO2OGZuxfeGKeKQJtLXSoNxW6xTLEr1leUcPrUiJYKmG
 Io3WKzo1xeoCjz2ZX1GomYNHNM7JY0aC6XcIY28sZ7Hs9u9wVcGO+ORlJkKz2VQonnwh
 CPIAcLnk3BhHHEdXHN1EsEmkIFXPOVRUWdxm+GAv6M1eeBLOQpPjWp6v7oy9ES10XfSa
 p6dy7xcy3IvR14PDiNSh2MAVIKjoWY9xwfqW9uZvp7AMLhMkSVqgdcG5bhGRbbMKjuTF
 /nRQ==
X-Gm-Message-State: APjAAAU68bDdmUQzPiyQd7hiB0qIEOKO38eWYj6d8N7kvsnSHOEfK9NK
 bvhTemxhMuKaKwa0NPQj+89SsCHHGoY=
X-Google-Smtp-Source: APXvYqzdexIx5IMdGie7J4y21MmWcg7AxOoZ26nWIFluWxIiTB3MGHuA9O72JkjwiHd8YExggqE3Kg==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr12386520wrs.338.1566046239025; 
 Sat, 17 Aug 2019 05:50:39 -0700 (PDT)
Received: from alex-chromebook
 (cpc83647-brig20-2-0-cust926.3-3.cable.virginm.net. [82.19.195.159])
 by smtp.gmail.com with ESMTPSA id 4sm15298262wro.78.2019.08.17.05.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 05:50:36 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <a.dewar@sussex.ac.uk>
Date: Sat, 17 Aug 2019 13:50:33 +0100
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: nouveau: System crashes with NVIDIA GeForce 8600 GT
Message-ID: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=dygwo4q/2E93O7AvOTcv1nPbZeZYONT84LSU8Oy7/TE=;
 b=s9NsVHK0SX6LApxFKtG1St2SrzxJ4ifAD3xT7LUC4JcQij6FreaIAT+/Zag8T1Rm+p
 98RIzEt61iB6WIQ5MahjDL7Q61RdhAUZHkXpJfvNf7JKQQ0nkkA5C7TE4vIEC/IvxZu9
 ygys22cwFnRFA7YGLT+Asc/EHeOXM3te+BLx41wJ3UukVnNAa3jxxMWNBi4n4COemKjN
 /HLfSBqjuewG4CeiNJP39vFTPQZ2X+8RmS18vdb0nnXLBfOhaRIs0fX/hxNTjP2kQ1Y5
 FPB4c0fHE/D5MOEukQkSyMK7p/03Y4mSfDJF8U7yBbOAGAxUFC2H+VCQltU+2ayBab3h
 2wNg==
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0067915054=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0067915054==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

I'm getting frequent system crashes (every few hours or so) and it seems
that the nouveau driver is causing the issue (dmesg output below). I see it
with both v5.2.8 and the v4.19 LTS kernel. Sometimes the system
completely freezes and sometimes seemingly just the nouveau driver goes
down. The screen freezes and colours stream across it. Often after I
reboot the BIOS logo is mangled too until the first modeset. The crash seems to
be happening in nv50_fb_intr() in nv50.c.

I'm not sure if this is related, but the system now often freezes on
suspend or resume since I switched from using the old (recently
abandoned) proprietry NVIDIA drivers, again both with 5.2 and 4.19
kernels. Blacklisting the nouveau driver doesn't seem to fix it however,
though I guess the graphics card could still be causing issues in some
other way? I never had problems with suspend and resume before.

Any suggestions about how I could debug this further?

Best,
Alex

dmesg output:

[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cfe8ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cfe90000-0x00000000cfee2fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cfee3000-0x00000000cfeeffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000cfef0000-0x00000000cfefffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000014fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: MEDIONPC MS-7502/MS-7502, BIOS 6.00 PG 01/13/2010
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2394.193 MHz processor
[    0.003907] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.003909] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.003914] last_pfn = 0x150000 max_arch_pfn = 0x400000000
[    0.003920] MTRR default type: uncachable
[    0.003921] MTRR fixed ranges enabled:
[    0.003923]   00000-9FFFF write-back
[    0.003924]   A0000-BFFFF uncachable
[    0.003925]   C0000-CBFFF write-protect
[    0.003926]   CC000-FFFFF write-through
[    0.003927] MTRR variable ranges enabled:
[    0.003929]   0 base 100000000 mask FC0000000 write-back
[    0.003931]   1 base 140000000 mask FF0000000 write-back
[    0.003932]   2 base 000000000 mask F80000000 write-back
[    0.003934]   3 base 080000000 mask FC0000000 write-back
[    0.003935]   4 base 0C0000000 mask FF0000000 write-back
[    0.003936]   5 base 0CFF00000 mask FFFF00000 uncachable
[    0.003937]   6 disabled
[    0.003938]   7 disabled
[    0.004864] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.005025] total RAM covered: 4607M
[    0.005436] Found optimal setting for mtrr clean up
[    0.005438]  gran_size: 64K 	chunk_size: 2M 	num_reg: 6  	lose cover RAM: 0G
[    0.006325] e820: update [mem 0xcff00000-0xffffffff] usable ==> reserved
[    0.006331] last_pfn = 0xcfe90 max_arch_pfn = 0x400000000
[    0.011041] found SMP MP-table at [mem 0x000f3e50-0x000f3e5f]
[    0.034915] check: Scanning 1 areas for low memory corruption
[    0.034920] Kernel/User page tables isolation: disabled on command line.
[    0.034923] BRK [0x6ae01000, 0x6ae01fff] PGTABLE
[    0.034926] BRK [0x6ae02000, 0x6ae02fff] PGTABLE
[    0.034928] BRK [0x6ae03000, 0x6ae03fff] PGTABLE
[    0.034958] BRK [0x6ae04000, 0x6ae04fff] PGTABLE
[    0.034960] BRK [0x6ae05000, 0x6ae05fff] PGTABLE
[    0.035037] BRK [0x6ae06000, 0x6ae06fff] PGTABLE
[    0.035287] RAMDISK: [mem 0x36443000-0x37218fff]
[    0.035295] ACPI: Early table checksum verification disabled
[    0.035367] ACPI: RSDP 0x00000000000F8050 000014 (v00 MEDION)
[    0.035371] ACPI: RSDT 0x00000000CFEE3000 00003C (v01 MEDION MEDIONAG 42302E31 AWRD 00000000)
[    0.035378] ACPI: FACP 0x00000000CFEE30C0 000074 (v01 MEDION MEDIONAG 42302E31 AWRD 00000000)
[    0.035385] ACPI: DSDT 0x00000000CFEE3140 004AC3 (v01 MEDION AWRDACPI 00001000 MSFT 03000000)
[    0.035390] ACPI: FACS 0x00000000CFE90000 000040
[    0.035393] ACPI: HPET 0x00000000CFEE7E80 000038 (v01 MEDION MEDIONAG 42302E31 AWRD 00000098)
[    0.035397] ACPI: MCFG 0x00000000CFEE7EC0 00003C (v01 MEDION MEDIONAG 42302E31 AWRD 00000000)
[    0.035401] ACPI: SLIC 0x00000000CFEE7C40 000176 (v01 MEDION MEDIONAG 42302E31 AWRD 00000000)
[    0.035405] ACPI: APIC 0x00000000CFEE7DC0 000084 (v01 MEDION MEDIONAG 42302E31 AWRD 00000000)
[    0.035409] ACPI: SSDT 0x00000000CFEE8820 000380 (v01 PmRef  CpuPm    00003000 INTL 20041203)
[    0.035419] ACPI: Local APIC address 0xfee00000
[    0.035497] No NUMA configuration found
[    0.035499] Faking a node at [mem 0x0000000000000000-0x000000014fffffff]
[    0.035502] NODE_DATA(0) allocated [mem 0x14fff8000-0x14fffbfff]
[    0.035530] Zone ranges:
[    0.035531]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.035532]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.035534]   Normal   [mem 0x0000000100000000-0x000000014fffffff]
[    0.035535]   Device   empty
[    0.035536] Movable zone start for each node
[    0.035537] Early memory node ranges
[    0.035538]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.035539]   node   0: [mem 0x0000000000100000-0x00000000cfe8ffff]
[    0.035540]   node   0: [mem 0x0000000100000000-0x000000014fffffff]
[    0.035550] Zeroed struct page in unavailable ranges: 467 pages
[    0.035552] Initmem setup node 0 [mem 0x0000000000001000-0x000000014fffffff]
[    0.035554] On node 0 totalpages: 1179181
[    0.035555]   DMA zone: 64 pages used for memmap
[    0.035556]   DMA zone: 21 pages reserved
[    0.035557]   DMA zone: 3997 pages, LIFO batch:0
[    0.035624]   DMA32 zone: 13243 pages used for memmap
[    0.035626]   DMA32 zone: 847504 pages, LIFO batch:63
[    0.080088]   Normal zone: 5120 pages used for memmap
[    0.080090]   Normal zone: 327680 pages, LIFO batch:63
[    0.098202] ACPI: PM-Timer IO Port: 0x408
[    0.098206] ACPI: Local APIC address 0xfee00000
[    0.098217] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.098218] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.098219] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.098220] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.098233] IOAPIC[0]: apic_id 4, version 32, address 0xfec00000, GSI 0-23
[    0.098236] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.098238] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.098240] ACPI: IRQ0 used by override.
[    0.098242] ACPI: IRQ9 used by override.
[    0.098244] Using ACPI (MADT) for SMP configuration information
[    0.098246] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.098254] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.098271] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.098273] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.098274] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
[    0.098275] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
[    0.098276] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
[    0.098277] PM: Registered nosave memory: [mem 0xcfe90000-0xcfee2fff]
[    0.098278] PM: Registered nosave memory: [mem 0xcfee3000-0xcfeeffff]
[    0.098279] PM: Registered nosave memory: [mem 0xcfef0000-0xcfefffff]
[    0.098280] PM: Registered nosave memory: [mem 0xcff00000-0xdfffffff]
[    0.098281] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.098282] PM: Registered nosave memory: [mem 0xf0000000-0xfebfffff]
[    0.098283] PM: Registered nosave memory: [mem 0xfec00000-0xffffffff]
[    0.098285] [mem 0xcff00000-0xdfffffff] available for PCI devices
[    0.098287] Booting paravirtualized kernel on bare hardware
[    0.098291] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.245745] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:4 nr_node_ids:1
[    0.246757] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u524288
[    0.246765] pcpu-alloc: s184320 r8192 d28672 u524288 alloc=1*2097152
[    0.246767] pcpu-alloc: [0] 0 1 2 3
[    0.246794] Built 1 zonelists, mobility grouping on.  Total pages: 1160733
[    0.246795] Policy zone: Normal
[    0.246798] Kernel command line: BOOT_IMAGE=/vmlinuz-linux root=UUID=bab4cf30-4010-49d7-bab9-4cc491e77f94 rw pti=off spectre_v2=off l1tf=off nospec_store_bypass_disable no_stf_barrier quiet
[    0.280191] Calgary: detecting Calgary via BIOS EBDA area
[    0.280194] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.348371] Memory: 4533100K/4716724K available (12291K kernel code, 1319K rwdata, 3900K rodata, 1612K init, 3616K bss, 183624K reserved, 0K cma-reserved)
[    0.348385] random: get_random_u64 called from __kmem_cache_create+0x44/0x4c0 with crng_init=0
[    0.348607] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.348633] ftrace: allocating 37368 entries in 146 pages
[    0.367930] rcu: Preemptible hierarchical RCU implementation.
[    0.367932] rcu: 	CONFIG_RCU_FANOUT set to non-default value of 32.
[    0.367933] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.367934] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=4.
[    0.367935] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.367936] 	Tasks RCU enabled.
[    0.367937] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.367938] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.370753] NR_IRQS: 20736, nr_irqs: 456, preallocated irqs: 16
[    0.370927] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.371020] Console: colour dummy device 80x25
[    0.371026] printk: console [tty0] enabled
[    0.371053] ACPI: Core revision 20190509
[    0.371226] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
[    0.371235] hpet clockevent registered
[    0.371241] APIC: Switch to symmetric I/O mode setup
[    0.371609] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.387906] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2282c9de469, max_idle_ns: 440795306551 ns
[    0.387912] Calibrating delay loop (skipped), value calculated using timer frequency.. 4790.90 BogoMIPS (lpj=7980643)
[    0.387914] pid_max: default: 32768 minimum: 301
[    0.387955] LSM: Security Framework initializing
[    0.387960] Yama: becoming mindful.
[    0.393542] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.397460] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.397639] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.397770] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.398062] *** VALIDATE proc ***
[    0.398171] *** VALIDATE cgroup1 ***
[    0.398173] *** VALIDATE cgroup2 ***
[    0.398258] mce: CPU0: Thermal monitoring enabled (TM2)
[    0.398261] process: using mwait in idle threads
[    0.398267] Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
[    0.398268] Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32, 1GB 0
[    0.398271] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.398273] Spectre V2 : off selected on command line.
[    0.398274] Speculative Store Bypass: Vulnerable
[    0.398281] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.398442] Freeing SMP alternatives memory: 32K
[    0.404575] smpboot: CPU0: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz (family: 0x6, model: 0xf, stepping: 0xb)
[    0.421256] Performance Events: PEBS fmt0+, Core2 events, 4-deep LBR, Intel PMU driver.
[    0.421267] core: PEBS disabled due to CPU errata
[    0.421271] ... version:                2
[    0.421272] ... bit width:              40
[    0.421274] ... generic registers:      2
[    0.421275] ... value mask:             000000ffffffffff
[    0.421277] ... max period:             000000007fffffff
[    0.421278] ... fixed-purpose events:   3
[    0.421279] ... event mask:             0000000700000003
[    0.427915] rcu: Hierarchical SRCU implementation.
[    0.451335] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.457925] smp: Bringing up secondary CPUs ...
[    0.497938] x86: Booting SMP configuration:
[    0.497941] .... node  #0, CPUs:      #1 #2 #3
[    0.598020] smp: Brought up 1 node, 4 CPUs
[    0.598020] smpboot: Max logical packages: 1
[    0.598020] smpboot: Total of 4 processors activated (19161.60 BogoMIPS)
[    0.601653] devtmpfs: initialized
[    0.601653] x86/mm: Memory block size: 128MB
[    0.604993] PM: Registering ACPI NVS region [mem 0xcfe90000-0xcfee2fff] (339968 bytes)
[    0.604993] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.604993] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.604993] pinctrl core: initialized pinctrl subsystem
[    0.604993] PM: RTC time: 17:39:16, date: 2019-08-16
[    0.605022] NET: Registered protocol family 16
[    0.605146] audit: initializing netlink subsys (disabled)
[    0.605162] audit: type=2000 audit(1565977156.233:1): state=initialized audit_enabled=0 res=1
[    0.605162] cpuidle: using governor ladder
[    0.605162] cpuidle: using governor menu
[    0.605162] ACPI: bus type PCI registered
[    0.605162] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.605162] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.605162] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.605162] PCI: Using configuration type 1 for base access
[    0.608023] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.611462] ACPI: Added _OSI(Module Device)
[    0.611464] ACPI: Added _OSI(Processor Device)
[    0.611466] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.611468] ACPI: Added _OSI(Processor Aggregator Device)
[    0.611469] ACPI: Added _OSI(Linux-Dell-Video)
[    0.611471] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.611473] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.617963] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.618930] ACPI: Dynamic OEM Table Load:
[    0.618937] ACPI: SSDT 0xFFFF985409944000 00022A (v01 PmRef  Cpu0Ist  00003000 INTL 20041203)
[    0.621245] ACPI: Dynamic OEM Table Load:
[    0.621245] ACPI: SSDT 0xFFFF985409903400 000152 (v01 PmRef  Cpu1Ist  00003000 INTL 20041203)
[    0.621245] ACPI: Dynamic OEM Table Load:
[    0.621245] ACPI: SSDT 0xFFFF985409903600 000152 (v01 PmRef  Cpu2Ist  00003000 INTL 20041203)
[    0.621245] ACPI: Dynamic OEM Table Load:
[    0.621245] ACPI: SSDT 0xFFFF985409903000 000152 (v01 PmRef  Cpu3Ist  00003000 INTL 20041203)
[    0.621245] ACPI: Interpreter enabled
[    0.621245] ACPI: (supports S0 S3 S4 S5)
[    0.621245] ACPI: Using IOAPIC for interrupt routing
[    0.621245] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.621245] ACPI: Enabled 14 GPEs in block 00 to 3F
[    0.630612] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.630621] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.630627] acpi PNP0A08:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
[    0.631025] PCI host bridge to bus 0000:00
[    0.631027] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.631029] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.631031] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.631033] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
[    0.631035] pci_bus 0000:00: root bus resource [mem 0xcff00000-0xfebfffff window]
[    0.631036] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.631046] pci 0000:00:00.0: [8086:29c0] type 00 class 0x060000
[    0.631199] pci 0000:00:01.0: [8086:29c1] type 01 class 0x060400
[    0.631251] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.631395] pci 0000:00:19.0: [8086:10c0] type 00 class 0x020000
[    0.631414] pci 0000:00:19.0: reg 0x10: [mem 0xfdfc0000-0xfdfdffff]
[    0.631421] pci 0000:00:19.0: reg 0x14: [mem 0xfdfff000-0xfdffffff]
[    0.631429] pci 0000:00:19.0: reg 0x18: [io  0xff00-0xff1f]
[    0.631484] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.631616] pci 0000:00:1a.0: [8086:2937] type 00 class 0x0c0300
[    0.631656] pci 0000:00:1a.0: reg 0x20: [io  0xfe00-0xfe1f]
[    0.631811] pci 0000:00:1a.1: [8086:2938] type 00 class 0x0c0300
[    0.631852] pci 0000:00:1a.1: reg 0x20: [io  0xfd00-0xfd1f]
[    0.632009] pci 0000:00:1a.2: [8086:2939] type 00 class 0x0c0300
[    0.632049] pci 0000:00:1a.2: reg 0x20: [io  0xfc00-0xfc1f]
[    0.632209] pci 0000:00:1a.7: [8086:293c] type 00 class 0x0c0320
[    0.632228] pci 0000:00:1a.7: reg 0x10: [mem 0xfdffe000-0xfdffe3ff]
[    0.632296] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.632424] pci 0000:00:1b.0: [8086:293e] type 00 class 0x040300
[    0.632443] pci 0000:00:1b.0: reg 0x10: [mem 0xfdff4000-0xfdff7fff 64bit]
[    0.632510] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.632641] pci 0000:00:1d.0: [8086:2934] type 00 class 0x0c0300
[    0.632681] pci 0000:00:1d.0: reg 0x20: [io  0xfb00-0xfb1f]
[    0.632834] pci 0000:00:1d.1: [8086:2935] type 00 class 0x0c0300
[    0.632874] pci 0000:00:1d.1: reg 0x20: [io  0xfa00-0xfa1f]
[    0.633025] pci 0000:00:1d.2: [8086:2936] type 00 class 0x0c0300
[    0.633066] pci 0000:00:1d.2: reg 0x20: [io  0xf900-0xf91f]
[    0.633237] pci 0000:00:1d.7: [8086:293a] type 00 class 0x0c0320
[    0.633261] pci 0000:00:1d.7: reg 0x10: [mem 0xfdffd000-0xfdffd3ff]
[    0.633330] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.633453] pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
[    0.633626] pci 0000:00:1f.0: [8086:2912] type 00 class 0x060100
[    0.633704] pci 0000:00:1f.0: quirk: [io  0x0400-0x047f] claimed by ICH6 ACPI/GPIO/TCO
[    0.633708] pci 0000:00:1f.0: quirk: [io  0x0480-0x04bf] claimed by ICH6 GPIO
[    0.633711] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0800 (mask 003f)
[    0.633714] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 2 PIO at 0290 (mask 001f)
[    0.633862] pci 0000:00:1f.2: [8086:2922] type 00 class 0x010601
[    0.633879] pci 0000:00:1f.2: reg 0x10: [io  0xf800-0xf807]
[    0.633886] pci 0000:00:1f.2: reg 0x14: [io  0xf700-0xf703]
[    0.633893] pci 0000:00:1f.2: reg 0x18: [io  0xf600-0xf607]
[    0.633900] pci 0000:00:1f.2: reg 0x1c: [io  0xf500-0xf503]
[    0.633906] pci 0000:00:1f.2: reg 0x20: [io  0xf400-0xf41f]
[    0.633913] pci 0000:00:1f.2: reg 0x24: [mem 0xfdffc000-0xfdffc7ff]
[    0.633953] pci 0000:00:1f.2: PME# supported from D3hot
[    0.634075] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500
[    0.634092] pci 0000:00:1f.3: reg 0x10: [mem 0xfdffb000-0xfdffb0ff 64bit]
[    0.634110] pci 0000:00:1f.3: reg 0x20: [io  0x0500-0x051f]
[    0.634277] pci 0000:01:00.0: [10de:0402] type 00 class 0x030000
[    0.634293] pci 0000:01:00.0: reg 0x10: [mem 0xfa000000-0xfaffffff]
[    0.634303] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.634312] pci 0000:01:00.0: reg 0x1c: [mem 0xf8000000-0xf9ffffff 64bit]
[    0.634319] pci 0000:01:00.0: reg 0x24: [io  0xdf00-0xdf7f]
[    0.634326] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.634332] pci 0000:01:00.0: enabling Extended Tags
[    0.634434] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.634437] pci 0000:00:01.0:   bridge window [io  0xd000-0xdfff]
[    0.634440] pci 0000:00:01.0:   bridge window [mem 0xf8000000-0xfbffffff]
[    0.634443] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.634459] pci_bus 0000:02: extended config space not accessible
[    0.634486] pci 0000:02:00.0: [1131:7133] type 00 class 0x048000
[    0.634502] pci 0000:02:00.0: reg 0x10: [mem 0xfddff000-0xfddff7ff]
[    0.634579] pci 0000:02:00.0: supports D1 D2
[    0.634627] pci 0000:02:02.0: [1106:3044] type 00 class 0x0c0010
[    0.634644] pci 0000:02:02.0: reg 0x10: [mem 0xfddfe000-0xfddfe7ff]
[    0.634653] pci 0000:02:02.0: reg 0x14: [io  0xcf00-0xcf7f]
[    0.634721] pci 0000:02:02.0: supports D2
[    0.634722] pci 0000:02:02.0: PME# supported from D2 D3hot D3cold
[    0.634802] pci 0000:00:1e.0: PCI bridge to [bus 02] (subtractive decode)
[    0.634805] pci 0000:00:1e.0:   bridge window [io  0xc000-0xcfff]
[    0.634808] pci 0000:00:1e.0:   bridge window [mem 0xfdd00000-0xfddfffff]
[    0.634813] pci 0000:00:1e.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.634815] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7 window] (subtractive decode)
[    0.634817] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
[    0.634819] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff window] (subtractive decode)
[    0.634820] pci 0000:00:1e.0:   bridge window [mem 0x000c0000-0x000dffff window] (subtractive decode)
[    0.634822] pci 0000:00:1e.0:   bridge window [mem 0xcff00000-0xfebfffff window] (subtractive decode)
[    0.635785] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 *5 7 9 10 11 12 14 15)
[    0.635883] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 9 10 11 12 14 15) *0, disabled.
[    0.635981] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 *9 10 11 12 14 15)
[    0.636079] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 9 10 *11 12 14 15)
[    0.636176] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 9 *10 11 12 14 15)
[    0.636273] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 9 *10 11 12 14 15)
[    0.636370] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 *7 9 10 11 12 14 15)
[    0.636467] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 7 9 10 *11 12 14 15)
[    0.636733] pci 0000:01:00.0: vgaarb: setting as boot VGA device
[    0.636733] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.636733] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.636733] vgaarb: loaded
[    0.636733] ACPI: bus type USB registered
[    0.636733] usbcore: registered new interface driver usbfs
[    0.636733] usbcore: registered new interface driver hub
[    0.636733] usbcore: registered new device driver usb
[    0.636733] pps_core: LinuxPPS API ver. 1 registered
[    0.636733] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.636733] PTP clock support registered
[    0.636733] EDAC MC: Ver: 3.0.0
[    0.636733] PCI: Using ACPI for IRQ routing
[    0.642911] PCI: pci_cache_line_size set to 64 bytes
[    0.642954] e820: reserve RAM buffer [mem 0x0009e400-0x0009ffff]
[    0.642956] e820: reserve RAM buffer [mem 0xcfe90000-0xcfffffff]
[    0.643089] NetLabel: Initializing
[    0.643090] NetLabel:  domain hash size = 128
[    0.643091] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.643109] NetLabel:  unlabeled traffic allowed by default
[    0.643115] HPET: 4 timers in total, 0 timers will be used for per-cpu timer
[    0.643115] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
[    0.643115] hpet0: 4 comparators, 64-bit 14.318180 MHz counter
[    0.645608] clocksource: Switched to clocksource tsc-early
[    0.664102] VFS: Disk quotas dquot_6.6.0
[    0.664128] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.664170] *** VALIDATE hugetlbfs ***
[    0.664245] pnp: PnP ACPI init
[    0.664570] system 00:00: [io  0x04d0-0x04d1] has been reserved
[    0.664572] system 00:00: [io  0x0800-0x087f] has been reserved
[    0.664574] system 00:00: [io  0x0880-0x088f] has been reserved
[    0.664582] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.664689] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.665178] pnp 00:02: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.665511] pnp 00:03: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.665727] system 00:04: [io  0x0400-0x04bf] could not be reserved
[    0.665734] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.666071] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.666077] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.666232] system 00:06: [mem 0x000f0000-0x000fffff] could not be reserved
[    0.666235] system 00:06: [mem 0xcff00000-0xcfffffff] has been reserved
[    0.666237] system 00:06: [mem 0xfed00000-0xfed000ff] has been reserved
[    0.666239] system 00:06: [mem 0xcfe90000-0xcfefffff] could not be reserved
[    0.666241] system 00:06: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.666243] system 00:06: [mem 0x00100000-0xcfe8ffff] could not be reserved
[    0.666245] system 00:06: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.666247] system 00:06: [mem 0xfed14000-0xfed1dfff] has been reserved
[    0.666249] system 00:06: [mem 0xfed20000-0xfed9ffff] has been reserved
[    0.666251] system 00:06: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.666253] system 00:06: [mem 0xffb00000-0xffb7ffff] has been reserved
[    0.666255] system 00:06: [mem 0xfff00000-0xffffffff] has been reserved
[    0.666257] system 00:06: [mem 0x000e0000-0x000effff] has been reserved
[    0.666263] system 00:06: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.666274] pnp: PnP ACPI: found 7 devices
[    0.672817] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.672835] pci 0000:01:00.0: BAR 6: assigned [mem 0xfb000000-0xfb01ffff pref]
[    0.672838] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.672841] pci 0000:00:01.0:   bridge window [io  0xd000-0xdfff]
[    0.672844] pci 0000:00:01.0:   bridge window [mem 0xf8000000-0xfbffffff]
[    0.672847] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.672852] pci 0000:00:1e.0: PCI bridge to [bus 02]
[    0.672854] pci 0000:00:1e.0:   bridge window [io  0xc000-0xcfff]
[    0.672858] pci 0000:00:1e.0:   bridge window [mem 0xfdd00000-0xfddfffff]
[    0.672861] pci 0000:00:1e.0:   bridge window [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.672867] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.672869] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.672871] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.672873] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff window]
[    0.672874] pci_bus 0000:00: resource 8 [mem 0xcff00000-0xfebfffff window]
[    0.672876] pci_bus 0000:01: resource 0 [io  0xd000-0xdfff]
[    0.672878] pci_bus 0000:01: resource 1 [mem 0xf8000000-0xfbffffff]
[    0.672880] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
[    0.672881] pci_bus 0000:02: resource 0 [io  0xc000-0xcfff]
[    0.672883] pci_bus 0000:02: resource 1 [mem 0xfdd00000-0xfddfffff]
[    0.672885] pci_bus 0000:02: resource 2 [mem 0xfde00000-0xfdefffff 64bit pref]
[    0.672886] pci_bus 0000:02: resource 4 [io  0x0000-0x0cf7 window]
[    0.672888] pci_bus 0000:02: resource 5 [io  0x0d00-0xffff window]
[    0.672890] pci_bus 0000:02: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.672891] pci_bus 0000:02: resource 7 [mem 0x000c0000-0x000dffff window]
[    0.672893] pci_bus 0000:02: resource 8 [mem 0xcff00000-0xfebfffff window]
[    0.673006] NET: Registered protocol family 2
[    0.673235] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes)
[    0.673306] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    0.673663] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.674232] TCP: Hash tables configured (established 65536 bind 65536)
[    0.674319] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.674403] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.674622] NET: Registered protocol family 1
[    0.674630] NET: Registered protocol family 44
[    0.676209] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.676217] PCI: CLS 64 bytes, default 64
[    0.676279] Trying to unpack rootfs image as initramfs...
[    0.734119] Freeing initrd memory: 14168K
[    0.734125] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.734128] software IO TLB: mapped [mem 0xcbe90000-0xcfe90000] (64MB)
[    0.734449] check: Scanning for low memory corruption every 60 seconds
[    0.735359] Initialise system trusted keyrings
[    0.735372] Key type blacklist registered
[    0.735463] workingset: timestamp_bits=41 max_order=21 bucket_order=0
[    0.737732] zbud: loaded
[    0.740383] Key type asymmetric registered
[    0.740386] Asymmetric key parser 'x509' registered
[    0.740406] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.740510] io scheduler mq-deadline registered
[    0.740512] io scheduler kyber registered
[    0.740599] io scheduler bfq registered
[    0.741213] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.741315] vesafb: mode is 1280x1024x32, linelength=5120, pages=0
[    0.741316] vesafb: scrolling: redraw
[    0.741317] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.741353] vesafb: framebuffer at 0xf9000000, mapped to 0x(____ptrval____), using 5120k, total 5120k
[    0.741422] fbcon: Deferring console take-over
[    0.741424] fb0: VESA VGA frame buffer device
[    0.741441] intel_idle: does not run on family 6 model 15
[    0.741498] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.741509] ACPI: Power Button [PWRB]
[    0.741598] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.745090] ACPI: Power Button [PWRF]
[    0.745936] thermal LNXTHERM:00: registered as thermal_zone0
[    0.745938] ACPI: Thermal Zone [THRM] (22 C)
[    0.746133] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.766710] 00:02: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.787368] 00:03: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.788503] usbcore: registered new interface driver usbserial_generic
[    0.788513] usbserial: USB Serial support registered for generic
[    0.788542] rtc_cmos 00:01: RTC can wake from S4
[    0.788691] rtc_cmos 00:01: registered as rtc0
[    0.788721] rtc_cmos 00:01: alarms up to one month, 242 bytes nvram, hpet irqs
[    0.788778] intel_pstate: CPU model not supported
[    0.788835] ledtrig-cpu: registered to indicate activity on CPUs
[    0.789248] NET: Registered protocol family 10
[    0.797623] Segment Routing with IPv6
[    0.797658] NET: Registered protocol family 17
[    0.797951] mce: Using 6 MCE banks
[    0.797971] RAS: Correctable Errors collector initialized.
[    0.798032] microcode: sig=0x6fb, pf=0x10, revision=0xba
[    0.798137] microcode: Microcode Update Driver: v2.2.
[    0.798161] sched_clock: Marking stable (797823756, 297304)->(911060555, -112939495)
[    0.798471] registered taskstats version 1
[    0.798485] Loading compiled-in X.509 certificates
[    0.803503] Loaded X.509 cert 'Build time autogenerated kernel key: 62fc5ec65926abbcdf7dbdb71e25135b520c903d'
[    0.803531] zswap: loaded using pool lzo/zbud
[    0.811302] Key type big_key registered
[    0.811709] PM:   Magic number: 15:151:694
[    0.811829] rtc_cmos 00:01: setting system clock to 2019-08-16T17:39:16 UTC (1565977156)
[    0.813881] Freeing unused decrypted memory: 2040K
[    0.814536] Freeing unused kernel image memory: 1612K
[    0.828926] Write protecting the kernel read-only data: 18432k
[    0.830115] Freeing unused kernel image memory: 2012K
[    0.830254] Freeing unused kernel image memory: 196K
[    0.844692] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.844703] Run /init as init process
[    0.865988] fbcon: Taking over console
[    0.866106] Console: switching to colour frame buffer device 160x64
[    0.975372] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.976919] ehci-pci: EHCI PCI platform driver
[    0.977157] ehci-pci 0000:00:1a.7: EHCI Host Controller
[    0.977166] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus number 1
[    0.981108] ehci-pci 0000:00:1a.7: cache line size of 64 is not supported
[    0.981151] ehci-pci 0000:00:1a.7: irq 18, io mem 0xfdffe000
[    0.990266] SCSI subsystem initialized
[    0.994544] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    0.994615] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.02
[    0.994617] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.994619] usb usb1: Product: EHCI Host Controller
[    0.994621] usb usb1: Manufacturer: Linux 5.2.8-arch1-1-ARCH ehci_hcd
[    0.994622] usb usb1: SerialNumber: 0000:00:1a.7
[    0.994792] hub 1-0:1.0: USB hub found
[    0.994803] hub 1-0:1.0: 6 ports detected
[    0.995236] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    0.995244] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus number 2
[    0.999163] ehci-pci 0000:00:1d.7: cache line size of 64 is not supported
[    0.999181] ehci-pci 0000:00:1d.7: irq 23, io mem 0xfdffd000
[    1.001342] libata version 3.00 loaded.
[    1.007193] ahci 0000:00:1f.2: version 3.0
[    1.007460] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[    1.007492] ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA mode
[    1.007494] ahci 0000:00:1f.2: flags: 64bit ncq sntf ilck stag pm led clo pmp pio slum part ccc ems sxs
[    1.011184] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    1.011264] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.02
[    1.011268] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.011271] usb usb2: Product: EHCI Host Controller
[    1.011273] usb usb2: Manufacturer: Linux 5.2.8-arch1-1-ARCH ehci_hcd
[    1.011276] usb usb2: SerialNumber: 0000:00:1d.7
[    1.011462] hub 2-0:1.0: USB hub found
[    1.011471] hub 2-0:1.0: 6 ports detected
[    1.014915] uhci_hcd: USB Universal Host Controller Interface driver
[    1.015614] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    1.015623] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
[    1.015630] uhci_hcd 0000:00:1a.0: detected 2 ports
[    1.015663] uhci_hcd 0000:00:1a.0: irq 16, io base 0x0000fe00
[    1.015860] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.015863] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.015865] usb usb3: Product: UHCI Host Controller
[    1.015866] usb usb3: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.015868] usb usb3: SerialNumber: 0000:00:1a.0
[    1.016062] hub 3-0:1.0: USB hub found
[    1.016072] hub 3-0:1.0: 2 ports detected
[    1.016340] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    1.016347] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
[    1.016353] uhci_hcd 0000:00:1a.1: detected 2 ports
[    1.016377] uhci_hcd 0000:00:1a.1: irq 21, io base 0x0000fd00
[    1.016434] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.016436] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.016437] usb usb4: Product: UHCI Host Controller
[    1.016439] usb usb4: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.016441] usb usb4: SerialNumber: 0000:00:1a.1
[    1.016603] hub 4-0:1.0: USB hub found
[    1.016612] hub 4-0:1.0: 2 ports detected
[    1.016851] uhci_hcd 0000:00:1a.2: UHCI Host Controller
[    1.016857] uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
[    1.016863] uhci_hcd 0000:00:1a.2: detected 2 ports
[    1.016887] uhci_hcd 0000:00:1a.2: irq 19, io base 0x0000fc00
[    1.016942] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.016944] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.016946] usb usb5: Product: UHCI Host Controller
[    1.016948] usb usb5: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.016949] usb usb5: SerialNumber: 0000:00:1a.2
[    1.017093] hub 5-0:1.0: USB hub found
[    1.017102] hub 5-0:1.0: 2 ports detected
[    1.017344] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    1.017354] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
[    1.017360] uhci_hcd 0000:00:1d.0: detected 2 ports
[    1.017379] uhci_hcd 0000:00:1d.0: irq 23, io base 0x0000fb00
[    1.017434] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.017436] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.017437] usb usb6: Product: UHCI Host Controller
[    1.017439] usb usb6: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.017441] usb usb6: SerialNumber: 0000:00:1d.0
[    1.017583] hub 6-0:1.0: USB hub found
[    1.017593] hub 6-0:1.0: 2 ports detected
[    1.017827] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    1.017833] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
[    1.017839] uhci_hcd 0000:00:1d.1: detected 2 ports
[    1.017859] uhci_hcd 0000:00:1d.1: irq 19, io base 0x0000fa00
[    1.017925] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.017927] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.017928] usb usb7: Product: UHCI Host Controller
[    1.017930] usb usb7: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.017932] usb usb7: SerialNumber: 0000:00:1d.1
[    1.018088] hub 7-0:1.0: USB hub found
[    1.018097] hub 7-0:1.0: 2 ports detected
[    1.018326] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    1.018332] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
[    1.018338] uhci_hcd 0000:00:1d.2: detected 2 ports
[    1.018356] uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000f900
[    1.018413] usb usb8: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.02
[    1.018416] usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.018417] usb usb8: Product: UHCI Host Controller
[    1.018419] usb usb8: Manufacturer: Linux 5.2.8-arch1-1-ARCH uhci_hcd
[    1.018421] usb usb8: SerialNumber: 0000:00:1d.2
[    1.018577] hub 8-0:1.0: USB hub found
[    1.018585] hub 8-0:1.0: 2 ports detected
[    1.057637] scsi host0: ahci
[    1.057976] scsi host1: ahci
[    1.058129] firewire_ohci 0000:02:02.0: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x11
[    1.058318] scsi host2: ahci
[    1.058557] scsi host3: ahci
[    1.058811] scsi host4: ahci
[    1.059062] scsi host5: ahci
[    1.059196] ata1: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc100 irq 25
[    1.059198] ata2: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc180 irq 25
[    1.059200] ata3: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc200 irq 25
[    1.059202] ata4: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc280 irq 25
[    1.059204] ata5: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc300 irq 25
[    1.059205] ata6: SATA max UDMA/133 abar m2048@0xfdffc000 port 0xfdffc380 irq 25
[    1.325747] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.474599] usb 6-2: new low-speed USB device number 2 using uhci_hcd
[    1.537929] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.538035] ata1.00: ATA-11: P3-128, 1.00, max UDMA/133
[    1.538038] ata1.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.538142] ata1.00: configured for UDMA/133
[    1.538454] scsi 0:0:0:0: Direct-Access     ATA      P3-128           1.00 PQ: 0 ANSI: 5
[    1.553782] usb 1-1: New USB device found, idVendor=0424, idProduct=2228, bcdDevice= 5.14
[    1.553785] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.553788] usb 1-1: Product: Flash Card Reader
[    1.553790] usb 1-1: Manufacturer: Generic
[    1.553793] usb 1-1: SerialNumber: 000022272228
[    1.557967] usb-storage 1-1:1.0: USB Mass Storage device detected
[    1.561522] scsi host6: usb-storage 1-1:1.0
[    1.561656] usbcore: registered new interface driver usb-storage
[    1.563415] usbcore: registered new interface driver uas
[    1.568110] firewire_core 0000:02:02.0: created device fw0: GUID 0010dc000126adeb, S400
[    1.667837] usb 6-2: New USB device found, idVendor=045e, idProduct=00db, bcdDevice= 1.73
[    1.667840] usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.667843] usb 6-2: Product: Natural® Ergonomic Keyboard 4000
[    1.667845] usb 6-2: Manufacturer: Microsoft
[    1.674607] usb 1-5: new high-speed USB device number 3 using ehci-pci
[    1.675141] hidraw: raw HID events driver (C) Jiri Kosina
[    1.707909] usbcore: registered new interface driver usbhid
[    1.707922] usbhid: USB HID core driver
[    1.713195] input: Microsoft Natural® Ergonomic Keyboard 4000 as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2:1.0/0003:045E:00DB.0001/input/input2
[    1.754606] tsc: Refined TSC clocksource calibration: 2393.999 MHz
[    1.754614] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22821267f49, max_idle_ns: 440795240327 ns
[    1.754639] clocksource: Switched to clocksource tsc
[    1.768014] microsoft 0003:045E:00DB.0001: input,hidraw0: USB HID v1.11 Keyboard [Microsoft Natural® Ergonomic Keyboard 4000] on usb-0000:00:1d.0-2/input0
[    1.768494] input: Microsoft Natural® Ergonomic Keyboard 4000 as /devices/pci0000:00/0000:00:1d.0/usb6/6-2/6-2:1.1/0003:045E:00DB.0002/input/input3
[    1.824677] microsoft 0003:045E:00DB.0002: input,hidraw1: USB HID v1.11 Device [Microsoft Natural® Ergonomic Keyboard 4000] on usb-0000:00:1d.0-2/input1
[    1.838513] usb 1-5: New USB device found, idVendor=13d3, idProduct=3247, bcdDevice= 8.01
[    1.838516] usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.838519] usb 1-5: Product: 802.11 n WLAN
[    1.838521] usb 1-5: Manufacturer: Ralink
[    1.838524] usb 1-5: SerialNumber: 1.0
[    2.007940] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    2.010652] ata2.00: ATAPI: HL-DT-ST DVDRAM GH20NS10, EL00, max UDMA/100
[    2.014507] ata2.00: configured for UDMA/100
[    2.091268] usb 2-5: new high-speed USB device number 3 using ehci-pci
[    2.094598] usb 5-2: new low-speed USB device number 2 using uhci_hcd
[    2.131713] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH20NS10  EL00 PQ: 0 ANSI: 5
[    2.238291] usb 2-5: New USB device found, idVendor=0424, idProduct=2504, bcdDevice= 0.01
[    2.238295] usb 2-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.238585] hub 2-5:1.0: USB hub found
[    2.238661] hub 2-5:1.0: 4 ports detected
[    2.278672] usb 5-2: New USB device found, idVendor=0bc7, idProduct=0006, bcdDevice= 2.00
[    2.278675] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.278678] usb 5-2: Product: RF receiver
[    2.278680] usb 5-2: Manufacturer: X10 WTI
[    2.511052] ata3: SATA link down (SStatus 0 SControl 300)
[    2.561267] usb 8-2: new full-speed USB device number 2 using uhci_hcd
[    2.591666] scsi 6:0:0:0: Direct-Access     Generic  Flash HS-CF      5.14 PQ: 0 ANSI: 0
[    2.594797] scsi 6:0:0:1: Direct-Access     Generic  Flash HS-MS/SD   5.14 PQ: 0 ANSI: 0
[    2.598154] scsi 6:0:0:2: Direct-Access     Generic  Flash HS-SM      5.14 PQ: 0 ANSI: 0
[    2.601445] sd 0:0:0:0: [sda] 250069680 512-byte logical blocks: (128 GB/119 GiB)
[    2.601460] sd 0:0:0:0: [sda] Write Protect is off
[    2.601462] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.601530] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.602736]  sda: sda1 sda2 sda3
[    2.603300] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.609155] sd 6:0:0:0: [sdb] Attached SCSI removable disk
[    2.628779] sd 6:0:0:1: [sdc] Attached SCSI removable disk
[    2.636272] sd 6:0:0:2: [sdd] Attached SCSI removable disk
[    2.763296] usb 8-2: New USB device found, idVendor=0db0, idProduct=1967, bcdDevice= 5.25
[    2.763300] usb 8-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.981289] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    3.011911] ata4.00: ATA-7: ST3500830AS, 3.AAD, max UDMA/133
[    3.011914] ata4.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 32)
[    3.070222] ata4.00: configured for UDMA/133
[    3.070496] scsi 3:0:0:0: Direct-Access     ATA      ST3500830AS      D    PQ: 0 ANSI: 5
[    3.070722] sd 3:0:0:0: [sde] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    3.070744] sd 3:0:0:0: [sde] Write Protect is off
[    3.070747] sd 3:0:0:0: [sde] Mode Sense: 00 3a 00 00
[    3.070778] sd 3:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.113732]  sde: sde1 sde2
[    3.114234] sd 3:0:0:0: [sde] Attached SCSI removable disk
[    3.207928] usb 2-5.3: new low-speed USB device number 5 using ehci-pci
[    3.305783] random: fast init done
[    3.307923] usb 2-5.3: New USB device found, idVendor=093a, idProduct=2521, bcdDevice= 1.00
[    3.307927] usb 2-5.3: New USB device strings: Mfr=0, Product=2, SerialNumber=0
[    3.307929] usb 2-5.3: Product: USB OPTICAL MOUSE
[    3.312262] input: USB OPTICAL MOUSE as /devices/pci0000:00/0000:00:1d.7/usb2/2-5/2-5.3/2-5.3:1.0/0003:093A:2521.0003/input/input4
[    3.312308] hid-generic 0003:093A:2521.0003: input,hidraw2: USB HID v1.11 Mouse [USB OPTICAL MOUSE] on usb-0000:00:1d.7-5.3/input0
[    3.384371] ata5: SATA link down (SStatus 0 SControl 300)
[    3.697676] ata6: SATA link down (SStatus 0 SControl 300)
[    3.852039] sr 1:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
[    3.852043] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.852482] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    7.513434] random: crng init done
[  148.462991] PCLMULQDQ-NI instructions are not detected.
[  151.628011] F2FS-fs (sda3): Mounted with checkpoint version = 1710f221
[  151.842611] systemd[1]: systemd 242.84-1-arch running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[  151.858003] systemd[1]: Detected architecture x86-64.
[  151.861228] systemd[1]: Set hostname to <medion>.
[  152.041758] systemd[1]: /usr/lib/systemd/system/docker.socket:6: ListenStream= references a path below legacy directory /var/run/, updating /var/run/docker.sock → /run/docker.sock; please update the unit file accordingly.
[  152.045084] systemd[1]: Listening on LVM2 poll daemon socket.
[  152.045241] systemd[1]: Listening on initctl Compatibility Named Pipe.
[  152.045709] systemd[1]: Listening on Journal Socket (/dev/log).
[  152.045723] systemd[1]: Reached target Remote File Systems.
[  152.047281] systemd[1]: Created slice system-getty.slice.
[  152.047305] systemd[1]: Reached target Login Prompts.
[  152.592880] audit: type=1130 audit(1565977308.276:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  152.607239] systemd-journald[305]: Received request to flush runtime journal from PID 1
[  152.679482] audit: type=1130 audit(1565977308.362:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  152.793682] ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042F conflicts with OpRegion 0x0000000000000429-0x0000000000000429 (\PM2S) (20190509/utaddress-204)
[  152.793695] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[  152.793698] ACPI Warning: SystemIO range 0x00000000000004B0-0x00000000000004BF conflicts with OpRegion 0x00000000000004B8-0x00000000000004BB (\GPO2) (20190509/utaddress-204)
[  152.793702] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[  152.793703] ACPI Warning: SystemIO range 0x0000000000000480-0x00000000000004AF conflicts with OpRegion 0x000000000000048C-0x000000000000048F (\GPO) (20190509/utaddress-204)
[  152.793706] ACPI Warning: SystemIO range 0x0000000000000480-0x00000000000004AF conflicts with OpRegion 0x0000000000000490-0x0000000000000490 (\PALD) (20190509/utaddress-204)
[  152.793710] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[  152.793711] lpc_ich: Resource conflict(s) found affecting gpio_ich
[  152.800219] Linux agpgart interface v0.103
[  152.831979] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[  152.831981] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[  152.832221] e1000e 0000:00:19.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[  152.869565] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[  152.882040] media: Linux media interface: v0.10
[  152.886139] input: PC Speaker as /devices/platform/pcspkr/input/input6
[  152.898620] audit: type=1130 audit(1565977308.582:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  152.932042] mousedev: PS/2 mouse device common for all mice
[  152.961232] Registered IR keymap rc-medion-x10-or2x
[  152.961283] rc rc0: X10 WTI RF receiver as /devices/pci0000:00/0000:00:1a.2/usb5/5-2/5-2:1.0/rc/rc0
[  152.961334] input: X10 WTI RF receiver as /devices/pci0000:00/0000:00:1a.2/usb5/5-2/5-2:1.0/rc/rc0/input5
[  152.961442] rc rc0: lirc_dev: driver ati_remote registered at minor = 0, scancode receiver, no transmitter
[  152.961486] input: X10 WTI RF receiver mouse as /devices/pci0000:00/0000:00:1a.2/usb5/5-2/5-2:1.0/input/input7
[  152.961608] usbcore: registered new interface driver ati_remote
[  152.962989] videodev: Linux video capture interface: v2.00
[  153.021109] iTCO_vendor_support: vendor-support=0
[  153.046385] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[  153.046538] iTCO_wdt: Found a ICH9DH TCO device (Version=2, TCOBASE=0x0460)
[  153.050570] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[  153.081271] Adding 4686472k swap on /dev/sda1.  Priority:-2 extents:1 across:4686472k SSFS
[  153.098398] e1000e 0000:00:19.0 eth0: (PCI Express:2.5GT/s:Width x1) 88:88:88:88:87:88
[  153.098409] e1000e 0000:00:19.0 eth0: Intel(R) PRO/10/100 Network Connection
[  153.098430] e1000e 0000:00:19.0 eth0: MAC: 7, PHY: 7, PBA No: FFFFFF-0FF
[  153.103435] e1000e 0000:00:19.0 enp0s25: renamed from eth0
[  153.126814] Bluetooth: Core ver 2.22
[  153.127864] NET: Registered protocol family 31
[  153.127867] Bluetooth: HCI device and connection manager initialized
[  153.127899] Bluetooth: HCI socket layer initialized
[  153.127905] Bluetooth: L2CAP socket layer initialized
[  153.127912] Bluetooth: SCO socket layer initialized
[  153.134961] snd_hda_codec_realtek hdaudioC0D0: ALC1200: SKU not ready 0x00000100
[  153.135543] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC1200: line_outs=3 (0x14/0x16/0x15/0x0/0x0) type:line
[  153.135545] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[  153.135547] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
[  153.135549] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[  153.135551] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
[  153.135552] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[  153.135554] snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
[  153.135556] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
[  153.135558] snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
[  153.135559] snd_hda_codec_realtek hdaudioC0D0:      CD=0x1c
[  153.135561] snd_hda_codec_realtek hdaudioC0D0:    dig-in=0x1f
[  153.167118] saa7134: saa7130/34: v4l2 driver version 0, 2, 17 loaded
[  153.167386] saa7134: saa7133[0]: found at 0000:02:00.0, rev: 209, irq: 16, latency: 84, mmio: 0xfddff000
[  153.167398] saa7134: saa7133[0]: subsystem: 16be:000d, board: Medion Md8800 Quadro [card=96,autodetected]
[  153.167435] saa7134: saa7133[0]: board init: gpio is 0
[  153.179440] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.0/sound/card0/input8
[  153.179527] input: HDA Intel Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
[  153.179598] input: HDA Intel Front Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
[  153.179669] input: HDA Intel Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[  153.179744] input: HDA Intel Line Out Front as /devices/pci0000:00/0000:00:1b.0/sound/card0/input12
[  153.179819] input: HDA Intel Line Out Surround as /devices/pci0000:00/0000:00:1b.0/sound/card0/input13
[  153.179894] input: HDA Intel Line Out CLFE as /devices/pci0000:00/0000:00:1b.0/sound/card0/input14
[  153.179969] input: HDA Intel Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input15
[  153.200421] usbcore: registered new interface driver btusb
[  153.205861] coretemp coretemp.0: Using relative temperature scale!
[  153.205957] coretemp coretemp.0: Using relative temperature scale!
[  153.206179] coretemp coretemp.0: Using relative temperature scale!
[  153.206607] coretemp coretemp.0: Using relative temperature scale!
[  153.211022] Bluetooth: hci0: unexpected event for opcode 0x0000
[  153.214783] intel_powerclamp: No package C-state available
[  153.230353] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[  153.235944] audit: type=1130 audit(1565977308.919:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  153.246262] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[  153.250270] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[  153.250275] cfg80211: failed to load regulatory.db
[  153.254131] intel_powerclamp: No package C-state available
[  153.281736] intel_powerclamp: No package C-state available
[  153.328748] intel_powerclamp: No package C-state available
[  153.331269] saa7134: i2c eeprom 00: be 16 0d 00 54 20 1c 00 43 43 a9 1c 55 d2 b2 92
[  153.331273] saa7134: i2c eeprom 10: 00 ff 86 0f ff 20 ff 00 01 50 32 79 01 3c ca 50
[  153.331274] saa7134: i2c eeprom 20: 01 40 01 02 02 03 01 00 06 ff 00 29 02 51 96 2b
[  153.331275] saa7134: i2c eeprom 30: a7 58 7a 1f 03 8e 84 5e da 7a 04 b3 05 87 b2 3c
[  153.331276] saa7134: i2c eeprom 40: ff 28 00 c0 96 10 03 00 c0 1c fd 79 44 9f c2 8f
[  153.331277] saa7134: i2c eeprom 50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331278] saa7134: i2c eeprom 60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331279] saa7134: i2c eeprom 70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331280] saa7134: i2c eeprom 80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331281] saa7134: i2c eeprom 90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331282] saa7134: i2c eeprom a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331283] saa7134: i2c eeprom b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331284] saa7134: i2c eeprom c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331285] saa7134: i2c eeprom d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331286] saa7134: i2c eeprom e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.331287] saa7134: i2c eeprom f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  153.404580] tuner: 1-004b: Tuner -1 found with type(s) Radio TV.
[  153.443601] checking generic (f9000000 500000) vs hw (d0000000 10000000)
[  153.443603] checking generic (f9000000 500000) vs hw (f8000000 2000000)
[  153.443605] fb0: switching to nouveaufb from VESA VGA
[  153.443637] Console: switching to colour dummy device 80x25
[  153.443882] nouveau 0000:01:00.0: NVIDIA G84 (084200a2)
[  153.501228] tda829x 1-004b: setting tuner address to 60
[  153.504566] usb 1-5: reset high-speed USB device number 3 using ehci-pci
[  153.548270] nouveau 0000:01:00.0: bios: version 60.84.6e.00.12
[  153.569246] nouveau 0000:01:00.0: bios: M0203T not found
[  153.569249] nouveau 0000:01:00.0: bios: M0203E not matched!
[  153.569251] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[  153.584572] tda829x 1-004b: type set to tda8290+75a
[  153.608014] Adding 4881404k swap on /dev/sde1.  Priority:-3 extents:1 across:4881404k FS
[  153.638888] [TTM] Zone  kernel: Available graphics memory: 2276580 KiB
[  153.638890] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[  153.638891] [TTM] Initializing pool allocator
[  153.638898] [TTM] Initializing DMA pool allocator
[  153.638923] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[  153.638925] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[  153.638929] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[  153.638932] nouveau 0000:01:00.0: DRM: DCB version 4.0
[  153.638935] nouveau 0000:01:00.0: DRM: DCB outp 00: 04000310 00000028
[  153.638937] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[  153.638939] nouveau 0000:01:00.0: DRM: DCB outp 02: 01011302 00000030
[  153.638941] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022322 00020010
[  153.638943] nouveau 0000:01:00.0: DRM: DCB outp 04: 010333f1 00c0c083
[  153.638945] nouveau 0000:01:00.0: DRM: DCB conn 00: 0000
[  153.638947] nouveau 0000:01:00.0: DRM: DCB conn 01: 1130
[  153.638949] nouveau 0000:01:00.0: DRM: DCB conn 02: 2261
[  153.638951] nouveau 0000:01:00.0: DRM: DCB conn 03: 0310
[  153.638953] nouveau 0000:01:00.0: DRM: DCB conn 04: 0311
[  153.638954] nouveau 0000:01:00.0: DRM: DCB conn 05: 0313
[  153.640571] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
[  153.643691] nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
[  153.643694] nouveau 0000:01:00.0: DRM: TV-1 has no encoders, removing
[  153.643705] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  153.643706] [drm] Driver supports precise vblank timestamp query.
[  153.661837] ieee80211 phy0: rt2x00_set_rt: Info - RT chipset 2860, rev 0101 detected
[  153.664110] audit: type=1130 audit(1565977309.346:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  153.716240] ieee80211 phy0: rt2x00_set_rf: Info - RF chipset 0003 detected
[  153.735689] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[  153.736239] usbcore: registered new interface driver rt2800usb
[  153.742875] rt2800usb 1-5:1.0 wlp0s26f7u5: renamed from wlan0
[  153.791959] audit: type=1130 audit(1565977309.476:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-disk-by\x2duuid-D46B\x2d379E comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  153.952956] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x50000, bo 00000000a6d02811
[  153.953052] fbcon: nouveaudrmfb (fb0) is primary device
[  153.960069] audit: type=1130 audit(1565977309.642:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-disk-by\x2duuid-c26efc96\x2d2725\x2d4add\x2da519\x2d29b0e0d28ed9 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  153.995128] Console: switching to colour frame buffer device 210x65
[  153.996309] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
[  154.012064] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
[  154.169893] EXT4-fs (sde2): mounted filesystem with ordered data mode. Opts: data=ordered
[  154.209266] audit: type=1130 audit(1565977309.892:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  154.226483] audit: type=1127 audit(1565977309.909:10): pid=446 uid=0 auid=4294967295 ses=4294967295 msg=' comm="systemd-update-utmp" exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=? terminal=? res=success'
[  154.230490] audit: type=1130 audit(1565977309.912:11): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-update-utmp comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  154.911205] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[  154.911224] Bluetooth: BNEP filters: protocol multicast
[  154.911232] Bluetooth: BNEP socket layer initialized
[  155.726591] ieee80211 phy0: rt2x00lib_request_firmware: Info - Loading firmware file 'rt2870.bin'
[  155.730675] ieee80211 phy0: rt2x00lib_request_firmware: Info - Firmware detected - version: 0.36
[  157.551884] saa7134: saa7133[0]: registered device video0 [v4l2]
[  157.552035] saa7134: saa7133[0]: registered device vbi0
[  157.582989] saa7134_dvb: dvb_init() allocating 1 frontend
[  157.601354] dvbdev: DVB: registering new adapter (saa7133[0])
[  157.601363] saa7134 0000:02:00.0: DVB: registering adapter 0 frontend 0 (Philips TDA10046H DVB-T)...
[  157.601370] dvbdev: dvb_create_media_entity: media entity 'Philips TDA10046H DVB-T' registered.
[  157.601847] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
[  157.623185] fuse: init (API version 7.31)
[  157.751228] tda1004x: setting up plls for 48MHz sampling clock
[  158.743922] kauditd_printk_skb: 18 callbacks suppressed
[  158.743924] audit: type=1131 audit(1565977314.426:30): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  159.797922] tda1004x: found firmware revision 26 -- ok
[  160.315933] saa7134_alsa: saa7134 ALSA driver for DMA sound loaded
[  160.315976] saa7134_alsa: saa7133[0]/alsa: saa7133[0] at 0xfddff000 irq 16 registered as card -1
[  161.728989] audit: type=1130 audit(1565977317.412:31): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-wait-online comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  162.656453] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[  162.660359] Bridge firewalling registered
[  162.823122] audit: type=1325 audit(1565977318.506:32): table=filter family=2 entries=0
[  162.902607] audit: type=1325 audit(1565977318.586:33): table=nat family=2 entries=0
[  162.923431] audit: type=1325 audit(1565977318.606:34): table=nat family=2 entries=5
[  162.926044] audit: type=1325 audit(1565977318.609:35): table=filter family=2 entries=4
[  162.928797] audit: type=1325 audit(1565977318.612:36): table=filter family=2 entries=6
[  162.931393] audit: type=1325 audit(1565977318.616:37): table=filter family=2 entries=8
[  162.933704] audit: type=1325 audit(1565977318.616:38): table=filter family=2 entries=10
[  162.936056] audit: type=1325 audit(1565977318.619:39): table=filter family=2 entries=11
[  162.950403] Initializing XFRM netlink socket
[  166.006914] kauditd_printk_skb: 34 callbacks suppressed
[  166.006917] audit: type=1131 audit(1565977321.689:74): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  185.471615] audit: type=1131 audit(1565977341.156:75): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  199.123676] audit: type=1006 audit(1565977354.806:76): pid=546 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[  199.157532] audit: type=1130 audit(1565977354.839:77): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  199.167181] audit: type=1006 audit(1565977354.849:78): pid=715 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
[  199.246923] audit: type=1130 audit(1565977354.929:79): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  199.339836] audit: type=1112 audit(1565977355.022:80): pid=546 uid=0 auid=1000 ses=2 msg='op=login id=1000 exe="/usr/bin/lightdm" hostname=medion addr=? terminal=/dev/tty7 res=success'
[  199.425255] audit: type=1113 audit(1565977355.109:81): pid=546 uid=0 auid=1000 ses=2 msg='op=logout id=1000 exe="/usr/bin/lightdm" hostname=medion addr=? terminal=/dev/tty7 res=success'
[  199.777513] audit: type=1130 audit(1565977355.459:82): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  202.791845] audit: type=1130 audit(1565977358.476:83): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=getty@tty2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  206.487070] audit: type=1006 audit(1565977362.169:84): pid=780 uid=0 old-auid=4294967295 auid=1000 tty=tty2 old-ses=4294967295 ses=4 res=1
[  208.400365] wlp0s26f7u5: authenticate with 48:d3:43:03:66:69
[  208.487788] wlp0s26f7u5: send auth to 48:d3:43:03:66:69 (try 1/3)
[  208.490018] wlp0s26f7u5: authenticated
[  208.491212] wlp0s26f7u5: associate with 48:d3:43:03:66:69 (try 1/3)
[  208.497491] wlp0s26f7u5: RX AssocResp from 48:d3:43:03:66:69 (capab=0x431 status=0 aid=1)
[  208.506351] wlp0s26f7u5: associated
[  208.543587] IPv6: ADDRCONF(NETDEV_CHANGE): wlp0s26f7u5: link becomes ready
[  210.011677] audit: type=1131 audit(1565977365.696:85): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  211.266485] audit: type=1130 audit(1565977366.949:86): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  221.581864] audit: type=1131 audit(1565977377.430:87): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=lightdm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  221.843216] audit: type=1131 audit(1565977377.698:88): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  227.442203] audit: type=1130 audit(1565977383.376:89): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=polkit comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  227.800452] audit: type=1701 audit(1565977383.736:90): auid=1000 uid=1000 gid=1000 ses=3 pid=947 comm="kscreen_backend" exe="/usr/lib/kf5/kscreen_backend_launcher" sig=6 res=1
[  227.875255] audit: type=1130 audit(1565977383.813:91): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@0-957-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  228.033214] audit: type=1130 audit(1565977383.975:92): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=rtkit-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  228.477458] lxqt-config-mon[929]: segfault at 10 ip 00007f73ec6e6ee2 sp 00007ffd2a161fb0 error 4 in libKF5Screen.so.5.16.4[7f73ec6d9000+42000]
[  228.477469] Code: 1f 84 00 00 00 00 00 90 48 8b 47 10 0f b6 40 10 c3 90 66 0f 1f 44 00 00 48 8b 47 10 40 88 70 10 c3 90 66 0f 1f 44 00 00 41 54 <48> 8b 76 10 49 89 fc 48 83 c6 38 e8 ee 2f 00 00 4c 89 e0 41 5c c3
[  228.477529] audit: type=1701 audit(1565977384.422:93): auid=1000 uid=1000 gid=1000 ses=4 pid=929 comm="lxqt-config-mon" exe="/usr/bin/lxqt-config-monitor" sig=11 res=1
[  228.502092] audit: type=1130 audit(1565977384.449:94): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@1-1011-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  228.505424] audit: type=1131 audit(1565977384.452:95): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@0-957-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  228.825461] audit: type=1130 audit(1565977384.771:96): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=geoclue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  228.887144] audit: type=1130 audit(1565977384.835:97): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=udisks2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  229.728695] Bluetooth: RFCOMM TTY layer initialized
[  229.728703] Bluetooth: RFCOMM socket layer initialized
[  229.728711] Bluetooth: RFCOMM ver 1.11
[  239.699525] kauditd_printk_skb: 10 callbacks suppressed
[  239.699529] audit: type=1131 audit(1565977395.690:108): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  259.380291] audit: type=1131 audit(1565977415.390:109): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=blueman-mechanism comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  283.794787] audit: type=1130 audit(1565977439.819:110): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  313.811466] audit: type=1131 audit(1565977469.837:111): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  316.574302] audit: type=1701 audit(1565977472.599:112): auid=1000 uid=1000 gid=1000 ses=3 pid=1282 comm="kscreen_backend" exe="/usr/lib/kf5/kscreen_backend_launcher" sig=6 res=1
[  316.589367] audit: type=1130 audit(1565977472.613:113): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@2-1283-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  317.159874] audit: type=1131 audit(1565977473.183:114): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@2-1283-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  942.035348] audit: type=1130 audit(1565978098.063:115): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[  942.035357] audit: type=1131 audit(1565978098.063:116): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 1008.985212] perf: interrupt took too long (2507 > 2500), lowering kernel.perf_event_max_sample_rate to 79500
[ 3573.969403] perf: interrupt took too long (3144 > 3133), lowering kernel.perf_event_max_sample_rate to 63600
[ 3723.963109] nouveau 0000:01:00.0: disp: ERROR 4 [INVALID_ARG] 84 [] chid 0 mthd 089c data f0000001
[ 3723.963134] nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 0f [] chid 0 mthd 0080 data 00000000
[ 3723.963138] nouveau 0000:01:00.0: disp: Core:
[ 3723.963143] nouveau 0000:01:00.0: disp: 	0084: 04000500 -> 00000000
[ 3723.963148] nouveau 0000:01:00.0: disp: 	0088: f0000000
[ 3723.963150] nouveau 0000:01:00.0: disp: Core - DAC 0:
[ 3723.963155] nouveau 0000:01:00.0: disp: 	0400: 00000000
[ 3723.963160] nouveau 0000:01:00.0: disp: 	0404: 00000000
[ 3723.963164] nouveau 0000:01:00.0: disp: 	0420: 00010000
[ 3723.963166] nouveau 0000:01:00.0: disp: Core - DAC 1:
[ 3723.963171] nouveau 0000:01:00.0: disp: 	0480: 00000000
[ 3723.963175] nouveau 0000:01:00.0: disp: 	0484: 00000000
[ 3723.963179] nouveau 0000:01:00.0: disp: 	04a0: 00010000
[ 3723.963182] nouveau 0000:01:00.0: disp: Core - DAC 2:
[ 3723.963186] nouveau 0000:01:00.0: disp: 	0500: 00000001
[ 3723.963190] nouveau 0000:01:00.0: disp: 	0504: 00000001
[ 3723.963194] nouveau 0000:01:00.0: disp: 	0520: 00010000
[ 3723.963197] nouveau 0000:01:00.0: disp: Core - SOR 0:
[ 3723.963202] nouveau 0000:01:00.0: disp: 	0600: 00000102
[ 3723.963204] nouveau 0000:01:00.0: disp: Core - SOR 1:
[ 3723.963209] nouveau 0000:01:00.0: disp: 	0640: 00000000
[ 3723.963211] nouveau 0000:01:00.0: disp: Core - PIOR 0:
[ 3723.963216] nouveau 0000:01:00.0: disp: 	0700: 00000000
[ 3723.963218] nouveau 0000:01:00.0: disp: Core - PIOR 1:
[ 3723.963223] nouveau 0000:01:00.0: disp: 	0740: 00000000
[ 3723.963225] nouveau 0000:01:00.0: disp: Core - PIOR 2:
[ 3723.963229] nouveau 0000:01:00.0: disp: 	0780: 00000000
[ 3723.963232] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[ 3723.963236] nouveau 0000:01:00.0: disp: 	0800: 00000000
[ 3723.963241] nouveau 0000:01:00.0: disp: 	0804: 00823b4a
[ 3723.963245] nouveau 0000:01:00.0: disp: 	0808: 00000000
[ 3723.963249] nouveau 0000:01:00.0: disp: 	080c: 00000000
[ 3723.963253] nouveau 0000:01:00.0: disp: 	0810: 00000000
[ 3723.963258] nouveau 0000:01:00.0: disp: 	0814: 044108c0
[ 3723.963262] nouveau 0000:01:00.0: disp: 	0818: 000500af
[ 3723.963266] nouveau 0000:01:00.0: disp: 	081c: 002301c7
[ 3723.963270] nouveau 0000:01:00.0: disp: 	0820: 043d0857
[ 3723.963274] nouveau 0000:01:00.0: disp: 	0824: 00000001
[ 3723.963278] nouveau 0000:01:00.0: disp: 	0828: 00000236
[ 3723.963283] nouveau 0000:01:00.0: disp: 	082c: 00000000
[ 3723.963287] nouveau 0000:01:00.0: disp: 	0830: 00000000
[ 3723.963291] nouveau 0000:01:00.0: disp: 	0838: 00000000
[ 3723.963295] nouveau 0000:01:00.0: disp: 	0840: c0000000
[ 3723.963299] nouveau 0000:01:00.0: disp: 	0844: 000004a0
[ 3723.963303] nouveau 0000:01:00.0: disp: 	0848: 00000000
[ 3723.963308] nouveau 0000:01:00.0: disp: 	084c: 00000000
[ 3723.963312] nouveau 0000:01:00.0: disp: 	085c: f0000001
[ 3723.963316] nouveau 0000:01:00.0: disp: 	0860: 00000000
[ 3723.963320] nouveau 0000:01:00.0: disp: 	0864: 00000000
[ 3723.963324] nouveau 0000:01:00.0: disp: 	0868: 04380e10
[ 3723.963329] nouveau 0000:01:00.0: disp: 	086c: 00103900
[ 3723.963333] nouveau 0000:01:00.0: disp: 	0870: 0000cf00
[ 3723.963337] nouveau 0000:01:00.0: disp: 	0874: f0000001
[ 3723.963341] nouveau 0000:01:00.0: disp: 	0878: 00000000
[ 3723.963346] nouveau 0000:01:00.0: disp: 	0880: 05000000 -> 85000000
[ 3723.963350] nouveau 0000:01:00.0: disp: 	0884: 00019bb0
[ 3723.963354] nouveau 0000:01:00.0: disp: 	089c: 00000000
[ 3723.963358] nouveau 0000:01:00.0: disp: 	08a0: 00000003
[ 3723.963362] nouveau 0000:01:00.0: disp: 	08a4: 00000000
[ 3723.963367] nouveau 0000:01:00.0: disp: 	08a8: 00040000
[ 3723.963371] nouveau 0000:01:00.0: disp: 	08c0: 00000780
[ 3723.963375] nouveau 0000:01:00.0: disp: 	08c4: 00000000
[ 3723.963380] nouveau 0000:01:00.0: disp: 	08c8: 041a0690
[ 3723.963384] nouveau 0000:01:00.0: disp: 	08d4: 00000000
[ 3723.963388] nouveau 0000:01:00.0: disp: 	08d8: 041a0690
[ 3723.963392] nouveau 0000:01:00.0: disp: 	08dc: 041a0690
[ 3723.963396] nouveau 0000:01:00.0: disp: 	0900: 00000301
[ 3723.963400] nouveau 0000:01:00.0: disp: 	0904: 00000100
[ 3723.963405] nouveau 0000:01:00.0: disp: 	0910: 00000000
[ 3723.963409] nouveau 0000:01:00.0: disp: 	0914: 00000000
[ 3723.963411] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[ 3723.963416] nouveau 0000:01:00.0: disp: 	0c00: 00000000
[ 3723.963420] nouveau 0000:01:00.0: disp: 	0c04: 00824414
[ 3723.963424] nouveau 0000:01:00.0: disp: 	0c08: 00000000
[ 3723.963428] nouveau 0000:01:00.0: disp: 	0c0c: 00000000
[ 3723.963432] nouveau 0000:01:00.0: disp: 	0c10: 00000000
[ 3723.963436] nouveau 0000:01:00.0: disp: 	0c14: 04650898
[ 3723.963440] nouveau 0000:01:00.0: disp: 	0c18: 0004002b
[ 3723.963445] nouveau 0000:01:00.0: disp: 	0c1c: 002800bf
[ 3723.963449] nouveau 0000:01:00.0: disp: 	0c20: 0460083f
[ 3723.963453] nouveau 0000:01:00.0: disp: 	0c24: 00000001
[ 3723.963457] nouveau 0000:01:00.0: disp: 	0c28: 0000027d
[ 3723.963461] nouveau 0000:01:00.0: disp: 	0c2c: 00000000
[ 3723.963465] nouveau 0000:01:00.0: disp: 	0c30: 00000000
[ 3723.963470] nouveau 0000:01:00.0: disp: 	0c38: 00000000
[ 3723.963474] nouveau 0000:01:00.0: disp: 	0c40: c0000000
[ 3723.963478] nouveau 0000:01:00.0: disp: 	0c44: 000004c0
[ 3723.963482] nouveau 0000:01:00.0: disp: 	0c48: 00000000
[ 3723.963487] nouveau 0000:01:00.0: disp: 	0c4c: 00000000
[ 3723.963491] nouveau 0000:01:00.0: disp: 	0c5c: f0000001
[ 3723.963495] nouveau 0000:01:00.0: disp: 	0c60: 00000000
[ 3723.963499] nouveau 0000:01:00.0: disp: 	0c64: 00000000
[ 3723.963503] nouveau 0000:01:00.0: disp: 	0c68: 04380e10
[ 3723.963508] nouveau 0000:01:00.0: disp: 	0c6c: 00103900
[ 3723.963512] nouveau 0000:01:00.0: disp: 	0c70: 0000cf00
[ 3723.963516] nouveau 0000:01:00.0: disp: 	0c74: f0000001
[ 3723.963520] nouveau 0000:01:00.0: disp: 	0c78: 00000000
[ 3723.963524] nouveau 0000:01:00.0: disp: 	0c80: 85000000
[ 3723.963528] nouveau 0000:01:00.0: disp: 	0c84: 00019b00
[ 3723.963533] nouveau 0000:01:00.0: disp: 	0c9c: f0000001
[ 3723.963537] nouveau 0000:01:00.0: disp: 	0ca0: 00000003
[ 3723.963541] nouveau 0000:01:00.0: disp: 	0ca4: 00000000
[ 3723.963545] nouveau 0000:01:00.0: disp: 	0ca8: 00040000
[ 3723.963549] nouveau 0000:01:00.0: disp: 	0cc0: 00000000
[ 3723.963553] nouveau 0000:01:00.0: disp: 	0cc4: 00000000
[ 3723.963558] nouveau 0000:01:00.0: disp: 	0cc8: 04380780
[ 3723.963562] nouveau 0000:01:00.0: disp: 	0cd4: 00000000
[ 3723.963566] nouveau 0000:01:00.0: disp: 	0cd8: 04380780
[ 3723.963570] nouveau 0000:01:00.0: disp: 	0cdc: 04380780
[ 3723.963574] nouveau 0000:01:00.0: disp: 	0d00: 00000301
[ 3723.963578] nouveau 0000:01:00.0: disp: 	0d04: 00000100
[ 3723.963583] nouveau 0000:01:00.0: disp: 	0d10: 00000000
[ 3723.963587] nouveau 0000:01:00.0: disp: 	0d14: 00000000
[ 3723.971398] nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 0f [] chid 0 mthd 0080 data 00000000
[ 3723.971403] nouveau 0000:01:00.0: disp: Core:
[ 3723.971407] nouveau 0000:01:00.0: disp: 	0084: 04000500 -> 00000000
[ 3723.971411] nouveau 0000:01:00.0: disp: 	0088: f0000000
[ 3723.971413] nouveau 0000:01:00.0: disp: Core - DAC 0:
[ 3723.971417] nouveau 0000:01:00.0: disp: 	0400: 00000000
[ 3723.971420] nouveau 0000:01:00.0: disp: 	0404: 00000000
[ 3723.971424] nouveau 0000:01:00.0: disp: 	0420: 00010000
[ 3723.971425] nouveau 0000:01:00.0: disp: Core - DAC 1:
[ 3723.971429] nouveau 0000:01:00.0: disp: 	0480: 00000000
[ 3723.971434] nouveau 0000:01:00.0: disp: 	0484: 00000000
[ 3723.971439] nouveau 0000:01:00.0: disp: 	04a0: 00010000
[ 3723.971441] nouveau 0000:01:00.0: disp: Core - DAC 2:
[ 3723.971445] nouveau 0000:01:00.0: disp: 	0500: 00000001
[ 3723.971448] nouveau 0000:01:00.0: disp: 	0504: 00000001
[ 3723.971452] nouveau 0000:01:00.0: disp: 	0520: 00010000
[ 3723.971454] nouveau 0000:01:00.0: disp: Core - SOR 0:
[ 3723.971458] nouveau 0000:01:00.0: disp: 	0600: 00000102
[ 3723.971460] nouveau 0000:01:00.0: disp: Core - SOR 1:
[ 3723.971463] nouveau 0000:01:00.0: disp: 	0640: 00000000
[ 3723.971466] nouveau 0000:01:00.0: disp: Core - PIOR 0:
[ 3723.971470] nouveau 0000:01:00.0: disp: 	0700: 00000000
[ 3723.971472] nouveau 0000:01:00.0: disp: Core - PIOR 1:
[ 3723.971475] nouveau 0000:01:00.0: disp: 	0740: 00000000
[ 3723.971477] nouveau 0000:01:00.0: disp: Core - PIOR 2:
[ 3723.971481] nouveau 0000:01:00.0: disp: 	0780: 00000000
[ 3723.971484] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[ 3723.971487] nouveau 0000:01:00.0: disp: 	0800: 00000000
[ 3723.971491] nouveau 0000:01:00.0: disp: 	0804: 00823b4a
[ 3723.971494] nouveau 0000:01:00.0: disp: 	0808: 00000000
[ 3723.971498] nouveau 0000:01:00.0: disp: 	080c: 00000000
[ 3723.971501] nouveau 0000:01:00.0: disp: 	0810: 00000000
[ 3723.971505] nouveau 0000:01:00.0: disp: 	0814: 044108c0
[ 3723.971509] nouveau 0000:01:00.0: disp: 	0818: 000500af
[ 3723.971512] nouveau 0000:01:00.0: disp: 	081c: 002301c7
[ 3723.971516] nouveau 0000:01:00.0: disp: 	0820: 043d0857
[ 3723.971520] nouveau 0000:01:00.0: disp: 	0824: 00000001
[ 3723.971524] nouveau 0000:01:00.0: disp: 	0828: 00000236
[ 3723.971529] nouveau 0000:01:00.0: disp: 	082c: 00000000
[ 3723.971533] nouveau 0000:01:00.0: disp: 	0830: 00000000
[ 3723.971537] nouveau 0000:01:00.0: disp: 	0838: 00000000
[ 3723.971541] nouveau 0000:01:00.0: disp: 	0840: c0000000
[ 3723.971546] nouveau 0000:01:00.0: disp: 	0844: 000004a0
[ 3723.971550] nouveau 0000:01:00.0: disp: 	0848: 00000000
[ 3723.971554] nouveau 0000:01:00.0: disp: 	084c: 00000000
[ 3723.971558] nouveau 0000:01:00.0: disp: 	085c: f0000001
[ 3723.971562] nouveau 0000:01:00.0: disp: 	0860: 00000000
[ 3723.971566] nouveau 0000:01:00.0: disp: 	0864: 00000000
[ 3723.971570] nouveau 0000:01:00.0: disp: 	0868: 04380e10
[ 3723.971574] nouveau 0000:01:00.0: disp: 	086c: 00103900
[ 3723.971578] nouveau 0000:01:00.0: disp: 	0870: 0000cf00
[ 3723.971581] nouveau 0000:01:00.0: disp: 	0874: f0000001
[ 3723.971585] nouveau 0000:01:00.0: disp: 	0878: 00000000
[ 3723.971588] nouveau 0000:01:00.0: disp: 	0880: 05000000 -> 85000000
[ 3723.971592] nouveau 0000:01:00.0: disp: 	0884: 00019bb0
[ 3723.971596] nouveau 0000:01:00.0: disp: 	089c: 00000000
[ 3723.971599] nouveau 0000:01:00.0: disp: 	08a0: 00000003
[ 3723.971603] nouveau 0000:01:00.0: disp: 	08a4: 00000000
[ 3723.971606] nouveau 0000:01:00.0: disp: 	08a8: 00040000
[ 3723.971609] nouveau 0000:01:00.0: disp: 	08c0: 00000780
[ 3723.971613] nouveau 0000:01:00.0: disp: 	08c4: 00000000
[ 3723.971617] nouveau 0000:01:00.0: disp: 	08c8: 041a0690
[ 3723.971620] nouveau 0000:01:00.0: disp: 	08d4: 00000000
[ 3723.971624] nouveau 0000:01:00.0: disp: 	08d8: 041a0690
[ 3723.971627] nouveau 0000:01:00.0: disp: 	08dc: 041a0690
[ 3723.971631] nouveau 0000:01:00.0: disp: 	0900: 00000301
[ 3723.971634] nouveau 0000:01:00.0: disp: 	0904: 00000100
[ 3723.971638] nouveau 0000:01:00.0: disp: 	0910: 00000000
[ 3723.971642] nouveau 0000:01:00.0: disp: 	0914: 00000000
[ 3723.971644] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[ 3723.971648] nouveau 0000:01:00.0: disp: 	0c00: 00000000
[ 3723.971652] nouveau 0000:01:00.0: disp: 	0c04: 00824414
[ 3723.971655] nouveau 0000:01:00.0: disp: 	0c08: 00000000
[ 3723.971659] nouveau 0000:01:00.0: disp: 	0c0c: 00000000
[ 3723.971662] nouveau 0000:01:00.0: disp: 	0c10: 00000000
[ 3723.971666] nouveau 0000:01:00.0: disp: 	0c14: 04650898
[ 3723.971670] nouveau 0000:01:00.0: disp: 	0c18: 0004002b
[ 3723.971673] nouveau 0000:01:00.0: disp: 	0c1c: 002800bf
[ 3723.971677] nouveau 0000:01:00.0: disp: 	0c20: 0460083f
[ 3723.971680] nouveau 0000:01:00.0: disp: 	0c24: 00000001
[ 3723.971683] nouveau 0000:01:00.0: disp: 	0c28: 0000027d
[ 3723.971688] nouveau 0000:01:00.0: disp: 	0c2c: 00000000
[ 3723.971692] nouveau 0000:01:00.0: disp: 	0c30: 00000000
[ 3723.971695] nouveau 0000:01:00.0: disp: 	0c38: 00000000
[ 3723.971699] nouveau 0000:01:00.0: disp: 	0c40: c0000000
[ 3723.971702] nouveau 0000:01:00.0: disp: 	0c44: 000004c0 -> 000004d0
[ 3723.971706] nouveau 0000:01:00.0: disp: 	0c48: 00000000
[ 3723.971709] nouveau 0000:01:00.0: disp: 	0c4c: 00000000
[ 3723.971713] nouveau 0000:01:00.0: disp: 	0c5c: f0000001
[ 3723.971717] nouveau 0000:01:00.0: disp: 	0c60: 00000000
[ 3723.971720] nouveau 0000:01:00.0: disp: 	0c64: 00000000
[ 3723.971724] nouveau 0000:01:00.0: disp: 	0c68: 04380e10
[ 3723.971728] nouveau 0000:01:00.0: disp: 	0c6c: 00103900
[ 3723.971732] nouveau 0000:01:00.0: disp: 	0c70: 0000cf00
[ 3723.971736] nouveau 0000:01:00.0: disp: 	0c74: f0000001
[ 3723.971740] nouveau 0000:01:00.0: disp: 	0c78: 00000000
[ 3723.971744] nouveau 0000:01:00.0: disp: 	0c80: 85000000 -> 05000000
[ 3723.971748] nouveau 0000:01:00.0: disp: 	0c84: 00019b00
[ 3723.971753] nouveau 0000:01:00.0: disp: 	0c9c: f0000001 -> 00000000
[ 3723.971756] nouveau 0000:01:00.0: disp: 	0ca0: 00000003
[ 3723.971760] nouveau 0000:01:00.0: disp: 	0ca4: 00000000
[ 3723.971763] nouveau 0000:01:00.0: disp: 	0ca8: 00040000
[ 3723.971767] nouveau 0000:01:00.0: disp: 	0cc0: 00000000
[ 3723.971771] nouveau 0000:01:00.0: disp: 	0cc4: 00000000
[ 3723.971775] nouveau 0000:01:00.0: disp: 	0cc8: 04380780
[ 3723.971779] nouveau 0000:01:00.0: disp: 	0cd4: 00000000
[ 3723.971786] nouveau 0000:01:00.0: disp: 	0cd8: 04380780
[ 3723.971791] nouveau 0000:01:00.0: disp: 	0cdc: 04380780
[ 3723.971795] nouveau 0000:01:00.0: disp: 	0d00: 00000301
[ 3723.971799] nouveau 0000:01:00.0: disp: 	0d04: 00000100
[ 3723.971802] nouveau 0000:01:00.0: disp: 	0d10: 00000000
[ 3723.971807] nouveau 0000:01:00.0: disp: 	0d14: 00000000
[ 3724.075315] nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 0f [] chid 0 mthd 0080 data 00000000
[ 3724.075320] nouveau 0000:01:00.0: disp: Core:
[ 3724.075325] nouveau 0000:01:00.0: disp: 	0084: 04000500 -> 00000000
[ 3724.075329] nouveau 0000:01:00.0: disp: 	0088: f0000000
[ 3724.075332] nouveau 0000:01:00.0: disp: Core - DAC 0:
[ 3724.075337] nouveau 0000:01:00.0: disp: 	0400: 00000000
[ 3724.075341] nouveau 0000:01:00.0: disp: 	0404: 00000000
[ 3724.075346] nouveau 0000:01:00.0: disp: 	0420: 00010000
[ 3724.075348] nouveau 0000:01:00.0: disp: Core - DAC 1:
[ 3724.075353] nouveau 0000:01:00.0: disp: 	0480: 00000000
[ 3724.075357] nouveau 0000:01:00.0: disp: 	0484: 00000000
[ 3724.075361] nouveau 0000:01:00.0: disp: 	04a0: 00010000
[ 3724.075364] nouveau 0000:01:00.0: disp: Core - DAC 2:
[ 3724.075368] nouveau 0000:01:00.0: disp: 	0500: 00000001
[ 3724.075373] nouveau 0000:01:00.0: disp: 	0504: 00000001
[ 3724.075377] nouveau 0000:01:00.0: disp: 	0520: 00010000
[ 3724.075380] nouveau 0000:01:00.0: disp: Core - SOR 0:
[ 3724.075384] nouveau 0000:01:00.0: disp: 	0600: 00000102
[ 3724.075387] nouveau 0000:01:00.0: disp: Core - SOR 1:
[ 3724.075391] nouveau 0000:01:00.0: disp: 	0640: 00000000
[ 3724.075394] nouveau 0000:01:00.0: disp: Core - PIOR 0:
[ 3724.075398] nouveau 0000:01:00.0: disp: 	0700: 00000000
[ 3724.075401] nouveau 0000:01:00.0: disp: Core - PIOR 1:
[ 3724.075405] nouveau 0000:01:00.0: disp: 	0740: 00000000
[ 3724.075408] nouveau 0000:01:00.0: disp: Core - PIOR 2:
[ 3724.075412] nouveau 0000:01:00.0: disp: 	0780: 00000000
[ 3724.075415] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[ 3724.075419] nouveau 0000:01:00.0: disp: 	0800: 00000000
[ 3724.075423] nouveau 0000:01:00.0: disp: 	0804: 00823b4a
[ 3724.075428] nouveau 0000:01:00.0: disp: 	0808: 00000000
[ 3724.075432] nouveau 0000:01:00.0: disp: 	080c: 00000000
[ 3724.075436] nouveau 0000:01:00.0: disp: 	0810: 00000000
[ 3724.075440] nouveau 0000:01:00.0: disp: 	0814: 044108c0
[ 3724.075445] nouveau 0000:01:00.0: disp: 	0818: 000500af
[ 3724.075449] nouveau 0000:01:00.0: disp: 	081c: 002301c7
[ 3724.075453] nouveau 0000:01:00.0: disp: 	0820: 043d0857
[ 3724.075458] nouveau 0000:01:00.0: disp: 	0824: 00000001
[ 3724.075462] nouveau 0000:01:00.0: disp: 	0828: 00000236
[ 3724.075466] nouveau 0000:01:00.0: disp: 	082c: 00000000
[ 3724.075470] nouveau 0000:01:00.0: disp: 	0830: 00000000
[ 3724.075474] nouveau 0000:01:00.0: disp: 	0838: 00000000
[ 3724.075478] nouveau 0000:01:00.0: disp: 	0840: c0000000
[ 3724.075483] nouveau 0000:01:00.0: disp: 	0844: 000004a0
[ 3724.075487] nouveau 0000:01:00.0: disp: 	0848: 00000000
[ 3724.075491] nouveau 0000:01:00.0: disp: 	084c: 00000000
[ 3724.075495] nouveau 0000:01:00.0: disp: 	085c: f0000001
[ 3724.075499] nouveau 0000:01:00.0: disp: 	0860: 00000000
[ 3724.075503] nouveau 0000:01:00.0: disp: 	0864: 00000000
[ 3724.075508] nouveau 0000:01:00.0: disp: 	0868: 04380e10
[ 3724.075512] nouveau 0000:01:00.0: disp: 	086c: 00103900
[ 3724.075516] nouveau 0000:01:00.0: disp: 	0870: 0000cf00
[ 3724.075520] nouveau 0000:01:00.0: disp: 	0874: f0000001
[ 3724.075525] nouveau 0000:01:00.0: disp: 	0878: 00000000
[ 3724.075529] nouveau 0000:01:00.0: disp: 	0880: 05000000 -> 85000000
[ 3724.075533] nouveau 0000:01:00.0: disp: 	0884: 00019bb0
[ 3724.075537] nouveau 0000:01:00.0: disp: 	089c: 00000000
[ 3724.075542] nouveau 0000:01:00.0: disp: 	08a0: 00000003
[ 3724.075546] nouveau 0000:01:00.0: disp: 	08a4: 00000000
[ 3724.075550] nouveau 0000:01:00.0: disp: 	08a8: 00040000
[ 3724.075554] nouveau 0000:01:00.0: disp: 	08c0: 00000780
[ 3724.075558] nouveau 0000:01:00.0: disp: 	08c4: 00000000
[ 3724.075562] nouveau 0000:01:00.0: disp: 	08c8: 041a0690
[ 3724.075567] nouveau 0000:01:00.0: disp: 	08d4: 00000000
[ 3724.075571] nouveau 0000:01:00.0: disp: 	08d8: 041a0690
[ 3724.075575] nouveau 0000:01:00.0: disp: 	08dc: 041a0690
[ 3724.075579] nouveau 0000:01:00.0: disp: 	0900: 00000301
[ 3724.075583] nouveau 0000:01:00.0: disp: 	0904: 00000100
[ 3724.075587] nouveau 0000:01:00.0: disp: 	0910: 00000000
[ 3724.075592] nouveau 0000:01:00.0: disp: 	0914: 00000000
[ 3724.075594] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[ 3724.075599] nouveau 0000:01:00.0: disp: 	0c00: 00000000
[ 3724.075603] nouveau 0000:01:00.0: disp: 	0c04: 00824414
[ 3724.075607] nouveau 0000:01:00.0: disp: 	0c08: 00000000
[ 3724.075611] nouveau 0000:01:00.0: disp: 	0c0c: 00000000
[ 3724.075616] nouveau 0000:01:00.0: disp: 	0c10: 00000000
[ 3724.075620] nouveau 0000:01:00.0: disp: 	0c14: 04650898
[ 3724.075624] nouveau 0000:01:00.0: disp: 	0c18: 0004002b
[ 3724.075628] nouveau 0000:01:00.0: disp: 	0c1c: 002800bf
[ 3724.075632] nouveau 0000:01:00.0: disp: 	0c20: 0460083f
[ 3724.075637] nouveau 0000:01:00.0: disp: 	0c24: 00000001
[ 3724.075641] nouveau 0000:01:00.0: disp: 	0c28: 0000027d
[ 3724.075645] nouveau 0000:01:00.0: disp: 	0c2c: 00000000
[ 3724.075649] nouveau 0000:01:00.0: disp: 	0c30: 00000000
[ 3724.075653] nouveau 0000:01:00.0: disp: 	0c38: 00000000
[ 3724.075658] nouveau 0000:01:00.0: disp: 	0c40: c0000000
[ 3724.075662] nouveau 0000:01:00.0: disp: 	0c44: 000004c0
[ 3724.075666] nouveau 0000:01:00.0: disp: 	0c48: 00000000
[ 3724.075670] nouveau 0000:01:00.0: disp: 	0c4c: 00000000
[ 3724.075674] nouveau 0000:01:00.0: disp: 	0c5c: f0000001
[ 3724.075679] nouveau 0000:01:00.0: disp: 	0c60: 00000000
[ 3724.075683] nouveau 0000:01:00.0: disp: 	0c64: 00000000
[ 3724.075687] nouveau 0000:01:00.0: disp: 	0c68: 04380e10
[ 3724.075691] nouveau 0000:01:00.0: disp: 	0c6c: 00103900
[ 3724.075695] nouveau 0000:01:00.0: disp: 	0c70: 0000cf00
[ 3724.075699] nouveau 0000:01:00.0: disp: 	0c74: f0000001
[ 3724.075704] nouveau 0000:01:00.0: disp: 	0c78: 00000000
[ 3724.075708] nouveau 0000:01:00.0: disp: 	0c80: 85000000
[ 3724.075712] nouveau 0000:01:00.0: disp: 	0c84: 00019b00
[ 3724.075716] nouveau 0000:01:00.0: disp: 	0c9c: f0000001
[ 3724.075720] nouveau 0000:01:00.0: disp: 	0ca0: 00000003
[ 3724.075724] nouveau 0000:01:00.0: disp: 	0ca4: 00000000
[ 3724.075729] nouveau 0000:01:00.0: disp: 	0ca8: 00040000
[ 3724.075733] nouveau 0000:01:00.0: disp: 	0cc0: 00000000
[ 3724.075737] nouveau 0000:01:00.0: disp: 	0cc4: 00000000
[ 3724.075741] nouveau 0000:01:00.0: disp: 	0cc8: 04380780
[ 3724.075745] nouveau 0000:01:00.0: disp: 	0cd4: 00000000
[ 3724.075750] nouveau 0000:01:00.0: disp: 	0cd8: 04380780
[ 3724.075754] nouveau 0000:01:00.0: disp: 	0cdc: 04380780
[ 3724.075758] nouveau 0000:01:00.0: disp: 	0d00: 00000301
[ 3724.075762] nouveau 0000:01:00.0: disp: 	0d04: 00000100
[ 3724.075766] nouveau 0000:01:00.0: disp: 	0d10: 00000000
[ 3724.075770] nouveau 0000:01:00.0: disp: 	0d14: 00000000
[ 3746.711385] perf: interrupt took too long (4029 > 3930), lowering kernel.perf_event_max_sample_rate to 49500
[ 4000.803045] perf: interrupt took too long (5048 > 5036), lowering kernel.perf_event_max_sample_rate to 39600
[ 4425.233164] perf: interrupt took too long (6395 > 6310), lowering kernel.perf_event_max_sample_rate to 31200
[19302.422899] audit: type=1130 audit(1565996458.029:117): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=shadow comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19302.445726] audit: type=1131 audit(1565996458.053:118): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=shadow comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19302.457441] audit: type=1130 audit(1565996458.063:119): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=logrotate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19302.457446] audit: type=1131 audit(1565996458.063:120): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=logrotate comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19309.612961] audit: type=1130 audit(1565996465.219:121): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=pkgfile-update comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19309.612970] audit: type=1131 audit(1565996465.219:122): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=pkgfile-update comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19329.701557] audit: type=1130 audit(1565996485.305:123): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=man-db comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[19329.701565] audit: type=1131 audit(1565996485.305:124): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=man-db comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[54497.857373] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000010 [DST2D_FAULT] - Address 0021a70000
[54497.857378] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
[54497.857385] nouveau 0000:01:00.0: gr: 00200000 [] ch 2 [000fa33000 systemd-logind[449]] subc 2 class 502d mthd 060c data 00000019
[54497.857399] nouveau 0000:01:00.0: fb: trapped write at 0021a70000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000000 [PT_NOT_PRESENT]
[54497.858549] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 2 [systemd-logind[449]] subc 0 mthd 0060 data beef0201
[54497.858569] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000010 [DST2D_FAULT] - Address 0021a70000
[54497.858573] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000000, e20: 00000011, e24: 0c030000
[54497.858579] nouveau 0000:01:00.0: gr: 00200000 [] ch 2 [000fa33000 systemd-logind[449]] subc 2 class 502d mthd 060c data 00000019
[54497.858598] nouveau 0000:01:00.0: fb: trapped write at 0021a70000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54497.858992] nouveau 0000:01:00.0: fb: trapped write at 0021a92000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54497.859415] nouveau 0000:01:00.0: fb: trapped write at 0021a7b800 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54497.859431] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000010 [DST2D_FAULT] - Address 0021a81800
[54497.859435] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000238, e20: 00000011, e24: 0c030000
[54497.859443] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000040 [RT_FAULT] - Address 0021a70400
[54497.859447] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00100004, e20: 00002a00, e24: 00030000
[54497.859451] nouveau 0000:01:00.0: gr: 00200000 [] ch 2 [000fa33000 systemd-logind[449]] subc 7 class 8297 mthd 15e0 data 00000000
[54497.859462] nouveau 0000:01:00.0: fb: trapped write at 0021a73200 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[54497.859474] nouveau 0000:01:00.0: gr: magic set 0:
[54497.859477] nouveau 0000:01:00.0: gr: 	00408904: 20083505
[54497.859480] nouveau 0000:01:00.0: gr: 	00408908: 0021aa3d
[54497.859483] nouveau 0000:01:00.0: gr: 	0040890c: 80000430
[54497.859486] nouveau 0000:01:00.0: gr: 	00408910: a7000000
[54497.859490] nouveau 0000:01:00.0: gr: TRAP_TEXTURE - TP0: 00000003 [ FAULT]
[54497.859495] nouveau 0000:01:00.0: gr: 00200000 [] ch 2 [000fa33000 systemd-logind[449]] subc 2 class 502d mthd 08dc data 00000000
[54497.859505] nouveau 0000:01:00.0: fb: trapped read at 0021aa1d00 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0a [TEXTURE] subclient 00 [] reason 00000002 [PAGE_NOT_PRESENT]
[54497.859887] nouveau 0000:01:00.0: fb: trapped read at 0021a7d500 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0a [TEXTURE] subclient 00 [] reason 00000002 [PAGE_NOT_PRESENT]
[54523.801405] brave[2511]: segfault at 0 ip 000055be469e2960 sp 00007ffdfc3e8678 error 4 in brave[55be459d9000+6f7e000]
[54523.801421] Code: 85 ff 75 d6 4c 89 f7 be ff ff ff ff e8 09 dd 5e 01 4c 89 f0 48 83 c4 08 5b 41 5e 41 5f 5d c3 cc cc cc cc cc cc cc cc cc cc cc <48> 8b 07 c3 cc cc cc cc cc cc cc cc cc cc cc cc 66 0f 76 c0 f3 0f
[54523.801516] audit: type=1701 audit(1566031678.634:125): auid=1000 uid=1000 gid=1000 ses=4 pid=2511 comm="brave" exe="/usr/lib/brave-bin/brave" sig=11 res=1
[54523.848133] audit: type=1130 audit(1566031678.681:126): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@3-8461-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[54526.628481] audit: type=1131 audit(1566031681.461:127): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@3-8461-0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[54560.015155] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 2 [systemd-logind[449]] subc 0 mthd 0060 data beef0201
[54560.015169] nouveau 0000:01:00.0: fb: trapped write at 0021a70000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000000 [PT_NOT_PRESENT]
[54560.015188] nouveau 0000:01:00.0: fb: trapped write at 0021a73000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54560.015612] nouveau 0000:01:00.0: fb: trapped write at 0021a85000 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54560.016023] nouveau 0000:01:00.0: fb: trapped write at 0021a7d800 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[54560.016463] nouveau 0000:01:00.0: fb: trapped write at 0020e1ea00 on channel 2 [0fa33000 systemd-logind[449]] engine 00 [PGRAPH] client 0b [PROP] subclient 0c [DST2D] reason 00000002 [PAGE_NOT_PRESENT]
[64282.951921] audit: type=1006 audit(1566041437.586:128): pid=8167 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=5 res=1

--===============0067915054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0067915054==--
