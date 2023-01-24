Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905A67B24C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369B810E7A2;
	Wed, 25 Jan 2023 12:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Tue, 24 Jan 2023 17:37:57 UTC
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
 by gabe.freedesktop.org (Postfix) with ESMTP id E021410E6D4;
 Tue, 24 Jan 2023 17:37:57 +0000 (UTC)
Received: from nabtop.nabijaczleweli.xyz (nabtop_wifi.nabijaczleweli.xyz
 [192.168.1.165])
 by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 02E162250;
 Tue, 24 Jan 2023 18:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
 s=202211; t=1674581489;
 bh=DTfZjRqf1+GGeldRkXSAxzFVef4LWpJaz9vEQyOBoxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5yyp201NK58VlEL56mFoDjw+ttXpSMbss2ARf6J1zpaK84BeB1Bgo1AMitz9Oh14
 XLMZlRX4hMij0ozmp6olm01nFjQJRqOoUatkh/3xPu4UA/7TEV6rztd9w6aSionjqN
 YvssX5PGW5ZAEJkfvQSpThXOLih4XTa1tKt/MuCHitnG1Kb4jFC27K+ATAMCpzY9+k
 qJUvAlGJI2gxAnV/vSWmqkB27O6TwFhI9EQEj03SDKCHnh1XrkTk46LSdQS5VAvztw
 do79q5lzPoSs6flCVocneo8H4OVPFRcvvdMX0IWDUW7sRhJcKETJkOJyifRJ8qtS0y
 HCnAALujuammg==
Date: Tue, 24 Jan 2023 18:31:27 +0100
From: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Assertion failure in i915 intel_display.c#assert_plane() after
 resume from hibernation
Message-ID: <20230124173127.os3rwxnt6m6nloce@nabtop.nabijaczleweli.xyz>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Salvatore Bonaccorso <carnil@debian.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 971068@bugs.debian.org
References: <Y89xbXITTRFpjm5B@eldamar.lan>
 <87bkmo6ivf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="endhu2s4thcg3tvi"
Content-Disposition: inline
In-Reply-To: <87bkmo6ivf.fsf@intel.com>
User-Agent: NeoMutt/20200925
X-Mailman-Approved-At: Wed, 25 Jan 2023 12:06:41 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 971068@bugs.debian.org,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--endhu2s4thcg3tvi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Booted with both, hibernated, resumed; full dmesg below.

Best,
-- >8 --
[    0.000000] Linux version 6.1.0-2-686-pae (debian-kernel@lists.debian.or=
g) (gcc-12 (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40=
) #1 SMP PREEMPT_DYNAMIC Debian 6.1.7-1 (2023-01-18)
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] signal: max sigframe size: 1440
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009f3ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f400-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000d2000-0x00000000000d3fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000dc000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000b5aa0fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5aa1000-0x00000000b5aa6fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b5aa7000-0x00000000b5bb9fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5bba000-0x00000000b5c0efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b5c0f000-0x00000000b5d07fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5d08000-0x00000000b5f0efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b5f0f000-0x00000000b5f17fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5f18000-0x00000000b5f1efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b5f1f000-0x00000000b5f64fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5f65000-0x00000000b5f9efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000b5f9f000-0x00000000b5fe0fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b5fe1000-0x00000000b5ffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000b5fff000-0x00000000b5ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000013fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: TOSHIBA Satellite Pro U400/Satellite Pro U400, BIOS V5.=
00    10/26/2010
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2261.093 MHz processor
[    0.002643] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.002647] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.002660] last_pfn =3D 0x140000 max_arch_pfn =3D 0x1000000
[    0.003508] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.003945] e820: update [mem 0xb7e00000-0xffffffff] usable =3D=3D> rese=
rved
[    0.011459] found SMP MP-table at [mem 0x000f6f30-0x000f6f3f]
[    0.011474] initial memory mapped: [mem 0x00000000-0x0b3fffff]
[    0.011481] Kernel/User page tables isolation: disabled on command line.
[    0.020647] printk: log_buf_len: 4194304 bytes
[    0.020653] printk: early log buf free: 128848(98%)
[    0.020655] RAMDISK: [mem 0x366d7000-0x37362fff]
[    0.020658] Allocated new RAMDISK: [mem 0x349cb000-0x35656ed5]
[    0.029796] Move RAMDISK from [mem 0x366d7000-0x37362ed5] to [mem 0x349c=
b000-0x35656ed5]
[    0.029807] ACPI: Early table checksum verification disabled
[    0.029812] ACPI: RSDP 0x00000000000F6E70 000024 (v02 TOSQCI)
[    0.029819] ACPI: XSDT 0x00000000B5FF4A00 00007C (v01 TOSQCI TOSQCI00 06=
040000  LTP 00000000)
[    0.029827] ACPI: FACP 0x00000000B5FE5000 0000F4 (v03 T0SQCI TOSQCI00 06=
040000 ALAN 00000001)
[    0.029836] ACPI: DSDT 0x00000000B5FE6000 009F7C (v02 TOSQCI CANTIGA  06=
040000 INTL 20061109)
[    0.029842] ACPI: FACS 0x00000000B5F9EFC0 000040
[    0.029847] ACPI: FACS 0x00000000B5F9EFC0 000040
[    0.029852] ACPI: APIC 0x00000000B5FFED1E 000068 (v01 INTEL  CRESTLNE 06=
040000 LOHR 0000005A)
[    0.029858] ACPI: HPET 0x00000000B5FFED86 000038 (v01 TOSQCI TOSQCI00 06=
040000 LOHR 0000005A)
[    0.029863] ACPI: MCFG 0x00000000B5FFEDBE 00003C (v01 TOSQCI TOSQCI00 06=
040000 LOHR 0000005A)
[    0.029868] ACPI: APIC 0x00000000B5FFEDFA 000068 (v01 PTLTD  ? APIC   06=
040000  LTP 00000000)
[    0.029874] ACPI: BOOT 0x00000000B5FFEE62 000028 (v01 PTLTD  $SBFTBL$ 06=
040000  LTP 00000001)
[    0.029879] ACPI: SLIC 0x00000000B5FFEE8A 000176 (v01 TOSQCI TOSQCI00 06=
040000  LTP 00000000)
[    0.029884] ACPI: SSDT 0x00000000B5FF4AA4 000196 (v01 SataRe SataAhci 00=
001000 INTL 20061109)
[    0.029890] ACPI: SSDT 0x00000000B5FE4000 000655 (v01 PmRef  CpuPm    00=
003000 INTL 20061109)
[    0.029896] ACPI: SSDT 0x00000000B5FE3000 000259 (v01 PmRef  Cpu0Tst  00=
003000 INTL 20061109)
[    0.029901] ACPI: SSDT 0x00000000B5FE2000 00020F (v01 PmRef  ApTst    00=
003000 INTL 20061109)
[    0.029906] ACPI: Reserving FACP table memory at [mem 0xb5fe5000-0xb5fe5=
0f3]
[    0.029908] ACPI: Reserving DSDT table memory at [mem 0xb5fe6000-0xb5fef=
f7b]
[    0.029910] ACPI: Reserving FACS table memory at [mem 0xb5f9efc0-0xb5f9e=
fff]
[    0.029912] ACPI: Reserving FACS table memory at [mem 0xb5f9efc0-0xb5f9e=
fff]
[    0.029914] ACPI: Reserving APIC table memory at [mem 0xb5ffed1e-0xb5ffe=
d85]
[    0.029916] ACPI: Reserving HPET table memory at [mem 0xb5ffed86-0xb5ffe=
dbd]
[    0.029918] ACPI: Reserving MCFG table memory at [mem 0xb5ffedbe-0xb5ffe=
df9]
[    0.029919] ACPI: Reserving APIC table memory at [mem 0xb5ffedfa-0xb5ffe=
e61]
[    0.029921] ACPI: Reserving BOOT table memory at [mem 0xb5ffee62-0xb5ffe=
e89]
[    0.029923] ACPI: Reserving SLIC table memory at [mem 0xb5ffee8a-0xb5ffe=
fff]
[    0.029924] ACPI: Reserving SSDT table memory at [mem 0xb5ff4aa4-0xb5ff4=
c39]
[    0.029926] ACPI: Reserving SSDT table memory at [mem 0xb5fe4000-0xb5fe4=
654]
[    0.029928] ACPI: Reserving SSDT table memory at [mem 0xb5fe3000-0xb5fe3=
258]
[    0.029930] ACPI: Reserving SSDT table memory at [mem 0xb5fe2000-0xb5fe2=
20e]
[    0.029934] ACPI: BIOS bug: multiple APIC/MADT found, using 0
[    0.029936] ACPI: If "acpi_apic_instance=3D2" works better, notify linux=
-acpi@vger.kernel.org
[    0.029955] 4240MB HIGHMEM available.
[    0.029956] 879MB LOWMEM available.
[    0.029958]   mapped low ram: 0 - 36ffe000
[    0.029959]   low ram: 0 - 36ffe000
[    0.029983] Zone ranges:
[    0.029984]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.029987]   Normal   [mem 0x0000000001000000-0x0000000036ffdfff]
[    0.029990]   HighMem  [mem 0x0000000036ffe000-0x000000013fffffff]
[    0.029992] Movable zone start for each node
[    0.029993] Early memory node ranges
[    0.029994]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.029996]   node   0: [mem 0x0000000000100000-0x00000000b5aa0fff]
[    0.029998]   node   0: [mem 0x00000000b5aa7000-0x00000000b5bb9fff]
[    0.029999]   node   0: [mem 0x00000000b5c0f000-0x00000000b5d07fff]
[    0.030001]   node   0: [mem 0x00000000b5f0f000-0x00000000b5f17fff]
[    0.030003]   node   0: [mem 0x00000000b5f1f000-0x00000000b5f64fff]
[    0.030004]   node   0: [mem 0x00000000b5f9f000-0x00000000b5fe0fff]
[    0.030006]   node   0: [mem 0x00000000b5fff000-0x00000000b5ffffff]
[    0.030008]   node   0: [mem 0x0000000100000000-0x000000013fffffff]
[    0.030010] Initmem setup node 0 [mem 0x0000000000001000-0x000000013ffff=
fff]
[    0.030026] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.030103] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.044833] On node 0, zone HighMem: 6 pages in unavailable ranges
[    0.044843] On node 0, zone HighMem: 85 pages in unavailable ranges
[    0.044857] On node 0, zone HighMem: 519 pages in unavailable ranges
[    0.044860] On node 0, zone HighMem: 7 pages in unavailable ranges
[    0.044865] On node 0, zone HighMem: 58 pages in unavailable ranges
[    0.044867] On node 0, zone HighMem: 30 pages in unavailable ranges
[    0.056888] On node 0, zone HighMem: 303104 pages in unavailable ranges
[    0.056895] Using APIC driver default
[    0.056904] Reserving Intel graphics memory at [mem 0xb8000000-0xbffffff=
f]
[    0.057084] ACPI: PM-Timer IO Port: 0x408
[    0.057096] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.057099] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.057111] IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-=
23
[    0.057116] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.057118] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.057124] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.057125] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.057135] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.057174] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.057178] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x0009ffff]
[    0.057180] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000d1fff]
[    0.057181] PM: hibernation: Registered nosave memory: [mem 0x000d2000-0=
x000d3fff]
[    0.057182] PM: hibernation: Registered nosave memory: [mem 0x000d4000-0=
x000dbfff]
[    0.057184] PM: hibernation: Registered nosave memory: [mem 0x000dc000-0=
x000fffff]
[    0.057187] PM: hibernation: Registered nosave memory: [mem 0xb5aa1000-0=
xb5aa6fff]
[    0.057190] PM: hibernation: Registered nosave memory: [mem 0xb5bba000-0=
xb5c0efff]
[    0.057193] PM: hibernation: Registered nosave memory: [mem 0xb5d08000-0=
xb5f0efff]
[    0.057196] PM: hibernation: Registered nosave memory: [mem 0xb5f18000-0=
xb5f1efff]
[    0.057199] PM: hibernation: Registered nosave memory: [mem 0xb5f65000-0=
xb5f9efff]
[    0.057203] PM: hibernation: Registered nosave memory: [mem 0xb5fe1000-0=
xb5ffefff]
[    0.057206] PM: hibernation: Registered nosave memory: [mem 0xb6000000-0=
xb7ffffff]
[    0.057207] PM: hibernation: Registered nosave memory: [mem 0xb8000000-0=
xbfffffff]
[    0.057209] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0=
xffffffff]
[    0.057212] [mem 0xc0000000-0xffffffff] available for PCI devices
[    0.057214] Booting paravirtualized kernel on bare hardware
[    0.057219] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.057231] setup_percpu: NR_CPUS:32 nr_cpumask_bits:2 nr_cpu_ids:2 nr_n=
ode_ids:1
[    0.057388] percpu: Embedded 32 pages/cpu s100628 r0 d30444 u131072
[    0.057400] pcpu-alloc: s100628 r0 d30444 u131072 alloc=3D32*4096
[    0.057405] pcpu-alloc: [0] 0 [0] 1=20
[    0.057439] Built 1 zonelists, mobility grouping on.  Total pages: 10046=
13
[    0.057443] Kernel command line: BOOT_IMAGE=3D/vmlinuz-6.1.0-2-686-pae r=
oot=3DUUID=3D6795a311-d78a-45d1-b8fc-313c70cfb3bb ro noibrs noibpb nopti no=
spectre_v2 nospectre_v1 l1tf=3Doff nospec_store_bypass_disable no_stf_barri=
er mds=3Doff mitigations=3Doff no_console_suspend=3D1 resume=3DPARTLABEL=3D=
U400-root resume_offset=3D1099776 tsc=3Dunstable drm.debug=3D0xe log_buf_le=
n=3D4M
[    0.057984] tsc: Marking TSC unstable due to boot parameter
[    0.058063] Unknown kernel command line parameters "noibrs noibpb nopti =
nospectre_v2 nospec_store_bypass_disable no_stf_barrier BOOT_IMAGE=3D/vmlin=
uz-6.1.0-2-686-pae", will be passed to user space.
[    0.058247] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes, linear)
[    0.058336] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, linear)
[    0.058372] microcode: microcode updated early to revision 0x60f, date =
=3D 2010-09-29
[    0.058379] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.058382] software IO TLB: area num 2.
[    0.101014] Initializing HighMem for node 0 (00036ffe:00140000)
[    0.371255] Initializing Movable for node 0 (00000000:00000000)
[    0.376270] Checking if this processor honours the WP bit even in superv=
isor mode...Ok.
[    0.376285] Memory: 3863228K/4027252K available (9269K kernel code, 1246=
K rwdata, 2948K rodata, 904K init, 476K bss, 164024K reserved, 0K cma-reser=
ved, 3126532K highmem)
[    0.376913] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.376944] ftrace: allocating 36664 entries in 72 pages
[    0.385646] ftrace: allocated 72 pages with 2 groups
[    0.385787] trace event string verifier disabled
[    0.385856] Dynamic Preempt: voluntary
[    0.385916] rcu: Preemptible hierarchical RCU implementation.
[    0.385918] rcu: 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_ids=
=3D2.
[    0.385920] 	Trampoline variant of Tasks RCU enabled.
[    0.385921] 	Rude variant of Tasks RCU enabled.
[    0.385922] 	Tracing variant of Tasks RCU enabled.
[    0.385923] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.385924] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.397830] NR_IRQS: 2304, nr_irqs: 440, preallocated irqs: 16
[    0.398027] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.398130] Console: colour dummy device 80x25
[    0.398603] printk: console [tty0] enabled
[    0.398617] ACPI: Core revision 20220331
[    0.398622] ACPI: TOSHIBA Satellite detected - force copy of DSDT to loc=
al memory
[    0.398746] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484882848 ns
[    0.398769] APIC: Switch to symmetric I/O mode setup
[    0.398774] Enabling APIC mode:  Flat.  Using 1 I/O APICs
[    0.399196] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.418771] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4522.18 BogoMIPS (lpj=3D9044372)
[    0.418780] pid_max: default: 32768 minimum: 301
[    0.418920] LSM: Security Framework initializing
[    0.418949] landlock: Up and running.
[    0.418953] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.419027] AppArmor: AppArmor initialized
[    0.419034] TOMOYO Linux initialized
[    0.419044] LSM support for eBPF active
[    0.419111] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, =
linear)
[    0.419122] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes, linear)
[    0.419631] x86/cpu: VMX (outside TXT) disabled by BIOS
[    0.419642] CPU0: Thermal monitoring enabled (TM2)
[    0.419659] process: using mwait in idle threads
[    0.419674] Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
[    0.419679] Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32, 1GB 0
[    0.419688] Speculative Store Bypass: Vulnerable
[    0.420096] Freeing SMP alternatives memory: 32K
[    0.531292] smpboot: CPU0: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26G=
Hz (family: 0x6, model: 0x17, stepping: 0x6)
[    0.531538] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.531547] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.531596] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.531630] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.531673] Performance Events: PEBS fmt0+, Core2 events, 4-deep LBR, In=
tel PMU driver.
[    0.531697] ... version:                2
[    0.531701] ... bit width:              40
[    0.531705] ... generic registers:      2
[    0.531708] ... value mask:             000000ffffffffff
[    0.531712] ... max period:             000000007fffffff
[    0.531716] ... fixed-purpose events:   3
[    0.531720] ... event mask:             0000000700000003
[    0.531878] rcu: Hierarchical SRCU implementation.
[    0.531884] rcu: 	Max phase no-delay instances is 1000.
[    0.532485] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.532559] smp: Bringing up secondary CPUs ...
[    0.532774] x86: Booting SMP configuration:
[    0.532780] .... node  #0, CPUs:      #1
[    0.534966] smp: Brought up 1 node, 2 CPUs
[    0.534981] smpboot: Max logical packages: 1
[    0.534986] smpboot: Total of 2 processors activated (9044.37 BogoMIPS)
[    0.537137] devtmpfs: initialized
[    0.537908] ACPI: PM: Registering ACPI NVS region [mem 0xb5f65000-0xb5f9=
efff] (237568 bytes)
[    0.538004] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.538024] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.538099] pinctrl core: initialized pinctrl subsystem
[    0.538519] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.538958] audit: initializing netlink subsys (disabled)
[    0.539012] audit: type=3D2000 audit(1674581156.140:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.539215] thermal_sys: Registered thermal governor 'fair_share'
[    0.539218] thermal_sys: Registered thermal governor 'bang_bang'
[    0.539224] thermal_sys: Registered thermal governor 'step_wise'
[    0.539228] thermal_sys: Registered thermal governor 'user_space'
[    0.539232] thermal_sys: Registered thermal governor 'power_allocator'
[    0.539253] cpuidle: using governor ladder
[    0.539525] Simple Boot Flag at 0x36 set to 0x1
[    0.539547] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.539554] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.539629] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.539641] PCI: not using MMCONFIG
[    0.539648] PCI: Using configuration type 1 for base access
[    0.539984] mtrr: your CPUs had inconsistent variable MTRR settings
[    0.539989] mtrr: probably your BIOS does not setup all CPUs.
[    0.539992] mtrr: corrected configuration.
[    0.541966] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.551710] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.551718] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.552324] ACPI: Added _OSI(Module Device)
[    0.552330] ACPI: Added _OSI(Processor Device)
[    0.552335] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.552339] ACPI: Added _OSI(Processor Aggregator Device)
[    0.552393] ACPI: Forced DSDT copy: length 0x09F7C copied locally, origi=
nal unmapped
[    0.560113] ACPI: 5 ACPI AML tables successfully acquired and loaded
[    0.561498] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.563485] ACPI: Dynamic OEM Table Load:
[    0.563498] ACPI: SSDT 0x00000000C11D0000 000265 (v01 PmRef  Cpu0Ist  00=
003000 INTL 20061109)
[    0.564194] ACPI: Dynamic OEM Table Load:
[    0.564206] ACPI: SSDT 0x00000000C101D800 000594 (v01 PmRef  Cpu0Cst  00=
003001 INTL 20061109)
[    0.565145] ACPI: Dynamic OEM Table Load:
[    0.565157] ACPI: SSDT 0x00000000C12B7E00 0001CF (v01 PmRef  ApIst    00=
003000 INTL 20061109)
[    0.565767] ACPI: Dynamic OEM Table Load:
[    0.565778] ACPI: SSDT 0x00000000C1127D80 00008D (v01 PmRef  ApCst    00=
003000 INTL 20061109)
[    0.566528] ACPI: EC: EC started
[    0.566533] ACPI: EC: interrupt blocked
[    0.574840] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.574848] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.574854] ACPI: Interpreter enabled
[    0.574889] ACPI: PM: (supports S0 S3 S4 S5)
[    0.574894] ACPI: Using IOAPIC for interrupt routing
[    0.574931] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.575473] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACP=
I motherboard resources
[    0.575482] PCI: Using MMCONFIG for extended config space
[    0.575492] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.575498] PCI: Using E820 reservations for host bridge windows
[    0.575793] ACPI: Enabled 14 GPEs in block 00 to 3F
[    0.585088] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.585103] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.585116] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug=
 PME AER PCIeCapability LTR]
