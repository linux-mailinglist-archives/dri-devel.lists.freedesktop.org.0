Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0767D6FC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F07210E2BD;
	Thu, 26 Jan 2023 20:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
 by gabe.freedesktop.org (Postfix) with ESMTP id C25CA10E947;
 Thu, 26 Jan 2023 15:42:38 +0000 (UTC)
Received: from nabtop.nabijaczleweli.xyz (nabtop_wifi.nabijaczleweli.xyz
 [192.168.1.165])
 by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id ADC2D4BE;
 Thu, 26 Jan 2023 16:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
 s=202211; t=1674747752;
 bh=DK9o9LAmNxB5+I+1jx3E8JtFFw9zegE1WUPAuifGhcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwscXUNlyRcwweuek4FnkhcI9h1lRgAX/rmVDW4swKJ9oJlFGNdelGC0qRTAysmML
 94U7Klp/brN/4D4K7fZvxVCtxZn/BJ7pVVuWeNfoYqpzEWLJGLXkkG/uprfDwlMnbF
 UKZwqwI20HcGbcU0TRuXy1iiV+f82kFcHd8MKb5tdGVnTkD1CYkmz/BhlXJoyWDQrU
 XBo9L7VSTOjQYdkY3bE8u8fVcw3KJQttKGrDx7m1kE7OLG1ia+cPUU4lrsgXveM/G1
 VgU0pSVmrHxdTVGGfe77DM/AWZMIXeSSrBc1CAb37PGEnd1j8vKC2Vl7gPGSn4LfkL
 b7nFaHgsYl9uA==
Date: Thu, 26 Jan 2023 16:42:31 +0100
From: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Assertion failure in i915 intel_display.c#assert_plane() after
 resume from hibernation
Message-ID: <20230126154231.xb5sq3dvuwugbnqo@nabtop.nabijaczleweli.xyz>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Salvatore Bonaccorso <carnil@debian.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 971068@bugs.debian.org
References: <Y89xbXITTRFpjm5B@eldamar.lan> <87bkmo6ivf.fsf@intel.com>
 <20230124173127.os3rwxnt6m6nloce@nabtop.nabijaczleweli.xyz>
 <878rhp5s2u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7znspmlngdoyrbsy"
Content-Disposition: inline
In-Reply-To: <878rhp5s2u.fsf@intel.com>
User-Agent: NeoMutt/20200925
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:58:31 +0000
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


--7znspmlngdoyrbsy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm not really up to building a fresh kernel right now, but here's the
same thing with the bullseye-backports one (6.0.12-1~bpo11+1);
I see vast heaps of debug info so it's probably worked around it?

Best,
-- >8 --
[    0.000000] Linux version 6.0.0-0.deb11.6-686-pae (debian-kernel@lists.d=
ebian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils =
for Debian) 2.35.2) #1 SMP PREEMPT_DYNAMIC Debian 6.0.12-1~bpo11+1 (2022-12=
-19)
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
[    0.000000] tsc: Detected 2261.035 MHz processor
[    0.002519] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.002524] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.002537] last_pfn =3D 0x140000 max_arch_pfn =3D 0x1000000
[    0.003393] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.003823] e820: update [mem 0xb7e00000-0xffffffff] usable =3D=3D> rese=
rved
[    0.011077] found SMP MP-table at [mem 0x000f6f30-0x000f6f3f]
[    0.011092] initial memory mapped: [mem 0x00000000-0x0d3fffff]
[    0.011099] Kernel/User page tables isolation: disabled on command line.
[    0.020270] printk: log_buf_len: 4194304 bytes
[    0.020275] printk: early log buf free: 128820(98%)
[    0.020277] RAMDISK: [mem 0x366e3000-0x37368fff]
[    0.020281] Allocated new RAMDISK: [mem 0x349dd000-0x35662010]
[    0.029595] Move RAMDISK from [mem 0x366e3000-0x37368010] to [mem 0x349d=
d000-0x35662010]
[    0.029606] ACPI: Early table checksum verification disabled
[    0.029612] ACPI: RSDP 0x00000000000F6E70 000024 (v02 TOSQCI)
[    0.029618] ACPI: XSDT 0x00000000B5FF4A00 00007C (v01 TOSQCI TOSQCI00 06=
040000  LTP 00000000)
[    0.029627] ACPI: FACP 0x00000000B5FE5000 0000F4 (v03 T0SQCI TOSQCI00 06=
040000 ALAN 00000001)
[    0.029635] ACPI: DSDT 0x00000000B5FE6000 009F7C (v02 TOSQCI CANTIGA  06=
040000 INTL 20061109)
[    0.029642] ACPI: FACS 0x00000000B5F9EFC0 000040
[    0.029646] ACPI: FACS 0x00000000B5F9EFC0 000040
[    0.029651] ACPI: APIC 0x00000000B5FFED1E 000068 (v01 INTEL  CRESTLNE 06=
040000 LOHR 0000005A)
[    0.029656] ACPI: HPET 0x00000000B5FFED86 000038 (v01 TOSQCI TOSQCI00 06=
040000 LOHR 0000005A)
[    0.029661] ACPI: MCFG 0x00000000B5FFEDBE 00003C (v01 TOSQCI TOSQCI00 06=
040000 LOHR 0000005A)
[    0.029666] ACPI: APIC 0x00000000B5FFEDFA 000068 (v01 PTLTD  ? APIC   06=
040000  LTP 00000000)
[    0.029672] ACPI: BOOT 0x00000000B5FFEE62 000028 (v01 PTLTD  $SBFTBL$ 06=
040000  LTP 00000001)
[    0.029677] ACPI: SLIC 0x00000000B5FFEE8A 000176 (v01 TOSQCI TOSQCI00 06=
040000  LTP 00000000)
[    0.029682] ACPI: SSDT 0x00000000B5FF4AA4 000196 (v01 SataRe SataAhci 00=
001000 INTL 20061109)
[    0.029687] ACPI: SSDT 0x00000000B5FE4000 000655 (v01 PmRef  CpuPm    00=
003000 INTL 20061109)
[    0.029693] ACPI: SSDT 0x00000000B5FE3000 000259 (v01 PmRef  Cpu0Tst  00=
003000 INTL 20061109)
[    0.029698] ACPI: SSDT 0x00000000B5FE2000 00020F (v01 PmRef  ApTst    00=
003000 INTL 20061109)
[    0.029702] ACPI: Reserving FACP table memory at [mem 0xb5fe5000-0xb5fe5=
0f3]
[    0.029705] ACPI: Reserving DSDT table memory at [mem 0xb5fe6000-0xb5fef=
f7b]
[    0.029707] ACPI: Reserving FACS table memory at [mem 0xb5f9efc0-0xb5f9e=
fff]
[    0.029709] ACPI: Reserving FACS table memory at [mem 0xb5f9efc0-0xb5f9e=
fff]
[    0.029710] ACPI: Reserving APIC table memory at [mem 0xb5ffed1e-0xb5ffe=
d85]
[    0.029712] ACPI: Reserving HPET table memory at [mem 0xb5ffed86-0xb5ffe=
dbd]
[    0.029714] ACPI: Reserving MCFG table memory at [mem 0xb5ffedbe-0xb5ffe=
df9]
[    0.029715] ACPI: Reserving APIC table memory at [mem 0xb5ffedfa-0xb5ffe=
e61]
[    0.029717] ACPI: Reserving BOOT table memory at [mem 0xb5ffee62-0xb5ffe=
e89]
[    0.029719] ACPI: Reserving SLIC table memory at [mem 0xb5ffee8a-0xb5ffe=
fff]
[    0.029721] ACPI: Reserving SSDT table memory at [mem 0xb5ff4aa4-0xb5ff4=
c39]
[    0.029722] ACPI: Reserving SSDT table memory at [mem 0xb5fe4000-0xb5fe4=
654]
[    0.029724] ACPI: Reserving SSDT table memory at [mem 0xb5fe3000-0xb5fe3=
258]
[    0.029726] ACPI: Reserving SSDT table memory at [mem 0xb5fe2000-0xb5fe2=
20e]
[    0.029730] ACPI: BIOS bug: multiple APIC/MADT found, using 0
[    0.029732] ACPI: If "acpi_apic_instance=3D2" works better, notify linux=
-acpi@vger.kernel.org
[    0.029750] 4240MB HIGHMEM available.
[    0.029752] 879MB LOWMEM available.
[    0.029753]   mapped low ram: 0 - 36ffe000
[    0.029754]   low ram: 0 - 36ffe000
[    0.029778] Zone ranges:
[    0.029779]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.029782]   Normal   [mem 0x0000000001000000-0x0000000036ffdfff]
[    0.029785]   HighMem  [mem 0x0000000036ffe000-0x000000013fffffff]
[    0.029787] Movable zone start for each node
[    0.029788] Early memory node ranges
[    0.029789]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.029791]   node   0: [mem 0x0000000000100000-0x00000000b5aa0fff]
[    0.029792]   node   0: [mem 0x00000000b5aa7000-0x00000000b5bb9fff]
[    0.029794]   node   0: [mem 0x00000000b5c0f000-0x00000000b5d07fff]
[    0.029795]   node   0: [mem 0x00000000b5f0f000-0x00000000b5f17fff]
[    0.029797]   node   0: [mem 0x00000000b5f1f000-0x00000000b5f64fff]
[    0.029799]   node   0: [mem 0x00000000b5f9f000-0x00000000b5fe0fff]
[    0.029800]   node   0: [mem 0x00000000b5fff000-0x00000000b5ffffff]
[    0.029802]   node   0: [mem 0x0000000100000000-0x000000013fffffff]
[    0.029804] Initmem setup node 0 [mem 0x0000000000001000-0x000000013ffff=
fff]
[    0.029819] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.029903] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.045798] On node 0, zone HighMem: 6 pages in unavailable ranges
[    0.045809] On node 0, zone HighMem: 85 pages in unavailable ranges
[    0.045823] On node 0, zone HighMem: 519 pages in unavailable ranges
[    0.045826] On node 0, zone HighMem: 7 pages in unavailable ranges
[    0.045831] On node 0, zone HighMem: 58 pages in unavailable ranges
[    0.045833] On node 0, zone HighMem: 30 pages in unavailable ranges
[    0.058258] On node 0, zone HighMem: 303104 pages in unavailable ranges
[    0.058265] Using APIC driver default
[    0.058275] Reserving Intel graphics memory at [mem 0xb8000000-0xbffffff=
f]
[    0.058459] ACPI: PM-Timer IO Port: 0x408
[    0.058470] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.058473] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.058485] IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-=
23
[    0.058489] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.058492] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.058497] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.058499] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.058508] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.058546] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.058550] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x0009ffff]
[    0.058551] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000d1fff]
[    0.058553] PM: hibernation: Registered nosave memory: [mem 0x000d2000-0=
x000d3fff]
[    0.058554] PM: hibernation: Registered nosave memory: [mem 0x000d4000-0=
x000dbfff]
[    0.058555] PM: hibernation: Registered nosave memory: [mem 0x000dc000-0=
x000fffff]
[    0.058558] PM: hibernation: Registered nosave memory: [mem 0xb5aa1000-0=
xb5aa6fff]
[    0.058561] PM: hibernation: Registered nosave memory: [mem 0xb5bba000-0=
xb5c0efff]
[    0.058564] PM: hibernation: Registered nosave memory: [mem 0xb5d08000-0=
xb5f0efff]
[    0.058567] PM: hibernation: Registered nosave memory: [mem 0xb5f18000-0=
xb5f1efff]
[    0.058570] PM: hibernation: Registered nosave memory: [mem 0xb5f65000-0=
xb5f9efff]
[    0.058573] PM: hibernation: Registered nosave memory: [mem 0xb5fe1000-0=
xb5ffefff]
[    0.058576] PM: hibernation: Registered nosave memory: [mem 0xb6000000-0=
xb7ffffff]
[    0.058578] PM: hibernation: Registered nosave memory: [mem 0xb8000000-0=
xbfffffff]
[    0.058579] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0=
xffffffff]
[    0.058582] [mem 0xc0000000-0xffffffff] available for PCI devices
[    0.058584] Booting paravirtualized kernel on bare hardware
[    0.058588] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.058600] setup_percpu: NR_CPUS:32 nr_cpumask_bits:32 nr_cpu_ids:2 nr_=
node_ids:1
[    0.058757] percpu: Embedded 32 pages/cpu s100372 r0 d30700 u131072
[    0.058769] pcpu-alloc: s100372 r0 d30700 u131072 alloc=3D32*4096
[    0.058773] pcpu-alloc: [0] 0 [0] 1=20
[    0.058807] Built 1 zonelists, mobility grouping on.  Total pages: 10046=
13
[    0.058811] Kernel command line: BOOT_IMAGE=3D/vmlinuz-6.0.0-0.deb11.6-6=
86-pae root=3DUUID=3D6795a311-d78a-45d1-b8fc-313c70cfb3bb ro noibrs noibpb =
nopti nospectre_v2 nospectre_v1 l1tf=3Doff nospec_store_bypass_disable no_s=
tf_barrier mds=3Doff mitigations=3Doff no_console_suspend=3D1 resume=3DPART=
LABEL=3DU400-root resume_offset=3D1099776 tsc=3Dunstable drm.debug=3D0xe lo=
g_buf_len=3D4M
[    0.059354] tsc: Marking TSC unstable due to boot parameter
[    0.059434] Unknown kernel command line parameters "noibrs noibpb nopti =
nospectre_v2 nospec_store_bypass_disable no_stf_barrier BOOT_IMAGE=3D/vmlin=
uz-6.0.0-0.deb11.6-686-pae", will be passed to user space.
[    0.059607] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes, linear)
[    0.059696] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, linear)
[    0.059732] microcode: microcode updated early to revision 0x60f, date =
=3D 2010-09-29
[    0.059739] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.059742] software IO TLB: area num 2.
[    0.102383] Initializing HighMem for node 0 (00036ffe:00140000)
[    0.375316] Initializing Movable for node 0 (00000000:00000000)
[    0.380328] Checking if this processor honours the WP bit even in superv=
isor mode...Ok.
[    0.380342] Memory: 3863548K/4027252K available (8957K kernel code, 1244=
K rwdata, 2908K rodata, 900K init, 476K bss, 163704K reserved, 0K cma-reser=
ved, 3126532K highmem)
[    0.380951] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.380980] ftrace: allocating 36341 entries in 71 pages
[    0.389434] ftrace: allocated 71 pages with 4 groups
[    0.389577] trace event string verifier disabled
[    0.389640] Dynamic Preempt: voluntary
[    0.389697] rcu: Preemptible hierarchical RCU implementation.
[    0.389698] rcu: 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_ids=
=3D2.
[    0.389700] 	Trampoline variant of Tasks RCU enabled.
[    0.389701] 	Rude variant of Tasks RCU enabled.
[    0.389701] 	Tracing variant of Tasks RCU enabled.
[    0.389703] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.389704] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.401302] NR_IRQS: 2304, nr_irqs: 440, preallocated irqs: 16
[    0.401496] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.401591] Console: colour dummy device 80x25
[    0.402067] printk: console [tty0] enabled
[    0.402081] ACPI: Core revision 20220331
[    0.402086] ACPI: TOSHIBA Satellite detected - force copy of DSDT to loc=
al memory
[    0.402208] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484882848 ns
[    0.402231] APIC: Switch to symmetric I/O mode setup
[    0.402236] Enabling APIC mode:  Flat.  Using 1 I/O APICs
[    0.402658] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.422234] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4522.07 BogoMIPS (lpj=3D9044140)
[    0.422244] pid_max: default: 32768 minimum: 301
[    0.422376] LSM: Security Framework initializing
[    0.422403] landlock: Up and running.
[    0.422408] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.422479] AppArmor: AppArmor initialized
[    0.422485] TOMOYO Linux initialized
[    0.422496] LSM support for eBPF active
[    0.422559] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, =
linear)
[    0.422569] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes, linear)
[    0.423056] x86/cpu: VMX (outside TXT) disabled by BIOS
[    0.423068] CPU0: Thermal monitoring enabled (TM2)
[    0.423086] process: using mwait in idle threads
[    0.423097] Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
[    0.423102] Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32, 1GB 0
[    0.423112] Speculative Store Bypass: Vulnerable
[    0.423505] Freeing SMP alternatives memory: 32K
[    0.538032] smpboot: CPU0: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26G=
Hz (family: 0x6, model: 0x17, stepping: 0x6)
[    0.538231] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.538231] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.538231] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.538231] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.538231] Performance Events: PEBS fmt0+, Core2 events, 4-deep LBR, In=
tel PMU driver.
[    0.538231] ... version:                2
[    0.538231] ... bit width:              40
[    0.538231] ... generic registers:      2
[    0.538231] ... value mask:             000000ffffffffff
[    0.538231] ... max period:             000000007fffffff
[    0.538231] ... fixed-purpose events:   3
[    0.538231] ... event mask:             0000000700000003
[    0.538231] rcu: Hierarchical SRCU implementation.
[    0.538231] rcu: 	Max phase no-delay instances is 1000.
[    0.538231] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.538231] smp: Bringing up secondary CPUs ...
[    0.538231] x86: Booting SMP configuration:
[    0.538231] .... node  #0, CPUs:      #1
[    0.542347] smp: Brought up 1 node, 2 CPUs
[    0.542362] smpboot: Max logical packages: 1
[    0.542366] smpboot: Total of 2 processors activated (9044.14 BogoMIPS)
[    0.544489] devtmpfs: initialized
[    0.545260] ACPI: PM: Registering ACPI NVS region [mem 0xb5f65000-0xb5f9=
efff] (237568 bytes)
[    0.545350] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.545370] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.545446] pinctrl core: initialized pinctrl subsystem
[    0.545848] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.546281] audit: initializing netlink subsys (disabled)
[    0.546338] audit: type=3D2000 audit(1674747359.144:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.546508] thermal_sys: Registered thermal governor 'fair_share'
[    0.546510] thermal_sys: Registered thermal governor 'bang_bang'
[    0.546516] thermal_sys: Registered thermal governor 'step_wise'
[    0.546520] thermal_sys: Registered thermal governor 'user_space'
[    0.546524] thermal_sys: Registered thermal governor 'power_allocator'
[    0.546544] cpuidle: using governor ladder
[    0.546817] Simple Boot Flag at 0x36 set to 0x1
[    0.546838] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.546845] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.546917] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.546929] PCI: not using MMCONFIG
[    0.546937] PCI: Using configuration type 1 for base access
[    0.547272] mtrr: your CPUs had inconsistent variable MTRR settings
[    0.547278] mtrr: probably your BIOS does not setup all CPUs.
[    0.547282] mtrr: corrected configuration.
[    0.549159] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.566407] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.566415] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.567609] ACPI: Added _OSI(Module Device)
[    0.567618] ACPI: Added _OSI(Processor Device)
[    0.567622] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.567626] ACPI: Added _OSI(Processor Aggregator Device)
[    0.567631] ACPI: Added _OSI(Linux-Dell-Video)
[    0.567636] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.567640] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.567701] ACPI: Forced DSDT copy: length 0x09F7C copied locally, origi=
nal unmapped
[    0.575326] ACPI: 5 ACPI AML tables successfully acquired and loaded
[    0.576717] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.578047] ACPI: Dynamic OEM Table Load:
[    0.578061] ACPI: SSDT 0x00000000C1212C00 000265 (v01 PmRef  Cpu0Ist  00=
003000 INTL 20061109)
[    0.578766] ACPI: Dynamic OEM Table Load:
[    0.578778] ACPI: SSDT 0x00000000C1263800 000594 (v01 PmRef  Cpu0Cst  00=
003001 INTL 20061109)
[    0.579714] ACPI: Dynamic OEM Table Load:
[    0.579725] ACPI: SSDT 0x00000000C1340200 0001CF (v01 PmRef  ApIst    00=
003000 INTL 20061109)
[    0.580338] ACPI: Dynamic OEM Table Load:
[    0.580349] ACPI: SSDT 0x00000000C12896C0 00008D (v01 PmRef  ApCst    00=
003000 INTL 20061109)
[    0.581088] ACPI: EC: EC started
[    0.581094] ACPI: EC: interrupt blocked
[    0.590312] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.590320] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.590327] ACPI: Interpreter enabled
[    0.590360] ACPI: PM: (supports S0 S3 S4 S5)
[    0.590365] ACPI: Using IOAPIC for interrupt routing
[    0.590401] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.590924] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACP=
I motherboard resources
[    0.590933] PCI: Using MMCONFIG for extended config space
[    0.590944] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.590951] PCI: Using E820 reservations for host bridge windows
[    0.591230] ACPI: Enabled 14 GPEs in block 00 to 3F
[    0.602287] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.602302] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.602315] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug=
 PME AER PCIeCapability LTR]
