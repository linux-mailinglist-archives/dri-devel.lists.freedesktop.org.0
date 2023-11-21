Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CB7F3AB1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F71610E5B4;
	Wed, 22 Nov 2023 00:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FE710E101;
 Tue, 21 Nov 2023 22:05:08 +0000 (UTC)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 44F2A149F8C; Tue, 21 Nov 2023 17:05:07 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87bkbodp51.fsf@vps.thesusis.net>
 <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
Date: Tue, 21 Nov 2023 17:05:07 -0500
Message-ID: <87r0kircdo.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Mailman-Approved-At: Wed, 22 Nov 2023 00:28:16 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

Alex Deucher <alexdeucher@gmail.com> writes:

> Does reverting 56e449603f0ac580700621a356d35d5716a62ce5 alone fix it?
> Can you also attach your full dmesg log for the failed suspend?

No, it doesn't.  Here is the full syslog from the boot with only that
revert:


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline; filename=syslog.txt
Content-Transfer-Encoding: quoted-printable
Content-Description: syslog.txt

-- Journal begins at Mon 2023-08-28 17:12:05 EDT, ends at Tue 2023-11-21 17=
:00:31 EST. --
Nov 21 16:56:27 faldara kernel: Linux version 6.7.0-rc2+ (psusi@faldara) (g=
cc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35=
.2) #42 SMP PREEMPT_DYNAMIC Mon Nov 20 17:11:59 EST 2023
Nov 21 16:56:27 faldara kernel: Command line: BOOT_IMAGE=3D/boot/vmlinuz-6.=
7.0-rc2+ root=3D/dev/mapper/faldara-bullseye
Nov 21 16:56:27 faldara kernel: BIOS-provided physical RAM map:
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x0000000000000000-0x000000=
0000057fff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x0000000000058000-0x000000=
0000058fff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x0000000000059000-0x000000=
000009efff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x000000000009f000-0x000000=
00000fffff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x0000000000100000-0x000000=
00b82a2fff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000b82a3000-0x000000=
00b82d7fff] ACPI data
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000b82d8000-0x000000=
00b8679fff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000b867a000-0x000000=
00b867afff] ACPI NVS
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000b867b000-0x000000=
00b867bfff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000b867c000-0x000000=
00c533dfff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c533e000-0x000000=
00c6a45fff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c6a46000-0x000000=
00c6a57fff] ACPI data
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c6a58000-0x000000=
00c6c12fff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c6c13000-0x000000=
00c723afff] ACPI NVS
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c723b000-0x000000=
00c7a8efff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c7a8f000-0x000000=
00c7afefff] type 20
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c7aff000-0x000000=
00c7afffff] usable
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000c7b00000-0x000000=
00c7ffffff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000f8000000-0x000000=
00fbffffff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000fe000000-0x000000=
00fe010fff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000fec00000-0x000000=
00fec00fff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000fee00000-0x000000=
00fee00fff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x00000000ff000000-0x000000=
00ffffffff] reserved
Nov 21 16:56:27 faldara kernel: BIOS-e820: [mem 0x0000000100000000-0x000000=
0436ffffff] usable
Nov 21 16:56:27 faldara kernel: NX (Execute Disable) protection: active
Nov 21 16:56:27 faldara kernel: APIC: Static calls initialized
Nov 21 16:56:27 faldara kernel: efi: EFI v2.5 by American Megatrends
Nov 21 16:56:27 faldara kernel: efi: ACPI 2.0=3D0xb82a3000 ACPI=3D0xb82a300=
0 SMBIOS=3D0xc7a01000 SMBIOS 3.0=3D0xc7a00000 ESRT=3D0xc3a94158 MOKvar=3D0x=
c73f5000=20
Nov 21 16:56:27 faldara kernel: efi: Remove mem42: MMIO range=3D[0xf8000000=
-0xfbffffff] (64MB) from e820 map
Nov 21 16:56:27 faldara kernel: e820: remove [mem 0xf8000000-0xfbffffff] re=
served
Nov 21 16:56:27 faldara kernel: efi: Not removing mem43: MMIO range=3D[0xfe=
000000-0xfe010fff] (68KB) from e820 map
Nov 21 16:56:27 faldara kernel: efi: Not removing mem44: MMIO range=3D[0xfe=
c00000-0xfec00fff] (4KB) from e820 map
Nov 21 16:56:27 faldara kernel: efi: Not removing mem45: MMIO range=3D[0xfe=
e00000-0xfee00fff] (4KB) from e820 map
Nov 21 16:56:27 faldara kernel: efi: Remove mem46: MMIO range=3D[0xff000000=
-0xffffffff] (16MB) from e820 map
Nov 21 16:56:27 faldara kernel: e820: remove [mem 0xff000000-0xffffffff] re=
served
Nov 21 16:56:27 faldara kernel: SMBIOS 3.0.0 present.
Nov 21 16:56:27 faldara kernel: DMI: System manufacturer System Product Nam=
e/Z170 PRO GAMING, BIOS 3805 05/16/2018
Nov 21 16:56:27 faldara kernel: tsc: Detected 3500.000 MHz processor
Nov 21 16:56:27 faldara kernel: tsc: Detected 3499.912 MHz TSC
Nov 21 16:56:27 faldara kernel: e820: update [mem 0x00000000-0x00000fff] us=
able =3D=3D> reserved
Nov 21 16:56:27 faldara kernel: e820: remove [mem 0x000a0000-0x000fffff] us=
able
Nov 21 16:56:27 faldara kernel: last_pfn =3D 0x437000 max_arch_pfn =3D 0x40=
0000000
Nov 21 16:56:27 faldara kernel: MTRR map: 4 entries (3 fixed + 1 variable; =
max 23), built from 10 variable MTRRs
Nov 21 16:56:27 faldara kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- U=
C  WB  WP  UC- WT=20=20
Nov 21 16:56:27 faldara kernel: last_pfn =3D 0xc7b00 max_arch_pfn =3D 0x400=
000000
Nov 21 16:56:27 faldara kernel: found SMP MP-table at [mem 0x000fcce0-0x000=
fccef]
Nov 21 16:56:27 faldara kernel: esrt: Reserving ESRT space from 0x00000000c=
3a94158 to 0x00000000c3a94190.
Nov 21 16:56:27 faldara kernel: e820: update [mem 0xc3a94000-0xc3a94fff] us=
able =3D=3D> reserved
Nov 21 16:56:27 faldara kernel: Using GB pages for direct mapping
Nov 21 16:56:27 faldara kernel: Secure boot disabled
Nov 21 16:56:27 faldara kernel: RAMDISK: [mem 0x0e7b7000-0x233d2fff]
Nov 21 16:56:27 faldara kernel: ACPI: Early table checksum verification dis=
abled
Nov 21 16:56:27 faldara kernel: ACPI: RSDP 0x00000000B82A3000 000024 (v02 A=
LASKA)
Nov 21 16:56:27 faldara kernel: ACPI: XSDT 0x00000000B82A30A8 0000C4 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: FACP 0x00000000B82CC480 000114 (v06 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: DSDT 0x00000000B82A3200 02927E (v02 A=
LASKA A M I    01072009 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: FACS 0x00000000C723AC40 000040
Nov 21 16:56:27 faldara kernel: ACPI: APIC 0x00000000B82CC598 000084 (v03 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: FPDT 0x00000000B82CC620 000044 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: BGRT 0x00000000B82D7D78 000038 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: MCFG 0x00000000B82CC6C0 00003C (v01 A=
LASKA A M I    01072009 MSFT 00000097)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82CC700 000390 (v01 S=
ataRe SataTabl 00001000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: FIDT 0x00000000B82CCA90 00009C (v01 A=
LASKA A M I    01072009 AMI  00010013)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82CCB30 003041 (v02 S=
aSsdt SaSsdt   00003000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82CFB78 002544 (v02 P=
egSsd PegSsdt  00001000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: HPET 0x00000000B82D20C0 000038 (v01 I=
NTEL  SKL      00000001 MSFT 0000005F)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82D20F8 000E3B (v02 I=
NTEL  Ther_Rvp 00001000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82D2F38 000B19 (v02 I=
NTEL  xh_rvp08 00000000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: UEFI 0x00000000B82D3A58 000042 (v01 I=
NTEL  EDK2     00000002      01000013)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82D3AA0 000EDE (v02 C=
puRef CpuSsdt  00003000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: LPIT 0x00000000B82D4980 000094 (v01 I=
NTEL  SKL      00000000 MSFT 0000005F)
Nov 21 16:56:27 faldara kernel: ACPI: WSMT 0x00000000B82D4A18 000028 (v01 I=
NTEL  SKL      00000000 MSFT 0000005F)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82D4A40 00029F (v02 I=
NTEL  sensrhub 00000000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0x00000000B82D4CE0 003002 (v02 I=
NTEL  PtidDevc 00001000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: DBGP 0x00000000B82D7CE8 000034 (v01 I=
NTEL           00000002 MSFT 0000005F)
Nov 21 16:56:27 faldara kernel: ACPI: DBG2 0x00000000B82D7D20 000054 (v00 I=
NTEL           00000002 MSFT 0000005F)
Nov 21 16:56:27 faldara kernel: ACPI: Reserving FACP table memory at [mem 0=
xb82cc480-0xb82cc593]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving DSDT table memory at [mem 0=
xb82a3200-0xb82cc47d]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving FACS table memory at [mem 0=
xc723ac40-0xc723ac7f]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving APIC table memory at [mem 0=
xb82cc598-0xb82cc61b]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving FPDT table memory at [mem 0=
xb82cc620-0xb82cc663]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving BGRT table memory at [mem 0=
xb82d7d78-0xb82d7daf]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving MCFG table memory at [mem 0=
xb82cc6c0-0xb82cc6fb]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82cc700-0xb82cca8f]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving FIDT table memory at [mem 0=
xb82cca90-0xb82ccb2b]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82ccb30-0xb82cfb70]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82cfb78-0xb82d20bb]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving HPET table memory at [mem 0=
xb82d20c0-0xb82d20f7]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d20f8-0xb82d2f32]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d2f38-0xb82d3a50]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving UEFI table memory at [mem 0=
xb82d3a58-0xb82d3a99]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d3aa0-0xb82d497d]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving LPIT table memory at [mem 0=
xb82d4980-0xb82d4a13]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving WSMT table memory at [mem 0=
xb82d4a18-0xb82d4a3f]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d4a40-0xb82d4cde]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d4ce0-0xb82d7ce1]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving DBGP table memory at [mem 0=
xb82d7ce8-0xb82d7d1b]
Nov 21 16:56:27 faldara kernel: ACPI: Reserving DBG2 table memory at [mem 0=
xb82d7d20-0xb82d7d73]
Nov 21 16:56:27 faldara kernel: No NUMA configuration found
Nov 21 16:56:27 faldara kernel: Faking a node at [mem 0x0000000000000000-0x=
0000000436ffffff]
Nov 21 16:56:27 faldara kernel: NODE_DATA(0) allocated [mem 0x436fd5000-0x4=
36ffffff]
Nov 21 16:56:27 faldara kernel: Zone ranges:
Nov 21 16:56:27 faldara kernel:   DMA      [mem 0x0000000000001000-0x000000=
0000ffffff]
Nov 21 16:56:27 faldara kernel:   DMA32    [mem 0x0000000001000000-0x000000=
00ffffffff]
Nov 21 16:56:27 faldara kernel:   Normal   [mem 0x0000000100000000-0x000000=
0436ffffff]
Nov 21 16:56:27 faldara kernel:   Device   empty
Nov 21 16:56:27 faldara kernel: Movable zone start for each node
Nov 21 16:56:27 faldara kernel: Early memory node ranges
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x0000000000001000-0x00000=
00000057fff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x0000000000059000-0x00000=
0000009efff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x0000000000100000-0x00000=
000b82a2fff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x00000000b82d8000-0x00000=
000b8679fff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x00000000b867c000-0x00000=
000c533dfff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x00000000c6a58000-0x00000=
000c6c12fff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x00000000c7aff000-0x00000=
000c7afffff]
Nov 21 16:56:27 faldara kernel:   node   0: [mem 0x0000000100000000-0x00000=
00436ffffff]
Nov 21 16:56:27 faldara kernel: Initmem setup node 0 [mem 0x000000000000100=
0-0x0000000436ffffff]
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA: 1 pages in unavailable=
 ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA: 1 pages in unavailable=
 ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA: 97 pages in unavailabl=
e ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA32: 53 pages in unavaila=
ble ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA32: 2 pages in unavailab=
le ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA32: 5914 pages in unavai=
lable ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone DMA32: 3820 pages in unavai=
lable ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone Normal: 1280 pages in unava=
ilable ranges
Nov 21 16:56:27 faldara kernel: On node 0, zone Normal: 4096 pages in unava=
ilable ranges
Nov 21 16:56:27 faldara kernel: ACPI: PM-Timer IO Port: 0x1808
Nov 21 16:56:27 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge li=
nt[0x1])
Nov 21 16:56:27 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge li=
nt[0x1])
Nov 21 16:56:27 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge li=
nt[0x1])
Nov 21 16:56:27 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge li=
nt[0x1])
Nov 21 16:56:27 faldara kernel: IOAPIC[0]: apic_id 2, version 32, address 0=
xfec00000, GSI 0-119
Nov 21 16:56:27 faldara kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_i=
rq 2 dfl dfl)
Nov 21 16:56:27 faldara kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_i=
rq 9 high level)
Nov 21 16:56:27 faldara kernel: ACPI: Using ACPI (MADT) for SMP configurati=
on information
Nov 21 16:56:27 faldara kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
Nov 21 16:56:27 faldara kernel: e820: update [mem 0xc1c04000-0xc1c49fff] us=
able =3D=3D> reserved
Nov 21 16:56:27 faldara kernel: TSC deadline timer available
Nov 21 16:56:27 faldara kernel: smpboot: Allowing 4 CPUs, 0 hotplug CPUs
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x00000000-0x00000fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x00058000-0x00058fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x0009f000-0x000fffff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb82a3000-0xb82d7fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb867a000-0xb867afff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb867b000-0xb867bfff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc1c04000-0xc1c49fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc3a94000-0xc3a94fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc533e000-0xc6a45fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc6a46000-0xc6a57fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc6c13000-0xc723afff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc723b000-0xc7a8efff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc7a8f000-0xc7afefff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc7b00000-0xc7ffffff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc8000000-0xfdffffff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfe000000-0xfe010fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfe011000-0xfebfffff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfec00000-0xfec00fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfec01000-0xfedfffff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfee00000-0xfee00fff]
Nov 21 16:56:27 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfee01000-0xffffffff]
Nov 21 16:56:27 faldara kernel: [mem 0xc8000000-0xfdffffff] available for P=
CI devices
Nov 21 16:56:27 faldara kernel: Booting paravirtualized kernel on bare hard=
ware
Nov 21 16:56:27 faldara kernel: clocksource: refined-jiffies: mask: 0xfffff=
fff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Nov 21 16:56:27 faldara kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:=
4 nr_cpu_ids:4 nr_node_ids:1
Nov 21 16:56:27 faldara kernel: percpu: Embedded 63 pages/cpu s221184 r8192=
 d28672 u524288
Nov 21 16:56:27 faldara kernel: pcpu-alloc: s221184 r8192 d28672 u524288 al=
loc=3D1*2097152
Nov 21 16:56:27 faldara kernel: pcpu-alloc: [0] 0 1 2 3=20
Nov 21 16:56:27 faldara kernel: Kernel command line: BOOT_IMAGE=3D/boot/vml=
inuz-6.7.0-rc2+ root=3D/dev/mapper/faldara-bullseye
Nov 21 16:56:27 faldara kernel: Unknown kernel command line parameters "BOO=
T_IMAGE=3D/boot/vmlinuz-6.7.0-rc2+", will be passed to user space.
Nov 21 16:56:27 faldara kernel: random: crng init done
Nov 21 16:56:27 faldara kernel: Dentry cache hash table entries: 2097152 (o=
rder: 12, 16777216 bytes, linear)
Nov 21 16:56:27 faldara kernel: Inode-cache hash table entries: 1048576 (or=
der: 11, 8388608 bytes, linear)
Nov 21 16:56:27 faldara kernel: Fallback order for Node 0: 0=20
Nov 21 16:56:27 faldara kernel: Built 1 zonelists, mobility grouping on.  T=
otal pages: 4113583
Nov 21 16:56:27 faldara kernel: Policy zone: Normal
Nov 21 16:56:27 faldara kernel: mem auto-init: stack:off, heap alloc:on, he=
ap free:off
Nov 21 16:56:27 faldara kernel: software IO TLB: area num 4.
Nov 21 16:56:27 faldara kernel: Memory: 2745564K/16716160K available (14336=
K kernel code, 2315K rwdata, 7440K rodata, 2768K init, 4900K bss, 943088K r=
eserved, 0K cma-reserved)
Nov 21 16:56:27 faldara kernel: SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D4, Nodes=3D1
Nov 21 16:56:27 faldara kernel: ftrace: allocating 42256 entries in 166 pag=
es
Nov 21 16:56:27 faldara kernel: ftrace: allocated 166 pages with 4 groups
Nov 21 16:56:27 faldara kernel: Dynamic Preempt: voluntary
Nov 21 16:56:27 faldara kernel: rcu: Preemptible hierarchical RCU implement=
ation.
Nov 21 16:56:27 faldara kernel: rcu:         RCU restricting CPUs from NR_C=
PUS=3D8192 to nr_cpu_ids=3D4.
Nov 21 16:56:27 faldara kernel:         Trampoline variant of Tasks RCU ena=
bled.
Nov 21 16:56:27 faldara kernel:         Rude variant of Tasks RCU enabled.
Nov 21 16:56:27 faldara kernel:         Tracing variant of Tasks RCU enable=
d.
Nov 21 16:56:27 faldara kernel: rcu: RCU calculated value of scheduler-enli=
stment delay is 25 jiffies.
Nov 21 16:56:27 faldara kernel: rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D4
Nov 21 16:56:27 faldara kernel: NR_IRQS: 524544, nr_irqs: 1024, preallocate=
d irqs: 16
Nov 21 16:56:27 faldara kernel: rcu: srcu_init: Setting srcu_struct sizes b=
ased on contention.
Nov 21 16:56:27 faldara kernel: Console: colour dummy device 80x25
Nov 21 16:56:27 faldara kernel: printk: legacy console [tty0] enabled
Nov 21 16:56:27 faldara kernel: ACPI: Core revision 20230628
Nov 21 16:56:27 faldara kernel: clocksource: hpet: mask: 0xffffffff max_cyc=
les: 0xffffffff, max_idle_ns: 79635855245 ns
Nov 21 16:56:27 faldara kernel: APIC: Switch to symmetric I/O mode setup
Nov 21 16:56:27 faldara kernel: x2apic: IRQ remapping doesn't support X2API=
C mode
Nov 21 16:56:27 faldara kernel: ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 a=
pic2=3D-1 pin2=3D-1
Nov 21 16:56:27 faldara kernel: clocksource: tsc-early: mask: 0xfffffffffff=
fffff max_cycles: 0x3272fd97217, max_idle_ns: 440795241220 ns
Nov 21 16:56:27 faldara kernel: Calibrating delay loop (skipped), value cal=
culated using timer frequency.. 6999.82 BogoMIPS (lpj=3D13999648)
Nov 21 16:56:27 faldara kernel: CPU0: Thermal monitoring enabled (TM1)
Nov 21 16:56:27 faldara kernel: process: using mwait in idle threads
Nov 21 16:56:27 faldara kernel: Last level iTLB entries: 4KB 128, 2MB 8, 4M=
B 8
Nov 21 16:56:27 faldara kernel: Last level dTLB entries: 4KB 64, 2MB 0, 4MB=
 0, 1GB 4
Nov 21 16:56:27 faldara kernel: Spectre V1 : Mitigation: usercopy/swapgs ba=
rriers and __user pointer sanitization
Nov 21 16:56:27 faldara kernel: Spectre V2 : Kernel not compiled with retpo=
line; no mitigation available!
Nov 21 16:56:27 faldara kernel: Spectre V2 : Vulnerable
Nov 21 16:56:27 faldara kernel: Spectre V2 : Spectre v2 / SpectreRSB mitiga=
tion: Filling RSB on context switch
Nov 21 16:56:27 faldara kernel: Spectre V2 : Enabling Restricted Speculatio=
n for firmware calls
Nov 21 16:56:27 faldara kernel: RETBleed: WARNING: Spectre v2 mitigation le=
aves CPU vulnerable to RETBleed attacks, data leaks possible!
Nov 21 16:56:27 faldara kernel: RETBleed: Vulnerable
Nov 21 16:56:27 faldara kernel: Spectre V2 : mitigation: Enabling condition=
al Indirect Branch Prediction Barrier
Nov 21 16:56:27 faldara kernel: Speculative Store Bypass: Vulnerable
Nov 21 16:56:27 faldara kernel: MDS: Vulnerable: Clear CPU buffers attempte=
d, no microcode
Nov 21 16:56:27 faldara kernel: TAA: Vulnerable: Clear CPU buffers attempte=
d, no microcode
Nov 21 16:56:27 faldara kernel: MMIO Stale Data: Vulnerable: Clear CPU buff=
ers attempted, no microcode
Nov 21 16:56:27 faldara kernel: SRBDS: Vulnerable: No microcode
Nov 21 16:56:27 faldara kernel: GDS: Vulnerable: No microcode
Nov 21 16:56:27 faldara kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x=
87 floating point registers'
Nov 21 16:56:27 faldara kernel: x86/fpu: Supporting XSAVE feature 0x002: 'S=
SE registers'
Nov 21 16:56:27 faldara kernel: x86/fpu: Supporting XSAVE feature 0x004: 'A=
VX registers'
Nov 21 16:56:27 faldara kernel: x86/fpu: Supporting XSAVE feature 0x008: 'M=
PX bounds registers'
Nov 21 16:56:27 faldara kernel: x86/fpu: Supporting XSAVE feature 0x010: 'M=
PX CSR'
Nov 21 16:56:27 faldara kernel: x86/fpu: xstate_offset[2]:  576, xstate_siz=
es[2]:  256
Nov 21 16:56:27 faldara kernel: x86/fpu: xstate_offset[3]:  832, xstate_siz=
es[3]:   64
Nov 21 16:56:27 faldara kernel: x86/fpu: xstate_offset[4]:  896, xstate_siz=
es[4]:   64
Nov 21 16:56:27 faldara kernel: x86/fpu: Enabled xstate features 0x1f, cont=
ext size is 960 bytes, using 'compacted' format.
Nov 21 16:56:27 faldara kernel: Freeing SMP alternatives memory: 36K
Nov 21 16:56:27 faldara kernel: pid_max: default: 32768 minimum: 301
Nov 21 16:56:27 faldara kernel: LSM: initializing lsm=3Dlockdown,capability=
,landlock,yama,apparmor,tomoyo,bpf,integrity
Nov 21 16:56:27 faldara kernel: landlock: Up and running.
Nov 21 16:56:27 faldara kernel: Yama: becoming mindful.
Nov 21 16:56:27 faldara kernel: AppArmor: AppArmor initialized
Nov 21 16:56:27 faldara kernel: TOMOYO Linux initialized
Nov 21 16:56:27 faldara kernel: LSM support for eBPF active
Nov 21 16:56:27 faldara kernel: Mount-cache hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
Nov 21 16:56:27 faldara kernel: Mountpoint-cache hash table entries: 32768 =
(order: 6, 262144 bytes, linear)
Nov 21 16:56:27 faldara kernel: smpboot: CPU0: Intel(R) Core(TM) i5-6600K C=
PU @ 3.50GHz (family: 0x6, model: 0x5e, stepping: 0x3)
Nov 21 16:56:27 faldara kernel: RCU Tasks: Setting shift to 2 and lim to 1 =
rcu_task_cb_adjust=3D1.
Nov 21 16:56:27 faldara kernel: RCU Tasks Rude: Setting shift to 2 and lim =
to 1 rcu_task_cb_adjust=3D1.
Nov 21 16:56:27 faldara kernel: RCU Tasks Trace: Setting shift to 2 and lim=
 to 1 rcu_task_cb_adjust=3D1.