[    0.585125] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplu=
g SHPCHotplug PME AER PCIeCapability LTR]
[    0.585133] acpi PNP0A08:00: _OSC: platform retains control of PCIe feat=
ures (AE_NOT_FOUND)
[    0.585905] PCI host bridge to bus 0000:00
[    0.585912] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.585919] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.585924] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.585931] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000dbff=
f window]
[    0.585937] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdffffff=
f window]
[    0.585944] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfebffff=
f window]
[    0.585951] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.585977] pci 0000:00:00.0: [8086:2a40] type 00 class 0x060000
[    0.586083] pci 0000:00:02.0: [8086:2a42] type 00 class 0x030000
[    0.586099] pci 0000:00:02.0: reg 0x10: [mem 0xf4000000-0xf43fffff 64bit]
[    0.586111] pci 0000:00:02.0: reg 0x18: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    0.586121] pci 0000:00:02.0: reg 0x20: [io  0x1800-0x1807]
[    0.586142] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.586279] pci 0000:00:02.1: [8086:2a43] type 00 class 0x038000
[    0.586294] pci 0000:00:02.1: reg 0x10: [mem 0xf4400000-0xf44fffff 64bit]
[    0.586436] pci 0000:00:1a.0: [8086:2937] type 00 class 0x0c0300
[    0.586498] pci 0000:00:1a.0: reg 0x20: [io  0x1820-0x183f]
[    0.586687] pci 0000:00:1a.1: [8086:2938] type 00 class 0x0c0300
[    0.586750] pci 0000:00:1a.1: reg 0x20: [io  0x1840-0x185f]
[    0.586949] pci 0000:00:1a.2: [8086:2939] type 00 class 0x0c0300
[    0.587012] pci 0000:00:1a.2: reg 0x20: [io  0x1860-0x187f]
[    0.587197] pci 0000:00:1a.7: [8086:293c] type 00 class 0x0c0320
[    0.587222] pci 0000:00:1a.7: reg 0x10: [mem 0xf4a04800-0xf4a04bff]
[    0.587334] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.587482] pci 0000:00:1b.0: [8086:293e] type 00 class 0x040300
[    0.587513] pci 0000:00:1b.0: reg 0x10: [mem 0xf4800000-0xf4803fff 64bit]
[    0.587631] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.587798] pci 0000:00:1c.0: [8086:2940] type 01 class 0x060400
[    0.587925] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.588103] pci 0000:00:1c.4: [8086:2948] type 01 class 0x060400
[    0.588227] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.588393] pci 0000:00:1c.5: [8086:294a] type 01 class 0x060400
[    0.588517] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.588682] pci 0000:00:1d.0: [8086:2934] type 00 class 0x0c0300
[    0.588755] pci 0000:00:1d.0: reg 0x20: [io  0x1880-0x189f]
[    0.588950] pci 0000:00:1d.1: [8086:2935] type 00 class 0x0c0300
[    0.589017] pci 0000:00:1d.1: reg 0x20: [io  0x18a0-0x18bf]
[    0.589203] pci 0000:00:1d.2: [8086:2936] type 00 class 0x0c0300
[    0.589266] pci 0000:00:1d.2: reg 0x20: [io  0x18c0-0x18df]
[    0.589451] pci 0000:00:1d.7: [8086:293a] type 00 class 0x0c0320
[    0.589477] pci 0000:00:1d.7: reg 0x10: [mem 0xf4a04c00-0xf4a04fff]
[    0.589588] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.589730] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.589938] pci 0000:00:1f.0: [8086:2919] type 00 class 0x060100
[    0.590221] pci 0000:00:1f.2: [8086:2929] type 00 class 0x010601
[    0.590247] pci 0000:00:1f.2: reg 0x10: [io  0x1818-0x181f]
[    0.590262] pci 0000:00:1f.2: reg 0x14: [io  0x180c-0x180f]
[    0.590276] pci 0000:00:1f.2: reg 0x18: [io  0x1810-0x1817]
[    0.590290] pci 0000:00:1f.2: reg 0x1c: [io  0x1808-0x180b]
[    0.590304] pci 0000:00:1f.2: reg 0x20: [io  0x18e0-0x18ff]
[    0.590319] pci 0000:00:1f.2: reg 0x24: [mem 0xf4a04000-0xf4a047ff]
[    0.590387] pci 0000:00:1f.2: PME# supported from D3hot
[    0.590519] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500
[    0.590550] pci 0000:00:1f.3: reg 0x10: [mem 0x00000000-0x000000ff 64bit]
[    0.590584] pci 0000:00:1f.3: reg 0x20: [io  0x1c00-0x1c1f]
[    0.590823] acpiphp: Slot [1] registered
[    0.590833] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.590842] pci 0000:00:1c.0:   bridge window [io  0x0000-0x0fff]
[    0.590850] pci 0000:00:1c.0:   bridge window [mem 0x00000000-0x000fffff]
[    0.590861] pci 0000:00:1c.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.590964] pci 0000:07:00.0: [11ab:436c] type 00 class 0x020000
[    0.591001] pci 0000:07:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[    0.591018] pci 0000:07:00.0: reg 0x18: [io  0x0000-0x00ff]
[    0.591060] pci 0000:07:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.591159] pci 0000:07:00.0: supports D1 D2
[    0.591165] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.591388] pci 0000:00:1c.4: PCI bridge to [bus 07]
[    0.591398] pci 0000:00:1c.4:   bridge window [io  0x0000-0x0fff]
[    0.591406] pci 0000:00:1c.4:   bridge window [mem 0x00000000-0x000fffff]
[    0.591417] pci 0000:00:1c.4:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.591537] pci 0000:08:00.0: [8086:4232] type 00 class 0x028000
[    0.591584] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x00001fff 64bit]
[    0.591781] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.592026] pci 0000:00:1c.5: PCI bridge to [bus 08]
[    0.592035] pci 0000:00:1c.5:   bridge window [io  0x0000-0x0fff]
[    0.592043] pci 0000:00:1c.5:   bridge window [mem 0x00000000-0x000fffff]
[    0.592054] pci 0000:00:1c.5:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.592083] pci_bus 0000:0a: extended config space not accessible
[    0.592137] pci 0000:0a:01.0: [1217:00f7] type 00 class 0x0c0010
[    0.592163] pci 0000:0a:01.0: reg 0x10: [mem 0xff501000-0xff501fff]
[    0.592179] pci 0000:0a:01.0: reg 0x14: [mem 0xf4700000-0xf47007ff]
[    0.592268] pci 0000:0a:01.0: supports D1 D2
[    0.592273] pci 0000:0a:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.592360] pci 0000:0a:01.2: [1217:7120] type 00 class 0x080501
[    0.592388] pci 0000:0a:01.2: reg 0x10: [mem 0xf4700800-0xf47008ff]
[    0.592501] pci 0000:0a:01.2: supports D1 D2
[    0.592506] pci 0000:0a:01.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.592592] pci 0000:0a:01.3: [1217:7130] type 00 class 0x018000
[    0.592621] pci 0000:0a:01.3: reg 0x10: [mem 0xf4702000-0xf4702fff]
[    0.592735] pci 0000:0a:01.3: supports D1 D2
[    0.592740] pci 0000:0a:01.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.592867] pci 0000:00:1e.0: PCI bridge to [bus 0a] (subtractive decode)
[    0.592879] pci 0000:00:1e.0:   bridge window [mem 0xf4700000-0xf47fffff]
[    0.592891] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7 window]=
 (subtractive decode)