[    0.602323] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplu=
g SHPCHotplug PME AER PCIeCapability LTR]
[    0.602330] acpi PNP0A08:00: _OSC: platform retains control of PCIe feat=
ures (AE_NOT_FOUND)
[    0.603085] PCI host bridge to bus 0000:00
[    0.603092] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.603098] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.603104] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.603111] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000dbff=
f window]
[    0.603117] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdffffff=
f window]
[    0.603124] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfebffff=
f window]
[    0.603131] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.603159] pci 0000:00:00.0: [8086:2a40] type 00 class 0x060000
[    0.603264] pci 0000:00:02.0: [8086:2a42] type 00 class 0x030000
[    0.603280] pci 0000:00:02.0: reg 0x10: [mem 0xf4000000-0xf43fffff 64bit]
[    0.603292] pci 0000:00:02.0: reg 0x18: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    0.603303] pci 0000:00:02.0: reg 0x20: [io  0x1800-0x1807]
[    0.603323] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.603462] pci 0000:00:02.1: [8086:2a43] type 00 class 0x038000
[    0.603478] pci 0000:00:02.1: reg 0x10: [mem 0xf4400000-0xf44fffff 64bit]
[    0.603615] pci 0000:00:1a.0: [8086:2937] type 00 class 0x0c0300
[    0.603679] pci 0000:00:1a.0: reg 0x20: [io  0x1820-0x183f]
[    0.603853] pci 0000:00:1a.1: [8086:2938] type 00 class 0x0c0300
[    0.603917] pci 0000:00:1a.1: reg 0x20: [io  0x1840-0x185f]
[    0.604099] pci 0000:00:1a.2: [8086:2939] type 00 class 0x0c0300
[    0.604162] pci 0000:00:1a.2: reg 0x20: [io  0x1860-0x187f]
[    0.604340] pci 0000:00:1a.7: [8086:293c] type 00 class 0x0c0320
[    0.604366] pci 0000:00:1a.7: reg 0x10: [mem 0xf4a04800-0xf4a04bff]
[    0.604477] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.604619] pci 0000:00:1b.0: [8086:293e] type 00 class 0x040300
[    0.604651] pci 0000:00:1b.0: reg 0x10: [mem 0xf4800000-0xf4803fff 64bit]
[    0.604767] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.604914] pci 0000:00:1c.0: [8086:2940] type 01 class 0x060400
[    0.605037] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.605199] pci 0000:00:1c.4: [8086:2948] type 01 class 0x060400
[    0.605324] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.605476] pci 0000:00:1c.5: [8086:294a] type 01 class 0x060400
[    0.605599] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.605750] pci 0000:00:1d.0: [8086:2934] type 00 class 0x0c0300
[    0.605822] pci 0000:00:1d.0: reg 0x20: [io  0x1880-0x189f]
[    0.606012] pci 0000:00:1d.1: [8086:2935] type 00 class 0x0c0300
[    0.606091] pci 0000:00:1d.1: reg 0x20: [io  0x18a0-0x18bf]
[    0.606270] pci 0000:00:1d.2: [8086:2936] type 00 class 0x0c0300
[    0.606334] pci 0000:00:1d.2: reg 0x20: [io  0x18c0-0x18df]
[    0.606533] pci 0000:00:1d.7: [8086:293a] type 00 class 0x0c0320
[    0.606560] pci 0000:00:1d.7: reg 0x10: [mem 0xf4a04c00-0xf4a04fff]
[    0.606672] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.606815] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.607013] pci 0000:00:1f.0: [8086:2919] type 00 class 0x060100
[    0.607296] pci 0000:00:1f.2: [8086:2929] type 00 class 0x010601
[    0.607322] pci 0000:00:1f.2: reg 0x10: [io  0x1818-0x181f]
[    0.607337] pci 0000:00:1f.2: reg 0x14: [io  0x180c-0x180f]
[    0.607351] pci 0000:00:1f.2: reg 0x18: [io  0x1810-0x1817]
[    0.607366] pci 0000:00:1f.2: reg 0x1c: [io  0x1808-0x180b]
[    0.607380] pci 0000:00:1f.2: reg 0x20: [io  0x18e0-0x18ff]
[    0.607395] pci 0000:00:1f.2: reg 0x24: [mem 0xf4a04000-0xf4a047ff]
[    0.607463] pci 0000:00:1f.2: PME# supported from D3hot
[    0.607590] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500
[    0.607622] pci 0000:00:1f.3: reg 0x10: [mem 0x00000000-0x000000ff 64bit]
[    0.607656] pci 0000:00:1f.3: reg 0x20: [io  0x1c00-0x1c1f]
[    0.607873] acpiphp: Slot [1] registered
[    0.607883] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.607891] pci 0000:00:1c.0:   bridge window [io  0x0000-0x0fff]
[    0.607899] pci 0000:00:1c.0:   bridge window [mem 0x00000000-0x000fffff]
[    0.607910] pci 0000:00:1c.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.608013] pci 0000:07:00.0: [11ab:436c] type 00 class 0x020000
[    0.608049] pci 0000:07:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[    0.608065] pci 0000:07:00.0: reg 0x18: [io  0x0000-0x00ff]
[    0.608107] pci 0000:07:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.608201] pci 0000:07:00.0: supports D1 D2
[    0.608206] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.608404] pci 0000:00:1c.4: PCI bridge to [bus 07]
[    0.608413] pci 0000:00:1c.4:   bridge window [io  0x0000-0x0fff]
[    0.608421] pci 0000:00:1c.4:   bridge window [mem 0x00000000-0x000fffff]
[    0.608433] pci 0000:00:1c.4:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.608551] pci 0000:08:00.0: [8086:4232] type 00 class 0x028000
[    0.608601] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x00001fff 64bit]
[    0.608792] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.609026] pci 0000:00:1c.5: PCI bridge to [bus 08]
[    0.609036] pci 0000:00:1c.5:   bridge window [io  0x0000-0x0fff]
[    0.609044] pci 0000:00:1c.5:   bridge window [mem 0x00000000-0x000fffff]
[    0.609055] pci 0000:00:1c.5:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[    0.609084] pci_bus 0000:0a: extended config space not accessible
[    0.609122] pci 0000:0a:01.0: [1217:00f7] type 00 class 0x0c0010
[    0.609149] pci 0000:0a:01.0: reg 0x10: [mem 0xff501000-0xff501fff]
[    0.609166] pci 0000:0a:01.0: reg 0x14: [mem 0xf4700000-0xf47007ff]
[    0.609261] pci 0000:0a:01.0: supports D1 D2
[    0.609266] pci 0000:0a:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.609349] pci 0000:0a:01.2: [1217:7120] type 00 class 0x080501
[    0.609379] pci 0000:0a:01.2: reg 0x10: [mem 0xf4700800-0xf47008ff]
[    0.609491] pci 0000:0a:01.2: supports D1 D2
[    0.609496] pci 0000:0a:01.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.609579] pci 0000:0a:01.3: [1217:7130] type 00 class 0x018000
[    0.609609] pci 0000:0a:01.3: reg 0x10: [mem 0xf4702000-0xf4702fff]
[    0.609722] pci 0000:0a:01.3: supports D1 D2
[    0.609728] pci 0000:0a:01.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.609862] pci 0000:00:1e.0: PCI bridge to [bus 0a] (subtractive decode)
[    0.609875] pci 0000:00:1e.0:   bridge window [mem 0xf4700000-0xf47fffff]
[    0.609886] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7 window]=
 (subtractive decode)
[    0.609893] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window]=
 (subtractive decode)
[    0.609900] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000bffff=
 window] (subtractive decode)
[    0.609907] pci 0000:00:1e.0:   bridge window [mem 0x000d4000-0x000dbfff=
 window] (subtractive decode)
[    0.609914] pci 0000:00:1e.0:   bridge window [mem 0xc0000000-0xdfffffff=
 window] (subtractive decode)
[    0.609921] pci 0000:00:1e.0:   bridge window [mem 0xf0000000-0xfebfffff=
 window] (subtractive decode)
[    0.609956] pci_bus 0000:00: on NUMA node 0
[    0.610788] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.610864] ACPI: PCI: Interrupt link LNKB configured for IRQ 5
[    0.610937] ACPI: PCI: Interrupt link LNKC configured for IRQ 6
[    0.611010] ACPI: PCI: Interrupt link LNKD configured for IRQ 10
[    0.611083] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.611089] ACPI: PCI: Interrupt link LNKE disabled
[    0.611160] ACPI: PCI: Interrupt link LNKF configured for IRQ 11
[    0.611233] ACPI: PCI: Interrupt link LNKG configured for IRQ 10
[    0.611306] ACPI: PCI: Interrupt link LNKH configured for IRQ 7
[    0.611893] ACPI: EC: interrupt unblocked
[    0.611898] ACPI: EC: event unblocked
[    0.611908] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.611913] ACPI: EC: GPE=3D0x18
[    0.611918] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    0.611924] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions =
and events
[    0.612064] iommu: Default domain type: Translated=20
[    0.612071] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    0.612264] EDAC MC: Ver: 3.0.0
[    0.612760] NetLabel: Initializing
[    0.612765] NetLabel:  domain hash size =3D 128
[    0.612769] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.612793] NetLabel:  unlabeled traffic allowed by default
[    0.612798] PCI: Using ACPI for IRQ routing
[    0.623361] PCI: pci_cache_line_size set to 64 bytes
[    0.623395] pci 0000:0a:01.0: can't claim BAR 0 [mem 0xff501000-0xff501f=
ff]: no compatible bridge window
[    0.623450] e820: reserve RAM buffer [mem 0x0009f400-0x0009ffff]
[    0.623453] e820: reserve RAM buffer [mem 0xb5aa1000-0xb7ffffff]
[    0.623456] e820: reserve RAM buffer [mem 0xb5bba000-0xb7ffffff]
[    0.623459] e820: reserve RAM buffer [mem 0xb5d08000-0xb7ffffff]
[    0.623462] e820: reserve RAM buffer [mem 0xb5f18000-0xb7ffffff]
[    0.623464] e820: reserve RAM buffer [mem 0xb5f65000-0xb7ffffff]
[    0.623466] e820: reserve RAM buffer [mem 0xb5fe1000-0xb7ffffff]
[    0.623469] e820: reserve RAM buffer [mem 0xb6000000-0xb7ffffff]
[    0.623551] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.623558] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.623563] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.623575] vgaarb: loaded
[    0.623863] hpet: 4 channels of 0 reserved for per-cpu timers
[    0.623871] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
[    0.623882] hpet0: 4 comparators, 64-bit 14.318180 MHz counter
[    0.625932] clocksource: Switched to clocksource hpet
[    0.640767] VFS: Disk quotas dquot_6.6.0
[    0.640812] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    0.641075] AppArmor: AppArmor Filesystem Enabled
[    0.641119] pnp: PnP ACPI init
[    0.641462] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.641524] pnp 00:01: disabling [io  0x002e-0x002f] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641535] pnp 00:01: disabling [io  0x004e-0x004f] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641543] pnp 00:01: disabling [io  0x0061] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641550] pnp 00:01: disabling [io  0x0063] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641558] pnp 00:01: disabling [io  0x0065] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641565] pnp 00:01: disabling [io  0x0067] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641572] pnp 00:01: disabling [io  0x0068] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641580] pnp 00:01: disabling [io  0x006c] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641587] pnp 00:01: disabling [io  0x0070] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641594] pnp 00:01: disabling [io  0x0080] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641602] pnp 00:01: disabling [io  0x0092] because it overlaps 0000:0=
7:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641609] pnp 00:01: disabling [io  0x00b2-0x00b3] because it overlaps=
 0000:07:00.0 BAR 2 [io  0x0000-0x00ff]
[    0.641663] system 00:01: [io  0x03e0-0x03e1] has been reserved
[    0.641670] system 00:01: [io  0x0400-0x047f] has been reserved
[    0.641677] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.641683] system 00:01: [io  0x0480-0x048f] has been reserved
[    0.641689] system 00:01: [io  0xffff] has been reserved
[    0.641695] system 00:01: [io  0xffff] has been reserved
[    0.641700] system 00:01: [io  0x1180-0x11ff] has been reserved
[    0.641706] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.641713] system 00:01: [io  0xfe00] has been reserved
[    0.642270] system 00:05: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.642280] system 00:05: [mem 0xfed10000-0xfed13fff] has been reserved
[    0.642287] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.642302] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.642309] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.642316] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.642322] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.642565] pnp: PnP ACPI: found 6 devices
[    0.642572] PnPBIOS: Disabled by ACPI PNP
[    0.679957] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.680097] NET: Registered PF_INET protocol family
[    0.680219] IP idents hash table entries: 16384 (order: 5, 131072 bytes,=
 linear)
[    0.680841] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, =
4096 bytes, linear)
[    0.680956] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.681001] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes, linear)
[    0.681041] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, li=
near)
[    0.681063] TCP: Hash tables configured (established 8192 bind 8192)
[    0.681154] MPTCP token hash table entries: 1024 (order: 2, 16384 bytes,=
 linear)
[    0.681195] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.681212] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, lin=
ear)
[    0.681270] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.681284] NET: Registered PF_XDP protocol family
[    0.681299] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus =
02-03] add_size 1000
[    0.681310] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 02-03] add_size 200000 add_align 100000
[    0.681320] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] =
to [bus 02-03] add_size 200000 add_align 100000
[    0.681330] pci 0000:00:1c.4: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 07] add_size 200000 add_align 100000
[    0.681339] pci 0000:00:1c.4: bridge window [mem 0x00100000-0x001fffff] =
to [bus 07] add_size 100000 add_align 100000
[    0.681348] pci 0000:00:1c.5: bridge window [io  0x1000-0x0fff] to [bus =
08] add_size 1000
[    0.681355] pci 0000:00:1c.5: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 08] add_size 200000 add_align 100000
[    0.681365] pci 0000:00:1c.5: bridge window [mem 0x00100000-0x001fffff] =
to [bus 08] add_size 100000 add_align 100000
[    0.681387] pci 0000:00:1c.0: BAR 14: assigned [mem 0xc0000000-0xc01ffff=
f]
[    0.681399] pci 0000:00:1c.0: BAR 15: assigned [mem 0xc0200000-0xc03ffff=
f 64bit pref]
[    0.681407] pci 0000:00:1c.4: BAR 14: assigned [mem 0xc0400000-0xc05ffff=
f]
[    0.681418] pci 0000:00:1c.4: BAR 15: assigned [mem 0xc0600000-0xc07ffff=
f 64bit pref]
[    0.681426] pci 0000:00:1c.5: BAR 14: assigned [mem 0xc0800000-0xc09ffff=
f]
[    0.681437] pci 0000:00:1c.5: BAR 15: assigned [mem 0xc0a00000-0xc0bffff=
f 64bit pref]
[    0.681445] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.681452] pci 0000:00:1c.4: BAR 13: assigned [io  0x3000-0x3fff]
[    0.681459] pci 0000:00:1c.5: BAR 13: assigned [io  0x4000-0x4fff]
[    0.681470] pci 0000:00:1f.3: BAR 0: assigned [mem 0xc0c00000-0xc0c000ff=
 64bit]
[    0.681489] pci 0000:00:1c.0: PCI bridge to [bus 02-03]
[    0.681496] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.681505] pci 0000:00:1c.0:   bridge window [mem 0xc0000000-0xc01fffff]
[    0.681514] pci 0000:00:1c.0:   bridge window [mem 0xc0200000-0xc03fffff=
 64bit pref]
[    0.681528] pci 0000:07:00.0: BAR 6: assigned [mem 0xc0400000-0xc041ffff=
 pref]
[    0.681536] pci 0000:07:00.0: BAR 0: assigned [mem 0xc0420000-0xc0423fff=
 64bit]
[    0.681556] pci 0000:07:00.0: BAR 2: assigned [io  0x3000-0x30ff]
[    0.681566] pci 0000:00:1c.4: PCI bridge to [bus 07]
[    0.681572] pci 0000:00:1c.4:   bridge window [io  0x3000-0x3fff]
[    0.681582] pci 0000:00:1c.4:   bridge window [mem 0xc0400000-0xc05fffff]
[    0.681590] pci 0000:00:1c.4:   bridge window [mem 0xc0600000-0xc07fffff=
 64bit pref]
[    0.681603] pci 0000:08:00.0: BAR 0: assigned [mem 0xc0800000-0xc0801fff=
 64bit]
[    0.681629] pci 0000:00:1c.5: PCI bridge to [bus 08]
[    0.681635] pci 0000:00:1c.5:   bridge window [io  0x4000-0x4fff]
[    0.681644] pci 0000:00:1c.5:   bridge window [mem 0xc0800000-0xc09fffff]
[    0.681652] pci 0000:00:1c.5:   bridge window [mem 0xc0a00000-0xc0bfffff=
 64bit pref]
[    0.681665] pci 0000:0a:01.0: BAR 0: assigned [mem 0xf4701000-0xf4701fff]
[    0.681674] pci 0000:00:1e.0: PCI bridge to [bus 0a]
[    0.681683] pci 0000:00:1e.0:   bridge window [mem 0xf4700000-0xf47fffff]
[    0.681697] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.681703] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.681708] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.681714] pci_bus 0000:00: resource 7 [mem 0x000d4000-0x000dbfff windo=
w]
[    0.681719] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xdfffffff windo=
w]
[    0.681725] pci_bus 0000:00: resource 9 [mem 0xf0000000-0xfebfffff windo=
w]
[    0.681731] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    0.681736] pci_bus 0000:02: resource 1 [mem 0xc0000000-0xc01fffff]
[    0.681741] pci_bus 0000:02: resource 2 [mem 0xc0200000-0xc03fffff 64bit=
 pref]
[    0.681749] pci_bus 0000:07: resource 0 [io  0x3000-0x3fff]
[    0.681754] pci_bus 0000:07: resource 1 [mem 0xc0400000-0xc05fffff]
[    0.681760] pci_bus 0000:07: resource 2 [mem 0xc0600000-0xc07fffff 64bit=
 pref]
[    0.681766] pci_bus 0000:08: resource 0 [io  0x4000-0x4fff]
[    0.681771] pci_bus 0000:08: resource 1 [mem 0xc0800000-0xc09fffff]
[    0.681777] pci_bus 0000:08: resource 2 [mem 0xc0a00000-0xc0bfffff 64bit=
 pref]
[    0.681783] pci_bus 0000:0a: resource 1 [mem 0xf4700000-0xf47fffff]
[    0.681789] pci_bus 0000:0a: resource 4 [io  0x0000-0x0cf7 window]
[    0.681794] pci_bus 0000:0a: resource 5 [io  0x0d00-0xffff window]
[    0.681800] pci_bus 0000:0a: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.681806] pci_bus 0000:0a: resource 7 [mem 0x000d4000-0x000dbfff windo=
w]
[    0.681812] pci_bus 0000:0a: resource 8 [mem 0xc0000000-0xdfffffff windo=
w]
[    0.681818] pci_bus 0000:0a: resource 9 [mem 0xf0000000-0xfebfffff windo=
w]
[    0.683455] PCI: CLS 64 bytes, default 64
[    0.683468] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.683473] software IO TLB: mapped [mem 0x000000002d7dd000-0x0000000031=
7dd000] (64MB)
[    0.683559] Trying to unpack rootfs image as initramfs...
[    0.684387] Initialise system trusted keyrings
[    0.684429] Key type blacklist registered
[    0.684549] workingset: timestamp_bits=3D14 max_order=3D20 bucket_order=
=3D6
[    0.687426] zbud: loaded
[    0.687840] integrity: Platform Keyring initialized
[    0.687848] Key type asymmetric registered
[    0.687853] Asymmetric key parser 'x509' registered
[    0.965573] Freeing initrd memory: 12824K
[    0.972085] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    0.972266] bounce: pool size: 64 pages
[    0.972349] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 251)
[    0.972407] io scheduler mq-deadline registered
[    0.974243] pcieport 0000:00:1c.0: enabling device (0000 -> 0003)
[    0.974475] pcieport 0000:00:1c.4: enabling device (0000 -> 0003)
[    0.974636] pcieport 0000:00:1c.5: enabling device (0000 -> 0003)
[    0.974880] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.974995] Monitor-Mwait will be used to enter C-1 state
[    0.975006] Monitor-Mwait will be used to enter C-2 state
[    0.975013] Monitor-Mwait will be used to enter C-3 state
[    0.975018] ACPI: \_PR_.CPU0: Found 3 idle states
[    0.979083] thermal LNXTHERM:00: registered as thermal_zone0
[    0.979094] ACPI: thermal: Thermal Zone [THRM] (66 C)
[    0.979222] isapnp: Scanning for PnP cards...
[    1.333183] isapnp: No Plug & Play device found
[    1.333405] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.334305] Linux agpgart interface v0.103
[    1.334845] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2A] at 0=
x60,0x64 irq 1,12
[    1.340489] i8042: Detected active multiplexing controller, rev 1.1
[    1.341812] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.341823] serio: i8042 AUX0 port at 0x60,0x64 irq 12
[    1.341881] serio: i8042 AUX1 port at 0x60,0x64 irq 12
[    1.341929] serio: i8042 AUX2 port at 0x60,0x64 irq 12
[    1.341969] serio: i8042 AUX3 port at 0x60,0x64 irq 12
[    1.342185] mousedev: PS/2 mouse device common for all mice
[    1.342257] rtc_cmos 00:02: RTC can wake from S4
[    1.342615] rtc_cmos 00:02: registered as rtc0
[    1.342660] rtc_cmos 00:02: setting system clock to 2023-01-26T15:36:00 =
UTC (1674747360)
[    1.342692] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram=
, hpet irqs
[    1.342753] intel_pstate: CPU model not supported
[    1.342792] ledtrig-cpu: registered to indicate activity on CPUs
[    1.343149] vesafb: mode is 1024x768x32, linelength=3D4096, pages=3D0
[    1.343156] vesafb: scrolling: redraw
[    1.343159] vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.343176] vesafb: framebuffer at 0xd0000000, mapped to 0x(ptrval), usi=
ng 3072k, total 3072k
[    1.367277] Console: switching to colour frame buffer device 128x48
[    1.391509] fb0: VESA VGA frame buffer device
[    1.392048] NET: Registered PF_INET6 protocol family
[    1.398149] Segment Routing with IPv6
[    1.398373] In-situ OAM (IOAM) with IPv6
[    1.398589] mip6: Mobile IPv6
[    1.398726] NET: Registered PF_PACKET protocol family
[    1.399015] mpls_gso: MPLS GSO support
[    1.399658] microcode: sig=3D0x10676, pf=3D0x80, revision=3D0x60f
[    1.399918] microcode: Microcode Update Driver: v2.2.
[    1.399925] IPI shorthand broadcast: enabled
[    1.400560] registered taskstats version 1
[    1.400756] Loading compiled-in X.509 certificates
[    1.410735] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input0
[    1.512595] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f61=
49f3dd27dfcc5cbb419ea1'
[    1.513016] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: 1=
4011249c2675ea8e5148542202005810584b25f'
[    1.514075] zswap: loaded using pool lzo/zbud
[    1.514579] Key type .fscrypt registered
[    1.514765] Key type fscrypt-provisioning registered
[    1.521279] Key type encrypted registered
[    1.521478] AppArmor: AppArmor sha1 policy hashing enabled
[    1.521740] ima: No TPM chip found, activating TPM-bypass!
[    1.522000] ima: Allocated hash algorithm: sha256
[    1.522226] ima: No architecture policies found
[    1.531607] evm: Initialising EVM extended attributes:
[    1.540946] evm: security.selinux
[    1.550110] evm: security.SMACK64 (disabled)
[    1.559116] evm: security.SMACK64EXEC (disabled)
[    1.567968] evm: security.SMACK64TRANSMUTE (disabled)
[    1.576724] evm: security.SMACK64MMAP (disabled)
[    1.585431] evm: security.apparmor
[    1.594176] evm: security.ima
[    1.602937] evm: security.capability
[    1.611774] evm: HMAC attrs: 0x1
[    2.206690] Unstable clock detected, switching default tracing clock to =
"global"
               If you want to keep using the local clock, then add:
                 "trace_clock=3Dlocal"
               on the kernel command line