Nov 21 16:56:27 faldara kernel: Performance Events: PEBS fmt3+, Skylake eve=
nts, 32-deep LBR, full-width counters, Intel PMU driver.
Nov 21 16:56:27 faldara kernel: ... version:                4
Nov 21 16:56:27 faldara kernel: ... bit width:              48
Nov 21 16:56:27 faldara kernel: ... generic registers:      8
Nov 21 16:56:27 faldara kernel: ... value mask:             0000ffffffffffff
Nov 21 16:56:27 faldara kernel: ... max period:             00007fffffffffff
Nov 21 16:56:27 faldara kernel: ... fixed-purpose events:   3
Nov 21 16:56:27 faldara kernel: ... event mask:             00000007000000ff
Nov 21 16:56:27 faldara kernel: signal: max sigframe size: 2032
Nov 21 16:56:27 faldara kernel: Estimated ratio of average max frequency by=
 base frequency (times 1024): 1141
Nov 21 16:56:27 faldara kernel: rcu: Hierarchical SRCU implementation.
Nov 21 16:56:27 faldara kernel: rcu:         Max phase no-delay instances i=
s 1000.
Nov 21 16:56:27 faldara kernel: NMI watchdog: Enabled. Permanently consumes=
 one hw-PMU counter.
Nov 21 16:56:27 faldara kernel: smp: Bringing up secondary CPUs ...
Nov 21 16:56:27 faldara kernel: smpboot: x86: Booting SMP configuration:
Nov 21 16:56:27 faldara kernel: .... node  #0, CPUs:      #1 #2 #3
Nov 21 16:56:27 faldara kernel: smp: Brought up 1 node, 4 CPUs
Nov 21 16:56:27 faldara kernel: smpboot: Max logical packages: 1
Nov 21 16:56:27 faldara kernel: smpboot: Total of 4 processors activated (2=
7999.29 BogoMIPS)
Nov 21 16:56:27 faldara kernel: node 0 deferred pages initialised in 20ms
Nov 21 16:56:27 faldara kernel: devtmpfs: initialized
Nov 21 16:56:27 faldara kernel: x86/mm: Memory block size: 128MB
Nov 21 16:56:27 faldara kernel: ACPI: PM: Registering ACPI NVS region [mem =
0xb867a000-0xb867afff] (4096 bytes)
Nov 21 16:56:27 faldara kernel: ACPI: PM: Registering ACPI NVS region [mem =
0xc6c13000-0xc723afff] (6455296 bytes)
Nov 21 16:56:27 faldara kernel: clocksource: jiffies: mask: 0xffffffff max_=
cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Nov 21 16:56:27 faldara kernel: futex hash table entries: 1024 (order: 4, 6=
5536 bytes, linear)
Nov 21 16:56:27 faldara kernel: pinctrl core: initialized pinctrl subsystem
Nov 21 16:56:27 faldara kernel: NET: Registered PF_NETLINK/PF_ROUTE protoco=
l family
Nov 21 16:56:27 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL pool =
for atomic allocations
Nov 21 16:56:27 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL|GFP_D=
MA pool for atomic allocations
Nov 21 16:56:27 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL|GFP_D=
MA32 pool for atomic allocations
Nov 21 16:56:27 faldara kernel: audit: initializing netlink subsys (disable=
d)
Nov 21 16:56:27 faldara kernel: audit: type=3D2000 audit(1700603776.060:1):=
 state=3Dinitialized audit_enabled=3D0 res=3D1