[    0.592898] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window]=
 (subtractive decode)
[    0.592904] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff=
 window] (subtractive decode)
[    0.592911] pci 0000:00:1e.0:   bridge window [mem 0x000d4000-0x000dbfff=
 window] (subtractive decode)
[    0.592918] pci 0000:00:1e.0:   bridge window [mem 0xc0000000-0xdfffffff=
 window] (subtractive decode)
[    0.592924] pci 0000:00:1e.0:   bridge window [mem 0xf0000000-0xfebfffff=
 window] (subtractive decode)
[    0.592959] pci_bus 0000:00: on NUMA node 0
[    0.593813] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.593890] ACPI: PCI: Interrupt link LNKB configured for IRQ 5
[    0.593964] ACPI: PCI: Interrupt link LNKC configured for IRQ 6
[    0.594038] ACPI: PCI: Interrupt link LNKD configured for IRQ 10
[    0.594112] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.594118] ACPI: PCI: Interrupt link LNKE disabled
[    0.594190] ACPI: PCI: Interrupt link LNKF configured for IRQ 11
[    0.594264] ACPI: PCI: Interrupt link LNKG configured for IRQ 10
[    0.594338] ACPI: PCI: Interrupt link LNKH configured for IRQ 7
[    0.594937] ACPI: EC: interrupt unblocked
[    0.594943] ACPI: EC: event unblocked
[    0.594954] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.594959] ACPI: EC: GPE=3D0x18
[    0.594976] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    0.594983] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions =
and events
[    0.595132] iommu: Default domain type: Translated=20
[    0.595132] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    0.595157] EDAC MC: Ver: 3.0.0
[    0.595657] NetLabel: Initializing
[    0.595663] NetLabel:  domain hash size =3D 128
[    0.595667] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.595698] NetLabel:  unlabeled traffic allowed by default
[    0.595703] PCI: Using ACPI for IRQ routing
[    0.606341] PCI: pci_cache_line_size set to 64 bytes
[    0.606373] pci 0000:0a:01.0: can't claim BAR 0 [mem 0xff501000-0xff501f=
ff]: no compatible bridge window
[    0.606427] e820: reserve RAM buffer [mem 0x0009f400-0x0009ffff]
[    0.606430] e820: reserve RAM buffer [mem 0xb5aa1000-0xb7ffffff]
[    0.606433] e820: reserve RAM buffer [mem 0xb5bba000-0xb7ffffff]
[    0.606436] e820: reserve RAM buffer [mem 0xb5d08000-0xb7ffffff]
[    0.606439] e820: reserve RAM buffer [mem 0xb5f18000-0xb7ffffff]
[    0.606442] e820: reserve RAM buffer [mem 0xb5f65000-0xb7ffffff]
[    0.606444] e820: reserve RAM buffer [mem 0xb5fe1000-0xb7ffffff]
[    0.606446] e820: reserve RAM buffer [mem 0xb6000000-0xb7ffffff]
[    0.606604] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.606604] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.606604] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.606604] vgaarb: loaded
[    0.606837] hpet: 4 channels of 0 reserved for per-cpu timers
[    0.606845] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
[    0.606856] hpet0: 4 comparators, 64-bit 14.318180 MHz counter
[    0.608904] clocksource: Switched to clocksource hpet
[    0.628544] VFS: Disk quotas dquot_6.6.0
[    0.628588] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    0.628859] AppArmor: AppArmor Filesystem Enabled
[    0.628906] pnp: PnP ACPI init
[    0.629231] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.629294] pnp 00:01: disabling [io  0x002e-0x002f] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629304] pnp 00:01: disabling [io  0x004e-0x004f] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629312] pnp 00:01: disabling [io  0x0061] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629319] pnp 00:01: disabling [io  0x0063] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629327] pnp 00:01: disabling [io  0x0065] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629334] pnp 00:01: disabling [io  0x0067] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629341] pnp 00:01: disabling [io  0x0068] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629348] pnp 00:01: disabling [io  0x006c] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629355] pnp 00:01: disabling [io  0x0070] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629362] pnp 00:01: disabling [io  0x0080] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629370] pnp 00:01: disabling [io  0x0092] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629377] pnp 00:01: disabling [io  0x00b2-0x00b3] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.629425] system 00:01: [io  0x03e0-0x03e1] has been reserved
[    0.629432] system 00:01: [io  0x0400-0x047f] has been reserved
[    0.629448] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.629454] system 00:01: [io  0x0480-0x048f] has been reserved
[    0.629460] system 00:01: [io  0xffff] has been reserved
[    0.629465] system 00:01: [io  0xffff] has been reserved
[    0.629471] system 00:01: [io  0x1180-0x11ff] has been reserved
[    0.629476] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.629482] system 00:01: [io  0xfe00] has been reserved
[    0.630041] system 00:05: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.630051] system 00:05: [mem 0xfed10000-0xfed13fff] has been reserved
[    0.630058] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.630065] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.630072] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.630079] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.630086] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.630321] pnp: PnP ACPI: found 6 devices
[    0.630328] PnPBIOS: Disabled by ACPI PNP
[    0.667929] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.668081] NET: Registered PF_INET protocol family
[    0.668213] IP idents hash table entries: 16384 (order: 5, 131072 bytes,=
 linear)
[    0.668837] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, =
4096 bytes, linear)
[    0.668948] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.668990] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes, linear)
[    0.669057] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, l=
inear)
[    0.669099] TCP: Hash tables configured (established 8192 bind 8192)
[    0.669202] MPTCP token hash table entries: 1024 (order: 2, 16384 bytes,=
 linear)
[    0.669237] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.669255] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, lin=
ear)
[    0.669322] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.669338] NET: Registered PF_XDP protocol family
[    0.669352] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus =
02-03] add_size 1000
[    0.669362] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 02-03] add_size 200000 add_align 100000
[    0.669372] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] =
to [bus 02-03] add_size 200000 add_align 100000
[    0.669381] pci 0000:00:1c.4: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 07] add_size 200000 add_align 100000
[    0.669390] pci 0000:00:1c.4: bridge window [mem 0x00100000-0x001fffff] =
to [bus 07] add_size 100000 add_align 100000
[    0.669399] pci 0000:00:1c.5: bridge window [io  0x1000-0x0fff] to [bus =
08] add_size 1000
[    0.669406] pci 0000:00:1c.5: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 08] add_size 200000 add_align 100000
[    0.669415] pci 0000:00:1c.5: bridge window [mem 0x00100000-0x001fffff] =
to [bus 08] add_size 100000 add_align 100000
[    0.669437] pci 0000:00:1c.0: BAR 14: assigned [mem 0xc0000000-0xc01ffff=
f]
[    0.669450] pci 0000:00:1c.0: BAR 15: assigned [mem 0xc0200000-0xc03ffff=
f 64bit pref]
[    0.669458] pci 0000:00:1c.4: BAR 14: assigned [mem 0xc0400000-0xc05ffff=
f]
[    0.669470] pci 0000:00:1c.4: BAR 15: assigned [mem 0xc0600000-0xc07ffff=
f 64bit pref]
[    0.669478] pci 0000:00:1c.5: BAR 14: assigned [mem 0xc0800000-0xc09ffff=
f]
[    0.669489] pci 0000:00:1c.5: BAR 15: assigned [mem 0xc0a00000-0xc0bffff=
f 64bit pref]
[    0.669498] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.669505] pci 0000:00:1c.4: BAR 13: assigned [io  0x3000-0x3fff]
[    0.669512] pci 0000:00:1c.5: BAR 13: assigned [io  0x4000-0x4fff]
[    0.669523] pci 0000:00:1f.3: BAR 0: assigned [mem 0xc0c00000-0xc0c000ff=
 64bit]
[    0.669543] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.669550] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.669559] pci 0000:00:1c.0:   bridge window [mem 0xc0000000-0xc01fffff]
[    0.669568] pci 0000:00:1c.0:   bridge window [mem 0xc0200000-0xc03fffff=
 64bit pref]
[    0.669581] pci 0000:07:00.0: BAR 6: assigned [mem 0xc0400000-0xc041ffff=
 pref]
[    0.669589] pci 0000:07:00.0: BAR 0: assigned [mem 0xc0420000-0xc0423fff=
 64bit]
[    0.669609] pci 0000:07:00.0: BAR 2: assigned [io  0x3000-0x30ff]
[    0.669619] pci 0000:00:1c.4: PCI bridge to [bus 07]
[    0.669625] pci 0000:00:1c.4:   bridge window [io  0x3000-0x3fff]
[    0.669634] pci 0000:00:1c.4:   bridge window [mem 0xc0400000-0xc05fffff]
[    0.669643] pci 0000:00:1c.4:   bridge window [mem 0xc0600000-0xc07fffff=
 64bit pref]
[    0.669656] pci 0000:08:00.0: BAR 0: assigned [mem 0xc0800000-0xc0801fff=
 64bit]
[    0.669682] pci 0000:00:1c.5: PCI bridge to [bus 08]
[    0.669687] pci 0000:00:1c.5:   bridge window [io  0x4000-0x4fff]
[    0.669697] pci 0000:00:1c.5:   bridge window [mem 0xc0800000-0xc09fffff]
[    0.669705] pci 0000:00:1c.5:   bridge window [mem 0xc0a00000-0xc0bfffff=
 64bit pref]
[    0.669718] pci 0000:0a:01.0: BAR 0: assigned [mem 0xf4701000-0xf4701fff]
[    0.669727] pci 0000:00:1e.0: PCI bridge to [bus 0a]
[    0.669736] pci 0000:00:1e.0:   bridge window [mem 0xf4700000-0xf47fffff]
[    0.669750] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.669756] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.669761] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.669767] pci_bus 0000:00: resource 7 [mem 0x000d4000-0x000dbfff windo=
w]
[    0.669772] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xdfffffff windo=
w]
[    0.669778] pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfebfffff windo=
w]
[    0.669783] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    0.669788] pci_bus 0000:02: resource 1 [mem 0xc0000000-0xc01fffff]
[    0.669794] pci_bus 0000:02: resource 2 [mem 0xc0200000-0xc03fffff 64bit=
 pref]
[    0.669800] pci_bus 0000:07: resource 0 [io  0x3000-0x3fff]
[    0.669806] pci_bus 0000:07: resource 1 [mem 0xc0400000-0xc05fffff]
[    0.669811] pci_bus 0000:07: resource 2 [mem 0xc0600000-0xc07fffff 64bit=
 pref]
[    0.669818] pci_bus 0000:08: resource 0 [io  0x4000-0x4fff]
[    0.669823] pci_bus 0000:08: resource 1 [mem 0xc0800000-0xc09fffff]
[    0.669828] pci_bus 0000:08: resource 2 [mem 0xc0a00000-0xc0bfffff 64bit=
 pref]