[    2.244150] Freeing unused kernel image (initmem) memory: 900K
[    2.274552] Write protecting kernel text and read-only data: 11868k
[    2.283363] NX-protecting the kernel data: 5376k
[    2.292588] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    2.301464] Run /init as init process
[    2.310244]   with arguments:
[    2.310246]     /init
[    2.310247]     noibrs
[    2.310249]     noibpb
[    2.310258]     nopti
[    2.310259]     nospectre_v2
[    2.310261]     nospec_store_bypass_disable
[    2.310262]     no_stf_barrier
[    2.310264]   with environment:
[    2.310265]     HOME=3D/
[    2.310267]     TERM=3Dlinux
[    2.310268]     BOOT_IMAGE=3D/vmlinuz-6.0.0-0.deb11.6-686-pae
[    2.322475] systemd[1]: Inserted module 'autofs4'
[    2.340133] systemd[1]: systemd 246.6-2 running in system mode. (+PAM +A=
UDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT =
+GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dhybrid)
[    2.359227] systemd[1]: Detected architecture x86.
[    2.368761] systemd[1]: Running in initial RAM disk.
[    2.454677] systemd[1]: Set hostname to <nabtop>.
[    2.560149] systemd[1]: /lib/systemd/system/dracut-pre-udev.service:27: =
Standard output type syslog is obsolete, automatically updating to journal.=
 Please update your unit file, and consider removing the setting altogether.
[    2.580569] systemd[1]: /lib/systemd/system/dracut-pre-udev.service:28: =
Standard output type syslog+console is obsolete, automatically updating to =
journal+console. Please update your unit file, and consider removing the se=
tting altogether.
[    2.620702] systemd[1]: /lib/systemd/system/dracut-pre-trigger.service:2=
3: Standard output type syslog is obsolete, automatically updating to journ=
al. Please update your unit file, and consider removing the setting altoget=
her.
[    2.643543] systemd[1]: /lib/systemd/system/dracut-pre-trigger.service:2=
4: Standard output type syslog+console is obsolete, automatically updating =
to journal+console. Please update your unit file, and consider removing the=
 setting altogether.
[    2.668403] systemd[1]: /lib/systemd/system/dracut-pre-pivot.service:30:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.693310] systemd[1]: /lib/systemd/system/dracut-pre-pivot.service:31:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.722157] systemd[1]: /lib/systemd/system/dracut-pre-mount.service:22:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.748846] systemd[1]: /lib/systemd/system/dracut-pre-mount.service:23:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.777546] systemd[1]: /lib/systemd/system/dracut-mount.service:22: Sta=
ndard output type syslog is obsolete, automatically updating to journal. Pl=
ease update your unit file, and consider removing the setting altogether.
[    2.806761] systemd[1]: /lib/systemd/system/dracut-mount.service:23: Sta=
ndard output type syslog+console is obsolete, automatically updating to jou=
rnal+console. Please update your unit file, and consider removing the setti=
ng altogether.
[    2.837693] systemd[1]: /lib/systemd/system/dracut-initqueue.service:24:=
 Standard output type syslog is obsolete, automatically updating to journal=
=2E Please update your unit file, and consider removing the setting altoget=
her.
[    2.869500] systemd[1]: /lib/systemd/system/dracut-initqueue.service:25:=
 Standard output type syslog+console is obsolete, automatically updating to=
 journal+console. Please update your unit file, and consider removing the s=
etting altogether.
[    2.903367] systemd[1]: /lib/systemd/system/dracut-cmdline.service:26: S=
tandard output type syslog is obsolete, automatically updating to journal. =
Please update your unit file, and consider removing the setting altogether.
[    2.938216] systemd[1]: /lib/systemd/system/dracut-cmdline.service:27: S=
tandard output type syslog+console is obsolete, automatically updating to j=
ournal+console. Please update your unit file, and consider removing the set=
ting altogether.
[    2.981565] systemd[1]: Queued start job for default target Initrd Defau=
lt Target.
[    4.046250] random: crng init done
[    4.065821] systemd[1]: Created slice system-systemd\x2dhibernate\x2dres=
ume.slice.
[    4.103581] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    4.142035] systemd[1]: Reached target Paths.
[    4.180339] systemd[1]: Reached target Slices.
[    4.218459] systemd[1]: Reached target Swap.
[    4.256357] systemd[1]: Reached target Timers.
[    4.293345] systemd[1]: Listening on Journal Audit Socket.
[    4.330362] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.367522] systemd[1]: Listening on Journal Socket.
[    4.404506] systemd[1]: Listening on udev Control Socket.
[    4.440555] systemd[1]: Listening on udev Kernel Socket.
[    4.475512] systemd[1]: Reached target Sockets.
[    4.530744] systemd[1]: Starting dracut ask for additional cmdline param=
eters...
[    4.565919] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[    4.601088] systemd[1]: Starting Journal Service...
[    4.642475] systemd[1]: Starting Load Kernel Modules...
[    4.675451] systemd[1]: Finished dracut ask for additional cmdline param=
eters.
[    4.710064] systemd[1]: Finished Create list of static device nodes for =
the current kernel.
[    4.725131] lp: driver loaded but no devices found
[    4.753195] ppdev: user-space parallel port driver
[    4.788262] SCSI subsystem initialized
[    4.802382] systemd[1]: Starting dracut cmdline hook...
[    4.828835] Asymmetric key parser 'pkcs8' registered
[    4.847910] systemd[1]: Starting Create Static Device Nodes in /dev...
[    4.874734] systemd[1]: Started Journal Service.
[    5.185888] ACPI: battery: Slot [BAT1] (battery absent)
[    5.231186] ACPI: bus type USB registered
[    5.334656] sdhci: Secure Digital Host Controller Interface driver
[    5.345647] sdhci: Copyright(c) Pierre Ossman
[    5.353554] usbcore: registered new interface driver usbfs
[    5.361407] libata version 3.00 loaded.
[    5.368126] usbcore: registered new interface driver hub
[    5.378932] usbcore: registered new device driver usb
[    5.384544] firewire_ohci 0000:0a:01.0: added OHCI v1.10 device as card =
0, 8 IR + 8 IT contexts, quirks 0x10
[    5.404215] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    5.417754] uhci_hcd: USB Universal Host Controller Interface driver
[    5.428743] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    5.439367] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus =
number 1
[    5.451807] uhci_hcd 0000:00:1a.0: detected 2 ports
[    5.465398] uhci_hcd 0000:00:1a.0: irq 16, io port 0x00001820
[    5.476303] ehci-pci: EHCI PCI platform driver
[    5.486751] ahci 0000:00:1f.2: version 3.0
[    5.487642] ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 4 ports 3 Gbps 0x=
33 impl SATA mode
[    5.490074] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    5.498070] ahci 0000:00:1f.2: flags: 64bit ncq sntf led clo pio slum pa=
rt ccc ems sxs=20
[    5.508355] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    5.528955] usb usb1: Product: UHCI Host Controller
[    5.539205] usb usb1: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    5.549578] usb usb1: SerialNumber: 0000:00:1a.0
[    5.560479] sdhci-pci 0000:0a:01.2: SDHCI controller found [1217:7120] (=
rev 2)
[    5.562348] hub 1-0:1.0: USB hub found
[    5.572940] mmc0 bounce up to 128 segments into one, max segment size 65=
536 bytes
[    5.581717] hub 1-0:1.0: 2 ports detected
[    5.601934] ehci-pci 0000:00:1a.7: EHCI Host Controller
[    5.605819] mmc0: SDHCI controller on PCI [0000:0a:01.2] using DMA
[    5.614291] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus =
number 2
[    5.633153] ehci-pci 0000:00:1a.7: debug port 1
[    5.637562] scsi host0: ahci
[    5.656922] ehci-pci 0000:00:1a.7: irq 19, io mem 0xf4a04800
[    5.666949] scsi host1: ahci
[    5.677759] scsi host2: ahci
[    5.688142] scsi host3: ahci
[    5.690257] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    5.707117] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.00
[    5.717009] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    5.726935] usb usb2: Product: EHCI Host Controller
[    5.736792] usb usb2: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae ehci_h=
cd
[    5.746860] usb usb2: SerialNumber: 0000:00:1a.7
[    5.757462] scsi host4: ahci
[    5.757957] hub 2-0:1.0: USB hub found
[    5.768573] scsi host5: ahci
[    5.778219] hub 2-0:1.0: 6 ports detected
[    5.788218] ata1: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0410=
0 irq 24
[    5.807301] ata2: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0418=
0 irq 24
[    5.807312] ata3: DUMMY
[    5.807313] ata4: DUMMY
[    5.807315] ata5: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0430=
0 irq 24
[    5.807318] ata6: SATA max UDMA/133 abar m2048@0xf4a04000 port 0xf4a0438=
0 irq 24
[    5.827298] hub 1-0:1.0: USB hub found
[    5.866774] hub 1-0:1.0: 2 ports detected
[    5.876632] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    5.887161] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus =
number 3
[    5.897171] uhci_hcd 0000:00:1a.1: detected 2 ports
[    5.906739] uhci_hcd 0000:00:1a.1: irq 21, io port 0x00001840
[    5.916309] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    5.926018] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    5.935714] usb usb3: Product: UHCI Host Controller
[    5.945315] usb usb3: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    5.955092] usb usb3: SerialNumber: 0000:00:1a.1
[    5.964926] firewire_core 0000:0a:01.0: created device fw0: GUID 001b240=
0013bc0de, S400
[    5.966157] hub 3-0:1.0: USB hub found
[    5.984364] hub 3-0:1.0: 2 ports detected
[    5.994246] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    6.003644] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus =
number 4
[    6.013079] ehci-pci 0000:00:1d.7: debug port 1
[    6.026278] ehci-pci 0000:00:1d.7: irq 23, io mem 0xf4a04c00
[    6.050474] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    6.059699] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.00
[    6.068991] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.078175] usb usb4: Product: EHCI Host Controller
[    6.087236] usb usb4: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae ehci_h=
cd
[    6.096466] usb usb4: SerialNumber: 0000:00:1d.7
[    6.105971] hub 4-0:1.0: USB hub found
[    6.115253] hub 4-0:1.0: 6 ports detected
[    6.124823] uhci_hcd 0000:00:1a.2: UHCI Host Controller
[    6.148859] ata5: SATA link down (SStatus 0 SControl 300)
[    6.157736] ata6: SATA link down (SStatus 0 SControl 300)
[    6.166469] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    6.175381] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    6.175479] uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus =
number 5
[    6.184396] ata2.00: ATAPI: MATSHITADVD-RAM UJ862AS, 1.50, max UDMA/33
[    6.193841] uhci_hcd 0000:00:1a.2: detected 2 ports
[    6.202690] ata1.00: unexpected _GTF length (8)
[    6.211315] uhci_hcd 0000:00:1a.2: irq 19, io port 0x00001860
[    6.220239] ata2.00: configured for UDMA/33
[    6.228868] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    6.237658] ata1.00: ATA-9: C400-MTFDDAK256MAM, 0609, max UDMA/100
[    6.246594] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.256024] ata1.00: 500118192 sectors, multi 16: LBA48 NCQ (depth 32), =
AA
[    6.265187] usb usb5: Product: UHCI Host Controller
[    6.275019] ata1.00: unexpected _GTF length (8)
[    6.284187] usb usb5: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    6.293854] ata1.00: configured for UDMA/100
[    6.303452] usb usb5: SerialNumber: 0000:00:1a.2
[    6.313487] scsi 0:0:0:0: Direct-Access     ATA      C400-MTFDDAK256M 06=
09 PQ: 0 ANSI: 5
[    6.323326] hub 5-0:1.0: USB hub found
[    6.336328] scsi 1:0:0:0: CD-ROM            MATSHITA DVD-RAM UJ862AS  1.=
50 PQ: 0 ANSI: 5
[    6.343108] hub 5-0:1.0: 2 ports detected
[    6.364142] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    6.374770] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus =
number 6
[    6.385292] uhci_hcd 0000:00:1d.0: detected 2 ports
[    6.396204] uhci_hcd 0000:00:1d.0: irq 23, io port 0x00001880
[    6.406652] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    6.417181] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.427737] usb usb6: Product: UHCI Host Controller
[    6.438078] usb usb6: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    6.448503] usb usb6: SerialNumber: 0000:00:1d.0
[    6.462332] hub 6-0:1.0: USB hub found
[    6.472777] hub 6-0:1.0: 2 ports detected
[    6.484005] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    6.494177] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus =
number 7
[    6.505112] uhci_hcd 0000:00:1d.1: detected 2 ports
[    6.515289] uhci_hcd 0000:00:1d.1: irq 19, io port 0x000018a0
[    6.525414] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd=
/rw xa/form2 cdda tray
[    6.525498] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    6.535786] cdrom: Uniform CD-ROM driver Revision: 3.20
[    6.546129] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.567014] usb usb7: Product: UHCI Host Controller
[    6.577382] usb usb7: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    6.587834] usb usb7: SerialNumber: 0000:00:1d.1
[    6.599333] hub 7-0:1.0: USB hub found
[    6.610151] hub 7-0:1.0: 2 ports detected
[    6.621099] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    6.621631] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    6.622743] sd 0:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB=
/238 GiB)
[    6.632690] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus =
number 8
[    6.644127] sd 0:0:0:0: [sda] Write Protect is off
[    6.654215] uhci_hcd 0000:00:1d.2: detected 2 ports
[    6.664645] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    6.664937] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    6.676467] uhci_hcd 0000:00:1d.2: irq 18, io port 0x000018c0
[    6.697761] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    6.709261] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 6.00
[    6.716552]  sda: sda1 sda2 sda3 sda4
[    6.720785] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    6.733020] sd 0:0:0:0: [sda] Attached SCSI disk
[    6.743248] usb usb8: Product: UHCI Host Controller
[    6.743250] usb usb8: Manufacturer: Linux 6.0.0-0.deb11.6-686-pae uhci_h=
cd
[    6.743252] usb usb8: SerialNumber: 0000:00:1d.2
[    6.744905] hub 8-0:1.0: USB hub found
[    6.754433] usb 6-2: new full-speed USB device number 2 using uhci_hcd
[    6.811408] hub 8-0:1.0: 2 ports detected
[    6.931662] PM: Image not found (code -22)
[    6.945625] usb 6-2: New USB device found, idVendor=3D08ff, idProduct=3D=
1600, bcdDevice=3D c.10
[    6.945631] usb 6-2: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    6.945634] usb 6-2: Product: Fingerprint Sensor
[    8.266279] usb 4-4: new high-speed USB device number 4 using ehci-pci
[    8.474722] usb 4-4: New USB device found, idVendor=3D04f2, idProduct=3D=
b064, bcdDevice=3D10.21
[    8.485301] usb 4-4: New USB device strings: Mfr=3D2, Product=3D1, Seria=
lNumber=3D3
[    8.495908] usb 4-4: Product: CNA7137
[    8.506416] usb 4-4: Manufacturer: Chicony Electronics Co., Ltd.
[    8.517076] usb 4-4: SerialNumber: SN0001
[    9.084326] EXT4-fs (sda2): mounted filesystem with ordered data mode. Q=
uota mode: none.
[   10.064094] systemd[1]: systemd 246.6-2 running in system mode. (+PAM +A=
UDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT =
+GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dhybrid)
[   10.080868] systemd[1]: Detected architecture x86.
[   10.115318] systemd[1]: Set hostname to <nabtop>.
[   10.409778] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-mount.service:22: Standard output type syslog is obsolete, automatically =
updating to journal. Please update your unit file, and consider removing th=
e setting altogether.
[   10.427268] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-mount.service:23: Standard output type syslog+console is obsolete, automa=
tically updating to journal+console. Please update your unit file, and cons=
ider removing the setting altogether.
[   10.456303] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-mount.service:22: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   10.476919] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-mount.service:23: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   10.511255] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-initqueue.service:24: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   10.535394] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-initqueue.service:25: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   10.602003] systemd[1]: /lib/systemd/system/smartmontools.service:10: St=
andard output type syslog is obsolete, automatically updating to journal. P=
lease update your unit file, and consider removing the setting altogether.
[   10.657214] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.674987] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.692102] systemd[1]: /lib/systemd/system/cron-monthly.timer:10: Unkno=
wn key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.722932] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.739316] systemd[1]: /lib/systemd/system/cron-weekly.timer:10: Unknow=
n key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.771798] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.789005] systemd[1]: /lib/systemd/system/cron-daily.timer:10: Unknown=
 key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.823139] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.840863] systemd[1]: /lib/systemd/system/cron-hourly.timer:9: Unknown=
 key name 'ConditionPathExists' in section 'Timer', ignoring.
[   10.876143] systemd[1]: /lib/systemd/system/cron-failure@.service:11: Sp=
ecial user nobody configured, this is not safe!
[   10.944037] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-pivot.service:30: Standard output type syslog is obsolete, automatica=
lly updating to journal. Please update your unit file, and consider removin=
g the setting altogether.
[   10.980159] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-pivot.service:31: Standard output type syslog+console is obsolete, au=
tomatically updating to journal+console. Please update your unit file, and =
consider removing the setting altogether.
[   11.041888] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-udev.service:27: Standard output type syslog is obsolete, automatical=
ly updating to journal. Please update your unit file, and consider removing=
 the setting altogether.
[   11.080666] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-udev.service:28: Standard output type syslog+console is obsolete, aut=
omatically updating to journal+console. Please update your unit file, and c=
onsider removing the setting altogether.
[   11.142094] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-trigger.service:23: Standard output type syslog is obsolete, automati=
cally updating to journal. Please update your unit file, and consider remov=
ing the setting altogether.
[   11.182664] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-pre-trigger.service:24: Standard output type syslog+console is obsolete, =
automatically updating to journal+console. Please update your unit file, an=
d consider removing the setting altogether.
[   11.246340] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-cmdline.service:26: Standard output type syslog is obsolete, automaticall=
y updating to journal. Please update your unit file, and consider removing =
the setting altogether.
[   11.289351] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracu=
t-cmdline.service:27: Standard output type syslog+console is obsolete, auto=
matically updating to journal+console. Please update your unit file, and co=
nsider removing the setting altogether.
[   11.451709] systemd[1]: initrd-switch-root.service: Succeeded.
[   11.473485] systemd[1]: Stopped Switch Root.
[   11.515550] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 1.
[   11.536501] systemd[1]: Created slice system-getty.slice.
[   11.577113] systemd[1]: Created slice system-modprobe.slice.
[   11.616827] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   11.655666] systemd[1]: Created slice User and Session Slice.
[   11.693338] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[   11.730580] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[   11.768526] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[   11.806172] systemd[1]: Reached target Local Encrypted Volumes.
[   11.843359] systemd[1]: Stopped target Switch Root.
[   11.879668] systemd[1]: Stopped target Initrd File Systems.
[   11.915271] systemd[1]: Stopped target Initrd Root File System.
[   11.950456] systemd[1]: Reached target User and Group Name Lookups.
[   11.984890] systemd[1]: Reached target Remote File Systems.
[   12.018439] systemd[1]: Reached target Slices.
[   12.050996] systemd[1]: Listening on fsck to fsckd communication Socket.
[   12.082729] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   12.114710] systemd[1]: Listening on Network Service Netlink Socket.
[   12.145056] systemd[1]: Listening on udev Control Socket.
[   12.174197] systemd[1]: Listening on udev Kernel Socket.
[   12.222713] systemd[1]: Mounting Huge Pages File System...
[   12.251615] systemd[1]: Mounting POSIX Message Queue File System...
[   12.279651] systemd[1]: Mounting Kernel Debug File System...
[   12.306920] systemd[1]: Mounting Kernel Trace File System...
[   12.346792] systemd[1]: Starting Set the console keyboard layout...
[   12.374218] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[   12.402313] systemd[1]: Starting Load Kernel Module drm...
[   12.447298] ACPI: bus type drm_connector registered
[   12.474809] systemd[1]: Starting nftables...
[   12.501863] systemd[1]: Condition check resulted in Set Up Additional Bi=
nary Formats being skipped.
[   12.515172] systemd[1]: Stopped Journal Service.
[   12.554845] systemd[1]: Starting Journal Service...
[   12.585471] systemd[1]: Starting Load Kernel Modules...
[   12.614566] systemd[1]: Starting Remount Root and Kernel File Systems...
[   12.642675] systemd[1]: Starting Coldplug All udev Devices...
[   12.665104] EXT4-fs (sda2): re-mounted. Quota mode: none.
[   12.693047] systemd[1]: sysroot.mount: Succeeded.
[   12.706533] systemd[1]: Started Journal Service.
[   12.886314] Adding 4718588k swap on /HIBERFIL.SYS.  Priority:-2 extents:=
59 across:7757820k SSFS
[   13.416194] EXT4-fs (sda3): mounted filesystem with ordered data mode. Q=
uota mode: none.
[   13.503844] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input5
[   13.520781] ACPI: button: Power Button [PWRB]
[   13.531189] ACPI: AC: AC Adapter [ACAD] (on-line)
[   13.550379] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input6
[   13.570749] ACPI: button: Lid Switch [LID]
[   13.588841] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input7
[   13.622951] toshiba_haps: Toshiba HDD Active Protection Sensor device
[   13.652845] ACPI: button: Power Button [PWRF]
[   13.712521] sky2: driver version 1.30
[   13.740608] sky2 0000:07:00.0: enabling device (0000 -> 0003)
[   13.753256] toshiba_bluetooth: Toshiba ACPI Bluetooth device driver
[   13.802406] sky2 0000:07:00.0: Yukon-2 Extreme chip revision 2
[   13.802855] sky2 0000:07:00.0 eth0: addr 00:23:8b:10:3d:d6
[   13.811938] ACPI Warning: SystemIO range 0x0000000000000428-0x0000000000=
00042F conflicts with OpRegion 0x0000000000000400-0x000000000000047F (\PMIO=
) (20220331/utaddress-204)
[   13.811947] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.811952] ACPI Warning: SystemIO range 0x00000000000011B0-0x0000000000=
0011BF conflicts with OpRegion 0x0000000000001180-0x00000000000011BB (\GPIO=
) (20220331/utaddress-204)
[   13.811957] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.811959] ACPI Warning: SystemIO range 0x0000000000001180-0x0000000000=
0011AF conflicts with OpRegion 0x0000000000001180-0x00000000000011BB (\GPIO=
) (20220331/utaddress-204)
[   13.811963] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?
[   13.811964] lpc_ich: Resource conflict(s) found affecting gpio_ich
[   13.910622] mc: Linux media interface: v0.10
[   13.972437] input: PC Speaker as /devices/platform/pcspkr/input/input9
[   13.972859] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[   13.979824] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   13.983017] sr 1:0:0:0: Attached scsi generic sg1 type 5
[   13.991227] toshiba_acpi: Toshiba Laptop ACPI Extras version 0.24
[   13.998424] videodev: Linux video capture interface: v2.00
[   14.056404] intel_powerclamp: No package C-state available
[   14.057803] input: Toshiba input device as /devices/virtual/input/input13
[   14.108584] toshiba_acpi: Supported laptop features: hotkeys touchpad co=
oling-method
[   14.229942] sky2 0000:07:00.0 lan1: renamed from eth0
[   14.257264] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   14.258341] cfg80211: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0=
e820821ba7b54b4961b8b4fadf'
[   14.258747] intel_powerclamp: No package C-state available
[   14.259387] cfg80211: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6=
ec146e09d1b6016ab9d6cf71dd233f0328'
[   14.260448] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   14.263476] platform regulatory.0: firmware: failed to load regulatory.d=
b (-2)
[   14.263483] firmware_class: See https://wiki.debian.org/Firmware for inf=
ormation about missing firmware
[   14.263509] platform regulatory.0: firmware: failed to load regulatory.d=
b (-2)
[   14.263511] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[   14.263516] cfg80211: failed to load regulatory.db
[   14.369913] usb 7-1: new full-speed USB device number 2 using uhci_hcd
[   14.377998] iTCO_vendor_support: vendor-support=3D0
[   14.396639] iTCO_wdt iTCO_wdt.1.auto: Found a ICH9M TCO device (Version=
=3D2, TCOBASE=3D0x0460)
[   14.396786] iTCO_wdt iTCO_wdt.1.auto: initialized. heartbeat=3D30 sec (n=
owayout=3D0)
[   14.406101] usb 4-4: Found UVC 1.00 device CNA7137 (04f2:b064)
[   14.435657] input: CNA7137: Chicony USB 2.0 Camera as /devices/pci0000:0=
0/0000:00:1d.7/usb4/4-4/4-4:1.0/input/input14
[   14.435885] usbcore: registered new interface driver uvcvideo
[   14.438857] Intel(R) Wireless WiFi driver for Linux
[   14.438929] iwlwifi 0000:08:00.0: enabling device (0000 -> 0002)
[   14.439069] iwlwifi 0000:08:00.0: can't disable ASPM; OS doesn't have AS=
PM control
[   14.453136] iwlwifi 0000:08:00.0: firmware: direct-loading firmware iwlw=
ifi-5000-5.ucode
[   14.453362] iwlwifi 0000:08:00.0: loaded firmware version 8.83.5.1 build=
 33692 5000-5.ucode op_mode iwldvm