Nov 21 16:56:27 faldara kernel: thermal_sys: Registered thermal governor 'f=
air_share'
Nov 21 16:56:27 faldara kernel: thermal_sys: Registered thermal governor 'b=
ang_bang'
Nov 21 16:56:27 faldara kernel: thermal_sys: Registered thermal governor 's=
tep_wise'
Nov 21 16:56:27 faldara kernel: thermal_sys: Registered thermal governor 'u=
ser_space'
Nov 21 16:56:27 faldara kernel: thermal_sys: Registered thermal governor 'p=
ower_allocator'
Nov 21 16:56:27 faldara kernel: cpuidle: using governor ladder
Nov 21 16:56:27 faldara kernel: cpuidle: using governor menu
Nov 21 16:56:27 faldara kernel: ACPI FADT declares the system doesn't suppo=
rt PCIe ASPM, so disable it
Nov 21 16:56:27 faldara kernel: acpiphp: ACPI Hot Plug PCI Controller Drive=
r version: 0.5
Nov 21 16:56:27 faldara kernel: PCI: MMCONFIG for domain 0000 [bus 00-3f] a=
t [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
Nov 21 16:56:27 faldara kernel: PCI: not using MMCONFIG
Nov 21 16:56:27 faldara kernel: PCI: Using configuration type 1 for base ac=
cess
Nov 21 16:56:27 faldara kernel: kprobes: kprobe jump-optimization is enable=
d. All kprobes are optimized if possible.
Nov 21 16:56:27 faldara kernel: HugeTLB: registered 1.00 GiB page size, pre=
-allocated 0 pages
Nov 21 16:56:27 faldara kernel: HugeTLB: 16380 KiB vmemmap can be freed for=
 a 1.00 GiB page
Nov 21 16:56:27 faldara kernel: HugeTLB: registered 2.00 MiB page size, pre=
-allocated 0 pages
Nov 21 16:56:27 faldara kernel: HugeTLB: 28 KiB vmemmap can be freed for a =
2.00 MiB page
Nov 21 16:56:27 faldara kernel: ACPI: Added _OSI(Module Device)
Nov 21 16:56:27 faldara kernel: ACPI: Added _OSI(Processor Device)
Nov 21 16:56:27 faldara kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Nov 21 16:56:27 faldara kernel: ACPI: Added _OSI(Processor Aggregator Devic=
e)
Nov 21 16:56:27 faldara kernel: ACPI: 9 ACPI AML tables successfully acquir=
ed and loaded
Nov 21 16:56:27 faldara kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) quer=
y ignored
Nov 21 16:56:27 faldara kernel: ACPI: Dynamic OEM Table Load:
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0xFFFF9F968092A800 000738 (v02 P=
mRef  Cpu0Ist  00003000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: Dynamic OEM Table Load:
Nov 21 16:56:27 faldara kernel: ACPI: SSDT 0xFFFF9F9680929000 00065C (v02 P=
mRef  ApIst    00003000 INTL 20160422)
Nov 21 16:56:27 faldara kernel: ACPI: _OSC evaluated successfully for all C=
PUs
Nov 21 16:56:27 faldara kernel: ACPI: EC: EC started
Nov 21 16:56:27 faldara kernel: ACPI: EC: interrupt blocked
Nov 21 16:56:27 faldara kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x=
62
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC us=
ed to handle transactions
Nov 21 16:56:27 faldara kernel: ACPI: Interpreter enabled
Nov 21 16:56:27 faldara kernel: ACPI: PM: (supports S0 S3 S4 S5)
Nov 21 16:56:27 faldara kernel: ACPI: Using IOAPIC for interrupt routing
Nov 21 16:56:27 faldara kernel: PCI: MMCONFIG for domain 0000 [bus 00-3f] a=
t [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
Nov 21 16:56:27 faldara kernel: PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff=
] reserved as ACPI motherboard resource
Nov 21 16:56:27 faldara kernel: PCI: Using host bridge windows from ACPI; i=
f necessary, use "pci=3Dnocrs" and report a bug
Nov 21 16:56:27 faldara kernel: PCI: Using E820 reservations for host bridg=
e windows
Nov 21 16:56:27 faldara kernel: ACPI: Enabled 7 GPEs in block 00 to 7F
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.PEG0.PG00: New power resou=
rce
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.PEG1.PG01: New power resou=
rce
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.PEG2.PG02: New power resou=
rce
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP09.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP10.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP11.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP12.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP13.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP01.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP02.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP03.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP04.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP05.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP06.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP07.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP08.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP17.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP18.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP19.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP20.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP14.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP15.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.RP16.PXSX.WRST: New power =
resource
Nov 21 16:56:27 faldara kernel: ACPI: \_TZ_.FN00: New power resource
Nov 21 16:56:27 faldara kernel: ACPI: \_TZ_.FN01: New power resource
Nov 21 16:56:27 faldara kernel: ACPI: \_TZ_.FN02: New power resource
Nov 21 16:56:27 faldara kernel: ACPI: \_TZ_.FN03: New power resource
Nov 21 16:56:27 faldara kernel: ACPI: \_TZ_.FN04: New power resource
Nov 21 16:56:27 faldara kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [=
bus 00-3e])
Nov 21 16:56:27 faldara kernel: acpi PNP0A08:00: _OSC: OS supports [Extende=
dConfig ASPM ClockPM Segments MSI HPX-Type3]
Nov 21 16:56:27 faldara kernel: acpi PNP0A08:00: _OSC: OS requested [PCIeHo=
tplug SHPCHotplug PME AER PCIeCapability LTR]
Nov 21 16:56:27 faldara kernel: acpi PNP0A08:00: _OSC: platform willing to =
grant [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
Nov 21 16:56:27 faldara kernel: acpi PNP0A08:00: _OSC: platform retains con=
trol of PCIe features (AE_ERROR)
Nov 21 16:56:27 faldara kernel: PCI host bridge to bus 0000:00
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [io  0x0=
000-0x0cf7 window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [io  0x0=
d00-0xffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [mem 0x0=
00a0000-0x000bffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [mem 0xc=
8000000-0xf7ffffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [mem 0xf=
d000000-0xfe7fffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: root bus resource [bus 00-=
3e]
Nov 21 16:56:27 faldara kernel: pci 0000:00:00.0: [8086:191f] type 00 class=
 0x060000
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0: [8086:1901] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:14.0: [8086:a12f] type 00 class=
 0x0c0330
Nov 21 16:56:27 faldara kernel: pci 0000:00:14.0: reg 0x10: [mem 0xf7f30000=
-0xf7f3ffff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:00:14.0: PME# supported from D3hot=
 D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:16.0: [8086:a13a] type 00 class=
 0x078000
Nov 21 16:56:27 faldara kernel: pci 0000:00:16.0: reg 0x10: [mem 0xf7f4d000=
-0xf7f4dfff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:00:16.0: PME# supported from D3hot
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: [8086:a102] type 00 class=
 0x010601
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x10: [mem 0xf7f48000=
-0xf7f49fff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x14: [mem 0xf7f4c000=
-0xf7f4c0ff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x18: [io  0xf050-0xf=
057]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x1c: [io  0xf040-0xf=
043]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x20: [io  0xf020-0xf=
03f]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: reg 0x24: [mem 0xf7f4b000=
-0xf7f4b7ff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:17.0: PME# supported from D3hot
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.0: [8086:a167] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2: [8086:a169] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0: [8086:a110] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0: [8086:a118] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.0: [8086:a145] type 00 class=
 0x060100
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.2: [8086:a121] type 00 class=
 0x058000
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.2: reg 0x10: [mem 0xf7f44000=
-0xf7f47fff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.3: [8086:a170] type 00 class=
 0x040300
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.3: reg 0x10: [mem 0xf7f40000=
-0xf7f43fff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.3: reg 0x20: [mem 0xf7f20000=
-0xf7f2ffff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.3: PME# supported from D3hot=
 D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.4: [8086:a123] type 00 class=
 0x0c0500
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.4: reg 0x10: [mem 0xf7f4a000=
-0xf7f4a0ff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.4: reg 0x20: [io  0xf000-0xf=
01f]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.6: [8086:15b8] type 00 class=
 0x020000
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.6: reg 0x10: [mem 0xf7f00000=
-0xf7f1ffff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.6: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: [1002:1478] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: reg 0x10: [mem 0xf7b00000=
-0xf7b03fff]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: 63.008 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 1=
26.024 Gb/s with 16.0 GT/s PCIe x8 link)
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0: PCI bridge to [bus 01-03]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xf7=
900000-0xf7bfffff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0: [1002:1479] type 01 class=
 0x060400
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0: PME# supported from D0 D3=
hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: PCI bridge to [bus 02-03]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: [1002:73ff] type 00 class=
 0x030000
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: reg 0x10: [mem 0xe0000000=
-0xefffffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: reg 0x18: [mem 0xf0000000=
-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: reg 0x20: [io  0xe000-0xe=
0ff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: reg 0x24: [mem 0xf7900000=
-0xf79fffff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: reg 0x30: [mem 0xf7a00000=
-0xf7a1ffff pref]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: BAR 0: assigned to efifb
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: Video device with shadowe=
d ROM at [mem 0x000c0000-0x000dffff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: PME# supported from D1 D2=
 D3hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: 63.008 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 2=
52.048 Gb/s with 16.0 GT/s PCIe x16 link)
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.1: [1002:ab28] type 00 class=
 0x040300
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.1: reg 0x10: [mem 0xf7a20000=
-0xf7a23fff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.1: PME# supported from D1 D2=
 D3hot D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: acpiphp: Slot [1] registered
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.0: PCI bridge to [bus 04]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.0: [197b:2363] type 00 class=
 0x010601
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.0: reg 0x24: [mem 0xf7e10000=
-0xf7e11fff]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.0: reg 0x30: [mem 0xf7e00000=
-0xf7e0ffff pref]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.0: PME# supported from D3hot
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: [197b:2363] type 00 class=
 0x010185
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: reg 0x10: [io  0xd040-0xd=
047]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: reg 0x14: [io  0xd030-0xd=
033]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: reg 0x18: [io  0xd020-0xd=
027]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: reg 0x1c: [io  0xd010-0xd=
013]
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: reg 0x20: [io  0xd000-0xd=
00f]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2: PCI bridge to [bus 05]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2:   bridge window [io  0xd0=
00-0xdfff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2:   bridge window [mem 0xf7=
e00000-0xf7efffff]
Nov 21 16:56:27 faldara kernel: pci 0000:06:00.0: [1b21:1242] type 00 class=
 0x0c0330
Nov 21 16:56:27 faldara kernel: pci 0000:06:00.0: reg 0x10: [mem 0xf7d00000=
-0xf7d07fff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:06:00.0: enabling Extended Tags
Nov 21 16:56:27 faldara kernel: pci 0000:06:00.0: PME# supported from D3hot=
 D3cold
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0: PCI bridge to [bus 06]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0:   bridge window [mem 0xf7=
d00000-0xf7dfffff]
Nov 21 16:56:27 faldara kernel: pci 0000:07:00.0: [15b7:5011] type 00 class=
 0x010802
Nov 21 16:56:27 faldara kernel: pci 0000:07:00.0: reg 0x10: [mem 0xf7c00000=
-0xf7c03fff 64bit]
Nov 21 16:56:27 faldara kernel: pci 0000:07:00.0: 31.504 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:1d.0 (capable of 6=
3.012 Gb/s with 16.0 GT/s PCIe x4 link)
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0: PCI bridge to [bus 07]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0:   bridge window [mem 0xf7=
c00000-0xf7cfffff]
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKA configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKB configured f=
or IRQ 10
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKC configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKD configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKE configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKF configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKG configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: PCI: Interrupt link LNKH configured f=
or IRQ 11
Nov 21 16:56:27 faldara kernel: ACPI: EC: interrupt unblocked
Nov 21 16:56:27 faldara kernel: ACPI: EC: event unblocked
Nov 21 16:56:27 faldara kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x=
62
Nov 21 16:56:27 faldara kernel: ACPI: EC: GPE=3D0x23
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC in=
itialization complete
Nov 21 16:56:27 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to han=
dle transactions and events
Nov 21 16:56:27 faldara kernel: iommu: Default domain type: Translated
Nov 21 16:56:27 faldara kernel: iommu: DMA domain TLB invalidation policy: =
lazy mode
Nov 21 16:56:27 faldara kernel: pps_core: LinuxPPS API ver. 1 registered
Nov 21 16:56:27 faldara kernel: pps_core: Software ver. 5.3.6 - Copyright 2=
005-2007 Rodolfo Giometti <giometti@linux.it>
Nov 21 16:56:27 faldara kernel: PTP clock support registered
Nov 21 16:56:27 faldara kernel: EDAC MC: Ver: 3.0.0
Nov 21 16:56:27 faldara kernel: efivars: Registered efivars operations
Nov 21 16:56:27 faldara kernel: NetLabel: Initializing
Nov 21 16:56:27 faldara kernel: NetLabel:  domain hash size =3D 128
Nov 21 16:56:27 faldara kernel: NetLabel:  protocols =3D UNLABELED CIPSOv4 =
CALIPSO
Nov 21 16:56:27 faldara kernel: NetLabel:  unlabeled traffic allowed by def=
ault
Nov 21 16:56:27 faldara kernel: PCI: Using ACPI for IRQ routing
Nov 21 16:56:27 faldara kernel: PCI: pci_cache_line_size set to 64 bytes
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0x00058000-0x=
0005ffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0x0009f000-0x=
0009ffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xb82a3000-0x=
bbffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xb867a000-0x=
bbffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xc1c04000-0x=
c3ffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xc3a94000-0x=
c3ffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xc533e000-0x=
c7ffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xc6c13000-0x=
c7ffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0xc7b00000-0x=
c7ffffff]
Nov 21 16:56:27 faldara kernel: e820: reserve RAM buffer [mem 0x437000000-0=
x437ffffff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: vgaarb: setting as boot V=
GA device
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: vgaarb: bridge control po=
ssible
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.0: vgaarb: VGA device added:=
 decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
Nov 21 16:56:27 faldara kernel: vgaarb: loaded
Nov 21 16:56:27 faldara kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0,=
 0, 0, 0, 0
Nov 21 16:56:27 faldara kernel: hpet0: 8 comparators, 64-bit 24.000000 MHz =
counter
Nov 21 16:56:27 faldara kernel: clocksource: Switched to clocksource tsc-ea=
rly
Nov 21 16:56:27 faldara kernel: VFS: Disk quotas dquot_6.6.0
Nov 21 16:56:27 faldara kernel: VFS: Dquot-cache hash table entries: 512 (o=
rder 0, 4096 bytes)
Nov 21 16:56:27 faldara kernel: AppArmor: AppArmor Filesystem Enabled
Nov 21 16:56:27 faldara kernel: pnp: PnP ACPI init
Nov 21 16:56:27 faldara kernel: system 00:00: [io  0x0290-0x029f] has been =
reserved
Nov 21 16:56:27 faldara kernel: pnp 00:01: [dma 0 disabled]
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0x0680-0x069f] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0xffff] has been reserved
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0xffff] has been reserved
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0xffff] has been reserved
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0x1800-0x18fe] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:02: [io  0x164e-0x164f] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:03: [io  0x0800-0x087f] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:05: [io  0x1854-0x1857] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed10000-0xfed17fff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed18000-0xfed18fff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed19000-0xfed19fff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xf8000000-0xfbffffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed20000-0xfed3ffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed90000-0xfed93fff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfed45000-0xfed8ffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xff000000-0xffffffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xfee00000-0xfeefffff] c=
ould not be reserved
Nov 21 16:56:27 faldara kernel: system 00:06: [mem 0xf7fc0000-0xf7fdffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfd000000-0xfdabffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfdad0000-0xfdadffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfdac0000-0xfdacffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfdae0000-0xfdaeffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfdaf0000-0xfdafffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfdb00000-0xfdffffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfe000000-0xfe01ffff] c=
ould not be reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfe036000-0xfe03bfff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfe03d000-0xfe3fffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:07: [mem 0xfe410000-0xfe7fffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:08: [io  0xfe00-0xfefe] has been =
reserved
Nov 21 16:56:27 faldara kernel: system 00:09: [mem 0xfdaf0000-0xfdafffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:09: [mem 0xfdae0000-0xfdaeffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: system 00:09: [mem 0xfdac0000-0xfdacffff] h=
as been reserved
Nov 21 16:56:27 faldara kernel: pnp: PnP ACPI: found 10 devices
Nov 21 16:56:27 faldara kernel: clocksource: acpi_pm: mask: 0xffffff max_cy=
cles: 0xffffff, max_idle_ns: 2085701024 ns
Nov 21 16:56:27 faldara kernel: NET: Registered PF_INET protocol family
Nov 21 16:56:27 faldara kernel: IP idents hash table entries: 262144 (order=
: 9, 2097152 bytes, linear)
Nov 21 16:56:27 faldara kernel: tcp_listen_portaddr_hash hash table entries=
: 8192 (order: 5, 131072 bytes, linear)
Nov 21 16:56:27 faldara kernel: Table-perturb hash table entries: 65536 (or=
der: 6, 262144 bytes, linear)
Nov 21 16:56:27 faldara kernel: TCP established hash table entries: 131072 =
(order: 8, 1048576 bytes, linear)
Nov 21 16:56:27 faldara kernel: TCP bind hash table entries: 65536 (order: =
9, 2097152 bytes, linear)
Nov 21 16:56:27 faldara kernel: TCP: Hash tables configured (established 13=
1072 bind 65536)
Nov 21 16:56:27 faldara kernel: MPTCP token hash table entries: 16384 (orde=
r: 6, 393216 bytes, linear)
Nov 21 16:56:27 faldara kernel: UDP hash table entries: 8192 (order: 6, 262=
144 bytes, linear)
Nov 21 16:56:27 faldara kernel: UDP-Lite hash table entries: 8192 (order: 6=
, 262144 bytes, linear)
Nov 21 16:56:27 faldara kernel: NET: Registered PF_UNIX/PF_LOCAL protocol f=
amily
Nov 21 16:56:27 faldara kernel: NET: Registered PF_XDP protocol family
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0: PCI bridge to [bus 02-03]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0: PCI bridge to [bus 01-03]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [io  0xe0=
00-0xefff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xf7=
900000-0xf7bfffff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.0: PCI bridge to [bus 04]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2: PCI bridge to [bus 05]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2:   bridge window [io  0xd0=
00-0xdfff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1b.2:   bridge window [mem 0xf7=
e00000-0xf7efffff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0: PCI bridge to [bus 06]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1c.0:   bridge window [mem 0xf7=
d00000-0xf7dfffff]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0: PCI bridge to [bus 07]
Nov 21 16:56:27 faldara kernel: pci 0000:00:1d.0:   bridge window [mem 0xf7=
c00000-0xf7cfffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0=
cf7 window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xf=
fff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000=
-0x000bffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: resource 7 [mem 0xc8000000=
-0xf7ffffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:00: resource 8 [mem 0xfd000000=
-0xfe7fffff window]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:01: resource 0 [io  0xe000-0xe=
fff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:01: resource 1 [mem 0xf7900000=
-0xf7bfffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:01: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:02: resource 0 [io  0xe000-0xe=
fff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:02: resource 1 [mem 0xf7900000=
-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:02: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:03: resource 0 [io  0xe000-0xe=
fff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:03: resource 1 [mem 0xf7900000=
-0xf7afffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:03: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:05: resource 0 [io  0xd000-0xd=
fff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:05: resource 1 [mem 0xf7e00000=
-0xf7efffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:06: resource 1 [mem 0xf7d00000=
-0xf7dfffff]
Nov 21 16:56:27 faldara kernel: pci_bus 0000:07: resource 1 [mem 0xf7c00000=
-0xf7cfffff]
Nov 21 16:56:27 faldara kernel: pci 0000:03:00.1: D0 power state depends on=
 0000:03:00.0
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.0: async suspend disabled to=
 avoid multi-function power-on ordering issue
Nov 21 16:56:27 faldara kernel: pci 0000:05:00.1: async suspend disabled to=
 avoid multi-function power-on ordering issue
Nov 21 16:56:27 faldara kernel: PCI: CLS 64 bytes, default 64
Nov 21 16:56:27 faldara kernel: PCI-DMA: Using software bounce buffering fo=
r IO (SWIOTLB)
Nov 21 16:56:27 faldara kernel: software IO TLB: mapped [mem 0x00000000b42a=
3000-0x00000000b82a3000] (64MB)
Nov 21 16:56:27 faldara kernel: Unpacking initramfs...
Nov 21 16:56:27 faldara kernel: Initialise system trusted keyrings
Nov 21 16:56:27 faldara kernel: Key type blacklist registered
Nov 21 16:56:27 faldara kernel: workingset: timestamp_bits=3D36 max_order=
=3D22 bucket_order=3D0
Nov 21 16:56:27 faldara kernel: zbud: loaded
Nov 21 16:56:27 faldara kernel: integrity: Platform Keyring initialized
Nov 21 16:56:27 faldara kernel: integrity: Machine keyring initialized
Nov 21 16:56:27 faldara kernel: Key type asymmetric registered
Nov 21 16:56:27 faldara kernel: Asymmetric key parser 'x509' registered
Nov 21 16:56:27 faldara kernel: tsc: Refined TSC clocksource calibration: 3=
503.999 MHz
Nov 21 16:56:27 faldara kernel: clocksource: tsc: mask: 0xffffffffffffffff =
max_cycles: 0x3282124c47b, max_idle_ns: 440795239402 ns
Nov 21 16:56:27 faldara kernel: clocksource: Switched to clocksource tsc
Nov 21 16:56:27 faldara kernel: Freeing initrd memory: 340080K
Nov 21 16:56:27 faldara kernel: Block layer SCSI generic (bsg) driver versi=
on 0.4 loaded (major 247)
Nov 21 16:56:27 faldara kernel: io scheduler mq-deadline registered
Nov 21 16:56:27 faldara kernel: shpchp: Standard Hot Plug PCI Controller Dr=
iver version: 0.4
Nov 21 16:56:27 faldara kernel: efifb: probing for efifb
Nov 21 16:56:27 faldara kernel: efifb: framebuffer at 0xe0000000, using 198=
4k, total 1984k
Nov 21 16:56:27 faldara kernel: efifb: mode is 800x600x32, linelength=3D332=
8, pages=3D1
Nov 21 16:56:27 faldara kernel: efifb: scrolling: redraw
Nov 21 16:56:27 faldara kernel: efifb: Truecolor: size=3D8:8:8:8, shift=3D2=
4:16:8:0
Nov 21 16:56:27 faldara kernel: Console: switching to colour frame buffer d=
evice 100x37
Nov 21 16:56:27 faldara kernel: fb0: EFI VGA frame buffer device
Nov 21 16:56:27 faldara kernel: thermal LNXTHERM:00: registered as thermal_=
zone0
Nov 21 16:56:27 faldara kernel: ACPI: thermal: Thermal Zone [TZ00] (28 C)
Nov 21 16:56:27 faldara kernel: thermal LNXTHERM:01: registered as thermal_=
zone1
Nov 21 16:56:27 faldara kernel: ACPI: thermal: Thermal Zone [TZ01] (30 C)
Nov 21 16:56:27 faldara kernel: Serial: 8250/16550 driver, 4 ports, IRQ sha=
ring enabled
Nov 21 16:56:27 faldara kernel: 00:01: ttyS0 at I/O 0x3f8 (irq =3D 4, base_=
baud =3D 115200) is a 16550A
Nov 21 16:56:27 faldara kernel: Linux agpgart interface v0.103
Nov 21 16:56:27 faldara kernel: i8042: PNP: No PS/2 controller found.
Nov 21 16:56:27 faldara kernel: mousedev: PS/2 mouse device common for all =
mice
Nov 21 16:56:27 faldara kernel: rtc_cmos 00:04: RTC can wake from S4
Nov 21 16:56:27 faldara kernel: rtc_cmos 00:04: registered as rtc0
Nov 21 16:56:27 faldara kernel: rtc_cmos 00:04: setting system clock to 202=
3-11-21T21:56:20 UTC (1700603780)
Nov 21 16:56:27 faldara kernel: rtc_cmos 00:04: alarms up to one month, y3k=
, 242 bytes nvram
Nov 21 16:56:27 faldara kernel: intel_pstate: Intel P-state driver initiali=
zing
Nov 21 16:56:27 faldara kernel: intel_pstate: HWP enabled
Nov 21 16:56:27 faldara kernel: ledtrig-cpu: registered to indicate activit=
y on CPUs
Nov 21 16:56:27 faldara kernel: NET: Registered PF_INET6 protocol family
Nov 21 16:56:27 faldara kernel: Segment Routing with IPv6
Nov 21 16:56:27 faldara kernel: In-situ OAM (IOAM) with IPv6
Nov 21 16:56:27 faldara kernel: mip6: Mobile IPv6
Nov 21 16:56:27 faldara kernel: NET: Registered PF_PACKET protocol family
Nov 21 16:56:27 faldara kernel: microcode: Microcode Update Driver: v2.2.
Nov 21 16:56:27 faldara kernel: IPI shorthand broadcast: enabled
Nov 21 16:56:27 faldara kernel: sched_clock: Marking stable (3864001610, 55=
6858)->(3895657654, -31099186)
Nov 21 16:56:27 faldara kernel: registered taskstats version 1
Nov 21 16:56:27 faldara kernel: Loading compiled-in X.509 certificates
Nov 21 16:56:27 faldara kernel: Loaded X.509 cert 'Build time autogenerated=
 kernel key: 0d2878742af2857d384a6188ea1d09159a9f8e21'
Nov 21 16:56:27 faldara kernel: Key type .fscrypt registered
Nov 21 16:56:27 faldara kernel: Key type fscrypt-provisioning registered
Nov 21 16:56:27 faldara kernel: Key type encrypted registered
Nov 21 16:56:27 faldara kernel: AppArmor: AppArmor sha1 policy hashing enab=
led
Nov 21 16:56:27 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Nov 21 16:56:27 faldara kernel: integrity: Loaded X.509 cert 'ASUSTeK Mothe=
rBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
Nov 21 16:56:27 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Nov 21 16:56:27 faldara kernel: integrity: Loaded X.509 cert 'ASUSTeK Noteb=
ook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
Nov 21 16:56:27 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Nov 21 16:56:27 faldara kernel: integrity: Loaded X.509 cert 'Microsoft Cor=
poration UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
Nov 21 16:56:27 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Nov 21 16:56:27 faldara kernel: integrity: Loaded X.509 cert 'Microsoft Win=
dows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
Nov 21 16:56:27 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Nov 21 16:56:27 faldara kernel: integrity: Loaded X.509 cert 'Canonical Ltd=
. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
Nov 21 16:56:27 faldara kernel: ima: No TPM chip found, activating TPM-bypa=
ss!
Nov 21 16:56:27 faldara kernel: ima: Allocated hash algorithm: sha256
Nov 21 16:56:27 faldara kernel: ima: No architecture policies found
Nov 21 16:56:27 faldara kernel: evm: Initialising EVM extended attributes:
Nov 21 16:56:27 faldara kernel: evm: security.selinux
Nov 21 16:56:27 faldara kernel: evm: security.SMACK64 (disabled)
Nov 21 16:56:27 faldara kernel: evm: security.SMACK64EXEC (disabled)
Nov 21 16:56:27 faldara kernel: evm: security.SMACK64TRANSMUTE (disabled)
Nov 21 16:56:27 faldara kernel: evm: security.SMACK64MMAP (disabled)
Nov 21 16:56:27 faldara kernel: evm: security.apparmor
Nov 21 16:56:27 faldara kernel: evm: security.ima
Nov 21 16:56:27 faldara kernel: evm: security.capability
Nov 21 16:56:27 faldara kernel: evm: HMAC attrs: 0x1
Nov 21 16:56:27 faldara kernel: RAS: Correctable Errors collector initializ=
ed.
Nov 21 16:56:27 faldara kernel: clk: Disabling unused clocks
Nov 21 16:56:27 faldara kernel: Freeing unused decrypted memory: 2036K
Nov 21 16:56:27 faldara kernel: Freeing unused kernel image (initmem) memor=
y: 2768K
Nov 21 16:56:27 faldara kernel: Write protecting the kernel read-only data:=
 22528k
Nov 21 16:56:27 faldara kernel: Freeing unused kernel image (rodata/data ga=
p) memory: 752K
Nov 21 16:56:27 faldara kernel: x86/mm: Checked W+X mappings: passed, no W+=
X pages found.
Nov 21 16:56:27 faldara kernel: Run /init as init process
Nov 21 16:56:27 faldara kernel:   with arguments:
Nov 21 16:56:27 faldara kernel:     /init
Nov 21 16:56:27 faldara kernel:   with environment:
Nov 21 16:56:27 faldara kernel:     HOME=3D/
Nov 21 16:56:27 faldara kernel:     TERM=3Dlinux
Nov 21 16:56:27 faldara kernel:     BOOT_IMAGE=3D/boot/vmlinuz-6.7.0-rc2+
Nov 21 16:56:27 faldara kernel: i801_smbus 0000:00:1f.4: SPD Write Disable =
is set
Nov 21 16:56:27 faldara kernel: i801_smbus 0000:00:1f.4: SMBus using PCI in=
terrupt
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.1: [8086:a120] type 00 class=
 0x058000
Nov 21 16:56:27 faldara kernel: pci 0000:00:1f.1: reg 0x10: [mem 0xfd000000=
-0xfdffffff 64bit]
Nov 21 16:56:27 faldara kernel: i2c i2c-0: 2/4 memory slots populated (from=
 DMI)
Nov 21 16:56:27 faldara kernel: i2c i2c-0: Successfully instantiated SPD at=
 0x52
Nov 21 16:56:27 faldara kernel: i2c i2c-0: Successfully instantiated SPD at=
 0x53
Nov 21 16:56:27 faldara kernel: e1000e: Intel(R) PRO/1000 Network Driver
Nov 21 16:56:27 faldara kernel: e1000e: Copyright(c) 1999 - 2015 Intel Corp=
oration.
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6: Interrupt Throttling R=
ate (ints/sec) set to dynamic conservative mode
Nov 21 16:56:27 faldara kernel: ACPI: bus type USB registered
Nov 21 16:56:27 faldara kernel: usbcore: registered new interface driver us=
bfs
Nov 21 16:56:27 faldara kernel: usbcore: registered new interface driver hub
Nov 21 16:56:27 faldara kernel: usbcore: registered new device driver usb
Nov 21 16:56:27 faldara kernel: SCSI subsystem initialized
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: new USB bus register=
ed, assigned bus number 1
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c=
1 hci version 0x100 quirks 0x0000000001109810
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: new USB bus register=
ed, assigned bus number 2
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:00:14.0: Host supports USB 3.=
0 SuperSpeed
Nov 21 16:56:27 faldara kernel: usb usb1: New USB device found, idVendor=3D=
1d6b, idProduct=3D0002, bcdDevice=3D 6.07
Nov 21 16:56:27 faldara kernel: usb usb1: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Nov 21 16:56:27 faldara kernel: usb usb1: Product: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: usb usb1: Manufacturer: Linux 6.7.0-rc2+ xh=
ci-hcd
Nov 21 16:56:27 faldara kernel: usb usb1: SerialNumber: 0000:00:14.0
Nov 21 16:56:27 faldara kernel: hub 1-0:1.0: USB hub found
Nov 21 16:56:27 faldara kernel: hub 1-0:1.0: 16 ports detected
Nov 21 16:56:27 faldara kernel: usb usb2: New USB device found, idVendor=3D=
1d6b, idProduct=3D0003, bcdDevice=3D 6.07
Nov 21 16:56:27 faldara kernel: usb usb2: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Nov 21 16:56:27 faldara kernel: usb usb2: Product: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: usb usb2: Manufacturer: Linux 6.7.0-rc2+ xh=
ci-hcd
Nov 21 16:56:27 faldara kernel: usb usb2: SerialNumber: 0000:00:14.0
Nov 21 16:56:27 faldara kernel: hub 2-0:1.0: USB hub found
Nov 21 16:56:27 faldara kernel: hub 2-0:1.0: 10 ports detected
Nov 21 16:56:27 faldara kernel: usb: port power management may be unreliable
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: new USB bus register=
ed, assigned bus number 3
Nov 21 16:56:27 faldara kernel: libata version 3.00 loaded.
Nov 21 16:56:27 faldara kernel: ACPI: bus type drm_connector registered
Nov 21 16:56:27 faldara kernel: ahci 0000:00:17.0: version 3.0
Nov 21 16:56:27 faldara kernel: ahci 0000:00:17.0: AHCI 0001.0301 32 slots =
6 ports 6 Gbps 0x3f impl SATA mode
Nov 21 16:56:27 faldara kernel: ahci 0000:00:17.0: flags: 64bit ncq sntf le=
d clo only pio slum part ems deso sadm sds apst=20
Nov 21 16:56:27 faldara kernel: nvme nvme0: pci function 0000:07:00.0
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: hcc params 0x0200eec=
0 hci version 0x110 quirks 0x0000000000800010
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: new USB bus register=
ed, assigned bus number 4
Nov 21 16:56:27 faldara kernel: xhci_hcd 0000:06:00.0: Host supports USB 3.=
1 Enhanced SuperSpeed
Nov 21 16:56:27 faldara kernel: usb usb3: New USB device found, idVendor=3D=
1d6b, idProduct=3D0002, bcdDevice=3D 6.07
Nov 21 16:56:27 faldara kernel: usb usb3: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Nov 21 16:56:27 faldara kernel: usb usb3: Product: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: usb usb3: Manufacturer: Linux 6.7.0-rc2+ xh=
ci-hcd
Nov 21 16:56:27 faldara kernel: usb usb3: SerialNumber: 0000:06:00.0
Nov 21 16:56:27 faldara kernel: hub 3-0:1.0: USB hub found
Nov 21 16:56:27 faldara kernel: hub 3-0:1.0: 2 ports detected
Nov 21 16:56:27 faldara kernel: usb usb4: We don't know the algorithms for =
LPM for this host, disabling LPM.
Nov 21 16:56:27 faldara kernel: usb usb4: New USB device found, idVendor=3D=
1d6b, idProduct=3D0003, bcdDevice=3D 6.07
Nov 21 16:56:27 faldara kernel: usb usb4: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Nov 21 16:56:27 faldara kernel: usb usb4: Product: xHCI Host Controller
Nov 21 16:56:27 faldara kernel: usb usb4: Manufacturer: Linux 6.7.0-rc2+ xh=
ci-hcd
Nov 21 16:56:27 faldara kernel: usb usb4: SerialNumber: 0000:06:00.0
Nov 21 16:56:27 faldara kernel: hub 4-0:1.0: USB hub found
Nov 21 16:56:27 faldara kernel: hub 4-0:1.0: 2 ports detected
Nov 21 16:56:27 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
Nov 21 16:56:27 faldara kernel:  nvme0n1: p1 p2
Nov 21 16:56:27 faldara kernel: scsi host0: ahci
Nov 21 16:56:27 faldara kernel: scsi host1: ahci
Nov 21 16:56:27 faldara kernel: scsi host2: ahci
Nov 21 16:56:27 faldara kernel: scsi host3: ahci
Nov 21 16:56:27 faldara kernel: scsi host4: ahci
Nov 21 16:56:27 faldara kernel: scsi host5: ahci
Nov 21 16:56:27 faldara kernel: ata1: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b100 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata2: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b180 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata3: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b200 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata4: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b280 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata5: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b300 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata6: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b380 irq 128 lpm-pol 0
Nov 21 16:56:27 faldara kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTA=
BLE is disabled. Duplicate IMA measurements will not be recorded in the IMA=
 log.
Nov 21 16:56:27 faldara kernel: ahci 0000:05:00.0: AHCI 0001.0000 32 slots =
2 ports 3 Gbps 0x3 impl SATA mode
Nov 21 16:56:27 faldara kernel: device-mapper: ioctl: 4.48.0-ioctl (2023-03=
-01) initialised: dm-devel@redhat.com
Nov 21 16:56:27 faldara kernel: ahci 0000:05:00.0: flags: 64bit ncq pm led =
clo pmp pio slum part=20
Nov 21 16:56:27 faldara kernel: scsi host6: ahci
Nov 21 16:56:27 faldara kernel: scsi host7: ahci
Nov 21 16:56:27 faldara kernel: ata7: SATA max UDMA/133 abar m8192@0xf7e100=
00 port 0xf7e10100 irq 18 lpm-pol 0
Nov 21 16:56:27 faldara kernel: ata8: SATA max UDMA/133 abar m8192@0xf7e100=
00 port 0xf7e10180 irq 18 lpm-pol 0
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6 0000:00:1f.6 (uninitial=
ized): registered PHC clock
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6 eth0: (PCI Express:2.5G=
T/s:Width x1) 38:d5:47:0f:48:8a
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000=
 Network Connection
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12,=
 PBA No: FFFFFF-0FF
Nov 21 16:56:27 faldara kernel: usb 1-5: new full-speed USB device number 2=
 using xhci_hcd
Nov 21 16:56:27 faldara kernel: ata1: SATA link down (SStatus 4 SControl 30=
0)
Nov 21 16:56:27 faldara kernel: ata2: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:56:27 faldara kernel: ata2.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Nov 21 16:56:27 faldara kernel: ata2.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Nov 21 16:56:27 faldara kernel: ata5: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:56:27 faldara kernel: ata3: SATA link down (SStatus 4 SControl 30=
0)
Nov 21 16:56:27 faldara kernel: ata6: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:56:27 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SC=
ontrol 300)
Nov 21 16:56:27 faldara kernel: ata6.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Nov 21 16:56:27 faldara kernel: ata5.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Nov 21 16:56:27 faldara kernel: ata6.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Nov 21 16:56:27 faldara kernel: ata5.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Nov 21 16:56:27 faldara kernel: ata2.00: configured for UDMA/133
Nov 21 16:56:27 faldara kernel: scsi 1:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Nov 21 16:56:27 faldara kernel: ata5.00: configured for UDMA/133
Nov 21 16:56:27 faldara kernel: ata7: SATA link down (SStatus 0 SControl 30=
0)
Nov 21 16:56:27 faldara kernel: ata6.00: configured for UDMA/133
Nov 21 16:56:27 faldara kernel: ata4.00: ATAPI: HL-DT-ST BD-RE  WH10LS30, 1=
.00, max UDMA/133
Nov 21 16:56:27 faldara kernel: ata8: SATA link down (SStatus 0 SControl 30=
0)
Nov 21 16:56:27 faldara kernel: usb 1-5: New USB device found, idVendor=3D1=
532, idProduct=3D005c, bcdDevice=3D 2.00
Nov 21 16:56:27 faldara kernel: usb 1-5: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D0
Nov 21 16:56:27 faldara kernel: usb 1-5: Product: Razer DeathAdder Elite
Nov 21 16:56:27 faldara kernel: usb 1-5: Manufacturer: Razer
Nov 21 16:56:27 faldara kernel: ata4.00: configured for UDMA/133
Nov 21 16:56:27 faldara kernel: scsi 3:0:0:0: CD-ROM            HL-DT-ST BD=
-RE  WH10LS30  1.00 PQ: 0 ANSI: 5
Nov 21 16:56:27 faldara kernel: hid: raw HID events driver (C) Jiri Kosina
Nov 21 16:56:27 faldara kernel: scsi 4:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Nov 21 16:56:27 faldara kernel: scsi 5:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Nov 21 16:56:27 faldara kernel: e1000e 0000:00:1f.6 enp0s31f6: renamed from=
 eth0
Nov 21 16:56:27 faldara kernel: usbcore: registered new interface driver us=
bhid
Nov 21 16:56:27 faldara kernel: usbhid: USB HID core driver
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] 4096-byte physical blocks
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] Write Protect is off
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] Preferred minimum I/O siz=
e 4096 bytes
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] 4096-byte physical blocks
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] Write Protect is off
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] 4096-byte physical blocks
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] Write Protect is off
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] Mode Sense: 00 3a 00 00
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] Mode Sense: 00 3a 00 00
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] Preferred minimum I/O siz=
e 4096 bytes
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] Preferred minimum I/O siz=
e 4096 bytes
Nov 21 16:56:27 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/0003:1532:005C.0001/input/inp=
ut0
Nov 21 16:56:27 faldara kernel: hid-generic 0003:1532:005C.0001: input,hidr=
aw0: USB HID v1.11 Mouse [Razer Razer DeathAdder Elite] on usb-0000:00:14.0=
-5/input0
Nov 21 16:56:27 faldara kernel: input: Razer Razer DeathAdder Elite Keyboar=
d as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.1/0003:1532:005C.0002/=
input/input1
Nov 21 16:56:27 faldara kernel: usb 1-6: new full-speed USB device number 3=
 using xhci_hcd
Nov 21 16:56:27 faldara kernel:  sdc: sdc1
Nov 21 16:56:27 faldara kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Nov 21 16:56:27 faldara kernel:  sda: sda1
Nov 21 16:56:27 faldara kernel: sd 1:0:0:0: [sda] Attached SCSI disk
Nov 21 16:56:27 faldara kernel:  sdb: sdb1
Nov 21 16:56:27 faldara kernel: sd 4:0:0:0: [sdb] Attached SCSI disk
Nov 21 16:56:27 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.1/0003:1532:005C.0002/input/inp=
ut2
Nov 21 16:56:27 faldara kernel: hid-generic 0003:1532:005C.0002: input,hidr=
aw1: USB HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on usb-0000:00:1=
4.0-5/input1
Nov 21 16:56:27 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/0003:1532:005C.0003/input/inp=
ut3
Nov 21 16:56:27 faldara kernel: hid-generic 0003:1532:005C.0003: input,hidr=
aw2: USB HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on usb-0000:00:1=
4.0-5/input2
Nov 21 16:56:27 faldara kernel: sr 3:0:0:0: [sr0] scsi3-mmc drive: 40x/40x =
writer dvd-ram cd/rw xa/form2 cdda tray
Nov 21 16:56:27 faldara kernel: cdrom: Uniform CD-ROM driver Revision: 3.20
Nov 21 16:56:27 faldara kernel: usb 1-6: New USB device found, idVendor=3D0=
3eb, idProduct=3Dff02, bcdDevice=3D 0.50
Nov 21 16:56:27 faldara kernel: usb 1-6: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
Nov 21 16:56:27 faldara kernel: usb 1-6: Product: WootingTwo
Nov 21 16:56:27 faldara kernel: usb 1-6: Manufacturer: Wooting
Nov 21 16:56:27 faldara kernel: usb 1-6: SerialNumber: WOOT_001_A01B1927W02=
1H01438
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0004: offset (0)=
 exceeds report_count (0)
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0004: No inputs =
registered, leaving
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0004: hidraw3: U=
SB HID v1.11 Keyboard [Wooting WootingTwo] on usb-0000:00:14.0-6/input1
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0005: hiddev0,hi=
draw4: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t2
Nov 21 16:56:27 faldara kernel: input: Wooting WootingTwo as /devices/pci00=
00:00/0000:00:14.0/usb1/1-6/1-6:1.3/0003:03EB:FF02.0006/input/input5
Nov 21 16:56:27 faldara kernel: sr 3:0:0:0: Attached scsi CD-ROM sr0
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0006: input,hidr=
aw5: USB HID v1.11 Keyboard [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t3
Nov 21 16:56:27 faldara kernel: input: Wooting WootingTwo System Control as=
 /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.4/0003:03EB:FF02.0007/inpu=
t/input6
Nov 21 16:56:27 faldara kernel: input: Wooting WootingTwo Consumer Control =
as /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.4/0003:03EB:FF02.0007/in=
put/input7
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0007: input,hidr=
aw6: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/input4
Nov 21 16:56:27 faldara kernel: input: Wooting WootingTwo as /devices/pci00=
00:00/0000:00:14.0/usb1/1-6/1-6:1.5/0003:03EB:FF02.0008/input/input8
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0008: input,hidr=
aw7: USB HID v1.11 Gamepad [Wooting WootingTwo] on usb-0000:00:14.0-6/input5
Nov 21 16:56:27 faldara kernel: hid-generic 0003:03EB:FF02.0009: hiddev1,hi=
draw8: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t6
Nov 21 16:56:27 faldara kernel: usb 1-9: new high-speed USB device number 4=
 using xhci_hcd
Nov 21 16:56:27 faldara kernel: [drm] amdgpu kernel modesetting enabled.
Nov 21 16:56:27 faldara kernel: amdgpu: Virtual CRAT table created for CPU
Nov 21 16:56:27 faldara kernel: amdgpu: Topology: Add CPU node
Nov 21 16:56:27 faldara kernel: [drm] initializing kernel modesetting (DIMG=
REY_CAVEFISH 0x1002:0x73FF 0x1458:0x2334 0xC7).
Nov 21 16:56:27 faldara kernel: [drm] register mmio base: 0xF7900000
Nov 21 16:56:27 faldara kernel: [drm] register mmio size: 1048576
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 0 <nv_common>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 1 <gmc_v10_0>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 2 <navi10_ih>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 3 <psp>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 4 <smu>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 5 <dm>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 6 <gfx_v10_0>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 7 <sdma_v5_2>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 8 <vcn_v3_0>
Nov 21 16:56:27 faldara kernel: [drm] add ip block number 9 <jpeg_v3_0>
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: No more image in the P=
CI ROM
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS =
from ROM BAR
Nov 21 16:56:27 faldara kernel: amdgpu: ATOM BIOS: 113-D534-R66E
Nov 21 16:56:27 faldara kernel: [drm] VCN(0) decode is enabled in VM mode
Nov 21 16:56:27 faldara kernel: [drm] VCN(0) encode is enabled in VM mode
Nov 21 16:56:27 faldara kernel: [drm] JPEG decode is enabled in VM mode
Nov 21 16:56:27 faldara kernel: Console: switching to colour dummy device 8=
0x25
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: vgaarb: deactivate vga=
 console
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Trusted Memory=
 Zone (TMZ) feature disabled as experimental (default)
Nov 21 16:56:27 faldara kernel: [drm] vm size is 262144 GB, 4 levels, block=
 size is 9-bit, fragment size is 9-bit
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 8176M 0x=
0000008000000000 - 0x00000081FEFFFFFF (8176M used)
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x0=
000000000000000 - 0x000000001FFFFFFF
Nov 21 16:56:27 faldara kernel: [drm] Detected VRAM RAM=3D8176M, BAR=3D256M
Nov 21 16:56:27 faldara kernel: [drm] RAM width 128bits GDDR6
Nov 21 16:56:27 faldara kernel: [drm] amdgpu: 8176M of VRAM memory ready
Nov 21 16:56:27 faldara kernel: [drm] amdgpu: 7973M of GTT memory ready.
Nov 21 16:56:27 faldara kernel: [drm] GART: num cpu pages 131072, num gpu p=
ages 131072
Nov 21 16:56:27 faldara kernel: [drm] PCIE GART of 512M enabled (table at 0=
x0000008000200000).
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: STB initialize=
d to 2048 entries
Nov 21 16:56:27 faldara kernel: [drm] Loading DMUB firmware via PSP: versio=
n=3D0x02020003
Nov 21 16:56:27 faldara kernel: [drm] use_doorbell being set to: [true]
Nov 21 16:56:27 faldara kernel: [drm] use_doorbell being set to: [true]
Nov 21 16:56:27 faldara kernel: [drm] Found VCN firmware Version ENC: 1.13 =
DEC: 2 VEP: 0 Revision: 42
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Will use PSP t=
o load VCN firmware
Nov 21 16:56:27 faldara kernel: [drm] reserve 0xa00000 from 0x81fd000000 fo=
r PSP TMR
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: RAS: optional =
ras ta ucode is not available
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY:=
 securedisplay ta ucode is not available
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: smu driver if =
version =3D 0x0000000f, smu fw if version =3D 0x00000012, smu fw program =
=3D 0, version =3D 0x003b2200 (59.34.0)
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SMU driver if =
version not matched
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: use vbios prov=
ided pptable
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SMU is initial=
ized successfully!
Nov 21 16:56:27 faldara kernel: [drm] Display Core v3.2.259 initialized on =
DCN 3.0.2
Nov 21 16:56:27 faldara kernel: [drm] DP-HDMI FRL PCON supported
Nov 21 16:56:27 faldara kernel: [drm] DMUB hardware initialized: version=3D=
0x02020003
Nov 21 16:56:27 faldara kernel: [drm] Unknown EDID CEA parser results
Nov 21 16:56:27 faldara kernel: [drm] kiq ring mec 2 pipe 1 q 0
Nov 21 16:56:27 faldara kernel: [drm] VCN decode and encode initialized suc=
cessfully(under DPG Mode).
Nov 21 16:56:27 faldara kernel: [drm] JPEG decode initialized successfully.
Nov 21 16:56:27 faldara kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on=
 gart
Nov 21 16:56:27 faldara kernel: kfd kfd: amdgpu: Total number of KFD nodes =
to be created: 1
Nov 21 16:56:27 faldara kernel: amdgpu: Virtual CRAT table created for GPU
Nov 21 16:56:27 faldara kernel: amdgpu: Topology: Add dGPU node [0x73ff:0x1=
002]
Nov 21 16:56:27 faldara kernel: kfd kfd: amdgpu: added device 1002:73ff
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH per S=
E 2, CU per SH 8, active_cu_number 28
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0=
 uses VM inv eng 0 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.=
0 uses VM inv eng 1 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.=
0 uses VM inv eng 4 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.=
0 uses VM inv eng 5 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.=
0 uses VM inv eng 6 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.=
1 uses VM inv eng 7 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.=
1 uses VM inv eng 8 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.=
1 uses VM inv eng 9 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.=
1 uses VM inv eng 10 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring kiq_0.2.1=
.0 uses VM inv eng 11 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring sdma0 use=
s VM inv eng 12 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring sdma1 use=
s VM inv eng 13 on hub 0
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_dec_0=
 uses VM inv eng 0 on hub 8
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0=
.0 uses VM inv eng 1 on hub 8
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0=
.1 uses VM inv eng 4 on hub 8
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec =
uses VM inv eng 5 on hub 8
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Using BOCO for=
 runtime pm
Nov 21 16:56:27 faldara kernel: [drm] Initialized amdgpu 3.56.0 20150101 fo=
r 0000:03:00.0 on minor 0
Nov 21 16:56:27 faldara kernel: [drm] Unknown EDID CEA parser results
Nov 21 16:56:27 faldara kernel: fbcon: amdgpudrmfb (fb0) is primary device
Nov 21 16:56:27 faldara kernel: [drm] DSC precompute is not needed.
Nov 21 16:56:27 faldara kernel: Console: switching to colour frame buffer d=
evice 160x45
Nov 21 16:56:27 faldara kernel: amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb=
 frame buffer device
Nov 21 16:56:27 faldara kernel: raid6: avx2x4   gen() 45031 MB/s
Nov 21 16:56:27 faldara kernel: raid6: avx2x2   gen() 45060 MB/s
Nov 21 16:56:27 faldara kernel: raid6: avx2x1   gen() 38296 MB/s
Nov 21 16:56:27 faldara kernel: raid6: using algorithm avx2x2 gen() 45060 M=
B/s
Nov 21 16:56:27 faldara kernel: raid6: .... xor() 27510 MB/s, rmw enabled
Nov 21 16:56:27 faldara kernel: raid6: using avx2x2 recovery algorithm
Nov 21 16:56:27 faldara kernel: xor: automatically using best checksumming =
function   avx=20=20=20=20=20=20=20
Nov 21 16:56:27 faldara kernel: usb 1-9: device descriptor read/64, error -=
110
Nov 21 16:56:27 faldara kernel: Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
Nov 21 16:56:27 faldara kernel: PM: Image not found (code -22)
Nov 21 16:56:27 faldara kernel: BTRFS: device fsid 8bde215a-6a23-4baa-a049-=
e6e579d0757a devid 1 transid 440333 /dev/mapper/faldara-bullseye scanned by=
 mount (300)
Nov 21 16:56:27 faldara kernel: BTRFS info (device dm-1): using crc32c (crc=
32c-intel) checksum algorithm
Nov 21 16:56:27 faldara kernel: BTRFS info (device dm-1): disk space cachin=
g is enabled
Nov 21 16:56:27 faldara kernel: BTRFS info (device dm-1): enabling ssd opti=
mizations
Nov 21 16:56:27 faldara kernel: BTRFS info (device dm-1): auto enabling asy=
nc discard
Nov 21 16:56:27 faldara kernel: usb 1-9: New USB device found, idVendor=3D0=
48d, idProduct=3D1234, bcdDevice=3D 1.00
Nov 21 16:56:27 faldara kernel: usb 1-9: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
Nov 21 16:56:27 faldara kernel: usb 1-9: Product: UDisk=20=20=20=20=20=20=
=20=20=20=20=20
Nov 21 16:56:27 faldara kernel: usb 1-9: Manufacturer: General=20
Nov 21 16:56:27 faldara kernel: usb 1-9: SerialNumber: =D0=89
Nov 21 16:56:27 faldara kernel: Not activating Mandatory Access Control as =
/sbin/tomoyo-init does not exist.
Nov 21 16:56:27 faldara systemd[1]: Inserted module 'autofs4'
Nov 21 16:56:27 faldara systemd[1]: systemd 247.3-7+deb11u4 running in syst=
em mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCR=
YPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMO=
D +IDN2 -IDN +PCRE2 default-hierarchy=3Dunified)
Nov 21 16:56:27 faldara systemd[1]: Detected architecture x86-64.
Nov 21 16:56:27 faldara systemd[1]: Set hostname to <faldara>.
Nov 21 16:56:27 faldara kernel: block nvme0n1: the capability attribute has=
 been deprecated.
Nov 21 16:56:27 faldara systemd[1]: /lib/systemd/system/plymouth-start.serv=
ice:16: Unit configured to use KillMode=3Dnone. This is unsafe, as it disab=
les systemd's process lifecycle management for the service. Please update y=
our service to use a safer KillMode=3D, such as 'mixed' or 'control-group'.=
 Support for KillMode=3Dnone is deprecated and will eventually be removed.
Nov 21 16:56:27 faldara systemd[1]: /lib/systemd/system/minidlna.service:4:=
 Failed to add dependency on autofs, ignoring: Invalid argument
Nov 21 16:56:27 faldara systemd[1]: Queued start job for default target Gra=
phical Interface.
Nov 21 16:56:27 faldara systemd[1]: Created slice system-getty.slice.
Nov 21 16:56:27 faldara systemd[1]: Created slice system-modprobe.slice.
Nov 21 16:56:27 faldara systemd[1]: Created slice User and Session Slice.
Nov 21 16:56:27 faldara systemd[1]: Started Forward Password Requests to Wa=
ll Directory Watch.
Nov 21 16:56:27 faldara systemd[1]: Set up automount Arbitrary Executable F=
ile Formats File System Automount Point.
Nov 21 16:56:27 faldara systemd[1]: Reached target User and Group Name Look=
ups.
Nov 21 16:56:27 faldara systemd[1]: Reached target Remote File Systems.
Nov 21 16:56:27 faldara systemd[1]: Reached target Slices.
Nov 21 16:56:27 faldara systemd[1]: Listening on Device-mapper event daemon=
 FIFOs.
Nov 21 16:56:27 faldara systemd[1]: Listening on LVM2 poll daemon socket.
Nov 21 16:56:27 faldara systemd[1]: Listening on initctl Compatibility Name=
d Pipe.
Nov 21 16:56:27 faldara systemd[1]: Listening on Journal Audit Socket.
Nov 21 16:56:27 faldara systemd[1]: Listening on Journal Socket (/dev/log).
Nov 21 16:56:27 faldara systemd[1]: Listening on Journal Socket.
Nov 21 16:56:27 faldara systemd[1]: Listening on Network Service Netlink So=
cket.
Nov 21 16:56:27 faldara systemd[1]: Listening on udev Control Socket.
Nov 21 16:56:27 faldara systemd[1]: Listening on udev Kernel Socket.
Nov 21 16:56:27 faldara systemd[1]: Mounting Huge Pages File System...
Nov 21 16:56:27 faldara systemd[1]: Mounting POSIX Message Queue File Syste=
m...
Nov 21 16:56:27 faldara systemd[1]: Mounting Kernel Debug File System...
Nov 21 16:56:27 faldara systemd[1]: Mounting Kernel Trace File System...
Nov 21 16:56:27 faldara systemd[1]: Finished Availability of block devices.
Nov 21 16:56:27 faldara systemd[1]: Starting Set the console keyboard layou=
t...
Nov 21 16:56:27 faldara systemd[1]: Starting Create list of static device n=
odes for the current kernel...
Nov 21 16:56:27 faldara systemd[1]: Starting Monitoring of LVM2 mirrors, sn=
apshots etc. using dmeventd or progress polling...
Nov 21 16:56:27 faldara systemd[1]: Starting Load Kernel Module configfs...
Nov 21 16:56:27 faldara systemd[1]: Starting Load Kernel Module drm...
Nov 21 16:56:27 faldara systemd[1]: Starting Load Kernel Module fuse...
Nov 21 16:56:27 faldara systemd[1]: Condition check resulted in Set Up Addi=
tional Binary Formats being skipped.
Nov 21 16:56:27 faldara systemd[1]: Starting Journal Service...
Nov 21 16:56:27 faldara systemd[1]: Starting Load Kernel Modules...
Nov 21 16:56:27 faldara systemd[1]: Starting Remount Root and Kernel File S=
ystems...
Nov 21 16:56:27 faldara systemd[1]: Starting Coldplug All udev Devices...
Nov 21 16:56:27 faldara systemd[1]: Mounted Huge Pages File System.
Nov 21 16:56:27 faldara systemd[1]: Mounted POSIX Message Queue File System.
Nov 21 16:56:27 faldara systemd[1]: Mounted Kernel Debug File System.
Nov 21 16:56:27 faldara systemd[1]: Mounted Kernel Trace File System.
Nov 21 16:56:27 faldara systemd[1]: Finished Create list of static device n=
odes for the current kernel.
Nov 21 16:56:27 faldara systemd[1]: modprobe@configfs.service: Succeeded.
Nov 21 16:56:27 faldara systemd[1]: Finished Load Kernel Module configfs.
Nov 21 16:56:27 faldara systemd[1]: modprobe@drm.service: Succeeded.
Nov 21 16:56:27 faldara systemd[1]: Finished Load Kernel Module drm.
Nov 21 16:56:27 faldara systemd[1]: Finished Remount Root and Kernel File S=
ystems.
Nov 21 16:56:27 faldara systemd[1]: Mounting Kernel Configuration File Syst=
em...
Nov 21 16:56:27 faldara systemd[1]: Condition check resulted in Rebuild Har=
dware Database being skipped.
Nov 21 16:56:27 faldara systemd[1]: Condition check resulted in Platform Pe=
rsistent Storage Archival being skipped.
Nov 21 16:56:27 faldara systemd[1]: Starting Load/Save Random Seed...
Nov 21 16:56:27 faldara kernel: fuse: init (API version 7.39)
Nov 21 16:56:27 faldara systemd[1]: Starting Create System Users...
Nov 21 16:56:27 faldara systemd[1]: Finished Load Kernel Modules.
Nov 21 16:56:27 faldara systemd[1]: Mounted Kernel Configuration File Syste=
m.
Nov 21 16:56:27 faldara systemd[1]: Starting Apply Kernel Variables...
Nov 21 16:56:27 faldara systemd[1]: Finished Monitoring of LVM2 mirrors, sn=
apshots etc. using dmeventd or progress polling.
Nov 21 16:56:27 faldara systemd[1]: Finished Load/Save Random Seed.
Nov 21 16:56:27 faldara systemd[1]: Condition check resulted in First Boot =
Complete being skipped.
Nov 21 16:56:27 faldara systemd[1]: Finished Set the console keyboard layou=
t.
Nov 21 16:56:27 faldara systemd[1]: modprobe@fuse.service: Succeeded.
Nov 21 16:56:27 faldara systemd[1]: Finished Load Kernel Module fuse.
Nov 21 16:56:27 faldara systemd[1]: Mounting FUSE Control File System...
Nov 21 16:56:27 faldara systemd[1]: Finished Apply Kernel Variables.
Nov 21 16:56:27 faldara systemd[1]: Mounted FUSE Control File System.
Nov 21 16:56:27 faldara systemd[1]: Finished Create System Users.
Nov 21 16:56:27 faldara systemd[1]: Starting Create Static Device Nodes in =
/dev...
Nov 21 16:56:27 faldara systemd-journald[363]: Journal started
Nov 21 16:56:27 faldara systemd-journald[363]: Runtime Journal (/run/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 8.0M, max 159.4M, 151.4M free.
Nov 21 16:56:27 faldara systemd-modules-load[366]: Failed to find module 'l=
p'
Nov 21 16:56:27 faldara systemd-modules-load[366]: Failed to find module 'p=
pdev'
Nov 21 16:56:27 faldara systemd-modules-load[366]: Failed to find module 'p=
arport_pc'
Nov 21 16:56:27 faldara systemd-modules-load[366]: Inserted module 'msr'
Nov 21 16:56:27 faldara systemd-sysctl[377]: Couldn't write '1' to 'kernel/=
unprivileged_userns_clone', ignoring: No such file or directory
Nov 21 16:56:27 faldara lvm[356]:   4 logical volume(s) in volume group "fa=
ldara" monitored
Nov 21 16:56:27 faldara systemd[1]: Started Journal Service.
Nov 21 16:56:27 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Nov 21 16:56:27 faldara systemd-journald[363]: Time spent on flushing to /v=
ar/log/journal/84ad0047b8154385bc95456adec0fabe is 9.312ms for 1042 entries.
Nov 21 16:56:27 faldara systemd-journald[363]: System Journal (/var/log/jou=
rnal/84ad0047b8154385bc95456adec0fabe) is 992.0M, max 4.0G, 3.0G free.
Nov 21 16:56:27 faldara systemd[1]: Finished Create Static Device Nodes in =
/dev.
Nov 21 16:56:27 faldara systemd[1]: Reached target Local File Systems (Pre).
Nov 21 16:56:27 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Nov 21 16:56:27 faldara systemd[1]: Finished Coldplug All udev Devices.
Nov 21 16:56:27 faldara systemd[1]: Starting Helper to synchronize boot up =
for ifupdown...
Nov 21 16:56:27 faldara systemd[1]: Finished Helper to synchronize boot up =
for ifupdown.
Nov 21 16:56:27 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Nov 21 16:56:28 faldara systemd[1]: Starting Show Plymouth Boot Screen...
Nov 21 16:56:28 faldara systemd[1]: Starting Network Service...
Nov 21 16:56:28 faldara systemd[1]: Finished Flush Journal to Persistent St=
orage.
Nov 21 16:56:28 faldara kernel: input: Sleep Button as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0C0E:00/input/input9
Nov 21 16:56:28 faldara kernel: ACPI: button: Sleep Button [SLPB]
Nov 21 16:56:28 faldara kernel: input: Power Button as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0C0C:00/input/input10
Nov 21 16:56:28 faldara kernel: ACPI: button: Power Button [PWRB]
Nov 21 16:56:28 faldara systemd[1]: Started Show Plymouth Boot Screen.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Dispatch Pa=
ssword Requests to Console Directory Watch being skipped.
Nov 21 16:56:28 faldara systemd[1]: Started Forward Password Requests to Pl=
ymouth Directory Watch.
Nov 21 16:56:28 faldara kernel: input: Power Button as /devices/LNXSYSTM:00=
/LNXPWRBN:00/input/input11
Nov 21 16:56:28 faldara systemd[1]: Reached target Local Encrypted Volumes.
Nov 21 16:56:28 faldara systemd-networkd[410]: Enumeration completed
Nov 21 16:56:28 faldara systemd[1]: Started Network Service.
Nov 21 16:56:28 faldara kernel: ACPI: button: Power Button [PWRF]
Nov 21 16:56:28 faldara kernel: resource: resource sanity check: requesting=
 [mem 0x00000000fdffe800-0x00000000fe0007ff], which spans more than pnp 00:=
07 [mem 0xfdb00000-0xfdffffff]
Nov 21 16:56:28 faldara kernel: caller get_primary_reg_base+0x47/0xa0 [inte=
l_pmc_core] mapping multiple BARs
Nov 21 16:56:28 faldara kernel: intel_pmc_core INT33A1:00:  initialized
Nov 21 16:56:28 faldara kernel: EDAC ie31200: No ECC support
Nov 21 16:56:28 faldara kernel: EDAC ie31200: No ECC support
Nov 21 16:56:28 faldara mtp-probe[413]: checking bus 1, device 2: "/sys/dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5"
Nov 21 16:56:28 faldara mtp-probe[415]: checking bus 1, device 4: "/sys/dev=
ices/pci0000:00/0000:00:14.0/usb1/1-9"
Nov 21 16:56:28 faldara kernel: sd 1:0:0:0: Attached scsi generic sg0 type 0
Nov 21 16:56:28 faldara kernel: sr 3:0:0:0: Attached scsi generic sg1 type 5
Nov 21 16:56:28 faldara kernel: sd 4:0:0:0: Attached scsi generic sg2 type 0
Nov 21 16:56:28 faldara kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Nov 21 16:56:28 faldara mtp-probe[415]: bus: 1, device: 4 was not an MTP de=
vice
Nov 21 16:56:28 faldara mtp-probe[413]: bus: 1, device: 2 was not an MTP de=
vice
Nov 21 16:56:28 faldara kernel: mei_me 0000:00:16.0: enabling device (0000 =
-> 0002)
Nov 21 16:56:28 faldara systemd-udevd[391]: Using default interface naming =
scheme 'v247'.
Nov 21 16:56:28 faldara kernel: usb-storage 1-9:1.0: USB Mass Storage devic=
e detected
Nov 21 16:56:28 faldara kernel: iTCO_vendor_support: vendor-support=3D0
Nov 21 16:56:28 faldara kernel: scsi host8: usb-storage 1-9:1.0
Nov 21 16:56:28 faldara kernel: usbcore: registered new interface driver us=
b-storage
Nov 21 16:56:28 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Nov 21 16:56:28 faldara kernel: usbcore: registered new interface driver uas
Nov 21 16:56:28 faldara kernel: iTCO_wdt iTCO_wdt: Found a Intel PCH TCO de=
vice (Version=3D4, TCOBASE=3D0x0400)
Nov 21 16:56:28 faldara kernel: iTCO_wdt iTCO_wdt: initialized. heartbeat=
=3D30 sec (nowayout=3D0)
Nov 21 16:56:28 faldara kernel: pstore: Using crash dump compression: defla=
te
Nov 21 16:56:28 faldara systemd[1]: Mounting /media/d3...
Nov 21 16:56:28 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Nov 21 16:56:28 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Nov 21 16:56:28 faldara kernel: ee1004 0-0052: 512 byte EE1004-compliant SP=
D EEPROM, read-only
Nov 21 16:56:28 faldara kernel: ee1004 0-0053: 512 byte EE1004-compliant SP=
D EEPROM, read-only
Nov 21 16:56:28 faldara systemd[1]: Found device WDS500G1X0E-00AFY0 1.
Nov 21 16:56:28 faldara systemd[1]: Created slice system-lvm2\x2dpvscan.sli=
ce.
Nov 21 16:56:28 faldara systemd[1]: Mounting /boot/efi...
Nov 21 16:56:28 faldara systemd[1]: Mounting /media/d1...
Nov 21 16:56:28 faldara systemd[1]: Mounting /media/d2...
Nov 21 16:56:28 faldara systemd[1]: Starting LVM event activation on device=
 259:2...
Nov 21 16:56:28 faldara lvm[467]:   pvscan[467] PV /dev/nvme0n1p2 online, V=
G faldara is complete.
Nov 21 16:56:28 faldara lvm[467]:   pvscan[467] VG faldara skip autoactivat=
ion.
Nov 21 16:56:28 faldara systemd-networkd[410]: enp0s31f6: Link UP
Nov 21 16:56:28 faldara systemd-udevd[391]: ethtool: autonegotiation is uns=
et or enabled, the speed and duplex are not writable.
Nov 21 16:56:28 faldara systemd-udevd[409]: ethtool: autonegotiation is uns=
et or enabled, the speed and duplex are not writable.
Nov 21 16:56:28 faldara kernel: pstore: Registered efi_pstore as persistent=
 store backend
Nov 21 16:56:28 faldara systemd[1]: Mounted /boot/efi.
Nov 21 16:56:28 faldara systemd[1]: Finished LVM event activation on device=
 259:2.
Nov 21 16:56:28 faldara kernel: snd_hda_intel 0000:03:00.1: Force to non-sn=
oop mode
Nov 21 16:56:28 faldara kernel: asus_wmi: ASUS WMI generic driver loaded
Nov 21 16:56:28 faldara kernel: snd_hda_intel 0000:03:00.1: bound 0000:03:0=
0.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Nov 21 16:56:28 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input12
Nov 21 16:56:28 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D7 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input13
Nov 21 16:56:28 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D8 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input14
Nov 21 16:56:28 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D9 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input15
Nov 21 16:56:28 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D10 as /de=
vices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/=
card1/input16
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0: ALC1150:=
 SKU not ready 0x00000000
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0: autoconf=
ig for ALC1150: line_outs=3D3 (0x14/0x15/0x16/0x0/0x0) type:line
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    speak=
er_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    hp_ou=
ts=3D1 (0x1b/0x0/0x0/0x0/0x0)
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    mono:=
 mono_out=3D0x0
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    dig-o=
ut=3D0x1e/0x0
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    input=
s:
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Fro=
nt Mic=3D0x19
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Rea=
r Mic=3D0x18
Nov 21 16:56:28 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Lin=
e=3D0x1a
Nov 21 16:56:28 faldara kernel: asus_wmi: Initialization: 0x0
Nov 21 16:56:28 faldara kernel: asus_wmi: BIOS WMI version: 0.9
Nov 21 16:56:28 faldara kernel: asus_wmi: SFUN value: 0x0
Nov 21 16:56:28 faldara kernel: eeepc-wmi eeepc-wmi: Detected ASUSWMI, use =
DCTS
Nov 21 16:56:28 faldara systemd[1]: Found device /dev/faldara/swap.
Nov 21 16:56:28 faldara kernel: input: Eee PC WMI hotkeys as /devices/platf=
orm/eeepc-wmi/input/input17
Nov 21 16:56:28 faldara kernel: RAPL PMU: API unit is 2^-32 Joules, 3 fixed=
 counters, 655360 ms ovfl timer
Nov 21 16:56:28 faldara kernel: RAPL PMU: hw unit of domain pp0-core 2^-14 =
Joules
Nov 21 16:56:28 faldara kernel: RAPL PMU: hw unit of domain package 2^-14 J=
oules
Nov 21 16:56:28 faldara kernel: RAPL PMU: hw unit of domain dram 2^-14 Joul=
es
Nov 21 16:56:28 faldara kernel: cryptd: max_cpu_qlen set to 1000
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Front Mic as /devices/=
pci0000:00/0000:00:1f.3/sound/card0/input18
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Rear Mic as /devices/p=
ci0000:00/0000:00:1f.3/sound/card0/input19
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Line as /devices/pci00=
00:00/0000:00:1f.3/sound/card0/input20
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Line Out Front as /dev=
ices/pci0000:00/0000:00:1f.3/sound/card0/input21
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Line Out Surround as /=
devices/pci0000:00/0000:00:1f.3/sound/card0/input22
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Line Out CLFE as /devi=
ces/pci0000:00/0000:00:1f.3/sound/card0/input23
Nov 21 16:56:28 faldara kernel: input: HDA Intel PCH Front Headphone as /de=
vices/pci0000:00/0000:00:1f.3/sound/card0/input24
Nov 21 16:56:28 faldara systemd[1]: Activating swap /dev/faldara/swap...
Nov 21 16:56:28 faldara kernel: Adding 3145724k swap on /dev/mapper/faldara=
-swap.  Priority:-2 extents:1 across:3145724k SS
Nov 21 16:56:28 faldara kernel: AVX2 version of gcm_enc/dec engaged.
Nov 21 16:56:28 faldara kernel: AES CTR mode by8 optimization enabled
Nov 21 16:56:28 faldara kernel: EXT4-fs (sdb1): mounted filesystem e25768ec=
-351e-4a8f-b403-521b64a2779f ro with ordered data mode. Quota mode: none.
Nov 21 16:56:28 faldara systemd[1]: Activated swap /dev/faldara/swap.
Nov 21 16:56:28 faldara systemd[1]: Mounted /media/d3.
Nov 21 16:56:28 faldara systemd[1]: Mounted /media/d2.
Nov 21 16:56:28 faldara kernel: EXT4-fs (sdc1): mounted filesystem 72c072bc=
-b44d-4479-a91b-464875ba2e1e ro with ordered data mode. Quota mode: none.
Nov 21 16:56:28 faldara systemd[1]: Reached target Swap.
Nov 21 16:56:28 faldara systemd[1]: Listening on Load/Save RF Kill Switch S=
tatus /dev/rfkill Watch.
Nov 21 16:56:28 faldara systemd[1]: Mounted /media/d1.
Nov 21 16:56:28 faldara systemd[1]: Reached target Local File Systems.
Nov 21 16:56:28 faldara systemd[1]: Starting Load AppArmor profiles...
Nov 21 16:56:28 faldara kernel: EXT4-fs (sda1): mounted filesystem 0289bae2=
-4f2c-4591-907b-143864394cbd ro with ordered data mode. Quota mode: none.
Nov 21 16:56:28 faldara systemd[1]: Starting Set console font and keymap...
Nov 21 16:56:28 faldara systemd[1]: Starting Tell Plymouth To Write Out Run=
time Data...
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Store a Sys=
tem Token in an EFI Variable being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Commit a tr=
ansient machine-id on disk being skipped.
Nov 21 16:56:28 faldara systemd[1]: Starting Create Volatile Files and Dire=
ctories...
Nov 21 16:56:28 faldara systemd[1]: Finished Set console font and keymap.
Nov 21 16:56:28 faldara apparmor.systemd[607]: Restarting AppArmor
Nov 21 16:56:28 faldara apparmor.systemd[607]: Reloading AppArmor profiles
Nov 21 16:56:28 faldara systemd[1]: Received SIGRTMIN+20 from PID 268 (plym=
outhd).
Nov 21 16:56:28 faldara systemd[1]: Finished Tell Plymouth To Write Out Run=
time Data.
Nov 21 16:56:28 faldara systemd[1]: Finished Create Volatile Files and Dire=
ctories.
Nov 21 16:56:28 faldara systemd[1]: Starting Network Name Resolution...
Nov 21 16:56:28 faldara systemd[1]: Starting Network Time Synchronization...
Nov 21 16:56:28 faldara systemd[1]: Starting Update UTMP about System Boot/=
Shutdown...
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Dispatch Pa=
ssword Requests to Console Directory Watch being skipped.
Nov 21 16:56:28 faldara audit[648]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"nvidia_modprobe" pid=3D648 comm=
=3D"apparmor_parser"
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Set Up Addi=
tional Binary Formats being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Store a Sys=
tem Token in an EFI Variable being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Rebuild Har=
dware Database being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Commit a tr=
ansient machine-id on disk being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Platform Pe=
rsistent Storage Archival being skipped.
Nov 21 16:56:28 faldara audit[648]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"nvidia_modprobe//kmod" pid=3D648=
 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[647]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"lsb_release" pid=3D647 comm=3D"a=
pparmor_parser"
Nov 21 16:56:28 faldara audit[649]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/man" pid=3D649 comm=3D"=
apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:2):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"nvidia_modprobe" pid=3D648 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:3):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"nvidia_modprobe//kmod" pid=3D648 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:4):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"lsb_release" pid=3D647 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:5):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"/usr/bin/man" pid=3D649 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[649]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"man_filter" pid=3D649 comm=3D"ap=
parmor_parser"
Nov 21 16:56:28 faldara audit[649]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"man_groff" pid=3D649 comm=3D"app=
armor_parser"
Nov 21 16:56:28 faldara audit[652]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-oopslash" pid=3D652 =
comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[662]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-xpdfimport" pid=3D66=
2 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:6):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"man_filter" pid=3D649 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:7):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"man_groff" pid=3D649 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.480:8):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"libreoffice-oopslash" pid=3D652 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.484:9):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"libreoffice-xpdfimport" pid=3D662 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.484:10)=
: apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" nam=
e=3D"libreoffice-senddoc" pid=3D660 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[660]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-senddoc" pid=3D660 c=
omm=3D"apparmor_parser"
Nov 21 16:56:28 faldara systemd[1]: Finished Update UTMP about System Boot/=
Shutdown.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Dispatch Pa=
ssword Requests to Console Directory Watch being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Set Up Addi=
tional Binary Formats being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Store a Sys=
tem Token in an EFI Variable being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Rebuild Har=
dware Database being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Commit a tr=
ansient machine-id on disk being skipped.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Platform Pe=
rsistent Storage Archival being skipped.
Nov 21 16:56:28 faldara audit[667]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/x86_64-linux-gnu/lightd=
m/lightdm-guest-session" pid=3D667 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[667]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/x86_64-linux-gnu/lightd=
m/lightdm-guest-session//chromium" pid=3D667 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara kernel: audit: type=3D1400 audit(1700603788.492:11)=
: apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" nam=
e=3D"/usr/lib/x86_64-linux-gnu/lightdm/lightdm-guest-session" pid=3D667 com=
m=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/mission-contr=
ol-5" pid=3D664 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*" =
pid=3D664 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*//=
pxgsettings" pid=3D664 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*//=
sanitized_helper" pid=3D664 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-ofo=
no" pid=3D664 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[666]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-soffice" pid=3D666 c=
omm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[666]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-soffice//gpg" pid=3D=
666 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[674]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cups-browsed" pid=3D67=
4 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/cups/backend/cups-pdf" =
pid=3D669 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cupsd" pid=3D669 comm=
=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cupsd//third_party" pi=
d=3D669 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara systemd[1]: Started Network Time Synchronization.
Nov 21 16:56:28 faldara systemd[1]: Reached target System Time Set.
Nov 21 16:56:28 faldara systemd[1]: Reached target System Time Synchronized.
Nov 21 16:56:28 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince" pid=3D663 comm=
=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince//sanitized_helpe=
r" pid=3D663 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-previewer" pid=
=3D663 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-previewer//sanit=
ized_helper" pid=3D663 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-thumbnailer" pid=
=3D663 comm=3D"apparmor_parser"
Nov 21 16:56:28 faldara systemd[1]: Finished Load AppArmor profiles.
Nov 21 16:56:28 faldara systemd[1]: Reached target System Initialization.
Nov 21 16:56:28 faldara systemd[1]: Started CUPS Scheduler.
Nov 21 16:56:28 faldara systemd[1]: Started Trigger anacron every hour.
Nov 21 16:56:28 faldara systemd[1]: Started Daily apt download activities.
Nov 21 16:56:28 faldara systemd[1]: Started Daily apt upgrade and clean act=
ivities.
Nov 21 16:56:28 faldara systemd[1]: Started Periodic ext4 Online Metadata C=
heck for All Filesystems.
Nov 21 16:56:28 faldara systemd[1]: Started Discard unused blocks once a we=
ek.
Nov 21 16:56:28 faldara systemd[1]: Started Refresh fwupd metadata regularl=
y.
Nov 21 16:56:28 faldara systemd[1]: Started Daily rotation of log files.
Nov 21 16:56:28 faldara systemd[1]: Started Daily man-db regeneration.
Nov 21 16:56:28 faldara systemd[1]: Started Daily Cleanup of Temporary Dire=
ctories.
Nov 21 16:56:28 faldara systemd[1]: Reached target Paths.
Nov 21 16:56:28 faldara systemd[1]: Reached target Timers.
Nov 21 16:56:28 faldara systemd[1]: Listening on Avahi mDNS/DNS-SD Stack Ac=
tivation Socket.
Nov 21 16:56:28 faldara systemd[1]: Listening on CUPS Scheduler.
Nov 21 16:56:28 faldara systemd[1]: Listening on D-Bus System Message Bus S=
ocket.
Nov 21 16:56:28 faldara systemd[1]: Listening on UUID daemon activation soc=
ket.
Nov 21 16:56:28 faldara systemd[1]: Reached target Sockets.
Nov 21 16:56:28 faldara systemd[1]: Reached target Basic System.
Nov 21 16:56:28 faldara systemd[1]: Starting Accounts Service...
Nov 21 16:56:28 faldara systemd[1]: Started Run anacron jobs.
Nov 21 16:56:28 faldara systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
Nov 21 16:56:28 faldara systemd[1]: Started Regular background program proc=
essing daemon.
Nov 21 16:56:28 faldara anacron[681]: Anacron 2.3 started on 2023-11-21
Nov 21 16:56:28 faldara systemd[1]: Started D-Bus System Message Bus.
Nov 21 16:56:28 faldara anacron[681]: Normal exit (0 jobs run)
Nov 21 16:56:28 faldara cron[683]: (CRON) INFO (pidfile fd =3D 3)
Nov 21 16:56:28 faldara systemd[1]: Starting Remove Stale Online ext4 Metad=
ata Check Snapshots...
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in getty on tt=
y2-tty6 if dbus and logind are not available being skipped.
Nov 21 16:56:28 faldara cron[683]: (CRON) INFO (Running @reboot jobs)
Nov 21 16:56:28 faldara systemd[1]: Starting LSB: Execute the kexec -e comm=
and to reboot system...
Nov 21 16:56:28 faldara systemd-resolved[654]: Positive Trust Anchors:
Nov 21 16:56:28 faldara systemd-resolved[654]: . IN DS 20326 8 2 e06d44b80b=
8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Nov 21 16:56:28 faldara systemd-resolved[654]: Negative trust anchors: 10.i=
n-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19.=
172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.arp=
a 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-add=
r.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.i=
n-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp home=
 internal intranet lan local private test
Nov 21 16:56:28 faldara systemd[1]: Starting Initialize hardware monitoring=
 sensors...
Nov 21 16:56:28 faldara systemd[1]: Started MiniDLNA lightweight DLNA/UPnP-=
AV server.
Nov 21 16:56:28 faldara systemd[1]: Starting Raise network interfaces...
Nov 21 16:56:28 faldara systemd[1]: Starting Authorization Manager...
Nov 21 16:56:28 faldara systemd[1]: Starting Self Monitoring and Reporting =
Technology (SMART) Daemon...
Nov 21 16:56:28 faldara avahi-daemon[682]: Found user 'avahi' (UID 109) and=
 group 'avahi' (GID 115).
Nov 21 16:56:28 faldara kernel: intel_rapl_common: Found RAPL domain package
Nov 21 16:56:28 faldara kernel: intel_rapl_common: Found RAPL domain core
Nov 21 16:56:28 faldara kernel: intel_rapl_common: Found RAPL domain dram
Nov 21 16:56:28 faldara systemd[1]: Starting Switcheroo Control Proxy servi=
ce...
Nov 21 16:56:28 faldara systemd-resolved[654]: Using system hostname 'falda=
ra'.
Nov 21 16:56:28 faldara systemd[1]: Starting User Login Management...
Nov 21 16:56:28 faldara systemd[1]: Starting WPA supplicant...
Nov 21 16:56:28 faldara systemd[1]: Started Network Name Resolution.
Nov 21 16:56:28 faldara systemd[1]: anacron.service: Succeeded.
Nov 21 16:56:28 faldara systemd[1]: e2scrub_reap.service: Succeeded.
Nov 21 16:56:28 faldara systemd[1]: Finished Remove Stale Online ext4 Metad=
ata Check Snapshots.
Nov 21 16:56:28 faldara systemd[1]: Reached target Host and Network Name Lo=
okups.
Nov 21 16:56:28 faldara avahi-daemon[682]: Successfully dropped root privil=
eges.
Nov 21 16:56:28 faldara avahi-daemon[682]: avahi-daemon 0.8 starting up.
Nov 21 16:56:28 faldara sensors[705]: coretemp-isa-0000
Nov 21 16:56:28 faldara sensors[705]: Adapter: ISA adapter
Nov 21 16:56:28 faldara sensors[705]: Package id 0:  +52.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: Core 0:        +51.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: Core 1:        +50.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: Core 2:        +50.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: Core 3:        +50.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: amdgpu-pci-0300
Nov 21 16:56:28 faldara sensors[705]: Adapter: PCI adapter
Nov 21 16:56:28 faldara sensors[705]: vddgfx:        6.00 mV
Nov 21 16:56:28 faldara sensors[705]: fan1:           0 RPM  (min =3D    0 =
RPM, max =3D 3100 RPM)
Nov 21 16:56:28 faldara sensors[705]: edge:         +35.0=C2=B0C  (crit =3D=
 +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]:                        (emerg =3D +10=
5.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: junction:     +36.0=C2=B0C  (crit =3D=
 +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]:                        (emerg =3D +11=
5.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: mem:          +36.0=C2=B0C  (crit =3D=
 +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]:                        (emerg =3D +10=
5.0=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]: PPT:          14.00 W  (cap =3D 100.0=
0 W)
Nov 21 16:56:28 faldara sensors[705]: acpitz-acpi-0
Nov 21 16:56:28 faldara sensors[705]: Adapter: ACPI interface
Nov 21 16:56:28 faldara sensors[705]: temp1:        +27.8=C2=B0C
Nov 21 16:56:28 faldara sensors[705]: temp2:        +29.8=C2=B0C
Nov 21 16:56:28 faldara sensors[705]: nvme-pci-0700
Nov 21 16:56:28 faldara sensors[705]: Adapter: PCI adapter
Nov 21 16:56:28 faldara sensors[705]: Composite:    +41.9=C2=B0C  (low  =3D=
  -5.2=C2=B0C, high =3D +83.8=C2=B0C)
Nov 21 16:56:28 faldara sensors[705]:                        (crit =3D +87.=
8=C2=B0C)
Nov 21 16:56:28 faldara systemd[1]: Finished Initialize hardware monitoring=
 sensors.
Nov 21 16:56:28 faldara systemd[1]: Started LSB: Execute the kexec -e comma=
nd to reboot system.
Nov 21 16:56:28 faldara systemd[1]: Starting LSB: Load kernel image with ke=
xec...
Nov 21 16:56:28 faldara smartd[692]: smartd 7.2 2020-12-30 r5155 [x86_64-li=
nux-6.7.0-rc2+] (local build)
Nov 21 16:56:28 faldara smartd[692]: Copyright (C) 2002-20, Bruce Allen, Ch=
ristian Franke, www.smartmontools.org
Nov 21 16:56:28 faldara smartd[692]: Opened configuration file /etc/smartd.=
conf
Nov 21 16:56:28 faldara smartd[692]: Drive: DEVICESCAN, implied '-a' Direct=
ive on line 21 of file /etc/smartd.conf
Nov 21 16:56:28 faldara smartd[692]: Configuration file /etc/smartd.conf wa=
s parsed, found DEVICESCAN, scanning devices
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda, type changed from 's=
csi' to 'sat'
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], opened
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5414103, WWN:5-0014ee-25e47b53d, FW:15.01H15, 1.00 TB
Nov 21 16:56:28 faldara systemd[1]: Started LSB: Load kernel image with kex=
ec.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], found in smart=
d database: Western Digital Blue
Nov 21 16:56:28 faldara systemd[1]: Finished Raise network interfaces.
Nov 21 16:56:28 faldara systemd-logind[702]: New seat seat0.
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event10 (Power Button)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event9 (Power Button)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event8 (Sleep Button)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event1 (Razer Razer DeathAdder Elite Keyboard)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event3 (Razer Razer DeathAdder Elite)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event4 (Wooting WootingTwo)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event5 (Wooting WootingTwo System Control)
Nov 21 16:56:28 faldara systemd-logind[702]: Watching system buttons on /de=
v/input/event6 (Wooting WootingTwo Consumer Control)
Nov 21 16:56:28 faldara systemd[1]: Started User Login Management.
Nov 21 16:56:28 faldara systemd[1]: Started Avahi mDNS/DNS-SD Stack.
Nov 21 16:56:28 faldara wpa_supplicant[703]: Successfully initialized wpa_s=
upplicant
Nov 21 16:56:28 faldara avahi-daemon[682]: Successfully called chroot().
Nov 21 16:56:28 faldara avahi-daemon[682]: Successfully dropped remaining c=
apabilities.
Nov 21 16:56:28 faldara avahi-daemon[682]: No service file found in /etc/av=
ahi/services.
Nov 21 16:56:28 faldara avahi-daemon[682]: Joining mDNS multicast group on =
interface lo.IPv6 with address ::1.
Nov 21 16:56:28 faldara avahi-daemon[682]: New relevant interface lo.IPv6 f=
or mDNS.
Nov 21 16:56:28 faldara avahi-daemon[682]: Joining mDNS multicast group on =
interface lo.IPv4 with address 127.0.0.1.
Nov 21 16:56:28 faldara avahi-daemon[682]: New relevant interface lo.IPv4 f=
or mDNS.
Nov 21 16:56:28 faldara avahi-daemon[682]: Network interface enumeration co=
mpleted.
Nov 21 16:56:28 faldara avahi-daemon[682]: Registering new address record f=
or ::1 on lo.*.
Nov 21 16:56:28 faldara avahi-daemon[682]: Registering new address record f=
or 127.0.0.1 on lo.IPv4.
Nov 21 16:56:28 faldara systemd[1]: Started WPA supplicant.
Nov 21 16:56:28 faldara systemd[1]: Started Switcheroo Control Proxy servic=
e.
Nov 21 16:56:28 faldara systemd[1]: Reached target Network.
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in Manage Soun=
d Card State (restore and store) being skipped.
Nov 21 16:56:28 faldara systemd[1]: Starting Save/Restore Sound Card State.=
..
Nov 21 16:56:28 faldara systemd[1]: Starting CUPS Scheduler...
Nov 21 16:56:28 faldara systemd[1]: Condition check resulted in fast remote=
 file copy program daemon being skipped.
Nov 21 16:56:28 faldara systemd[1]: Starting Permit User Sessions...
Nov 21 16:56:28 faldara systemd[1]: Started Unattended Upgrades Shutdown.
Nov 21 16:56:28 faldara systemd[1]: Finished Save/Restore Sound Card State.
Nov 21 16:56:28 faldara systemd[1]: Reached target Sound Card.
Nov 21 16:56:28 faldara systemd[1]: Finished Permit User Sessions.
Nov 21 16:56:28 faldara systemd[1]: Starting Light Display Manager...
Nov 21 16:56:28 faldara systemd[1]: Starting Hold until boot process finish=
es up...
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], is SMART capab=
le. Adding to "monitor" list.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.st=
ate
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb, type changed from 's=
csi' to 'sat'
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb [SAT], opened
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5390305, WWN:5-0014ee-25e47b58b, FW:15.01H15, 1.00 TB
Nov 21 16:56:28 faldara polkitd[690]: started daemon version 0.105 using au=
thority implementation `local' version `0.105'
Nov 21 16:56:28 faldara systemd[1]: Started Authorization Manager.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb [SAT], found in smart=
d database: Western Digital Blue
Nov 21 16:56:28 faldara systemd[1]: Starting Modem Manager...
Nov 21 16:56:28 faldara systemd[1]: Received SIGRTMIN+21 from PID 268 (plym=
outhd).
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb [SAT], is SMART capab=
le. Adding to "monitor" list.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdb [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.st=
ate
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc, type changed from 's=
csi' to 'sat'
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc [SAT], opened
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5386787, WWN:5-0014ee-25e47b48d, FW:15.01H15, 1.00 TB
Nov 21 16:56:28 faldara systemd[1]: Finished Hold until boot process finish=
es up.
Nov 21 16:56:28 faldara accounts-daemon[680]: started daemon version 0.6.55
Nov 21 16:56:28 faldara systemd[1]: Received SIGRTMIN+21 from PID 268 (n/a).
Nov 21 16:56:28 faldara ModemManager[773]: <info>  ModemManager (version 1.=
14.12) starting in system bus...
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc [SAT], found in smart=
d database: Western Digital Blue
Nov 21 16:56:28 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.ColorManager' unit=3D'colord.service' reque=
sted by ':1.12' (uid=3D0 pid=3D767 comm=3D"/usr/sbin/cupsd -l ")
Nov 21 16:56:28 faldara systemd[1]: Started Getty on tty1.
Nov 21 16:56:28 faldara systemd[1]: Reached target Login Prompts.
Nov 21 16:56:28 faldara systemd[1]: Started Accounts Service.
Nov 21 16:56:28 faldara systemd[1]: Started Light Display Manager.
Nov 21 16:56:28 faldara systemd[1]: Starting Manage, Install and Generate C=
olor Profiles...
Nov 21 16:56:28 faldara dbus-daemon[684]: [system] Successfully activated s=
ervice 'org.freedesktop.ColorManager'
Nov 21 16:56:28 faldara systemd[1]: Started Manage, Install and Generate Co=
lor Profiles.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc [SAT], is SMART capab=
le. Adding to "monitor" list.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sdc [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.st=
ate
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/nvme0, opened
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/nvme0, WDS500G1X0E-00AFY0=
, S/N:204318800637, FW:611100WD, 500 GB
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/nvme0, is SMART capable. =
Adding to "monitor" list.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/nvme0, state read from /v=
ar/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Nov 21 16:56:28 faldara smartd[692]: Monitoring 3 ATA/SATA, 0 SCSI/SAS and =
1 NVMe devices
Nov 21 16:56:28 faldara systemd[1]: Started Modem Manager.
Nov 21 16:56:28 faldara smartd[692]: Device: /dev/sda [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 112 to 117
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/sdb [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 113 to 117
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/sdc [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 114 to 118
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/sda [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.s=
tate
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/sdb [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.s=
tate
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/sdc [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.s=
tate
Nov 21 16:56:29 faldara smartd[692]: Device: /dev/nvme0, state written to /=
var/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Nov 21 16:56:29 faldara systemd[1]: Started Self Monitoring and Reporting T=
echnology (SMART) Daemon.
Nov 21 16:56:29 faldara kernel: scsi 8:0:0:0: Direct-Access     General  UD=
isk            5.00 PQ: 0 ANSI: 2
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: Attached scsi generic sg4 type 0
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] 61440000 512-byte logical=
 blocks: (31.5 GB/29.3 GiB)
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] Write Protect is off
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] Mode Sense: 0b 00 00 08
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] No Caching mode page found
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] Assuming drive cache: wri=
te through
Nov 21 16:56:29 faldara kernel:  sdd: sdd1 sdd2
Nov 21 16:56:29 faldara kernel: sd 8:0:0:0: [sdd] Attached SCSI removable d=
isk
Nov 21 16:56:29 faldara audit[767]: AVC apparmor=3D"DENIED" operation=3D"ca=
pable" class=3D"cap" profile=3D"/usr/sbin/cupsd" pid=3D767 comm=3D"cupsd" c=
apability=3D12  capname=3D"net_admin"
Nov 21 16:56:29 faldara systemd[1]: Started CUPS Scheduler.
Nov 21 16:56:29 faldara systemd[1]: Started Make remote CUPS printers avail=
able locally.
Nov 21 16:56:29 faldara systemd[1]: Reached target Multi-User System.
Nov 21 16:56:29 faldara systemd[1]: Reached target Graphical Interface.
Nov 21 16:56:29 faldara systemd[1]: Starting Update UTMP about System Runle=
vel Changes...
Nov 21 16:56:29 faldara systemd[1]: systemd-update-utmp-runlevel.service: S=
ucceeded.
Nov 21 16:56:29 faldara systemd[1]: Finished Update UTMP about System Runle=
vel Changes.
Nov 21 16:56:29 faldara systemd[1]: Startup finished in 16.515s (firmware) =
+ 57.991s (loader) + 10.809s (kernel) + 1.947s (userspace) =3D 1min 27.263s.
Nov 21 16:56:29 faldara avahi-daemon[682]: Server startup complete. Host na=
me is faldara.local. Local service cookie is 543943257.
Nov 21 16:56:30 faldara kernel: [drm] Unknown EDID CEA parser results
Nov 21 16:56:30 faldara kernel: [drm] Unknown EDID CEA parser results
Nov 21 16:56:30 faldara lightdm[827]: pam_unix(lightdm-greeter:session): se=
ssion opened for user lightdm(uid=3D118) by (uid=3D0)
Nov 21 16:56:30 faldara systemd[1]: Created slice User Slice of UID 118.
Nov 21 16:56:30 faldara systemd[1]: Starting User Runtime Directory /run/us=
er/118...
Nov 21 16:56:30 faldara systemd-logind[702]: New session c1 of user lightdm.
Nov 21 16:56:30 faldara systemd[1]: Finished User Runtime Directory /run/us=
er/118.
Nov 21 16:56:30 faldara systemd[1]: Starting User Manager for UID 118...
Nov 21 16:56:30 faldara systemd[831]: pam_unix(systemd-user:session): sessi=
on opened for user lightdm(uid=3D118) by (uid=3D0)
Nov 21 16:56:30 faldara systemd[831]: Queued start job for default target M=
ain User Target.
Nov 21 16:56:31 faldara systemd[831]: Created slice User Application Slice.
Nov 21 16:56:31 faldara systemd[831]: Reached target Paths.
Nov 21 16:56:31 faldara systemd[831]: Reached target Timers.
Nov 21 16:56:31 faldara systemd[831]: Starting D-Bus User Message Bus Socke=
t.
Nov 21 16:56:31 faldara systemd[831]: Listening on GnuPG network certificat=
e management daemon.
Nov 21 16:56:31 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache (access for web browsers).
Nov 21 16:56:31 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache (restricted).
Nov 21 16:56:31 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t (ssh-agent emulation).
Nov 21 16:56:31 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache.
Nov 21 16:56:31 faldara systemd[831]: Listening on Multimedia System.
Nov 21 16:56:31 faldara systemd[831]: Listening on debconf communication so=
cket.
Nov 21 16:56:31 faldara systemd[831]: Listening on Sound System.
Nov 21 16:56:31 faldara systemd[831]: Listening on D-Bus User Message Bus S=
ocket.
Nov 21 16:56:31 faldara systemd[831]: Reached target Sockets.
Nov 21 16:56:31 faldara systemd[831]: Reached target Basic System.
Nov 21 16:56:31 faldara systemd[1]: Started User Manager for UID 118.
Nov 21 16:56:31 faldara systemd[831]: Started Multimedia Service.
Nov 21 16:56:31 faldara systemd[1]: Started Session c1 of user lightdm.
Nov 21 16:56:31 faldara systemd[831]: Starting Sound Service...
Nov 21 16:56:31 faldara systemd[831]: Starting Tracker metadata extractor...
Nov 21 16:56:31 faldara systemd[831]: Starting Tracker file system data min=
er...
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.RealtimeKit1' unit=3D'rtkit-daemon.service'=
 requested by ':1.25' (uid=3D118 pid=3D846 comm=3D"/usr/bin/pipewire ")
Nov 21 16:56:31 faldara systemd[1]: Starting RealtimeKit Scheduling Policy =
Service...
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Successfully activated s=
ervice 'org.freedesktop.RealtimeKit1'
Nov 21 16:56:31 faldara systemd[1]: Started RealtimeKit Scheduling Policy S=
ervice.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully called chroot.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully dropped privileges.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully limited resources.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Running.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Canary thread running.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Watchdog thread running.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 846 of =
process 846 owned by '118' high priority at nice level -11.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 851 of =
process 846 owned by '118' RT at priority 20.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 2 threads of 1 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 847 of =
process 847 owned by '118' high priority at nice level -11.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 3 threads of 2 proce=
sses of 1 users.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Set scheduler policy to SCHED=
_IDLE
Nov 21 16:56:31 faldara tracker-miner-f[849]: Setting priority nice level t=
o 19
Nov 21 16:56:31 faldara tracker-extract[848]: Set scheduler policy to SCHED=
_IDLE
Nov 21 16:56:31 faldara tracker-extract[848]: Setting priority nice level t=
o 19
Nov 21 16:56:31 faldara systemd[831]: Started D-Bus User Message Bus.
Nov 21 16:56:31 faldara pipewire[846]: Failed to receive portal pid: org.fr=
eedesktop.DBus.Error.NameHasNoOwner: Could not get PID of name 'org.freedes=
ktop.portal.Desktop': no such name
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.Daemon' unit=3D'gvfs-daemo=
n.service' requested by ':1.3' (uid=3D118 pid=3D849 comm=3D"/usr/libexec/tr=
acker-miner-fs ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service...
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 861 of =
process 861 owned by '118' high priority at nice level -11.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 872 of =
process 861 owned by '118' RT at priority 20.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 5 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.Daemon'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOCUMENTS. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &MUSIC. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &PICTURES. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &VIDEOS. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOWNLOAD. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOCUMENTS. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &MUSIC. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &PICTURES. Ignoring this location.
Nov 21 16:56:31 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &VIDEOS. Ignoring this location.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.UDisks2VolumeMonitor' unit=
=3D'gvfs-udisks2-volume-monitor.service' requested by ':1.3' (uid=3D118 pid=
=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service -=
 disk device monitor...
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UDisks2' unit=3D'udisks2.service' requested=
 by ':1.29' (uid=3D118 pid=3D886 comm=3D"/usr/libexec/gvfs-udisks2-volume-m=
onitor ")
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Activation via systemd f=
ailed for unit 'udisks2.service': Unit udisks2.service is masked.
Nov 21 16:56:31 faldara gvfs-udisks2-vo[886]: monitor says it's not support=
ed
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.UDisks2VolumeMonitor'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service - =
disk device monitor.
Nov 21 16:56:31 faldara gvfs-udisks2-vo[886]: monitor says it's not support=
ed
Nov 21 16:56:31 faldara tracker-miner-f[849]: remote volume monitor with db=
us name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.MTPVolumeMonitor' unit=3D'=
gvfs-mtp-volume-monitor.service' requested by ':1.3' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.a11y.Bus' unit=3D'at-spi-dbus-bus.=
service' requested by ':1.9' (uid=3D118 pid=3D850 comm=3D"/usr/sbin/lightdm=
-gtk-greeter ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service -=
 Media Transfer Protocol monitor...
Nov 21 16:56:31 faldara systemd[831]: Starting Accessibility services bus...
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.a11y.Bus'
Nov 21 16:56:31 faldara systemd[831]: Started Accessibility services bus.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.MTPVolumeMonitor'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service - =
Media Transfer Protocol monitor.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.GPhoto2VolumeMonitor' unit=
=3D'gvfs-gphoto2-volume-monitor.service' requested by ':1.3' (uid=3D118 pid=
=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service -=
 digital camera monitor...
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.GPhoto2VolumeMonitor'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service - =
digital camera monitor.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.GoaVolumeMonitor' unit=3D'=
gvfs-goa-volume-monitor.service' requested by ':1.3' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service -=
 GNOME Online Accounts monitor...
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating service name=3D'org.gnome.OnlineAccounts' requested by ':1.14' (uid=
=3D118 pid=3D916 comm=3D"/usr/libexec/gvfs-goa-volume-monitor ")
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 5 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 930 of =
process 847 owned by '118' RT at priority 5.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 6 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara ModemManager[773]: <info>  [base-manager] couldn't =
check support for device '/sys/devices/pci0000:00/0000:00:1f.6': not suppor=
ted by any plugin
Nov 21 16:56:31 faldara goa-daemon[921]: goa-daemon version 3.38.0 starting
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating service name=3D'org.gnome.Identity' requested by ':1.16' (uid=3D118=
 pid=3D921 comm=3D"/usr/libexec/goa-daemon ")
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gnome.OnlineAccounts'
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gnome.Identity'
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.GoaVolumeMonitor'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service - =
GNOME Online Accounts monitor.
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.AfcVolumeMonitor' unit=3D'=
gvfs-afc-volume-monitor.service' requested by ':1.3' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara systemd[831]: Starting Virtual filesystem service -=
 Apple File Conduit monitor...
Nov 21 16:56:31 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.AfcVolumeMonitor'
Nov 21 16:56:31 faldara systemd[831]: Started Virtual filesystem service - =
Apple File Conduit monitor.
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UPower' unit=3D'upower.service' requested b=
y ':1.32' (uid=3D118 pid=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:56:31 faldara systemd[1]: Starting Daemon for power management...
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 6 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Successfully made thread 981 of =
process 847 owned by '118' RT at priority 5.
Nov 21 16:56:31 faldara rtkit-daemon[852]: Supervising 7 threads of 3 proce=
sses of 1 users.
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.bluez' unit=3D'dbus-org.bluez.service' requested by ':1=
.35' (uid=3D118 pid=3D847 comm=3D"/usr/bin/pulseaudio --daemonize=3Dno --lo=
g-target=3Djo")
Nov 21 16:56:31 faldara systemd[1]: Condition check resulted in Bluetooth s=
ervice being skipped.
Nov 21 16:56:31 faldara systemd[831]: Started Sound Service.
Nov 21 16:56:31 faldara dbus-daemon[684]: [system] Successfully activated s=
ervice 'org.freedesktop.UPower'
Nov 21 16:56:31 faldara systemd[1]: Started Daemon for power management.
Nov 21 16:56:32 faldara at-spi-bus-launcher[908]: dbus-daemon[908]: Activat=
ing service name=3D'org.a11y.atspi.Registry' requested by ':1.0' (uid=3D118=
 pid=3D850 comm=3D"/usr/sbin/lightdm-gtk-greeter ")
Nov 21 16:56:32 faldara at-spi-bus-launcher[908]: dbus-daemon[908]: Success=
fully activated service 'org.a11y.atspi.Registry'
Nov 21 16:56:32 faldara at-spi-bus-launcher[993]: SpiRegistry daemon is run=
ning with well-known name - org.a11y.atspi.Registry
Nov 21 16:56:32 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.freedesktop.Tracker1' unit=3D'trac=
ker-store.service' requested by ':1.3' (uid=3D118 pid=3D849 comm=3D"/usr/li=
bexec/tracker-miner-fs ")
Nov 21 16:56:32 faldara gvfs-udisks2-vo[886]: monitor says it's not support=
ed
Nov 21 16:56:32 faldara tracker-extract[848]: remote volume monitor with db=
us name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Nov 21 16:56:32 faldara systemd[831]: Starting Tracker metadata database st=
ore and lookup manager...
Nov 21 16:56:32 faldara systemd[831]: Started Tracker file system data mine=
r.
Nov 21 16:56:32 faldara systemd[831]: Started Tracker metadata extractor.
Nov 21 16:56:32 faldara systemd[831]: Reached target Main User Target.
Nov 21 16:56:32 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.freedesktop.Tracker1'
Nov 21 16:56:32 faldara systemd[831]: Started Tracker metadata database sto=
re and lookup manager.
Nov 21 16:56:32 faldara systemd[831]: Startup finished in 1.240s.
Nov 21 16:56:32 faldara tracker-miner-f[849]: Could not initialize currentl=
y active mount points: GDBus.Error:org.freedesktop.Tracker1.SparqlError.Par=
se: Parser error at byte 311: Expected QuadPattern
Nov 21 16:56:42 faldara systemd[831]: tracker-extract.service: Succeeded.
Nov 21 16:56:56 faldara pulseaudio[847]: GetManagedObjects() failed: org.fr=
eedesktop.DBus.Error.NoReply: Did not receive a reply. Possible causes incl=
ude: the remote application did not send a reply, the message bus security =
policy blocked the reply, the reply timeout expired, or the network connect=
ion was broken.
Nov 21 16:56:56 faldara dbus-daemon[684]: [system] Failed to activate servi=
ce 'org.bluez': timed out (service_start_timeout=3D25000ms)
Nov 21 16:57:11 faldara lightdm[1006]: gkr-pam: unable to locate daemon con=
trol file
Nov 21 16:57:11 faldara lightdm[1006]: gkr-pam: stashed password to try lat=
er in open session
Nov 21 16:57:11 faldara lightdm[1006]: pam_unix(lightdm:session): session o=
pened for user psusi(uid=3D1000) by (uid=3D0)
Nov 21 16:57:11 faldara systemd[1]: Created slice User Slice of UID 1000.
Nov 21 16:57:11 faldara systemd[1]: Starting User Runtime Directory /run/us=
er/1000...
Nov 21 16:57:11 faldara systemd-logind[702]: New session 2 of user psusi.
Nov 21 16:57:11 faldara systemd[1]: Finished User Runtime Directory /run/us=
er/1000.
Nov 21 16:57:11 faldara systemd[1]: Starting User Manager for UID 1000...
Nov 21 16:57:11 faldara systemd[1012]: pam_unix(systemd-user:session): sess=
ion opened for user psusi(uid=3D1000) by (uid=3D0)
Nov 21 16:57:11 faldara systemd[1012]: Queued start job for default target =
Main User Target.
Nov 21 16:57:11 faldara systemd[1012]: Created slice User Application Slice.
Nov 21 16:57:11 faldara systemd[1012]: Reached target Paths.
Nov 21 16:57:11 faldara systemd[1012]: Reached target Timers.
Nov 21 16:57:11 faldara systemd[1012]: Starting D-Bus User Message Bus Sock=
et.
Nov 21 16:57:11 faldara systemd[1012]: Listening on GnuPG network certifica=
te management daemon.
Nov 21 16:57:11 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache (access for web browsers).
Nov 21 16:57:11 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache (restricted).
Nov 21 16:57:11 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt (ssh-agent emulation).
Nov 21 16:57:11 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache.
Nov 21 16:57:11 faldara systemd[1012]: Listening on Multimedia System.
Nov 21 16:57:11 faldara systemd[1012]: Listening on debconf communication s=
ocket.
Nov 21 16:57:11 faldara systemd[1012]: Listening on Sound System.
Nov 21 16:57:11 faldara systemd[1012]: Listening on D-Bus User Message Bus =
Socket.
Nov 21 16:57:11 faldara systemd[1012]: Reached target Sockets.
Nov 21 16:57:11 faldara systemd[1012]: Reached target Basic System.
Nov 21 16:57:11 faldara systemd[1]: Started User Manager for UID 1000.
Nov 21 16:57:11 faldara systemd[1012]: Started Multimedia Service.
Nov 21 16:57:11 faldara systemd[1]: Started Session 2 of user psusi.
Nov 21 16:57:11 faldara systemd[1012]: Starting Sound Service...
Nov 21 16:57:11 faldara systemd[1012]: Starting Tracker metadata extractor.=
..
Nov 21 16:57:11 faldara systemd[1012]: Starting Tracker file system data mi=
ner...
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1027 of=
 process 1027 owned by '1000' high priority at nice level -11.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Nov 21 16:57:11 faldara tracker-extract[1029]: Set scheduler policy to SCHE=
D_IDLE
Nov 21 16:57:11 faldara tracker-extract[1029]: Setting priority nice level =
to 19
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Nov 21 16:57:11 faldara tracker-miner-f[1030]: Set scheduler policy to SCHE=
D_IDLE
Nov 21 16:57:11 faldara tracker-miner-f[1030]: Setting priority nice level =
to 19
Nov 21 16:57:11 faldara systemd[1012]: Started D-Bus User Message Bus.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1031 of=
 process 1027 owned by '1000' RT at priority 20.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 9 threads of 4 proce=
sses of 2 users.
Nov 21 16:57:11 faldara pipewire[1027]: Failed to receive portal pid: org.f=
reedesktop.DBus.Error.NameHasNoOwner: Could not get PID of name 'org.freede=
sktop.portal.Desktop': no such name
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.Daemon' unit=3D'gvfs-da=
emon.service' requested by ':1.2' (uid=3D1000 pid=3D1030 comm=3D"/usr/libex=
ec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service.=
..
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1038 of=
 process 1038 owned by '1000' high priority at nice level -11.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 10 threads of 5 proc=
esses of 2 users.
Nov 21 16:57:11 faldara lightdm[1006]: gkr-pam: gnome-keyring-daemon starte=
d properly and unlocked keyring
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.Daemon'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1028 of=
 process 1028 owned by '1000' high priority at nice level -11.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1042 of=
 process 1038 owned by '1000' RT at priority 20.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 12 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.UDisks2VolumeMonitor' u=
nit=3D'gvfs-udisks2-volume-monitor.service' requested by ':1.2' (uid=3D1000=
 pid=3D1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service =
- disk device monitor...
Nov 21 16:57:11 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UDisks2' unit=3D'udisks2.service' requested=
 by ':1.45' (uid=3D1000 pid=3D1081 comm=3D"/usr/libexec/gvfs-udisks2-volume=
-monitor ")
Nov 21 16:57:11 faldara dbus-daemon[684]: [system] Activation via systemd f=
ailed for unit 'udisks2.service': Unit udisks2.service is masked.
Nov 21 16:57:11 faldara gvfs-udisks2-vo[1081]: monitor says it's not suppor=
ted
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.UDisks2VolumeMonitor'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service -=
 disk device monitor.
Nov 21 16:57:11 faldara gvfs-udisks2-vo[1081]: monitor says it's not suppor=
ted
Nov 21 16:57:11 faldara tracker-miner-f[1030]: remote volume monitor with d=
bus name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.MTPVolumeMonitor' unit=
=3D'gvfs-mtp-volume-monitor.service' requested by ':1.2' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service =
- Media Transfer Protocol monitor...
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.MTPVolumeMonitor'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service -=
 Media Transfer Protocol monitor.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.GPhoto2VolumeMonitor' u=
nit=3D'gvfs-gphoto2-volume-monitor.service' requested by ':1.2' (uid=3D1000=
 pid=3D1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service =
- digital camera monitor...
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.GPhoto2VolumeMonitor'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service -=
 digital camera monitor.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.GoaVolumeMonitor' unit=
=3D'gvfs-goa-volume-monitor.service' requested by ':1.2' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service =
- GNOME Online Accounts monitor...
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating service name=3D'org.gnome.OnlineAccounts' requested by ':1.12' (=
uid=3D1000 pid=3D1120 comm=3D"/usr/libexec/gvfs-goa-volume-monitor ")
Nov 21 16:57:11 faldara goa-daemon[1124]: goa-daemon version 3.38.0 starting
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating service name=3D'org.gnome.Identity' requested by ':1.16' (uid=3D=
1000 pid=3D1124 comm=3D"/usr/libexec/goa-daemon ")
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gnome.Identity'
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gnome.OnlineAccounts'
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.GoaVolumeMonitor'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service -=
 GNOME Online Accounts monitor.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.gtk.vfs.AfcVolumeMonitor' unit=
=3D'gvfs-afc-volume-monitor.service' requested by ':1.2' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Virtual filesystem service =
- Apple File Conduit monitor...
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.gtk.vfs.AfcVolumeMonitor'
Nov 21 16:57:11 faldara systemd[1012]: Started Virtual filesystem service -=
 Apple File Conduit monitor.
Nov 21 16:57:11 faldara gvfs-udisks2-vo[1081]: monitor says it's not suppor=
ted
Nov 21 16:57:11 faldara tracker-extract[1029]: remote volume monitor with d=
bus name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Nov 21 16:57:11 faldara systemd[1012]: Started Tracker metadata extractor.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating service name=3D'org.freedesktop.portal.IBus' requested by ':1.19=
' (uid=3D1000 pid=3D1173 comm=3D"/usr/bin/ibus-daemon --daemonize --xim ")
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.freedesktop.portal.IBus'
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Activating via systemd: service name=3D'org.freedesktop.Tracker1' unit=3D't=
racker-store.service' requested by ':1.2' (uid=3D1000 pid=3D1030 comm=3D"/u=
sr/libexec/tracker-miner-fs ")
Nov 21 16:57:11 faldara systemd[1012]: Starting Tracker metadata database s=
tore and lookup manager...
Nov 21 16:57:11 faldara systemd[1012]: Started Tracker file system data min=
er.
Nov 21 16:57:11 faldara dbus-daemon[1032]: [session uid=3D1000 pid=3D1032] =
Successfully activated service 'org.freedesktop.Tracker1'
Nov 21 16:57:11 faldara systemd[1012]: Started Tracker metadata database st=
ore and lookup manager.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 12 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Successfully made thread 1207 of=
 process 1028 owned by '1000' RT at priority 5.
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 13 threads of 6 proc=
esses of 2 users.
Nov 21 16:57:11 faldara tracker-miner-f[1030]: Could not initialize current=
ly active mount points: GDBus.Error:org.freedesktop.Tracker1.SparqlError.Pa=
rse: Parser error at byte 11: Expected QuadPattern
Nov 21 16:57:11 faldara systemd[1]: Stopping Session c1 of user lightdm.
Nov 21 16:57:11 faldara systemd[831]: pulseaudio.service: Succeeded.
Nov 21 16:57:11 faldara lightdm[827]: pam_unix(lightdm-greeter:session): se=
ssion closed for user lightdm
Nov 21 16:57:11 faldara rtkit-daemon[852]: Supervising 10 threads of 5 proc=
esses of 2 users.
Nov 21 16:57:11 faldara kernel: [drm] Unknown EDID CEA parser results
Nov 21 16:57:12 faldara systemd[1]: session-c1.scope: Succeeded.
Nov 21 16:57:12 faldara systemd[1]: Stopped Session c1 of user lightdm.
Nov 21 16:57:12 faldara systemd[1]: session-c1.scope: Consumed 1.530s CPU t=
ime.
Nov 21 16:57:12 faldara rtkit-daemon[852]: Successfully made thread 1229 of=
 process 1028 owned by '1000' RT at priority 5.
Nov 21 16:57:12 faldara rtkit-daemon[852]: Supervising 11 threads of 5 proc=
esses of 2 users.
Nov 21 16:57:12 faldara systemd-logind[702]: Removed session c1.
Nov 21 16:57:12 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.bluez' unit=3D'dbus-org.bluez.service' requested by ':1=
.53' (uid=3D1000 pid=3D1028 comm=3D"/usr/bin/pulseaudio --daemonize=3Dno --=
log-target=3Djo")
Nov 21 16:57:12 faldara systemd[1]: Condition check resulted in Bluetooth s=
ervice being skipped.
Nov 21 16:57:12 faldara systemd[1012]: Started Sound Service.
Nov 21 16:57:12 faldara systemd[1012]: Reached target Main User Target.
Nov 21 16:57:12 faldara systemd[1012]: Startup finished in 977ms.
Nov 21 16:57:17 faldara sudo[1260]:    psusi : TTY=3Dpts/0 ; PWD=3D/home/ps=
usi ; USER=3Droot ; COMMAND=3D/bin/bash
Nov 21 16:57:17 faldara sudo[1260]: pam_unix(sudo:session): session opened =
for user root(uid=3D0) by (uid=3D1000)
Nov 21 16:57:20 faldara ModemManager[773]: <info>  [sleep-monitor] system i=
s about to suspend
Nov 21 16:57:20 faldara systemd[1]: Reached target Sleep.
Nov 21 16:57:20 faldara systemd[1]: Starting Suspend...
Nov 21 16:57:20 faldara systemd-sleep[1274]: Suspending system...
Nov 21 16:57:20 faldara kernel: PM: suspend entry (deep)
Nov 21 16:57:20 faldara kernel: Filesystems sync: 0.014 seconds
Nov 21 16:57:20 faldara kernel: Freezing user space processes
Nov 21 16:57:20 faldara kernel: Freezing user space processes completed (el=
apsed 0.000 seconds)
Nov 21 16:57:20 faldara kernel: OOM killer disabled.
Nov 21 16:57:20 faldara kernel: Freezing remaining freezable tasks
Nov 21 16:57:20 faldara kernel: Freezing remaining freezable tasks complete=
d (elapsed 0.001 seconds)
Nov 21 16:57:20 faldara kernel: printk: Suspending console(s) (use no_conso=
le_suspend to debug)
Nov 21 16:57:20 faldara kernel: serial 00:01: disabled
Nov 21 16:57:20 faldara kernel: e1000e: EEE TX LPI TIMER: 00000011
Nov 21 16:57:20 faldara kernel: sd 4:0:0:0: [sdb] Synchronizing SCSI cache
Nov 21 16:57:20 faldara kernel: sd 5:0:0:0: [sdc] Synchronizing SCSI cache
Nov 21 16:57:20 faldara kernel: sd 1:0:0:0: [sda] Synchronizing SCSI cache
Nov 21 16:57:20 faldara kernel: ata5.00: Entering standby power mode
Nov 21 16:57:20 faldara kernel: ata2.00: Entering standby power mode
Nov 21 16:57:20 faldara kernel: ata6.00: Entering standby power mode
Nov 21 16:57:20 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Nov 21 16:57:20 faldara kernel: [TTM] Buffer eviction failed
Nov 21 16:57:20 faldara kernel: [drm] evicting device resources failed
Nov 21 16:57:20 faldara kernel: amdgpu 0000:03:00.0: PM: pci_pm_suspend(): =
amdgpu_pmops_suspend+0x0/0x80 [amdgpu] returns -19
Nov 21 16:57:20 faldara kernel: amdgpu 0000:03:00.0: PM: dpm_run_callback()=
: pci_pm_suspend+0x0/0x170 returns -19
Nov 21 16:57:20 faldara kernel: amdgpu 0000:03:00.0: PM: failed to suspend =
async: error -19
Nov 21 16:57:20 faldara kernel: PM: Some devices failed to suspend, or earl=
y wake event detected
Nov 21 16:57:20 faldara kernel: xhci_hcd 0000:06:00.0: xHC error in resume,=
 USBSTS 0x401, Reinit
Nov 21 16:57:20 faldara kernel: usb usb3: root hub lost power or was reset
Nov 21 16:57:20 faldara kernel: usb usb4: root hub lost power or was reset
Nov 21 16:57:20 faldara kernel: serial 00:01: activated
Nov 21 16:57:20 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
Nov 21 16:57:20 faldara kernel: OOM killer enabled.
Nov 21 16:57:20 faldara kernel: Restarting tasks ... done.
Nov 21 16:57:20 faldara kernel: random: crng reseeded on system resumption
Nov 21 16:57:20 faldara kernel: PM: suspend exit
Nov 21 16:57:20 faldara kernel: PM: suspend entry (s2idle)
Nov 21 16:57:21 faldara kernel: Filesystems sync: 0.009 seconds
Nov 21 16:57:21 faldara kernel: Freezing user space processes
Nov 21 16:57:21 faldara kernel: Freezing user space processes completed (el=
apsed 0.001 seconds)
Nov 21 16:57:21 faldara kernel: OOM killer disabled.
Nov 21 16:57:21 faldara kernel: Freezing remaining freezable tasks
Nov 21 16:57:21 faldara kernel: ata8: SATA link down (SStatus 0 SControl 30=
0)
Nov 21 16:57:21 faldara kernel: ata7: SATA link down (SStatus 0 SControl 30=
0)
Nov 21 16:57:21 faldara kernel: ata6: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:57:21 faldara kernel: ata3: SATA link down (SStatus 4 SControl 30=
0)
Nov 21 16:57:21 faldara kernel: ata5: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:57:21 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SC=
ontrol 300)
Nov 21 16:57:21 faldara kernel: ata2: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Nov 21 16:57:21 faldara kernel: ata1: SATA link down (SStatus 4 SControl 30=
0)
Nov 21 16:57:21 faldara kernel: ata6.00: configured for UDMA/133
Nov 21 16:57:21 faldara kernel: ata5.00: configured for UDMA/133
Nov 21 16:57:21 faldara kernel: ata6.00: Entering active power mode
Nov 21 16:57:21 faldara kernel: ata2.00: configured for UDMA/133
Nov 21 16:57:21 faldara kernel: ata5.00: Entering active power mode
Nov 21 16:57:21 faldara kernel: ata2.00: Entering active power mode
Nov 21 16:57:21 faldara kernel: ata4.00: configured for UDMA/133
Nov 21 16:57:21 faldara kernel: Freezing remaining freezable tasks complete=
d (elapsed 0.143 seconds)
Nov 21 16:57:21 faldara kernel: printk: Suspending console(s) (use no_conso=
le_suspend to debug)
Nov 21 16:57:21 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Nov 21 16:57:21 faldara kernel: [TTM] Buffer eviction failed
Nov 21 16:57:21 faldara kernel: [drm] evicting device resources failed
Nov 21 16:57:21 faldara kernel: amdgpu 0000:03:00.0: PM: device_prepare(): =
pci_pm_prepare+0x0/0x70 returns -19
Nov 21 16:57:21 faldara kernel: amdgpu 0000:03:00.0: PM: not prepared for p=
ower transition: code -19
Nov 21 16:57:21 faldara kernel: PM: Some devices failed to suspend, or earl=
y wake event detected
Nov 21 16:57:21 faldara kernel: OOM killer enabled.
Nov 21 16:57:21 faldara kernel: Restarting tasks ... done.
Nov 21 16:57:21 faldara kernel: random: crng reseeded on system resumption
Nov 21 16:57:21 faldara kernel: PM: suspend exit
Nov 21 16:57:21 faldara systemd-sleep[1274]: Failed to suspend system. Syst=
em resumed again: No such device
Nov 21 16:57:21 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Nov 21 16:57:21 faldara systemd[1]: systemd-suspend.service: Main process e=
xited, code=3Dexited, status=3D1/FAILURE
Nov 21 16:57:21 faldara systemd[1]: systemd-suspend.service: Failed with re=
sult 'exit-code'.
Nov 21 16:57:21 faldara systemd[1]: Failed to start Suspend.
Nov 21 16:57:21 faldara systemd[1]: Dependency failed for Suspend.
Nov 21 16:57:21 faldara systemd[1]: suspend.target: Job suspend.target/star=
t failed with result 'dependency'.
Nov 21 16:57:21 faldara systemd-logind[702]: Operation 'sleep' finished.
Nov 21 16:57:21 faldara systemd[1]: Stopped target Sleep.
Nov 21 16:57:21 faldara ModemManager[773]: <info>  [sleep-monitor] system i=
s resuming
Nov 21 16:57:21 faldara systemd-networkd[410]: lo: Reset carrier
Nov 21 16:57:21 faldara systemd[1012]: tracker-extract.service: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: Stopping User Manager for UID 118...
Nov 21 16:57:22 faldara systemd[831]: Stopped target Main User Target.
Nov 21 16:57:22 faldara systemd[831]: Stopping Accessibility services bus...
Nov 21 16:57:22 faldara systemd[831]: Stopping D-Bus User Message Bus...
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service -=
 Apple File Conduit monitor...
Nov 21 16:57:22 faldara tracker-miner-fs[849]: Received signal:15->'Termina=
ted'
Nov 21 16:57:22 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service...
Nov 21 16:57:22 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Nov 21 16:57:22 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service -=
 GNOME Online Accounts monitor...
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service -=
 digital camera monitor...
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service -=
 Media Transfer Protocol monitor...
Nov 21 16:57:22 faldara tracker-miner-fs[849]: OK
Nov 21 16:57:22 faldara systemd[831]: Stopping Virtual filesystem service -=
 disk device monitor...
Nov 21 16:57:22 faldara pipewire-media-session[861]: error id:0 seq:158 res=
:-32 (Broken pipe): connection error
Nov 21 16:57:22 faldara systemd[831]: Stopping Multimedia Service...
Nov 21 16:57:22 faldara systemd[831]: Stopping Tracker file system data min=
er...
Nov 21 16:57:22 faldara systemd[831]: Stopping Tracker metadata database st=
ore and lookup manager...
Nov 21 16:57:22 faldara systemd[831]: gvfs-udisks2-volume-monitor.service: =
Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service - =
disk device monitor.
Nov 21 16:57:22 faldara systemd[831]: run-user-118-gvfs.mount: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: dbus.service: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: run-user-118-gvfs.mount: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped D-Bus User Message Bus.
Nov 21 16:57:22 faldara systemd[831]: gvfs-mtp-volume-monitor.service: Succ=
eeded.
Nov 21 16:57:22 faldara systemd[1012]: run-user-118-gvfs.mount: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service - =
Media Transfer Protocol monitor.
Nov 21 16:57:22 faldara systemd[831]: at-spi-dbus-bus.service: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Accessibility services bus.
Nov 21 16:57:22 faldara systemd[831]: gvfs-gphoto2-volume-monitor.service: =
Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service - =
digital camera monitor.
Nov 21 16:57:22 faldara systemd[831]: gvfs-goa-volume-monitor.service: Succ=
eeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service - =
GNOME Online Accounts monitor.
Nov 21 16:57:22 faldara systemd[831]: gvfs-afc-volume-monitor.service: Succ=
eeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service - =
Apple File Conduit monitor.
Nov 21 16:57:22 faldara systemd[831]: gvfs-daemon.service: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Virtual filesystem service.
Nov 21 16:57:22 faldara systemd[831]: pipewire.service: Succeeded.
Nov 21 16:57:22 faldara tracker-store[998]: Received signal:15->'Terminated'
Nov 21 16:57:22 faldara tracker-store[998]: OK
Nov 21 16:57:22 faldara systemd[831]: Stopped Multimedia Service.
Nov 21 16:57:22 faldara systemd[831]: tracker-store.service: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Tracker metadata database sto=
re and lookup manager.
Nov 21 16:57:22 faldara systemd[831]: tracker-miner-fs.service: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Stopped Tracker file system data mine=
r.
Nov 21 16:57:22 faldara systemd[831]: Stopped target Basic System.
Nov 21 16:57:22 faldara systemd[831]: Stopped target Paths.
Nov 21 16:57:22 faldara systemd[831]: Stopped target Sockets.
Nov 21 16:57:22 faldara systemd[831]: Stopped target Timers.
Nov 21 16:57:22 faldara systemd[831]: dbus.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed D-Bus User Message Bus Socket.
Nov 21 16:57:22 faldara systemd[831]: dirmngr.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed GnuPG network certificate mana=
gement daemon.
Nov 21 16:57:22 faldara systemd[831]: gpg-agent-browser.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache (access for web browsers).
Nov 21 16:57:22 faldara systemd[831]: gpg-agent-extra.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache (restricted).
Nov 21 16:57:22 faldara systemd[831]: gpg-agent-ssh.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed GnuPG cryptographic agent (ssh=
-agent emulation).
Nov 21 16:57:22 faldara systemd[831]: gpg-agent.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache.
Nov 21 16:57:22 faldara systemd[831]: pipewire.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed Multimedia System.
Nov 21 16:57:22 faldara systemd[831]: pk-debconf-helper.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed debconf communication socket.
Nov 21 16:57:22 faldara systemd[831]: pulseaudio.socket: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Closed Sound System.
Nov 21 16:57:22 faldara systemd[831]: Removed slice User Application Slice.
Nov 21 16:57:22 faldara systemd[831]: app.slice: Consumed 1.117s CPU time.
Nov 21 16:57:22 faldara systemd[831]: Reached target Shutdown.
Nov 21 16:57:22 faldara systemd[831]: systemd-exit.service: Succeeded.
Nov 21 16:57:22 faldara systemd[831]: Finished Exit the Session.
Nov 21 16:57:22 faldara systemd[831]: Reached target Exit the Session.
Nov 21 16:57:22 faldara systemd[1]: user@118.service: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: Stopped User Manager for UID 118.
Nov 21 16:57:22 faldara systemd[1]: user@118.service: Consumed 1.312s CPU t=
ime.
Nov 21 16:57:22 faldara systemd[1]: Stopping User Runtime Directory /run/us=
er/118...
Nov 21 16:57:22 faldara systemd[1012]: run-user-118.mount: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: run-user-118.mount: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: user-runtime-dir@118.service: Succeeded.
Nov 21 16:57:22 faldara systemd[1]: Stopped User Runtime Directory /run/use=
r/118.
Nov 21 16:57:22 faldara systemd[1]: Removed slice User Slice of UID 118.
Nov 21 16:57:22 faldara systemd[1]: user-118.slice: Consumed 2.868s CPU tim=
e.
Nov 21 16:57:23 faldara ModemManager[773]: <info>  [base-manager] couldn't =
check support for device '/sys/devices/pci0000:00/0000:00:1f.6': not suppor=
ted by any plugin
Nov 21 16:57:27 faldara systemd-networkd[410]: enp0s31f6: Gained carrier
Nov 21 16:57:27 faldara kernel: e1000e 0000:00:1f.6 enp0s31f6: NIC Link is =
Up 100 Mbps Full Duplex, Flow Control: Rx/Tx
Nov 21 16:57:28 faldara avahi-daemon[682]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Nov 21 16:57:28 faldara avahi-daemon[682]: New relevant interface enp0s31f6=
.IPv6 for mDNS.
Nov 21 16:57:28 faldara systemd-networkd[410]: enp0s31f6: Gained IPv6LL
Nov 21 16:57:28 faldara avahi-daemon[682]: Registering new address record f=
or fe80::3ad5:47ff:fe0f:488a on enp0s31f6.*.
Nov 21 16:57:28 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:30 faldara avahi-daemon[682]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Nov 21 16:57:30 faldara avahi-daemon[682]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address 2603:9001:300:68d7:3ad5:47ff:fe0f:488=
a.
Nov 21 16:57:30 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:30 faldara avahi-daemon[682]: Registering new address record f=
or 2603:9001:300:68d7:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Nov 21 16:57:30 faldara avahi-daemon[682]: Withdrawing address record for f=
e80::3ad5:47ff:fe0f:488a on enp0s31f6.
Nov 21 16:57:30 faldara avahi-daemon[682]: Registering new address record f=
or fd11:e97f:83ec:0:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Nov 21 16:57:30 faldara systemd-networkd[410]: enp0s31f6: DHCPv4 address 19=
2.168.1.110/24 via 192.168.1.1
Nov 21 16:57:30 faldara dbus-daemon[684]: [system] Activating via systemd: =
service name=3D'org.freedesktop.hostname1' unit=3D'dbus-org.freedesktop.hos=
tname1.service' requested by ':1.1' (uid=3D102 pid=3D410 comm=3D"/lib/syste=
md/systemd-networkd ")
Nov 21 16:57:30 faldara avahi-daemon[682]: Joining mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.110.
Nov 21 16:57:30 faldara avahi-daemon[682]: New relevant interface enp0s31f6=
.IPv4 for mDNS.
Nov 21 16:57:30 faldara avahi-daemon[682]: Registering new address record f=
or 192.168.1.110 on enp0s31f6.IPv4.
Nov 21 16:57:30 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:30 faldara systemd[1]: Starting Hostname Service...
Nov 21 16:57:30 faldara dbus-daemon[684]: [system] Successfully activated s=
ervice 'org.freedesktop.hostname1'
Nov 21 16:57:30 faldara systemd[1]: Started Hostname Service.
Nov 21 16:57:31 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:31 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:31 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:31 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:31 faldara systemd-timesyncd[656]: Network configuration chang=
ed, trying to establish connection.
Nov 21 16:57:37 faldara dbus-daemon[684]: [system] Failed to activate servi=
ce 'org.bluez': timed out (service_start_timeout=3D25000ms)
Nov 21 16:57:37 faldara pulseaudio[1028]: GetManagedObjects() failed: org.f=
reedesktop.DBus.Error.NoReply: Did not receive a reply. Possible causes inc=
lude: the remote application did not send a reply, the message bus security=
 policy blocked the reply, the reply timeout expired, or the network connec=
tion was broken.
Nov 21 16:57:45 faldara kernel: sysrq: Keyboard mode set to system default
Nov 21 16:57:46 faldara systemd-journald[363]: Journal stopped
Nov 21 16:57:46 faldara kernel: sysrq: Terminate All Tasks
Nov 21 16:57:46 faldara systemd-journald[363]: Received SIGTERM.
Nov 21 16:57:46 faldara kernel: BUG: kernel NULL pointer dereference, addre=
ss: 0000000000000000
Nov 21 16:57:46 faldara kernel: #PF: supervisor read access in kernel mode
Nov 21 16:57:46 faldara kernel: #PF: error_code(0x0000) - not-present page
Nov 21 16:57:46 faldara kernel: PGD 0 P4D 0=20
Nov 21 16:57:46 faldara kernel: Oops: 0000 [#1] PREEMPT SMP
Nov 21 16:57:46 faldara kernel: CPU: 0 PID: 702 Comm: systemd-logind Not ta=
inted 6.7.0-rc2+ #42
Nov 21 16:57:46 faldara kernel: Hardware name: System manufacturer System P=
roduct Name/Z170 PRO GAMING, BIOS 3805 05/16/2018
Nov 21 16:57:46 faldara kernel: RIP: 0010:dc_resource_state_copy_construct+=
0x27/0x180 [amdgpu]
Nov 21 16:57:46 faldara kernel: Code: 44 00 00 66 0f 1f 00 0f 1f 44 00 00 4=
1 56 41 55 41 54 49 89 f4 55 31 ed 53 48 8b 87 08 5b 00 00 48 89 fb 44 8b a=
e 78 55 02 00 <48> 8b 00 48 8b 00 80 b8 77 01 00 00 00 74 07 48 8b ae f0 4a=
 02 00
Nov 21 16:57:46 faldara kernel: RSP: 0018:ffffaabf80847568 EFLAGS: 00010246
Nov 21 16:57:46 faldara kernel: RAX: 0000000000000000 RBX: ffff9f96df0c0000=
 RCX: 0000000000000005
Nov 21 16:57:46 faldara kernel: RDX: 00000000ffffffff RSI: ffff9f96e7880000=
 RDI: ffff9f96df0c0000
Nov 21 16:57:46 faldara kernel: RBP: 0000000000000000 R08: 0000000000000000=
 R09: 0000000000000000
Nov 21 16:57:46 faldara kernel: R10: 0000000000000000 R11: 0000000000000000=
 R12: ffff9f96e7880000
Nov 21 16:57:46 faldara kernel: R13: 0000000000000001 R14: ffffaabf808475d8=
 R15: ffff9f96c520d000
Nov 21 16:57:46 faldara kernel: FS:  00007f5782348980(0000) GS:ffff9f99a6c0=
0000(0000) knlGS:0000000000000000
Nov 21 16:57:46 faldara kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Nov 21 16:57:46 faldara kernel: CR2: 0000000000000000 CR3: 000000014be5f003=
 CR4: 00000000003706f0
Nov 21 16:57:46 faldara kernel: DR0: 0000000000000000 DR1: 0000000000000000=
 DR2: 0000000000000000
Nov 21 16:57:46 faldara kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0=
 DR7: 0000000000000400
Nov 21 16:57:46 faldara kernel: Call Trace:
Nov 21 16:57:46 faldara kernel:  <TASK>
Nov 21 16:57:46 faldara kernel:  ? __die+0x24/0x70
Nov 21 16:57:46 faldara kernel:  ? page_fault_oops+0x151/0x4a0
Nov 21 16:57:46 faldara kernel:  ? do_user_addr_fault+0x69/0x690
Nov 21 16:57:46 faldara kernel:  ? exc_page_fault+0x78/0x170
Nov 21 16:57:46 faldara kernel:  ? asm_exc_page_fault+0x26/0x30
Nov 21 16:57:46 faldara kernel:  ? dc_resource_state_copy_construct+0x27/0x=
180 [amdgpu]
Nov 21 16:57:46 faldara kernel:  dc_commit_streams+0x19f/0x3f0 [amdgpu]
Nov 21 16:57:46 faldara kernel:  amdgpu_dm_atomic_commit_tail+0x5e8/0x38c0 =
[amdgpu]
Nov 21 16:57:46 faldara kernel:  ? _raw_spin_unlock_irqrestore+0x27/0x40
Nov 21 16:57:46 faldara kernel:  ? try_to_wake_up+0xa8/0x650
Nov 21 16:57:46 faldara kernel:  ? __bpf_trace_task_rename+0x10/0x10
Nov 21 16:57:46 faldara kernel:  ? __bpf_trace_task_rename+0x10/0x10
Nov 21 16:57:46 faldara kernel:  ? __call_rcu_common.constprop.0+0x1ab/0x690
Nov 21 16:57:46 faldara kernel:  ? child_wait_callback+0x50/0x50
Nov 21 16:57:46 faldara kernel:  ? __schedule+0x37e/0xb20
Nov 21 16:57:46 faldara kernel:  ? __cond_resched+0x1c/0x30
Nov 21 16:57:46 faldara kernel:  ? preempt_count_add+0x6c/0xa0
Nov 21 16:57:46 faldara kernel:  ? _raw_spin_lock_irq+0x1d/0x40
Nov 21 16:57:46 faldara kernel:  ? _raw_spin_unlock_irq+0x1f/0x40
Nov 21 16:57:46 faldara kernel:  ? __wait_for_common+0x1a2/0x1d0
Nov 21 16:57:46 faldara kernel:  ? usleep_range_state+0x90/0x90
Nov 21 16:57:46 faldara kernel:  commit_tail+0x91/0x120 [drm_kms_helper]
Nov 21 16:57:46 faldara kernel:  drm_atomic_helper_commit+0x117/0x140 [drm_=
kms_helper]
Nov 21 16:57:46 faldara kernel:  drm_atomic_commit+0x94/0xf0 [drm]
Nov 21 16:57:46 faldara kernel:  ? __drm_printfn_seq_file+0x20/0x20 [drm]
Nov 21 16:57:46 faldara kernel:  drm_client_modeset_commit_atomic+0x1e4/0x2=
20 [drm]
Nov 21 16:57:46 faldara kernel:  drm_client_modeset_commit_locked+0x5a/0x15=
0 [drm]
Nov 21 16:57:46 faldara kernel:  __drm_fb_helper_restore_fbdev_mode_unlocke=
d+0x59/0xc0 [drm_kms_helper]
Nov 21 16:57:46 faldara kernel:  drm_fb_helper_set_par+0x32/0x40 [drm_kms_h=
elper]
Nov 21 16:57:46 faldara kernel:  fb_set_var+0x1b9/0x3d0
Nov 21 16:57:46 faldara kernel:  ? xas_store+0x5a/0x5c0
Nov 21 16:57:46 faldara kernel:  fbcon_blank+0x1af/0x2b0
Nov 21 16:57:46 faldara kernel:  do_unblank_screen+0xa5/0x160
Nov 21 16:57:46 faldara kernel:  vt_ioctl+0xc8c/0x1320
Nov 21 16:57:46 faldara kernel:  tty_ioctl+0x33e/0x890
Nov 21 16:57:46 faldara kernel:  ? __seccomp_filter+0x37a/0x5b0
Nov 21 16:57:46 faldara kernel:  __x64_sys_ioctl+0x87/0xc0
Nov 21 16:57:46 faldara kernel:  do_syscall_64+0x59/0x110
Nov 21 16:57:46 faldara kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
Nov 21 16:57:46 faldara kernel:  ? do_syscall_64+0x65/0x110
Nov 21 16:57:46 faldara kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
Nov 21 16:57:46 faldara kernel:  ? do_syscall_64+0x65/0x110
Nov 21 16:57:46 faldara kernel:  ? syscall_exit_to_user_mode+0x2b/0x40
Nov 21 16:57:46 faldara kernel:  ? do_syscall_64+0x65/0x110
Nov 21 16:57:46 faldara kernel:  ? do_syscall_64+0x65/0x110
Nov 21 16:57:46 faldara kernel:  ? do_syscall_64+0x65/0x110
Nov 21 16:57:46 faldara kernel:  entry_SYSCALL_64_after_hwframe+0x46/0x4e
Nov 21 16:57:46 faldara kernel: RIP: 0033:0x7f578291d237
Nov 21 16:57:46 faldara kernel: Code: 00 00 00 48 8b 05 59 cc 0d 00 64 c7 0=
0 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 0=
0 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 29 cc 0d 00 f7 d8 64 89=
 01 48
Nov 21 16:57:46 faldara kernel: RSP: 002b:00007ffdcb9fe208 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000010
Nov 21 16:57:46 faldara kernel: RAX: ffffffffffffffda RBX: 000055bcd4a0a6a0=
 RCX: 00007f578291d237
Nov 21 16:57:46 faldara kernel: RDX: 0000000000000000 RSI: 0000000000004b3a=
 RDI: 000000000000001d
Nov 21 16:57:46 faldara kernel: RBP: 000000000000001d R08: 000055bcd49fc850=
 R09: 00007ffdcb9fe0b0
Nov 21 16:57:46 faldara kernel: R10: 0000000003410803 R11: 0000000000000246=
 R12: 0000000000000000
Nov 21 16:57:46 faldara kernel: R13: 00007ffdcb9fe360 R14: 00007ffdcb9fe358=
 R15: 00007ffdcb9fe370
Nov 21 16:57:46 faldara kernel:  </TASK>
Nov 21 16:57:46 faldara kernel: Modules linked in: intel_rapl_msr intel_rap=
l_common x86_pkg_temp_thermal intel_powerclamp coretemp crc32_pclmul ghash_=
clmulni_intel sha512_ssse3 sha512_generic sha256_ssse3 sha1_ssse3 aesni_int=
el crypto_simd cryptd ext4 snd_hda_codec_realtek eeepc_wmi snd_hda_codec_ge=
neric asus_wmi battery snd_hda_codec_hdmi ledtrig_audio snd_hda_intel spars=
e_keymap nls_ascii rapl snd_intel_dspcfg platform_profile intel_cstate nls_=
cp437 snd_hda_codec vfat crc16 mbcache fat rfkill jbd2 wmi_bmof snd_hda_cor=
e intel_uncore snd_pcm mxm_wmi efi_pstore iTCO_wdt uas intel_pmc_bxt ee1004=
 snd_timer iTCO_vendor_support usb_storage snd watchdog joydev mei_me sound=
core mei evdev sg intel_pmc_core acpi_pad button fuse msr configfs efivarfs=
 ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c crc32c_generic =
xor raid6_pq amdgpu drm_exec sr_mod amdxcp drm_buddy hid_generic gpu_sched =
cdrom sd_mod usbhid drm_suballoc_helper i2c_algo_bit drm_ttm_helper hid dm_=
mod ttm drm_display_helper cec drm_kms_helper ahci nvme libahci drm libata
Nov 21 16:57:46 faldara kernel:  nvme_core xhci_pci scsi_mod xhci_hcd t10_p=
i crc64_rocksoft crc64 crc_t10dif e1000e usbcore i2c_i801 scsi_common crct1=
0dif_generic crct10dif_pclmul crct10dif_common crc32c_intel i2c_smbus usb_c=
ommon video fan wmi
Nov 21 16:57:46 faldara kernel: CR2: 0000000000000000
Nov 21 16:57:46 faldara kernel: ---[ end trace 0000000000000000 ]---
Nov 21 16:57:46 faldara kernel: RIP: 0010:dc_resource_state_copy_construct+=
0x27/0x180 [amdgpu]
Nov 21 16:57:46 faldara kernel: Code: 44 00 00 66 0f 1f 00 0f 1f 44 00 00 4=
1 56 41 55 41 54 49 89 f4 55 31 ed 53 48 8b 87 08 5b 00 00 48 89 fb 44 8b a=
e 78 55 02 00 <48> 8b 00 48 8b 00 80 b8 77 01 00 00 00 74 07 48 8b ae f0 4a=
 02 00
Nov 21 16:57:46 faldara kernel: RSP: 0018:ffffaabf80847568 EFLAGS: 00010246
Nov 21 16:57:46 faldara kernel: RAX: 0000000000000000 RBX: ffff9f96df0c0000=
 RCX: 0000000000000005
Nov 21 16:57:46 faldara kernel: RDX: 00000000ffffffff RSI: ffff9f96e7880000=
 RDI: ffff9f96df0c0000
Nov 21 16:57:46 faldara kernel: RBP: 0000000000000000 R08: 0000000000000000=
 R09: 0000000000000000
Nov 21 16:57:46 faldara kernel: R10: 0000000000000000 R11: 0000000000000000=
 R12: ffff9f96e7880000
Nov 21 16:57:46 faldara kernel: R13: 0000000000000001 R14: ffffaabf808475d8=
 R15: ffff9f96c520d000
Nov 21 16:57:46 faldara kernel: FS:  00007f5782348980(0000) GS:ffff9f99a6c0=
0000(0000) knlGS:0000000000000000
Nov 21 16:57:46 faldara kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Nov 21 16:57:46 faldara kernel: CR2: 0000000000000000 CR3: 000000014be5f003=
 CR4: 00000000003706f0
Nov 21 16:57:46 faldara kernel: DR0: 0000000000000000 DR1: 0000000000000000=
 DR2: 0000000000000000
Nov 21 16:57:46 faldara kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0=
 DR7: 0000000000000400
Nov 21 16:57:46 faldara kernel: note: systemd-logind[702] exited with irqs =
disabled
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Consumed 1.388s =
CPU time.
Nov 21 16:57:46 faldara systemd[1]: accounts-daemon.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: avahi-daemon.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: minidlna.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Main process exited, c=
ode=3Dexited, status=3D1/FAILURE
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Failed with result 'ex=
it-code'.
Nov 21 16:57:46 faldara systemd[1]: ModemManager.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-journald.service: Scheduled res=
tart job, restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: Stopping Flush Journal to Persistent St=
orage...
Nov 21 16:57:46 faldara systemd[1]: Stopped Rule-based Manager for Device E=
vents and Files.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Consumed 1.388s =
CPU time.
Nov 21 16:57:46 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Nov 21 16:57:46 faldara systemd[1]: systemd-journal-flush.service: Succeede=
d.
Nov 21 16:57:46 faldara systemd[1]: Stopped Flush Journal to Persistent Sto=
rage.
Nov 21 16:57:46 faldara systemd[1]: Stopped Journal Service.
Nov 21 16:57:46 faldara systemd[1]: Starting Journal Service...
Nov 21 16:57:46 faldara systemd[1]: dbus.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: colord.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Started D-Bus System Message Bus.
Nov 21 16:57:46 faldara systemd[1]: polkit.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Starting Manage, Install and Generate C=
olor Profiles...
Nov 21 16:57:46 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Nov 21 16:57:46 faldara systemd[1]: Started Manage, Install and Generate Co=
lor Profiles.
Nov 21 16:57:46 faldara systemd[1]: systemd-hostnamed.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-networkd.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-resolved.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-timesyncd.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: switcheroo-control.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: systemd-resolved.service: Scheduled res=
tart job, restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: systemd-timesyncd.service: Scheduled re=
start job, restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: Stopped Network Name Resolution.
Nov 21 16:57:46 faldara systemd-journald[1492]: Journal started
Nov 21 16:57:46 faldara systemd-journald[1492]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 992.0M, max 4.0G, 3.0G free.
Nov 21 16:57:46 faldara systemd[1]: cron.service: Succeeded.
Nov 21 16:57:46 faldara avahi-daemon[682]: Got SIGTERM, quitting.
Nov 21 16:57:46 faldara lightdm[771]: Failed to get D-Bus connection
Nov 21 16:57:46 faldara tracker-miner-fs[1030]: Received signal:15->'Termin=
ated'
Nov 21 16:57:46 faldara tracker-miner-fs[1030]: OK
Nov 21 16:57:46 faldara systemd[1]: Starting Network Service...
Nov 21 16:57:46 faldara systemd[1]: Stopped Network Time Synchronization.
Nov 21 16:57:46 faldara systemd[1]: Starting Network Time Synchronization...
Nov 21 16:57:46 faldara systemd[1]: Started Journal Service.
Nov 21 16:57:46 faldara systemd-networkd[410]: enp0s31f6: DHCP lease lost
Nov 21 16:57:46 faldara avahi-daemon[682]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address 2603:9001:300:68d7:3ad5:47ff:fe0f:488=
a.
Nov 21 16:57:46 faldara systemd[1]: wpa_supplicant.service: Succeeded.
Nov 21 16:57:46 faldara avahi-daemon[682]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.110.
Nov 21 16:57:46 faldara systemd[1012]: Stopped target Main User Target.
Nov 21 16:57:46 faldara avahi-daemon[682]: Leaving mDNS multicast group on =
interface lo.IPv6 with address ::1.
Nov 21 16:57:46 faldara tracker-miner-f[1030]: Error while sending AddMatch=
() message: The connection is closed
Nov 21 16:57:46 faldara avahi-daemon[682]: Leaving mDNS multicast group on =
interface lo.IPv4 with address 127.0.0.1.
Nov 21 16:57:46 faldara tracker-miner-f[1030]: Error while sending AddMatch=
() message: The connection is closed
Nov 21 16:57:46 faldara sudo[1260]: pam_unix(sudo:session): session closed =
for user root
Nov 21 16:57:46 faldara tracker-miner-f[1030]: Error while sending AddMatch=
() message: The connection is closed
Nov 21 16:57:46 faldara smartd[692]: smartd received signal 15: Terminated
Nov 21 16:57:46 faldara systemd[1]: run-user-1000-gvfs.mount: Succeeded.
Nov 21 16:57:46 faldara smartd[692]: Device: /dev/sda [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.s=
tate
Nov 21 16:57:46 faldara systemd[1]: smartmontools.service: Succeeded.
Nov 21 16:57:46 faldara smartd[692]: Device: /dev/sdb [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.s=
tate
Nov 21 16:57:46 faldara systemd[1]: unattended-upgrades.service: Succeeded.
Nov 21 16:57:46 faldara smartd[692]: Device: /dev/sdc [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.s=
tate
Nov 21 16:57:46 faldara systemd[1]: rtkit-daemon.service: Succeeded.
Nov 21 16:57:46 faldara smartd[692]: Device: /dev/nvme0, state written to /=
var/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Nov 21 16:57:46 faldara systemd[1]: upower.service: Succeeded.
Nov 21 16:57:46 faldara smartd[692]: smartd is exiting (exit status 0)
Nov 21 16:57:46 faldara systemd[1]: cups.service: Succeeded.
Nov 21 16:57:46 faldara ModemManager[773]: <info>  caught signal, shutting =
down...
Nov 21 16:57:46 faldara unknown[771]: Error terminating login1 session: The=
 connection is closed
Nov 21 16:57:46 faldara ModemManager[773]: <info>  ModemManager is shut down
Nov 21 16:57:46 faldara systemd-networkd[410]: enp0s31f6: DHCPv6 lease lost
Nov 21 16:57:46 faldara avahi-daemon[682]: avahi-daemon 0.8 exiting.
Nov 21 16:57:46 faldara systemd[1]: Starting CUPS Scheduler...
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.ColorManager' unit=3D'colord.service' requ=
ested by ':1.0' (uid=3D0 pid=3D1486 comm=3D"/usr/sbin/cupsd -l ")
Nov 21 16:57:46 faldara systemd[1]: systemd-journald.service: Succeeded.
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Successfully activated =
service 'org.freedesktop.ColorManager'
Nov 21 16:57:46 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Nov 21 16:57:46 faldara systemd-journald[1492]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 992.0M, max 4.0G, 3.0G free.
Nov 21 16:57:46 faldara systemd[1]: Finished Flush Journal to Persistent St=
orage.
Nov 21 16:57:46 faldara systemd-networkd[1512]: enp0s31f6: Gained IPv6LL
Nov 21 16:57:46 faldara systemd-networkd[1512]: Enumeration completed
Nov 21 16:57:46 faldara systemd[1]: Started Network Service.
Nov 21 16:57:46 faldara systemd[1]: Starting Network Name Resolution...
Nov 21 16:57:46 faldara systemd[1]: Started Network Time Synchronization.
Nov 21 16:57:46 faldara systemd-resolved[1517]: Positive Trust Anchors:
Nov 21 16:57:46 faldara systemd-resolved[1517]: . IN DS 20326 8 2 e06d44b80=
b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Nov 21 16:57:46 faldara systemd-resolved[1517]: Negative trust anchors: 10.=
in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19=
.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.ar=
pa 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-ad=
dr.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.=
in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp hom=
e internal intranet lan local private test
Nov 21 16:57:46 faldara systemd[1]: Started CUPS Scheduler.
Nov 21 16:57:46 faldara systemd-resolved[1517]: Using system hostname 'fald=
ara'.
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Scheduled restart job,=
 restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: cups-browsed.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Started Network Name Resolution.
Nov 21 16:57:46 faldara systemd[1]: Stopped Light Display Manager.
Nov 21 16:57:46 faldara systemd-networkd[1512]: enp0s31f6: DHCPv4 address 1=
92.168.1.110/24 via 192.168.1.1
Nov 21 16:57:46 faldara systemd[1]: Starting Light Display Manager...
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.hostname1' unit=3D'dbus-org.freedesktop.ho=
stname1.service' requested by ':1.3' (uid=3D102 pid=3D1512 comm=3D"/lib/sys=
temd/systemd-networkd ")
Nov 21 16:57:46 faldara systemd[1]: Starting Hostname Service...
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.login1' unit=3D'dbus-org.freedesktop.login=
1.service' requested by ':1.9' (uid=3D0 pid=3D1526 comm=3D"/usr/sbin/lightd=
m ")
Nov 21 16:57:46 faldara systemd[1]: Starting Load Kernel Module drm...
Nov 21 16:57:46 faldara systemd[1]: modprobe@drm.service: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Finished Load Kernel Module drm.
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.Avahi' unit=3D'dbus-org.freedesktop.Avahi.=
service' requested by ':1.10' (uid=3D113 pid=3D1519 comm=3D"/usr/libexec/co=
lord-sane ")
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Activation via systemd =
failed for unit 'dbus-org.freedesktop.Avahi.service': Unit dbus-org.freedes=
ktop.Avahi.service not found.
Nov 21 16:57:46 faldara dbus-daemon[1495]: [system] Successfully activated =
service 'org.freedesktop.hostname1'
Nov 21 16:57:46 faldara systemd[1]: Started Hostname Service.
Nov 21 16:57:46 faldara kernel: sysrq: Kill All Tasks
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Main process exited, c=
ode=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Failed with result 'si=
gnal'.
Nov 21 16:57:46 faldara systemd[1]: Failed to start Light Display Manager.
Nov 21 16:57:46 faldara systemd[1]: systemd-hostnamed.service: Main process=
 exited, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-hostnamed.service: Failed with =
result 'signal'.
Nov 21 16:57:46 faldara systemd[1]: cups.service: Failed with result 'signa=
l'.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 2.
Nov 21 16:57:46 faldara systemd[1]: systemd-journald.service: Scheduled res=
tart job, restart counter is at 2.
Nov 21 16:57:46 faldara systemd[1]: Stopping Flush Journal to Persistent St=
orage...
Nov 21 16:57:46 faldara systemd[1]: Stopped Rule-based Manager for Device E=
vents and Files.
Nov 21 16:57:46 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Nov 21 16:57:46 faldara systemd[1]: user@1000.service: Main process exited,=
 code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: user@1000.service: Failed with result '=
signal'.
Nov 21 16:57:46 faldara systemd[1]: dbus.service: Main process exited, code=
=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: dbus.service: Failed with result 'signa=
l'.
Nov 21 16:57:46 faldara systemd[1]: colord.service: Main process exited, co=
de=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: colord.service: Failed with result 'sig=
nal'.
Nov 21 16:57:46 faldara systemd[1]: systemd-networkd.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-networkd.service: Failed with r=
esult 'signal'.
Nov 21 16:57:46 faldara systemd[1]: systemd-timesyncd.service: Main process=
 exited, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-timesyncd.service: Failed with =
result 'signal'.
Nov 21 16:57:46 faldara systemd[1]: systemd-journal-flush.service: Succeede=
d.
Nov 21 16:57:46 faldara systemd[1]: Stopped Flush Journal to Persistent Sto=
rage.
Nov 21 16:57:46 faldara systemd[1]: systemd-networkd.service: Scheduled res=
tart job, restart counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: systemd-timesyncd.service: Scheduled re=
start job, restart counter is at 2.
Nov 21 16:57:46 faldara systemd[1]: Started D-Bus System Message Bus.
Nov 21 16:57:46 faldara systemd[1]: Stopped Journal Service.
Nov 21 16:57:46 faldara systemd[1]: Starting Journal Service...
Nov 21 16:57:46 faldara systemd[1]: Stopped Network Service.
Nov 21 16:57:46 faldara systemd[1]: Stopped Network Time Synchronization.
Nov 21 16:57:46 faldara systemd[1]: Starting Network Time Synchronization...
Nov 21 16:57:46 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Nov 21 16:57:46 faldara systemd[1]: Starting Network Service...
Nov 21 16:57:46 faldara systemd-journald[1545]: Journal started
Nov 21 16:57:46 faldara systemd-journald[1545]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 992.0M, max 4.0G, 3.0G free.
Nov 21 16:57:46 faldara systemd[1]: cups.service: Main process exited, code=
=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Main process exi=
ted, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Killing process =
1509 (systemd-udevd) with signal SIGKILL.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Killing process =
1509 (systemd-udevd) with signal SIGKILL.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Failed with resu=
lt 'signal'.
Nov 21 16:57:46 faldara systemd[1]: systemd-udevd.service: Unit process 150=
9 (systemd-udevd) remains running after unit stopped.
Nov 21 16:57:46 faldara systemd[1]: systemd-journald.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-journald.service: Failed with r=
esult 'signal'.
Nov 21 16:57:46 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Nov 21 16:57:46 faldara systemd[1]: Started Journal Service.
Nov 21 16:57:46 faldara systemd-journald[1545]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 992.0M, max 4.0G, 3.0G free.
Nov 21 16:57:46 faldara systemd[1]: systemd-resolved.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Nov 21 16:57:46 faldara systemd[1]: systemd-resolved.service: Failed with r=
esult 'signal'.
Nov 21 16:57:46 faldara systemd[1]: systemd-resolved.service: Scheduled res=
tart job, restart counter is at 2.
Nov 21 16:57:46 faldara systemd[1]: Finished Flush Journal to Persistent St=
orage.
Nov 21 16:57:46 faldara systemd[1]: Stopped Network Name Resolution.
Nov 21 16:57:46 faldara systemd[1]: Started Network Time Synchronization.
Nov 21 16:57:46 faldara systemd-networkd[1547]: enp0s31f6: Gained IPv6LL
Nov 21 16:57:46 faldara systemd-networkd[1547]: Enumeration completed
Nov 21 16:57:46 faldara systemd[1]: Started Network Service.
Nov 21 16:57:46 faldara systemd[1]: Starting Network Name Resolution...
Nov 21 16:57:46 faldara systemd[1]: cups.service: Scheduled restart job, re=
start counter is at 1.
Nov 21 16:57:46 faldara systemd[1]: lightdm.service: Scheduled restart job,=
 restart counter is at 2.
Nov 21 16:57:46 faldara systemd[1]: Stopped CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: cups.path: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Stopped CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: Stopping CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: Started CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: cups.socket: Succeeded.
Nov 21 16:57:46 faldara systemd[1]: Closed CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: Stopping CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: Listening on CUPS Scheduler.
Nov 21 16:57:46 faldara systemd[1]: Starting CUPS Scheduler...
Nov 21 16:57:46 faldara systemd[1]: Stopped Light Display Manager.
Nov 21 16:57:46 faldara systemd[1]: Starting Light Display Manager...
Nov 21 16:57:46 faldara dbus-daemon[1544]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.login1' unit=3D'dbus-org.freedesktop.login=
1.service' requested by ':1.3' (uid=3D0 pid=3D1555 comm=3D"/usr/sbin/lightd=
m ")
Nov 21 16:57:46 faldara systemd[1]: Starting Load Kernel Module drm...

--=-=-=--
