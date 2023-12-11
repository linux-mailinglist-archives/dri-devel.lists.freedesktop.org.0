Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D943080E62C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4C710E101;
	Tue, 12 Dec 2023 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9E210E52C;
 Mon, 11 Dec 2023 23:51:00 +0000 (UTC)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 8A48E14D23D; Mon, 11 Dec 2023 18:50:59 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
 <87edg3koka.fsf@vps.thesusis.net>
 <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
Date: Mon, 11 Dec 2023 18:50:59 -0500
Message-ID: <87y1e05me4.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Mailman-Approved-At: Tue, 12 Dec 2023 08:32:25 +0000
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
 Luben Tuikov <ltuikov89@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Deucher <alexdeucher@gmail.com> writes:

> On Sun, Dec 3, 2023 at 3:40=E2=80=AFPM Phillip Susi <phill@thesusis.net> =
wrote:
>>
>> Alex Deucher <alexdeucher@gmail.com> writes:
>>
>> > Phillip,
>> >
>> > Can you test this patch?  I was not able to repro the issue on the
>> > navi2x card I had handy, but I think it should fix it.
>>
>> I pulled -rc4 and it still had the problem.  I applied this patch, and
>> yes, it fixed it!
>>
>
> Great!  I'll include it this week.
>
> Alex

Oh oh.  It was working.  I just tested this again:

9a079e65d14790c84cf931e9f50a3c945c15ddb8 drm/amdgpu: fix buffer funcs setti=
ng order on suspend
33cc938e65a98f1d29d0a18403dbbee050dcad9a (tag: v6.7-rc4) Linux 6.7-rc4

And it works, but 6.7-rc5 does not, even though it includes that patch.
Here's the syslog from the attempt.  I'll start bisecting again.


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline; filename=syslog.txt
Content-Transfer-Encoding: quoted-printable
Content-Description: syslog

-- Journal begins at Wed 2023-09-27 16:20:30 EDT, ends at Mon 2023-12-11 18=
:46:30 EST. --
Dec 11 18:43:54 faldara kernel: Linux version 6.7.0-rc5 (psusi@faldara) (gc=
c (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.=
2) #49 SMP PREEMPT_DYNAMIC Mon Dec 11 18:37:03 EST 2023
Dec 11 18:43:54 faldara kernel: Command line: BOOT_IMAGE=3D/boot/vmlinuz-6.=
7.0-rc5 root=3D/dev/mapper/faldara-bullseye
Dec 11 18:43:54 faldara kernel: BIOS-provided physical RAM map:
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x0000000000000000-0x000000=
0000057fff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x0000000000058000-0x000000=
0000058fff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x0000000000059000-0x000000=
000009efff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x000000000009f000-0x000000=
00000fffff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x0000000000100000-0x000000=
00b82a2fff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000b82a3000-0x000000=
00b82d7fff] ACPI data
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000b82d8000-0x000000=
00b8679fff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000b867a000-0x000000=
00b867afff] ACPI NVS
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000b867b000-0x000000=
00b867bfff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000b867c000-0x000000=
00c533dfff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c533e000-0x000000=
00c6a45fff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c6a46000-0x000000=
00c6a57fff] ACPI data
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c6a58000-0x000000=
00c6c12fff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c6c13000-0x000000=
00c723afff] ACPI NVS
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c723b000-0x000000=
00c7a8efff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c7a8f000-0x000000=
00c7afefff] type 20
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c7aff000-0x000000=
00c7afffff] usable
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000c7b00000-0x000000=
00c7ffffff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000f8000000-0x000000=
00fbffffff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000fe000000-0x000000=
00fe010fff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000fec00000-0x000000=
00fec00fff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000fee00000-0x000000=
00fee00fff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x00000000ff000000-0x000000=
00ffffffff] reserved
Dec 11 18:43:54 faldara kernel: BIOS-e820: [mem 0x0000000100000000-0x000000=
0436ffffff] usable
Dec 11 18:43:54 faldara kernel: NX (Execute Disable) protection: active
Dec 11 18:43:54 faldara kernel: APIC: Static calls initialized
Dec 11 18:43:54 faldara kernel: efi: EFI v2.5 by American Megatrends
Dec 11 18:43:54 faldara kernel: efi: ACPI 2.0=3D0xb82a3000 ACPI=3D0xb82a300=
0 SMBIOS=3D0xc7a01000 SMBIOS 3.0=3D0xc7a00000 ESRT=3D0xc3a94158 MOKvar=3D0x=
c73f5000=20
Dec 11 18:43:54 faldara kernel: efi: Remove mem42: MMIO range=3D[0xf8000000=
-0xfbffffff] (64MB) from e820 map
Dec 11 18:43:54 faldara kernel: e820: remove [mem 0xf8000000-0xfbffffff] re=
served
Dec 11 18:43:54 faldara kernel: efi: Not removing mem43: MMIO range=3D[0xfe=
000000-0xfe010fff] (68KB) from e820 map
Dec 11 18:43:54 faldara kernel: efi: Not removing mem44: MMIO range=3D[0xfe=
c00000-0xfec00fff] (4KB) from e820 map
Dec 11 18:43:54 faldara kernel: efi: Not removing mem45: MMIO range=3D[0xfe=
e00000-0xfee00fff] (4KB) from e820 map
Dec 11 18:43:54 faldara kernel: efi: Remove mem46: MMIO range=3D[0xff000000=
-0xffffffff] (16MB) from e820 map
Dec 11 18:43:54 faldara kernel: e820: remove [mem 0xff000000-0xffffffff] re=
served
Dec 11 18:43:54 faldara kernel: SMBIOS 3.0.0 present.
Dec 11 18:43:54 faldara kernel: DMI: System manufacturer System Product Nam=
e/Z170 PRO GAMING, BIOS 3805 05/16/2018
Dec 11 18:43:54 faldara kernel: tsc: Detected 3500.000 MHz processor
Dec 11 18:43:54 faldara kernel: tsc: Detected 3499.912 MHz TSC
Dec 11 18:43:54 faldara kernel: e820: update [mem 0x00000000-0x00000fff] us=
able =3D=3D> reserved
Dec 11 18:43:54 faldara kernel: e820: remove [mem 0x000a0000-0x000fffff] us=
able
Dec 11 18:43:54 faldara kernel: last_pfn =3D 0x437000 max_arch_pfn =3D 0x40=
0000000
Dec 11 18:43:54 faldara kernel: MTRR map: 4 entries (3 fixed + 1 variable; =
max 23), built from 10 variable MTRRs
Dec 11 18:43:54 faldara kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- U=
C  WB  WP  UC- WT=20=20
Dec 11 18:43:54 faldara kernel: last_pfn =3D 0xc7b00 max_arch_pfn =3D 0x400=
000000
Dec 11 18:43:54 faldara kernel: found SMP MP-table at [mem 0x000fcce0-0x000=
fccef]
Dec 11 18:43:54 faldara kernel: esrt: Reserving ESRT space from 0x00000000c=
3a94158 to 0x00000000c3a94190.
Dec 11 18:43:54 faldara kernel: e820: update [mem 0xc3a94000-0xc3a94fff] us=
able =3D=3D> reserved
Dec 11 18:43:54 faldara kernel: Using GB pages for direct mapping
Dec 11 18:43:54 faldara kernel: Secure boot disabled
Dec 11 18:43:54 faldara kernel: RAMDISK: [mem 0x0e78b000-0x233bcfff]
Dec 11 18:43:54 faldara kernel: ACPI: Early table checksum verification dis=
abled
Dec 11 18:43:54 faldara kernel: ACPI: RSDP 0x00000000B82A3000 000024 (v02 A=
LASKA)
Dec 11 18:43:54 faldara kernel: ACPI: XSDT 0x00000000B82A30A8 0000C4 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: FACP 0x00000000B82CC480 000114 (v06 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: DSDT 0x00000000B82A3200 02927E (v02 A=
LASKA A M I    01072009 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: FACS 0x00000000C723AC40 000040
Dec 11 18:43:54 faldara kernel: ACPI: APIC 0x00000000B82CC598 000084 (v03 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: FPDT 0x00000000B82CC620 000044 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: BGRT 0x00000000B82D7D78 000038 (v01 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: MCFG 0x00000000B82CC6C0 00003C (v01 A=
LASKA A M I    01072009 MSFT 00000097)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82CC700 000390 (v01 S=
ataRe SataTabl 00001000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: FIDT 0x00000000B82CCA90 00009C (v01 A=
LASKA A M I    01072009 AMI  00010013)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82CCB30 003041 (v02 S=
aSsdt SaSsdt   00003000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82CFB78 002544 (v02 P=
egSsd PegSsdt  00001000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: HPET 0x00000000B82D20C0 000038 (v01 I=
NTEL  SKL      00000001 MSFT 0000005F)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82D20F8 000E3B (v02 I=
NTEL  Ther_Rvp 00001000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82D2F38 000B19 (v02 I=
NTEL  xh_rvp08 00000000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: UEFI 0x00000000B82D3A58 000042 (v01 I=
NTEL  EDK2     00000002      01000013)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82D3AA0 000EDE (v02 C=
puRef CpuSsdt  00003000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: LPIT 0x00000000B82D4980 000094 (v01 I=
NTEL  SKL      00000000 MSFT 0000005F)
Dec 11 18:43:54 faldara kernel: ACPI: WSMT 0x00000000B82D4A18 000028 (v01 I=
NTEL  SKL      00000000 MSFT 0000005F)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82D4A40 00029F (v02 I=
NTEL  sensrhub 00000000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0x00000000B82D4CE0 003002 (v02 I=
NTEL  PtidDevc 00001000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: DBGP 0x00000000B82D7CE8 000034 (v01 I=
NTEL           00000002 MSFT 0000005F)
Dec 11 18:43:54 faldara kernel: ACPI: DBG2 0x00000000B82D7D20 000054 (v00 I=
NTEL           00000002 MSFT 0000005F)
Dec 11 18:43:54 faldara kernel: ACPI: Reserving FACP table memory at [mem 0=
xb82cc480-0xb82cc593]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving DSDT table memory at [mem 0=
xb82a3200-0xb82cc47d]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving FACS table memory at [mem 0=
xc723ac40-0xc723ac7f]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving APIC table memory at [mem 0=
xb82cc598-0xb82cc61b]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving FPDT table memory at [mem 0=
xb82cc620-0xb82cc663]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving BGRT table memory at [mem 0=
xb82d7d78-0xb82d7daf]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving MCFG table memory at [mem 0=
xb82cc6c0-0xb82cc6fb]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82cc700-0xb82cca8f]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving FIDT table memory at [mem 0=
xb82cca90-0xb82ccb2b]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82ccb30-0xb82cfb70]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82cfb78-0xb82d20bb]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving HPET table memory at [mem 0=
xb82d20c0-0xb82d20f7]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d20f8-0xb82d2f32]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d2f38-0xb82d3a50]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving UEFI table memory at [mem 0=
xb82d3a58-0xb82d3a99]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d3aa0-0xb82d497d]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving LPIT table memory at [mem 0=
xb82d4980-0xb82d4a13]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving WSMT table memory at [mem 0=
xb82d4a18-0xb82d4a3f]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d4a40-0xb82d4cde]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving SSDT table memory at [mem 0=
xb82d4ce0-0xb82d7ce1]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving DBGP table memory at [mem 0=
xb82d7ce8-0xb82d7d1b]
Dec 11 18:43:54 faldara kernel: ACPI: Reserving DBG2 table memory at [mem 0=
xb82d7d20-0xb82d7d73]
Dec 11 18:43:54 faldara kernel: No NUMA configuration found
Dec 11 18:43:54 faldara kernel: Faking a node at [mem 0x0000000000000000-0x=
0000000436ffffff]
Dec 11 18:43:54 faldara kernel: NODE_DATA(0) allocated [mem 0x436fd5000-0x4=
36ffffff]
Dec 11 18:43:54 faldara kernel: Zone ranges:
Dec 11 18:43:54 faldara kernel:   DMA      [mem 0x0000000000001000-0x000000=
0000ffffff]
Dec 11 18:43:54 faldara kernel:   DMA32    [mem 0x0000000001000000-0x000000=
00ffffffff]
Dec 11 18:43:54 faldara kernel:   Normal   [mem 0x0000000100000000-0x000000=
0436ffffff]
Dec 11 18:43:54 faldara kernel:   Device   empty
Dec 11 18:43:54 faldara kernel: Movable zone start for each node
Dec 11 18:43:54 faldara kernel: Early memory node ranges
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x0000000000001000-0x00000=
00000057fff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x0000000000059000-0x00000=
0000009efff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x0000000000100000-0x00000=
000b82a2fff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x00000000b82d8000-0x00000=
000b8679fff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x00000000b867c000-0x00000=
000c533dfff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x00000000c6a58000-0x00000=
000c6c12fff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x00000000c7aff000-0x00000=
000c7afffff]
Dec 11 18:43:54 faldara kernel:   node   0: [mem 0x0000000100000000-0x00000=
00436ffffff]
Dec 11 18:43:54 faldara kernel: Initmem setup node 0 [mem 0x000000000000100=
0-0x0000000436ffffff]
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA: 1 pages in unavailable=
 ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA: 1 pages in unavailable=
 ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA: 97 pages in unavailabl=
e ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA32: 53 pages in unavaila=
ble ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA32: 2 pages in unavailab=
le ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA32: 5914 pages in unavai=
lable ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone DMA32: 3820 pages in unavai=
lable ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone Normal: 1280 pages in unava=
ilable ranges
Dec 11 18:43:54 faldara kernel: On node 0, zone Normal: 4096 pages in unava=
ilable ranges
Dec 11 18:43:54 faldara kernel: ACPI: PM-Timer IO Port: 0x1808
Dec 11 18:43:54 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge li=
nt[0x1])
Dec 11 18:43:54 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge li=
nt[0x1])
Dec 11 18:43:54 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge li=
nt[0x1])
Dec 11 18:43:54 faldara kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge li=
nt[0x1])
Dec 11 18:43:54 faldara kernel: IOAPIC[0]: apic_id 2, version 32, address 0=
xfec00000, GSI 0-119
Dec 11 18:43:54 faldara kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_i=
rq 2 dfl dfl)
Dec 11 18:43:54 faldara kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_i=
rq 9 high level)
Dec 11 18:43:54 faldara kernel: ACPI: Using ACPI (MADT) for SMP configurati=
on information
Dec 11 18:43:54 faldara kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
Dec 11 18:43:54 faldara kernel: e820: update [mem 0xc1c04000-0xc1c49fff] us=
able =3D=3D> reserved
Dec 11 18:43:54 faldara kernel: TSC deadline timer available
Dec 11 18:43:54 faldara kernel: smpboot: Allowing 4 CPUs, 0 hotplug CPUs
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x00000000-0x00000fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x00058000-0x00058fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0x0009f000-0x000fffff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb82a3000-0xb82d7fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb867a000-0xb867afff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xb867b000-0xb867bfff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc1c04000-0xc1c49fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc3a94000-0xc3a94fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc533e000-0xc6a45fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc6a46000-0xc6a57fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc6c13000-0xc723afff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc723b000-0xc7a8efff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc7a8f000-0xc7afefff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc7b00000-0xc7ffffff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xc8000000-0xfdffffff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfe000000-0xfe010fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfe011000-0xfebfffff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfec00000-0xfec00fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfec01000-0xfedfffff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfee00000-0xfee00fff]
Dec 11 18:43:54 faldara kernel: PM: hibernation: Registered nosave memory: =
[mem 0xfee01000-0xffffffff]
Dec 11 18:43:54 faldara kernel: [mem 0xc8000000-0xfdffffff] available for P=
CI devices
Dec 11 18:43:54 faldara kernel: Booting paravirtualized kernel on bare hard=
ware
Dec 11 18:43:54 faldara kernel: clocksource: refined-jiffies: mask: 0xfffff=
fff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Dec 11 18:43:54 faldara kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:=
4 nr_cpu_ids:4 nr_node_ids:1
Dec 11 18:43:54 faldara kernel: percpu: Embedded 63 pages/cpu s221184 r8192=
 d28672 u524288
Dec 11 18:43:54 faldara kernel: pcpu-alloc: s221184 r8192 d28672 u524288 al=
loc=3D1*2097152
Dec 11 18:43:54 faldara kernel: pcpu-alloc: [0] 0 1 2 3=20
Dec 11 18:43:54 faldara kernel: Kernel command line: BOOT_IMAGE=3D/boot/vml=
inuz-6.7.0-rc5 root=3D/dev/mapper/faldara-bullseye
Dec 11 18:43:54 faldara kernel: Unknown kernel command line parameters "BOO=
T_IMAGE=3D/boot/vmlinuz-6.7.0-rc5", will be passed to user space.
Dec 11 18:43:54 faldara kernel: random: crng init done
Dec 11 18:43:54 faldara kernel: Dentry cache hash table entries: 2097152 (o=
rder: 12, 16777216 bytes, linear)
Dec 11 18:43:54 faldara kernel: Inode-cache hash table entries: 1048576 (or=
der: 11, 8388608 bytes, linear)
Dec 11 18:43:54 faldara kernel: Fallback order for Node 0: 0=20
Dec 11 18:43:54 faldara kernel: Built 1 zonelists, mobility grouping on.  T=
otal pages: 4113583
Dec 11 18:43:54 faldara kernel: Policy zone: Normal
Dec 11 18:43:54 faldara kernel: mem auto-init: stack:off, heap alloc:on, he=
ap free:off
Dec 11 18:43:54 faldara kernel: software IO TLB: area num 4.
Dec 11 18:43:54 faldara kernel: Memory: 2745476K/16716160K available (14336=
K kernel code, 2315K rwdata, 7444K rodata, 2768K init, 4900K bss, 943176K r=
eserved, 0K cma-reserved)
Dec 11 18:43:54 faldara kernel: SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D4, Nodes=3D1
Dec 11 18:43:54 faldara kernel: ftrace: allocating 42269 entries in 166 pag=
es
Dec 11 18:43:54 faldara kernel: ftrace: allocated 166 pages with 4 groups
Dec 11 18:43:54 faldara kernel: Dynamic Preempt: voluntary
Dec 11 18:43:54 faldara kernel: rcu: Preemptible hierarchical RCU implement=
ation.
Dec 11 18:43:54 faldara kernel: rcu:         RCU restricting CPUs from NR_C=
PUS=3D8192 to nr_cpu_ids=3D4.
Dec 11 18:43:54 faldara kernel:         Trampoline variant of Tasks RCU ena=
bled.
Dec 11 18:43:54 faldara kernel:         Rude variant of Tasks RCU enabled.
Dec 11 18:43:54 faldara kernel:         Tracing variant of Tasks RCU enable=
d.
Dec 11 18:43:54 faldara kernel: rcu: RCU calculated value of scheduler-enli=
stment delay is 25 jiffies.
Dec 11 18:43:54 faldara kernel: rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D4
Dec 11 18:43:54 faldara kernel: NR_IRQS: 524544, nr_irqs: 1024, preallocate=
d irqs: 16
Dec 11 18:43:54 faldara kernel: rcu: srcu_init: Setting srcu_struct sizes b=
ased on contention.
Dec 11 18:43:54 faldara kernel: Console: colour dummy device 80x25
Dec 11 18:43:54 faldara kernel: printk: legacy console [tty0] enabled
Dec 11 18:43:54 faldara kernel: ACPI: Core revision 20230628
Dec 11 18:43:54 faldara kernel: clocksource: hpet: mask: 0xffffffff max_cyc=
les: 0xffffffff, max_idle_ns: 79635855245 ns
Dec 11 18:43:54 faldara kernel: APIC: Switch to symmetric I/O mode setup
Dec 11 18:43:54 faldara kernel: x2apic: IRQ remapping doesn't support X2API=
C mode
Dec 11 18:43:54 faldara kernel: ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 a=
pic2=3D-1 pin2=3D-1
Dec 11 18:43:54 faldara kernel: clocksource: tsc-early: mask: 0xfffffffffff=
fffff max_cycles: 0x3272fd97217, max_idle_ns: 440795241220 ns
Dec 11 18:43:54 faldara kernel: Calibrating delay loop (skipped), value cal=
culated using timer frequency.. 6999.82 BogoMIPS (lpj=3D13999648)
Dec 11 18:43:54 faldara kernel: CPU0: Thermal monitoring enabled (TM1)
Dec 11 18:43:54 faldara kernel: process: using mwait in idle threads
Dec 11 18:43:54 faldara kernel: Last level iTLB entries: 4KB 128, 2MB 8, 4M=
B 8
Dec 11 18:43:54 faldara kernel: Last level dTLB entries: 4KB 64, 2MB 0, 4MB=
 0, 1GB 4
Dec 11 18:43:54 faldara kernel: Spectre V1 : Mitigation: usercopy/swapgs ba=
rriers and __user pointer sanitization
Dec 11 18:43:54 faldara kernel: Spectre V2 : Kernel not compiled with retpo=
line; no mitigation available!
Dec 11 18:43:54 faldara kernel: Spectre V2 : Vulnerable
Dec 11 18:43:54 faldara kernel: Spectre V2 : Spectre v2 / SpectreRSB mitiga=
tion: Filling RSB on context switch
Dec 11 18:43:54 faldara kernel: Spectre V2 : Enabling Restricted Speculatio=
n for firmware calls
Dec 11 18:43:54 faldara kernel: RETBleed: WARNING: Spectre v2 mitigation le=
aves CPU vulnerable to RETBleed attacks, data leaks possible!
Dec 11 18:43:54 faldara kernel: RETBleed: Vulnerable
Dec 11 18:43:54 faldara kernel: Spectre V2 : mitigation: Enabling condition=
al Indirect Branch Prediction Barrier
Dec 11 18:43:54 faldara kernel: Speculative Store Bypass: Vulnerable
Dec 11 18:43:54 faldara kernel: MDS: Vulnerable: Clear CPU buffers attempte=
d, no microcode
Dec 11 18:43:54 faldara kernel: TAA: Vulnerable: Clear CPU buffers attempte=
d, no microcode
Dec 11 18:43:54 faldara kernel: MMIO Stale Data: Vulnerable: Clear CPU buff=
ers attempted, no microcode
Dec 11 18:43:54 faldara kernel: SRBDS: Vulnerable: No microcode
Dec 11 18:43:54 faldara kernel: GDS: Vulnerable: No microcode
Dec 11 18:43:54 faldara kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x=
87 floating point registers'
Dec 11 18:43:54 faldara kernel: x86/fpu: Supporting XSAVE feature 0x002: 'S=
SE registers'
Dec 11 18:43:54 faldara kernel: x86/fpu: Supporting XSAVE feature 0x004: 'A=
VX registers'
Dec 11 18:43:54 faldara kernel: x86/fpu: Supporting XSAVE feature 0x008: 'M=
PX bounds registers'
Dec 11 18:43:54 faldara kernel: x86/fpu: Supporting XSAVE feature 0x010: 'M=
PX CSR'
Dec 11 18:43:54 faldara kernel: x86/fpu: xstate_offset[2]:  576, xstate_siz=
es[2]:  256
Dec 11 18:43:54 faldara kernel: x86/fpu: xstate_offset[3]:  832, xstate_siz=
es[3]:   64
Dec 11 18:43:54 faldara kernel: x86/fpu: xstate_offset[4]:  896, xstate_siz=
es[4]:   64
Dec 11 18:43:54 faldara kernel: x86/fpu: Enabled xstate features 0x1f, cont=
ext size is 960 bytes, using 'compacted' format.
Dec 11 18:43:54 faldara kernel: Freeing SMP alternatives memory: 36K
Dec 11 18:43:54 faldara kernel: pid_max: default: 32768 minimum: 301
Dec 11 18:43:54 faldara kernel: LSM: initializing lsm=3Dlockdown,capability=
,landlock,yama,apparmor,tomoyo,bpf,integrity
Dec 11 18:43:54 faldara kernel: landlock: Up and running.
Dec 11 18:43:54 faldara kernel: Yama: becoming mindful.
Dec 11 18:43:54 faldara kernel: AppArmor: AppArmor initialized
Dec 11 18:43:54 faldara kernel: TOMOYO Linux initialized
Dec 11 18:43:54 faldara kernel: LSM support for eBPF active
Dec 11 18:43:54 faldara kernel: Mount-cache hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
Dec 11 18:43:54 faldara kernel: Mountpoint-cache hash table entries: 32768 =
(order: 6, 262144 bytes, linear)
Dec 11 18:43:54 faldara kernel: smpboot: CPU0: Intel(R) Core(TM) i5-6600K C=
PU @ 3.50GHz (family: 0x6, model: 0x5e, stepping: 0x3)
Dec 11 18:43:54 faldara kernel: RCU Tasks: Setting shift to 2 and lim to 1 =
rcu_task_cb_adjust=3D1.
Dec 11 18:43:54 faldara kernel: RCU Tasks Rude: Setting shift to 2 and lim =
to 1 rcu_task_cb_adjust=3D1.
Dec 11 18:43:54 faldara kernel: RCU Tasks Trace: Setting shift to 2 and lim=
 to 1 rcu_task_cb_adjust=3D1.