[   14.752711] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] enable_g=
uc=3D0 (guc:no submission:no huc:no slpc:no)
[   14.752872] i915 0000:00:02.0: [drm:intel_detect_pch [i915]] No PCH foun=
d.
[   14.752989] i915 0000:00:02.0: [drm:intel_power_domains_init [i915]] All=
owed DC state mask 00
[   14.753156] i915 0000:00:02.0: [drm:intel_device_info_runtime_init [i915=
]] rawclk rate: 266667 kHz
[   14.753278] i915 0000:00:02.0: [drm:intel_engine_context_size [i915]] gr=
aphics_ver =3D 4 CXT_SIZE =3D 2688 bytes [0x00000029]
[   14.753418] pci 0000:00:00.0: Intel GM45 Chipset
[   14.753440] pci 0000:00:00.0: detected gtt size: 2097152K total, 262144K=
 mappable
[   14.753822] pci 0000:00:00.0: detected 131072K stolen memory
[   14.753866] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] GGTT size=
 =3D 2048M
[   14.754049] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] GMADR siz=
e =3D 256M
[   14.754174] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] DSM size =
=3D 128M
[   14.798698] snd_hda_codec_conexant hdaudioC0D0: CX20561 (Hermosa): BIOS =
auto-probing.
[   14.800933] snd_hda_codec_conexant hdaudioC0D0: autoconfig for CX20561 (=
Hermosa): line_outs=3D1 (0x1a/0x0/0x0/0x0/0x0) type:speaker
[   14.800939] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[   14.800942] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=3D1 (0x16/0x0=
/0x0/0x0/0x0)
[   14.800945] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=3D0x0
[   14.800947] snd_hda_codec_conexant hdaudioC0D0:    dig-out=3D0x1c/0x0
[   14.800949] snd_hda_codec_conexant hdaudioC0D0:    inputs:
[   14.800950] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=3D0x1d
[   14.800953] snd_hda_codec_conexant hdaudioC0D0:      Mic=3D0x17
[   14.807897] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.=
0/sound/card0/input15
[   14.808053] input: HDA Intel Mic as /devices/pci0000:00/0000:00:1b.0/sou=
nd/card0/input16
[   14.808130] input: HDA Intel Front Headphone as /devices/pci0000:00/0000=
:00:1b.0/sound/card0/input17
[   14.929483] usb 7-1: New USB device found, idVendor=3D0930, idProduct=3D=
0200, bcdDevice=3D 1.44
[   15.005701] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEBUG disabled
[   15.016620] usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   15.016624] usb 7-1: Product: TAIYO YUDEN for Toshiba(0x0200)
[   15.016626] usb 7-1: Manufacturer: Broadcom Corp
[   15.016628] usb 7-1: SerialNumber: 00037A99A734
[   15.092144] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEBUGFS disabled
[   15.092155] iwlwifi 0000:08:00.0: CONFIG_IWLWIFI_DEVICE_TRACING disabled
[   15.092157] iwlwifi 0000:08:00.0: Detected Intel(R) WiFi Link 5100 AGN, =
REV=3D0x54
[   15.144183] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
[   15.147019] iwlwifi 0000:08:00.0 wifi1: renamed from wlan0
[   15.213610] Console: switching to colour dummy device 80x25
[   15.214941] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
[   15.215239] i915 0000:00:02.0: vgaarb: deactivate vga console
[   15.218783] i915 0000:00:02.0: [drm:i915_gem_init_stolen [i915]] CTG_STO=
LEN_RESERVED =3D 00000002
[   15.218963] i915 0000:00:02.0: [drm:i915_gem_init_stolen [i915]] Memory =
reserved for graphics device: 131072K, usable: 131072K
[   15.219111] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] graphic=
 opregion physical addr: 0xb5f71020
[   15.219263] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ACPI Op=
Region version 2.0.0
[   15.219404] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] Public =
ACPI methods supported
[   15.219544] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] SWSCI M=
ailbox #2 present for opregion v2.x
[   15.219683] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] SWSCI s=
upported
[   15.224561] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] SWSCI B=
IOS requested (00000241) SBCB callbacks that are not supported (00000001)
[   15.224741] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] SWSCI G=
BDA callbacks 00000cf3, SBCB callbacks 00000241
[   15.224882] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ASLE su=
pported
[   15.225022] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ASLE ex=
tension supported
[   15.225162] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] Found v=
alid VBT in ACPI OpRegion (Mailbox #4)
[   15.240717] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Set default =
to SSC at 100000 kHz
[   15.240899] i915 0000:00:02.0: [drm:intel_bios_init [i915]] VBT signatur=
e "$VBT CANTIGA        ", BDB version 141
[   15.241052] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 1 (size 5, min size 7)
[   15.241198] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 2 (size 269, min size 5)
[   15.241343] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 12 (size 17, min size 19)
[   15.241488] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 22 (size 23, min size 22)
[   15.241632] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 23 (size 72, min size 72)
[   15.241783] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 40 (size 16, min size 34)
[   15.241928] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 41 (size 145, min size 148)
[   15.242074] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 42 (size 1184, min size 1184)
[   15.242219] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 43 (size 97, min size 305)
[   15.242377] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 44 (size 21, min size 78)
[   15.242523] i915 0000:00:02.0: [drm:intel_bios_init [i915]] BDB_GENERAL_=
FEATURES int_tv_support 1 int_crt_support 1 lvds_use_ssc 1 lvds_ssc_freq 96=
000 display_clock_mode 0 fdi_rx_polarity_inverted 0
[   15.242668] i915 0000:00:02.0: [drm:intel_bios_init [i915]] crt_ddc_bus_=
pin: 2
[   15.242812] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x1009
[   15.242957] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x1022
[   15.243108] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x60d2
[   15.243253] i915 0000:00:02.0: [drm:intel_bios_init [i915]] No SDVO devi=
ce info is found in VBT
[   15.243397] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port B VBT i=
nfo: CRT:0 DVI:1 HDMI:1 DP:0 eDP:0 LSPCON:0 USB-Type-C:0 TBT:0 DSC:0
[   15.243547] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling always-on
[   15.243727] i915 0000:00:02.0: [drm:intel_fbc_init [i915]] Sanitized ena=
ble_fbc value: 0
[   15.243884] i915 0000:00:02.0: [drm:intel_init_pm [i915]] SAGV supported=
: no, original SAGV block time: 0 us
[   15.249830] i915 0000:00:02.0: [drm:intel_modeset_init_nogem [i915]] 2 d=
isplay pipes available.
[   15.250062] i915 0000:00:02.0: [drm:intel_hpll_vco [i915]] HPLL VCO 3200=
000 kHz
[   15.250209] i915 0000:00:02.0: [drm:intel_cdclk_dump_config [i915]] Curr=
ent CDCLK 320000 kHz, VCO 3200000 kHz, ref 0 kHz, bypass 0 kHz, voltage lev=
el 0
[   15.250378] i915 0000:00:02.0: [drm:intel_update_max_cdclk [i915]] Max C=
D clock rate: 320000 kHz
[   15.250523] i915 0000:00:02.0: [drm:intel_update_max_cdclk [i915]] Max d=
otclock rate: 288000 kHz
[   15.251878] i915 0000:00:02.0: [drm:intel_lvds_init [i915]] LVDS PPS:t1+=
t2 400 t3 400 t4 4000 t5 4000 tx 2500 divider 15999 port 0 powerdown_on_res=
et 0
[   15.267619] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.267651] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.267670] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   15.267687] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   15.267723] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.268011] i915 0000:00:02.0: [drm:intel_opregion_get_panel_type [i915]=
] Ignoring OpRegion panel type (6)
[   15.268174] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (VBT): 13
[   15.268319] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (PNPID): 13
[   15.268463] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (fallback): 0
[   15.268607] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Select=
ed panel type (VBT): 13
[   15.268751] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] DRRS s=
upported mode is static
[   15.268896] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Found =
panel mode in BIOS VBT legacy lfp table: "1280x800": 60 71000 1280 1328 136=
0 1440 800 803 809 823 0x8 0xa
[   15.269049] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] VBT in=
itial LVDS value 42300300
[   15.269193] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] PWM ba=
cklight not present in VBT (type 0)
[   15.269338] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Found =
SDVO panel mode in BIOS VBT tables: "1600x1200": 60 162000 1600 1664 1856 2=
160 1200 1201 1204 1250 0x8 0xa
[   15.269484] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] DRRS S=
tate Enabled:0
[   15.269628] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] No PSR=
 BDB found.
[   15.269772] i915 0000:00:02.0: [drm:intel_panel_add_edid_fixed_modes [i9=
15]] [CONNECTOR:61:LVDS-1] using preferred EDID fixed mode: "1280x800": 60 =
71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   15.269916] i915 0000:00:02.0: [drm:intel_panel_init [i915]] [CONNECTOR:=
61:LVDS-1] DRRS type: none
[   15.270055] i915 0000:00:02.0: [drm:intel_backlight_setup [i915]] no bac=
klight present per VBT
[   15.270197] i915 0000:00:02.0: [drm:intel_lvds_init [i915]] detected sin=
gle-link lvds configuration
[   15.274342] i915 0000:00:02.0: [drm:intel_modeset_init_nogem [i915]] pro=
bing SDVOB
[   15.274495] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   15.276653] [drm:intel_sdvo_read_byte.isra.0 [i915]] i2c transfer return=
ed -6
[   15.276796] i915 0000:00:02.0: [drm:intel_sdvo_init [i915]] No SDVO devi=
ce found on SDVOB
[   15.277035] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   15.277177] i915 0000:00:02.0: [drm:intel_modeset_init_nogem [i915]] pro=
bing HDMI on SDVOB
[   15.277324] i915 0000:00:02.0: [drm:intel_bios_port_aux_ch [i915]] using=
 AUX B for port B (VBT)
[   15.277474] i915 0000:00:02.0: [drm:intel_hdmi_init_connector [i915]] Ad=
ding HDMI connector on [ENCODER:67:HDMI B]
[   15.277615] i915 0000:00:02.0: [drm:intel_hdmi_init_connector [i915]] Us=
ing DDC pin 0x5 for port B (VBT)
[   15.277795] i915 0000:00:02.0: [drm:intel_bios_port_aux_ch [i915]] using=
 AUX B for port B (VBT)
[   15.277941] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:74:DP B]
[   15.278101] i915 0000:00:02.0: [drm:intel_modeset_init_nogem [i915]] pro=
bing SDVOC
[   15.278258] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   15.283397] [drm:intel_sdvo_read_byte.isra.0 [i915]] i2c transfer return=
ed -6
[   15.283555] i915 0000:00:02.0: [drm:intel_sdvo_init [i915]] No SDVO devi=
ce found on SDVOC
[   15.283829] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   15.283977] i915 0000:00:02.0: [drm:intel_bios_port_aux_ch [i915]] using=
 AUX D for port D (platform default)
[   15.284123] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:79:DP D]
[   15.284343] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:45:pipe A] hw state readout: disabled
[   15.284496] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:60:pipe B] hw state readout: enabled
[   15.284640] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:31:primary A] hw state readout: disabled, pipe A
[   15.284783] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:35:sprite A] hw state readout: disabled, pipe A
[   15.284926] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:41:cursor A] hw state readout: disabled, pipe A
[   15.285069] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:46:primary B] hw state readout: enabled, pipe B
[   15.285212] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:50:sprite B] hw state readout: disabled, pipe B
[   15.285379] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:56:cursor B] hw state readout: disabled, pipe B
[   15.285526] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:62:LVDS] hw state readout: enabled, pipe B
[   15.285669] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:66:CRT] hw state readout: disabled, pipe B
[   15.285812] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:67:HDMI B] hw state readout: disabled, pipe A
[   15.285956] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:74:DP B] hw state readout: disabled, pipe A
[   15.286099] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:79:DP D] hw state readout: disabled, pipe A
[   15.286264] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:84:TV] hw state readout: disabled, pipe A
[   15.288137] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:61:LVDS-1] hw state readout: enabled
[   15.288292] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:64:VGA-1] hw state readout: disabled
[   15.288436] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:68:HDMI-A-1] hw state readout: disabled
[   15.288579] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:75:DP-1] hw state readout: disabled
[   15.289823] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:80:DP-2] hw state readout: disabled
[   15.289969] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:83:SVIDEO-1] hw state readout: disabled
[   15.290111] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:31:primary A] min_cdclk 0 kHz
[   15.290265] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:35:sprite A] min_cdclk 0 kHz
[   15.290408] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:41:cursor A] min_cdclk 0 kHz
[   15.290550] i915 0000:00:02.0: [drm:intel_bw_crtc_update [i915]] pipe A =
data rate 0 num active planes 0
[   15.290699] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:46:primary B] min_cdclk 70857 kHz
[   15.290841] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:50:sprite B] min_cdclk 0 kHz
[   15.290988] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:56:cursor B] min_cdclk 0 kHz
[   15.291130] i915 0000:00:02.0: [drm:intel_bw_crtc_update [i915]] pipe B =
data rate 283428 num active planes 1
[   15.291284] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: no [setup_hw_state]
[   15.291430] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [setup_hw_state]
[   15.291575] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: LVDS (0x10), output format: RGB
[   15.291720] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   15.291865] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   15.292009] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   15.292153] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   15.292297] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   15.292441] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   15.292585] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   15.292730] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   15.292876] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "1280x800": 60 70857 1024 1328 1360 1440 768 803 809 823 0x40 0xa
[   15.293022] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "1280x800": 60 70857 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   15.293169] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 70857 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   15.293316] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "1280x800": 60 70857 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   15.293462] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 70857 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   15.293608] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 70857, pipe src: 1024x768+0+0, pixel rate 70857
[   15.293753] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   15.293897] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0xa0000000, ratios: 0x0f5c0ccd, lvds border: 0x00008000
[   15.294042] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   15.294187] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x98046c00, dpll_md: 0x3, fp0: 0x21507, fp1: 0x31108
[   15.294348] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   15.294493] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   15.294640] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
watermarks: pipe A, plane=3D15, cursor=3D15, sprite=3D15
[   15.294758] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
watermarks: pipe B, plane=3D15, cursor=3D15, sprite=3D15
[   15.294875] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
SR watermarks: plane=3D127, cursor=3D0 fbc=3D1
[   15.294993] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
HPLL watermarks: plane=3D0, SR cursor=3D0 fbc=3D5
[   15.295110] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
SR=3Dno HPLL=3Dno FBC=3Dno
[   15.300633] i915 0000:00:02.0: [drm:i9xx_get_initial_plane_config [i915]=
] pipe B/primary B with fb: size=3D1024x768@32, offset=3D0, pitch 4096, siz=
e 0x300000
[   15.300799] i915 0000:00:02.0: [drm:_i915_gem_object_stolen_init [i915]]=
 creating preallocated stolen object: stolen_offset=3D0x0000000000000000, s=
ize=3D0x0000000000300000
[   15.300976] i915 0000:00:02.0: [drm:i915_init_ggtt [i915]] Reserved GGTT=
:[301000, 302000] for use by error capture
[   15.301103] i915 0000:00:02.0: [drm:i915_init_ggtt [i915]] clearing unus=
ed GTT space: [302000, 80000000]
[   15.304587] i915 0000:00:02.0: [drm:i915_init_ggtt [i915]] clearing unus=
ed GTT space: [300000, 301000]
[   15.310291] [drm:wa_init_finish [i915]] Initialized 2 GT workarounds on =
global
[   15.310526] [drm:wa_init_finish [i915]] Initialized 2 engine workarounds=
 on rcs'0
[   15.312973] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] primary =
B watermarks: normal=3D25, SR=3D56, HPLL=3D130
[   15.313133] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] FBC wate=
rmarks: SR=3D3, HPLL=3D5
[   15.320466] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   15.320833] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] [CRTC:45:pi=
pe A] not active, skipping
[   15.320978] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] found possi=
ble fb from [PLANE:46:primary B]
[   15.321119] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] [CRTC:45:pi=
pe A] not active, skipping
[   15.321259] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] checking [P=
LANE:46:primary B] for BIOS fb
[   15.321400] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] fb not wide=
 enough for [PLANE:46:primary B] (5120 vs 4096)
[   15.321548] i915 0000:00:02.0: [drm:intel_fbdev_init [i915]] BIOS fb not=
 suitable for all pipes, not using