[    0.669835] pci_bus 0000:0a: resource 1 [mem 0xf4700000-0xf47fffff]
[    0.669840] pci_bus 0000:0a: resource 4 [io  0x0000-0x0cf7 window]
[    0.669846] pci_bus 0000:0a: resource 5 [io  0x0d00-0xffff window]
[    0.669851] pci_bus 0000:0a: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.669856] pci_bus 0000:0a: resource 7 [mem 0x000d4000-0x000dbfff windo=
w]
[    0.669862] pci_bus 0000:0a: resource 8 [mem 0xc0000000-0xdfffffff windo=
w]
[    0.669867] pci_bus 0000:0a: resource 9 [mem 0xf0000000-0xfebfffff windo=
w]
[    0.671583] PCI: CLS 64 bytes, default 64
[    0.671595] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.671601] software IO TLB: mapped [mem 0x000000002d7cb000-0x0000000031=
7cb000] (64MB)
[    0.671689] Trying to unpack rootfs image as initramfs...
[    0.672524] Initialise system trusted keyrings
[    0.672563] Key type blacklist registered
[    0.672681] workingset: timestamp_bits=3D14 max_order=3D20 bucket_order=
=3D6
[    0.675749] zbud: loaded
[    0.676239] integrity: Platform Keyring initialized
[    0.676258] integrity: Machine keyring initialized
[    0.676264] Key type asymmetric registered
[    0.676268] Asymmetric key parser 'x509' registered
[    0.954570] Freeing initrd memory: 12848K
[    0.961658] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    0.961842] bounce: pool size: 64 pages
[    0.961916] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 251)
[    0.961978] io scheduler mq-deadline registered
[    0.963879] pcieport 0000:00:1c.0: enabling device (0000 -> 0003)
[    0.964112] pcieport 0000:00:1c.4: enabling device (0000 -> 0003)
[    0.964281] pcieport 0000:00:1c.5: enabling device (0000 -> 0003)
[    0.964527] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.964648] Monitor-Mwait will be used to enter C-1 state
[    0.964657] Monitor-Mwait will be used to enter C-2 state
[    0.964665] Monitor-Mwait will be used to enter C-3 state
[    0.964671] ACPI: \_PR_.CPU0: Found 3 idle states
[    0.968710] thermal LNXTHERM:00: registered as thermal_zone0
[    0.968717] ACPI: thermal: Thermal Zone [THRM] (44 C)
[    0.968818] isapnp: Scanning for PnP cards...
[    1.322887] isapnp: No Plug & Play device found
[    1.323089] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.323990] Linux agpgart interface v0.103
[    1.324520] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2A] at 0=
x60,0x64 irq 1,12
[    1.326381] i8042: Detected active multiplexing controller, rev 1.1
[    1.327867] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.327877] serio: i8042 AUX0 port at 0x60,0x64 irq 12
[    1.327934] serio: i8042 AUX1 port at 0x60,0x64 irq 12
[    1.327981] serio: i8042 AUX2 port at 0x60,0x64 irq 12
[    1.328021] serio: i8042 AUX3 port at 0x60,0x64 irq 12
[    1.328258] mousedev: PS/2 mouse device common for all mice
[    1.328320] rtc_cmos 00:02: RTC can wake from S4
[    1.328658] rtc_cmos 00:02: registered as rtc0
[    1.328704] rtc_cmos 00:02: setting system clock to 2023-01-24T17:25:57 =
UTC (1674581157)
[    1.328760] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram=
, hpet irqs
[    1.328824] intel_pstate: CPU model not supported
[    1.328857] ledtrig-cpu: registered to indicate activity on CPUs
[    1.329232] vesafb: mode is 1024x768x32, linelength=3D4096, pages=3D0
[    1.329239] vesafb: scrolling: redraw
[    1.329243] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.329260] vesafb: framebuffer at 0xd0000000, mapped to 0x(ptrval), usi=
ng 3072k, total 3072k
[    1.353413] Console: switching to colour frame buffer device 128x48
[    1.377681] fb0: VESA VGA frame buffer device
[    1.378213] NET: Registered PF_INET6 protocol family
[    1.384971] Segment Routing with IPv6
[    1.385169] In-situ OAM (IOAM) with IPv6
[    1.385384] mip6: Mobile IPv6
[    1.385524] NET: Registered PF_PACKET protocol family
[    1.385843] mpls_gso: MPLS GSO support
[    1.386506] microcode: sig=3D0x10676, pf=3D0x80, revision=3D0x60f
[    1.386767] microcode: Microcode Update Driver: v2.2.
[    1.386785] IPI shorthand broadcast: enabled
[    1.387490] registered taskstats version 1
[    1.387687] Loading compiled-in X.509 certificates
[    1.397127] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input0
[    1.509527] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f61=
49f3dd27dfcc5cbb419ea1'
[    1.509952] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: 1=
4011249c2675ea8e5148542202005810584b25f'
[    1.511029] zswap: loaded using pool lzo/zbud
[    1.511534] Key type .fscrypt registered
[    1.511720] Key type fscrypt-provisioning registered
[    1.517713] Key type encrypted registered
[    1.517910] AppArmor: AppArmor sha1 policy hashing enabled
[    1.518175] ima: No TPM chip found, activating TPM-bypass!
[    1.518433] ima: Allocated hash algorithm: sha256
[    1.518660] ima: No architecture policies found
[    1.528101] evm: Initialising EVM extended attributes:
[    1.537504] evm: security.selinux
[    1.546691] evm: security.SMACK64 (disabled)
[    1.555743] evm: security.SMACK64EXEC (disabled)
[    1.564630] evm: security.SMACK64TRANSMUTE (disabled)
[    1.573426] evm: security.SMACK64MMAP (disabled)
[    1.582181] evm: security.apparmor
[    1.590982] evm: security.ima
[    1.599771] evm: security.capability
[    1.608624] evm: HMAC attrs: 0x1
[    2.256468] Unstable clock detected, switching default tracing clock to =
"global"
               If you want to keep using the local clock, then add:
                 "trace_clock=3Dlocal"
               on the kernel command line
[    2.295296] Freeing unused kernel image (initmem) memory: 904K
[    2.327146] Write protecting kernel text and read-only data: 12220k
[    2.335993] NX-protecting the kernel data: 7112k
[    2.345358] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    2.354264] Run /init as init process
[    2.363067]   with arguments:
[    2.363070]     /init
[    2.363071]     noibrs
[    2.363073]     noibpb
[    2.363074]     nopti
[    2.363075]     nospectre_v2
[    2.363077]     nospec_store_bypass_disable
[    2.363078]     no_stf_barrier
[    2.363080]   with environment:
[    2.363081]     HOME=3D/
[    2.363082]     TERM=3Dlinux
[    2.363083]     BOOT_IMAGE=3D/vmlinuz-6.1.0-2-686-pae
[    2.376449] systemd[1]: Inserted module 'autofs4'
[    2.394650] systemd[1]: systemd 246.6-2 running in system mode. (+PAM +A=
UDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT =
+GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dhybrid)
[    2.413838] systemd[1]: Detected architecture x86.
[    2.423409] systemd[1]: Running in initial RAM disk.
[    2.503846] systemd[1]: Set hostname to <nabtop>.
[    2.607506] systemd[1]: /lib/systemd/system/dracut-pre-udev.service:27: =
Standard output type syslog is obsolete, automatically updating to journal.=
 Please update your unit file, and consider removing the setting altogether.
[    2.627932] systemd[1]: /lib/systemd/system/dracut-pre-udev.service:28: =
Standard output type syslog+console is obsolete, automatically updating to =
journal+console. Please update your unit file, and consider removing the se=
tting altogether.
[    2.668298] systemd[1]: /lib/systemd/system/dracut-pre-trigger.service:2=
3: Standard output type syslog is obsolete, automatically updating to journ=
al. Please update your unit file, and consider removing the setting altoget=
her.
[    2.691179] systemd[1]: /lib/systemd/system/dracut-pre-trigger.service:2=
4: Standard output type syslog+console is obsolete, automatically updating =
to journal+console. Please update your unit file, and consider removing the=
 setting altogether.