Dec 11 18:43:54 faldara kernel: Performance Events: PEBS fmt3+, Skylake eve=
nts, 32-deep LBR, full-width counters, Intel PMU driver.
Dec 11 18:43:54 faldara kernel: ... version:                4
Dec 11 18:43:54 faldara kernel: ... bit width:              48
Dec 11 18:43:54 faldara kernel: ... generic registers:      8
Dec 11 18:43:54 faldara kernel: ... value mask:             0000ffffffffffff
Dec 11 18:43:54 faldara kernel: ... max period:             00007fffffffffff
Dec 11 18:43:54 faldara kernel: ... fixed-purpose events:   3
Dec 11 18:43:54 faldara kernel: ... event mask:             00000007000000ff
Dec 11 18:43:54 faldara kernel: signal: max sigframe size: 2032
Dec 11 18:43:54 faldara kernel: Estimated ratio of average max frequency by=
 base frequency (times 1024): 1141
Dec 11 18:43:54 faldara kernel: rcu: Hierarchical SRCU implementation.
Dec 11 18:43:54 faldara kernel: rcu:         Max phase no-delay instances i=
s 1000.
Dec 11 18:43:54 faldara kernel: NMI watchdog: Enabled. Permanently consumes=
 one hw-PMU counter.
Dec 11 18:43:54 faldara kernel: smp: Bringing up secondary CPUs ...
Dec 11 18:43:54 faldara kernel: smpboot: x86: Booting SMP configuration:
Dec 11 18:43:54 faldara kernel: .... node  #0, CPUs:      #1 #2 #3
Dec 11 18:43:54 faldara kernel: smp: Brought up 1 node, 4 CPUs
Dec 11 18:43:54 faldara kernel: smpboot: Max logical packages: 1
Dec 11 18:43:54 faldara kernel: smpboot: Total of 4 processors activated (2=
7999.29 BogoMIPS)
Dec 11 18:43:54 faldara kernel: node 0 deferred pages initialised in 20ms
Dec 11 18:43:54 faldara kernel: devtmpfs: initialized
Dec 11 18:43:54 faldara kernel: x86/mm: Memory block size: 128MB
Dec 11 18:43:54 faldara kernel: ACPI: PM: Registering ACPI NVS region [mem =
0xb867a000-0xb867afff] (4096 bytes)
Dec 11 18:43:54 faldara kernel: ACPI: PM: Registering ACPI NVS region [mem =
0xc6c13000-0xc723afff] (6455296 bytes)
Dec 11 18:43:54 faldara kernel: clocksource: jiffies: mask: 0xffffffff max_=
cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Dec 11 18:43:54 faldara kernel: futex hash table entries: 1024 (order: 4, 6=
5536 bytes, linear)
Dec 11 18:43:54 faldara kernel: pinctrl core: initialized pinctrl subsystem
Dec 11 18:43:54 faldara kernel: NET: Registered PF_NETLINK/PF_ROUTE protoco=
l family
Dec 11 18:43:54 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL pool =
for atomic allocations
Dec 11 18:43:54 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL|GFP_D=
MA pool for atomic allocations
Dec 11 18:43:54 faldara kernel: DMA: preallocated 2048 KiB GFP_KERNEL|GFP_D=
MA32 pool for atomic allocations
Dec 11 18:43:54 faldara kernel: audit: initializing netlink subsys (disable=
d)
Dec 11 18:43:54 faldara kernel: audit: type=3D2000 audit(1702338223.060:1):=
 state=3Dinitialized audit_enabled=3D0 res=3D1