[   15.321741] [drm:intel_engines_driver_register [i915]] renamed rcs'0 to =
rcs0
[   15.321868] [drm:intel_engines_driver_register [i915]] renamed vcs'0 to =
vcs0
[   15.323501] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:61:LVDS-1] generating connector hotplug event
[   15.323742] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:64:VGA-1] generating connector hotplug event
[   15.324149] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:68:HDMI-A-1] generating connector hotplug event
[   15.324383] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX B/DP B bus for card0-DP-1
[   15.324808] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:75:DP-1] generating connector hotplug event
[   15.325061] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX D/DP D bus for card0-DP-2
[   15.325493] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:80:DP-2] generating connector hotplug event
[   15.325734] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event [d=
rm]] [CONNECTOR:83:SVIDEO-1] generating connector hotplug event
[   15.325855] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on mi=
nor 0
[   15.326132] i915 0000:00:02.0: [drm:intel_opregion_resume [i915]] 6 outp=
uts detected
[   15.327133] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[   15.379911] sky2 0000:07:00.0 lan1: enabling interface
[   15.381584] acpi device:08: registered as cooling_device2
[   15.381692] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:01/input/input18
[   15.382135] [drm:intel_dsm_detect.isra.0 [i915]] no _DSM method for inte=
l device
[   15.382334] i915 device info: pciid=3D0x2a42 rev=3D0x07 platform=3DGM45 =
(subplatform=3D0x0) gen=3D4
[   15.382339] i915 device info: graphics version: 4
[   15.382341] i915 device info: media version: 4
[   15.382343] i915 device info: display version: 4
[   15.382345] i915 device info: gt: 0
[   15.382347] i915 device info: memory-regions: 21
[   15.382349] i915 device info: page-sizes: 1000
[   15.382351] i915 device info: platform: GM45
[   15.382353] i915 device info: ppgtt-size: 0
[   15.382355] i915 device info: ppgtt-type: 0
[   15.382357] i915 device info: dma_mask_size: 36
[   15.382359] i915 device info: is_mobile: yes
[   15.382361] i915 device info: is_lp: no
[   15.382363] i915 device info: require_force_probe: no
[   15.382365] i915 device info: is_dgfx: no
[   15.382366] i915 device info: has_64bit_reloc: no
[   15.382368] i915 device info: has_64k_pages: no
[   15.382370] i915 device info: needs_compact_pt: no
[   15.382372] i915 device info: gpu_reset_clobbers_display: no
[   15.382374] i915 device info: has_reset_engine: no
[   15.382376] i915 device info: has_3d_pipeline: yes
[   15.382378] i915 device info: has_4tile: no
[   15.382380] i915 device info: has_flat_ccs: no
[   15.382381] i915 device info: has_global_mocs: no
[   15.382383] i915 device info: has_gt_uc: no
[   15.382385] i915 device info: has_heci_pxp: no
[   15.382387] i915 device info: has_heci_gscfi: no
[   15.382388] i915 device info: has_guc_deprivilege: no
[   15.382390] i915 device info: has_l3_ccs_read: no
[   15.382392] i915 device info: has_l3_dpf: no
[   15.382394] i915 device info: has_llc: no
[   15.382396] i915 device info: has_logical_ring_contexts: no
[   15.382398] i915 device info: has_logical_ring_elsq: no
[   15.382399] i915 device info: has_media_ratio_mode: no
[   15.382401] i915 device info: has_mslice_steering: no
[   15.382403] i915 device info: has_one_eu_per_fuse_bit: no
[   15.382405] i915 device info: has_pooled_eu: no
[   15.382407] i915 device info: has_pxp: no
[   15.382409] i915 device info: has_rc6: no
[   15.382411] i915 device info: has_rc6p: no
[   15.382412] i915 device info: has_rps: no
[   15.382414] i915 device info: has_runtime_pm: no
[   15.382416] i915 device info: has_snoop: yes
[   15.382418] i915 device info: has_coherent_ggtt: yes
[   15.382420] i915 device info: unfenced_needs_alignment: no
[   15.382422] i915 device info: hws_needs_physical: no
[   15.382423] i915 device info: cursor_needs_physical: no
[   15.382425] i915 device info: has_cdclk_crawl: no
[   15.382427] i915 device info: has_dmc: no
[   15.382429] i915 device info: has_ddi: no
[   15.382431] i915 device info: has_dp_mst: no
[   15.382432] i915 device info: has_dsb: no
[   15.382434] i915 device info: has_dsc: no
[   15.382436] i915 device info: has_fpga_dbg: no
[   15.382438] i915 device info: has_gmch: yes
[   15.382440] i915 device info: has_hdcp: no
[   15.382441] i915 device info: has_hotplug: yes
[   15.382443] i915 device info: has_hti: no
[   15.382445] i915 device info: has_ipc: no
[   15.382447] i915 device info: has_modular_fia: no
[   15.382449] i915 device info: has_overlay: no
[   15.382451] i915 device info: has_psr: no
[   15.382453] i915 device info: has_psr_hw_tracking: no
[   15.382454] i915 device info: overlay_needs_physical: no
[   15.382456] i915 device info: supports_tv: yes
[   15.382458] i915 device info: rawclk rate: 266667 kHz
[   15.382460] i915 device info: iommu: disabled
[   15.382463] i915 device info: available engines: 401
[   15.382465] i915 device info: slice total: 0, mask=3D0000
[   15.382468] i915 device info: subslice total: 0
[   15.382470] i915 device info: EU total: 0
[   15.382472] i915 device info: EU per subslice: 0
[   15.382474] i915 device info: has slice power gating: no
[   15.382475] i915 device info: has subslice power gating: no
[   15.382477] i915 device info: has EU power gating: no
[   15.382565] [drm:drm_client_modeset_probe [drm]]=20
[   15.382587] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   15.382599] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] status updated from unknown to connected
[   15.382613] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   15.382637] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   15.382654] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   15.382705] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   15.382713] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   15.382733] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   15.382742] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   15.389763] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   15.390084] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   15.390226] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   15.390549] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   15.390588] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   15.390732] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   15.390752] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   15.390898] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   15.391575] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   15.391594] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   15.391734] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   15.391879] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] status updated from unknown to disconnected
[   15.391893] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   15.391906] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   15.391920] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   15.392238] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   15.392385] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   15.392697] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   15.392842] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   15.392860] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   15.393000] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   15.393670] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   15.393688] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   15.394003] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   15.394145] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   15.394753] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   15.394917] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   15.394931] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] status updated from unknown to disconnected
[   15.394942] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   15.394953] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   15.394963] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   15.398137] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.400771] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.403349] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.405919] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.408507] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.411113] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.413716] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.416691] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.419264] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.421850] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.424865] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.427548] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.430123] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.432774] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.435427] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.438069] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.440756] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.443329] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.445900] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.448469] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.451047] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.453694] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.456341] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.458987] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.461633] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.464277] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.466922] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.469567] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.472259] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.475150] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.478045] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.480972] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   15.481378] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   15.481427] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] status updated from unknown to disconnected
[   15.481457] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   15.481486] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   15.481511] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   15.481919] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] status updated from unknown to disconnected
[   15.481944] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   15.481967] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   15.481991] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   15.482412] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   15.482891] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   15.483307] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   15.483701] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   15.484105] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:45:=
pipe A] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   15.484519] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.enable (expected 0, found 1)
[   15.484933] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.active (expected 0, found 1)
[   15.485347] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   15.485761] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in framestart_delay (expected 0, found 1)
[   15.486174] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   15.486608] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   15.487022] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   15.487434] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   15.487847] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   15.488259] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   15.488671] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   15.489084] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   15.489496] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   15.489909] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   15.490336] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   15.490749] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   15.491161] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   15.491574] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   15.491986] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   15.492399] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   15.492811] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   15.493224] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   15.493636] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   15.494048] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   15.494474] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   15.494887] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   15.495298] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   15.495711] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   15.496123] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   15.496459] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pipe_bpp (expected 0, found 24)
[   15.496665] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   15.496872] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   15.497078] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in port_clock (expected 0, found 108000)
[   15.497304] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   15.497511] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   15.497772] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: yes [modeset]
[   15.497979] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   15.498185] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: A, pipe bpp: 24, dithering: 0
[   15.498401] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   15.498606] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   15.498811] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   15.499016] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   15.499221] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   15.499425] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   15.499631] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   15.499837] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   15.500045] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   15.500253] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   15.500461] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   15.500669] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   15.500876] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   15.501082] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   15.501287] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   15.501492] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   15.501697] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   15.501903] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   15.502108] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   15.502351] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   15.502553] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   15.502753] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   15.502953] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   15.503153] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   15.503353] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   15.504185] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   15.504353] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe A
[   15.517342] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   15.518256] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   15.518483] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:45:pipe A]
[   15.518707] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   15.533809] input: AlpsPS/2 ALPS GlidePoint as /devices/platform/i8042/s=
erio4/input/input12
[   15.584483] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 c00d7, 700000aa
[   15.584716] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   15.589408] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   15.589650] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.enable (expected 1, found 0)
[   15.589857] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.active (expected 1, found 0)
[   15.590063] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in cpu_transcoder (expected 0, found -1)
[   15.590290] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   15.590498] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in framestart_delay (expected 1, found 0)
[   15.590705] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   15.590912] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   15.591118] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   15.591324] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   15.591531] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   15.591737] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   15.591944] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   15.592150] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   15.592357] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   15.592563] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   15.592769] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   15.592975] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   15.593182] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   15.593388] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   15.593594] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   15.593800] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   15.594007] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   15.594214] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   15.594431] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   15.594638] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   15.594844] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   15.595050] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   15.595257] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   15.595463] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   15.595669] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   15.595876] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pipe_bpp (expected 24, found 0)
[   15.596083] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   15.596289] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   15.596495] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in port_clock (expected 108000, found 0)
[   15.596713] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   15.596919] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   15.597129] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: no [modeset]
[   15.597390] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe A
[   15.602616] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   15.602761] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   15.602903] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   15.603044] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   15.603185] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   15.603326] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   15.603468] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   15.603623] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:45:pipe A]
[   15.603798] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] status updated from unknown to disconnected
[   15.603810] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   15.603820] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   15.603839] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   15.603854] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   15.603868] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   15.603883] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   15.603897] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   15.603923] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   15.603940] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   15.603955] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   15.603970] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   15.603984] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 8192x=
8192 config
[   15.604001] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   15.604019] i915 0000:00:02.0: [drm:__drm_fb_helper_initial_config_and_u=
nlock [drm_kms_helper]] test CRTC 0 primary plane
[   15.604029] i915 0000:00:02.0: [drm:__drm_fb_helper_initial_config_and_u=
nlock [drm_kms_helper]] test CRTC 1 primary plane
[   15.604038] i915 0000:00:02.0: [drm:intelfb_create [i915]] no BIOS fb, a=
llocating a new one
[   15.605082] i915 0000:00:02.0: [drm:intelfb_create [i915]] allocated 128=
0x800 fb: 0x00311000
[   15.605332] fbcon: i915drmfb (fb0) is primary device
[   15.605451] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:61:LVDS-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0, m=
ax platform bpp 30)
[   15.605601] i915 0000:00:02.0: [drm:intel_lvds_compute_config [i915]] fo=
rcing display bpp (was 24) to LVDS (18)
[   15.605743] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:45:=
pipe A] hw max bpp: 24, pipe bpp: 18, dithering: 1
[   15.606964] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.enable (expected 0, found 1)
[   15.607122] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.active (expected 0, found 1)
[   15.607267] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in cpu_transcoder (expected -1, found 0)
[   15.607414] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000010)
[   15.607560] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in framestart_delay (expected 0, found 1)
[   15.607705] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 1280)
[   15.607851] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 1=
440)
[   15.607996] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 1280)
[   15.608149] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 1440)
[   15.608294] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 1328)
[   15.608440] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 1360)
[   15.608585] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 800)
[   15.608731] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 8=
23)
[   15.608876] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 800)
[   15.609021] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 823)
[   15.609166] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 803)
[   15.609311] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 809)
[   15.609456] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 1280)
[   15.609601] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 1440)
[   15.609747] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 1280)
[   15.609892] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 1440)
[   15.610037] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 1328)
[   15.610182] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 1360)
[   15.610342] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 800)
[   15.610488] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 823)
[   15.610633] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 800)
[   15.610778] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 823)
[   15.610923] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 803)
[   15.611069] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 809)
[   15.611214] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   15.611359] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (2) (expected 0, found=
 2)
[   15.611505] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (8) (expected 0, found=
 8)
[   15.611651] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pipe_bpp (expected 0, found 18)
[   15.611796] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 71=
000)
[   15.611942] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 71000)
[   15.612087] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in port_clock (expected 0, found 71000)
[   15.612233] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] in=
itial modeset and fastboot not set
[   15.612377] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   15.612522] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   15.612667] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   15.612812] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000010, found 0x00=
000000)
[   15.612958] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   15.613103] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 1280, fo=
und 0)
[   15.613248] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 1440, foun=
d 0)
[   15.613393] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 1280=
, found 0)
[   15.613538] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 1440, =
found 0)
[   15.613684] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 1328,=
 found 0)
[   15.613829] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 1360, f=
ound 0)
[   15.613974] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 800, fou=
nd 0)
[   15.614119] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 823, found=
 0)
[   15.614273] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 800,=
 found 0)
[   15.614419] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 823, f=
ound 0)
[   15.614564] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 803, =
found 0)
[   15.614709] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 809, fo=
und 0)
[   15.614855] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 1280=
, found 0)
[   15.615000] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 1440, =
found 0)
[   15.615145] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
1280, found 0)
[   15.615290] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 14=
40, found 0)
[   15.615435] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 1=
328, found 0)
[   15.615581] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 136=
0, found 0)
[   15.615726] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 800,=
 found 0)
[   15.615871] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 823, f=
ound 0)
[   15.616016] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
800, found 0)
[   15.616161] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 82=
3, found 0)
[   15.616307] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 8=
03, found 0)
[   15.616452] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 809=
, found 0)
[   15.616597] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   15.616742] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.flags (2) (expected 2, found=
 0)
[   15.616887] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.flags (8) (expected 8, found=
 0)
[   15.617033] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in gmch_pfit.control (expected 0xa0000000, found=
 0x00000000)
[   15.617179] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in gmch_pfit.lvds_border_bits (expected 0x000080=
00, found 0x00000000)
[   15.617324] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   15.617469] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 70857, foun=
d 0)
[   15.617615] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 70857, =
found 0)
[   15.617760] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 70857, found 0)
[   15.619344] i915 0000:00:02.0: [drm:intel_plane_calc_min_cdclk [i915]] [=
PLANE:31:primary A] min cdclk (71000 kHz) > [CRTC:45:pipe A] min cdclk (0 k=
Hz)
[   15.619509] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   15.619654] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   15.619800] i915 0000:00:02.0: [drm:g4x_crtc_compute_clock [i915]] using=
 SSC reference clock of 96000 kHz
[   15.619976] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] primary =
A watermarks: normal=3D25, SR=3D56, HPLL=3D158
[   15.620102] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] FBC wate=
rmarks: SR=3D3, HPLL=3D4
[   15.620220] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] primary =
B watermarks: normal=3D0, SR=3D0, HPLL=3D0
[   15.620338] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] FBC wate=
rmarks: SR=3D0, HPLL=3D0
[   15.620456] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: yes [modeset]
[   15.620602] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: LVDS (0x10), output format: RGB
[   15.620746] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: A, pipe bpp: 18, dithering: 1
[   15.620891] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   15.621035] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   15.621179] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   15.621323] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   15.621468] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   15.621612] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   15.621757] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   15.621903] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   15.622050] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   15.622196] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 71000 1280 1328 1360 1440 800 803 809 823, type: 0x48 flags: 0xa
[   15.622359] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   15.622506] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 71000 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   15.622652] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 71000, pipe src: 1280x800+0+0, pixel rate 71000
[   15.622798] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   15.622942] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   15.623087] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   15.623231] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x98046c04, dpll_md: 0x0, fp0: 0x21507, fp1: 0x21507
[   15.623376] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   15.623520] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   15.623665] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:31:primary A] fb: [FB:100] 1280x800 format =3D XR24 little-endian (0x34325=
258) modifier =3D 0x0, visible: yes
[   15.623812] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	rotat=
ion: 0x1, scaler: -1
[   15.623956] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	src: =
1280.000000x800.000000+0.000000+0.000000 dst: 1280x800+0+0
[   15.624103] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:35:sprite A] fb: [NOFB], visible: no
[   15.624247] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:41:cursor A] fb: [NOFB], visible: no
[   15.624392] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   15.624536] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:46:primary B] fb: [NOFB], visible: no
[   15.624680] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:50:sprite B] fb: [NOFB], visible: no
[   15.624825] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:56:cursor B] fb: [NOFB], visible: no
[   15.625037] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was disabled)
[   15.917050] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   15.930826] i915 0000:00:02.0: [drm:i9xx_crtc_disable [i915]] disabling =
pfit, current: 0xa0000000
[   15.931308] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   15.931715] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   15.932128] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   15.932528] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   15.932925] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   15.933326] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   15.934358] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe A
[   16.416745] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   16.417134] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:61:LVDS-1]
[   16.417557] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:45:pipe A]
[   16.418008] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   16.419905] Console: switching to colour frame buffer device 160x50
[   16.434900] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[   16.454345] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event.part.0 [=
drm_kms_helper]]=20
[   16.454387] [drm:drm_client_modeset_probe [drm]]=20
[   16.454446] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   16.454481] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   16.454535] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   16.454585] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   16.454724] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   16.454749] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   16.454803] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   16.454828] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   16.469672] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   16.470078] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   16.470178] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   16.471684] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   16.471788] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.471816] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   16.471915] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   16.480587] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.480620] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   16.480722] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   16.480823] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   16.480841] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   16.480854] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   16.481150] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   16.481249] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   16.481525] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   16.481626] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.481652] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   16.481747] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   16.487411] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.487445] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   16.487736] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   16.487837] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   16.488115] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   16.488218] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   16.488234] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   16.488252] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   16.488265] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   16.490896] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.493459] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.496028] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.500191] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.503365] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.505899] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.508964] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.511496] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.514033] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.519713] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.523141] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.526593] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.529098] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.531922] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.534563] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.537063] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.540464] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.543114] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.547818] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.581151] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.601391] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.604226] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.607095] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.609615] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.612339] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.615052] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.617556] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.620347] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.621260] Bluetooth: Core ver 2.22
[   16.621302] NET: Registered PF_BLUETOOTH protocol family
[   16.621304] Bluetooth: HCI device and connection manager initialized
[   16.621437] Bluetooth: HCI socket layer initialized
[   16.621441] Bluetooth: L2CAP socket layer initialized
[   16.621450] Bluetooth: SCO socket layer initialized
[   16.623028] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.627874] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.631038] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.633929] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.634007] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   16.634024] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   16.634039] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   16.634048] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   16.634123] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   16.634131] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   16.634139] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   16.634205] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   16.634341] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   16.634423] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   16.634489] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   16.634559] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   16.634640] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   16.634719] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   16.634798] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   16.634878] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   16.634958] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   16.635037] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   16.635116] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   16.635195] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   16.635275] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   16.635354] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   16.635433] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   16.635512] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   16.635591] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   16.635670] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   16.635749] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   16.635828] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   16.635907] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   16.635986] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   16.636065] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   16.636144] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   16.636223] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   16.636302] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   16.636381] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   16.636460] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   16.636539] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   16.636618] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   16.636697] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   16.636776] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   16.636855] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   16.636934] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   16.637014] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   16.637093] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   16.637172] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   16.637251] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   16.637339] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   16.637418] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   16.637536] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   16.637615] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   16.637694] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   16.637772] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   16.637850] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   16.637928] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   16.638006] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   16.638084] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   16.638162] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   16.638260] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   16.638340] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   16.638420] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   16.638501] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   16.638581] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   16.638661] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   16.638741] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   16.638820] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   16.638898] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   16.638976] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   16.639054] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   16.639131] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   16.639209] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   16.639326] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   16.639401] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   16.639474] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   16.639547] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   16.639620] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   16.639693] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   16.642380] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   16.642444] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   16.651931] usbcore: registered new interface driver btusb
[   16.653118] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   16.653214] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   16.653302] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   16.722283] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   16.722399] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   16.727395] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   16.727537] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   16.727650] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   16.727762] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   16.727875] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   16.727988] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   16.728100] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   16.728211] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   16.728323] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   16.728435] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   16.728547] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   16.728661] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   16.728772] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   16.728884] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   16.728995] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   16.729107] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   16.729218] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   16.729329] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   16.729441] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   16.729552] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   16.729663] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   16.729777] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   16.729890] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   16.730002] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   16.730114] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   16.730226] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   16.730367] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   16.730481] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   16.730593] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   16.730705] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   16.730817] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   16.730930] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   16.731043] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   16.731155] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   16.731267] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   16.731399] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   16.731512] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   16.731628] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   16.731805] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   16.738483] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   16.738591] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   16.738695] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   16.738800] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   16.738903] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   16.739007] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   16.739111] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   16.739258] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   16.739376] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   16.739393] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   16.739417] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   16.739437] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   16.739457] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   16.739478] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   16.739498] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   16.739559] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   16.739582] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   16.739603] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   16.739623] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   16.739643] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 1280x=
800 config
[   16.739666] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   16.739762] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   16.770083] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event.part.0 [=
drm_kms_helper]]=20
[   16.770128] [drm:drm_client_modeset_probe [drm]]=20
[   16.770193] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   16.770230] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   16.770359] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   16.770414] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   16.770560] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   16.770584] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   16.770639] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   16.770665] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   16.779076] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   16.779521] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   16.779720] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   16.780120] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   16.780322] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.780377] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   16.780575] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   16.781371] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   16.781423] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   16.781617] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   16.781816] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   16.781850] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   16.781875] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   16.782287] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   16.782487] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   16.782883] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   16.783084] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.783134] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   16.783326] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   16.784069] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   16.784119] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   16.786473] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   16.786679] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   16.789702] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   16.789913] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   16.789944] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   16.789975] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   16.790000] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   16.792714] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.795449] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.798191] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.801027] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.803898] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.806644] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.809375] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.811947] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.814981] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.817544] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.820888] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.823656] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.826165] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.828795] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.831523] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.834031] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.837142] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.839694] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.842264] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.844801] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.847388] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.849993] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.852553] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.855161] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.857842] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.861256] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.863817] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.866381] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.868928] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.871473] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.874022] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.876575] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   16.876675] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   16.876694] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   16.876710] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   16.876720] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   16.876795] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   16.876804] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   16.876812] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   16.876879] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   16.876997] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   16.877079] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   16.877146] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   16.877216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   16.877296] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   16.877377] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   16.877456] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   16.877536] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   16.877616] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   16.877695] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   16.877775] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   16.877854] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   16.877934] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   16.878013] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   16.878092] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   16.878172] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   16.878304] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   16.878385] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   16.878465] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   16.878544] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   16.878624] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   16.878704] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   16.878783] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   16.878863] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   16.878942] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   16.879022] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   16.879101] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   16.879181] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   16.879261] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   16.879340] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   16.879420] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   16.879499] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   16.879579] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   16.879658] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   16.879739] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   16.879818] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   16.879898] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   16.879977] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   16.880067] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   16.880146] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   16.880267] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   16.880347] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   16.880426] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   16.880504] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   16.880582] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   16.880661] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   16.880739] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   16.880817] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   16.880895] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   16.880974] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   16.881054] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   16.881135] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   16.881216] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   16.881296] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   16.881377] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   16.881457] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   16.881536] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   16.881614] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   16.881693] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   16.881772] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   16.881849] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   16.881928] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   16.882018] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   16.882092] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   16.882166] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   16.882258] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   16.882332] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   16.882405] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   16.883123] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   16.883181] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   16.893542] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   16.893659] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   16.893749] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   16.932591] audit: type=3D1400 audit(1674747376.084:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release" =
pid=3D627 comm=3D"apparmor_parser"
[   16.936737] audit: type=3D1400 audit(1674747376.088:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be" pid=3D626 comm=3D"apparmor_parser"
[   16.939685] audit: type=3D1400 audit(1674747376.088:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be//kmod" pid=3D626 comm=3D"apparmor_parser"
[   16.943855] audit: type=3D1400 audit(1674747376.096:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/man"=
 pid=3D628 comm=3D"apparmor_parser"
[   16.946467] audit: type=3D1400 audit(1674747376.096:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter" p=
id=3D628 comm=3D"apparmor_parser"
[   16.949036] audit: type=3D1400 audit(1674747376.096:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" pi=
d=3D628 comm=3D"apparmor_parser"
[   16.963243] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   16.963337] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   16.971352] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   16.971450] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   16.971526] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   16.971601] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   16.971677] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   16.971752] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   16.971827] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   16.971902] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   16.971977] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   16.972052] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   16.972127] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   16.972201] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   16.972276] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   16.972351] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   16.972426] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   16.972500] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   16.972575] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   16.972650] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   16.972725] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   16.972799] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   16.972874] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   16.972949] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   16.973024] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   16.973098] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   16.973173] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   16.973248] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   16.973322] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   16.973397] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   16.973472] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   16.973547] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   16.973621] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   16.973697] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   16.973772] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   16.973846] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   16.973921] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   16.974004] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   16.974079] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   16.974159] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   16.978324] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   16.980667] audit: type=3D1400 audit(1674747376.132:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/i386=
-linux-gnu/lightdm/lightdm-guest-session" pid=3D630 comm=3D"apparmor_parser"
[   16.980682] audit: type=3D1400 audit(1674747376.132:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/i386=
-linux-gnu/lightdm/lightdm-guest-session//chromium" pid=3D630 comm=3D"appar=
mor_parser"
[   16.984398] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   16.984485] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   16.984558] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   16.984631] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   16.984704] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   16.984777] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   16.984851] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   16.984940] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   16.985024] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   16.985039] [drm:drm_client_modeset_probe [drm]] connector 61 enabled? y=
es
[   16.985058] [drm:drm_client_modeset_probe [drm]] connector 64 enabled? no
[   16.985073] [drm:drm_client_modeset_probe [drm]] connector 68 enabled? no
[   16.985087] [drm:drm_client_modeset_probe [drm]] connector 75 enabled? no
[   16.985101] [drm:drm_client_modeset_probe [drm]] connector 80 enabled? no
[   16.985116] [drm:drm_client_modeset_probe [drm]] connector 83 enabled? no
[   16.985142] [drm:drm_client_modeset_probe [drm]] Not using firmware conf=
iguration
[   16.985158] [drm:drm_client_modeset_probe [drm]] looking for cmdline mod=
e on connector 61
[   16.985172] [drm:drm_client_modeset_probe [drm]] looking for preferred m=
ode on connector 61 0
[   16.985187] [drm:drm_client_modeset_probe [drm]] found mode 1280x800
[   16.985201] [drm:drm_client_modeset_probe [drm]] picking CRTCs for 1280x=
800 config
[   16.985218] [drm:drm_client_modeset_probe [drm]] desired mode 1280x800 s=
et on crtc 45 (0,0)
[   16.985296] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   16.985500] audit: type=3D1400 audit(1674747376.140:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/cup=
s/backend/cups-pdf" pid=3D629 comm=3D"apparmor_parser"
[   16.985506] audit: type=3D1400 audit(1674747376.140:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin/cu=
psd" pid=3D629 comm=3D"apparmor_parser"
[   17.316281] NET: Registered PF_ALG protocol family
[   17.474059] alg: No test for hmac(md4) (hmac(md4-generic))
[   17.485008] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   17.485014] Bluetooth: BNEP filters: protocol multicast
[   17.485020] Bluetooth: BNEP socket layer initialized
[   17.488533] Bluetooth: MGMT ver 1.22
[   17.747887] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   17.870601] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   18.023717] [drm:drm_mode_addfb2 [drm]] [FB:98]
[   18.120119] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]=
] HW context 1 created
[   18.126889] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   18.126913] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   18.126937] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   18.126954] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   18.127006] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   18.127015] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   18.127215] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   18.127227] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   18.134263] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   18.134539] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   18.134643] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   18.134908] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   18.135009] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.135036] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   18.135136] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   18.135747] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.135772] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   18.135868] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   18.135969] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   18.136138] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   18.136154] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   18.136404] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   18.136502] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   18.136777] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   18.136876] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.136900] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   18.136995] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   18.137604] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.137629] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   18.137866] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   18.137966] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   18.138298] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   18.138413] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   18.138430] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   18.138625] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   18.138640] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   18.141200] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.143753] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.146314] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.149006] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.151701] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.154368] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.156906] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.159452] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.162001] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.164545] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.167072] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.169572] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.172072] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.174572] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.177070] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.179578] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.182121] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.184663] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.187205] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.189747] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.192328] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.195015] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.197696] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.200374] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.203055] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.205737] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.208420] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.211100] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.213782] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.216465] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.219149] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.221829] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.222030] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   18.222066] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   18.222466] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   18.222497] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   18.222708] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   18.222994] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   18.223024] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   18.223214] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   18.223503] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   18.223734] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   18.223922] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   18.224119] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   18.224347] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   18.224573] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   18.224799] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   18.225026] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   18.225252] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   18.225478] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   18.225703] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   18.225928] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   18.226153] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   18.226410] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   18.226636] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   18.226861] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   18.227087] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   18.227313] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   18.227538] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   18.227763] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   18.227988] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   18.228228] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   18.228455] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   18.228680] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   18.228906] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   18.229131] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   18.229356] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   18.229581] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   18.229807] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   18.230032] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   18.230273] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   18.230499] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   18.230725] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   18.230950] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   18.231177] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   18.231402] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   18.231628] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   18.231853] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   18.232229] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   18.232458] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   18.232790] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   18.233015] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   18.233202] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   18.233314] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   18.233424] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   18.233536] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   18.233647] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   18.233758] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   18.233869] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   18.233981] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   18.234094] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   18.234208] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   18.234334] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   18.234449] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   18.234563] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   18.234676] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   18.234789] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   18.234900] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   18.235011] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   18.235123] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   18.235232] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   18.235343] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   18.235479] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   18.235585] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   18.235689] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   18.235793] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   18.235897] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   18.236000] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   18.236736] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   18.236818] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   18.247194] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   18.247305] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   18.247423] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   18.316893] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   18.317108] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   18.321875] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   18.322145] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   18.322414] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   18.322642] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   18.322870] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   18.323097] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   18.323323] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   18.323550] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   18.323775] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   18.324001] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   18.324226] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   18.324451] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   18.324676] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   18.324902] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   18.325126] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   18.325352] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   18.325577] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   18.325802] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   18.326028] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   18.326272] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   18.326499] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   18.326724] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   18.326950] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   18.327175] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   18.327401] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   18.327626] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   18.327851] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   18.328077] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   18.328273] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   18.328386] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   18.328499] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   18.328612] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   18.328725] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   18.328838] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   18.328951] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   18.329086] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   18.329200] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   18.329317] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   18.329482] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   18.334281] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   18.334390] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   18.334495] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   18.334599] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   18.334703] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   18.334807] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   18.334912] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   18.335031] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   18.335149] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   18.335561] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   18.335580] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   18.335611] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   18.335636] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   18.335707] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   18.335719] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   18.339057] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   18.339075] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   18.346463] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   18.346746] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   18.346844] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   18.347068] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   18.347167] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.347193] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   18.347277] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   18.347853] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   18.347871] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   18.347939] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   18.348009] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   18.348072] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   18.348083] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   18.348321] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   18.348419] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   18.348675] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   18.348773] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.348798] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   18.348865] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   18.349439] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   18.349457] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   18.349703] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   18.349800] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   18.350052] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   18.350151] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   18.350170] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   18.350216] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   18.350227] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   18.352848] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.355614] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.358308] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.360997] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.363685] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.366374] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.369052] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.371714] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.374260] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.376803] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.379345] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.381917] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.384604] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.387293] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.389988] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.392672] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.395352] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.397894] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.400437] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.402981] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.405523] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.408056] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.410557] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.413054] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.415554] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.418054] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.420566] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.423588] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.426140] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.428702] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.431286] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.433969] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   18.434171] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   18.434209] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   18.434434] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   18.434465] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   18.434675] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   18.434778] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   18.434807] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   18.434997] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   18.435286] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   18.435535] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   18.435724] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   18.435922] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   18.436149] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   18.436375] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   18.436600] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   18.436826] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   18.437053] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   18.437278] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   18.437504] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   18.437729] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   18.437955] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   18.438180] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   18.438433] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   18.438659] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   18.438884] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   18.439109] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   18.439335] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   18.439561] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   18.439787] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   18.440012] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   18.440237] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   18.440462] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   18.440688] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   18.440913] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   18.441138] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   18.441363] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   18.441589] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   18.441814] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   18.442039] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   18.442283] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   18.442509] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   18.442734] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   18.442961] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   18.443187] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   18.443413] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   18.443638] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   18.444000] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   18.444228] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   18.444561] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   18.444787] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   18.445012] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   18.445235] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   18.445456] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   18.445679] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   18.445900] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   18.446123] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   18.446363] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   18.446587] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   18.446813] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   18.447043] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   18.447271] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   18.447498] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   18.447727] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   18.447954] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   18.448178] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   18.448401] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   18.448624] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   18.448848] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   18.449067] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   18.449290] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   18.449570] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   18.449782] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   18.449991] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   18.450199] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   18.450349] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   18.450453] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   18.451198] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   18.461572] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   18.461651] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   18.461735] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   18.531112] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   18.531222] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   18.536178] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   18.536439] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   18.536665] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   18.536889] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   18.537115] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   18.537341] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   18.537566] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   18.537790] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   18.538015] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   18.538266] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   18.538493] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   18.538719] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   18.538945] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   18.539170] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   18.539395] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   18.539620] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   18.539846] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   18.540071] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   18.540296] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   18.540522] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   18.540747] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   18.540972] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   18.541197] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   18.541423] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   18.541648] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   18.541873] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   18.542098] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   18.542343] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   18.542570] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   18.542795] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   18.543021] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   18.543248] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   18.543473] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   18.543699] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   18.543924] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   18.544291] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   18.544520] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   18.544752] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   18.545068] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   18.550290] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   18.550398] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   18.550503] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   18.550607] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   18.550711] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   18.550815] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   18.550920] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   18.551039] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   18.551156] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   18.590986] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   18.888286] wifi1: authenticate with de:0d:17:ad:80:55
[   18.902346] wifi1: capabilities/regulatory prevented using AP HT/VHT con=
figuration, downgraded
[   18.905385] wifi1: send auth to de:0d:17:ad:80:55 (try 1/3)
[   18.908220] wifi1: authenticated
[   18.922307] wifi1: waiting for beacon from de:0d:17:ad:80:55
[   18.974467] wifi1: associate with de:0d:17:ad:80:55 (try 1/3)
[   18.981883] wifi1: RX AssocResp from de:0d:17:ad:80:55 (capab=3D0x1031 s=
tatus=3D0 aid=3D5)
[   18.984594] wifi1: associated
[   19.040336] IPv6: ADDRCONF(NETDEV_CHANGE): wifi1: link becomes ready
[   19.074925] wifi1: Limiting TX power to 20 (20 - 0) dBm as advertised by=
 de:0d:17:ad:80:55