[    2.716092] systemd[1]: /lib/systemd/system/dracut-pre-pivot.service:30:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.741021] systemd[1]: /lib/systemd/system/dracut-pre-pivot.service:31:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.769935] systemd[1]: /lib/systemd/system/dracut-pre-mount.service:22:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.796635] systemd[1]: /lib/systemd/system/dracut-pre-mount.service:23:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.825299] systemd[1]: /lib/systemd/system/dracut-mount.service:22: Sta=
ndard output type syslog is obsolete, automatically updating to journal. Pl=
ease update your unit file, and consider removing the setting altogether.
[    2.854501] systemd[1]: /lib/systemd/system/dracut-mount.service:23: Sta=
ndard output type syslog+console is obsolete, automatically updating to jou=
rnal+console. Please update your unit file, and consider removing the setti=
ng altogether.
[    2.885491] systemd[1]: /lib/systemd/system/dracut-initqueue.service:24:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.917328] systemd[1]: /lib/systemd/system/dracut-initqueue.service:25:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.951212] systemd[1]: /lib/systemd/system/dracut-cmdline.service:26: S=
tandard output type syslog is obsolete, automatically updating to journal. =
Please update your unit file, and consider removing the setting altogether.
[    2.986078] systemd[1]: /lib/systemd/system/dracut-cmdline.service:27: S=
tandard output type syslog+console is obsolete, automatically updating to j=
ournal+console. Please update your unit file, and consider removing the set=
ting altogether.
[    3.029645] systemd[1]: Queued start job for default target Initrd Defau=
lt Target.
[    4.094787] random: crng init done
[    4.114421] systemd[1]: Created slice system-systemd\x2dhibernate\x2dres=
ume.slice.
[    4.152202] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    4.190665] systemd[1]: Reached target Paths.
[    4.228974] systemd[1]: Reached target Slices.
[    4.267113] systemd[1]: Reached target Swap.
[    4.305009] systemd[1]: Reached target Timers.
[    4.342020] systemd[1]: Listening on Journal Audit Socket.
[    4.379064] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.416250] systemd[1]: Listening on Journal Socket.
[    4.453277] systemd[1]: Listening on udev Control Socket.
[    4.489377] systemd[1]: Listening on udev Kernel Socket.
[    4.524329] systemd[1]: Reached target Sockets.
[    4.579281] systemd[1]: Starting dracut ask for additional cmdline param=
eters...
[    4.614477] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[    4.650000] systemd[1]: Starting Journal Service...
[    4.699015] systemd[1]: Starting Load Kernel Modules...
[    4.731653] systemd[1]: Finished dracut ask for additional cmdline param=
eters.
[    4.764074] systemd[1]: Finished Create list of static device nodes for =
the current kernel.
[    4.779191] lp: driver loaded but no devices found
[    4.813529] ppdev: user-space parallel port driver
[    4.831143] systemd[1]: Starting dracut cmdline hook...
[    4.878743] SCSI subsystem initialized
[    4.904039] Asymmetric key parser 'pkcs8' registered
[    4.907203] systemd[1]: Starting Create Static Device Nodes in /dev...
[    4.954024] systemd[1]: Started Journal Service.
[    5.284083] ACPI: battery: Slot [BAT1] (battery absent)
[    5.398587] sdhci: Secure Digital Host Controller Interface driver
[    5.409482] sdhci: Copyright(c) Pierre Ossman
[    5.443071] ACPI: bus type USB registered
[    5.453766] firewire_ohci 0000:0a:01.0: added OHCI v1.10 device as card =
0, 8 IR + 8 IT contexts, quirks 0x10
[    5.465432] usbcore: registered new interface driver usbfs
[    5.477257] usbcore: registered new interface driver hub
[    5.488748] usbcore: registered new device driver usb
[    5.514367] libata version 3.00 loaded.
[    5.515823] ehci-pci 0000:00:1a.7: EHCI Host Controller
[    5.531795] sdhci-pci 0000:0a:01.2: SDHCI controller found [1217:7120] (=
rev 2)
[    5.534738] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus =
number 1
[    5.553875] mmc0 bounce up to 128 segments into one, max segment size 65=
536 bytes
[    5.558486] ehci-pci 0000:00:1a.7: debug port 1
[    5.579171] ahci 0000:00:1f.2: version 3.0
[    5.579490] ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 4 ports 3 Gbps 0x=
33 impl SATA mode
[    5.583105] ehci-pci 0000:00:1a.7: irq 19, io mem 0xf4a04800
[    5.590474] ahci 0000:00:1f.2: flags: 64bit ncq sntf led clo pio slum pa=
rt ccc ems sxs=20
[    5.611488] mmc0: SDHCI controller on PCI [0000:0a:01.2] using DMA
[    5.626817] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    5.637482] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.01
[    5.648273] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    5.659041] usb usb1: Product: EHCI Host Controller
[    5.669703] usb usb1: Manufacturer: Linux 6.1.0-2-686-pae ehci_hcd
[    5.680321] usb usb1: SerialNumber: 0000:00:1a.7
[    5.691837] hub 1-0:1.0: USB hub found
[    5.702069] scsi host0: ahci
[    5.712667] hub 1-0:1.0: 6 ports detected
[    5.714019] scsi host1: ahci
[    5.723540] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    5.732611] scsi host2: ahci
[    5.742553] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus =
number 2
[    5.752742] scsi host3: ahci
[    5.761507] uhci_hcd 0000:00:1a.0: detected 2 ports
[    5.772213] scsi host4: ahci
[    5.780938] uhci_hcd 0000:00:1a.0: irq 16, io port 0x00001820
[    5.791569] scsi host5: ahci
[    5.800275] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    5.810384] ata1: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0410=
0 irq 24
[    5.819746] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    5.819749] usb usb2: Product: UHCI Host Controller
[    5.819751] usb usb2: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    5.829937] ata2: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0418=
0 irq 24
[    5.840262] usb usb2: SerialNumber: 0000:00:1a.0
[    5.850500] ata3: DUMMY
[    5.850502] ata4: DUMMY
[    5.850504] ata5: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0430=
0 irq 24
[    5.862042] hub 2-0:1.0: USB hub found
[    5.871535] ata6: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0438=
0 irq 24
[    5.934927] hub 2-0:1.0: 2 ports detected
[    5.946227] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    5.957153] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus =
number 3
[    5.968195] ehci-pci 0000:00:1d.7: debug port 1
[    5.969020] firewire_core 0000:0a:01.0: created device fw0: GUID 001b240=
0013bc0de, S400
[    5.982965] ehci-pci 0000:00:1d.7: irq 23, io mem 0xf4a04c00
[    6.020327] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    6.031227] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.01
[    6.042264] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.053301] usb usb3: Product: EHCI Host Controller
[    6.064192] usb usb3: Manufacturer: Linux 6.1.0-2-686-pae ehci_hcd
[    6.075072] usb usb3: SerialNumber: 0000:00:1d.7
[    6.086101] hub 3-0:1.0: USB hub found
[    6.096684] hub 3-0:1.0: 6 ports detected
[    6.107500] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    6.117893] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus =
number 4
[    6.128267] uhci_hcd 0000:00:1a.1: detected 2 ports
[    6.138548] uhci_hcd 0000:00:1a.1: irq 21, io port 0x00001840
[    6.148694] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    6.158863] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.168973] usb usb4: Product: UHCI Host Controller
[    6.178967] usb usb4: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    6.189014] usb usb4: SerialNumber: 0000:00:1a.1
[    6.199027] ata6: SATA link down (SStatus 0 SControl 300)
[    6.209193] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    6.219337] ata5: SATA link down (SStatus 0 SControl 300)
[    6.219465] hub 4-0:1.0: USB hub found
[    6.230378] ata1.00: unexpected _GTF length (8)
[    6.239690] hub 4-0:1.0: 2 ports detected
[    6.250258] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    6.260188] uhci_hcd 0000:00:1a.2: UHCI Host Controller
[    6.270760] ata1.00: ATA-9: C400-MTFDDAK256MAM, 0609, max UDMA/100
[    6.280167] uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus =
number 5
[    6.290658] ata2.00: ATAPI: MATSHITADVD-RAM UJ862AS, 1.50, max UDMA/33
[    6.300542] uhci_hcd 0000:00:1a.2: detected 2 ports
[    6.321261] ata1.00: 500118192 sectors, multi 16: LBA48 NCQ (depth 32), =
AA
[    6.321506] uhci_hcd 0000:00:1a.2: irq 19, io port 0x00001860
[    6.332045] ata2.00: configured for UDMA/33
[    6.341995] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    6.362303] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.362546] ata1.00: unexpected _GTF length (8)
[    6.372646] usb usb5: Product: UHCI Host Controller
[    6.392960] usb usb5: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    6.403171] usb usb5: SerialNumber: 0000:00:1a.2
[    6.403334] ata1.00: configured for UDMA/100
[    6.418940] hub 5-0:1.0: USB hub found
[    6.433742] hub 5-0:1.0: 2 ports detected
[    6.434461] scsi 0:0:0:0: Direct-Access     ATA      C400-MTFDDAK256M 06=
09 PQ: 0 ANSI: 5
[    6.443960] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    6.463778] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus =
number 6
[    6.473902] uhci_hcd 0000:00:1d.0: detected 2 ports
[    6.474439] scsi 1:0:0:0: CD-ROM            MATSHITA DVD-RAM UJ862AS  1.=
50 PQ: 0 ANSI: 5
[    6.483917] uhci_hcd 0000:00:1d.0: irq 23, io port 0x00001880
[    6.504147] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    6.514482] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.524661] usb usb6: Product: UHCI Host Controller
[    6.534744] usb usb6: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    6.544833] usb usb6: SerialNumber: 0000:00:1d.0
[    6.555168] hub 6-0:1.0: USB hub found
[    6.565145] hub 6-0:1.0: 2 ports detected
[    6.575381] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    6.585468] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus =
number 7
[    6.595597] uhci_hcd 0000:00:1d.1: detected 2 ports
[    6.605626] uhci_hcd 0000:00:1d.1: irq 19, io port 0x000018a0
[    6.615681] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    6.625972] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.636128] usb usb7: Product: UHCI Host Controller
[    6.646186] usb usb7: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    6.656253] usb usb7: SerialNumber: 0000:00:1d.1
[    6.666590] hub 7-0:1.0: USB hub found
[    6.676551] hub 7-0:1.0: 2 ports detected
[    6.686755] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    6.696752] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus =
number 8
[    6.706757] uhci_hcd 0000:00:1d.2: detected 2 ports
[    6.716665] uhci_hcd 0000:00:1d.2: irq 18, io port 0x000018c0
[    6.726909] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.01
[    6.737196] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.747456] usb usb8: Product: UHCI Host Controller
[    6.757518] usb usb8: Manufacturer: Linux 6.1.0-2-686-pae uhci_hcd
[    6.767545] usb usb8: SerialNumber: 0000:00:1d.2
[    6.779317] hub 8-0:1.0: USB hub found
[    6.789148] hub 8-0:1.0: 2 ports detected
[    6.824609] sd 0:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB=
/238 GiB)
[    6.834469] sd 0:0:0:0: [sda] Write Protect is off
[    6.844084] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    6.844144] usb 6-2: new full-speed USB device number 2 using uhci_hcd
[    6.845392] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    6.863836] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    6.880093] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd=
/rw xa/form2 cdda tray
[    6.890018] cdrom: Uniform CD-ROM driver Revision: 3.20
[    6.902468]  sda: sda1 sda2 sda3 sda4
[    6.912828] sd 0:0:0:0: [sda] Attached SCSI disk
[    6.963194] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    7.030960] ACPI: battery: [Firmware Bug]: (dis)charge rate invalid.
[    7.045119] usb 6-2: New USB device found, idVendor=3D08ff, idProduct=3D=
1600, bcdDevice=3D c.10
[    7.055248] usb 6-2: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    7.065294] usb 6-2: Product: Fingerprint Sensor
[    7.134309] PM: Image not found (code -22)
[    8.218975] usb 3-4: new high-speed USB device number 4 using ehci-pci
[    8.427407] usb 3-4: New USB device found, idVendor=3D04f2, idProduct=3D=
b064, bcdDevice=3D10.21
[    8.437353] usb 3-4: New USB device strings: Mfr=3D2, Product=3D1, Seria=
lNumber=3D3
[    8.447268] usb 3-4: Product: CNA7137
[    8.457142] usb 3-4: Manufacturer: Chicony Electronics Co., Ltd.
[    8.466984] usb 3-4: SerialNumber: SN0001
[    9.028916] EXT4-fs (sda2): mounted filesystem with ordered data mode. Q=
uota mode: none.
[   10.048846] systemd[1]: systemd 246.6-2 running in system mode. (+PAM +A=
UDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT =
+GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dhybrid)
[   10.065829] systemd[1]: Detected architecture x86.
[   10.100697] systemd[1]: Set hostname to <nabtop>.
[   10.405737] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-mount.service:22: Standard output type syslog is obsolete, automatically =
updating to journal. Please update your unit file, and consider removing th=
e setting altogether.
[   10.423323] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-mount.service:23: Standard output type syslog+console is obsolete, automa=
tically updating to journal+console. Please update your unit file, and cons=
ider removing the setting altogether.
[   10.453095] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-mount.service:22: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   10.473803] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-mount.service:23: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   10.508302] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-initqueue.service:24: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   10.532545] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-initqueue.service:25: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   10.602014] systemd[1]: /lib/systemd/system/smartmontools.service:10: St=
andard output type syslog is obsolete, automatically updating to journal. P=
lease update your unit file, and consider removing the setting altogether.
[   10.662241] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.680102] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.697350] systemd[1]: /lib/systemd/system/cron-monthly.timer:10: Unkno=
wn key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.728194] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.744655] systemd[1]: /lib/systemd/system/cron-weekly.timer:10: Unknow=
n key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.777211] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.794469] systemd[1]: /lib/systemd/system/cron-daily.timer:10: Unknown=
 key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.828629] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.846502] systemd[1]: /lib/systemd/system/cron-hourly.timer:9: Unknown=
 key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.881685] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.941475] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-udev.service:27: Standard output type syslog is obsolete, automatical=
ly updating to journal. Please update your unit file, and consider removing=
 the setting altogether.
[   10.977389] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-udev.service:28: Standard output type syslog+console is obsolete, aut=
omatically updating to journal+console. Please update your unit file, and c=
onsider removing the setting altogether.
[   11.034583] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-cmdline.service:26: Standard output type syslog is obsolete, automaticall=
y updating to journal. Please update your unit file, and consider removing =
the setting altogether.
[   11.073365] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-cmdline.service:27: Standard output type syslog+console is obsolete, auto=
matically updating to journal+console. Please update your unit file, and co=
nsider removing the setting altogether.
[   11.134500] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-trigger.service:23: Standard output type syslog is obsolete, automati=
cally updating to journal. Please update your unit file, and consider remov=
ing the setting altogether.
[   11.174940] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-trigger.service:24: Standard output type syslog+console is obsolete, =
automatically updating to journal+console. Please update your unit file, an=
d consider removing the setting altogether.
[   11.254027] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-pivot.service:30: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   11.296978] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-pivot.service:31: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   11.453045] systemd[1]: initrd-switch-root.service: Succeeded.
[   11.474868] systemd[1]: Stopped Switch Root.
[   11.517033] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 1.
[   11.537994] systemd[1]: Created slice system-getty.slice.
[   11.578635] systemd[1]: Created slice system-modprobe.slice.
[   11.618344] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   11.657205] systemd[1]: Created slice User and Session Slice.
[   11.694908] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[   11.732160] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[   11.770109] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[   11.807784] systemd[1]: Reached target Local Encrypted Volumes.
[   11.844974] systemd[1]: Stopped target Switch Root.
[   11.881280] systemd[1]: Stopped target Initrd File Systems.
[   11.916872] systemd[1]: Stopped target Initrd Root File System.
[   11.952008] systemd[1]: Reached target User and Group Name Lookups.
[   11.986473] systemd[1]: Reached target Remote File Systems.
[   12.019997] systemd[1]: Reached target Slices.
[   12.052592] systemd[1]: Listening on fsck to fsckd communication Socket.
[   12.084352] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   12.116430] systemd[1]: Listening on Network Service Netlink Socket.
[   12.146703] systemd[1]: Listening on udev Control Socket.
[   12.175877] systemd[1]: Listening on udev Kernel Socket.
[   12.219225] systemd[1]: Mounting Huge Pages File System...
[   12.248309] systemd[1]: Mounting POSIX Message Queue File System...
[   12.276509] systemd[1]: Mounting Kernel Debug File System...
[   12.303964] systemd[1]: Mounting Kernel Trace File System...
[   12.351304] systemd[1]: Starting Set the console keyboard layout...
[   12.378980] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[   12.407324] systemd[1]: Starting Load Kernel Module drm...
[   12.435912] systemd[1]: Starting nftables...
[   12.470867] systemd[1]: Condition check resulted in Set Up Additional Bi=
nary Formats being skipped.
[   12.484954] ACPI: bus type drm_connector registered
[   12.487763] systemd[1]: Stopped Journal Service.
[   12.547406] systemd[1]: Starting Journal Service...
[   12.575981] systemd[1]: Starting Load Kernel Modules...
[   12.613981] systemd[1]: Starting Remount Root and Kernel File Systems...
[   12.643976] systemd[1]: Starting Coldplug All udev Devices...
[   12.669510] EXT4-fs (sda2): re-mounted. Quota mode: none.
[   12.685226] systemd[1]: sysroot.mount: Succeeded.
[   12.699050] systemd[1]: Started Journal Service.
[   12.887536] Adding 4718588k swap on /HIBERFIL.SYS.  Priority:-2 extents:=
59 across:7757820k SSFS
[   13.341385] EXT4-fs (sda3): mounted filesystem with ordered data mode. Q=
uota mode: none.
[   13.463391] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input5
[   13.463441] ACPI: button: Power Button [PWRB]
[   13.463514] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input6
[   13.490191] ACPI: AC: AC Adapter [ACAD] (on-line)
[   13.495965] ACPI: button: Lid Switch [LID]
[   13.587123] toshiba_haps: Toshiba HDD Active Protection Sensor device
[   13.640388] sky2: driver version 1.30
[   13.640441] sky2 0000:07:00.0: enabling device (0000 -> 0003)
[   13.692524] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   13.695366] sr 1:0:0:0: Attached scsi generic sg1 type 5
[   13.724942] ACPI Warning: SystemIO range 0x0000000000000428-0x0000000000=
00042F conflicts with OpRegion 0x0000000000000400-0x000000000000047F (\PMIO=
) (20220331/utaddress-204)
[   13.763097] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.763238] sky2 0000:07:00.0: Yukon-2 Extreme chip revision 2
[   13.763780] sky2 0000:07:00.0 eth0: addr 00:23:8b:10:3d:d6
[   13.764016] toshiba_bluetooth: Toshiba ACPI Bluetooth device driver
[   13.813078] toshiba_acpi: Toshiba Laptop ACPI Extras version 0.24
[   13.830092] ACPI Warning: SystemIO range 0x00000000000011B0-0x0000000000=
0011BF conflicts with OpRegion 0x0000000000001180-0x00000000000011BB (\GPIO=
) (20220331/utaddress-204)
[   13.830103] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.830105] ACPI Warning: SystemIO range 0x0000000000001180-0x0000000000=
0011AF conflicts with OpRegion 0x0000000000001180-0x00000000000011BB (\GPIO=
) (20220331/utaddress-204)
[   13.830110] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.830111] lpc_ich: Resource conflict(s) found affecting gpio_ich
[   13.830888] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   13.832040] cfg80211: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0=
e820821ba7b54b4961b8b4fadf'
[   13.833180] cfg80211: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6=
ec146e09d1b6016ab9d6cf71dd233f0328'
[   13.834331] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.834470] mc: Linux media interface: v0.10
[   13.843836] input: Toshiba input device as /devices/LNXSYSTM:00/LNXSYBUS=
:00/TOS1900:00/input/input8
[   13.843950] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input7
[   13.845011] platform regulatory.0: firmware: failed to load regulatory.d=
b (-2)
[   13.845015] firmware_class: See https://wiki.debian.org/Firmware for inf=
ormation about missing firmware
[   13.845035] platform regulatory.0: firmware: failed to load regulatory.d=
b (-2)
[   13.845038] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[   13.845042] cfg80211: failed to load regulatory.db
[   13.852129] ACPI: button: Power Button [PWRF]
[   13.888828] toshiba_acpi: Supported laptop features: hotkeys touchpad co=
oling-method
[   13.981600] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[   14.188031] input: PC Speaker as /devices/platform/pcspkr/input/input9
[   14.215825] intel_powerclamp: No package C-state available
[   14.246916] videodev: Linux video capture interface: v2.00
[   14.260739] Intel(R) Wireless WiFi driver for Linux
[   14.260834] iwlwifi 0000:08:00.0: enabling device (0000 -> 0002)
[   14.261040] iwlwifi 0000:08:00.0: can't disable ASPM; OS doesn't have AS=
PM control
[   14.288338] intel_powerclamp: No package C-state available
[   14.293799] iwlwifi 0000:08:00.0: firmware: direct-loading firmware iwlw=
ifi-5000-5.ucode
[   14.294015] iwlwifi 0000:08:00.0: loaded firmware version 8.83.5.1 build=
 33692 5000-5.ucode op_mode iwldvm