Dec 11 18:43:54 faldara kernel: thermal_sys: Registered thermal governor 'f=
air_share'
Dec 11 18:43:54 faldara kernel: thermal_sys: Registered thermal governor 'b=
ang_bang'
Dec 11 18:43:54 faldara kernel: thermal_sys: Registered thermal governor 's=
tep_wise'
Dec 11 18:43:54 faldara kernel: thermal_sys: Registered thermal governor 'u=
ser_space'
Dec 11 18:43:54 faldara kernel: thermal_sys: Registered thermal governor 'p=
ower_allocator'
Dec 11 18:43:54 faldara kernel: cpuidle: using governor ladder
Dec 11 18:43:54 faldara kernel: cpuidle: using governor menu
Dec 11 18:43:54 faldara kernel: ACPI FADT declares the system doesn't suppo=
rt PCIe ASPM, so disable it
Dec 11 18:43:54 faldara kernel: acpiphp: ACPI Hot Plug PCI Controller Drive=
r version: 0.5
Dec 11 18:43:54 faldara kernel: PCI: MMCONFIG for domain 0000 [bus 00-3f] a=
t [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
Dec 11 18:43:54 faldara kernel: PCI: not using MMCONFIG
Dec 11 18:43:54 faldara kernel: PCI: Using configuration type 1 for base ac=
cess
Dec 11 18:43:54 faldara kernel: kprobes: kprobe jump-optimization is enable=
d. All kprobes are optimized if possible.
Dec 11 18:43:54 faldara kernel: HugeTLB: registered 1.00 GiB page size, pre=
-allocated 0 pages
Dec 11 18:43:54 faldara kernel: HugeTLB: 16380 KiB vmemmap can be freed for=
 a 1.00 GiB page
Dec 11 18:43:54 faldara kernel: HugeTLB: registered 2.00 MiB page size, pre=
-allocated 0 pages
Dec 11 18:43:54 faldara kernel: HugeTLB: 28 KiB vmemmap can be freed for a =
2.00 MiB page
Dec 11 18:43:54 faldara kernel: ACPI: Added _OSI(Module Device)
Dec 11 18:43:54 faldara kernel: ACPI: Added _OSI(Processor Device)
Dec 11 18:43:54 faldara kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Dec 11 18:43:54 faldara kernel: ACPI: Added _OSI(Processor Aggregator Devic=
e)
Dec 11 18:43:54 faldara kernel: ACPI: 9 ACPI AML tables successfully acquir=
ed and loaded
Dec 11 18:43:54 faldara kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) quer=
y ignored
Dec 11 18:43:54 faldara kernel: ACPI: Dynamic OEM Table Load:
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0xFFFF8CA240EFF800 000738 (v02 P=
mRef  Cpu0Ist  00003000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: Dynamic OEM Table Load:
Dec 11 18:43:54 faldara kernel: ACPI: SSDT 0xFFFF8CA240EF9000 00065C (v02 P=
mRef  ApIst    00003000 INTL 20160422)
Dec 11 18:43:54 faldara kernel: ACPI: _OSC evaluated successfully for all C=
PUs
Dec 11 18:43:54 faldara kernel: ACPI: EC: EC started
Dec 11 18:43:54 faldara kernel: ACPI: EC: interrupt blocked
Dec 11 18:43:54 faldara kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x=
62
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC us=
ed to handle transactions
Dec 11 18:43:54 faldara kernel: ACPI: Interpreter enabled
Dec 11 18:43:54 faldara kernel: ACPI: PM: (supports S0 S3 S4 S5)
Dec 11 18:43:54 faldara kernel: ACPI: Using IOAPIC for interrupt routing
Dec 11 18:43:54 faldara kernel: PCI: MMCONFIG for domain 0000 [bus 00-3f] a=
t [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
Dec 11 18:43:54 faldara kernel: PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff=
] reserved as ACPI motherboard resource
Dec 11 18:43:54 faldara kernel: PCI: Using host bridge windows from ACPI; i=
f necessary, use "pci=3Dnocrs" and report a bug
Dec 11 18:43:54 faldara kernel: PCI: Using E820 reservations for host bridg=
e windows
Dec 11 18:43:54 faldara kernel: ACPI: Enabled 7 GPEs in block 00 to 7F
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.PEG0.PG00: New power resou=
rce
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.PEG1.PG01: New power resou=
rce
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.PEG2.PG02: New power resou=
rce
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP09.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP10.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP11.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP12.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP13.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP01.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP02.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP03.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP04.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP05.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP06.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP07.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP08.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP17.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP18.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP19.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP20.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP14.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP15.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.RP16.PXSX.WRST: New power =
resource
Dec 11 18:43:54 faldara kernel: ACPI: \_TZ_.FN00: New power resource
Dec 11 18:43:54 faldara kernel: ACPI: \_TZ_.FN01: New power resource
Dec 11 18:43:54 faldara kernel: ACPI: \_TZ_.FN02: New power resource
Dec 11 18:43:54 faldara kernel: ACPI: \_TZ_.FN03: New power resource
Dec 11 18:43:54 faldara kernel: ACPI: \_TZ_.FN04: New power resource
Dec 11 18:43:54 faldara kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [=
bus 00-3e])
Dec 11 18:43:54 faldara kernel: acpi PNP0A08:00: _OSC: OS supports [Extende=
dConfig ASPM ClockPM Segments MSI HPX-Type3]
Dec 11 18:43:54 faldara kernel: acpi PNP0A08:00: _OSC: OS requested [PCIeHo=
tplug SHPCHotplug PME AER PCIeCapability LTR]
Dec 11 18:43:54 faldara kernel: acpi PNP0A08:00: _OSC: platform willing to =
grant [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
Dec 11 18:43:54 faldara kernel: acpi PNP0A08:00: _OSC: platform retains con=
trol of PCIe features (AE_ERROR)
Dec 11 18:43:54 faldara kernel: PCI host bridge to bus 0000:00
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [io  0x0=
000-0x0cf7 window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [io  0x0=
d00-0xffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [mem 0x0=
00a0000-0x000bffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [mem 0xc=
8000000-0xf7ffffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [mem 0xf=
d000000-0xfe7fffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: root bus resource [bus 00-=
3e]
Dec 11 18:43:54 faldara kernel: pci 0000:00:00.0: [8086:191f] type 00 class=
 0x060000
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0: [8086:1901] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:14.0: [8086:a12f] type 00 class=
 0x0c0330
Dec 11 18:43:54 faldara kernel: pci 0000:00:14.0: reg 0x10: [mem 0xf7f30000=
-0xf7f3ffff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:00:14.0: PME# supported from D3hot=
 D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:16.0: [8086:a13a] type 00 class=
 0x078000
Dec 11 18:43:54 faldara kernel: pci 0000:00:16.0: reg 0x10: [mem 0xf7f4d000=
-0xf7f4dfff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:00:16.0: PME# supported from D3hot
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: [8086:a102] type 00 class=
 0x010601
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x10: [mem 0xf7f48000=
-0xf7f49fff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x14: [mem 0xf7f4c000=
-0xf7f4c0ff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x18: [io  0xf050-0xf=
057]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x1c: [io  0xf040-0xf=
043]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x20: [io  0xf020-0xf=
03f]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: reg 0x24: [mem 0xf7f4b000=
-0xf7f4b7ff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:17.0: PME# supported from D3hot
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.0: [8086:a167] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2: [8086:a169] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0: [8086:a110] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0: [8086:a118] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.0: [8086:a145] type 00 class=
 0x060100
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.2: [8086:a121] type 00 class=
 0x058000
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.2: reg 0x10: [mem 0xf7f44000=
-0xf7f47fff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.3: [8086:a170] type 00 class=
 0x040300
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.3: reg 0x10: [mem 0xf7f40000=
-0xf7f43fff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.3: reg 0x20: [mem 0xf7f20000=
-0xf7f2ffff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.3: PME# supported from D3hot=
 D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.4: [8086:a123] type 00 class=
 0x0c0500
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.4: reg 0x10: [mem 0xf7f4a000=
-0xf7f4a0ff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.4: reg 0x20: [io  0xf000-0xf=
01f]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.6: [8086:15b8] type 00 class=
 0x020000
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.6: reg 0x10: [mem 0xf7f00000=
-0xf7f1ffff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.6: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: [1002:1478] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: reg 0x10: [mem 0xf7b00000=
-0xf7b03fff]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: 63.008 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 1=
26.024 Gb/s with 16.0 GT/s PCIe x8 link)
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0: PCI bridge to [bus 01-03]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xf7=
900000-0xf7bfffff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0: [1002:1479] type 01 class=
 0x060400
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0: PME# supported from D0 D3=
hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: PCI bridge to [bus 02-03]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: [1002:73ff] type 00 class=
 0x030000
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: reg 0x10: [mem 0xe0000000=
-0xefffffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: reg 0x18: [mem 0xf0000000=
-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: reg 0x20: [io  0xe000-0xe=
0ff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: reg 0x24: [mem 0xf7900000=
-0xf79fffff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: reg 0x30: [mem 0xf7a00000=
-0xf7a1ffff pref]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: BAR 0: assigned to efifb
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: Video device with shadowe=
d ROM at [mem 0x000c0000-0x000dffff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: PME# supported from D1 D2=
 D3hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: 63.008 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 2=
52.048 Gb/s with 16.0 GT/s PCIe x16 link)
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.1: [1002:ab28] type 00 class=
 0x040300
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.1: reg 0x10: [mem 0xf7a20000=
-0xf7a23fff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.1: PME# supported from D1 D2=
 D3hot D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: acpiphp: Slot [1] registered
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.0: PCI bridge to [bus 04]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.0: [197b:2363] type 00 class=
 0x010601
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.0: reg 0x24: [mem 0xf7e10000=
-0xf7e11fff]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.0: reg 0x30: [mem 0xf7e00000=
-0xf7e0ffff pref]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.0: PME# supported from D3hot
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: [197b:2363] type 00 class=
 0x010185
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: reg 0x10: [io  0xd040-0xd=
047]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: reg 0x14: [io  0xd030-0xd=
033]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: reg 0x18: [io  0xd020-0xd=
027]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: reg 0x1c: [io  0xd010-0xd=
013]
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: reg 0x20: [io  0xd000-0xd=
00f]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2: PCI bridge to [bus 05]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2:   bridge window [io  0xd0=
00-0xdfff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2:   bridge window [mem 0xf7=
e00000-0xf7efffff]
Dec 11 18:43:54 faldara kernel: pci 0000:06:00.0: [1b21:1242] type 00 class=
 0x0c0330
Dec 11 18:43:54 faldara kernel: pci 0000:06:00.0: reg 0x10: [mem 0xf7d00000=
-0xf7d07fff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:06:00.0: enabling Extended Tags
Dec 11 18:43:54 faldara kernel: pci 0000:06:00.0: PME# supported from D3hot=
 D3cold
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0: PCI bridge to [bus 06]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0:   bridge window [mem 0xf7=
d00000-0xf7dfffff]
Dec 11 18:43:54 faldara kernel: pci 0000:07:00.0: [15b7:5011] type 00 class=
 0x010802
Dec 11 18:43:54 faldara kernel: pci 0000:07:00.0: reg 0x10: [mem 0xf7c00000=
-0xf7c03fff 64bit]
Dec 11 18:43:54 faldara kernel: pci 0000:07:00.0: 31.504 Gb/s available PCI=
e bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:1d.0 (capable of 6=
3.012 Gb/s with 16.0 GT/s PCIe x4 link)
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0: PCI bridge to [bus 07]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0:   bridge window [mem 0xf7=
c00000-0xf7cfffff]
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKA configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKB configured f=
or IRQ 10
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKC configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKD configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKE configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKF configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKG configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: PCI: Interrupt link LNKH configured f=
or IRQ 11
Dec 11 18:43:54 faldara kernel: ACPI: EC: interrupt unblocked
Dec 11 18:43:54 faldara kernel: ACPI: EC: event unblocked
Dec 11 18:43:54 faldara kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x=
62
Dec 11 18:43:54 faldara kernel: ACPI: EC: GPE=3D0x23
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC in=
itialization complete
Dec 11 18:43:54 faldara kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to han=
dle transactions and events
Dec 11 18:43:54 faldara kernel: iommu: Default domain type: Translated
Dec 11 18:43:54 faldara kernel: iommu: DMA domain TLB invalidation policy: =
lazy mode
Dec 11 18:43:54 faldara kernel: pps_core: LinuxPPS API ver. 1 registered
Dec 11 18:43:54 faldara kernel: pps_core: Software ver. 5.3.6 - Copyright 2=
005-2007 Rodolfo Giometti <giometti@linux.it>
Dec 11 18:43:54 faldara kernel: PTP clock support registered
Dec 11 18:43:54 faldara kernel: EDAC MC: Ver: 3.0.0
Dec 11 18:43:54 faldara kernel: efivars: Registered efivars operations
Dec 11 18:43:54 faldara kernel: NetLabel: Initializing
Dec 11 18:43:54 faldara kernel: NetLabel:  domain hash size =3D 128
Dec 11 18:43:54 faldara kernel: NetLabel:  protocols =3D UNLABELED CIPSOv4 =
CALIPSO
Dec 11 18:43:54 faldara kernel: NetLabel:  unlabeled traffic allowed by def=
ault
Dec 11 18:43:54 faldara kernel: PCI: Using ACPI for IRQ routing
Dec 11 18:43:54 faldara kernel: PCI: pci_cache_line_size set to 64 bytes
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0x00058000-0x=
0005ffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0x0009f000-0x=
0009ffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xb82a3000-0x=
bbffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xb867a000-0x=
bbffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xc1c04000-0x=
c3ffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xc3a94000-0x=
c3ffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xc533e000-0x=
c7ffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xc6c13000-0x=
c7ffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0xc7b00000-0x=
c7ffffff]
Dec 11 18:43:54 faldara kernel: e820: reserve RAM buffer [mem 0x437000000-0=
x437ffffff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: vgaarb: setting as boot V=
GA device
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: vgaarb: bridge control po=
ssible
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.0: vgaarb: VGA device added:=
 decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
Dec 11 18:43:54 faldara kernel: vgaarb: loaded
Dec 11 18:43:54 faldara kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0,=
 0, 0, 0, 0
Dec 11 18:43:54 faldara kernel: hpet0: 8 comparators, 64-bit 24.000000 MHz =
counter
Dec 11 18:43:54 faldara kernel: clocksource: Switched to clocksource tsc-ea=
rly
Dec 11 18:43:54 faldara kernel: VFS: Disk quotas dquot_6.6.0
Dec 11 18:43:54 faldara kernel: VFS: Dquot-cache hash table entries: 512 (o=
rder 0, 4096 bytes)
Dec 11 18:43:54 faldara kernel: AppArmor: AppArmor Filesystem Enabled
Dec 11 18:43:54 faldara kernel: pnp: PnP ACPI init
Dec 11 18:43:54 faldara kernel: system 00:00: [io  0x0290-0x029f] has been =
reserved
Dec 11 18:43:54 faldara kernel: pnp 00:01: [dma 0 disabled]
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0x0680-0x069f] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0xffff] has been reserved
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0xffff] has been reserved
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0xffff] has been reserved
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0x1800-0x18fe] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:02: [io  0x164e-0x164f] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:03: [io  0x0800-0x087f] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:05: [io  0x1854-0x1857] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed10000-0xfed17fff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed18000-0xfed18fff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed19000-0xfed19fff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xf8000000-0xfbffffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed20000-0xfed3ffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed90000-0xfed93fff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfed45000-0xfed8ffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xff000000-0xffffffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xfee00000-0xfeefffff] c=
ould not be reserved
Dec 11 18:43:54 faldara kernel: system 00:06: [mem 0xf7fc0000-0xf7fdffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfd000000-0xfdabffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfdad0000-0xfdadffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfdac0000-0xfdacffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfdae0000-0xfdaeffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfdaf0000-0xfdafffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfdb00000-0xfdffffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfe000000-0xfe01ffff] c=
ould not be reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfe036000-0xfe03bfff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfe03d000-0xfe3fffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:07: [mem 0xfe410000-0xfe7fffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:08: [io  0xfe00-0xfefe] has been =
reserved
Dec 11 18:43:54 faldara kernel: system 00:09: [mem 0xfdaf0000-0xfdafffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:09: [mem 0xfdae0000-0xfdaeffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: system 00:09: [mem 0xfdac0000-0xfdacffff] h=
as been reserved
Dec 11 18:43:54 faldara kernel: pnp: PnP ACPI: found 10 devices
Dec 11 18:43:54 faldara kernel: clocksource: acpi_pm: mask: 0xffffff max_cy=
cles: 0xffffff, max_idle_ns: 2085701024 ns
Dec 11 18:43:54 faldara kernel: NET: Registered PF_INET protocol family
Dec 11 18:43:54 faldara kernel: IP idents hash table entries: 262144 (order=
: 9, 2097152 bytes, linear)
Dec 11 18:43:54 faldara kernel: tcp_listen_portaddr_hash hash table entries=
: 8192 (order: 5, 131072 bytes, linear)
Dec 11 18:43:54 faldara kernel: Table-perturb hash table entries: 65536 (or=
der: 6, 262144 bytes, linear)
Dec 11 18:43:54 faldara kernel: TCP established hash table entries: 131072 =
(order: 8, 1048576 bytes, linear)
Dec 11 18:43:54 faldara kernel: TCP bind hash table entries: 65536 (order: =
9, 2097152 bytes, linear)
Dec 11 18:43:54 faldara kernel: TCP: Hash tables configured (established 13=
1072 bind 65536)
Dec 11 18:43:54 faldara kernel: MPTCP token hash table entries: 16384 (orde=
r: 6, 393216 bytes, linear)
Dec 11 18:43:54 faldara kernel: UDP hash table entries: 8192 (order: 6, 262=
144 bytes, linear)
Dec 11 18:43:54 faldara kernel: UDP-Lite hash table entries: 8192 (order: 6=
, 262144 bytes, linear)
Dec 11 18:43:54 faldara kernel: NET: Registered PF_UNIX/PF_LOCAL protocol f=
amily
Dec 11 18:43:54 faldara kernel: NET: Registered PF_XDP protocol family
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci 0000:02:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0: PCI bridge to [bus 02-03]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xf7=
900000-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci 0000:01:00.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0: PCI bridge to [bus 01-03]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [io  0xe0=
00-0xefff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xf7=
900000-0xf7bfffff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:01.0:   bridge window [mem 0xe0=
000000-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.0: PCI bridge to [bus 04]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2: PCI bridge to [bus 05]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2:   bridge window [io  0xd0=
00-0xdfff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1b.2:   bridge window [mem 0xf7=
e00000-0xf7efffff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0: PCI bridge to [bus 06]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1c.0:   bridge window [mem 0xf7=
d00000-0xf7dfffff]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0: PCI bridge to [bus 07]
Dec 11 18:43:54 faldara kernel: pci 0000:00:1d.0:   bridge window [mem 0xf7=
c00000-0xf7cfffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0=
cf7 window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xf=
fff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000=
-0x000bffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: resource 7 [mem 0xc8000000=
-0xf7ffffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:00: resource 8 [mem 0xfd000000=
-0xfe7fffff window]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:01: resource 0 [io  0xe000-0xe=
fff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:01: resource 1 [mem 0xf7900000=
-0xf7bfffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:01: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:02: resource 0 [io  0xe000-0xe=
fff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:02: resource 1 [mem 0xf7900000=
-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:02: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:03: resource 0 [io  0xe000-0xe=
fff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:03: resource 1 [mem 0xf7900000=
-0xf7afffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:03: resource 2 [mem 0xe0000000=
-0xf01fffff 64bit pref]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:05: resource 0 [io  0xd000-0xd=
fff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:05: resource 1 [mem 0xf7e00000=
-0xf7efffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:06: resource 1 [mem 0xf7d00000=
-0xf7dfffff]
Dec 11 18:43:54 faldara kernel: pci_bus 0000:07: resource 1 [mem 0xf7c00000=
-0xf7cfffff]
Dec 11 18:43:54 faldara kernel: pci 0000:03:00.1: D0 power state depends on=
 0000:03:00.0
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.0: async suspend disabled to=
 avoid multi-function power-on ordering issue
Dec 11 18:43:54 faldara kernel: pci 0000:05:00.1: async suspend disabled to=
 avoid multi-function power-on ordering issue
Dec 11 18:43:54 faldara kernel: PCI: CLS 64 bytes, default 64
Dec 11 18:43:54 faldara kernel: PCI-DMA: Using software bounce buffering fo=
r IO (SWIOTLB)
Dec 11 18:43:54 faldara kernel: software IO TLB: mapped [mem 0x00000000b42a=
3000-0x00000000b82a3000] (64MB)
Dec 11 18:43:54 faldara kernel: Unpacking initramfs...
Dec 11 18:43:54 faldara kernel: Initialise system trusted keyrings
Dec 11 18:43:54 faldara kernel: Key type blacklist registered
Dec 11 18:43:54 faldara kernel: workingset: timestamp_bits=3D36 max_order=
=3D22 bucket_order=3D0
Dec 11 18:43:54 faldara kernel: zbud: loaded
Dec 11 18:43:54 faldara kernel: integrity: Platform Keyring initialized
Dec 11 18:43:54 faldara kernel: integrity: Machine keyring initialized
Dec 11 18:43:54 faldara kernel: Key type asymmetric registered
Dec 11 18:43:54 faldara kernel: Asymmetric key parser 'x509' registered
Dec 11 18:43:54 faldara kernel: tsc: Refined TSC clocksource calibration: 3=
504.000 MHz
Dec 11 18:43:54 faldara kernel: clocksource: tsc: mask: 0xffffffffffffffff =
max_cycles: 0x3282142a9b0, max_idle_ns: 440795384778 ns
Dec 11 18:43:54 faldara kernel: clocksource: Switched to clocksource tsc
Dec 11 18:43:54 faldara kernel: Freeing initrd memory: 340168K
Dec 11 18:43:54 faldara kernel: Block layer SCSI generic (bsg) driver versi=
on 0.4 loaded (major 247)
Dec 11 18:43:54 faldara kernel: io scheduler mq-deadline registered
Dec 11 18:43:54 faldara kernel: shpchp: Standard Hot Plug PCI Controller Dr=
iver version: 0.4
Dec 11 18:43:54 faldara kernel: efifb: probing for efifb
Dec 11 18:43:54 faldara kernel: efifb: framebuffer at 0xe0000000, using 198=
4k, total 1984k
Dec 11 18:43:54 faldara kernel: efifb: mode is 800x600x32, linelength=3D332=
8, pages=3D1
Dec 11 18:43:54 faldara kernel: efifb: scrolling: redraw
Dec 11 18:43:54 faldara kernel: efifb: Truecolor: size=3D8:8:8:8, shift=3D2=
4:16:8:0
Dec 11 18:43:54 faldara kernel: Console: switching to colour frame buffer d=
evice 100x37
Dec 11 18:43:54 faldara kernel: fb0: EFI VGA frame buffer device
Dec 11 18:43:54 faldara kernel: thermal LNXTHERM:00: registered as thermal_=
zone0
Dec 11 18:43:54 faldara kernel: ACPI: thermal: Thermal Zone [TZ00] (28 C)
Dec 11 18:43:54 faldara kernel: thermal LNXTHERM:01: registered as thermal_=
zone1
Dec 11 18:43:54 faldara kernel: ACPI: thermal: Thermal Zone [TZ01] (30 C)
Dec 11 18:43:54 faldara kernel: Serial: 8250/16550 driver, 4 ports, IRQ sha=
ring enabled
Dec 11 18:43:54 faldara kernel: 00:01: ttyS0 at I/O 0x3f8 (irq =3D 4, base_=
baud =3D 115200) is a 16550A
Dec 11 18:43:54 faldara kernel: Linux agpgart interface v0.103
Dec 11 18:43:54 faldara kernel: i8042: PNP: No PS/2 controller found.
Dec 11 18:43:54 faldara kernel: mousedev: PS/2 mouse device common for all =
mice
Dec 11 18:43:54 faldara kernel: rtc_cmos 00:04: RTC can wake from S4
Dec 11 18:43:54 faldara kernel: rtc_cmos 00:04: registered as rtc0
Dec 11 18:43:54 faldara kernel: rtc_cmos 00:04: setting system clock to 202=
3-12-11T23:43:47 UTC (1702338227)
Dec 11 18:43:54 faldara kernel: rtc_cmos 00:04: alarms up to one month, y3k=
, 242 bytes nvram
Dec 11 18:43:54 faldara kernel: intel_pstate: Intel P-state driver initiali=
zing
Dec 11 18:43:54 faldara kernel: intel_pstate: HWP enabled
Dec 11 18:43:54 faldara kernel: ledtrig-cpu: registered to indicate activit=
y on CPUs
Dec 11 18:43:54 faldara kernel: NET: Registered PF_INET6 protocol family
Dec 11 18:43:54 faldara kernel: Segment Routing with IPv6
Dec 11 18:43:54 faldara kernel: In-situ OAM (IOAM) with IPv6
Dec 11 18:43:54 faldara kernel: mip6: Mobile IPv6
Dec 11 18:43:54 faldara kernel: NET: Registered PF_PACKET protocol family
Dec 11 18:43:54 faldara kernel: microcode: Current revision: 0xa04cbbec
Dec 11 18:43:54 faldara kernel: microcode: Updated early from: 0x000000c2
Dec 11 18:43:54 faldara kernel: IPI shorthand broadcast: enabled
Dec 11 18:43:54 faldara kernel: sched_clock: Marking stable (3920001773, 51=
5413)->(3950009539, -29492353)
Dec 11 18:43:54 faldara kernel: registered taskstats version 1
Dec 11 18:43:54 faldara kernel: Loading compiled-in X.509 certificates
Dec 11 18:43:54 faldara kernel: Loaded X.509 cert 'Build time autogenerated=
 kernel key: 0d2878742af2857d384a6188ea1d09159a9f8e21'
Dec 11 18:43:54 faldara kernel: Key type .fscrypt registered
Dec 11 18:43:54 faldara kernel: Key type fscrypt-provisioning registered
Dec 11 18:43:54 faldara kernel: Key type encrypted registered
Dec 11 18:43:54 faldara kernel: AppArmor: AppArmor sha1 policy hashing enab=
led
Dec 11 18:43:54 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Dec 11 18:43:54 faldara kernel: integrity: Loaded X.509 cert 'ASUSTeK Mothe=
rBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
Dec 11 18:43:54 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Dec 11 18:43:54 faldara kernel: integrity: Loaded X.509 cert 'ASUSTeK Noteb=
ook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
Dec 11 18:43:54 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Dec 11 18:43:54 faldara kernel: integrity: Loaded X.509 cert 'Microsoft Cor=
poration UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
Dec 11 18:43:54 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Dec 11 18:43:54 faldara kernel: integrity: Loaded X.509 cert 'Microsoft Win=
dows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
Dec 11 18:43:54 faldara kernel: integrity: Loading X.509 certificate: UEFI:=
db
Dec 11 18:43:54 faldara kernel: integrity: Loaded X.509 cert 'Canonical Ltd=
. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
Dec 11 18:43:54 faldara kernel: ima: No TPM chip found, activating TPM-bypa=
ss!
Dec 11 18:43:54 faldara kernel: ima: Allocated hash algorithm: sha256
Dec 11 18:43:54 faldara kernel: ima: No architecture policies found
Dec 11 18:43:54 faldara kernel: evm: Initialising EVM extended attributes:
Dec 11 18:43:54 faldara kernel: evm: security.selinux
Dec 11 18:43:54 faldara kernel: evm: security.SMACK64 (disabled)
Dec 11 18:43:54 faldara kernel: evm: security.SMACK64EXEC (disabled)
Dec 11 18:43:54 faldara kernel: evm: security.SMACK64TRANSMUTE (disabled)
Dec 11 18:43:54 faldara kernel: evm: security.SMACK64MMAP (disabled)
Dec 11 18:43:54 faldara kernel: evm: security.apparmor
Dec 11 18:43:54 faldara kernel: evm: security.ima
Dec 11 18:43:54 faldara kernel: evm: security.capability
Dec 11 18:43:54 faldara kernel: evm: HMAC attrs: 0x1
Dec 11 18:43:54 faldara kernel: RAS: Correctable Errors collector initializ=
ed.
Dec 11 18:43:54 faldara kernel: clk: Disabling unused clocks
Dec 11 18:43:54 faldara kernel: Freeing unused decrypted memory: 2036K
Dec 11 18:43:54 faldara kernel: Freeing unused kernel image (initmem) memor=
y: 2768K
Dec 11 18:43:54 faldara kernel: Write protecting the kernel read-only data:=
 22528k
Dec 11 18:43:54 faldara kernel: Freeing unused kernel image (rodata/data ga=
p) memory: 748K
Dec 11 18:43:54 faldara kernel: x86/mm: Checked W+X mappings: passed, no W+=
X pages found.
Dec 11 18:43:54 faldara kernel: Run /init as init process
Dec 11 18:43:54 faldara kernel:   with arguments:
Dec 11 18:43:54 faldara kernel:     /init
Dec 11 18:43:54 faldara kernel:   with environment:
Dec 11 18:43:54 faldara kernel:     HOME=3D/
Dec 11 18:43:54 faldara kernel:     TERM=3Dlinux
Dec 11 18:43:54 faldara kernel:     BOOT_IMAGE=3D/boot/vmlinuz-6.7.0-rc5
Dec 11 18:43:54 faldara kernel: i801_smbus 0000:00:1f.4: SPD Write Disable =
is set
Dec 11 18:43:54 faldara kernel: i801_smbus 0000:00:1f.4: SMBus using PCI in=
terrupt
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.1: [8086:a120] type 00 class=
 0x058000
Dec 11 18:43:54 faldara kernel: pci 0000:00:1f.1: reg 0x10: [mem 0xfd000000=
-0xfdffffff 64bit]
Dec 11 18:43:54 faldara kernel: i2c i2c-0: 2/4 memory slots populated (from=
 DMI)
Dec 11 18:43:54 faldara kernel: i2c i2c-0: Successfully instantiated SPD at=
 0x52
Dec 11 18:43:54 faldara kernel: i2c i2c-0: Successfully instantiated SPD at=
 0x53
Dec 11 18:43:54 faldara kernel: e1000e: Intel(R) PRO/1000 Network Driver
Dec 11 18:43:54 faldara kernel: e1000e: Copyright(c) 1999 - 2015 Intel Corp=
oration.
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6: Interrupt Throttling R=
ate (ints/sec) set to dynamic conservative mode
Dec 11 18:43:54 faldara kernel: ACPI: bus type USB registered
Dec 11 18:43:54 faldara kernel: usbcore: registered new interface driver us=
bfs
Dec 11 18:43:54 faldara kernel: usbcore: registered new interface driver hub
Dec 11 18:43:54 faldara kernel: usbcore: registered new device driver usb
Dec 11 18:43:54 faldara kernel: ACPI: bus type drm_connector registered
Dec 11 18:43:54 faldara kernel: SCSI subsystem initialized
Dec 11 18:43:54 faldara kernel: nvme nvme0: pci function 0000:07:00.0
Dec 11 18:43:54 faldara kernel: libata version 3.00 loaded.
Dec 11 18:43:54 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
Dec 11 18:43:54 faldara kernel:  nvme0n1: p1 p2
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: new USB bus register=
ed, assigned bus number 1
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: hcc params 0x200077c=
1 hci version 0x100 quirks 0x0000000001109810
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: new USB bus register=
ed, assigned bus number 2
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:00:14.0: Host supports USB 3.=
0 SuperSpeed
Dec 11 18:43:54 faldara kernel: usb usb1: New USB device found, idVendor=3D=
1d6b, idProduct=3D0002, bcdDevice=3D 6.07
Dec 11 18:43:54 faldara kernel: usb usb1: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Dec 11 18:43:54 faldara kernel: usb usb1: Product: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: usb usb1: Manufacturer: Linux 6.7.0-rc5 xhc=
i-hcd
Dec 11 18:43:54 faldara kernel: usb usb1: SerialNumber: 0000:00:14.0
Dec 11 18:43:54 faldara kernel: hub 1-0:1.0: USB hub found
Dec 11 18:43:54 faldara kernel: hub 1-0:1.0: 16 ports detected
Dec 11 18:43:54 faldara kernel: ahci 0000:00:17.0: version 3.0
Dec 11 18:43:54 faldara kernel: usb usb2: New USB device found, idVendor=3D=
1d6b, idProduct=3D0003, bcdDevice=3D 6.07
Dec 11 18:43:54 faldara kernel: usb usb2: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Dec 11 18:43:54 faldara kernel: usb usb2: Product: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: usb usb2: Manufacturer: Linux 6.7.0-rc5 xhc=
i-hcd
Dec 11 18:43:54 faldara kernel: usb usb2: SerialNumber: 0000:00:14.0
Dec 11 18:43:54 faldara kernel: hub 2-0:1.0: USB hub found
Dec 11 18:43:54 faldara kernel: hub 2-0:1.0: 10 ports detected
Dec 11 18:43:54 faldara kernel: usb: port power management may be unreliable
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: new USB bus register=
ed, assigned bus number 3
Dec 11 18:43:54 faldara kernel: ahci 0000:00:17.0: AHCI 0001.0301 32 slots =
6 ports 6 Gbps 0x3f impl SATA mode
Dec 11 18:43:54 faldara kernel: ahci 0000:00:17.0: flags: 64bit ncq sntf le=
d clo only pio slum part ems deso sadm sds apst=20
Dec 11 18:43:54 faldara kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTA=
BLE is disabled. Duplicate IMA measurements will not be recorded in the IMA=
 log.
Dec 11 18:43:54 faldara kernel: device-mapper: ioctl: 4.48.0-ioctl (2023-03=
-01) initialised: dm-devel@redhat.com
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: hcc params 0x0200eec=
0 hci version 0x110 quirks 0x0000000000800010
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: new USB bus register=
ed, assigned bus number 4
Dec 11 18:43:54 faldara kernel: xhci_hcd 0000:06:00.0: Host supports USB 3.=
1 Enhanced SuperSpeed
Dec 11 18:43:54 faldara kernel: usb usb3: New USB device found, idVendor=3D=
1d6b, idProduct=3D0002, bcdDevice=3D 6.07
Dec 11 18:43:54 faldara kernel: usb usb3: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Dec 11 18:43:54 faldara kernel: usb usb3: Product: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: usb usb3: Manufacturer: Linux 6.7.0-rc5 xhc=
i-hcd
Dec 11 18:43:54 faldara kernel: usb usb3: SerialNumber: 0000:06:00.0
Dec 11 18:43:54 faldara kernel: hub 3-0:1.0: USB hub found
Dec 11 18:43:54 faldara kernel: hub 3-0:1.0: 2 ports detected
Dec 11 18:43:54 faldara kernel: usb usb4: We don't know the algorithms for =
LPM for this host, disabling LPM.
Dec 11 18:43:54 faldara kernel: usb usb4: New USB device found, idVendor=3D=
1d6b, idProduct=3D0003, bcdDevice=3D 6.07
Dec 11 18:43:54 faldara kernel: usb usb4: New USB device strings: Mfr=3D3, =
Product=3D2, SerialNumber=3D1
Dec 11 18:43:54 faldara kernel: usb usb4: Product: xHCI Host Controller
Dec 11 18:43:54 faldara kernel: usb usb4: Manufacturer: Linux 6.7.0-rc5 xhc=
i-hcd
Dec 11 18:43:54 faldara kernel: usb usb4: SerialNumber: 0000:06:00.0
Dec 11 18:43:54 faldara kernel: hub 4-0:1.0: USB hub found
Dec 11 18:43:54 faldara kernel: hub 4-0:1.0: 2 ports detected
Dec 11 18:43:54 faldara kernel: scsi host0: ahci
Dec 11 18:43:54 faldara kernel: scsi host1: ahci
Dec 11 18:43:54 faldara kernel: scsi host2: ahci
Dec 11 18:43:54 faldara kernel: scsi host3: ahci
Dec 11 18:43:54 faldara kernel: scsi host4: ahci
Dec 11 18:43:54 faldara kernel: scsi host5: ahci
Dec 11 18:43:54 faldara kernel: ata1: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b100 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata2: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b180 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata3: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b200 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata4: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b280 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata5: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b300 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata6: SATA max UDMA/133 abar m2048@0xf7f4b0=
00 port 0xf7f4b380 irq 133 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ahci 0000:05:00.0: AHCI 0001.0000 32 slots =
2 ports 3 Gbps 0x3 impl SATA mode
Dec 11 18:43:54 faldara kernel: ahci 0000:05:00.0: flags: 64bit ncq pm led =
clo pmp pio slum part=20
Dec 11 18:43:54 faldara kernel: scsi host6: ahci
Dec 11 18:43:54 faldara kernel: scsi host7: ahci
Dec 11 18:43:54 faldara kernel: ata7: SATA max UDMA/133 abar m8192@0xf7e100=
00 port 0xf7e10100 irq 18 lpm-pol 0
Dec 11 18:43:54 faldara kernel: ata8: SATA max UDMA/133 abar m8192@0xf7e100=
00 port 0xf7e10180 irq 18 lpm-pol 0
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6 0000:00:1f.6 (uninitial=
ized): registered PHC clock
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6 eth0: (PCI Express:2.5G=
T/s:Width x1) 38:d5:47:0f:48:8a
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000=
 Network Connection
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12,=
 PBA No: FFFFFF-0FF
Dec 11 18:43:54 faldara kernel: usb 1-5: new full-speed USB device number 2=
 using xhci_hcd
Dec 11 18:43:54 faldara kernel: ata6: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:43:54 faldara kernel: ata2: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:43:54 faldara kernel: ata1: SATA link down (SStatus 4 SControl 30=
0)
Dec 11 18:43:54 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SC=
ontrol 300)
Dec 11 18:43:54 faldara kernel: ata5: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:43:54 faldara kernel: ata3: SATA link down (SStatus 4 SControl 30=
0)
Dec 11 18:43:54 faldara kernel: ata2.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Dec 11 18:43:54 faldara kernel: ata6.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Dec 11 18:43:54 faldara kernel: ata5.00: ATA-8: WDC WD10EZEX-00KUWA0, 15.01=
H15, max UDMA/133
Dec 11 18:43:54 faldara kernel: ata2.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Dec 11 18:43:54 faldara kernel: ata6.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Dec 11 18:43:54 faldara kernel: ata5.00: 1953525168 sectors, multi 16: LBA4=
8 NCQ (depth 32), AA
Dec 11 18:43:54 faldara kernel: ata2.00: configured for UDMA/133
Dec 11 18:43:54 faldara kernel: ata6.00: configured for UDMA/133
Dec 11 18:43:54 faldara kernel: scsi 1:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Dec 11 18:43:54 faldara kernel: ata5.00: configured for UDMA/133
Dec 11 18:43:54 faldara kernel: ata4.00: ATAPI: HL-DT-ST BD-RE  WH10LS30, 1=
.00, max UDMA/133
Dec 11 18:43:54 faldara kernel: ata7: SATA link down (SStatus 0 SControl 30=
0)
Dec 11 18:43:54 faldara kernel: ata8: SATA link down (SStatus 0 SControl 30=
0)
Dec 11 18:43:54 faldara kernel: ata4.00: configured for UDMA/133
Dec 11 18:43:54 faldara kernel: scsi 3:0:0:0: CD-ROM            HL-DT-ST BD=
-RE  WH10LS30  1.00 PQ: 0 ANSI: 5
Dec 11 18:43:54 faldara kernel: usb 1-5: New USB device found, idVendor=3D1=
532, idProduct=3D005c, bcdDevice=3D 2.00
Dec 11 18:43:54 faldara kernel: usb 1-5: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D0
Dec 11 18:43:54 faldara kernel: usb 1-5: Product: Razer DeathAdder Elite
Dec 11 18:43:54 faldara kernel: usb 1-5: Manufacturer: Razer
Dec 11 18:43:54 faldara kernel: hid: raw HID events driver (C) Jiri Kosina
Dec 11 18:43:54 faldara kernel: scsi 4:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Dec 11 18:43:54 faldara kernel: scsi 5:0:0:0: Direct-Access     ATA      WD=
C WD10EZEX-00K 1H15 PQ: 0 ANSI: 5
Dec 11 18:43:54 faldara kernel: e1000e 0000:00:1f.6 enp0s31f6: renamed from=
 eth0
Dec 11 18:43:54 faldara kernel: usbcore: registered new interface driver us=
bhid
Dec 11 18:43:54 faldara kernel: usbhid: USB HID core driver
Dec 11 18:43:54 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/0003:1532:005C.0001/input/inp=
ut0
Dec 11 18:43:54 faldara kernel: hid-generic 0003:1532:005C.0001: input,hidr=
aw0: USB HID v1.11 Mouse [Razer Razer DeathAdder Elite] on usb-0000:00:14.0=
-5/input0
Dec 11 18:43:54 faldara kernel: input: Razer Razer DeathAdder Elite Keyboar=
d as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.1/0003:1532:005C.0002/=
input/input1
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] 4096-byte physical blocks
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] 4096-byte physical blocks
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] 1953525168 512-byte logic=
al blocks: (1.00 TB/932 GiB)
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] Write Protect is off
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] 4096-byte physical blocks
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] Write Protect is off
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] Mode Sense: 00 3a 00 00
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] Preferred minimum I/O siz=
e 4096 bytes
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] Mode Sense: 00 3a 00 00
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] Write cache: enabled, rea=
d cache: enabled, doesn't support DPO or FUA
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] Preferred minimum I/O siz=
e 4096 bytes
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] Preferred minimum I/O siz=
e 4096 bytes
Dec 11 18:43:54 faldara kernel:  sdc: sdc1
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Dec 11 18:43:54 faldara kernel:  sda: sda1
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: [sda] Attached SCSI disk
Dec 11 18:43:54 faldara kernel:  sdb: sdb1
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: [sdb] Attached SCSI disk
Dec 11 18:43:54 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.1/0003:1532:005C.0002/input/inp=
ut2
Dec 11 18:43:54 faldara kernel: hid-generic 0003:1532:005C.0002: input,hidr=
aw1: USB HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on usb-0000:00:1=
4.0-5/input1
Dec 11 18:43:54 faldara kernel: input: Razer Razer DeathAdder Elite as /dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/0003:1532:005C.0003/input/inp=
ut3
Dec 11 18:43:54 faldara kernel: usb 1-6: new full-speed USB device number 3=
 using xhci_hcd
Dec 11 18:43:54 faldara kernel: sr 3:0:0:0: [sr0] scsi3-mmc drive: 40x/40x =
writer dvd-ram cd/rw xa/form2 cdda tray
Dec 11 18:43:54 faldara kernel: cdrom: Uniform CD-ROM driver Revision: 3.20
Dec 11 18:43:54 faldara kernel: hid-generic 0003:1532:005C.0003: input,hidr=
aw2: USB HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on usb-0000:00:1=
4.0-5/input2
Dec 11 18:43:54 faldara kernel: sr 3:0:0:0: Attached scsi CD-ROM sr0
Dec 11 18:43:54 faldara kernel: usb 1-6: New USB device found, idVendor=3D0=
3eb, idProduct=3Dff02, bcdDevice=3D 0.50
Dec 11 18:43:54 faldara kernel: usb 1-6: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
Dec 11 18:43:54 faldara kernel: usb 1-6: Product: WootingTwo
Dec 11 18:43:54 faldara kernel: usb 1-6: Manufacturer: Wooting
Dec 11 18:43:54 faldara kernel: usb 1-6: SerialNumber: WOOT_001_A01B1927W02=
1H01438
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0004: offset (0)=
 exceeds report_count (0)
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0004: No inputs =
registered, leaving
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0004: hidraw3: U=
SB HID v1.11 Keyboard [Wooting WootingTwo] on usb-0000:00:14.0-6/input1
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0005: hiddev0,hi=
draw4: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t2
Dec 11 18:43:54 faldara kernel: input: Wooting WootingTwo as /devices/pci00=
00:00/0000:00:14.0/usb1/1-6/1-6:1.3/0003:03EB:FF02.0006/input/input5
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0006: input,hidr=
aw5: USB HID v1.11 Keyboard [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t3
Dec 11 18:43:54 faldara kernel: input: Wooting WootingTwo System Control as=
 /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.4/0003:03EB:FF02.0007/inpu=
t/input6
Dec 11 18:43:54 faldara kernel: input: Wooting WootingTwo Consumer Control =
as /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.4/0003:03EB:FF02.0007/in=
put/input7
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0007: input,hidr=
aw6: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/input4
Dec 11 18:43:54 faldara kernel: input: Wooting WootingTwo as /devices/pci00=
00:00/0000:00:14.0/usb1/1-6/1-6:1.5/0003:03EB:FF02.0008/input/input8
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0008: input,hidr=
aw7: USB HID v1.11 Gamepad [Wooting WootingTwo] on usb-0000:00:14.0-6/input5
Dec 11 18:43:54 faldara kernel: hid-generic 0003:03EB:FF02.0009: hiddev1,hi=
draw8: USB HID v1.11 Device [Wooting WootingTwo] on usb-0000:00:14.0-6/inpu=
t6
Dec 11 18:43:54 faldara kernel: usb 1-9: new high-speed USB device number 4=
 using xhci_hcd
Dec 11 18:43:54 faldara kernel: [drm] amdgpu kernel modesetting enabled.
Dec 11 18:43:54 faldara kernel: amdgpu: Virtual CRAT table created for CPU
Dec 11 18:43:54 faldara kernel: amdgpu: Topology: Add CPU node
Dec 11 18:43:54 faldara kernel: [drm] initializing kernel modesetting (DIMG=
REY_CAVEFISH 0x1002:0x73FF 0x1458:0x2334 0xC7).
Dec 11 18:43:54 faldara kernel: [drm] register mmio base: 0xF7900000
Dec 11 18:43:54 faldara kernel: [drm] register mmio size: 1048576
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 0 <nv_common>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 1 <gmc_v10_0>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 2 <navi10_ih>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 3 <psp>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 4 <smu>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 5 <dm>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 6 <gfx_v10_0>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 7 <sdma_v5_2>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 8 <vcn_v3_0>
Dec 11 18:43:54 faldara kernel: [drm] add ip block number 9 <jpeg_v3_0>
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: No more image in the P=
CI ROM
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS =
from ROM BAR
Dec 11 18:43:54 faldara kernel: amdgpu: ATOM BIOS: 113-D534-R66E
Dec 11 18:43:54 faldara kernel: [drm] VCN(0) decode is enabled in VM mode
Dec 11 18:43:54 faldara kernel: [drm] VCN(0) encode is enabled in VM mode
Dec 11 18:43:54 faldara kernel: [drm] JPEG decode is enabled in VM mode
Dec 11 18:43:54 faldara kernel: Console: switching to colour dummy device 8=
0x25
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: vgaarb: deactivate vga=
 console
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Trusted Memory=
 Zone (TMZ) feature disabled as experimental (default)
Dec 11 18:43:54 faldara kernel: [drm] vm size is 262144 GB, 4 levels, block=
 size is 9-bit, fragment size is 9-bit
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: VRAM: 8176M 0x=
0000008000000000 - 0x00000081FEFFFFFF (8176M used)
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x0=
000000000000000 - 0x000000001FFFFFFF
Dec 11 18:43:54 faldara kernel: [drm] Detected VRAM RAM=3D8176M, BAR=3D256M
Dec 11 18:43:54 faldara kernel: [drm] RAM width 128bits GDDR6
Dec 11 18:43:54 faldara kernel: [drm] amdgpu: 8176M of VRAM memory ready
Dec 11 18:43:54 faldara kernel: [drm] amdgpu: 7973M of GTT memory ready.
Dec 11 18:43:54 faldara kernel: [drm] GART: num cpu pages 131072, num gpu p=
ages 131072
Dec 11 18:43:54 faldara kernel: [drm] PCIE GART of 512M enabled (table at 0=
x0000008000200000).
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: STB initialize=
d to 2048 entries
Dec 11 18:43:54 faldara kernel: [drm] Loading DMUB firmware via PSP: versio=
n=3D0x02020003
Dec 11 18:43:54 faldara kernel: [drm] use_doorbell being set to: [true]
Dec 11 18:43:54 faldara kernel: [drm] use_doorbell being set to: [true]
Dec 11 18:43:54 faldara kernel: [drm] Found VCN firmware Version ENC: 1.13 =
DEC: 2 VEP: 0 Revision: 42
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Will use PSP t=
o load VCN firmware
Dec 11 18:43:54 faldara kernel: [drm] reserve 0xa00000 from 0x81fd000000 fo=
r PSP TMR
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: RAS: optional =
ras ta ucode is not available
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY:=
 securedisplay ta ucode is not available
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: smu driver if =
version =3D 0x0000000f, smu fw if version =3D 0x00000012, smu fw program =
=3D 0, version =3D 0x003b2200 (59.34.0)
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SMU driver if =
version not matched
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: use vbios prov=
ided pptable
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SMU is initial=
ized successfully!
Dec 11 18:43:54 faldara kernel: [drm] Display Core v3.2.259 initialized on =
DCN 3.0.2
Dec 11 18:43:54 faldara kernel: [drm] DP-HDMI FRL PCON supported
Dec 11 18:43:54 faldara kernel: [drm] DMUB hardware initialized: version=3D=
0x02020003
Dec 11 18:43:54 faldara kernel: [drm] Unknown EDID CEA parser results
Dec 11 18:43:54 faldara kernel: [drm] kiq ring mec 2 pipe 1 q 0
Dec 11 18:43:54 faldara kernel: [drm] VCN decode and encode initialized suc=
cessfully(under DPG Mode).
Dec 11 18:43:54 faldara kernel: [drm] JPEG decode initialized successfully.
Dec 11 18:43:54 faldara kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on=
 gart
Dec 11 18:43:54 faldara kernel: kfd kfd: amdgpu: Total number of KFD nodes =
to be created: 1
Dec 11 18:43:54 faldara kernel: amdgpu: Virtual CRAT table created for GPU
Dec 11 18:43:54 faldara kernel: amdgpu: Topology: Add dGPU node [0x73ff:0x1=
002]
Dec 11 18:43:54 faldara kernel: kfd kfd: amdgpu: added device 1002:73ff
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: SE 2, SH per S=
E 2, CU per SH 8, active_cu_number 28
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0=
 uses VM inv eng 0 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.=
0 uses VM inv eng 1 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.=
0 uses VM inv eng 4 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.=
0 uses VM inv eng 5 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.=
0 uses VM inv eng 6 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.=
1 uses VM inv eng 7 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.=
1 uses VM inv eng 8 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.=
1 uses VM inv eng 9 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.=
1 uses VM inv eng 10 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring kiq_0.2.1=
.0 uses VM inv eng 11 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring sdma0 use=
s VM inv eng 12 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring sdma1 use=
s VM inv eng 13 on hub 0
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_dec_0=
 uses VM inv eng 0 on hub 8
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0=
.0 uses VM inv eng 1 on hub 8
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc_0=
.1 uses VM inv eng 4 on hub 8
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec =
uses VM inv eng 5 on hub 8
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: amdgpu: Using BOCO for=
 runtime pm
Dec 11 18:43:54 faldara kernel: [drm] Initialized amdgpu 3.56.0 20150101 fo=
r 0000:03:00.0 on minor 0
Dec 11 18:43:54 faldara kernel: [drm] Unknown EDID CEA parser results
Dec 11 18:43:54 faldara kernel: fbcon: amdgpudrmfb (fb0) is primary device
Dec 11 18:43:54 faldara kernel: [drm] DSC precompute is not needed.
Dec 11 18:43:54 faldara kernel: Console: switching to colour frame buffer d=
evice 160x45
Dec 11 18:43:54 faldara kernel: amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb=
 frame buffer device
Dec 11 18:43:54 faldara kernel: raid6: avx2x4   gen() 31467 MB/s
Dec 11 18:43:54 faldara kernel: raid6: avx2x2   gen() 45023 MB/s
Dec 11 18:43:54 faldara kernel: raid6: avx2x1   gen() 38266 MB/s
Dec 11 18:43:54 faldara kernel: raid6: using algorithm avx2x2 gen() 45023 M=
B/s
Dec 11 18:43:54 faldara kernel: raid6: .... xor() 27476 MB/s, rmw enabled
Dec 11 18:43:54 faldara kernel: raid6: using avx2x2 recovery algorithm
Dec 11 18:43:54 faldara kernel: xor: automatically using best checksumming =
function   avx=20=20=20=20=20=20=20
Dec 11 18:43:54 faldara kernel: Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
Dec 11 18:43:54 faldara kernel: PM: Image not found (code -22)
Dec 11 18:43:54 faldara kernel: BTRFS: device fsid 8bde215a-6a23-4baa-a049-=
e6e579d0757a devid 1 transid 448034 /dev/mapper/faldara-bullseye scanned by=
 mount (299)
Dec 11 18:43:54 faldara kernel: BTRFS info (device dm-1): first mount of fi=
lesystem 8bde215a-6a23-4baa-a049-e6e579d0757a
Dec 11 18:43:54 faldara kernel: BTRFS info (device dm-1): using crc32c (crc=
32c-intel) checksum algorithm
Dec 11 18:43:54 faldara kernel: BTRFS info (device dm-1): disk space cachin=
g is enabled
Dec 11 18:43:54 faldara kernel: BTRFS info (device dm-1): enabling ssd opti=
mizations
Dec 11 18:43:54 faldara kernel: BTRFS info (device dm-1): auto enabling asy=
nc discard
Dec 11 18:43:54 faldara kernel: Not activating Mandatory Access Control as =
/sbin/tomoyo-init does not exist.
Dec 11 18:43:54 faldara systemd[1]: Inserted module 'autofs4'
Dec 11 18:43:54 faldara kernel: usb 1-9: device descriptor read/64, error -=
110
Dec 11 18:43:54 faldara systemd[1]: systemd 247.3-7+deb11u4 running in syst=
em mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCR=
YPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMO=
D +IDN2 -IDN +PCRE2 default-hierarchy=3Dunified)
Dec 11 18:43:54 faldara systemd[1]: Detected architecture x86-64.
Dec 11 18:43:54 faldara systemd[1]: Set hostname to <faldara>.
Dec 11 18:43:54 faldara kernel: block nvme0n1: the capability attribute has=
 been deprecated.
Dec 11 18:43:54 faldara systemd[1]: /lib/systemd/system/plymouth-start.serv=
ice:16: Unit configured to use KillMode=3Dnone. This is unsafe, as it disab=
les systemd's process lifecycle management for the service. Please update y=
our service to use a safer KillMode=3D, such as 'mixed' or 'control-group'.=
 Support for KillMode=3Dnone is deprecated and will eventually be removed.
Dec 11 18:43:54 faldara systemd[1]: /lib/systemd/system/minidlna.service:4:=
 Failed to add dependency on autofs, ignoring: Invalid argument
Dec 11 18:43:54 faldara systemd[1]: Queued start job for default target Gra=
phical Interface.
Dec 11 18:43:54 faldara kernel: usb 1-9: New USB device found, idVendor=3D0=
48d, idProduct=3D1234, bcdDevice=3D 1.00
Dec 11 18:43:54 faldara kernel: usb 1-9: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D3
Dec 11 18:43:54 faldara kernel: usb 1-9: Product: UDisk=20=20=20=20=20=20=
=20=20=20=20=20
Dec 11 18:43:54 faldara kernel: usb 1-9: Manufacturer: General=20
Dec 11 18:43:54 faldara kernel: usb 1-9: SerialNumber: =D0=89
Dec 11 18:43:54 faldara systemd[1]: Created slice system-getty.slice.
Dec 11 18:43:54 faldara systemd[1]: Created slice system-modprobe.slice.
Dec 11 18:43:54 faldara systemd[1]: Created slice User and Session Slice.
Dec 11 18:43:54 faldara systemd[1]: Started Forward Password Requests to Wa=
ll Directory Watch.
Dec 11 18:43:54 faldara systemd[1]: Set up automount Arbitrary Executable F=
ile Formats File System Automount Point.
Dec 11 18:43:54 faldara systemd[1]: Reached target User and Group Name Look=
ups.
Dec 11 18:43:54 faldara systemd[1]: Reached target Remote File Systems.
Dec 11 18:43:54 faldara systemd[1]: Reached target Slices.
Dec 11 18:43:54 faldara systemd[1]: Listening on Device-mapper event daemon=
 FIFOs.
Dec 11 18:43:54 faldara systemd[1]: Listening on LVM2 poll daemon socket.
Dec 11 18:43:54 faldara systemd[1]: Listening on initctl Compatibility Name=
d Pipe.
Dec 11 18:43:54 faldara systemd[1]: Listening on Journal Audit Socket.
Dec 11 18:43:54 faldara systemd[1]: Listening on Journal Socket (/dev/log).
Dec 11 18:43:54 faldara systemd[1]: Listening on Journal Socket.
Dec 11 18:43:54 faldara systemd[1]: Listening on Network Service Netlink So=
cket.
Dec 11 18:43:54 faldara systemd[1]: Listening on udev Control Socket.
Dec 11 18:43:54 faldara systemd[1]: Listening on udev Kernel Socket.
Dec 11 18:43:54 faldara systemd[1]: Mounting Huge Pages File System...
Dec 11 18:43:54 faldara systemd[1]: Mounting POSIX Message Queue File Syste=
m...
Dec 11 18:43:54 faldara systemd[1]: Mounting Kernel Debug File System...
Dec 11 18:43:54 faldara systemd[1]: Mounting Kernel Trace File System...
Dec 11 18:43:54 faldara systemd[1]: Finished Availability of block devices.
Dec 11 18:43:54 faldara systemd[1]: Starting Set the console keyboard layou=
t...
Dec 11 18:43:54 faldara systemd[1]: Starting Create list of static device n=
odes for the current kernel...
Dec 11 18:43:54 faldara systemd[1]: Starting Monitoring of LVM2 mirrors, sn=
apshots etc. using dmeventd or progress polling...
Dec 11 18:43:54 faldara systemd[1]: Starting Load Kernel Module configfs...
Dec 11 18:43:54 faldara systemd[1]: Starting Load Kernel Module drm...
Dec 11 18:43:54 faldara systemd[1]: Starting Load Kernel Module fuse...
Dec 11 18:43:54 faldara systemd[1]: Condition check resulted in Set Up Addi=
tional Binary Formats being skipped.
Dec 11 18:43:54 faldara systemd[1]: Starting Journal Service...
Dec 11 18:43:54 faldara systemd[1]: Starting Load Kernel Modules...
Dec 11 18:43:54 faldara systemd[1]: Starting Remount Root and Kernel File S=
ystems...
Dec 11 18:43:54 faldara systemd[1]: Starting Coldplug All udev Devices...
Dec 11 18:43:54 faldara systemd[1]: Mounted Huge Pages File System.
Dec 11 18:43:54 faldara systemd[1]: Mounted POSIX Message Queue File System.
Dec 11 18:43:54 faldara systemd[1]: Mounted Kernel Debug File System.
Dec 11 18:43:54 faldara systemd[1]: Mounted Kernel Trace File System.
Dec 11 18:43:54 faldara systemd[1]: Finished Create list of static device n=
odes for the current kernel.
Dec 11 18:43:54 faldara systemd[1]: modprobe@configfs.service: Succeeded.
Dec 11 18:43:54 faldara systemd[1]: Finished Load Kernel Module configfs.
Dec 11 18:43:54 faldara systemd[1]: modprobe@drm.service: Succeeded.
Dec 11 18:43:54 faldara kernel: fuse: init (API version 7.39)
Dec 11 18:43:54 faldara systemd[1]: Finished Load Kernel Module drm.
Dec 11 18:43:54 faldara systemd[1]: modprobe@fuse.service: Succeeded.
Dec 11 18:43:54 faldara systemd[1]: Finished Load Kernel Module fuse.
Dec 11 18:43:54 faldara systemd[1]: Finished Remount Root and Kernel File S=
ystems.
Dec 11 18:43:54 faldara systemd[1]: Mounting FUSE Control File System...
Dec 11 18:43:54 faldara systemd[1]: Mounting Kernel Configuration File Syst=
em...
Dec 11 18:43:54 faldara systemd[1]: Condition check resulted in Rebuild Har=
dware Database being skipped.
Dec 11 18:43:54 faldara systemd[1]: Condition check resulted in Platform Pe=
rsistent Storage Archival being skipped.
Dec 11 18:43:54 faldara systemd[1]: Starting Load/Save Random Seed...
Dec 11 18:43:54 faldara systemd[1]: Starting Create System Users...
Dec 11 18:43:54 faldara systemd[1]: Mounted FUSE Control File System.
Dec 11 18:43:54 faldara systemd[1]: Mounted Kernel Configuration File Syste=
m.
Dec 11 18:43:54 faldara systemd[1]: Finished Monitoring of LVM2 mirrors, sn=
apshots etc. using dmeventd or progress polling.
Dec 11 18:43:54 faldara systemd[1]: Finished Set the console keyboard layou=
t.
Dec 11 18:43:54 faldara systemd[1]: Finished Load Kernel Modules.
Dec 11 18:43:54 faldara systemd-journald[368]: Journal started
Dec 11 18:43:54 faldara systemd-journald[368]: Runtime Journal (/run/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 8.0M, max 159.4M, 151.4M free.
Dec 11 18:43:54 faldara systemd-modules-load[369]: Failed to find module 'l=
p'
Dec 11 18:43:54 faldara systemd-modules-load[369]: Failed to find module 'p=
pdev'
Dec 11 18:43:54 faldara systemd-modules-load[369]: Failed to find module 'p=
arport_pc'
Dec 11 18:43:54 faldara systemd-modules-load[369]: Inserted module 'msr'
Dec 11 18:43:54 faldara lvm[356]:   4 logical volume(s) in volume group "fa=
ldara" monitored
Dec 11 18:43:54 faldara systemd[1]: Started Journal Service.
Dec 11 18:43:54 faldara systemd[1]: Finished Load/Save Random Seed.
Dec 11 18:43:54 faldara systemd[1]: Condition check resulted in First Boot =
Complete being skipped.
Dec 11 18:43:54 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Dec 11 18:43:54 faldara systemd[1]: Starting Apply Kernel Variables...
Dec 11 18:43:54 faldara systemd-journald[368]: Time spent on flushing to /v=
ar/log/journal/84ad0047b8154385bc95456adec0fabe is 12.899ms for 1040 entrie=
s.
Dec 11 18:43:54 faldara systemd-journald[368]: System Journal (/var/log/jou=
rnal/84ad0047b8154385bc95456adec0fabe) is 984.0M, max 4.0G, 3.0G free.
Dec 11 18:43:54 faldara systemd[1]: Finished Create System Users.
Dec 11 18:43:54 faldara systemd[1]: Starting Create Static Device Nodes in =
/dev...
Dec 11 18:43:54 faldara systemd-sysctl[379]: Couldn't write '1' to 'kernel/=
unprivileged_userns_clone', ignoring: No such file or directory
Dec 11 18:43:54 faldara systemd[1]: Finished Apply Kernel Variables.
Dec 11 18:43:54 faldara systemd[1]: Finished Create Static Device Nodes in =
/dev.
Dec 11 18:43:54 faldara systemd[1]: Reached target Local File Systems (Pre).
Dec 11 18:43:54 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Dec 11 18:43:54 faldara systemd[1]: Finished Coldplug All udev Devices.
Dec 11 18:43:54 faldara systemd[1]: Starting Helper to synchronize boot up =
for ifupdown...
Dec 11 18:43:54 faldara systemd[1]: Finished Helper to synchronize boot up =
for ifupdown.
Dec 11 18:43:54 faldara systemd[1]: Finished Flush Journal to Persistent St=
orage.
Dec 11 18:43:54 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Dec 11 18:43:54 faldara systemd[1]: Starting Show Plymouth Boot Screen...
Dec 11 18:43:54 faldara systemd[1]: Starting Network Service...
Dec 11 18:43:54 faldara systemd[1]: Started Show Plymouth Boot Screen.
Dec 11 18:43:54 faldara systemd[1]: Condition check resulted in Dispatch Pa=
ssword Requests to Console Directory Watch being skipped.
Dec 11 18:43:54 faldara systemd[1]: Started Forward Password Requests to Pl=
ymouth Directory Watch.
Dec 11 18:43:54 faldara systemd[1]: Reached target Local Encrypted Volumes.
Dec 11 18:43:54 faldara systemd-networkd[396]: Enumeration completed
Dec 11 18:43:54 faldara systemd[1]: Started Network Service.
Dec 11 18:43:54 faldara kernel: input: Sleep Button as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0C0E:00/input/input9
Dec 11 18:43:54 faldara kernel: ACPI: button: Sleep Button [SLPB]
Dec 11 18:43:54 faldara kernel: input: Power Button as /devices/LNXSYSTM:00=
/LNXSYBUS:00/PNP0C0C:00/input/input10
Dec 11 18:43:54 faldara kernel: ACPI: button: Power Button [PWRB]
Dec 11 18:43:54 faldara kernel: resource: resource sanity check: requesting=
 [mem 0x00000000fdffe800-0x00000000fe0007ff], which spans more than pnp 00:=
07 [mem 0xfdb00000-0xfdffffff]
Dec 11 18:43:54 faldara kernel: input: Power Button as /devices/LNXSYSTM:00=
/LNXPWRBN:00/input/input11
Dec 11 18:43:54 faldara kernel: caller get_primary_reg_base+0x47/0xa0 [inte=
l_pmc_core] mapping multiple BARs
Dec 11 18:43:54 faldara kernel: intel_pmc_core INT33A1:00:  initialized
Dec 11 18:43:54 faldara kernel: ACPI: button: Power Button [PWRF]
Dec 11 18:43:54 faldara kernel: EDAC ie31200: No ECC support
Dec 11 18:43:54 faldara kernel: EDAC ie31200: No ECC support
Dec 11 18:43:54 faldara mtp-probe[414]: checking bus 1, device 4: "/sys/dev=
ices/pci0000:00/0000:00:14.0/usb1/1-9"
Dec 11 18:43:54 faldara mtp-probe[413]: checking bus 1, device 2: "/sys/dev=
ices/pci0000:00/0000:00:14.0/usb1/1-5"
Dec 11 18:43:54 faldara mtp-probe[413]: bus: 1, device: 2 was not an MTP de=
vice
Dec 11 18:43:54 faldara mtp-probe[414]: bus: 1, device: 4 was not an MTP de=
vice
Dec 11 18:43:54 faldara systemd-udevd[407]: Using default interface naming =
scheme 'v247'.
Dec 11 18:43:54 faldara systemd[1]: Found device WDS500G1X0E-00AFY0 1.
Dec 11 18:43:54 faldara systemd[1]: Created slice system-lvm2\x2dpvscan.sli=
ce.
Dec 11 18:43:54 faldara kernel: mei_me 0000:00:16.0: enabling device (0000 =
-> 0002)
Dec 11 18:43:54 faldara kernel: pstore: Using crash dump compression: defla=
te
Dec 11 18:43:54 faldara kernel: sd 1:0:0:0: Attached scsi generic sg0 type 0
Dec 11 18:43:54 faldara systemd[1]: Mounting /boot/efi...
Dec 11 18:43:54 faldara systemd[1]: Starting LVM event activation on device=
 259:2...
Dec 11 18:43:54 faldara kernel: sr 3:0:0:0: Attached scsi generic sg1 type 5
Dec 11 18:43:54 faldara kernel: usb-storage 1-9:1.0: USB Mass Storage devic=
e detected
Dec 11 18:43:54 faldara kernel: sd 4:0:0:0: Attached scsi generic sg2 type 0
Dec 11 18:43:54 faldara kernel: pstore: Registered efi_pstore as persistent=
 store backend
Dec 11 18:43:54 faldara kernel: ee1004 0-0052: 512 byte EE1004-compliant SP=
D EEPROM, read-only
Dec 11 18:43:54 faldara kernel: ee1004 0-0053: 512 byte EE1004-compliant SP=
D EEPROM, read-only
Dec 11 18:43:54 faldara kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Dec 11 18:43:54 faldara lvm[426]:   pvscan[426] PV /dev/nvme0n1p2 online, V=
G faldara is complete.
Dec 11 18:43:54 faldara lvm[426]:   pvscan[426] VG faldara skip autoactivat=
ion.
Dec 11 18:43:54 faldara kernel: scsi host8: usb-storage 1-9:1.0
Dec 11 18:43:54 faldara kernel: usbcore: registered new interface driver us=
b-storage
Dec 11 18:43:54 faldara kernel: iTCO_vendor_support: vendor-support=3D0
Dec 11 18:43:54 faldara systemd-networkd[396]: enp0s31f6: Link UP
Dec 11 18:43:54 faldara systemd-udevd[407]: ethtool: autonegotiation is uns=
et or enabled, the speed and duplex are not writable.
Dec 11 18:43:54 faldara kernel: FAT-fs (nvme0n1p1): Volume was not properly=
 unmounted. Some data may be corrupt. Please run fsck.
Dec 11 18:43:54 faldara systemd[1]: Mounted /boot/efi.
Dec 11 18:43:54 faldara systemd-udevd[410]: ethtool: autonegotiation is uns=
et or enabled, the speed and duplex are not writable.
Dec 11 18:43:54 faldara kernel: usbcore: registered new interface driver uas
Dec 11 18:43:54 faldara systemd[1]: Finished LVM event activation on device=
 259:2.
Dec 11 18:43:54 faldara kernel: iTCO_wdt iTCO_wdt: Found a Intel PCH TCO de=
vice (Version=3D4, TCOBASE=3D0x0400)
Dec 11 18:43:54 faldara kernel: iTCO_wdt iTCO_wdt: initialized. heartbeat=
=3D30 sec (nowayout=3D0)
Dec 11 18:43:54 faldara kernel: asus_wmi: ASUS WMI generic driver loaded
Dec 11 18:43:54 faldara kernel: asus_wmi: Initialization: 0x0
Dec 11 18:43:54 faldara kernel: asus_wmi: BIOS WMI version: 0.9
Dec 11 18:43:54 faldara kernel: asus_wmi: SFUN value: 0x0
Dec 11 18:43:54 faldara kernel: eeepc-wmi eeepc-wmi: Detected ASUSWMI, use =
DCTS
Dec 11 18:43:54 faldara kernel: input: Eee PC WMI hotkeys as /devices/platf=
orm/eeepc-wmi/input/input12
Dec 11 18:43:54 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Dec 11 18:43:54 faldara kernel: RAPL PMU: API unit is 2^-32 Joules, 3 fixed=
 counters, 655360 ms ovfl timer
Dec 11 18:43:54 faldara kernel: RAPL PMU: hw unit of domain pp0-core 2^-14 =
Joules
Dec 11 18:43:54 faldara kernel: RAPL PMU: hw unit of domain package 2^-14 J=
oules
Dec 11 18:43:54 faldara kernel: RAPL PMU: hw unit of domain dram 2^-14 Joul=
es
Dec 11 18:43:54 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Dec 11 18:43:54 faldara kernel: cryptd: max_cpu_qlen set to 1000
Dec 11 18:43:54 faldara kernel: AVX2 version of gcm_enc/dec engaged.
Dec 11 18:43:54 faldara kernel: AES CTR mode by8 optimization enabled
Dec 11 18:43:54 faldara systemd[1]: Mounting /media/d2...
Dec 11 18:43:54 faldara kernel: snd_hda_intel 0000:03:00.1: Force to non-sn=
oop mode
Dec 11 18:43:54 faldara kernel: snd_hda_intel 0000:03:00.1: bound 0000:03:0=
0.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Dec 11 18:43:54 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input13
Dec 11 18:43:54 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D7 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input14
Dec 11 18:43:54 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D8 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input15
Dec 11 18:43:54 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D9 as /dev=
ices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/c=
ard1/input16
Dec 11 18:43:54 faldara kernel: input: HDA ATI HDMI HDMI/DP,pcm=3D10 as /de=
vices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/=
card1/input17
Dec 11 18:43:54 faldara systemd[1]: Mounting /media/d3...
Dec 11 18:43:54 faldara systemd[1]: Found device /dev/faldara/swap.
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0: ALC1150:=
 SKU not ready 0x00000000
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0: autoconf=
ig for ALC1150: line_outs=3D3 (0x14/0x15/0x16/0x0/0x0) type:line
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    speak=
er_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    hp_ou=
ts=3D1 (0x1b/0x0/0x0/0x0/0x0)
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    mono:=
 mono_out=3D0x0
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    dig-o=
ut=3D0x1e/0x0
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:    input=
s:
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Fro=
nt Mic=3D0x19
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Rea=
r Mic=3D0x18
Dec 11 18:43:54 faldara kernel: snd_hda_codec_realtek hdaudioC0D0:      Lin=
e=3D0x1a
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Front Mic as /devices/=
pci0000:00/0000:00:1f.3/sound/card0/input18
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Rear Mic as /devices/p=
ci0000:00/0000:00:1f.3/sound/card0/input19
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Line as /devices/pci00=
00:00/0000:00:1f.3/sound/card0/input20
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Line Out Front as /dev=
ices/pci0000:00/0000:00:1f.3/sound/card0/input21
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Line Out Surround as /=
devices/pci0000:00/0000:00:1f.3/sound/card0/input22
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Line Out CLFE as /devi=
ces/pci0000:00/0000:00:1f.3/sound/card0/input23
Dec 11 18:43:54 faldara kernel: input: HDA Intel PCH Front Headphone as /de=
vices/pci0000:00/0000:00:1f.3/sound/card0/input24
Dec 11 18:43:54 faldara systemd[1]: Found device WDC_WD10EZEX-00KUWA0 1.
Dec 11 18:43:55 faldara systemd[1]: Listening on Load/Save RF Kill Switch S=
tatus /dev/rfkill Watch.
Dec 11 18:43:55 faldara systemd[1]: Activating swap /dev/faldara/swap...
Dec 11 18:43:55 faldara systemd[1]: Mounting /media/d1...
Dec 11 18:43:55 faldara kernel: Adding 3145724k swap on /dev/mapper/faldara=
-swap.  Priority:-2 extents:1 across:3145724k SS
Dec 11 18:43:55 faldara systemd[1]: Activated swap /dev/faldara/swap.
Dec 11 18:43:55 faldara kernel: EXT4-fs (sdb1): mounted filesystem e25768ec=
-351e-4a8f-b403-521b64a2779f ro with ordered data mode. Quota mode: none.
Dec 11 18:43:55 faldara kernel: EXT4-fs (sdc1): mounted filesystem 72c072bc=
-b44d-4479-a91b-464875ba2e1e ro with ordered data mode. Quota mode: none.
Dec 11 18:43:55 faldara systemd[1]: Mounted /media/d2.
Dec 11 18:43:55 faldara systemd[1]: Mounted /media/d3.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Dispatch Pa=
ssword Requests to Console Directory Watch being skipped.
Dec 11 18:43:55 faldara systemd[1]: Reached target Swap.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Set Up Addi=
tional Binary Formats being skipped.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Rebuild Har=
dware Database being skipped.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Platform Pe=
rsistent Storage Archival being skipped.
Dec 11 18:43:55 faldara kernel: EXT4-fs (sda1): mounted filesystem 0289bae2=
-4f2c-4591-907b-143864394cbd ro with ordered data mode. Quota mode: none.
Dec 11 18:43:55 faldara kernel: intel_rapl_common: Found RAPL domain package
Dec 11 18:43:55 faldara kernel: intel_rapl_common: Found RAPL domain core
Dec 11 18:43:55 faldara kernel: intel_rapl_common: Found RAPL domain dram
Dec 11 18:43:55 faldara systemd[1]: Mounted /media/d1.
Dec 11 18:43:55 faldara systemd[1]: Reached target Local File Systems.
Dec 11 18:43:55 faldara systemd[1]: Starting Load AppArmor profiles...
Dec 11 18:43:55 faldara systemd[1]: Starting Set console font and keymap...
Dec 11 18:43:55 faldara systemd[1]: Starting Tell Plymouth To Write Out Run=
time Data...
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Store a Sys=
tem Token in an EFI Variable being skipped.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Commit a tr=
ansient machine-id on disk being skipped.
Dec 11 18:43:55 faldara systemd[1]: Starting Create Volatile Files and Dire=
ctories...
Dec 11 18:43:55 faldara systemd[1]: Finished Set console font and keymap.
Dec 11 18:43:55 faldara systemd[1]: Received SIGRTMIN+20 from PID 266 (plym=
outhd).
Dec 11 18:43:55 faldara systemd[1]: Finished Tell Plymouth To Write Out Run=
time Data.
Dec 11 18:43:55 faldara apparmor.systemd[645]: Restarting AppArmor
Dec 11 18:43:55 faldara apparmor.systemd[645]: Reloading AppArmor profiles
Dec 11 18:43:55 faldara systemd[1]: Finished Create Volatile Files and Dire=
ctories.
Dec 11 18:43:55 faldara audit[657]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"nvidia_modprobe" pid=3D657 comm=
=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[657]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"nvidia_modprobe//kmod" pid=3D657=
 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.184:2):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"nvidia_modprobe" pid=3D657 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.184:3):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"nvidia_modprobe//kmod" pid=3D657 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.184:4):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"lsb_release" pid=3D656 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[656]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"lsb_release" pid=3D656 comm=3D"a=
pparmor_parser"
Dec 11 18:43:55 faldara audit[658]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/man" pid=3D658 comm=3D"=
apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.188:5):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"/usr/bin/man" pid=3D658 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[658]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"man_filter" pid=3D658 comm=3D"ap=
parmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.188:6):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"man_filter" pid=3D658 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.188:7):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"man_groff" pid=3D658 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[658]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"man_groff" pid=3D658 comm=3D"app=
armor_parser"
Dec 11 18:43:55 faldara systemd[1]: Starting Network Name Resolution...
Dec 11 18:43:55 faldara audit[660]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-oopslash" pid=3D660 =
comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.192:8):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"libreoffice-oopslash" pid=3D660 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara systemd[1]: Starting Network Time Synchronization...
Dec 11 18:43:55 faldara audit[661]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-senddoc" pid=3D661 c=
omm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[662]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-xpdfimport" pid=3D66=
2 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.192:9):=
 apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" name=
=3D"libreoffice-senddoc" pid=3D661 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.196:10)=
: apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" nam=
e=3D"libreoffice-xpdfimport" pid=3D662 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara systemd[1]: Starting Update UTMP about System Boot/=
Shutdown...
Dec 11 18:43:55 faldara kernel: audit: type=3D1400 audit(1702338235.216:11)=
: apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined" nam=
e=3D"/usr/lib/x86_64-linux-gnu/lightdm/lightdm-guest-session" pid=3D666 com=
m=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[666]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/x86_64-linux-gnu/lightd=
m/lightdm-guest-session" pid=3D666 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[666]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/x86_64-linux-gnu/lightd=
m/lightdm-guest-session//chromium" pid=3D666 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/mission-contr=
ol-5" pid=3D664 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*" =
pid=3D664 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*//=
pxgsettings" pid=3D664 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-*//=
sanitized_helper" pid=3D664 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[664]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/telepathy/telepathy-ofo=
no" pid=3D664 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[665]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-soffice" pid=3D665 c=
omm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[665]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"libreoffice-soffice//gpg" pid=3D=
665 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/lib/cups/backend/cups-pdf" =
pid=3D669 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cupsd" pid=3D669 comm=
=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[669]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cupsd//third_party" pi=
d=3D669 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara systemd[1]: Finished Update UTMP about System Boot/=
Shutdown.
Dec 11 18:43:55 faldara audit[672]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/sbin/cups-browsed" pid=3D67=
2 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince" pid=3D663 comm=
=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince//sanitized_helpe=
r" pid=3D663 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-previewer" pid=
=3D663 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-previewer//sanit=
ized_helper" pid=3D663 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara audit[663]: AVC apparmor=3D"STATUS" operation=3D"pr=
ofile_load" profile=3D"unconfined" name=3D"/usr/bin/evince-thumbnailer" pid=
=3D663 comm=3D"apparmor_parser"
Dec 11 18:43:55 faldara systemd[1]: Finished Load AppArmor profiles.
Dec 11 18:43:55 faldara systemd[1]: Starting Raise network interfaces...
Dec 11 18:43:55 faldara systemd[1]: Started Network Time Synchronization.
Dec 11 18:43:55 faldara systemd[1]: Reached target System Initialization.
Dec 11 18:43:55 faldara systemd[1]: Started CUPS Scheduler.
Dec 11 18:43:55 faldara systemd[1]: Started Daily Cleanup of Temporary Dire=
ctories.
Dec 11 18:43:55 faldara systemd[1]: Reached target Paths.
Dec 11 18:43:55 faldara systemd[1]: Reached target System Time Set.
Dec 11 18:43:55 faldara systemd[1]: Reached target System Time Synchronized.
Dec 11 18:43:55 faldara systemd[1]: Started Trigger anacron every hour.
Dec 11 18:43:55 faldara systemd[1]: Started Daily apt download activities.
Dec 11 18:43:55 faldara systemd[1]: Started Daily apt upgrade and clean act=
ivities.
Dec 11 18:43:55 faldara systemd[1]: Started Periodic ext4 Online Metadata C=
heck for All Filesystems.
Dec 11 18:43:55 faldara systemd[1]: Started Discard unused blocks once a we=
ek.
Dec 11 18:43:55 faldara systemd[1]: Started Refresh fwupd metadata regularl=
y.
Dec 11 18:43:55 faldara systemd[1]: Started Daily rotation of log files.
Dec 11 18:43:55 faldara systemd[1]: Started Daily man-db regeneration.
Dec 11 18:43:55 faldara systemd[1]: Reached target Timers.
Dec 11 18:43:55 faldara systemd[1]: Listening on Avahi mDNS/DNS-SD Stack Ac=
tivation Socket.
Dec 11 18:43:55 faldara systemd[1]: Listening on CUPS Scheduler.
Dec 11 18:43:55 faldara systemd[1]: Listening on D-Bus System Message Bus S=
ocket.
Dec 11 18:43:55 faldara systemd[1]: Listening on UUID daemon activation soc=
ket.
Dec 11 18:43:55 faldara systemd[1]: Reached target Sockets.
Dec 11 18:43:55 faldara systemd[1]: Reached target Basic System.
Dec 11 18:43:55 faldara systemd[1]: Starting Accounts Service...
Dec 11 18:43:55 faldara systemd[1]: Started Run anacron jobs.
Dec 11 18:43:55 faldara systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
Dec 11 18:43:55 faldara systemd[1]: Started Regular background program proc=
essing daemon.
Dec 11 18:43:55 faldara systemd[1]: Started D-Bus System Message Bus.
Dec 11 18:43:55 faldara systemd[1]: Starting Remove Stale Online ext4 Metad=
ata Check Snapshots...
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in getty on tt=
y2-tty6 if dbus and logind are not available being skipped.
Dec 11 18:43:55 faldara anacron[696]: Anacron 2.3 started on 2023-12-11
Dec 11 18:43:55 faldara systemd[1]: Starting LSB: Execute the kexec -e comm=
and to reboot system...
Dec 11 18:43:55 faldara anacron[696]: Normal exit (0 jobs run)
Dec 11 18:43:55 faldara systemd[1]: Starting Initialize hardware monitoring=
 sensors...
Dec 11 18:43:55 faldara cron[698]: (CRON) INFO (pidfile fd =3D 3)
Dec 11 18:43:55 faldara systemd[1]: Started MiniDLNA lightweight DLNA/UPnP-=
AV server.
Dec 11 18:43:55 faldara cron[698]: (CRON) INFO (Running @reboot jobs)
Dec 11 18:43:55 faldara systemd[1]: Starting Authorization Manager...
Dec 11 18:43:55 faldara systemd[1]: Starting Self Monitoring and Reporting =
Technology (SMART) Daemon...
Dec 11 18:43:55 faldara systemd[1]: Starting Switcheroo Control Proxy servi=
ce...
Dec 11 18:43:55 faldara systemd[1]: Starting User Login Management...
Dec 11 18:43:55 faldara systemd[1]: Starting WPA supplicant...
Dec 11 18:43:55 faldara systemd[1]: anacron.service: Succeeded.
Dec 11 18:43:55 faldara systemd[1]: Started LSB: Execute the kexec -e comma=
nd to reboot system.
Dec 11 18:43:55 faldara systemd[1]: Starting LSB: Load kernel image with ke=
xec...
Dec 11 18:43:55 faldara systemd[1]: Finished Raise network interfaces.
Dec 11 18:43:55 faldara systemd[1]: e2scrub_reap.service: Succeeded.
Dec 11 18:43:55 faldara systemd[1]: Finished Remove Stale Online ext4 Metad=
ata Check Snapshots.
Dec 11 18:43:55 faldara systemd[1]: Started LSB: Load kernel image with kex=
ec.
Dec 11 18:43:55 faldara avahi-daemon[697]: Found user 'avahi' (UID 109) and=
 group 'avahi' (GID 115).
Dec 11 18:43:55 faldara avahi-daemon[697]: Successfully dropped root privil=
eges.
Dec 11 18:43:55 faldara systemd-resolved[659]: Positive Trust Anchors:
Dec 11 18:43:55 faldara avahi-daemon[697]: avahi-daemon 0.8 starting up.
Dec 11 18:43:55 faldara systemd-resolved[659]: . IN DS 20326 8 2 e06d44b80b=
8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Dec 11 18:43:55 faldara systemd-resolved[659]: Negative trust anchors: 10.i=
n-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19.=
172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.arp=
a 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-add=
r.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.i=
n-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp home=
 internal intranet lan local private test
Dec 11 18:43:55 faldara systemd-logind[707]: New seat seat0.
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event10 (Power Button)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event9 (Power Button)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event8 (Sleep Button)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event1 (Razer Razer DeathAdder Elite Keyboard)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event3 (Razer Razer DeathAdder Elite)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event4 (Wooting WootingTwo)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event5 (Wooting WootingTwo System Control)
Dec 11 18:43:55 faldara systemd-logind[707]: Watching system buttons on /de=
v/input/event6 (Wooting WootingTwo Consumer Control)
Dec 11 18:43:55 faldara sensors[749]: coretemp-isa-0000
Dec 11 18:43:55 faldara sensors[749]: Adapter: ISA adapter
Dec 11 18:43:55 faldara sensors[749]: Package id 0:  +56.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: Core 0:        +53.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: Core 1:        +53.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: Core 2:        +54.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: Core 3:        +52.0=C2=B0C  (high =
=3D +80.0=C2=B0C, crit =3D +100.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: amdgpu-pci-0300
Dec 11 18:43:55 faldara sensors[749]: Adapter: PCI adapter
Dec 11 18:43:55 faldara sensors[749]: vddgfx:        6.00 mV
Dec 11 18:43:55 faldara sensors[749]: fan1:           0 RPM  (min =3D    0 =
RPM, max =3D 3100 RPM)
Dec 11 18:43:55 faldara sensors[749]: edge:         +38.0=C2=B0C  (crit =3D=
 +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]:                        (emerg =3D +10=
5.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: junction:     +39.0=C2=B0C  (crit =3D=
 +110.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]:                        (emerg =3D +11=
5.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: mem:          +40.0=C2=B0C  (crit =3D=
 +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]:                        (emerg =3D +10=
5.0=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]: PPT:          14.00 W  (cap =3D 100.0=
0 W)
Dec 11 18:43:55 faldara sensors[749]: acpitz-acpi-0
Dec 11 18:43:55 faldara sensors[749]: Adapter: ACPI interface
Dec 11 18:43:55 faldara sensors[749]: temp1:        +27.8=C2=B0C
Dec 11 18:43:55 faldara sensors[749]: temp2:        +29.8=C2=B0C
Dec 11 18:43:55 faldara sensors[749]: nvme-pci-0700
Dec 11 18:43:55 faldara sensors[749]: Adapter: PCI adapter
Dec 11 18:43:55 faldara sensors[749]: Composite:    +41.9=C2=B0C  (low  =3D=
  -5.2=C2=B0C, high =3D +83.8=C2=B0C)
Dec 11 18:43:55 faldara sensors[749]:                        (crit =3D +87.=
8=C2=B0C)
Dec 11 18:43:55 faldara systemd[1]: Finished Initialize hardware monitoring=
 sensors.
Dec 11 18:43:55 faldara systemd-resolved[659]: Using system hostname 'falda=
ra'.
Dec 11 18:43:55 faldara systemd[1]: Started Network Name Resolution.
Dec 11 18:43:55 faldara systemd[1]: Reached target Host and Network Name Lo=
okups.
Dec 11 18:43:55 faldara smartd[705]: smartd 7.2 2020-12-30 r5155 [x86_64-li=
nux-6.7.0-rc5] (local build)
Dec 11 18:43:55 faldara smartd[705]: Copyright (C) 2002-20, Bruce Allen, Ch=
ristian Franke, www.smartmontools.org
Dec 11 18:43:55 faldara smartd[705]: Opened configuration file /etc/smartd.=
conf
Dec 11 18:43:55 faldara smartd[705]: Drive: DEVICESCAN, implied '-a' Direct=
ive on line 21 of file /etc/smartd.conf
Dec 11 18:43:55 faldara smartd[705]: Configuration file /etc/smartd.conf wa=
s parsed, found DEVICESCAN, scanning devices
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda, type changed from 's=
csi' to 'sat'
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], opened
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5414103, WWN:5-0014ee-25e47b53d, FW:15.01H15, 1.00 TB
Dec 11 18:43:55 faldara systemd[1]: Started User Login Management.
Dec 11 18:43:55 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.systemd1'
Dec 11 18:43:55 faldara systemd[1]: Started Avahi mDNS/DNS-SD Stack.
Dec 11 18:43:55 faldara systemd[1]: Started WPA supplicant.
Dec 11 18:43:55 faldara wpa_supplicant[708]: Successfully initialized wpa_s=
upplicant
Dec 11 18:43:55 faldara systemd[1]: Reached target Network.
Dec 11 18:43:55 faldara avahi-daemon[697]: Successfully called chroot().
Dec 11 18:43:55 faldara avahi-daemon[697]: Successfully dropped remaining c=
apabilities.
Dec 11 18:43:55 faldara avahi-daemon[697]: No service file found in /etc/av=
ahi/services.
Dec 11 18:43:55 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface lo.IPv6 with address ::1.
Dec 11 18:43:55 faldara avahi-daemon[697]: New relevant interface lo.IPv6 f=
or mDNS.
Dec 11 18:43:55 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface lo.IPv4 with address 127.0.0.1.
Dec 11 18:43:55 faldara avahi-daemon[697]: New relevant interface lo.IPv4 f=
or mDNS.
Dec 11 18:43:55 faldara avahi-daemon[697]: Network interface enumeration co=
mpleted.
Dec 11 18:43:55 faldara avahi-daemon[697]: Registering new address record f=
or ::1 on lo.*.
Dec 11 18:43:55 faldara avahi-daemon[697]: Registering new address record f=
or 127.0.0.1 on lo.IPv4.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], found in smart=
d database: Western Digital Blue
Dec 11 18:43:55 faldara systemd[1]: Starting CUPS Scheduler...
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in fast remote=
 file copy program daemon being skipped.
Dec 11 18:43:55 faldara systemd[1]: Starting Permit User Sessions...
Dec 11 18:43:55 faldara systemd[1]: Started Unattended Upgrades Shutdown.
Dec 11 18:43:55 faldara systemd[1]: Started Switcheroo Control Proxy servic=
e.
Dec 11 18:43:55 faldara systemd[1]: Condition check resulted in Manage Soun=
d Card State (restore and store) being skipped.
Dec 11 18:43:55 faldara systemd[1]: Starting Save/Restore Sound Card State.=
..
Dec 11 18:43:55 faldara systemd[1]: Finished Permit User Sessions.
Dec 11 18:43:55 faldara systemd[1]: Starting Light Display Manager...
Dec 11 18:43:55 faldara systemd[1]: Starting Hold until boot process finish=
es up...
Dec 11 18:43:55 faldara polkitd[704]: started daemon version 0.105 using au=
thority implementation `local' version `0.105'
Dec 11 18:43:55 faldara systemd[1]: Started Authorization Manager.
Dec 11 18:43:55 faldara systemd[1]: Starting Modem Manager...
Dec 11 18:43:55 faldara systemd[1]: Finished Save/Restore Sound Card State.
Dec 11 18:43:55 faldara systemd[1]: Reached target Sound Card.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], is SMART capab=
le. Adding to "monitor" list.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.st=
ate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb, type changed from 's=
csi' to 'sat'
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], opened
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5390305, WWN:5-0014ee-25e47b58b, FW:15.01H15, 1.00 TB
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], found in smart=
d database: Western Digital Blue
Dec 11 18:43:55 faldara systemd[1]: Received SIGRTMIN+21 from PID 266 (plym=
outhd).
Dec 11 18:43:55 faldara systemd[1]: Received SIGRTMIN+21 from PID 266 (plym=
outhd).
Dec 11 18:43:55 faldara systemd[1]: Finished Hold until boot process finish=
es up.
Dec 11 18:43:55 faldara ModemManager[773]: <info>  ModemManager (version 1.=
14.12) starting in system bus...
Dec 11 18:43:55 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.Accounts' unit=3D'accounts-daemon.service' =
requested by ':1.10' (uid=3D0 pid=3D771 comm=3D"/usr/sbin/lightdm ")
Dec 11 18:43:55 faldara accounts-daemon[695]: started daemon version 0.6.55
Dec 11 18:43:55 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.Accounts'
Dec 11 18:43:55 faldara systemd[1]: Started Getty on tty1.
Dec 11 18:43:55 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.ColorManager' unit=3D'colord.service' reque=
sted by ':1.12' (uid=3D0 pid=3D767 comm=3D"/usr/sbin/cupsd -l ")
Dec 11 18:43:55 faldara systemd[1]: Reached target Login Prompts.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], is SMART capab=
le. Adding to "monitor" list.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.st=
ate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc, type changed from 's=
csi' to 'sat'
Dec 11 18:43:55 faldara systemd[1]: Started Light Display Manager.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], opened
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], WDC WD10EZEX-0=
0KUWA0, S/N:WD-WCC1S5386787, WWN:5-0014ee-25e47b48d, FW:15.01H15, 1.00 TB
Dec 11 18:43:55 faldara systemd[1]: Started Accounts Service.
Dec 11 18:43:55 faldara systemd[1]: Starting Manage, Install and Generate C=
olor Profiles...
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], found in smart=
d database: Western Digital Blue
Dec 11 18:43:55 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.ColorManager'
Dec 11 18:43:55 faldara systemd[1]: Started Manage, Install and Generate Co=
lor Profiles.
Dec 11 18:43:55 faldara systemd[1]: Started Modem Manager.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], is SMART capab=
le. Adding to "monitor" list.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], state read fro=
m /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.st=
ate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/nvme0, opened
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/nvme0, WDS500G1X0E-00AFY0=
, S/N:204318800637, FW:611100WD, 500 GB
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/nvme0, is SMART capable. =
Adding to "monitor" list.
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/nvme0, state read from /v=
ar/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Dec 11 18:43:55 faldara smartd[705]: Monitoring 3 ATA/SATA, 0 SCSI/SAS and =
1 NVMe devices
Dec 11 18:43:55 faldara kernel: scsi 8:0:0:0: Direct-Access     General  UD=
isk            5.00 PQ: 0 ANSI: 2
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: Attached scsi generic sg4 type 0
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] 61440000 512-byte logical=
 blocks: (31.5 GB/29.3 GiB)
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] Write Protect is off
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] Mode Sense: 0b 00 00 08
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] No Caching mode page found
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] Assuming drive cache: wri=
te through
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 114 to 113
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 115 to 114
Dec 11 18:43:55 faldara kernel:  sdd: sdd1 sdd2
Dec 11 18:43:55 faldara kernel: sd 8:0:0:0: [sdd] Attached SCSI removable d=
isk
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], 1 Currently un=
readable (pending) sectors
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], 1 Offline unco=
rrectable sectors
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], SMART Usage At=
tribute: 194 Temperature_Celsius changed from 116 to 115
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sda [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.s=
tate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdb [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.s=
tate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/sdc [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.s=
tate
Dec 11 18:43:55 faldara smartd[705]: Device: /dev/nvme0, state written to /=
var/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Dec 11 18:43:55 faldara systemd[1]: Started Self Monitoring and Reporting T=
echnology (SMART) Daemon.
Dec 11 18:43:56 faldara audit[767]: AVC apparmor=3D"DENIED" operation=3D"ca=
pable" class=3D"cap" profile=3D"/usr/sbin/cupsd" pid=3D767 comm=3D"cupsd" c=
apability=3D12  capname=3D"net_admin"
Dec 11 18:43:56 faldara systemd[1]: Started CUPS Scheduler.
Dec 11 18:43:56 faldara systemd[1]: Started Make remote CUPS printers avail=
able locally.
Dec 11 18:43:56 faldara systemd[1]: Reached target Multi-User System.
Dec 11 18:43:56 faldara systemd[1]: Reached target Graphical Interface.
Dec 11 18:43:56 faldara systemd[1]: Starting Update UTMP about System Runle=
vel Changes...
Dec 11 18:43:56 faldara systemd[1]: systemd-update-utmp-runlevel.service: S=
ucceeded.
Dec 11 18:43:56 faldara systemd[1]: Finished Update UTMP about System Runle=
vel Changes.
Dec 11 18:43:56 faldara systemd[1]: Startup finished in 16.566s (firmware) =
+ 36.360s (loader) + 10.307s (kernel) + 2.209s (userspace) =3D 1min 5.443s.
Dec 11 18:43:56 faldara avahi-daemon[697]: Server startup complete. Host na=
me is faldara.local. Local service cookie is 1867175595.
Dec 11 18:43:56 faldara kernel: [drm] Unknown EDID CEA parser results
Dec 11 18:43:57 faldara kernel: [drm] Unknown EDID CEA parser results
Dec 11 18:43:57 faldara lightdm[827]: pam_unix(lightdm-greeter:session): se=
ssion opened for user lightdm(uid=3D118) by (uid=3D0)
Dec 11 18:43:57 faldara systemd[1]: Created slice User Slice of UID 118.
Dec 11 18:43:57 faldara systemd[1]: Starting User Runtime Directory /run/us=
er/118...
Dec 11 18:43:57 faldara systemd-logind[707]: New session c1 of user lightdm.
Dec 11 18:43:57 faldara systemd[1]: Finished User Runtime Directory /run/us=
er/118.
Dec 11 18:43:57 faldara systemd[1]: Starting User Manager for UID 118...
Dec 11 18:43:57 faldara systemd[831]: pam_unix(systemd-user:session): sessi=
on opened for user lightdm(uid=3D118) by (uid=3D0)
Dec 11 18:43:57 faldara systemd[831]: Queued start job for default target M=
ain User Target.
Dec 11 18:43:57 faldara systemd[831]: Created slice User Application Slice.
Dec 11 18:43:57 faldara systemd[831]: Reached target Paths.
Dec 11 18:43:57 faldara systemd[831]: Reached target Timers.
Dec 11 18:43:57 faldara systemd[831]: Starting D-Bus User Message Bus Socke=
t.
Dec 11 18:43:57 faldara systemd[831]: Listening on GnuPG network certificat=
e management daemon.
Dec 11 18:43:57 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache (access for web browsers).
Dec 11 18:43:57 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache (restricted).
Dec 11 18:43:57 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t (ssh-agent emulation).
Dec 11 18:43:57 faldara systemd[831]: Listening on GnuPG cryptographic agen=
t and passphrase cache.
Dec 11 18:43:57 faldara systemd[831]: Listening on Multimedia System.
Dec 11 18:43:57 faldara systemd[831]: Listening on debconf communication so=
cket.
Dec 11 18:43:57 faldara systemd[831]: Listening on Sound System.
Dec 11 18:43:57 faldara systemd[831]: Listening on D-Bus User Message Bus S=
ocket.
Dec 11 18:43:57 faldara systemd[831]: Reached target Sockets.
Dec 11 18:43:57 faldara systemd[831]: Reached target Basic System.
Dec 11 18:43:57 faldara systemd[1]: Started User Manager for UID 118.
Dec 11 18:43:57 faldara systemd[831]: Started Multimedia Service.
Dec 11 18:43:57 faldara systemd[1]: Started Session c1 of user lightdm.
Dec 11 18:43:57 faldara systemd[831]: Starting Sound Service...
Dec 11 18:43:57 faldara systemd[831]: Starting Tracker metadata extractor...
Dec 11 18:43:57 faldara systemd[831]: Starting Tracker file system data min=
er...
Dec 11 18:43:57 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.RealtimeKit1' unit=3D'rtkit-daemon.service'=
 requested by ':1.25' (uid=3D118 pid=3D846 comm=3D"/usr/bin/pipewire ")
Dec 11 18:43:57 faldara systemd[1]: Starting RealtimeKit Scheduling Policy =
Service...
Dec 11 18:43:57 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.RealtimeKit1'
Dec 11 18:43:57 faldara systemd[1]: Started RealtimeKit Scheduling Policy S=
ervice.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Successfully called chroot.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Successfully dropped privileges.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Successfully limited resources.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Running.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Canary thread running.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Watchdog thread running.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Successfully made thread 846 of =
process 846 owned by '118' high priority at nice level -11.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Supervising 1 threads of 1 proce=
sses of 1 users.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Successfully made thread 851 of =
process 846 owned by '118' RT at priority 20.
Dec 11 18:43:57 faldara rtkit-daemon[852]: Supervising 2 threads of 1 proce=
sses of 1 users.
Dec 11 18:43:57 faldara tracker-miner-f[849]: Set scheduler policy to SCHED=
_IDLE
Dec 11 18:43:57 faldara tracker-miner-f[849]: Setting priority nice level t=
o 19
Dec 11 18:43:57 faldara tracker-extract[848]: Set scheduler policy to SCHED=
_IDLE
Dec 11 18:43:57 faldara tracker-extract[848]: Setting priority nice level t=
o 19
Dec 11 18:43:58 faldara systemd[831]: Started D-Bus User Message Bus.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Successfully made thread 847 of =
process 847 owned by '118' high priority at nice level -11.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 3 threads of 2 proce=
sses of 1 users.
Dec 11 18:43:58 faldara pipewire[846]: Failed to receive portal pid: org.fr=
eedesktop.DBus.Error.NameHasNoOwner: Could not get PID of name 'org.freedes=
ktop.portal.Desktop': no such name
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.Daemon' unit=3D'gvfs-daemo=
n.service' requested by ':1.4' (uid=3D118 pid=3D849 comm=3D"/usr/libexec/tr=
acker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service...
Dec 11 18:43:58 faldara rtkit-daemon[852]: Successfully made thread 861 of =
process 861 owned by '118' high priority at nice level -11.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 4 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Successfully made thread 875 of =
process 861 owned by '118' RT at priority 20.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 5 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.Daemon'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOCUMENTS. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &MUSIC. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &PICTURES. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &VIDEOS. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOWNLOAD. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &DOCUMENTS. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &MUSIC. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &PICTURES. Ignoring this location.
Dec 11 18:43:58 faldara tracker-miner-f[849]: Unable to get XDG user direct=
ory path for special directory &VIDEOS. Ignoring this location.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.UDisks2VolumeMonitor' unit=
=3D'gvfs-udisks2-volume-monitor.service' requested by ':1.4' (uid=3D118 pid=
=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service -=
 disk device monitor...
Dec 11 18:43:58 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UDisks2' unit=3D'udisks2.service' requested=
 by ':1.29' (uid=3D118 pid=3D882 comm=3D"/usr/libexec/gvfs-udisks2-volume-m=
onitor ")
Dec 11 18:43:58 faldara dbus-daemon[699]: [system] Activation via systemd f=
ailed for unit 'udisks2.service': Unit udisks2.service is masked.
Dec 11 18:43:58 faldara gvfs-udisks2-vo[882]: monitor says it's not support=
ed
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.UDisks2VolumeMonitor'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service - =
disk device monitor.
Dec 11 18:43:58 faldara gvfs-udisks2-vo[882]: monitor says it's not support=
ed
Dec 11 18:43:58 faldara tracker-miner-f[849]: remote volume monitor with db=
us name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.MTPVolumeMonitor' unit=3D'=
gvfs-mtp-volume-monitor.service' requested by ':1.4' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service -=
 Media Transfer Protocol monitor...
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.a11y.Bus' unit=3D'at-spi-dbus-bus.=
service' requested by ':1.9' (uid=3D118 pid=3D850 comm=3D"/usr/sbin/lightdm=
-gtk-greeter ")
Dec 11 18:43:58 faldara systemd[831]: Starting Accessibility services bus...
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.MTPVolumeMonitor'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service - =
Media Transfer Protocol monitor.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.GPhoto2VolumeMonitor' unit=
=3D'gvfs-gphoto2-volume-monitor.service' requested by ':1.4' (uid=3D118 pid=
=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service -=
 digital camera monitor...
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.a11y.Bus'
Dec 11 18:43:58 faldara systemd[831]: Started Accessibility services bus.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.GPhoto2VolumeMonitor'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service - =
digital camera monitor.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.GoaVolumeMonitor' unit=3D'=
gvfs-goa-volume-monitor.service' requested by ':1.4' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service -=
 GNOME Online Accounts monitor...
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating service name=3D'org.gnome.OnlineAccounts' requested by ':1.14' (uid=
=3D118 pid=3D916 comm=3D"/usr/libexec/gvfs-goa-volume-monitor ")
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 5 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Successfully made thread 930 of =
process 847 owned by '118' RT at priority 5.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 6 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara ModemManager[773]: <info>  [base-manager] couldn't =
check support for device '/sys/devices/pci0000:00/0000:00:1f.6': not suppor=
ted by any plugin
Dec 11 18:43:58 faldara goa-daemon[920]: goa-daemon version 3.38.0 starting
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating service name=3D'org.gnome.Identity' requested by ':1.16' (uid=3D118=
 pid=3D920 comm=3D"/usr/libexec/goa-daemon ")
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gnome.Identity'
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gnome.OnlineAccounts'
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.GoaVolumeMonitor'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service - =
GNOME Online Accounts monitor.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.gtk.vfs.AfcVolumeMonitor' unit=3D'=
gvfs-afc-volume-monitor.service' requested by ':1.4' (uid=3D118 pid=3D849 c=
omm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[831]: Starting Virtual filesystem service -=
 Apple File Conduit monitor...
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.gtk.vfs.AfcVolumeMonitor'
Dec 11 18:43:58 faldara systemd[831]: Started Virtual filesystem service - =
Apple File Conduit monitor.
Dec 11 18:43:58 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UPower' unit=3D'upower.service' requested b=
y ':1.32' (uid=3D118 pid=3D849 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:43:58 faldara systemd[1]: Starting Daemon for power management...
Dec 11 18:43:58 faldara at-spi-bus-launcher[911]: dbus-daemon[911]: Activat=
ing service name=3D'org.a11y.atspi.Registry' requested by ':1.0' (uid=3D118=
 pid=3D850 comm=3D"/usr/sbin/lightdm-gtk-greeter ")
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 6 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Successfully made thread 987 of =
process 847 owned by '118' RT at priority 5.
Dec 11 18:43:58 faldara rtkit-daemon[852]: Supervising 7 threads of 3 proce=
sses of 1 users.
Dec 11 18:43:58 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.bluez' unit=3D'dbus-org.bluez.service' requested by ':1=
.35' (uid=3D118 pid=3D847 comm=3D"/usr/bin/pulseaudio --daemonize=3Dno --lo=
g-target=3Djo")
Dec 11 18:43:58 faldara systemd[1]: Condition check resulted in Bluetooth s=
ervice being skipped.
Dec 11 18:43:58 faldara systemd[831]: Started Sound Service.
Dec 11 18:43:58 faldara at-spi-bus-launcher[911]: dbus-daemon[911]: Success=
fully activated service 'org.a11y.atspi.Registry'
Dec 11 18:43:58 faldara at-spi-bus-launcher[991]: SpiRegistry daemon is run=
ning with well-known name - org.a11y.atspi.Registry
Dec 11 18:43:58 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.UPower'
Dec 11 18:43:58 faldara systemd[1]: Started Daemon for power management.
Dec 11 18:43:58 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Act=
ivating via systemd: service name=3D'org.freedesktop.Tracker1' unit=3D'trac=
ker-store.service' requested by ':1.4' (uid=3D118 pid=3D849 comm=3D"/usr/li=
bexec/tracker-miner-fs ")
Dec 11 18:43:59 faldara gvfs-udisks2-vo[882]: monitor says it's not support=
ed
Dec 11 18:43:59 faldara tracker-extract[848]: remote volume monitor with db=
us name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Dec 11 18:43:59 faldara systemd[831]: Starting Tracker metadata database st=
ore and lookup manager...
Dec 11 18:43:59 faldara systemd[831]: Started Tracker file system data mine=
r.
Dec 11 18:43:59 faldara systemd[831]: Started Tracker metadata extractor.
Dec 11 18:43:59 faldara systemd[831]: Reached target Main User Target.
Dec 11 18:43:59 faldara dbus-daemon[855]: [session uid=3D118 pid=3D855] Suc=
cessfully activated service 'org.freedesktop.Tracker1'
Dec 11 18:43:59 faldara systemd[831]: Started Tracker metadata database sto=
re and lookup manager.
Dec 11 18:43:59 faldara systemd[831]: Startup finished in 1.272s.
Dec 11 18:43:59 faldara tracker-miner-f[849]: Could not initialize currentl=
y active mount points: GDBus.Error:org.freedesktop.Tracker1.SparqlError.Par=
se: Parser error at byte 311: Expected QuadPattern
Dec 11 18:44:01 faldara lightdm[1006]: gkr-pam: unable to locate daemon con=
trol file
Dec 11 18:44:01 faldara lightdm[1006]: gkr-pam: stashed password to try lat=
er in open session
Dec 11 18:44:01 faldara lightdm[1006]: pam_unix(lightdm:session): session o=
pened for user psusi(uid=3D1000) by (uid=3D0)
Dec 11 18:44:01 faldara systemd[1]: Created slice User Slice of UID 1000.
Dec 11 18:44:01 faldara systemd[1]: Starting User Runtime Directory /run/us=
er/1000...
Dec 11 18:44:01 faldara systemd-logind[707]: New session 2 of user psusi.
Dec 11 18:44:01 faldara systemd[1]: Finished User Runtime Directory /run/us=
er/1000.
Dec 11 18:44:01 faldara systemd[1]: Starting User Manager for UID 1000...
Dec 11 18:44:01 faldara systemd[1012]: pam_unix(systemd-user:session): sess=
ion opened for user psusi(uid=3D1000) by (uid=3D0)
Dec 11 18:44:01 faldara systemd[1012]: Queued start job for default target =
Main User Target.
Dec 11 18:44:01 faldara systemd[1012]: Created slice User Application Slice.
Dec 11 18:44:01 faldara systemd[1012]: Reached target Paths.
Dec 11 18:44:01 faldara systemd[1012]: Reached target Timers.
Dec 11 18:44:01 faldara systemd[1012]: Starting D-Bus User Message Bus Sock=
et.
Dec 11 18:44:01 faldara systemd[1012]: Listening on GnuPG network certifica=
te management daemon.
Dec 11 18:44:01 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache (access for web browsers).
Dec 11 18:44:01 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache (restricted).
Dec 11 18:44:01 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt (ssh-agent emulation).
Dec 11 18:44:01 faldara systemd[1012]: Listening on GnuPG cryptographic age=
nt and passphrase cache.
Dec 11 18:44:01 faldara systemd[1012]: Listening on Multimedia System.
Dec 11 18:44:01 faldara systemd[1012]: Listening on debconf communication s=
ocket.
Dec 11 18:44:01 faldara systemd[1012]: Listening on Sound System.
Dec 11 18:44:01 faldara systemd[1012]: Listening on D-Bus User Message Bus =
Socket.
Dec 11 18:44:01 faldara systemd[1012]: Reached target Sockets.
Dec 11 18:44:01 faldara systemd[1012]: Reached target Basic System.
Dec 11 18:44:01 faldara systemd[1]: Started User Manager for UID 1000.
Dec 11 18:44:01 faldara systemd[1012]: Started Multimedia Service.
Dec 11 18:44:01 faldara systemd[1]: Started Session 2 of user psusi.
Dec 11 18:44:01 faldara systemd[1012]: Starting Sound Service...
Dec 11 18:44:01 faldara systemd[1012]: Starting Tracker metadata extractor.=
..
Dec 11 18:44:01 faldara systemd[1012]: Starting Tracker file system data mi=
ner...
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1027 of=
 process 1027 owned by '1000' high priority at nice level -11.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 8 threads of 4 proce=
sses of 2 users.
Dec 11 18:44:01 faldara systemd[1012]: Started D-Bus User Message Bus.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1031 of=
 process 1027 owned by '1000' RT at priority 20.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 9 threads of 4 proce=
sses of 2 users.
Dec 11 18:44:01 faldara tracker-miner-f[1030]: Set scheduler policy to SCHE=
D_IDLE
Dec 11 18:44:01 faldara tracker-miner-f[1030]: Setting priority nice level =
to 19
Dec 11 18:44:01 faldara tracker-extract[1029]: Set scheduler policy to SCHE=
D_IDLE
Dec 11 18:44:01 faldara tracker-extract[1029]: Setting priority nice level =
to 19
Dec 11 18:44:01 faldara pipewire[1027]: Failed to receive portal pid: org.f=
reedesktop.DBus.Error.NameHasNoOwner: Could not get PID of name 'org.freede=
sktop.portal.Desktop': no such name
Dec 11 18:44:01 faldara lightdm[1006]: gkr-pam: gnome-keyring-daemon starte=
d properly and unlocked keyring
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.Daemon' unit=3D'gvfs-da=
emon.service' requested by ':1.3' (uid=3D1000 pid=3D1030 comm=3D"/usr/libex=
ec/tracker-miner-fs ")
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1028 of=
 process 1028 owned by '1000' high priority at nice level -11.
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service.=
..
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 10 threads of 5 proc=
esses of 2 users.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1039 of=
 process 1039 owned by '1000' high priority at nice level -11.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 11 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.Daemon'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1044 of=
 process 1039 owned by '1000' RT at priority 20.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 12 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.UDisks2VolumeMonitor' u=
nit=3D'gvfs-udisks2-volume-monitor.service' requested by ':1.3' (uid=3D1000=
 pid=3D1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 12 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service =
- disk device monitor...
Dec 11 18:44:01 faldara rtkit-daemon[852]: Successfully made thread 1074 of=
 process 1028 owned by '1000' RT at priority 5.
Dec 11 18:44:01 faldara rtkit-daemon[852]: Supervising 13 threads of 6 proc=
esses of 2 users.
Dec 11 18:44:01 faldara systemd[1012]: Started Sound Service.
Dec 11 18:44:01 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.UDisks2' unit=3D'udisks2.service' requested=
 by ':1.47' (uid=3D1000 pid=3D1083 comm=3D"/usr/libexec/gvfs-udisks2-volume=
-monitor ")
Dec 11 18:44:01 faldara dbus-daemon[699]: [system] Activation via systemd f=
ailed for unit 'udisks2.service': Unit udisks2.service is masked.
Dec 11 18:44:01 faldara gvfs-udisks2-vo[1083]: monitor says it's not suppor=
ted
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.UDisks2VolumeMonitor'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service -=
 disk device monitor.
Dec 11 18:44:01 faldara gvfs-udisks2-vo[1083]: monitor says it's not suppor=
ted
Dec 11 18:44:01 faldara tracker-miner-f[1030]: remote volume monitor with d=
bus name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.MTPVolumeMonitor' unit=
=3D'gvfs-mtp-volume-monitor.service' requested by ':1.3' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service =
- Media Transfer Protocol monitor...
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.MTPVolumeMonitor'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service -=
 Media Transfer Protocol monitor.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.GPhoto2VolumeMonitor' u=
nit=3D'gvfs-gphoto2-volume-monitor.service' requested by ':1.3' (uid=3D1000=
 pid=3D1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service =
- digital camera monitor...
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.GPhoto2VolumeMonitor'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service -=
 digital camera monitor.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.GoaVolumeMonitor' unit=
=3D'gvfs-goa-volume-monitor.service' requested by ':1.3' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service =
- GNOME Online Accounts monitor...
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating service name=3D'org.gnome.OnlineAccounts' requested by ':1.12' (=
uid=3D1000 pid=3D1118 comm=3D"/usr/libexec/gvfs-goa-volume-monitor ")
Dec 11 18:44:01 faldara goa-daemon[1126]: goa-daemon version 3.38.0 starting
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating service name=3D'org.gnome.Identity' requested by ':1.16' (uid=3D=
1000 pid=3D1126 comm=3D"/usr/libexec/goa-daemon ")
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gnome.Identity'
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gnome.OnlineAccounts'
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.GoaVolumeMonitor'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service -=
 GNOME Online Accounts monitor.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.gtk.vfs.AfcVolumeMonitor' unit=
=3D'gvfs-afc-volume-monitor.service' requested by ':1.3' (uid=3D1000 pid=3D=
1030 comm=3D"/usr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara gvfs-udisks2-vo[1083]: monitor says it's not suppor=
ted
Dec 11 18:44:01 faldara tracker-extract[1029]: remote volume monitor with d=
bus name org.gtk.vfs.UDisks2VolumeMonitor is not supported
Dec 11 18:44:01 faldara systemd[1012]: Starting Virtual filesystem service =
- Apple File Conduit monitor...
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.gtk.vfs.AfcVolumeMonitor'
Dec 11 18:44:01 faldara systemd[1012]: Started Virtual filesystem service -=
 Apple File Conduit monitor.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating service name=3D'org.freedesktop.portal.IBus' requested by ':1.18=
' (uid=3D1000 pid=3D1169 comm=3D"/usr/bin/ibus-daemon --daemonize --xim ")
Dec 11 18:44:01 faldara systemd[1012]: Started Tracker metadata extractor.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.freedesktop.portal.IBus'
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Activating via systemd: service name=3D'org.freedesktop.Tracker1' unit=3D't=
racker-store.service' requested by ':1.3' (uid=3D1000 pid=3D1030 comm=3D"/u=
sr/libexec/tracker-miner-fs ")
Dec 11 18:44:01 faldara systemd[1012]: Starting Tracker metadata database s=
tore and lookup manager...
Dec 11 18:44:01 faldara systemd[1012]: Started Tracker file system data min=
er.
Dec 11 18:44:01 faldara systemd[1012]: Reached target Main User Target.
Dec 11 18:44:01 faldara dbus-daemon[1033]: [session uid=3D1000 pid=3D1033] =
Successfully activated service 'org.freedesktop.Tracker1'
Dec 11 18:44:01 faldara systemd[1012]: Started Tracker metadata database st=
ore and lookup manager.
Dec 11 18:44:01 faldara systemd[1012]: Startup finished in 307ms.
Dec 11 18:44:01 faldara tracker-miner-f[1030]: Could not initialize current=
ly active mount points: GDBus.Error:org.freedesktop.Tracker1.SparqlError.Pa=
rse: Parser error at byte 11: Expected QuadPattern
Dec 11 18:44:01 faldara systemd[1]: Stopping Session c1 of user lightdm.
Dec 11 18:44:01 faldara systemd[831]: pulseaudio.service: Succeeded.
Dec 11 18:44:01 faldara lightdm[827]: pam_unix(lightdm-greeter:session): se=
ssion closed for user lightdm
Dec 11 18:44:02 faldara kernel: [drm] Unknown EDID CEA parser results
Dec 11 18:44:02 faldara rtkit-daemon[852]: Supervising 10 threads of 5 proc=
esses of 2 users.
Dec 11 18:44:02 faldara systemd[1]: session-c1.scope: Succeeded.
Dec 11 18:44:02 faldara systemd[1]: Stopped Session c1 of user lightdm.
Dec 11 18:44:02 faldara systemd[1]: session-c1.scope: Consumed 1.112s CPU t=
ime.
Dec 11 18:44:02 faldara rtkit-daemon[852]: Successfully made thread 1228 of=
 process 1028 owned by '1000' RT at priority 5.
Dec 11 18:44:02 faldara rtkit-daemon[852]: Supervising 11 threads of 5 proc=
esses of 2 users.
Dec 11 18:44:02 faldara systemd-logind[707]: Removed session c1.
Dec 11 18:44:02 faldara rtkit-daemon[852]: Supervising 10 threads of 5 proc=
esses of 2 users.
Dec 11 18:44:02 faldara rtkit-daemon[852]: Successfully made thread 1240 of=
 process 1028 owned by '1000' RT at priority 5.
Dec 11 18:44:02 faldara rtkit-daemon[852]: Supervising 11 threads of 5 proc=
esses of 2 users.
Dec 11 18:44:08 faldara systemd-networkd[396]: enp0s31f6: Gained carrier
Dec 11 18:44:08 faldara kernel: e1000e 0000:00:1f.6 enp0s31f6: NIC Link is =
Up 100 Mbps Full Duplex, Flow Control: Rx/Tx
Dec 11 18:44:09 faldara systemd[831]: tracker-extract.service: Succeeded.
Dec 11 18:44:10 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Dec 11 18:44:10 faldara systemd-networkd[396]: enp0s31f6: Gained IPv6LL
Dec 11 18:44:10 faldara avahi-daemon[697]: New relevant interface enp0s31f6=
.IPv6 for mDNS.
Dec 11 18:44:10 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:10 faldara avahi-daemon[697]: Registering new address record f=
or fe80::3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:11 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:11 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Dec 11 18:44:11 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address 2603:9001:300:68d7:3ad5:47ff:fe0f:488=
a.
Dec 11 18:44:11 faldara avahi-daemon[697]: Registering new address record f=
or 2603:9001:300:68d7:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:11 faldara avahi-daemon[697]: Withdrawing address record for f=
e80::3ad5:47ff:fe0f:488a on enp0s31f6.
Dec 11 18:44:11 faldara avahi-daemon[697]: Registering new address record f=
or fd11:e97f:83ec:0:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:11 faldara sudo[1268]:    psusi : TTY=3Dpts/0 ; PWD=3D/home/ps=
usi ; USER=3Droot ; COMMAND=3D/bin/bash
Dec 11 18:44:11 faldara sudo[1268]: pam_unix(sudo:session): session opened =
for user root(uid=3D0) by (uid=3D1000)
Dec 11 18:44:11 faldara systemd[1012]: tracker-extract.service: Succeeded.
Dec 11 18:44:11 faldara systemd-networkd[396]: enp0s31f6: DHCPv4 address 19=
2.168.1.109/24 via 192.168.1.1
Dec 11 18:44:11 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.109.
Dec 11 18:44:11 faldara dbus-daemon[699]: [system] Activating via systemd: =
service name=3D'org.freedesktop.hostname1' unit=3D'dbus-org.freedesktop.hos=
tname1.service' requested by ':1.3' (uid=3D102 pid=3D396 comm=3D"/lib/syste=
md/systemd-networkd ")
Dec 11 18:44:11 faldara avahi-daemon[697]: New relevant interface enp0s31f6=
.IPv4 for mDNS.
Dec 11 18:44:11 faldara avahi-daemon[697]: Registering new address record f=
or 192.168.1.109 on enp0s31f6.IPv4.
Dec 11 18:44:11 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:11 faldara systemd[1]: Starting Hostname Service...
Dec 11 18:44:11 faldara dbus-daemon[699]: [system] Successfully activated s=
ervice 'org.freedesktop.hostname1'
Dec 11 18:44:11 faldara systemd[1]: Started Hostname Service.
Dec 11 18:44:12 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:12 faldara systemd[1]: Stopping User Manager for UID 118...
Dec 11 18:44:12 faldara systemd[831]: Stopped target Main User Target.
Dec 11 18:44:12 faldara systemd[831]: Stopping Accessibility services bus...
Dec 11 18:44:12 faldara tracker-miner-fs[849]: Received signal:15->'Termina=
ted'
Dec 11 18:44:12 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Dec 11 18:44:12 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Dec 11 18:44:12 faldara tracker-miner-f[849]: Error while sending AddMatch(=
) message: The connection is closed
Dec 11 18:44:12 faldara systemd[831]: Stopping D-Bus User Message Bus...
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service -=
 Apple File Conduit monitor...
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service...
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service -=
 GNOME Online Accounts monitor...
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service -=
 digital camera monitor...
Dec 11 18:44:12 faldara tracker-miner-fs[849]: OK
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service -=
 Media Transfer Protocol monitor...
Dec 11 18:44:12 faldara systemd[831]: Stopping Virtual filesystem service -=
 disk device monitor...
Dec 11 18:44:12 faldara systemd[831]: Stopping Multimedia Service...
Dec 11 18:44:12 faldara systemd[831]: Stopping Tracker file system data min=
er...
Dec 11 18:44:12 faldara systemd[831]: Stopping Tracker metadata database st=
ore and lookup manager...
Dec 11 18:44:12 faldara systemd[831]: gvfs-udisks2-volume-monitor.service: =
Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service - =
disk device monitor.
Dec 11 18:44:12 faldara systemd[831]: gvfs-mtp-volume-monitor.service: Succ=
eeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service - =
Media Transfer Protocol monitor.
Dec 11 18:44:12 faldara pipewire-media-session[861]: error id:0 seq:158 res=
:-32 (Broken pipe): connection error
Dec 11 18:44:12 faldara systemd[831]: gvfs-gphoto2-volume-monitor.service: =
Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service - =
digital camera monitor.
Dec 11 18:44:12 faldara systemd[831]: gvfs-goa-volume-monitor.service: Succ=
eeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service - =
GNOME Online Accounts monitor.
Dec 11 18:44:12 faldara systemd[831]: at-spi-dbus-bus.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Accessibility services bus.
Dec 11 18:44:12 faldara systemd[831]: dbus.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped D-Bus User Message Bus.
Dec 11 18:44:12 faldara systemd[1012]: run-user-118-gvfs.mount: Succeeded.
Dec 11 18:44:12 faldara systemd[1]: run-user-118-gvfs.mount: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: run-user-118-gvfs.mount: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: gvfs-daemon.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service.
Dec 11 18:44:12 faldara tracker-store[998]: Received signal:15->'Terminated'
Dec 11 18:44:12 faldara tracker-store[998]: OK
Dec 11 18:44:12 faldara systemd[831]: tracker-store.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Tracker metadata database sto=
re and lookup manager.
Dec 11 18:44:12 faldara systemd[831]: tracker-miner-fs.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Tracker file system data mine=
r.
Dec 11 18:44:12 faldara systemd[831]: gvfs-afc-volume-monitor.service: Succ=
eeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Virtual filesystem service - =
Apple File Conduit monitor.
Dec 11 18:44:12 faldara systemd[831]: pipewire.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Stopped Multimedia Service.
Dec 11 18:44:12 faldara systemd[831]: Stopped target Basic System.
Dec 11 18:44:12 faldara systemd[831]: Stopped target Paths.
Dec 11 18:44:12 faldara systemd[831]: Stopped target Sockets.
Dec 11 18:44:12 faldara systemd[831]: Stopped target Timers.
Dec 11 18:44:12 faldara systemd[831]: dbus.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed D-Bus User Message Bus Socket.
Dec 11 18:44:12 faldara systemd[831]: dirmngr.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed GnuPG network certificate mana=
gement daemon.
Dec 11 18:44:12 faldara systemd[831]: gpg-agent-browser.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache (access for web browsers).
Dec 11 18:44:12 faldara systemd[831]: gpg-agent-extra.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache (restricted).
Dec 11 18:44:12 faldara systemd[831]: gpg-agent-ssh.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed GnuPG cryptographic agent (ssh=
-agent emulation).
Dec 11 18:44:12 faldara systemd[831]: gpg-agent.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed GnuPG cryptographic agent and =
passphrase cache.
Dec 11 18:44:12 faldara systemd[831]: pipewire.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed Multimedia System.
Dec 11 18:44:12 faldara systemd[831]: pk-debconf-helper.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed debconf communication socket.
Dec 11 18:44:12 faldara systemd[831]: pulseaudio.socket: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Closed Sound System.
Dec 11 18:44:12 faldara systemd[831]: Removed slice User Application Slice.
Dec 11 18:44:12 faldara systemd[831]: app.slice: Consumed 1.052s CPU time.
Dec 11 18:44:12 faldara systemd[831]: Reached target Shutdown.
Dec 11 18:44:12 faldara systemd[831]: systemd-exit.service: Succeeded.
Dec 11 18:44:12 faldara systemd[831]: Finished Exit the Session.
Dec 11 18:44:12 faldara systemd[831]: Reached target Exit the Session.
Dec 11 18:44:12 faldara systemd[832]: pam_unix(systemd-user:session): sessi=
on closed for user lightdm
Dec 11 18:44:12 faldara systemd[1]: user@118.service: Succeeded.
Dec 11 18:44:12 faldara systemd[1]: Stopped User Manager for UID 118.
Dec 11 18:44:12 faldara systemd[1]: user@118.service: Consumed 1.205s CPU t=
ime.
Dec 11 18:44:12 faldara systemd[1]: Stopping User Runtime Directory /run/us=
er/118...
Dec 11 18:44:12 faldara systemd[1012]: run-user-118.mount: Succeeded.
Dec 11 18:44:12 faldara systemd[1]: run-user-118.mount: Succeeded.
Dec 11 18:44:12 faldara systemd[1]: user-runtime-dir@118.service: Succeeded.
Dec 11 18:44:12 faldara systemd[1]: Stopped User Runtime Directory /run/use=
r/118.
Dec 11 18:44:12 faldara systemd[1]: Removed slice User Slice of UID 118.
Dec 11 18:44:12 faldara systemd[1]: user-118.slice: Consumed 2.339s CPU tim=
e.
Dec 11 18:44:13 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:15 faldara ModemManager[773]: <info>  [sleep-monitor] system i=
s about to suspend
Dec 11 18:44:15 faldara systemd[1]: Reached target Sleep.
Dec 11 18:44:15 faldara systemd[1]: Starting Suspend...
Dec 11 18:44:15 faldara systemd-sleep[1289]: Suspending system...
Dec 11 18:44:15 faldara kernel: PM: suspend entry (deep)
Dec 11 18:44:15 faldara kernel: Filesystems sync: 0.031 seconds
Dec 11 18:44:16 faldara kernel: Freezing user space processes
Dec 11 18:44:16 faldara kernel: Freezing user space processes completed (el=
apsed 0.001 seconds)
Dec 11 18:44:16 faldara kernel: OOM killer disabled.
Dec 11 18:44:16 faldara kernel: Freezing remaining freezable tasks
Dec 11 18:44:16 faldara kernel: Freezing remaining freezable tasks complete=
d (elapsed 0.001 seconds)
Dec 11 18:44:16 faldara kernel: printk: Suspending console(s) (use no_conso=
le_suspend to debug)
Dec 11 18:44:16 faldara kernel: serial 00:01: disabled
Dec 11 18:44:16 faldara kernel: e1000e: EEE TX LPI TIMER: 00000011
Dec 11 18:44:16 faldara kernel: sd 4:0:0:0: [sdb] Synchronizing SCSI cache
Dec 11 18:44:16 faldara kernel: sd 1:0:0:0: [sda] Synchronizing SCSI cache
Dec 11 18:44:16 faldara kernel: sd 5:0:0:0: [sdc] Synchronizing SCSI cache
Dec 11 18:44:16 faldara kernel: ata5.00: Entering standby power mode
Dec 11 18:44:16 faldara kernel: ata2.00: Entering standby power mode
Dec 11 18:44:16 faldara kernel: ata6.00: Entering standby power mode
Dec 11 18:44:16 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Dec 11 18:44:16 faldara kernel: [TTM] Buffer eviction failed
Dec 11 18:44:16 faldara kernel: [drm] evicting device resources failed
Dec 11 18:44:16 faldara kernel: amdgpu 0000:03:00.0: PM: pci_pm_suspend(): =
amdgpu_pmops_suspend+0x0/0x80 [amdgpu] returns -19
Dec 11 18:44:16 faldara kernel: amdgpu 0000:03:00.0: PM: dpm_run_callback()=
: pci_pm_suspend+0x0/0x170 returns -19
Dec 11 18:44:16 faldara kernel: amdgpu 0000:03:00.0: PM: failed to suspend =
async: error -19
Dec 11 18:44:16 faldara kernel: PM: Some devices failed to suspend, or earl=
y wake event detected
Dec 11 18:44:16 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
Dec 11 18:44:16 faldara kernel: serial 00:01: activated
Dec 11 18:44:16 faldara kernel: OOM killer enabled.
Dec 11 18:44:16 faldara kernel: Restarting tasks ... done.
Dec 11 18:44:16 faldara kernel: random: crng reseeded on system resumption
Dec 11 18:44:16 faldara kernel: PM: suspend exit
Dec 11 18:44:16 faldara kernel: PM: suspend entry (s2idle)
Dec 11 18:44:16 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Dec 11 18:44:16 faldara kernel: Filesystems sync: 0.010 seconds
Dec 11 18:44:16 faldara kernel: Freezing user space processes
Dec 11 18:44:16 faldara kernel: Freezing user space processes completed (el=
apsed 0.001 seconds)
Dec 11 18:44:16 faldara kernel: OOM killer disabled.
Dec 11 18:44:16 faldara kernel: Freezing remaining freezable tasks
Dec 11 18:44:16 faldara kernel: Freezing remaining freezable tasks complete=
d (elapsed 0.001 seconds)
Dec 11 18:44:16 faldara kernel: printk: Suspending console(s) (use no_conso=
le_suspend to debug)
Dec 11 18:44:16 faldara kernel: amdgpu: Move buffer fallback to memcpy unav=
ailable
Dec 11 18:44:16 faldara kernel: [TTM] Buffer eviction failed
Dec 11 18:44:16 faldara kernel: [drm] evicting device resources failed
Dec 11 18:44:16 faldara kernel: amdgpu 0000:03:00.0: PM: device_prepare(): =
pci_pm_prepare+0x0/0x70 returns -19
Dec 11 18:44:16 faldara kernel: amdgpu 0000:03:00.0: PM: not prepared for p=
ower transition: code -19
Dec 11 18:44:16 faldara kernel: PM: Some devices failed to suspend, or earl=
y wake event detected
Dec 11 18:44:16 faldara kernel: OOM killer enabled.
Dec 11 18:44:16 faldara kernel: Restarting tasks ... done.
Dec 11 18:44:16 faldara kernel: random: crng reseeded on system resumption
Dec 11 18:44:16 faldara kernel: PM: suspend exit
Dec 11 18:44:16 faldara systemd-sleep[1289]: Failed to suspend system. Syst=
em resumed again: No such device
Dec 11 18:44:16 faldara kernel: ata7: SATA link down (SStatus 0 SControl 30=
0)
Dec 11 18:44:16 faldara kernel: ata8: SATA link down (SStatus 0 SControl 30=
0)
Dec 11 18:44:16 faldara systemd[1]: systemd-suspend.service: Main process e=
xited, code=3Dexited, status=3D1/FAILURE
Dec 11 18:44:16 faldara systemd[1]: systemd-suspend.service: Failed with re=
sult 'exit-code'.
Dec 11 18:44:16 faldara systemd[1]: Failed to start Suspend.
Dec 11 18:44:16 faldara systemd[1]: Dependency failed for Suspend.
Dec 11 18:44:16 faldara systemd[1]: suspend.target: Job suspend.target/star=
t failed with result 'dependency'.
Dec 11 18:44:16 faldara systemd-logind[707]: Operation 'sleep' finished.
Dec 11 18:44:16 faldara systemd[1]: Stopped target Sleep.
Dec 11 18:44:16 faldara systemd-networkd[396]: lo: Reset carrier
Dec 11 18:44:16 faldara systemd-networkd[396]: enp0s31f6: DHCP lease lost
Dec 11 18:44:16 faldara ModemManager[773]: <info>  [sleep-monitor] system i=
s resuming
Dec 11 18:44:16 faldara avahi-daemon[697]: Withdrawing address record for 1=
92.168.1.109 on enp0s31f6.
Dec 11 18:44:16 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.109.
Dec 11 18:44:16 faldara avahi-daemon[697]: Interface enp0s31f6.IPv4 no long=
er relevant for mDNS.
Dec 11 18:44:16 faldara kernel: ata3: SATA link down (SStatus 4 SControl 30=
0)
Dec 11 18:44:16 faldara kernel: ata2: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:44:16 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SC=
ontrol 300)
Dec 11 18:44:16 faldara kernel: ata1: SATA link down (SStatus 4 SControl 30=
0)
Dec 11 18:44:16 faldara kernel: ata5: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:44:16 faldara kernel: ata6: SATA link up 6.0 Gbps (SStatus 133 SC=
ontrol 300)
Dec 11 18:44:16 faldara kernel: ata2.00: configured for UDMA/133
Dec 11 18:44:16 faldara kernel: ata2.00: Entering active power mode
Dec 11 18:44:16 faldara kernel: ata5.00: configured for UDMA/133
Dec 11 18:44:16 faldara kernel: ata6.00: configured for UDMA/133
Dec 11 18:44:16 faldara kernel: ata5.00: Entering active power mode
Dec 11 18:44:16 faldara kernel: ata6.00: Entering active power mode
Dec 11 18:44:16 faldara systemd-networkd[396]: enp0s31f6: DHCPv6 lease lost
Dec 11 18:44:16 faldara avahi-daemon[697]: Withdrawing address record for 2=
603:9001:300:68d7:3ad5:47ff:fe0f:488a on enp0s31f6.
Dec 11 18:44:16 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address 2603:9001:300:68d7:3ad5:47ff:fe0f:488=
a.
Dec 11 18:44:16 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address fd11:e97f:83ec:0:3ad5:47ff:fe0f:488a.
Dec 11 18:44:16 faldara systemd-networkd[396]: enp0s31f6: Reset carrier
Dec 11 18:44:16 faldara avahi-daemon[697]: Withdrawing address record for f=
d11:e97f:83ec:0:3ad5:47ff:fe0f:488a on enp0s31f6.
Dec 11 18:44:16 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address fd11:e97f:83ec:0:3ad5:47ff:fe0f:488a.
Dec 11 18:44:16 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Dec 11 18:44:16 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:16 faldara avahi-daemon[697]: Registering new address record f=
or fe80::3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:16 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:16 faldara kernel: ata4.00: configured for UDMA/133
Dec 11 18:44:17 faldara systemd-networkd[396]: enp0s31f6: Lost carrier
Dec 11 18:44:17 faldara systemd-networkd[396]: enp0s31f6: DHCPv6 lease lost
Dec 11 18:44:19 faldara ModemManager[773]: <info>  [base-manager] couldn't =
check support for device '/sys/devices/pci0000:00/0000:00:1f.6': not suppor=
ted by any plugin
Dec 11 18:44:23 faldara dbus-daemon[699]: [system] Failed to activate servi=
ce 'org.bluez': timed out (service_start_timeout=3D25000ms)
Dec 11 18:44:23 faldara pulseaudio[1028]: GetManagedObjects() failed: org.f=
reedesktop.DBus.Error.TimedOut: Failed to activate service 'org.bluez': tim=
ed out (service_start_timeout=3D25000ms)
Dec 11 18:44:30 faldara kernel: e1000e 0000:00:1f.6 enp0s31f6: NIC Link is =
Up 100 Mbps Full Duplex, Flow Control: Rx/Tx
Dec 11 18:44:30 faldara systemd-networkd[396]: enp0s31f6: Gained carrier
Dec 11 18:44:30 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:32 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
Dec 11 18:44:32 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv6 with address 2603:9001:300:68d7:3ad5:47ff:fe0f:488=
a.
Dec 11 18:44:32 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:32 faldara avahi-daemon[697]: Registering new address record f=
or 2603:9001:300:68d7:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:32 faldara avahi-daemon[697]: Withdrawing address record for f=
e80::3ad5:47ff:fe0f:488a on enp0s31f6.
Dec 11 18:44:32 faldara avahi-daemon[697]: Registering new address record f=
or fd11:e97f:83ec:0:3ad5:47ff:fe0f:488a on enp0s31f6.*.
Dec 11 18:44:32 faldara systemd-networkd[396]: enp0s31f6: DHCPv4 address 19=
2.168.1.109/24 via 192.168.1.1
Dec 11 18:44:32 faldara avahi-daemon[697]: Joining mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.109.
Dec 11 18:44:32 faldara avahi-daemon[697]: New relevant interface enp0s31f6=
.IPv4 for mDNS.
Dec 11 18:44:32 faldara avahi-daemon[697]: Registering new address record f=
or 192.168.1.109 on enp0s31f6.IPv4.
Dec 11 18:44:32 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:33 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:33 faldara systemd-timesyncd[667]: Network configuration chang=
ed, trying to establish connection.
Dec 11 18:44:36 faldara kernel: sysrq: Keyboard mode set to system default
Dec 11 18:44:36 faldara systemd-journald[368]: Journal stopped
Dec 11 18:44:37 faldara kernel: sysrq: Terminate All Tasks
Dec 11 18:44:37 faldara systemd-journald[368]: Received SIGTERM.
Dec 11 18:44:37 faldara kernel: BUG: kernel NULL pointer dereference, addre=
ss: 0000000000000000
Dec 11 18:44:37 faldara kernel: #PF: supervisor read access in kernel mode
Dec 11 18:44:37 faldara kernel: #PF: error_code(0x0000) - not-present page
Dec 11 18:44:37 faldara kernel: PGD 0 P4D 0=20
Dec 11 18:44:37 faldara kernel: Oops: 0000 [#1] PREEMPT SMP
Dec 11 18:44:37 faldara kernel: CPU: 0 PID: 707 Comm: systemd-logind Not ta=
inted 6.7.0-rc5 #49
Dec 11 18:44:37 faldara kernel: Hardware name: System manufacturer System P=
roduct Name/Z170 PRO GAMING, BIOS 3805 05/16/2018
Dec 11 18:44:37 faldara kernel: RIP: 0010:dc_resource_state_copy_construct+=
0x27/0x180 [amdgpu]
Dec 11 18:44:37 faldara kernel: Code: 44 00 00 66 0f 1f 00 0f 1f 44 00 00 4=
1 56 41 55 41 54 49 89 f4 55 31 ed 53 48 8b 87 08 5b 00 00 48 89 fb 44 8b a=
e 48 b5 03 00 <48> 8b 00 48 8b 00 80 b8 7f 01 00 00 00 74 07 48 8b ae c0 aa=
 03 00
Dec 11 18:44:37 faldara kernel: RSP: 0018:ffffb66c408775e0 EFLAGS: 00010246
Dec 11 18:44:37 faldara kernel: RAX: 0000000000000000 RBX: ffff8ca282c80000=
 RCX: 0000000000000005
Dec 11 18:44:37 faldara kernel: RDX: 0000000000000010 RSI: ffff8ca2cb280000=
 RDI: ffff8ca282c80000
Dec 11 18:44:37 faldara kernel: RBP: 0000000000000000 R08: 0000000000000000=
 R09: 0000000000000000
Dec 11 18:44:37 faldara kernel: R10: 0000000000000000 R11: 0000000000000000=
 R12: ffff8ca2cb280000
Dec 11 18:44:37 faldara kernel: R13: 0000000000000001 R14: ffffb66c40877650=
 R15: ffff8ca245a14800
Dec 11 18:44:37 faldara kernel: FS:  00007f39ac724980(0000) GS:ffff8ca566c0=
0000(0000) knlGS:0000000000000000
Dec 11 18:44:37 faldara kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Dec 11 18:44:37 faldara kernel: CR2: 0000000000000000 CR3: 0000000143427005=
 CR4: 00000000003706f0
Dec 11 18:44:37 faldara kernel: DR0: 0000000000000000 DR1: 0000000000000000=
 DR2: 0000000000000000
Dec 11 18:44:37 faldara kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0=
 DR7: 0000000000000400
Dec 11 18:44:37 faldara kernel: Call Trace:
Dec 11 18:44:37 faldara kernel:  <TASK>
Dec 11 18:44:37 faldara kernel:  ? __die+0x24/0x70
Dec 11 18:44:37 faldara kernel:  ? page_fault_oops+0x151/0x4a0
Dec 11 18:44:37 faldara kernel:  ? do_user_addr_fault+0x69/0x690
Dec 11 18:44:37 faldara kernel:  ? exc_page_fault+0x78/0x170
Dec 11 18:44:37 faldara kernel:  ? asm_exc_page_fault+0x26/0x30
Dec 11 18:44:37 faldara kernel:  ? dc_resource_state_copy_construct+0x27/0x=
180 [amdgpu]
Dec 11 18:44:37 faldara kernel:  dc_commit_streams+0x19f/0x3f0 [amdgpu]
Dec 11 18:44:37 faldara kernel:  amdgpu_dm_atomic_commit_tail+0x5e8/0x38c0 =
[amdgpu]
Dec 11 18:44:37 faldara kernel:  ? ttm_bo_move_memcpy+0x1a7/0x210 [ttm]
Dec 11 18:44:37 faldara kernel:  ? __bpf_trace_task_rename+0x10/0x10
Dec 11 18:44:37 faldara kernel:  ? __bpf_trace_task_rename+0x10/0x10
Dec 11 18:44:37 faldara kernel:  ? __call_rcu_common.constprop.0+0x1ab/0x690
Dec 11 18:44:37 faldara kernel:  ? child_wait_callback+0x50/0x50
Dec 11 18:44:37 faldara kernel:  ? __schedule+0x37e/0xb20
Dec 11 18:44:37 faldara kernel:  ? __cond_resched+0x1c/0x30
Dec 11 18:44:37 faldara kernel:  ? preempt_count_add+0x6c/0xa0
Dec 11 18:44:37 faldara kernel:  ? _raw_spin_lock_irq+0x1d/0x40
Dec 11 18:44:37 faldara kernel:  ? _raw_spin_unlock_irq+0x1f/0x40
Dec 11 18:44:37 faldara kernel:  ? __wait_for_common+0x1a2/0x1d0
Dec 11 18:44:37 faldara kernel:  ? usleep_range_state+0x90/0x90
Dec 11 18:44:37 faldara kernel:  commit_tail+0x91/0x120 [drm_kms_helper]
Dec 11 18:44:37 faldara kernel:  drm_atomic_helper_commit+0x117/0x140 [drm_=
kms_helper]
Dec 11 18:44:37 faldara kernel:  drm_atomic_commit+0x94/0xf0 [drm]
Dec 11 18:44:37 faldara kernel:  ? __drm_printfn_seq_file+0x20/0x20 [drm]
Dec 11 18:44:37 faldara kernel:  drm_client_modeset_commit_atomic+0x1e4/0x2=
20 [drm]
Dec 11 18:44:37 faldara kernel:  drm_client_modeset_commit_locked+0x5a/0x15=
0 [drm]
Dec 11 18:44:37 faldara kernel:  __drm_fb_helper_restore_fbdev_mode_unlocke=
d+0x59/0xc0 [drm_kms_helper]
Dec 11 18:44:37 faldara kernel:  drm_fb_helper_set_par+0x32/0x40 [drm_kms_h=
elper]
Dec 11 18:44:37 faldara kernel:  fb_set_var+0x1b9/0x3d0
Dec 11 18:44:37 faldara kernel:  ? fsnotify_insert_event+0x11d/0x180
Dec 11 18:44:37 faldara kernel:  ? block_read_full_folio+0x210/0x330
Dec 11 18:44:37 faldara kernel:  fbcon_blank+0x1af/0x2b0
Dec 11 18:44:37 faldara kernel:  do_unblank_screen+0xa5/0x160
Dec 11 18:44:37 faldara kernel:  vt_ioctl+0xc8c/0x1320
Dec 11 18:44:37 faldara kernel:  tty_ioctl+0x33e/0x890
Dec 11 18:44:37 faldara kernel:  ? __seccomp_filter+0x37a/0x5b0
Dec 11 18:44:37 faldara kernel:  __x64_sys_ioctl+0x87/0xc0
Dec 11 18:44:37 faldara kernel:  do_syscall_64+0x59/0x110
Dec 11 18:44:37 faldara kernel:  ? do_syscall_64+0x65/0x110
Dec 11 18:44:37 faldara kernel:  ? do_syscall_64+0x65/0x110
Dec 11 18:44:37 faldara kernel:  ? do_syscall_64+0x65/0x110
Dec 11 18:44:37 faldara kernel:  entry_SYSCALL_64_after_hwframe+0x46/0x4e
Dec 11 18:44:37 faldara kernel: RIP: 0033:0x7f39accff237
Dec 11 18:44:37 faldara kernel: Code: 00 00 00 48 8b 05 59 cc 0d 00 64 c7 0=
0 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 0=
0 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 29 cc 0d 00 f7 d8 64 89=
 01 48
Dec 11 18:44:37 faldara kernel: RSP: 002b:00007ffdc6b36418 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000010
Dec 11 18:44:37 faldara kernel: RAX: ffffffffffffffda RBX: 000055e3a2d325e0=
 RCX: 00007f39accff237
Dec 11 18:44:37 faldara kernel: RDX: 0000000000000000 RSI: 0000000000004b3a=
 RDI: 000000000000001d
Dec 11 18:44:37 faldara kernel: RBP: 000000000000001d R08: 000055e3a2d22d80=
 R09: 00007ffdc6b362c0
Dec 11 18:44:37 faldara kernel: R10: 00000000010ddcaf R11: 0000000000000246=
 R12: 0000000000000000
Dec 11 18:44:37 faldara kernel: R13: 00007ffdc6b36570 R14: 00007ffdc6b36568=
 R15: 00007ffdc6b36580
Dec 11 18:44:37 faldara kernel:  </TASK>
Dec 11 18:44:37 faldara kernel: Modules linked in: intel_rapl_msr intel_rap=
l_common x86_pkg_temp_thermal intel_powerclamp ext4 coretemp crc32_pclmul g=
hash_clmulni_intel sha512_ssse3 snd_hda_codec_realtek sha512_generic sha256=
_ssse3 crc16 snd_hda_codec_generic mbcache sha1_ssse3 snd_hda_codec_hdmi jb=
d2 snd_hda_intel snd_intel_dspcfg snd_hda_codec aesni_intel crypto_simd snd=
_hda_core cryptd eeepc_wmi rapl asus_wmi iTCO_wdt intel_cstate intel_pmc_bx=
t battery uas nls_ascii nls_cp437 snd_pcm ledtrig_audio intel_uncore vfat s=
parse_keymap fat iTCO_vendor_support platform_profile snd_timer wmi_bmof rf=
kill usb_storage ee1004 watchdog snd joydev mxm_wmi evdev efi_pstore sg mei=
_me soundcore mei intel_pmc_core acpi_pad button msr fuse configfs efivarfs=
 ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c crc32c_generic =
xor raid6_pq amdgpu sr_mod cdrom sd_mod hid_generic usbhid hid dm_mod drm_e=
xec amdxcp drm_buddy gpu_sched drm_suballoc_helper i2c_algo_bit drm_ttm_hel=
per ttm drm_display_helper ahci cec libahci xhci_pci drm_kms_helper xhci_hcd
Dec 11 18:44:37 faldara kernel:  libata nvme nvme_core scsi_mod drm t10_pi =
e1000e crc32c_intel i2c_i801 crc64_rocksoft i2c_smbus usbcore crc64 crc_t10=
dif crct10dif_generic crct10dif_pclmul crct10dif_common scsi_common video u=
sb_common fan wmi
Dec 11 18:44:37 faldara kernel: CR2: 0000000000000000
Dec 11 18:44:37 faldara kernel: ---[ end trace 0000000000000000 ]---
Dec 11 18:44:37 faldara kernel: RIP: 0010:dc_resource_state_copy_construct+=
0x27/0x180 [amdgpu]
Dec 11 18:44:37 faldara kernel: Code: 44 00 00 66 0f 1f 00 0f 1f 44 00 00 4=
1 56 41 55 41 54 49 89 f4 55 31 ed 53 48 8b 87 08 5b 00 00 48 89 fb 44 8b a=
e 48 b5 03 00 <48> 8b 00 48 8b 00 80 b8 7f 01 00 00 00 74 07 48 8b ae c0 aa=
 03 00
Dec 11 18:44:37 faldara kernel: RSP: 0018:ffffb66c408775e0 EFLAGS: 00010246
Dec 11 18:44:37 faldara kernel: RAX: 0000000000000000 RBX: ffff8ca282c80000=
 RCX: 0000000000000005
Dec 11 18:44:37 faldara kernel: RDX: 0000000000000010 RSI: ffff8ca2cb280000=
 RDI: ffff8ca282c80000
Dec 11 18:44:37 faldara kernel: RBP: 0000000000000000 R08: 0000000000000000=
 R09: 0000000000000000
Dec 11 18:44:37 faldara kernel: R10: 0000000000000000 R11: 0000000000000000=
 R12: ffff8ca2cb280000
Dec 11 18:44:37 faldara kernel: R13: 0000000000000001 R14: ffffb66c40877650=
 R15: ffff8ca245a14800
Dec 11 18:44:37 faldara kernel: FS:  00007f39ac724980(0000) GS:ffff8ca566c0=
0000(0000) knlGS:0000000000000000
Dec 11 18:44:37 faldara kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Dec 11 18:44:37 faldara kernel: CR2: 0000000000000000 CR3: 0000000143427005=
 CR4: 00000000003706f0
Dec 11 18:44:37 faldara kernel: DR0: 0000000000000000 DR1: 0000000000000000=
 DR2: 0000000000000000
Dec 11 18:44:37 faldara kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0=
 DR7: 0000000000000400
Dec 11 18:44:37 faldara kernel: note: systemd-logind[707] exited with irqs =
disabled
Dec 11 18:44:37 faldara systemd[1]: polkit.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: cups.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: unattended-upgrades.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: systemd-resolved.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: ModemManager.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: colord.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: upower.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: systemd-hostnamed.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: systemd-timesyncd.service: Scheduled re=
start job, restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: lightdm.service: Scheduled restart job,=
 restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: systemd-journald.service: Scheduled res=
tart job, restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: systemd-resolved.service: Scheduled res=
tart job, restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: Starting CUPS Scheduler...
Dec 11 18:44:37 faldara systemd[1]: Started D-Bus System Message Bus.
Dec 11 18:44:37 faldara systemd[1]: Stopped Light Display Manager.
Dec 11 18:44:37 faldara systemd[1]: Starting Light Display Manager...
Dec 11 18:44:37 faldara systemd[1]: Stopping Flush Journal to Persistent St=
orage...
Dec 11 18:44:37 faldara systemd[1]: Stopped Network Name Resolution.
Dec 11 18:44:37 faldara systemd[1]: Starting Network Name Resolution...
Dec 11 18:44:37 faldara systemd[1]: Stopped Network Time Synchronization.
Dec 11 18:44:37 faldara systemd[1]: Starting Network Time Synchronization...
Dec 11 18:44:37 faldara systemd[1]: Stopped Rule-based Manager for Device E=
vents and Files.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Consumed 1.400s =
CPU time.
Dec 11 18:44:37 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Dec 11 18:44:37 faldara systemd[1]: systemd-networkd.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: systemd-journal-flush.service: Succeede=
d.
Dec 11 18:44:37 faldara systemd[1]: Stopped Flush Journal to Persistent Sto=
rage.
Dec 11 18:44:37 faldara systemd[1]: Stopped Journal Service.
Dec 11 18:44:37 faldara systemd[1]: Starting Journal Service...
Dec 11 18:44:37 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Dec 11 18:44:37 faldara systemd[1]: Starting Network Service...
Dec 11 18:44:37 faldara systemd[1]: Starting Manage, Install and Generate C=
olor Profiles...
Dec 11 18:44:37 faldara systemd[1]: Starting Load Kernel Module drm...
Dec 11 18:44:37 faldara systemd[1]: Starting RealtimeKit Scheduling Policy =
Service...
Dec 11 18:44:37 faldara systemd[1]: Started RealtimeKit Scheduling Policy S=
ervice.
Dec 11 18:44:37 faldara systemd[1]: modprobe@drm.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: Finished Load Kernel Module drm.
Dec 11 18:44:37 faldara systemd[1]: Starting Authorization Manager...
Dec 11 18:44:37 faldara systemd[1]: Started Authorization Manager.
Dec 11 18:44:37 faldara systemd[1]: Started Manage, Install and Generate Co=
lor Profiles.
Dec 11 18:44:37 faldara systemd-journald[1505]: Journal started
Dec 11 18:44:37 faldara systemd-journald[1505]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 984.0M, max 4.0G, 3.0G free.
Dec 11 18:44:37 faldara systemd[1]: Started Journal Service.
Dec 11 18:44:37 faldara lightdm[771]: Failed to get D-Bus connection
Dec 11 18:44:36 faldara systemd[1012]: Stopped target Main User Target.
Dec 11 18:44:36 faldara smartd[705]: smartd received signal 15: Terminated
Dec 11 18:44:36 faldara systemd-networkd[396]: enp0s31f6: DHCP lease lost
Dec 11 18:44:36 faldara smartd[705]: Device: /dev/sda [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5414103.ata.s=
tate
Dec 11 18:44:36 faldara systemd[1]: cron.service: Succeeded.
Dec 11 18:44:36 faldara smartd[705]: Device: /dev/sdb [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5390305.ata.s=
tate
Dec 11 18:44:36 faldara systemd[1]: wpa_supplicant.service: Succeeded.
Dec 11 18:44:36 faldara avahi-daemon[697]: Withdrawing address record for 1=
92.168.1.109 on enp0s31f6.
Dec 11 18:44:36 faldara systemd[1]: rtkit-daemon.service: Succeeded.
Dec 11 18:44:36 faldara avahi-daemon[697]: Leaving mDNS multicast group on =
interface enp0s31f6.IPv4 with address 192.168.1.109.
Dec 11 18:44:36 faldara unknown[771]: Error terminating login1 session: The=
 connection is closed
Dec 11 18:44:36 faldara avahi-daemon[697]: Interface enp0s31f6.IPv4 no long=
er relevant for mDNS.
Dec 11 18:44:36 faldara systemd[1]: run-user-1000-gvfs.mount: Succeeded.
Dec 11 18:44:36 faldara smartd[705]: Device: /dev/sdc [SAT], state written =
to /var/lib/smartmontools/smartd.WDC_WD10EZEX_00KUWA0-WD_WCC1S5386787.ata.s=
tate
Dec 11 18:44:36 faldara systemd[1]: smartmontools.service: Succeeded.
Dec 11 18:44:36 faldara smartd[705]: Device: /dev/nvme0, state written to /=
var/lib/smartmontools/smartd.WDS500G1X0E_00AFY0-204318800637.nvme.state
Dec 11 18:44:36 faldara systemd[1012]: Stopping D-Bus User Message Bus...
Dec 11 18:44:36 faldara smartd[705]: smartd is exiting (exit status 0)
Dec 11 18:44:37 faldara systemd-journald[1505]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 984.0M, max 4.0G, 3.0G free.
Dec 11 18:44:36 faldara systemd[1012]: Stopping Virtual filesystem service =
- Apple File Conduit monitor...
Dec 11 18:44:36 faldara ModemManager[773]: <warn>  could not acquire the 'o=
rg.freedesktop.ModemManager1' service name
Dec 11 18:44:36 faldara systemd[1012]: Stopping Virtual filesystem service.=
..
Dec 11 18:44:36 faldara ModemManager[773]: <info>  ModemManager is shut down
Dec 11 18:44:36 faldara systemd[1012]: Stopping Virtual filesystem service =
- GNOME Online Accounts monitor...
Dec 11 18:44:36 faldara systemd[1]: lightdm.service: Main process exited, c=
ode=3Dexited, status=3D1/FAILURE
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.RealtimeKit1' unit=3D'rtkit-daemon.service=
' requested by ':1.2' (uid=3D1000 pid=3D1028 comm=3D"/usr/bin/pulseaudio --=
daemonize=3Dno --log-target=3Djo")
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.login1' unit=3D'dbus-org.freedesktop.login=
1.service' requested by ':1.1' (uid=3D0 pid=3D1497 comm=3D"/usr/sbin/lightd=
m ")
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.ColorManager' unit=3D'colord.service' requ=
ested by ':1.3' (uid=3D0 pid=3D1494 comm=3D"/usr/sbin/cupsd -l ")
Dec 11 18:44:36 faldara systemd[1]: lightdm.service: Failed with result 'ex=
it-code'.
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Successfully activated =
service 'org.freedesktop.RealtimeKit1'
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Successfully called chroot.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Successfully dropped privileges.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Successfully limited resources.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Running.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Canary thread running.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Supervising 0 threads of 0 proc=
esses of 0 users.
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.PolicyKit1' unit=3D'polkit.service' reques=
ted by ':1.4' (uid=3D0 pid=3D1511 comm=3D"/usr/libexec/rtkit-daemon ")
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Watchdog thread running.
Dec 11 18:44:37 faldara polkitd[1514]: started daemon version 0.105 using a=
uthority implementation `local' version `0.105'
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Successfully activated =
service 'org.freedesktop.PolicyKit1'
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Successfully activated =
service 'org.freedesktop.ColorManager'
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Successfully made thread 1478 o=
f process 1028 owned by '1000' RT at priority 5.
Dec 11 18:44:37 faldara rtkit-daemon[1511]: Supervising 1 threads of 1 proc=
esses of 1 users.
Dec 11 18:44:36 faldara systemd[1]: switcheroo-control.service: Succeeded.
Dec 11 18:44:36 faldara systemd[1]: accounts-daemon.service: Succeeded.
Dec 11 18:44:36 faldara systemd-networkd[396]: enp0s31f6: DHCPv6 lease lost
Dec 11 18:44:36 faldara systemd[1]: systemd-udevd.service: Succeeded.
Dec 11 18:44:36 faldara systemd[1]: systemd-udevd.service: Consumed 1.400s =
CPU time.
Dec 11 18:44:36 faldara systemd[1]: systemd-timesyncd.service: Succeeded.
Dec 11 18:44:36 faldara systemd[1]: dbus.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: minidlna.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: systemd-journald.service: Succeeded.
Dec 11 18:44:37 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Dec 11 18:44:37 faldara systemd[1]: Started Network Time Synchronization.
Dec 11 18:44:37 faldara systemd-resolved[1499]: Positive Trust Anchors:
Dec 11 18:44:37 faldara systemd-resolved[1499]: . IN DS 20326 8 2 e06d44b80=
b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Dec 11 18:44:37 faldara systemd-resolved[1499]: Negative trust anchors: 10.=
in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19=
.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.ar=
pa 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-ad=
dr.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.=
in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp hom=
e internal intranet lan local private test
Dec 11 18:44:37 faldara systemd-networkd[1508]: enp0s31f6: Gained IPv6LL
Dec 11 18:44:37 faldara systemd-networkd[1508]: Enumeration completed
Dec 11 18:44:37 faldara systemd[1]: Started Network Service.
Dec 11 18:44:37 faldara systemd-resolved[1499]: Using system hostname 'fald=
ara'.
Dec 11 18:44:37 faldara systemd[1]: Finished Flush Journal to Persistent St=
orage.
Dec 11 18:44:37 faldara systemd[1]: Started Network Name Resolution.
Dec 11 18:44:37 faldara systemd[1]: user@1000.service: Succeeded.
Dec 11 18:44:37 faldara systemd-networkd[1508]: enp0s31f6: DHCPv4 address 1=
92.168.1.109/24 via 192.168.1.1
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.hostname1' unit=3D'dbus-org.freedesktop.ho=
stname1.service' requested by ':1.8' (uid=3D102 pid=3D1508 comm=3D"/lib/sys=
temd/systemd-networkd ")
Dec 11 18:44:37 faldara systemd[1]: Starting Hostname Service...
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Successfully activated =
service 'org.freedesktop.hostname1'
Dec 11 18:44:37 faldara systemd[1]: Started Hostname Service.
Dec 11 18:44:37 faldara systemd[1]: Started CUPS Scheduler.
Dec 11 18:44:37 faldara audit[1494]: AVC apparmor=3D"DENIED" operation=3D"c=
apable" class=3D"cap" profile=3D"/usr/sbin/cupsd" pid=3D1494 comm=3D"cupsd"=
 capability=3D12  capname=3D"net_admin"
Dec 11 18:44:37 faldara kernel: kauditd_printk_skb: 18 callbacks suppressed
Dec 11 18:44:37 faldara kernel: audit: type=3D1400 audit(1702338277.188:30)=
: apparmor=3D"DENIED" operation=3D"capable" class=3D"cap" profile=3D"/usr/s=
bin/cupsd" pid=3D1494 comm=3D"cupsd" capability=3D12  capname=3D"net_admin"
Dec 11 18:44:37 faldara systemd[1]: cups-browsed.service: Succeeded.
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activating via systemd:=
 service name=3D'org.freedesktop.Avahi' unit=3D'dbus-org.freedesktop.Avahi.=
service' requested by ':1.14' (uid=3D113 pid=3D1529 comm=3D"/usr/libexec/co=
lord-sane ")
Dec 11 18:44:37 faldara dbus-daemon[1496]: [system] Activation via systemd =
failed for unit 'dbus-org.freedesktop.Avahi.service': Unit dbus-org.freedes=
ktop.Avahi.service not found.
Dec 11 18:44:37 faldara kernel: sysrq: Kill All Tasks
Dec 11 18:44:37 faldara systemd[1]: rtkit-daemon.service: Main process exit=
ed, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: rtkit-daemon.service: Failed with resul=
t 'signal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 2.
Dec 11 18:44:37 faldara systemd[1]: systemd-journald.service: Scheduled res=
tart job, restart counter is at 2.
Dec 11 18:44:37 faldara systemd[1]: Stopping Flush Journal to Persistent St=
orage...
Dec 11 18:44:37 faldara systemd[1]: Stopped Rule-based Manager for Device E=
vents and Files.
Dec 11 18:44:37 faldara systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Dec 11 18:44:37 faldara systemd[1]: avahi-daemon.service: Main process exit=
ed, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: avahi-daemon.service: Failed with resul=
t 'signal'.
Dec 11 18:44:37 faldara systemd[1]: dbus.service: Main process exited, code=
=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: dbus.service: Failed with result 'signa=
l'.
Dec 11 18:44:37 faldara systemd[1]: colord.service: Main process exited, co=
de=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: colord.service: Failed with result 'sig=
nal'.
Dec 11 18:44:37 faldara systemd[1]: polkit.service: Main process exited, co=
de=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: polkit.service: Failed with result 'sig=
nal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-journal-flush.service: Succeede=
d.
Dec 11 18:44:37 faldara systemd[1]: Stopped Flush Journal to Persistent Sto=
rage.
Dec 11 18:44:37 faldara systemd[1]: Started D-Bus System Message Bus.
Dec 11 18:44:37 faldara systemd[1]: Stopped Journal Service.
Dec 11 18:44:37 faldara systemd[1]: Starting Journal Service...
Dec 11 18:44:37 faldara systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Dec 11 18:44:37 faldara systemd[1]: systemd-networkd.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: systemd-networkd.service: Failed with r=
esult 'signal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-networkd.service: Scheduled res=
tart job, restart counter is at 1.
Dec 11 18:44:37 faldara systemd[1]: Stopped Network Service.
Dec 11 18:44:37 faldara systemd[1]: Starting Network Service...
Dec 11 18:44:37 faldara systemd[1]: systemd-hostnamed.service: Main process=
 exited, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: systemd-hostnamed.service: Failed with =
result 'signal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-resolved.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: systemd-resolved.service: Failed with r=
esult 'signal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-resolved.service: Scheduled res=
tart job, restart counter is at 2.
Dec 11 18:44:37 faldara systemd[1]: Stopped Network Name Resolution.
Dec 11 18:44:37 faldara systemd-journald[1544]: Journal started
Dec 11 18:44:37 faldara systemd-journald[1544]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 976.0M, max 4.0G, 3.0G free.
Dec 11 18:44:37 faldara systemd[1]: lightdm.service: Main process exited, c=
ode=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: lightdm.service: Failed with result 'si=
gnal'.
Dec 11 18:44:37 faldara systemd[1]: Failed to start Light Display Manager.
Dec 11 18:44:37 faldara systemd[1]: cups.service: Main process exited, code=
=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: cups.service: Failed with result 'signa=
l'.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Main process exi=
ted, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Killing process =
1507 (systemd-udevd) with signal SIGKILL.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Killing process =
1507 (systemd-udevd) with signal SIGKILL.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Failed with resu=
lt 'signal'.
Dec 11 18:44:37 faldara systemd[1]: systemd-udevd.service: Unit process 150=
7 (systemd-udevd) remains running after unit stopped.
Dec 11 18:44:37 faldara systemd[1]: systemd-journald.service: Main process =
exited, code=3Dkilled, status=3D9/KILL
Dec 11 18:44:37 faldara systemd[1]: systemd-journald.service: Failed with r=
esult 'signal'.
Dec 11 18:44:37 faldara systemd[1]: Starting Flush Journal to Persistent St=
orage...
Dec 11 18:44:37 faldara systemd[1]: Started Journal Service.
Dec 11 18:44:37 faldara systemd-journald[1544]: System Journal (/var/log/jo=
urnal/84ad0047b8154385bc95456adec0fabe) is 976.0M, max 4.0G, 3.0G free.

--=-=-=--