[   19.130379] [drm:drm_mode_addfb2 [drm]] [FB:99]
[   19.130504] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   19.130542] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   19.162224] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   20.248496] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] cursor A=
 watermarks: normal=3D18, SR=3D18, HPLL=3D34
[   26.870230] FS-Cache: Loaded
[   26.872546] Key type dns_resolver registered
[   26.952434] Key type cifs.spnego registered
[   26.952449] Key type cifs.idmap registered
[   26.953127] CIFS: Attempting to mount \\foreign.nabijaczleweli.xyz\nabij=
aczleweli
[   32.843297] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] cursor A=
 watermarks: normal=3D0, SR=3D0, HPLL=3D0
[   32.884418] PM: hibernation: hibernation entry
[   33.141157] (NULL device *): firmware: direct-loading firmware iwlwifi-5=
000-5.ucode
[   33.181317] Filesystems sync: 0.040 seconds
[   33.181391] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[   33.182973] OOM killer disabled.
[   33.183120] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x000=
00fff]
[   33.183126] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000=
fffff]
[   33.183132] PM: hibernation: Marking nosave pages: [mem 0xb5aa1000-0xb5a=
a6fff]
[   33.183136] PM: hibernation: Marking nosave pages: [mem 0xb5bba000-0xb5c=
0efff]
[   33.183141] PM: hibernation: Marking nosave pages: [mem 0xb5d08000-0xb5f=
0efff]
[   33.183161] PM: hibernation: Marking nosave pages: [mem 0xb5f18000-0xb5f=
1efff]
[   33.183164] PM: hibernation: Marking nosave pages: [mem 0xb5f65000-0xb5f=
9efff]
[   33.183169] PM: hibernation: Marking nosave pages: [mem 0xb5fe1000-0xb5f=
fefff]
[   33.183173] PM: hibernation: Marking nosave pages: [mem 0xb6000000-0xfff=
fffff]
[   33.193228] PM: hibernation: Basic memory bitmaps created
[   33.193346] PM: hibernation: Preallocating image memory
[   33.879553] PM: hibernation: Allocated 186368 pages for snapshot
[   33.879616] PM: hibernation: Allocated 745472 kbytes in 0.68 seconds (10=
96.28 MB/s)
[   33.879641] Freezing remaining freezable tasks ... (elapsed 0.206 second=
s) done.
[   34.087141] wifi1: deauthenticating from de:0d:17:ad:80:55 by local choi=
ce (Reason: 3=3DDEAUTH_LEAVING)
[   34.104022] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.enable (expected 1, found 0)
[   34.104126] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.active (expected 1, found 0)
[   34.104206] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in cpu_transcoder (expected 0, found -1)
[   34.104286] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in output_types (expected 0x00000010, found 0x00=
000000)
[   34.104366] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in framestart_delay (expected 1, found 0)
[   34.104448] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 1280, fo=
und 0)
[   34.104528] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 1440, foun=
d 0)
[   34.104607] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 1280=
, found 0)
[   34.104686] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 1440, =
found 0)
[   34.104766] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 1328,=
 found 0)
[   34.104845] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 1360, f=
ound 0)
[   34.104925] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 800, fou=
nd 0)
[   34.105004] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 823, found=
 0)
[   34.105083] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 800,=
 found 0)
[   34.105162] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 823, f=
ound 0)
[   34.105241] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 803, =
found 0)
[   34.105321] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 809, fo=
und 0)
[   34.105400] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 1280=
, found 0)
[   34.105479] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 1440, =
found 0)
[   34.105558] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
1280, found 0)
[   34.105638] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 14=
40, found 0)
[   34.105717] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 1=
328, found 0)
[   34.105796] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 136=
0, found 0)
[   34.105875] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 800,=
 found 0)
[   34.105955] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 823, f=
ound 0)
[   34.106034] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
800, found 0)
[   34.106113] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 82=
3, found 0)
[   34.106192] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 8=
03, found 0)
[   34.106277] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 809=
, found 0)
[   34.106357] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   34.106437] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (2) (expected 2, found=
 0)
[   34.106516] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (8) (expected 8, found=
 0)
[   34.106596] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pipe_bpp (expected 18, found 0)
[   34.106676] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_clock (expected 71000, foun=
d 0)
[   34.106755] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 71000, =
found 0)
[   34.106834] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in port_clock (expected 71000, found 0)
[   34.106937] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   34.107018] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   34.107099] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] primary =
A watermarks: normal=3D0, SR=3D0, HPLL=3D0
[   34.107159] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] FBC wate=
rmarks: SR=3D0, HPLL=3D0
[   34.107218] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: no [modeset]
[   34.107297] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:31:primary A] fb: [NOFB], visible: no
[   34.107403] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   34.398468] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe A
[   34.414436] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   34.414544] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   34.414617] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   34.414690] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   34.414763] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   34.414836] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   34.414909] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:61:LVDS-1]
[   34.414994] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:45:pipe A]
[   34.423577] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling always-on
[   34.424674] ACPI: EC: interrupt blocked
[   34.425522] ACPI: PM: Preparing to enter system sleep state S4
[   34.428142] ACPI: EC: event blocked
[   34.428147] ACPI: EC: EC stopped
[   34.428150] ACPI: PM: Saving platform NVS memory
[   34.428435] Disabling non-boot CPUs ...
[   34.429768] smpboot: CPU 1 is now offline
[   34.430474] PM: hibernation: Creating image:
[   34.434245] PM: hibernation: Need to copy 179614 pages
[   34.434245] PM: hibernation: Normal pages needed: 62439 + 1024, availabl=
e pages: 162656
[   34.434245] ACPI: PM: Restoring platform NVS memory
[   34.434245] ACPI: EC: EC started
[   34.434245] Enabling non-boot CPUs ...
[   34.434245] x86: Booting SMP configuration:
[   34.434245] smpboot: Booting Node 0 Processor 1 APIC 0x1
[   34.434245] CPU1 is up
[   34.434245] ACPI: PM: Waking up from system sleep state S4
[   34.451430] ACPI: EC: interrupt unblocked
[   34.470816] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling always-on
[   34.542272] ACPI: EC: event unblocked
[   34.542467] usb usb1: root hub lost power or was reset
[   34.542538] usb usb3: root hub lost power or was reset
[   34.542601] usb usb5: root hub lost power or was reset
[   34.542655] usb usb2: root hub lost power or was reset
[   34.546520] i915 0000:00:02.0: [drm:intel_hpll_vco [i915]] HPLL VCO 3200=
000 kHz
[   34.546637] i915 0000:00:02.0: [drm:intel_cdclk_dump_config [i915]] Curr=
ent CDCLK 320000 kHz, VCO 3200000 kHz, ref 0 kHz, bypass 0 kHz, voltage lev=
el 0
[   34.546703] usb usb6: root hub lost power or was reset
[   34.546748] usb usb7: root hub lost power or was reset
[   34.546739] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:45:pipe A] hw state readout: disabled
[   34.546790] usb usb8: root hub lost power or was reset
[   34.546824] usb usb4: root hub lost power or was reset
[   34.546829] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:60:pipe B] hw state readout: enabled
[   34.546905] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:31:primary A] hw state readout: disabled, pipe A
[   34.546981] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:35:sprite A] hw state readout: disabled, pipe A
[   34.547057] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:41:cursor A] hw state readout: disabled, pipe A
[   34.547132] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:46:primary B] hw state readout: enabled, pipe B
[   34.547207] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:50:sprite B] hw state readout: disabled, pipe B
[   34.547283] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:56:cursor B] hw state readout: disabled, pipe B
[   34.547360] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:62:LVDS] hw state readout: enabled, pipe B
[   34.547435] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:66:CRT] hw state readout: disabled, pipe B
[   34.547511] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:67:HDMI B] hw state readout: disabled, pipe A
[   34.547587] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:74:DP B] hw state readout: disabled, pipe A
[   34.547662] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:79:DP D] hw state readout: disabled, pipe A
[   34.547737] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:84:TV] hw state readout: disabled, pipe A
[   34.547813] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:61:LVDS-1] hw state readout: enabled
[   34.547889] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:64:VGA-1] hw state readout: disabled
[   34.547964] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:68:HDMI-A-1] hw state readout: disabled
[   34.548040] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:75:DP-1] hw state readout: disabled
[   34.548116] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:80:DP-2] hw state readout: disabled
[   34.548189] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:83:SVIDEO-1] hw state readout: disabled
[   34.548263] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:31:primary A] min_cdclk 0 kHz
[   34.548336] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:35:sprite A] min_cdclk 0 kHz
[   34.548410] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:41:cursor A] min_cdclk 0 kHz
[   34.548483] i915 0000:00:02.0: [drm:intel_bw_crtc_update [i915]] pipe A =
data rate 0 num active planes 0
[   34.548566] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:46:primary B] min_cdclk 70857 kHz
[   34.548640] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:50:sprite B] min_cdclk 0 kHz
[   34.548713] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:56:cursor B] min_cdclk 0 kHz
[   34.548787] i915 0000:00:02.0: [drm:intel_bw_crtc_update [i915]] pipe B =
data rate 283428 num active planes 1
[   34.548874] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: no [setup_hw_state]
[   34.548955] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [setup_hw_state]
[   34.549033] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: LVDS (0x10), output format: RGB
[   34.549112] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   34.549190] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   34.549268] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   34.549346] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   34.549424] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   34.549502] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   34.549580] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   34.549659] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   34.549738] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "1280x800": 60 70857 1024 1328 1360 1440 768 803 809 823 0x40 0xa
[   34.549819] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "1280x800": 60 70857 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   34.549899] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 70857 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   34.549979] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "1280x800": 60 70857 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   34.550060] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 70857 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   34.550139] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 70857, pipe src: 1024x768+0+0, pixel rate 70857
[   34.550218] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   34.550285] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0xa0000000, ratios: 0x0f5c0ccd, lvds border: 0x00008000
[   34.550364] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   34.550443] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x98046c00, dpll_md: 0x3, fp0: 0x21507, fp1: 0x31108
[   34.550519] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   34.550598] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   34.550679] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
watermarks: pipe A, plane=3D15, cursor=3D15, sprite=3D15
[   34.550738] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
watermarks: pipe B, plane=3D15, cursor=3D15, sprite=3D15
[   34.550796] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
SR watermarks: plane=3D127, cursor=3D0 fbc=3D1
[   34.550853] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
HPLL watermarks: plane=3D0, SR cursor=3D0 fbc=3D5
[   34.550910] i915 0000:00:02.0: [drm:g4x_wm_get_hw_state [i915]] Initial =
SR=3Dno HPLL=3Dno FBC=3Dno
[   34.551024] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:61:LVDS-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0, m=
ax platform bpp 30)
[   34.551106] i915 0000:00:02.0: [drm:intel_lvds_compute_config [i915]] fo=
rcing display bpp (was 24) to LVDS (18)
[   34.551174] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:45:=
pipe A] hw max bpp: 24, pipe bpp: 18, dithering: 1
[   34.551258] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.enable (expected 0, found 1)
[   34.551338] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.active (expected 0, found 1)
[   34.551418] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000010)
[   34.551497] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in framestart_delay (expected 0, found 1)
[   34.551577] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 1280)
[   34.551656] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 1=
440)
[   34.551735] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 1280)
[   34.551814] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 1440)
[   34.551894] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 1328)
[   34.551973] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 1360)
[   34.552052] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 800)
[   34.552131] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 8=
23)
[   34.552210] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 800)
[   34.552289] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 823)
[   34.552368] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 803)
[   34.552447] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 809)
[   34.552526] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 1280)
[   34.552605] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 1440)
[   34.552684] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 1280)
[   34.552764] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 1440)
[   34.552843] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 1328)
[   34.552923] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 1360)
[   34.553003] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 800)
[   34.553083] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 823)
[   34.553162] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 800)
[   34.553241] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 823)
[   34.553321] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 803)
[   34.553498] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 809)
[   34.553671] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   34.553790] sd 0:0:0:0: [sda] Starting disk
[   34.553752] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (2) (expected 0, found=
 2)
[   34.553919] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.flags (8) (expected 0, found=
 8)
[   34.554093] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in pipe_bpp (expected 0, found 18)
[   34.554173] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 71=
000)
[   34.554348] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 71000)
[   34.554521] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:4=
5:pipe A] fastset mismatch in port_clock (expected 0, found 71000)
[   34.554602] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] in=
itial modeset and fastboot not set
[   34.554680] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   34.554759] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   34.554839] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   34.554918] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000010, found 0x00=
000000)
[   34.554998] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   34.555077] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 1280, fo=
und 0)
[   34.555246] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 1440, foun=
d 0)
[   34.555423] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 1280=
, found 0)
[   34.555503] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 1440, =
found 0)
[   34.555670] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 1328,=
 found 0)