[   14.410021] sky2 0000:07:00.0 lan1: renamed from eth0
[   14.429399] iTCO_vendor_support: vendor-support=3D0
[   14.432261] usb 3-4: Found UVC 1.00 device CNA7137 (04f2:b064)
[   14.434272] iTCO_wdt iTCO_wdt.1.auto: Found a ICH9M TCO device (Version=
=3D2, TCOBASE=3D0x0460)
[   14.437748] iTCO_wdt iTCO_wdt.1.auto: initialized. heartbeat=3D30 sec (n=
owayout=3D0)
[   14.495219] snd_hda_codec_conexant hdaudioC0D0: CX20561 (Hermosa): BIOS =
auto-probing.
[   14.500517] input: CNA7137: Chicony USB 2.0 Camera as /devices/pci0000:0=
0/0000:00:1d.7/usb3/3-4/3-4:1.0/input/input14
[   14.501314] usbcore: registered new interface driver uvcvideo
[   14.510812] usb 7-1: new full-speed USB device number 2 using uhci_hcd
[   14.530851] snd_hda_codec_conexant hdaudioC0D0: autoconfig for CX20561 (=
Hermosa): line_outs=3D1 (0x1a/0x0/0x0/0x0/0x0) type:speaker
[   14.530859] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[   14.530862] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=3D1 (0x16/0x0=
/0x0/0x0/0x0)
[   14.530865] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=3D0x0
[   14.530867] snd_hda_codec_conexant hdaudioC0D0:    dig-out=3D0x1c/0x0
[   14.530869] snd_hda_codec_conexant hdaudioC0D0:    inputs:
[   14.530871] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=3D0x1d
[   14.530873] snd_hda_codec_conexant hdaudioC0D0:      Mic=3D0x17
[   14.538085] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.=
0/sound/card0/input15
[   14.538182] input: HDA Intel Mic as /devices/pci0000:00/0000:00:1b.0/sou=
nd/card0/input16
[   14.539035] input: HDA Intel Front Headphone as /devices/pci0000:00/0000=
:00:1b.0/sound/card0/input17
[   14.919834] usb 7-1: New USB device found, idVendor=3D0930, idProduct=3D=
0200, bcdDevice=3D 1.44
[   14.919841] usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   14.919843] usb 7-1: Product: TAIYO YUDEN for Toshiba(0x0200)
[   14.919846] usb 7-1: Manufacturer: Broadcom Corp
[   14.919847] usb 7-1: SerialNumber: 00037A99A734
[   15.053786] pci 0000:00:00.0: Intel GM45 Chipset
[   15.053813] pci 0000:00:00.0: detected gtt size: 2097152K total, 262144K=
 mappable
[   15.054192] pci 0000:00:00.0: detected 131072K stolen memory
[   15.111721] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEBUG disabled
[   15.111726] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEBUGFS disabled
[   15.111728] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEVICE_TRACING disabled
[   15.111730] iwlwifi 0000:08:00.0: Detected Intel(R) WiFi Link 5100 AGN, =
REV=3D0x54
[   15.124742] Console: switching to colour dummy device 80x25
[   15.127181] i915 0000:00:02.0: vgaarb: deactivate vga console
[   15.176217] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.176255] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.176275] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   15.176295] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   15.176334] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.183838] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
[   15.184906] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
[   15.189465] iwlwifi 0000:08:00.0 wifi1: renamed from wlan0
[   15.192667] ------------[ cut here ]------------
[   15.192678] WARNING: CPU: 1 PID: 169 at kernel/workqueue.c:3066 __flush_=
work.isra.0+0x210/0x220
[   15.192693] Modules linked in: drbg(+) ansi_cprng nls_ascii nls_cp437 vf=
at fat ecdh_generic(+) ecc iwldvm i915(+) mac80211 snd_hda_codec_conexant s=
nd_hda_codec_generic iTCO_wdt intel_pmc_bxt iTCO_vendor_support uvcvideo wa=
tchdog videobuf2_vmalloc ledtrig_audio videobuf2_memops libarc4 videobuf2_v=
4l2 videobuf2_common drm_buddy drm_display_helper snd_hda_intel cec snd_int=
el_dspcfg rc_core snd_intel_sdw_acpi iwlwifi videodev psmouse wmi_bmof pcsp=
kr ttm i2c_i801 snd_hda_codec i2c_smbus snd_hda_core mc drm_kms_helper cfg8=
0211 snd_hwdep snd_pcm lpc_ich toshiba_acpi snd_timer industrialio sg snd s=
ky2 i2c_algo_bit sparse_keymap soundcore toshiba_bluetooth toshiba_haps rfk=
ill evdev ac button acpi_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_=
conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c nfnetlink drm i=
p_tables x_tables ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc6=
4_rocksoft crc64 crc_t10dif crct10dif_generic sr_mod crct10dif_common cdrom=
 ahci libahci ehci_pci
[   15.192806]  uhci_hcd ehci_hcd sdhci_pci cqhci sdhci libata serio_raw us=
bcore firewire_ohci mmc_core usb_common battery video wmi pkcs8_key_parser =
coretemp firewire_sbp2 firewire_core crc_itu_t scsi_mod scsi_common parport=
_pc ppdev lp parport autofs4
[   15.192876] CPU: 1 PID: 169 Comm: kworker/1:4 Not tainted 6.1.0-2-686-pa=
e #1  Debian 6.1.7-1
[   15.192884] Hardware name: TOSHIBA Satellite Pro U400/Satellite Pro U400=
, BIOS V5.00    10/26/2010
[   15.192890] Workqueue: events i915_hotplug_work_func [i915]
[   15.193126] EIP: __flush_work.isra.0+0x210/0x220
[   15.193134] Code: ff ff ff 8d b4 26 00 00 00 00 30 d2 8b 02 89 45 c8 e9 =
77 fe ff ff 8d 74 26 00 0f 0b e9 56 ff ff ff 8d b4 26 00 00 00 00 66 90 <0f=
> 0b e9 46 ff ff ff e8 34 8e 86 00 8d 74 26 00 3e 8d 74 26 00 55
[   15.193144] EAX: 00000001 EBX: c281048c ECX: 00000000 EDX: 00000000
[   15.193150] ESI: c281048c EDI: c1ac1d84 EBP: c1ac1d94 ESP: c1ac1d58
[   15.193155] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[   15.193161] CR0: 80050033 CR2: 01c54c00 CR3: 0423b8a0 CR4: 000006f0
[   15.193167] Call Trace:
[   15.193174]  __cancel_work_timer+0xd7/0x160
[   15.193181]  ? intel_runtime_pm_put_unchecked+0x33/0x40 [i915]
[   15.193344]  cancel_delayed_work_sync+0x12/0x20
[   15.193351]  drm_dp_cec_unset_edid+0x38/0xd0 [drm_display_helper]
[   15.193363]  ? intel_digital_port_connected+0x55/0x90 [i915]
[   15.193555]  intel_dp_detect+0x520/0x6e0 [i915]
[   15.193746]  ? ww_mutex_lock+0x14/0x80
[   15.193754]  ? intel_digital_port_connected+0x90/0x90 [i915]
[   15.193945]  drm_helper_probe_detect_ctx+0x54/0x100 [drm_kms_helper]
[   15.193961]  drm_helper_probe_detect+0x92/0xb0 [drm_kms_helper]
[   15.193973]  intel_encoder_hotplug+0x4e/0x110 [i915]
[   15.194162]  intel_dp_hotplug+0x61/0x160 [i915]
[   15.194351]  ? preempt_count_add+0x6d/0xb0
[   15.194359]  i915_hotplug_work_func+0x17c/0x2f0 [i915]
[   15.194549]  ? _raw_spin_unlock+0x18/0x30
[   15.194556]  process_one_work+0x182/0x310
[   15.194563]  worker_thread+0x13e/0x380
[   15.194570]  kthread+0xda/0x100
[   15.194575]  ? rescuer_thread+0x340/0x340
[   15.194581]  ? kthread_complete_and_exit+0x20/0x20
[   15.194587]  ret_from_fork+0x1c/0x28
[   15.194594] ---[ end trace 0000000000000000 ]---
[   15.199452] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:61:LVDS-1] generating connector hotplug event
[   15.199714] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:64:VGA-1] generating connector hotplug event
[   15.199976] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:68:HDMI-A-1] generating connector hotplug event
[   15.200523] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:75:DP-1] generating connector hotplug event
[   15.201061] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:80:DP-2] generating connector hotplug event
[   15.201326] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:83:SVIDEO-1] generating connector hotplug event
[   15.201461] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on mi=
nor 0
[   15.202469] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[   15.204573] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:01/input/input18
[   15.236674] acpi device:08: registered as cooling_device2
[   15.236727] i915 device info: pciid=3D0x2a42 rev=3D0x07 platform=3DGM45 =
(subplatform=3D0x0) gen=3D4
[   15.236733] i915 device info: graphics version: 4
[   15.236735] i915 device info: media version: 4
[   15.236737] i915 device info: display version: 4
[   15.236739] i915 device info: gt: 0
[   15.236740] i915 device info: memory-regions: 21
[   15.236742] i915 device info: page-sizes: 1000
[   15.236744] i915 device info: platform: GM45
[   15.236746] i915 device info: ppgtt-size: 0
[   15.236747] i915 device info: ppgtt-type: 0
[   15.236749] i915 device info: dma_mask_size: 36
[   15.236751] i915 device info: is_mobile: yes
[   15.236752] i915 device info: is_lp: no
[   15.236754] i915 device info: require_force_probe: no
[   15.236756] i915 device info: is_dgfx: no
[   15.236757] i915 device info: has_64bit_reloc: no
[   15.236759] i915 device info: has_64k_pages: no
[   15.236760] i915 device info: needs_compact_pt: no
[   15.236762] i915 device info: gpu_reset_clobbers_display: no
[   15.236764] i915 device info: has_reset_engine: no
[   15.236765] i915 device info: has_3d_pipeline: yes
[   15.236767] i915 device info: has_4tile: no
[   15.236769] i915 device info: has_flat_ccs: no
[   15.236770] i915 device info: has_global_mocs: no
[   15.236772] i915 device info: has_gt_uc: no
[   15.236773] i915 device info: has_heci_pxp: no
[   15.236775] i915 device info: has_heci_gscfi: no
[   15.236776] i915 device info: has_guc_deprivilege: no
[   15.236778] i915 device info: has_l3_ccs_read: no
[   15.236780] i915 device info: has_l3_dpf: no
[   15.236781] i915 device info: has_llc: no
[   15.236783] i915 device info: has_logical_ring_contexts: no
[   15.236785] i915 device info: has_logical_ring_elsq: no
[   15.236786] i915 device info: has_media_ratio_mode: no
[   15.236788] i915 device info: has_mslice_steering: no
[   15.236790] i915 device info: has_one_eu_per_fuse_bit: no
[   15.236791] i915 device info: has_pxp: no
[   15.236793] i915 device info: has_rc6: no
[   15.236794] i915 device info: has_rc6p: no
[   15.236796] i915 device info: has_rps: no
[   15.236798] i915 device info: has_runtime_pm: no
[   15.236799] i915 device info: has_snoop: yes
[   15.236801] i915 device info: has_coherent_ggtt: yes
[   15.236802] i915 device info: tuning_thread_rr_after_dep: no
[   15.236804] i915 device info: unfenced_needs_alignment: no
[   15.236806] i915 device info: hws_needs_physical: no
[   15.236807] i915 device info: has_pooled_eu: no
[   15.236809] i915 device info: cursor_needs_physical: no
[   15.236810] i915 device info: has_cdclk_crawl: no
[   15.236812] i915 device info: has_ddi: no
[   15.236814] i915 device info: has_dp_mst: no
[   15.236815] i915 device info: has_dsb: no
[   15.236817] i915 device info: has_fpga_dbg: no
[   15.236818] i915 device info: has_gmch: yes
[   15.236820] i915 device info: has_hotplug: yes
[   15.236822] i915 device info: has_hti: no
[   15.236823] i915 device info: has_ipc: no
[   15.236825] i915 device info: has_modular_fia: no
[   15.236826] i915 device info: has_overlay: no
[   15.236828] i915 device info: has_psr: no
[   15.236830] i915 device info: has_psr_hw_tracking: no
[   15.236831] i915 device info: overlay_needs_physical: no
[   15.236833] i915 device info: supports_tv: yes
[   15.236834] i915 device info: has_hdcp: no
[   15.236836] i915 device info: has_dmc: no
[   15.236837] i915 device info: has_dsc: no
[   15.236839] i915 device info: rawclk rate: 266667 kHz
[   15.236841] i915 device info: iommu: disabled
[   15.236843] i915 device info: available engines: 401
[   15.236846] i915 device info: slice total: 0, mask=3D0000
[   15.236848] i915 device info: subslice total: 0
[   15.236850] i915 device info: EU total: 0
[   15.236852] i915 device info: EU per subslice: 0
[   15.236853] i915 device info: has slice power gating: no
[   15.236855] i915 device info: has subslice power gating: no
[   15.236857] i915 device info: has EU power gating: no
[   15.237361] [drm:drm_client_modeset_probe [drm]]=20
[   15.237399] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.237422] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   15.237441] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   15.237501] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   15.244672] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   15.245213] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   15.245597] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   15.246127] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   15.362749] sky2 0000:07:00.0 lan1: enabling interface
[   15.372288] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   15.475364] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   15.475402] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   15.475426] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   15.475449] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   15.475471] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   15.475494] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   15.475539] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   15.475564] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   15.475588] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   15.475612] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   15.475635] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 8192x=
8192 config
[   15.475660] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   15.476813] fbcon: i915drmfb (fb0) is primary device
[   15.495963] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   15.793268] input: AlpsPS/2 ALPS GlidePoint as /devices/platform/i8042/s=
erio4/input/input13
[   16.284818] Console: switching to colour frame buffer device 160x50
[   16.306723] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[   16.322185] [drm:drm_client_modeset_probe [drm]]=20
[   16.322266] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   16.322327] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   16.322382] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   16.322542] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   16.339628] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.341850] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.342236] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.344011] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.620725] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   16.620759] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   16.620782] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   16.620805] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   16.620827] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   16.620849] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   16.620887] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   16.620911] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   16.620934] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   16.620956] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   16.620978] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 1280x=
800 config
[   16.621003] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   16.621253] Bluetooth: Core ver 2.22
[   16.621309] NET: Registered PF_BLUETOOTH protocol family
[   16.621311] Bluetooth: HCI device and connection manager initialized
[   16.621318] Bluetooth: HCI socket layer initialized
[   16.621322] Bluetooth: L2CAP socket layer initialized
[   16.621332] Bluetooth: SCO socket layer initialized
[   16.637976] [drm:drm_client_modeset_probe [drm]]=20
[   16.638006] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   16.638027] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   16.638046] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   16.638103] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   16.646248] usbcore: registered new interface driver btusb
[   16.647234] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.647768] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.648744] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.649290] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.869138] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   16.869203] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   16.869249] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   16.869294] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   16.869338] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   16.869382] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   16.869462] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   16.869511] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   16.869557] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   16.869603] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   16.869647] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 1280x=
800 config
[   16.869696] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   17.010359] audit: type=3D1400 audit(1674581173.176:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be" pid=3D627 comm=3D"apparmor_parser"
[   17.010367] audit: type=3D1400 audit(1674581173.176:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be//kmod" pid=3D627 comm=3D"apparmor_parser"
[   17.010599] audit: type=3D1400 audit(1674581173.176:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release" =
pid=3D628 comm=3D"apparmor_parser"
[   17.020606] audit: type=3D1400 audit(1674581173.188:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/man"=
 pid=3D630 comm=3D"apparmor_parser"
[   17.020615] audit: type=3D1400 audit(1674581173.188:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter" p=
id=3D630 comm=3D"apparmor_parser"
[   17.020619] audit: type=3D1400 audit(1674581173.188:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" pi=
d=3D630 comm=3D"apparmor_parser"
[   17.039081] audit: type=3D1400 audit(1674581173.208:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/cups=
/backend/cups-pdf" pid=3D631 comm=3D"apparmor_parser"
[   17.042277] audit: type=3D1400 audit(1674581173.208:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin/cup=
sd" pid=3D631 comm=3D"apparmor_parser"
[   17.046339] audit: type=3D1400 audit(1674581173.208:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin/cu=
psd//third_party" pid=3D631 comm=3D"apparmor_parser"
[   17.050029] audit: type=3D1400 audit(1674581173.216:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/i38=
6-linux-gnu/lightdm/lightdm-guest-session" pid=3D632 comm=3D"apparmor_parse=
r"
[   17.425903] NET: Registered PF_ALG protocol family
[   17.617666] alg: No test for hmac(md4) (hmac(md4-generic))
[   17.655735] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   17.655739] Bluetooth: BNEP filters: protocol multicast
[   17.655746] Bluetooth: BNEP socket layer initialized
[   17.664384] Bluetooth: MGMT ver 1.22
[   18.028447] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   18.152139] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   18.276997] i915 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:98]
[   18.396178] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   18.396212] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   18.396232] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   18.396290] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   18.404635] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.405221] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.405886] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.406483] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.625843] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   18.625886] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   18.625929] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   18.626011] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   18.637713] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.638252] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.638746] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.639675] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   19.163296] wifi1: authenticate with de:0d:17:ad:80:55
[   19.163322] wifi1: capabilities/regulatory prevented using AP HT/VHT con=
figuration, downgraded
[   19.166197] wifi1: send auth to de:0d:17:ad:80:55 (try 1/3)
[   19.169932] wifi1: authenticated
[   19.169962] wifi1: waiting for beacon from de:0d:17:ad:80:55
[   19.266837] wifi1: associate with de:0d:17:ad:80:55 (try 1/3)
[   19.276212] wifi1: RX AssocResp from de:0d:17:ad:80:55 (capab=3D0x1031 s=
tatus=3D0 aid=3D3)
[   19.279030] wifi1: associated
[   19.339420] IPv6: ADDRCONF(NETDEV_CHANGE): wifi1: link becomes ready
[   19.468882] wifi1: Limiting TX power to 20 (20 - 0) dBm as advertised by=
 de:0d:17:ad:80:55