[   34.555750] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 1360, f=
ound 0)
[   34.555830] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 800, fou=
nd 0)
[   34.555910] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 823, found=
 0)
[   34.555989] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 800,=
 found 0)
[   34.556070] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 823, f=
ound 0)
[   34.556149] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 803, =
found 0)
[   34.556229] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 809, fo=
und 0)
[   34.556308] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 1280=
, found 0)
[   34.556388] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 1440, =
found 0)
[   34.556468] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
1280, found 0)
[   34.556547] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 14=
40, found 0)
[   34.556627] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 1=
328, found 0)
[   34.556702] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 136=
0, found 0)
[   34.556777] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 800,=
 found 0)
[   34.556852] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 823, f=
ound 0)
[   34.556926] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
800, found 0)
[   34.557001] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 82=
3, found 0)
[   34.557075] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 8=
03, found 0)
[   34.557150] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 809=
, found 0)
[   34.557225] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   34.557299] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.flags (2) (expected 2, found=
 0)
[   34.557374] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.flags (8) (expected 8, found=
 0)
[   34.557449] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in gmch_pfit.control (expected 0xa0000000, found=
 0x00000000)
[   34.557524] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in gmch_pfit.lvds_border_bits (expected 0x000080=
00, found 0x00000000)
[   34.557599] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   34.557674] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 70857, foun=
d 0)
[   34.557749] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 70857, =
found 0)
[   34.557824] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 70857, found 0)
[   34.557927] i915 0000:00:02.0: [drm:intel_plane_calc_min_cdclk [i915]] [=
PLANE:31:primary A] min cdclk (71000 kHz) > [CRTC:45:pipe A] min cdclk (0 k=
Hz)
[   34.558007] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   34.558082] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   34.558158] i915 0000:00:02.0: [drm:g4x_crtc_compute_clock [i915]] using=
 SSC reference clock of 96000 kHz
[   34.558274] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
45:pipe A] enable: yes [modeset]
[   34.558354] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: LVDS (0x10), output format: RGB
[   34.558436] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: A, pipe bpp: 18, dithering: 1
[   34.558510] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   34.558583] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   34.558657] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   34.558731] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   34.558805] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   34.558878] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   34.558952] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   34.559027] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   34.559103] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   34.559179] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 71000 1280 1328 1360 1440 800 803 809 823, type: 0x48 flags: 0xa
[   34.559255] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "1280x800": 60 71000 1280 1328 1360 1440 800 803 809 823 0x40 0xa
[   34.559330] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 71000 1280 1328 1360 1440 800 803 809 823, type: 0x40 flags: 0xa
[   34.559406] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 71000, pipe src: 1280x800+0+0, pixel rate 71000
[   34.559481] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   34.559554] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   34.559628] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   34.559702] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x98046c04, dpll_md: 0x0, fp0: 0x21507, fp1: 0x21507
[   34.559774] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 1 csc_enable: 0
[   34.559848] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 256 entries
[   34.559922] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:31:primary A] fb: [FB:100] 1280x800 format =3D XR24 little-endian (0x34325=
258) modifier =3D 0x0, visible: yes
[   34.559998] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	rotat=
ion: 0x1, scaler: -1
[   34.560072] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	src: =
1280.000000x800.000000+0.000000+0.000000 dst: 1280x800+0+0
[   34.560148] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:35:sprite A] fb: [NOFB], visible: no
[   34.560222] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:41:cursor A] fb: [NOFB], visible: no
[   34.560296] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   34.560370] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:46:primary B] fb: [NOFB], visible: no
[   34.560444] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:50:sprite B] fb: [NOFB], visible: no
[   34.560517] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:56:cursor B] fb: [NOFB], visible: no
[   34.565318] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   34.697349] iwlwifi 0000:08:00.0: Radio type=3D0x1-0x2-0x0
[   34.850289] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   34.850410] ------------[ cut here ]------------
[   34.850416] primary B assertion failure (expected off, current on)
[   34.850465] WARNING: CPU: 1 PID: 1089 at drivers/gpu/drm/i915/display/in=
tel_display.c:475 assert_plane+0xb9/0xd0 [i915]
[   34.850543] Modules linked in: nls_utf8 cifs cifs_arc4 cifs_md4 dns_reso=
lver fscache netfs ghash_generic gf128mul gcm ccm algif_aead des_generic li=
bdes ecb algif_skcipher bnep cmac md4 algif_hash af_alg binfmt_misc btusb b=
trtl btbcm btintel btmtk bluetooth joydev jitterentropy_rng sha512_generic =
ctr drbg ansi_cprng ecdh_generic ecc iwldvm mac80211 snd_hda_codec_conexant=
 snd_hda_codec_generic ledtrig_audio libarc4 snd_hda_intel iwlwifi snd_inte=
l_dspcfg i915 snd_intel_sdw_acpi iTCO_wdt intel_pmc_bxt uvcvideo iTCO_vendo=
r_support snd_hda_codec watchdog drm_buddy videobuf2_vmalloc drm_display_he=
lper snd_hda_core videobuf2_memops snd_hwdep videobuf2_v4l2 videobuf2_commo=
n cec snd_pcm rc_core toshiba_acpi snd_timer wmi_bmof evdev pcspkr videodev=
 i2c_i801 ttm cfg80211 psmouse i2c_smbus mc sg lpc_ich industrialio toshiba=
_bluetooth sparse_keymap snd nls_ascii soundcore sky2 drm_kms_helper i2c_al=
go_bit nls_cp437 rfkill toshiba_haps vfat fat ac button acpi_cpufreq nf_log=
_syslog nft_log nft_limit
[   34.850649]  nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables=
 libcrc32c nfnetlink drm ip_tables x_tables ext4 crc16 mbcache jbd2 crc32c_=
generic sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic sr_=
mod crct10dif_common cdrom sdhci_pci cqhci ahci libahci ehci_pci uhci_hcd e=
hci_hcd sdhci libata mmc_core serio_raw firewire_ohci usbcore usb_common wm=
i battery video pkcs8_key_parser coretemp firewire_sbp2 firewire_core crc_i=
tu_t scsi_mod scsi_common parport_pc ppdev lp parport autofs4
[   34.850740] CPU: 1 PID: 1089 Comm: kworker/u4:32 Not tainted 6.0.0-0.deb=
11.6-686-pae #1  Debian 6.0.12-1~bpo11+1
[   34.850747] Hardware name: TOSHIBA Satellite Pro U400/Satellite Pro U400=
, BIOS V5.00    10/26/2010
[   34.850752] Workqueue: events_unbound async_run_entry_fn
[   34.850760] EIP: assert_plane+0xb9/0xd0 [i915]
[   34.850836] Code: 90 b9 bf 4f a4 f8 84 c0 ba bb 4f a4 f8 89 c8 0f 44 c2 =
89 c7 89 f0 84 c0 57 0f 45 d1 52 ff 73 0c 68 f4 28 a2 f8 e8 7a 9e f3 d3 <0f=
> 0b 83 c4 10 e9 70 ff ff ff e8 a8 56 f7 d3 8d b4 26 00 00 00 00
[   34.850844] EAX: 00000036 EBX: c4375c00 ECX: 00000027 EDX: 00000001
[   34.850849] ESI: 00000000 EDI: f8a44fbf EBP: c61fdcd8 ESP: c61fdcb4
[   34.850854] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[   34.850859] CR0: 80050033 CR2: 00000000 CR3: 0cdd2000 CR4: 000006f0
[   34.850864] Call Trace:
[   34.850870]  intel_disable_transcoder+0x91/0x250 [i915]
[   34.850946]  ? drm_vblank_get+0x65/0xe0 [drm]
[   34.850969]  ? drm_crtc_vblank_get+0x12/0x20 [drm]
[   34.850986]  ? assert_vblank_disabled+0x10/0x70 [i915]
[   34.851062]  i9xx_crtc_disable+0x56/0x240 [i915]
[   34.851136]  ? intel_synchronize_irq+0x16/0x20 [i915]
[   34.851190]  ? intel_crtc_disable_pipe_crc+0xa4/0xb0 [i915]
[   34.851250]  intel_old_crtc_state_disables+0x35/0x90 [i915]
[   34.851325]  intel_atomic_commit_tail+0x3d9/0xe00 [i915]
[   34.851401]  ? group_init+0x160/0x160
[   34.851406]  ? group_init+0x160/0x160
[   34.851411]  intel_atomic_commit+0x2eb/0x360 [i915]
[   34.851487]  ? intel_atomic_commit_tail+0xe00/0xe00 [i915]
[   34.851562]  drm_atomic_commit+0x79/0xb0 [drm]
[   34.851582]  ? drm_plane_get_damage_clips.cold+0x1b/0x1b [drm]
[   34.851597]  drm_atomic_helper_commit_duplicated_state+0xb6/0xd0 [drm_km=
s_helper]
[   34.851610]  __intel_display_resume.part.0+0x5b/0xb0 [i915]
[   34.851686]  intel_display_resume+0x92/0x120 [i915]
[   34.851762]  i915_drm_resume+0xc0/0x120 [i915]
[   34.851813]  i915_pm_resume+0x34/0x50 [i915]
[   34.851865]  i915_pm_restore+0x1f/0x30 [i915]
[   34.851916]  pci_pm_restore+0x5a/0xe0
[   34.851922]  ? pci_pm_poweroff_noirq+0x120/0x120
[   34.851927]  dpm_run_callback+0x4f/0x130
[   34.851934]  device_resume+0x70/0x150
[   34.851939]  ? device_resume+0x150/0x150
[   34.851944]  async_resume+0x1b/0x30
[   34.851949]  async_run_entry_fn+0x34/0x130
[   34.851954]  process_one_work+0x18e/0x330
[   34.851961]  worker_thread+0x15e/0x3c0
[   34.851966]  kthread+0xe0/0x110
[   34.851971]  ? rescuer_thread+0x350/0x350
[   34.851976]  ? kthread_complete_and_exit+0x20/0x20
[   34.851981]  ret_from_fork+0x1c/0x28
[   34.851987] ---[ end trace 0000000000000000 ]---
[   34.856928] i915 0000:00:02.0: [drm:i9xx_crtc_disable [i915]] disabling =
pfit, current: 0xa0000000
[   34.857051] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   34.857136] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   34.857205] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   34.857274] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   34.857350] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   34.857431] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   34.857510] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:64:VGA-1]
[   34.857581] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:68:HDMI-A-1]
[   34.857653] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:75:DP-1]
[   34.857723] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:80:DP-2]
[   34.857794] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   34.858492] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe A
[   34.913542] ata5: SATA link down (SStatus 0 SControl 300)
[   34.913578] ata6: SATA link down (SStatus 0 SControl 300)
[   34.913612] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[   34.913644] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[   34.914069] ata1.00: unexpected _GTF length (8)
[   34.914629] ata1.00: unexpected _GTF length (8)
[   34.914731] ata1.00: configured for UDMA/100
[   34.917499] ata2.00: configured for UDMA/33
[   34.970303] usb 4-4: reset high-speed USB device number 4 using ehci-pci
[   34.970324] usb 6-2: reset full-speed USB device number 2 using uhci_hcd
[   35.122439] firewire_core 0000:0a:01.0: rediscovered device fw0
[   35.305636] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   35.305731] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:61:LVDS-1]
[   35.305842] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:45:pipe A]
[   35.306011] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   35.306094] ------------[ cut here ]------------
[   35.306099] primary B assertion failure (expected off, current on)
[   35.306123] WARNING: CPU: 0 PID: 1089 at drivers/gpu/drm/i915/display/in=
tel_display.c:475 assert_plane+0xb9/0xd0 [i915]
[   35.306206] Modules linked in: nls_utf8 cifs cifs_arc4 cifs_md4 dns_reso=
lver fscache netfs ghash_generic gf128mul gcm ccm algif_aead des_generic li=
bdes ecb algif_skcipher bnep cmac md4 algif_hash af_alg binfmt_misc btusb b=
trtl btbcm btintel btmtk bluetooth joydev jitterentropy_rng sha512_generic =
ctr drbg ansi_cprng ecdh_generic ecc iwldvm mac80211 snd_hda_codec_conexant=
 snd_hda_codec_generic ledtrig_audio libarc4 snd_hda_intel iwlwifi snd_inte=
l_dspcfg i915 snd_intel_sdw_acpi iTCO_wdt intel_pmc_bxt uvcvideo iTCO_vendo=
r_support snd_hda_codec watchdog drm_buddy videobuf2_vmalloc drm_display_he=
lper snd_hda_core videobuf2_memops snd_hwdep videobuf2_v4l2 videobuf2_commo=
n cec snd_pcm rc_core toshiba_acpi snd_timer wmi_bmof evdev pcspkr videodev=
 i2c_i801 ttm cfg80211 psmouse i2c_smbus mc sg lpc_ich industrialio toshiba=
_bluetooth sparse_keymap snd nls_ascii soundcore sky2 drm_kms_helper i2c_al=
go_bit nls_cp437 rfkill toshiba_haps vfat fat ac button acpi_cpufreq nf_log=
_syslog nft_log nft_limit
[   35.306326]  nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables=
 libcrc32c nfnetlink drm ip_tables x_tables ext4 crc16 mbcache jbd2 crc32c_=
generic sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic sr_=
mod crct10dif_common cdrom sdhci_pci cqhci ahci libahci ehci_pci uhci_hcd e=
hci_hcd sdhci libata mmc_core serio_raw firewire_ohci usbcore usb_common wm=
i battery video pkcs8_key_parser coretemp firewire_sbp2 firewire_core crc_i=
tu_t scsi_mod scsi_common parport_pc ppdev lp parport autofs4
[   35.306419] CPU: 0 PID: 1089 Comm: kworker/u4:32 Tainted: G        W    =
      6.0.0-0.deb11.6-686-pae #1  Debian 6.0.12-1~bpo11+1
[   35.306426] Hardware name: TOSHIBA Satellite Pro U400/Satellite Pro U400=
, BIOS V5.00    10/26/2010
[   35.306431] Workqueue: events_unbound async_run_entry_fn
[   35.306438] EIP: assert_plane+0xb9/0xd0 [i915]
[   35.306519] Code: 90 b9 bf 4f a4 f8 84 c0 ba bb 4f a4 f8 89 c8 0f 44 c2 =
89 c7 89 f0 84 c0 57 0f 45 d1 52 ff 73 0c 68 f4 28 a2 f8 e8 7a 9e f3 d3 <0f=
> 0b 83 c4 10 e9 70 ff ff ff e8 a8 56 f7 d3 8d b4 26 00 00 00 00
[   35.306527] EAX: 00000036 EBX: c4375c00 ECX: 00000027 EDX: 00000001
[   35.306532] ESI: 00000000 EDI: f8a44fbf EBP: c61fdd5c ESP: c61fdd38
[   35.306537] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010296
[   35.306542] CR0: 80050033 CR2: b4c0a00c CR3: 0cdd2000 CR4: 000006f0
[   35.306548] Call Trace:
[   35.306553]  intel_atomic_commit_tail+0xd8b/0xe00 [i915]
[   35.306634]  ? group_init+0x160/0x160
[   35.306639]  ? group_init+0x160/0x160
[   35.306645]  intel_atomic_commit+0x2eb/0x360 [i915]
[   35.306725]  ? intel_atomic_commit_tail+0xe00/0xe00 [i915]
[   35.306805]  drm_atomic_commit+0x79/0xb0 [drm]
[   35.306829]  ? drm_plane_get_damage_clips.cold+0x1b/0x1b [drm]
[   35.306845]  drm_atomic_helper_commit_duplicated_state+0xb6/0xd0 [drm_km=
s_helper]
[   35.306857]  __intel_display_resume.part.0+0x5b/0xb0 [i915]
[   35.306938]  intel_display_resume+0x92/0x120 [i915]
[   35.307019]  i915_drm_resume+0xc0/0x120 [i915]
[   35.307073]  i915_pm_resume+0x34/0x50 [i915]
[   35.307128]  i915_pm_restore+0x1f/0x30 [i915]
[   35.307182]  pci_pm_restore+0x5a/0xe0
[   35.307188]  ? pci_pm_poweroff_noirq+0x120/0x120
[   35.307193]  dpm_run_callback+0x4f/0x130
[   35.307200]  device_resume+0x70/0x150
[   35.307205]  ? device_resume+0x150/0x150
[   35.307211]  async_resume+0x1b/0x30
[   35.307216]  async_run_entry_fn+0x34/0x130
[   35.307221]  process_one_work+0x18e/0x330
[   35.307228]  worker_thread+0x15e/0x3c0
[   35.307233]  kthread+0xe0/0x110
[   35.307238]  ? rescuer_thread+0x350/0x350
[   35.307243]  ? kthread_complete_and_exit+0x20/0x20
[   35.307249]  ret_from_fork+0x1c/0x28
[   35.307255] ---[ end trace 0000000000000000 ]---
[   35.307277] i915 0000:00:02.0: [drm:intel_opregion_resume [i915]] 6 outp=
uts detected
[   35.307371] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D0
[   35.315600] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   35.315842] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   35.315940] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   35.316167] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   35.316272] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   35.316297] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   35.316394] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   35.316969] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   35.316986] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   35.317054] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   35.317128] i915 0000:00:02.0: [drm:check_connector_changed [drm_kms_hel=
per]] [CONNECTOR:64:VGA-1] Same epoch counter 1
[   35.317137] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   35.317391] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   35.317493] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   35.317731] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   35.317829] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   35.317854] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   35.317921] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   35.318512] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   35.318528] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   35.318757] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   35.318854] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   35.319089] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   35.319187] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   35.319205] i915 0000:00:02.0: [drm:check_connector_changed [drm_kms_hel=
per]] [CONNECTOR:68:HDMI-A-1] Same epoch counter 1
[   35.321600] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   35.324991] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.327477] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.329961] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.332443] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.334927] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.337408] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.339892] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.342376] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.344861] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.347346] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.349828] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.352311] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.354794] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.357277] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.359761] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.362253] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.364735] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.367218] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.369702] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.372183] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.374666] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.377149] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.379631] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.382112] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.384594] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.387077] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.389560] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.392043] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.394541] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.397025] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.399508] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.401991] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   35.402063] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   35.402077] i915 0000:00:02.0: [drm:check_connector_changed [drm_kms_hel=
per]] [CONNECTOR:75:DP-1] Same epoch counter 1
[   35.402087] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   35.402160] i915 0000:00:02.0: [drm:check_connector_changed [drm_kms_hel=
per]] [CONNECTOR:80:DP-2] Same epoch counter 1
[   37.647941] PM: hibernation: Basic memory bitmaps freed
[   37.647949] OOM killer enabled.
[   37.649061] Restarting tasks ... done.
[   37.691945] usb 7-1: USB disconnect, device number 2
[   38.394918] video LNXVIDEO:01: Restoring backlight state
[   38.421394] PM: hibernation: hibernation exit
[   38.422971] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   38.423015] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   38.454677] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   38.470761] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   38.470785] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   38.470808] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   38.470912] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   38.471048] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   38.471058] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   38.471635] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   38.471650] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   38.480853] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   38.481122] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   38.481193] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   38.481480] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   38.481552] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   38.481574] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   38.481645] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   38.482227] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   38.482263] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   38.482333] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   38.482405] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   38.482449] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   38.482459] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   38.482727] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   38.482797] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   38.483041] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   38.483114] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   38.483132] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   38.483200] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   38.483831] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   38.483850] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   38.484095] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   38.484165] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   38.484412] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   38.484483] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   38.484496] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   38.484525] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   38.484534] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   38.487061] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.489599] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.492123] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.494645] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.497181] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.499742] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.502274] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.504821] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.507759] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.510783] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.513316] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.516520] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.519167] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.521690] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.524441] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.527211] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.529769] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.533333] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.535902] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.538545] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.541103] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.546462] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.549293] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.551860] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.554671] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.557251] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.559931] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.562621] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.565300] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.567979] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.570666] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.573343] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   38.573546] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   38.573585] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   38.573675] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   38.573703] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   38.573909] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   38.573980] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   38.574006] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   38.574195] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   38.574528] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   38.574759] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   38.574947] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   38.575145] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   38.575373] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   38.575598] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   38.575823] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   38.576050] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   38.576278] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   38.576503] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   38.576729] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   38.576954] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   38.577179] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   38.577405] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   38.577631] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   38.577856] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   38.578080] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   38.578323] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   38.578550] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   38.578775] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   38.579001] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   38.579226] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   38.579452] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   38.579677] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   38.579903] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   38.580128] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   38.580353] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   38.580578] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   38.580804] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   38.581030] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   38.581255] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   38.581482] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   38.581707] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   38.581933] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   38.582159] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   38.582388] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   38.582614] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   38.582840] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   38.583102] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   38.583329] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   38.583660] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   38.583886] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   38.584110] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   38.584333] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   38.584554] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   38.584777] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   38.584999] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   38.585221] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   38.585443] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   38.585667] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   38.585893] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   38.586122] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   38.586356] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   38.586584] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   38.586812] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   38.587039] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   38.587264] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   38.587486] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   38.587709] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   38.587931] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   38.588150] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   38.588373] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   38.588639] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   38.588850] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   38.589059] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   38.589267] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   38.589474] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   38.589682] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   38.590545] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   38.590711] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   38.601181] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   38.601399] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   38.601628] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   38.630736] wifi1: authenticate with de:0d:17:ad:80:55
[   38.646486] wifi1: capabilities/regulatory prevented using AP HT/VHT con=
figuration, downgraded
[   38.650316] wifi1: send auth to de:0d:17:ad:80:55 (try 1/3)
[   38.653876] wifi1: authenticated
[   38.670386] wifi1: waiting for beacon from de:0d:17:ad:80:55
[   38.670464] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   38.670690] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   38.674302] wifi1: associate with de:0d:17:ad:80:55 (try 1/3)
[   38.675522] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   38.675795] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   38.676025] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   38.676251] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   38.676479] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   38.676707] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   38.676933] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   38.677160] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   38.677386] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   38.677611] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   38.677837] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   38.678062] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   38.678306] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   38.678533] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   38.678758] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   38.678910] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   38.679023] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   38.679136] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   38.679249] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   38.679361] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   38.679474] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   38.679587] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   38.679700] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   38.679813] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   38.679925] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   38.680038] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   38.680151] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   38.680264] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   38.680377] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   38.680490] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   38.680602] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   38.680716] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   38.680829] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   38.680942] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   38.681054] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   38.681194] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   38.681308] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   38.681424] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   38.681591] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   38.683009] wifi1: RX AssocResp from de:0d:17:ad:80:55 (capab=3D0x1031 s=
tatus=3D0 aid=3D5)
[   38.685636] wifi1: associated
[   38.690171] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   38.690285] usb 7-1: new full-speed USB device number 3 using uhci_hcd
[   38.690294] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   38.690401] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   38.690505] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   38.690609] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   38.690713] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   38.690818] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   38.690950] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   38.691070] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   38.691304] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   38.762210] wifi1: Limiting TX power to 20 (20 - 0) dBm as advertised by=
 de:0d:17:ad:80:55
[   38.882846] usb 7-1: New USB device found, idVendor=3D0930, idProduct=3D=
0200, bcdDevice=3D 1.44
[   38.882873] usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   38.882884] usb 7-1: Product: TAIYO YUDEN for Toshiba(0x0200)
[   38.882893] usb 7-1: Manufacturer: Broadcom Corp
[   38.882901] usb 7-1: SerialNumber: 00037A99A734
[   38.968193] Bluetooth: MGMT ver 1.22
[   40.221187] [drm:drm_mode_addfb2 [drm]] [FB:98]
[   40.263874] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]=
] HW context 1 created
[   40.267506] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   40.267527] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   40.267550] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   40.267568] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   40.267618] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   40.267628] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   40.267737] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   40.267748] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   40.275800] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   40.276142] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   40.276240] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   40.276468] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   40.276575] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   40.276600] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   40.276704] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   40.277280] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   40.277297] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   40.277365] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   40.277435] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   40.277529] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   40.277539] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   40.277739] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   40.277843] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   40.278065] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   40.278170] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   40.278195] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   40.278301] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   40.278877] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   40.278895] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   40.279122] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   40.279191] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   40.279470] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   40.279541] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   40.279553] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   40.279665] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   40.279676] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   40.282176] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.284683] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.287176] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.289670] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.292207] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.294774] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.297266] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.299755] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.302263] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.304750] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.307239] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.309728] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.312285] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.314778] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.317266] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.319756] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.322259] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.324788] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.327317] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.329841] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.332379] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.334937] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.337614] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.340290] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.342969] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.345645] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.349980] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.352660] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.355341] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.358005] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.360675] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.363356] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.363566] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   40.363601] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   40.363911] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   40.363942] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   40.364150] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   40.364422] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   40.364452] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   40.364642] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   40.364927] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   40.365159] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   40.365346] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   40.365544] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   40.365772] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   40.365997] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   40.366223] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   40.366500] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   40.366728] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   40.366954] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   40.367179] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   40.367404] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   40.367629] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   40.367854] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   40.368079] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   40.368304] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   40.368529] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   40.368754] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   40.368980] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   40.369205] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   40.369430] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   40.369655] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   40.369880] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   40.370106] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   40.370357] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   40.370584] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   40.370809] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   40.371034] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   40.371260] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   40.371485] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   40.371710] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   40.371936] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   40.372161] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   40.372386] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   40.372613] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   40.372838] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   40.373063] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   40.373289] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   40.373563] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   40.373791] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   40.374122] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   40.374364] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   40.374589] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   40.374812] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   40.375033] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   40.375256] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   40.375478] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   40.375700] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   40.375922] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   40.376145] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   40.376371] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   40.376600] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   40.376828] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   40.377056] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   40.377284] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   40.377512] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   40.377737] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   40.377959] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   40.378182] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   40.378416] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   40.378634] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   40.378857] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   40.379138] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   40.379350] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   40.379558] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   40.379766] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   40.379974] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   40.380181] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   40.381039] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   40.381204] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   40.391673] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   40.391891] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   40.392121] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   40.461149] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   40.461266] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   40.466133] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   40.466313] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   40.466438] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   40.466551] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   40.466666] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   40.466779] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   40.466893] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   40.467006] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   40.467119] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   40.467232] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   40.467345] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   40.467459] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   40.467571] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   40.467685] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   40.467797] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   40.467910] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   40.468023] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   40.468136] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   40.468249] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   40.468362] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   40.468475] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   40.468588] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   40.468701] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   40.468814] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   40.468927] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   40.469040] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   40.469153] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   40.469266] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   40.469379] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   40.469492] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   40.469604] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   40.469718] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   40.469831] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   40.469944] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   40.470057] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   40.470215] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   40.470462] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   40.470696] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   40.471095] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   40.478275] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   40.478383] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   40.478488] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   40.478592] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   40.478696] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   40.478800] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   40.478904] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   40.479024] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   40.479141] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   40.479511] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   40.479531] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   40.479562] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   40.479587] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   40.479656] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   40.479669] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   40.483003] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   40.483021] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   40.490270] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   40.490535] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   40.490634] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   40.490906] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   40.491006] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   40.491032] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   40.491131] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   40.491748] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   40.491773] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   40.491870] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   40.491970] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   40.492043] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   40.492058] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   40.492337] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   40.492436] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   40.492705] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   40.492804] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   40.492829] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   40.492924] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   40.493535] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   40.493560] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   40.493830] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   40.493928] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   40.494198] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   40.494320] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   40.494337] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   40.494407] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   40.494422] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   40.496968] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.499506] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.502044] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.504579] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.507117] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.509654] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.512249] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.514928] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.517598] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.520278] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.522950] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.525609] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.528148] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.530691] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.533225] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.535756] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.538284] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.540813] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.543342] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.545868] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.548439] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.551108] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.553771] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.556452] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.559142] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.561822] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.564502] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.567182] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.569860] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.572540] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.575250] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.577916] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   40.578118] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   40.578155] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   40.578419] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   40.578451] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   40.578658] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   40.578765] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   40.578794] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   40.578984] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   40.579272] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   40.579503] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   40.579692] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   40.579890] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   40.580117] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   40.580343] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   40.580568] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   40.580795] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   40.581021] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   40.581247] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   40.581472] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   40.581697] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   40.581923] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   40.582148] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   40.582401] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   40.582627] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   40.582852] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   40.583078] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   40.583303] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   40.583529] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   40.583755] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   40.583980] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   40.584205] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   40.584430] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   40.584655] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   40.584880] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   40.585106] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   40.585331] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   40.585556] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   40.585782] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   40.586007] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   40.586238] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   40.586469] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   40.586695] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   40.586922] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   40.587147] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   40.587373] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   40.587598] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   40.587868] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   40.588096] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   40.588428] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   40.588653] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   40.588877] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   40.589100] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   40.589322] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   40.589545] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   40.589766] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   40.589988] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   40.590210] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   40.590458] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   40.590685] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   40.590914] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   40.591142] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   40.591370] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   40.591598] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   40.591826] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   40.592051] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   40.592273] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   40.592497] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   40.592720] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   40.592939] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   40.593162] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   40.593427] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   40.593638] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   40.593847] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   40.594055] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   40.594274] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   40.594483] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   40.595359] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   40.605820] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   40.605931] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   40.606049] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   40.675379] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   40.675600] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   40.680284] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   40.680580] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   40.680810] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   40.681036] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   40.681263] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   40.681491] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   40.681717] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   40.681943] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   40.682169] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   40.682417] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   40.682645] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   40.682870] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   40.683095] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   40.683320] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   40.683546] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   40.683772] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   40.683997] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   40.684223] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   40.684448] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   40.684674] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   40.684900] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   40.685125] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   40.685351] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   40.685576] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   40.685801] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   40.686027] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   40.686258] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   40.686485] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   40.686711] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   40.686936] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   40.687162] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   40.687389] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   40.687614] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   40.687840] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   40.688066] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   40.688336] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   40.688563] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   40.688796] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   40.689126] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   40.694291] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   40.694398] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   40.694502] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   40.694606] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   40.694710] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   40.694814] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   40.694919] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   40.695039] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   40.695156] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   40.720564] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   41.304368] [drm:drm_mode_addfb2 [drm]] [FB:102]
[   41.304441] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   41.304471] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   41.336397] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   42.205408] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] cursor A=
 watermarks: normal=3D18, SR=3D18, HPLL=3D34
[   44.984517] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] cursor A=
 watermarks: normal=3D0, SR=3D0, HPLL=3D0
[   45.238776] [drm:drm_mode_setcrtc [drm]] [CRTC:45:pipe A]
[   45.238820] [drm:drm_mode_setcrtc [drm]] [CONNECTOR:61:LVDS-1]
[   45.270084] [drm:drm_mode_setcrtc [drm]] [CRTC:60:pipe B]
[   45.286198] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1]
[   45.286228] [drm:update_display_info [drm]] Supported Monitor Refresh ra=
te range is 0 Hz - 0 Hz
[   45.286281] [drm:_drm_edid_connector_update [drm]] ELD monitor=20
[   45.286307] [drm:_drm_edid_connector_update [drm]] ELD size 20, SAD coun=
t 0
[   45.286379] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:61:LVDS-1] probed modes :
[   45.286392] [drm:drm_mode_debug_printmodeline [drm]] Modeline "1280x800"=
: 60 71000 1280 1328 1360 1440 800 803 809 823 0x48 0xa
[   45.287256] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1]
[   45.287274] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] [CONNECTOR:=
64:VGA-1] force=3D1
[   45.296503] i915 0000:00:02.0: [drm:intel_crt_detect [i915]] CRT not det=
ected via hotplug
[   45.296857] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   45.296959] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK on first message, retry
[   45.297268] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus vga] NAK for addr: 0050 w(1)
[   45.297372] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   45.297401] i915 0000:00:02.0: [drm:intel_crt_get_edid [i915]] CRT GMBUS=
 EDID read failed, retry using GPIO bit-banging
[   45.297500] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus vga. force bit now 1
[   45.298346] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus vga
[   45.298376] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus vga. force bit now 0
[   45.298476] i915 0000:00:02.0: [drm:intel_crt_detect_ddc [i915]] CRT not=
 detected via DDC:0x50 [no valid EDID found]
[   45.298577] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:64:VGA-1] disconnected
[   45.298645] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1]
[   45.298660] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:68:HDMI-A-1]
[   45.302278] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   45.302373] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   45.302750] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0050 w(1)
[   45.302827] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   45.302850] i915 0000:00:02.0: [drm:intel_hdmi_set_edid [i915]] HDMI GMB=
US EDID read failed, retry using GPIO bit-banging
[   45.302918] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] enabli=
ng bit-banging on i915 gmbus dpb. force bit now 1
[   45.305945] [drm:drm_do_probe_ddc_edid [drm]] drm: skipping non-existent=
 adapter i915 gmbus dpb
[   45.305973] i915 0000:00:02.0: [drm:intel_gmbus_force_bit [i915]] disabl=
ing bit-banging on i915 gmbus dpb. force bit now 0
[   45.314047] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   45.314158] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK on first message, retry
[   45.315455] i915 0000:00:02.0: [drm:do_gmbus_xfer [i915]] GMBUS [i915 gm=
bus dpb] NAK for addr: 0040 w(1)
[   45.315534] i915 0000:00:02.0: [drm:drm_dp_dual_mode_detect [drm_display=
_helper]] DP dual mode HDMI ID:  (err -6)
[   45.315548] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:68:HDMI-A-1] disconnected
[   45.315593] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1]
[   45.315603] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:7=
5:DP-1]
[   45.318112] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.320615] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.323115] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.325610] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.328105] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.330602] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.333114] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.335651] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.338186] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.340751] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.343322] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.345990] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.348680] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.351379] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.354067] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.356792] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.359481] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.362163] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.364872] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.367558] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.370265] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.372967] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.375656] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.378337] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.381016] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.383693] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.386367] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.389042] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.391737] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.394419] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.397111] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.399800] i915 0000:00:02.0: [drm:intel_dp_aux_xfer [i915]] AUX B/DP B=
: timeout (status 0x71430085)
[   45.400004] i915 0000:00:02.0: [drm:drm_dp_dpcd_access [drm_display_help=
er]] AUX B/DP B: Too many retries, giving up. First error: -110
[   45.400041] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:75:DP-1] disconnected
[   45.400121] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2]
[   45.400149] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:8=
0:DP-2]
[   45.400354] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:80:DP-2] disconnected
[   45.400402] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1]
[   45.400429] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] [CONNECTOR:8=
3:SVIDEO-1] force=3D1
[   45.400618] i915 0000:00:02.0: [drm:intel_get_load_detect_pipe [i915]] [=
CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   45.400906] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:83:SVIDEO-1] Limiting display bpp to 24 (EDID bpp 0, max requested bpp 0,=
 max platform bpp 30)
[   45.401136] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] forc=
ing bpc to 8 for TV
[   45.401324] i915 0000:00:02.0: [drm:intel_tv_compute_config [i915]] TV m=
ode: "712x482i (NTSC-M)": 60 27000 712 733 797 858 482 497 509 525 0x10 0x0
[   45.401522] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:60:=
pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   45.401750] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 0, found 1)
[   45.401976] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 0, found 1)
[   45.402201] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected -1, found 1)
[   45.402473] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000000, found 0x00=
000020)
[   45.402701] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 0, found 1)
[   45.402926] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 0, found=
 640)
[   45.403151] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 0, found 8=
97)
[   45.403376] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 0, f=
ound 640)
[   45.403602] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 0, fou=
nd 897)
[   45.403827] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 0, fo=
und 710)
[   45.404052] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 0, foun=
d 776)
[   45.404277] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 0, found=
 480)
[   45.404503] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 0, found 6=
16)
[   45.404728] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 0, f=
ound 480)
[   45.404953] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 0, fou=
nd 616)
[   45.405179] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 0, fo=
und 541)
[   45.405404] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 0, foun=
d 555)
[   45.405629] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 0, f=
ound 640)
[   45.405854] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 0, fou=
nd 897)
[   45.406079] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
0, found 640)
[   45.406329] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 0,=
 found 897)
[   45.406555] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 0=
, found 710)
[   45.406780] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 0, =
found 776)
[   45.407005] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 0, f=
ound 480)
[   45.407231] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 0, fou=
nd 616)
[   45.407456] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
0, found 480)
[   45.407681] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 0,=
 found 616)
[   45.407906] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 0=
, found 541)
[   45.408131] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 0, =
found 555)
[   45.408357] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 0, found 1)
[   45.408584] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 0, found 24)
[   45.408809] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 0, found 33=
119)
[   45.409034] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 0, foun=
d 33119)
[   45.409259] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 0, found 108000)
[   45.409522] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   45.409749] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   45.410081] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: yes [modeset]
[   45.410336] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: TVOUT (0x20), output format: RGB
[   45.410577] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   45.410732] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[   45.410842] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   45.410953] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] bigjoi=
ner: no, pipes: 0x0
[   45.411064] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   45.411175] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] frames=
tart delay: 1, MSA timing delay: 0
[   45.411286] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[   45.411398] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, vmin: 0, vmax: 0, pipeline full: 0, guardband: 0 flipline: 0, vmin vblan=
k: -1, vmax vblank: -2
[   45.411511] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "640x480": 73 31500 640 664 704 832 480 489 491 520 0x10 0xa
[   45.411625] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "": 60 33119 640 710 776 897 480 541 555 616 0x10 0x0
[   45.411740] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x10 flags: 0x0
[   45.411853] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "640x480": 60 33119 640 710 776 897 480 541 555 616 0x40 0x0
[   45.411967] i915 0000:00:02.0: [drm:intel_dump_crtc_timings [i915]] crtc=
 timings: 33119 640 710 776 897 480 541 555 616, type: 0x40 flags: 0x0
[   45.412081] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 108000, pipe src: 640x480+0+0, pixel rate 33119
[   45.412193] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 0, ips linetime: 0
[   45.412305] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] gmch p=
fit: control: 0x00000000, ratios: 0x00000000, lvds border: 0x00000000
[   45.412417] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   45.412528] i915 0000:00:02.0: [drm:intel_dpll_dump_hw_state [i915]] dpl=
l_hw_state: dpll: 0x94020c02, dpll_md: 0x0, fp0: 0x20f03, fp1: 0x20f03
[   45.412637] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   45.412749] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] degamm=
a lut: 0 entries, gamma lut: 0 entries
[   45.412929] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   45.413036] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   45.413140] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   45.413244] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   45.413348] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   45.413452] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   45.414188] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is disabled (was enabled)
[   45.414286] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   45.424688] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   45.424908] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   45.425137] i915 0000:00:02.0: [drm:intel_tv_get_config [i915]] TV mode:=
 "712x482i ((null))": 60 27000 712 733 797 858 482 497 509 525 0x0 0x0
[   45.494448] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] TV detected:=
 400c00d7, 700000aa
[   45.494670] i915 0000:00:02.0: [drm:intel_tv_detect [i915]] Unrecognised=
 TV connection
[   45.499339] i915 0000:00:02.0: [drm:intel_release_load_detect_pipe [i915=
]] [CONNECTOR:83:SVIDEO-1], [ENCODER:84:TV]
[   45.499656] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.enable (expected 1, found 0)
[   45.499909] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.active (expected 1, found 0)
[   45.500149] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in cpu_transcoder (expected 1, found -1)
[   45.500391] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in output_types (expected 0x00000020, found 0x00=
000000)
[   45.500630] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in framestart_delay (expected 1, found 0)
[   45.500868] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hdisplay (expected 640, fou=
nd 0)
[   45.501108] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_htotal (expected 897, found=
 0)
[   45.501347] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_start (expected 640,=
 found 0)
[   45.501587] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hblank_end (expected 897, f=
ound 0)
[   45.501825] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_start (expected 710, =
found 0)
[   45.502059] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_hsync_end (expected 776, fo=
und 0)
[   45.502351] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vdisplay (expected 480, fou=
nd 0)
[   45.502583] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vtotal (expected 616, found=
 0)
[   45.502809] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_start (expected 480,=
 found 0)
[   45.503034] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vblank_end (expected 616, f=
ound 0)
[   45.503261] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_start (expected 541, =
found 0)
[   45.503486] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_vsync_end (expected 555, fo=
und 0)
[   45.503712] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hdisplay (expected 640,=
 found 0)
[   45.503938] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_htotal (expected 897, f=
ound 0)
[   45.504164] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_start (expected =
640, found 0)
[   45.504390] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hblank_end (expected 89=
7, found 0)
[   45.504615] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_start (expected 7=
10, found 0)
[   45.504840] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_hsync_end (expected 776=
, found 0)
[   45.505066] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vdisplay (expected 480,=
 found 0)
[   45.505292] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vtotal (expected 616, f=
ound 0)
[   45.505517] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_start (expected =
480, found 0)
[   45.505743] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vblank_end (expected 61=
6, found 0)
[   45.505969] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_start (expected 5=
41, found 0)
[   45.506195] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_vsync_end (expected 555=
, found 0)
[   45.506441] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pixel_multiplier (expected 1, found 0)
[   45.506668] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in pipe_bpp (expected 24, found 0)
[   45.506893] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.pipe_mode.crtc_clock (expected 33119, foun=
d 0)
[   45.507119] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in hw.adjusted_mode.crtc_clock (expected 33119, =
found 0)
[   45.507345] i915 0000:00:02.0: [drm:pipe_config_mismatch [i915]] [CRTC:6=
0:pipe B] fastset mismatch in port_clock (expected 108000, found 0)
[   45.507624] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 320000 kHz, actual 320000 kHz
[   45.507852] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 0, actual 0
[   45.508084] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
60:pipe B] enable: no [modeset]
[   45.508497] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe B
[   45.513923] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:62:LVDS]
[   45.514031] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:66:CRT]
[   45.514136] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:67:HDMI B]
[   45.514257] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:74:DP B]
[   45.514362] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:79:DP D]
[   45.514466] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:84:TV]
[   45.514571] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:83:SVIDEO-1]
[   45.514703] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:60:pipe B]
[   45.514822] [drm:drm_helper_probe_single_connector_modes [drm_kms_helper=
]] [CONNECTOR:83:SVIDEO-1] disconnected
[   45.515032] i915 0000:00:02.0: [drm:_intel_set_memory_cxsr [i915]] memor=
y self-refresh is enabled (was disabled)
[   45.529288] i915 0000:00:02.0: [drm:g4x_compute_pipe_wm [i915]] cursor A=
 watermarks: normal=3D18, SR=3D18, HPLL=3D34

--7znspmlngdoyrbsy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmPSn2QACgkQvP0LAY0m
WPE9NhAAnlqQZFwEqsW0JAjeWEOz4v3wkWAKZ1njyNQanxQ0ZPlWxvV5QC0I6wrD
7N04+/DTx7lzdIhOB36BoyFxQeFL5zCvKUi38Q9crlBaaQez9gqISgPTY1BDST0x
NhTGqKkd8DMoPAyhzbdvOyGTXeSMuuDwGRYh2BnlT6Od/TJhu5ip2Ta0yPW6nFwr
vAdV1wiqinASPMXM2yMQknunWRFm0PckD1CAzlX+GXf/rSE5GPyoR+q9LirvPpdf
5dSW7odINDhVBvL+tZIE2NSuxm8D8wiLFC4u53zpgdnT+buOzm8pGE0PiBGTJR0u
CM+XwazOlpN7JuHhiWcC5gNvGo2hGsDyBPCe1Vp0xudg99zDDfhCfWLKqjkEC+hs
1s0VFDkHfTVz4en2zNGz0TviTe0DFYkyDJhKmbH1ZC0K9VfqKT3mRJjzAax8fjuC
t9kFQDobGk3EK0xBmrAk/LNpIGzPNYUHX1NJZyGQ8q9q4TIwcVmFGhvkJiqVAym2
7U1VZe8ry0L7R6TuguDijpckG67rbgPu/4UOuAAD/A45eHCuvm+vr+Gh5f9U93jj
P6arDpGt3EHhpibC23W9jb7LM3EvanKORMxQGz29ULCA9Vwvm/srKx88VeM7R0Vn
3xGYmFpkPDjlZJCIS0oql/SC9ijGtltfSJ0RDzF92TAhq9zAWjY=
=tGbn
-----END PGP SIGNATURE-----

--7znspmlngdoyrbsy--