[   19.496128] i915 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:99]
[   19.496203] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   19.496227] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   19.528092] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   37.265429] PM: hibernation: hibernation entry
[   37.517914] (NULL device *): firmware: direct-loading firmware iwlwifi-5=
000-5.ucode
[   37.576303] Filesystems sync: 0.058 seconds
[   37.576661] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[   37.578238] OOM killer disabled.
[   37.578386] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x000=
00fff]
[   37.578393] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000=
fffff]
[   37.578400] PM: hibernation: Marking nosave pages: [mem 0xb5aa1000-0xb5a=
a6fff]
[   37.578404] PM: hibernation: Marking nosave pages: [mem 0xb5bba000-0xb5c=
0efff]
[   37.578411] PM: hibernation: Marking nosave pages: [mem 0xb5d08000-0xb5f=
0efff]
[   37.578434] PM: hibernation: Marking nosave pages: [mem 0xb5f18000-0xb5f=
1efff]
[   37.578437] PM: hibernation: Marking nosave pages: [mem 0xb5f65000-0xb5f=
9efff]
[   37.578442] PM: hibernation: Marking nosave pages: [mem 0xb5fe1000-0xb5f=
fefff]
[   37.578446] PM: hibernation: Marking nosave pages: [mem 0xb6000000-0xfff=
fffff]
[   37.589339] PM: hibernation: Basic memory bitmaps created
[   37.589434] PM: hibernation: Preallocating image memory
[   38.192342] PM: hibernation: Allocated 190647 pages for snapshot
[   38.192414] PM: hibernation: Allocated 762588 kbytes in 0.60 seconds (12=
70.98 MB/s)
[   38.192444] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[   38.194500] wifi1: deauthenticating from de:0d:17:ad:80:55 by local choi=
ce (Reason: 3=3DDEAUTH_LEAVING)
[   38.533527] ACPI: EC: interrupt blocked
[   38.534250] ACPI: PM: Preparing to enter system sleep state S4
[   38.536140] ACPI: EC: event blocked
[   38.536145] ACPI: EC: EC stopped
[   38.536148] ACPI: PM: Saving platform NVS memory
[   38.536417] Disabling non-boot CPUs ...
[   38.537777] smpboot: CPU 1 is now offline
[   38.538499] PM: hibernation: Creating image:
[   38.538782] PM: hibernation: Need to copy 182108 pages
[   38.538782] PM: hibernation: Normal pages needed: 66277 + 1024, availabl=
e pages: 158810
[   38.538782] ACPI: PM: Restoring platform NVS memory
[   38.538782] ACPI: EC: EC started
[   38.538782] Enabling non-boot CPUs ...
[   38.538782] x86: Booting SMP configuration:
[   38.538782] smpboot: Booting Node 0 Processor 1 APIC 0x1
[   38.539493] CPU1 is up
[   38.541312] ACPI: PM: Waking up from system sleep state S4
[   38.557583] ACPI: EC: interrupt unblocked
[   38.636361] ACPI: EC: event unblocked
[   38.636562] usb usb2: root hub lost power or was reset
[   38.636637] usb usb4: root hub lost power or was reset
[   38.636699] usb usb5: root hub lost power or was reset
[   38.636754] usb usb1: root hub lost power or was reset
[   38.641167] usb usb6: root hub lost power or was reset
[   38.641228] usb usb7: root hub lost power or was reset
[   38.641272] usb usb8: root hub lost power or was reset
[   38.641310] usb usb3: root hub lost power or was reset
[   38.645598] sd 0:0:0:0: [sda] Starting disk
[   38.661326] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   38.795329] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   38.933442] ------------[ cut here ]------------
[   38.933452] primary B assertion failure (expected off, current on)
[   38.933497] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/i915/display/inte=
l_display.c:476 assert_plane+0x9f/0xb0 [i915]
[   38.933625] Modules linked in: ghash_generic gf128mul gcm ccm algif_aead=
 des_generic libdes ecb algif_skcipher bnep cmac md4 algif_hash af_alg binf=
mt_misc btusb btrtl btbcm btintel btmtk bluetooth jitterentropy_rng sha512_=
generic joydev ctr drbg ansi_cprng nls_ascii nls_cp437 vfat fat ecdh_generi=
c ecc iwldvm i915 mac80211 snd_hda_codec_conexant snd_hda_codec_generic iTC=
O_wdt intel_pmc_bxt iTCO_vendor_support uvcvideo watchdog videobuf2_vmalloc=
 ledtrig_audio videobuf2_memops libarc4 videobuf2_v4l2 videobuf2_common drm=
_buddy drm_display_helper snd_hda_intel cec snd_intel_dspcfg rc_core snd_in=
tel_sdw_acpi iwlwifi videodev psmouse wmi_bmof pcspkr ttm i2c_i801 snd_hda_=
codec i2c_smbus snd_hda_core mc drm_kms_helper cfg80211 snd_hwdep snd_pcm l=
pc_ich toshiba_acpi snd_timer industrialio sg snd sky2 i2c_algo_bit sparse_=
keymap soundcore toshiba_bluetooth toshiba_haps rfkill evdev ac button acpi=
_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_conntrack nf_defrag_ipv6=
 nf_defrag_ipv4 nf_tables
[   38.933732]  libcrc32c nfnetlink drm ip_tables x_tables ext4 crc16 mbcac=
he jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10=
dif_generic sr_mod crct10dif_common cdrom ahci libahci ehci_pci uhci_hcd eh=
ci_hcd sdhci_pci cqhci sdhci libata serio_raw usbcore firewire_ohci mmc_cor=
e usb_common battery video wmi pkcs8_key_parser coretemp firewire_sbp2 fire=
wire_core crc_itu_t scsi_mod scsi_common parport_pc ppdev lp parport autofs4
[   38.933818] CPU: 0 PID: 28 Comm: kworker/u4:1 Tainted: G        W       =
   6.1.0-2-686-pae #1  Debian 6.1.7-1
[   38.933825] Hardware name: TOSHIBA Satellite Pro U400/Satellite Pro U400=
, BIOS V5.00    10/26/2010
[   38.933831] Workqueue: events_unbound async_run_entry_fn
[   38.933840] EIP: assert_plane+0x9f/0xb0 [i915]
[   38.933921] Code: ff 73 0c 68 30 5a c2 f8 e8 0e 77 46 ff 83 c4 10 eb b3 =
8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 5a c2 f8 e8 75 6b d9 d1 <0f=
> 0b 83 c4 10 eb 94 e8 65 1c dd d1 8d 74 26 00 90 3e 8d 74 26 00
[   38.933929] EAX: 00000036 EBX: c1229800 ECX: 00000001 EDX: 80000001
[   38.933934] ESI: 00000000 EDI: f8c49548 EBP: c12bdcdc ESP: c12bdcb8
[   38.933938] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010292
[   38.933944] CR0: 80050033 CR2: 02c64cf4 CR3: 0ae2c000 CR4: 000006f0
[   38.933949] Call Trace:
[   38.933955]  intel_disable_transcoder+0x71/0x2a0 [i915]
[   38.934036]  ? drm_vblank_get+0x65/0xd0 [drm]
[   38.934060]  ? drm_crtc_vblank_get+0x12/0x20 [drm]
[   38.934079]  ? assert_vblank_disabled+0x10/0x70 [i915]
[   38.934160]  i9xx_crtc_disable+0x56/0x260 [i915]
[   38.934240]  ? intel_synchronize_irq+0x16/0x20 [i915]
[   38.934300]  ? intel_crtc_disable_pipe_crc+0xa4/0xb0 [i915]
[   38.934365]  intel_old_crtc_state_disables+0x35/0x90 [i915]
[   38.934446]  intel_atomic_commit_tail+0x409/0xe30 [i915]
[   38.934527]  ? sugov_start+0x150/0x150
[   38.934533]  ? sugov_start+0x150/0x150
[   38.934538]  intel_atomic_commit+0x30b/0x350 [i915]
[   38.934619]  ? intel_atomic_commit_tail+0xe30/0xe30 [i915]
[   38.934718]  drm_atomic_commit+0x6b/0xe0 [drm]
[   38.934741]  ? drm_plane_get_damage_clips.cold+0x1b/0x1b [drm]
[   38.934759]  drm_atomic_helper_commit_duplicated_state+0xb6/0xd0 [drm_km=
s_helper]
[   38.934788]  __intel_display_resume+0x6c/0xd0 [i915]
[   38.934879]  intel_display_resume+0xb4/0x120 [i915]
[   38.934960]  i915_drm_resume+0xc6/0x130 [i915]
[   38.935019]  i915_pm_resume+0x34/0x50 [i915]
[   38.935078]  i915_pm_restore+0x1f/0x30 [i915]
[   38.935136]  pci_pm_restore+0x5a/0xe0
[   38.935143]  ? pci_pm_poweroff_noirq+0x100/0x100
[   38.935148]  dpm_run_callback+0x4f/0x130
[   38.935155]  device_resume+0x70/0x150
[   38.935160]  ? device_resume+0x150/0x150
[   38.935164]  async_resume+0x1b/0x30
[   38.935169]  async_run_entry_fn+0x34/0x130
[   38.935174]  process_one_work+0x182/0x310
[   38.935181]  worker_thread+0x13e/0x380
[   38.935187]  kthread+0xda/0x100
[   38.935191]  ? rescuer_thread+0x340/0x340
[   38.935197]  ? kthread_complete_and_exit+0x20/0x20
[   38.935202]  ret_from_fork+0x1c/0x28
[   38.935209] ---[ end trace 0000000000000000 ]---
[   39.006343] ata6: SATA link down (SStatus 0 SControl 300)
[   39.006380] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[   39.006413] ata5: SATA link down (SStatus 0 SControl 300)
[   39.006445] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[   39.006897] ata1.00: unexpected _GTF length (8)
[   39.007484] ata1.00: unexpected _GTF length (8)
[   39.007577] ata1.00: configured for UDMA/100
[   39.010349] ata2.00: configured for UDMA/33
[   39.058827] usb 3-4: reset high-speed USB device number 4 using ehci-pci
[   39.058876] usb 6-2: reset full-speed USB device number 2 using uhci_hcd
[   39.214838] firewire_core 0000:0a:01.0: rediscovered device fw0
[   39.445435] ------------[ cut here ]------------
[   39.445443] primary B assertion failure (expected off, current on)
[   39.445473] WARNING: CPU: 0 PID: 28 at drivers/gpu/drm/i915/display/inte=
l_display.c:476 assert_plane+0x9f/0xb0 [i915]
[   39.445568] Modules linked in: ghash_generic gf128mul gcm ccm algif_aead=
 des_generic libdes ecb algif_skcipher bnep cmac md4 algif_hash af_alg binf=
mt_misc btusb btrtl btbcm btintel btmtk bluetooth jitterentropy_rng sha512_=
generic joydev ctr drbg ansi_cprng nls_ascii nls_cp437 vfat fat ecdh_generi=
c ecc iwldvm i915 mac80211 snd_hda_codec_conexant snd_hda_codec_generic iTC=
O_wdt intel_pmc_bxt iTCO_vendor_support uvcvideo watchdog videobuf2_vmalloc=
 ledtrig_audio videobuf2_memops libarc4 videobuf2_v4l2 videobuf2_common drm=
_buddy drm_display_helper snd_hda_intel cec snd_intel_dspcfg rc_core snd_in=
tel_sdw_acpi iwlwifi videodev psmouse wmi_bmof pcspkr ttm i2c_i801 snd_hda_=
codec i2c_smbus snd_hda_core mc drm_kms_helper cfg80211 snd_hwdep snd_pcm l=
pc_ich toshiba_acpi snd_timer industrialio sg snd sky2 i2c_algo_bit sparse_=
keymap soundcore toshiba_bluetooth toshiba_haps rfkill evdev ac button acpi=
_cpufreq nf_log_syslog nft_log nft_limit nft_ct nf_conntrack nf_defrag_ipv6=
 nf_defrag_ipv4 nf_tables
[   39.445669]  libcrc32c nfnetlink drm ip_tables x_tables ext4 crc16 mbcac=
he jbd2 crc32c_generic sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10=
dif_generic sr_mod crct10dif_common cdrom ahci libahci ehci_pci uhci_hcd eh=
ci_hcd sdhci_pci cqhci sdhci libata serio_raw usbcore firewire_ohci mmc_cor=
e usb_common battery video wmi pkcs8_key_parser coretemp firewire_sbp2 fire=
wire_core crc_itu_t scsi_mod scsi_common parport_pc ppdev lp parport autofs4
[   39.445751] CPU: 0 PID: 28 Comm: kworker/u4:1 Tainted: G        W       =
   6.1.0-2-686-pae #1  Debian 6.1.7-1
[   39.445758] Hardware name: TOSHIBA Satellite Pro U400/Satellite Pro U400=
, BIOS V5.00    10/26/2010
[   39.445763] Workqueue: events_unbound async_run_entry_fn
[   39.445770] EIP: assert_plane+0x9f/0xb0 [i915]
[   39.445851] Code: ff 73 0c 68 30 5a c2 f8 e8 0e 77 46 ff 83 c4 10 eb b3 =
8d b4 26 00 00 00 00 66 90 57 52 ff 73 0c 68 30 5a c2 f8 e8 75 6b d9 d1 <0f=
> 0b 83 c4 10 eb 94 e8 65 1c dd d1 8d 74 26 00 90 3e 8d 74 26 00
[   39.445859] EAX: 00000036 EBX: c1229800 ECX: 00000001 EDX: 80000001
[   39.445864] ESI: 00000000 EDI: f8c49548 EBP: c12bdd60 ESP: c12bdd3c
[   39.445868] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010292
[   39.445874] CR0: 80050033 CR2: 02c64cf4 CR3: 0ae2c000 CR4: 000006f0
[   39.445878] Call Trace:
[   39.445883]  intel_atomic_commit_tail+0xdbb/0xe30 [i915]
[   39.445965]  ? sugov_start+0x150/0x150
[   39.445970]  ? sugov_start+0x150/0x150
[   39.445976]  intel_atomic_commit+0x30b/0x350 [i915]
[   39.446057]  ? intel_atomic_commit_tail+0xe30/0xe30 [i915]
[   39.446138]  drm_atomic_commit+0x6b/0xe0 [drm]
[   39.446160]  ? drm_plane_get_damage_clips.cold+0x1b/0x1b [drm]
[   39.446177]  drm_atomic_helper_commit_duplicated_state+0xb6/0xd0 [drm_km=
s_helper]
[   39.446189]  __intel_display_resume+0x6c/0xd0 [i915]
[   39.446270]  intel_display_resume+0xb4/0x120 [i915]
[   39.446351]  i915_drm_resume+0xc6/0x130 [i915]
[   39.446410]  i915_pm_resume+0x34/0x50 [i915]
[   39.446469]  i915_pm_restore+0x1f/0x30 [i915]
[   39.446527]  pci_pm_restore+0x5a/0xe0
[   39.446533]  ? pci_pm_poweroff_noirq+0x100/0x100
[   39.446538]  dpm_run_callback+0x4f/0x130
[   39.446544]  device_resume+0x70/0x150
[   39.446549]  ? device_resume+0x150/0x150
[   39.446554]  async_resume+0x1b/0x30
[   39.446559]  async_run_entry_fn+0x34/0x130
[   39.446564]  process_one_work+0x182/0x310
[   39.446570]  worker_thread+0x13e/0x380
[   39.446576]  kthread+0xda/0x100
[   39.446580]  ? rescuer_thread+0x340/0x340
[   39.446585]  ? kthread_complete_and_exit+0x20/0x20
[   39.446591]  ret_from_fork+0x1c/0x28
[   39.446597] ---[ end trace 0000000000000000 ]---
[   39.455119] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   39.455658] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   39.456043] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   39.456583] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   41.736889] PM: hibernation: Basic memory bitmaps freed
[   41.737214] OOM killer enabled.
[   41.738395] Restarting tasks ... done.
[   41.764400] usb 7-1: USB disconnect, device number 2
[   42.483772] video LNXVIDEO:01: Restoring backlight state
[   42.519631] PM: hibernation: hibernation exit
[   42.528208] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   42.528256] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   42.560268] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   42.576391] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   42.576424] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   42.576444] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   42.576504] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   42.585326] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   42.585875] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   42.586266] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   42.586857] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   42.735640] wifi1: authenticate with de:0d:17:ad:80:55
[   42.735666] wifi1: capabilities/regulatory prevented using AP HT/VHT con=
figuration, downgraded
[   42.737474] wifi1: send auth to de:0d:17:ad:80:55 (try 1/3)
[   42.741668] wifi1: authenticated
[   42.741702] wifi1: waiting for beacon from de:0d:17:ad:80:55
[   42.787405] usb 7-1: new full-speed USB device number 3 using uhci_hcd
[   42.818814] wifi1: associate with de:0d:17:ad:80:55 (try 1/3)
[   42.826411] wifi1: RX AssocResp from de:0d:17:ad:80:55 (capab=3D0x1031 s=
tatus=3D0 aid=3D3)
[   42.832613] wifi1: associated
[   42.914203] wifi1: Limiting TX power to 20 (20 - 0) dBm as advertised by=
 de:0d:17:ad:80:55
[   42.978644] usb 7-1: New USB device found, idVendor=3D0930, idProduct=3D=
0200, bcdDevice=3D 1.44
[   42.978675] usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   42.978686] usb 7-1: Product: TAIYO YUDEN for Toshiba(0x0200)
[   42.978695] usb 7-1: Manufacturer: Broadcom Corp
[   42.978703] usb 7-1: SerialNumber: 00037A99A734
[   43.066079] Bluetooth: MGMT ver 1.22
[   44.250423] i915 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:102]
[   44.290404] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   44.290437] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   44.290457] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   44.290516] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   44.298211] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   44.298742] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   44.299254] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   44.299797] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   44.519629] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   44.519711] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   44.519766] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   44.519924] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   44.534520] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   44.535212] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   44.535895] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   44.536501] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   45.402401] i915 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:101]
[   45.402543] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   45.402607] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   45.434674] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   48.597661] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   48.597706] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   48.629672] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   48.645801] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   48.645842] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   48.645869] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   48.645950] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   48.655233] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   48.655792] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   48.659796] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   48.661017] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb

--endhu2s4thcg3tvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmPQFeoACgkQvP0LAY0m
WPGTVg/7B/HzXvGvcH4PhKcnmxiUlMxSrsgpz3fMXkpQiquaIGpvP/HHo/HDfoeM
tRUELjje4+iG2P6eoG1iOxSd7Ef1scE2iv9QjGkglGID6VyC2N4g69z2oaltXaWc
1Qn4jCKBFs+LUFCMWBpMvp8Gwvbjmv4YluGiqZFvjB+HaBCzo1Mxvl72VJ/BWCbr
uUtZvyJYtyEvqTwD9xWrKs2NA7xo8VZxPrNzMmSRLhWvf9Njj90TODWNDEpy89hq
v/A/k9LvABQnn/VdR+djgPI7dtAYPjdFIpUXbRhNFOmifemuiSk1s+rNbdvx0VZf
+KGWCeQA/tRfx0kDSX1MeHqlqs8ygYGq/nNf2hTQ4lNBoSsqwTVCWMaVVePfXZid
lQQG78vDJ808t2rZLfYqKcvCErMfF8Iorp43WsN130mpvmmbP83Nwxogps4gFP8I
jLfCdpUjw3TufnHX9pBKXWSMg/MDQXMcmaUf+GGAxufg9lPt1Mla4DzYhcpLuWke
wU9JC1dkDwsoWYucZCt3xPI/lhsV/baTt5NNh4FjjhwvqLS2MuvFa4Ue2wLlWoFD
lMc5kdPNgx3k9pcxwwAZOf375kODsuZMv7iqEJE/FqfMe9/Xm4F5dOpkZH7kppHJ
8+cmuWnZ/KBVbXNNnu4Nem5+FiI3B2qU1niBokay6cU+BA8YkIQ=
=Zg8Z
-----END PGP SIGNATURE-----

--endhu2s4thcg3tvi--
