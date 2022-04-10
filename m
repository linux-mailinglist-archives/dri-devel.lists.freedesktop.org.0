Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF324FAFFC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 22:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ABA10F866;
	Sun, 10 Apr 2022 20:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5B910F866
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 20:05:23 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-dacc470e03so15149265fac.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbSXGqirVz5TbXJ8F0IIpyj9x6GVNOoe7WE9NDkGKEw=;
 b=aOvKI5V4g2aAAfoJPh5ZxPKQvZKUHVFqQPtbLIn1eS/92WGYZPHmJ8mt+EPw2b90se
 euxI/ag/wnGqX+ORzThQXqz7x5y4wn5kMDhTGm8ggZ7JMy8qT8VlN9w7XGb/GQOfAn5k
 NuO6i9DNRc1DSmMteeRrhcTMhddA5WEZI86YZmALLPexEscb0UcMhWlOUN+AC6ziWC50
 GpdSmizaUF9yCeesNYFWz6SkeCrLShBeaJpLtJ/BLg5Ilr4zJbPizISPP3fm3GfR1o4Q
 ASIHlrhVosP1jHbWvgxhmbZ5TjI8he5PVDdahsBgvb65P/ARrpH8XESctutMmcr2z3sg
 QeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbSXGqirVz5TbXJ8F0IIpyj9x6GVNOoe7WE9NDkGKEw=;
 b=Ng58tkhigoYyav4coG/TWzOYVA0cG8DqTnE+zwbPu8pV7i3yQDMPcZzmdU3FIVT1kS
 KXpQRRapAt8W26TifidpJ25go6LqFxf2Knl1u0YHyWCrGagVkDRkDhWpaMDiPlxdmDl9
 aROXGZTG3dTw2KRDa87fr2pMnHo4l54dsqLToeSCkc5PHv2GFcoNf7OmljHwgcRHlccj
 vHobqUxZeLoJzEb2hfJXI29ZNzlXUSgGCYGNc+DrsnchdpjDb70cXBfU6HvZ4Yf83nL2
 zZL0rwUK/Bq04qQS0f2RORTf96W1IUlfFiejp5fA1PjdBaQkbTGbv700ZWusyxGCQi//
 Kjig==
X-Gm-Message-State: AOAM53093VfxBa0B7WZrm/aOu7NwDnMyIYM1ENLhTzPvufwiqxE46bKW
 s1Asei1r7uVL/uAFDB1xY3rMPwBV4fgAPvqdtAs=
X-Google-Smtp-Source: ABdhPJyMm1VKFLpBh/15KNEEUSIcM71PWOlaj+pgUb8P+vkAKVOwvKsrPEeVMifTFXJloCARITGzQ9LKnqCooT4QcIA=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr11928173oaa.200.1649621121537; Sun, 10
 Apr 2022 13:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
In-Reply-To: <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 10 Apr 2022 14:05:08 -0600
Message-ID: <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > >
> > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > >
> > > > Select the efi framebuffer if efi is enabled.
> > > >
> > > > This appears to be needed for video output to function correctly.
> > > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > >
> > > Hi James,
> > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > hardware. What makes you think it's required?
> >
> > I wasn't getting any HDMI video output without it enabled for some reason,
> > I assume it is doing some sort of initialization needed by gma500
> > during startup.
>
> Then it sounds like you might just be using EFI_FB and not gma500. Can
> you provide the kernel log with drm.debug=0x1f set on kernel
> command-line.

Seems efifb loads first and then hands off to gma500

[    0.000000] Linux version 5.17.1 (buildroot@james-x399)
(x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot
2022.02-439-ge14798fa29) 10.3.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP
PREEMPT Thu Apr 7 00:14:30 MDT 2022
[    0.000000] Command line:
root=PARTUUID=9bc7b8cb-3b3a-994c-9dca-0abbc5055e4d rootwait
drm.debug=0x1f console=tty1
[    0.000000] Disabled fast string operations
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] signal: max sigframe size: 1440
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cf32cfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cf32d000-0x00000000cf374fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cf375000-0x00000000cf385fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000cf386000-0x00000000cf38dfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000cf38e000-0x00000000cf3b5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000cf3b6000-0x00000000cf3b6fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cf3b7000-0x00000000cf3c6fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000cf3c7000-0x00000000cf3d2fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cf3d3000-0x00000000cf3f7fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000cf3f8000-0x00000000cf43afff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000cf43b000-0x00000000cf5bafff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cf5bb000-0x00000000cf6e6fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000cf6e7000-0x00000000cf6effff] usable
[    0.000000] BIOS-e820: [mem 0x00000000cf6f0000-0x00000000cfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed14000-0x00000000fed19fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed8ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000012fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x021da018-0x021ea057] usable ==> usable
[    0.000000] e820: update [mem 0x021da018-0x021ea057] usable ==> usable
[    0.000000] e820: update [mem 0x020d9018-0x020e5857] usable ==> usable
[    0.000000] e820: update [mem 0x020d9018-0x020e5857] usable ==> usable
[    0.000000] e820: update [mem 0x02237018-0x02243857] usable ==> usable
[    0.000000] e820: update [mem 0x02237018-0x02243857] usable ==> usable
[    0.000000] e820: update [mem 0x02215018-0x0221d057] usable ==> usable
[    0.000000] e820: update [mem 0x02215018-0x0221d057] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem
0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem
0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000000000100000-0x00000000020d9017] usable
[    0.000000] reserve setup_data: [mem
0x00000000020d9018-0x00000000020e5857] usable
[    0.000000] reserve setup_data: [mem
0x00000000020e5858-0x00000000021da017] usable
[    0.000000] reserve setup_data: [mem
0x00000000021da018-0x00000000021ea057] usable
[    0.000000] reserve setup_data: [mem
0x00000000021ea058-0x0000000002215017] usable
[    0.000000] reserve setup_data: [mem
0x0000000002215018-0x000000000221d057] usable
[    0.000000] reserve setup_data: [mem
0x000000000221d058-0x0000000002237017] usable
[    0.000000] reserve setup_data: [mem
0x0000000002237018-0x0000000002243857] usable
[    0.000000] reserve setup_data: [mem
0x0000000002243858-0x00000000cf32cfff] usable
[    0.000000] reserve setup_data: [mem
0x00000000cf32d000-0x00000000cf374fff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x00000000cf375000-0x00000000cf385fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000cf386000-0x00000000cf38dfff] ACPI data
[    0.000000] reserve setup_data: [mem
0x00000000cf38e000-0x00000000cf3b5fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000cf3b6000-0x00000000cf3b6fff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x00000000cf3b7000-0x00000000cf3c6fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000cf3c7000-0x00000000cf3d2fff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x00000000cf3d3000-0x00000000cf3f7fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000cf3f8000-0x00000000cf43afff] ACPI NVS
[    0.000000] reserve setup_data: [mem
0x00000000cf43b000-0x00000000cf5bafff] usable
[    0.000000] reserve setup_data: [mem
0x00000000cf5bb000-0x00000000cf6e6fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000cf6e7000-0x00000000cf6effff] usable
[    0.000000] reserve setup_data: [mem
0x00000000cf6f0000-0x00000000cfffffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fed14000-0x00000000fed19fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fed1c000-0x00000000fed8ffff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] reserve setup_data: [mem
0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem
0x0000000100000000-0x000000012fffffff] usable
[    0.000000] efi: EFI v2.00 by American Megatrends
[    0.000000] efi: ACPI 2.0=0xcf386000 SMBIOS=0xf0480 ACPI=0xcf386000
[    0.000000] SMBIOS 2.7 present.
[    0.000000] DMI:  /, BIOS 4.6.4 11/19/2012
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 1862.252 MHz processor
[    0.001843] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.001853] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001878] last_pfn = 0x130000 max_arch_pfn = 0x400000000
[    0.001928] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.002223] last_pfn = 0xcf6f0 max_arch_pfn = 0x400000000
[    0.007867] found SMP MP-table at [mem 0x000fce60-0x000fce6f]
[    0.010883] Secure boot disabled
[    0.010891] ACPI: Early table checksum verification disabled
[    0.010903] ACPI: RSDP 0x00000000CF386000 000024 (v02 _     )
[    0.010915] ACPI: XSDT 0x00000000CF386068 00004C (v01 _      _
  01072009 AMI  00010013)
[    0.010931] ACPI: FACP 0x00000000CF38D538 0000F4 (v04 _      _
  01072009 AMI  00010013)
[    0.010948] ACPI: DSDT 0x00000000CF386140 0073F2 (v02 _      _
  00000A03 INTL 20051117)
[    0.010960] ACPI: FACS 0x00000000CF3D0F80 000040
[    0.010970] ACPI: APIC 0x00000000CF38D630 000072 (v03 _      _
  01072009 AMI  00010013)
[    0.010982] ACPI: MCFG 0x00000000CF38D6A8 00003C (v01 _      _
  01072009 MSFT 00000097)
[    0.010993] ACPI: HPET 0x00000000CF38D6E8 000038 (v01 _      _
  01072009 AMI. 00000004)
[    0.011005] ACPI: SSDT 0x00000000CF38D720 000655 (v01 PmRef  CpuPm
  00003000 INTL 20051117)
[    0.011016] ACPI: Reserving FACP table memory at [mem 0xcf38d538-0xcf38d62b]
[    0.011023] ACPI: Reserving DSDT table memory at [mem 0xcf386140-0xcf38d531]
[    0.011029] ACPI: Reserving FACS table memory at [mem 0xcf3d0f80-0xcf3d0fbf]
[    0.011034] ACPI: Reserving APIC table memory at [mem 0xcf38d630-0xcf38d6a1]
[    0.011040] ACPI: Reserving MCFG table memory at [mem 0xcf38d6a8-0xcf38d6e3]
[    0.011045] ACPI: Reserving HPET table memory at [mem 0xcf38d6e8-0xcf38d71f]
[    0.011051] ACPI: Reserving SSDT table memory at [mem 0xcf38d720-0xcf38dd74]
[    0.011306] No NUMA configuration found
[    0.011310] Faking a node at [mem 0x0000000000000000-0x000000012fffffff]
[    0.011324] NODE_DATA(0) allocated [mem 0x12fff8000-0x12fffbfff]
[    0.011398] Zone ranges:
[    0.011402]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.011409]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.011416]   Normal   [mem 0x0000000100000000-0x000000012fffffff]
[    0.011422] Movable zone start for each node
[    0.011425] Early memory node ranges
[    0.011428]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.011433]   node   0: [mem 0x0000000000100000-0x00000000cf32cfff]
[    0.011439]   node   0: [mem 0x00000000cf43b000-0x00000000cf5bafff]
[    0.011444]   node   0: [mem 0x00000000cf6e7000-0x00000000cf6effff]
[    0.011448]   node   0: [mem 0x0000000100000000-0x000000012fffffff]
[    0.011454] Initmem setup node 0 [mem 0x0000000000001000-0x000000012fffffff]
[    0.011467] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.011542] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.047643] On node 0, zone DMA32: 270 pages in unavailable ranges
[    0.047665] On node 0, zone DMA32: 300 pages in unavailable ranges
[    0.056200] On node 0, zone Normal: 2320 pages in unavailable ranges
[    0.056604] ACPI: PM-Timer IO Port: 0x408
[    0.056621] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.056644] IOAPIC[0]: apic_id 4, version 32, address 0xfec00000, GSI 0-23
[    0.056653] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.056659] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.056670] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.056674] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.056688] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.056796] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.056806] PM: hibernation: Registered nosave memory: [mem
0x000a0000-0x000fffff]
[    0.056815] PM: hibernation: Registered nosave memory: [mem
0x020d9000-0x020d9fff]
[    0.056824] PM: hibernation: Registered nosave memory: [mem
0x020e5000-0x020e5fff]
[    0.056833] PM: hibernation: Registered nosave memory: [mem
0x021da000-0x021dafff]
[    0.056842] PM: hibernation: Registered nosave memory: [mem
0x021ea000-0x021eafff]
[    0.056851] PM: hibernation: Registered nosave memory: [mem
0x02215000-0x02215fff]
[    0.056861] PM: hibernation: Registered nosave memory: [mem
0x0221d000-0x0221dfff]
[    0.056870] PM: hibernation: Registered nosave memory: [mem
0x02237000-0x02237fff]
[    0.056879] PM: hibernation: Registered nosave memory: [mem
0x02243000-0x02243fff]
[    0.056889] PM: hibernation: Registered nosave memory: [mem
0xcf32d000-0xcf374fff]
[    0.056893] PM: hibernation: Registered nosave memory: [mem
0xcf375000-0xcf385fff]
[    0.056897] PM: hibernation: Registered nosave memory: [mem
0xcf386000-0xcf38dfff]
[    0.056902] PM: hibernation: Registered nosave memory: [mem
0xcf38e000-0xcf3b5fff]
[    0.056906] PM: hibernation: Registered nosave memory: [mem
0xcf3b6000-0xcf3b6fff]
[    0.056910] PM: hibernation: Registered nosave memory: [mem
0xcf3b7000-0xcf3c6fff]
[    0.056914] PM: hibernation: Registered nosave memory: [mem
0xcf3c7000-0xcf3d2fff]
[    0.056918] PM: hibernation: Registered nosave memory: [mem
0xcf3d3000-0xcf3f7fff]
[    0.056922] PM: hibernation: Registered nosave memory: [mem
0xcf3f8000-0xcf43afff]
[    0.056932] PM: hibernation: Registered nosave memory: [mem
0xcf5bb000-0xcf6e6fff]
[    0.056942] PM: hibernation: Registered nosave memory: [mem
0xcf6f0000-0xcfffffff]
[    0.056946] PM: hibernation: Registered nosave memory: [mem
0xd0000000-0xdfffffff]
[    0.056950] PM: hibernation: Registered nosave memory: [mem
0xe0000000-0xefffffff]
[    0.056954] PM: hibernation: Registered nosave memory: [mem
0xf0000000-0xfebfffff]
[    0.056959] PM: hibernation: Registered nosave memory: [mem
0xfec00000-0xfec00fff]
[    0.056963] PM: hibernation: Registered nosave memory: [mem
0xfec01000-0xfecfffff]
[    0.056967] PM: hibernation: Registered nosave memory: [mem
0xfed00000-0xfed00fff]
[    0.056971] PM: hibernation: Registered nosave memory: [mem
0xfed01000-0xfed13fff]
[    0.056975] PM: hibernation: Registered nosave memory: [mem
0xfed14000-0xfed19fff]
[    0.056979] PM: hibernation: Registered nosave memory: [mem
0xfed1a000-0xfed1bfff]
[    0.056983] PM: hibernation: Registered nosave memory: [mem
0xfed1c000-0xfed8ffff]
[    0.056987] PM: hibernation: Registered nosave memory: [mem
0xfed90000-0xfedfffff]
[    0.056992] PM: hibernation: Registered nosave memory: [mem
0xfee00000-0xfee00fff]
[    0.056996] PM: hibernation: Registered nosave memory: [mem
0xfee01000-0xffdfffff]
[    0.057000] PM: hibernation: Registered nosave memory: [mem
0xffe00000-0xffffffff]
[    0.057006] [mem 0xd0000000-0xdfffffff] available for PCI devices
[    0.057019] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.074396] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64
nr_cpu_ids:4 nr_node_ids:1
[    0.077845] percpu: Embedded 53 pages/cpu s179544 r8192 d29352 u524288
[    0.077881] pcpu-alloc: s179544 r8192 d29352 u524288 alloc=1*2097152
[    0.077889] pcpu-alloc: [0] 0 1 2 3
[    0.077983] Fallback order for Node 0: 0
[    0.077995] Built 1 zonelists, mobility grouping on.  Total pages: 1029091
[    0.078001] Policy zone: Normal
[    0.078006] Kernel command line:
root=PARTUUID=9bc7b8cb-3b3a-994c-9dca-0abbc5055e4d rootwait
drm.debug=0x1f console=tty1
[    0.081925] Dentry cache hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    0.083866] Inode-cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.083965] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.283958] Memory: 3982632K/4182356K available (18445K kernel
code, 2861K rwdata, 5596K rodata, 1276K init, 2672K bss, 199464K
reserved, 0K cma-reserved)
[    0.284116] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.285879] Dynamic Preempt: voluntary
[    0.285985] rcu: Preemptible hierarchical RCU implementation.
[    0.285992] rcu: RCU event tracing is enabled.
[    0.285996] rcu: RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
[    0.286001] Trampoline variant of Tasks RCU enabled.
[    0.286004] Tracing variant of Tasks RCU enabled.
[    0.286007] rcu: RCU calculated value of scheduler-enlistment delay
is 100 jiffies.
[    0.286012] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.290237] NR_IRQS: 4352, nr_irqs: 456, preallocated irqs: 16
[    0.290714] random: get_random_bytes called from
start_kernel+0x49c/0x666 with crng_init=0
[    0.290807] Console: colour dummy device 80x25
[    0.291809] printk: console [tty1] enabled
[    0.291870] ACPI: Core revision 20211217
[    0.292085] clocksource: hpet: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 133484882848 ns
[    0.292125] APIC: Switch to symmetric I/O mode setup
[    0.292736] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=0 pin2=0
[    0.297126] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x35afc2065d6, max_idle_ns: 881590602360 ns
[    0.297153] Calibrating delay loop (skipped), value calculated
using timer frequency.. 3724.50 BogoMIPS (lpj=1862252)
[    0.297170] pid_max: default: 32768 minimum: 301
[    0.306882] LSM: Security Framework initializing
[    0.306923] SELinux:  Initializing.
[    0.307014] Mount-cache hash table entries: 8192 (order: 4, 65536
bytes, linear)
[    0.307056] Mountpoint-cache hash table entries: 8192 (order: 4,
65536 bytes, linear)
[    0.307535] Disabled fast string operations
[    0.307569] CPU0: Thermal monitoring enabled (TM1)
[    0.307597] process: using mwait in idle threads
[    0.307610] Last level iTLB entries: 4KB 32, 2MB 0, 4MB 0
[    0.307619] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 8, 1GB 0
[    0.325806] Freeing SMP alternatives memory: 48K
[    0.428747] smpboot: CPU0: Intel(R) Atom(TM) CPU D2550   @ 1.86GHz
(family: 0x6, model: 0x36, stepping: 0x1)
[    0.429135] cblist_init_generic: Setting adjustable number of
callback queues.
[    0.429145] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.429145] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.429145] Performance Events: PEBS fmt0+, Atom events, 8-deep
LBR, Intel PMU driver.
[    0.429145] ... version:                3
[    0.429145] ... bit width:              40
[    0.429145] ... generic registers:      2
[    0.429145] ... value mask:             000000ffffffffff
[    0.429145] ... max period:             000000007fffffff
[    0.429145] ... fixed-purpose events:   3
[    0.429145] ... event mask:             0000000700000003
[    0.429145] rcu: Hierarchical SRCU implementation.
[    0.429856] smp: Bringing up secondary CPUs ...
[    0.430246] x86: Booting SMP configuration:
[    0.430261] .... node  #0, CPUs:      #1
[    0.002494] Disabled fast string operations
[    0.431145] TSC synchronization [CPU#0 -> CPU#1]:
[    0.431145] Measured 3213 cycles TSC warp between CPUs, turning off
TSC clock.
[    0.431145] tsc: Marking TSC unstable due to check_tsc_sync_source failed
[    0.431497]  #2
[    0.002494] Disabled fast string operations
[    0.432480]  #3
[    0.002494] Disabled fast string operations
[    0.432627] smp: Brought up 1 node, 4 CPUs
[    0.432627] smpboot: Max logical packages: 1
[    0.432627] smpboot: Total of 4 processors activated (14898.01 BogoMIPS)
[    0.434151] devtmpfs: initialized
[    0.434574] ACPI: PM: Registering ACPI NVS region [mem
0xcf32d000-0xcf374fff] (294912 bytes)
[    0.434574] ACPI: PM: Registering ACPI NVS region [mem
0xcf3b6000-0xcf3b6fff] (4096 bytes)
[    0.434574] ACPI: PM: Registering ACPI NVS region [mem
0xcf3c7000-0xcf3d2fff] (49152 bytes)
[    0.434574] ACPI: PM: Registering ACPI NVS region [mem
0xcf3f8000-0xcf43afff] (274432 bytes)
[    0.434574] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.434574] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.435238] PM: RTC time: 19:56:57, date: 2022-04-10
[    0.435474] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.435792] audit: initializing netlink subsys (disabled)
[    0.435835] audit: type=2000 audit(1649620616.143:1):
state=initialized audit_enabled=0 res=1
[    0.436262] thermal_sys: Registered thermal governor 'step_wise'
[    0.436269] thermal_sys: Registered thermal governor 'user_space'
[    0.436338] cpuidle: using governor menu
[    0.436455] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
0xe0000000-0xefffffff] (base 0xe0000000)
[    0.436481] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.436505] pmd_set_huge: Cannot satisfy [mem
0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
[    0.437283] PCI: Using configuration type 1 for base access
[    0.446373] kprobes: kprobe jump-optimization is enabled. All
kprobes are optimized if possible.
[    0.447235] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.447335] ACPI: Added _OSI(Module Device)
[    0.447335] ACPI: Added _OSI(Processor Device)
[    0.447336] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.447344] ACPI: Added _OSI(Processor Aggregator Device)
[    0.447353] ACPI: Added _OSI(Linux-Dell-Video)
[    0.447361] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.447370] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.457124] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.459422] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.460711] ACPI: Dynamic OEM Table Load:
[    0.460744] ACPI: SSDT 0xFFFF9AAAC02C9800 0006D5 (v01 PmRef
Cpu0Cst  00003001 INTL 20051117)
[    0.462769] ACPI: Dynamic OEM Table Load:
[    0.462791] ACPI: SSDT 0xFFFF9AAAC09B40C0 00008D (v01 PmRef  ApCst
  00003000 INTL 20051117)
[    0.466221] ACPI: Interpreter enabled
[    0.466279] ACPI: PM: (supports S0 S1 S4 S5)
[    0.466290] ACPI: Using IOAPIC for interrupt routing
[    0.466375] PCI: Using host bridge windows from ACPI; if necessary,
use "pci=nocrs" and report a bug
[    0.467145] ACPI: Enabled 12 GPEs in block 00 to 1F
[    0.489196] ACPI: PM: Power Resource [FN00]
[    0.491177] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.491208] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI HPX-Type3]
[    0.491333] acpi PNP0A08:00: _OSC: OS requested [PME PCIeCapability LTR]
[    0.491347] acpi PNP0A08:00: _OSC: platform willing to grant [PME
PCIeCapability LTR]
[    0.491358] acpi PNP0A08:00: _OSC: platform retains control of PCIe
features (AE_ERROR)
[    0.491812] PCI host bridge to bus 0000:00
[    0.491827] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.491840] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.491851] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000fffff window]
[    0.491864] pci_bus 0000:00: root bus resource [mem
0xcf800000-0xfebfffff window]
[    0.491877] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.491914] pci 0000:00:00.0: [8086:0bf3] type 00 class 0x060000
[    0.492182] pci 0000:00:02.0: [8086:0be2] type 00 class 0x030000
[    0.492206] pci 0000:00:02.0: reg 0x10: [mem 0xdfb00000-0xdfbfffff]
[    0.492222] pci 0000:00:02.0: reg 0x14: [io  0xf100-0xf107]
[    0.492267] pci 0000:00:02.0: Video device with shadowed ROM at
[mem 0x000c0000-0x000dffff]
[    0.492557] pci 0000:00:1b.0: [8086:27d8] type 00 class 0x040300
[    0.492598] pci 0000:00:1b.0: reg 0x10: [mem 0xdff00000-0xdff03fff 64bit]
[    0.492748] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.492999] pci 0000:00:1c.0: [8086:27d0] type 01 class 0x060400
[    0.493195] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.493449] pci 0000:00:1c.1: [8086:27d2] type 01 class 0x060400
[    0.493633] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.493890] pci 0000:00:1c.2: [8086:27d4] type 01 class 0x060400
[    0.494071] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.494332] pci 0000:00:1c.3: [8086:27d6] type 01 class 0x060400
[    0.494511] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.494757] pci 0000:00:1d.0: [8086:27c8] type 00 class 0x0c0300
[    0.494843] pci 0000:00:1d.0: reg 0x20: [io  0xf0a0-0xf0bf]
[    0.495084] pci 0000:00:1d.1: [8086:27c9] type 00 class 0x0c0300
[    0.495179] pci 0000:00:1d.1: reg 0x20: [io  0xf080-0xf09f]
[    0.495428] pci 0000:00:1d.2: [8086:27ca] type 00 class 0x0c0300
[    0.495514] pci 0000:00:1d.2: reg 0x20: [io  0xf060-0xf07f]
[    0.495760] pci 0000:00:1d.3: [8086:27cb] type 00 class 0x0c0300
[    0.495845] pci 0000:00:1d.3: reg 0x20: [io  0xf040-0xf05f]
[    0.496117] pci 0000:00:1d.7: [8086:27cc] type 00 class 0x0c0320
[    0.496167] pci 0000:00:1d.7: reg 0x10: [mem 0xdff05000-0xdff053ff]
[    0.496311] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.496534] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.496855] pci 0000:00:1f.0: [8086:27bc] type 00 class 0x060100
[    0.497224] pci 0000:00:1f.2: [8086:27c1] type 00 class 0x010601
[    0.497262] pci 0000:00:1f.2: reg 0x10: [io  0xf0f0-0xf0f7]
[    0.497286] pci 0000:00:1f.2: reg 0x14: [io  0xf0e0-0xf0e3]
[    0.497309] pci 0000:00:1f.2: reg 0x18: [io  0xf0d0-0xf0d7]
[    0.497330] pci 0000:00:1f.2: reg 0x1c: [io  0xf0c0-0xf0c3]
[    0.497353] pci 0000:00:1f.2: reg 0x20: [io  0xf020-0xf02f]
[    0.497375] pci 0000:00:1f.2: reg 0x24: [mem 0xdff04000-0xdff043ff]
[    0.497458] pci 0000:00:1f.2: PME# supported from D3hot
[    0.497676] pci 0000:00:1f.3: [8086:27da] type 00 class 0x0c0500
[    0.497743] pci 0000:00:1f.3: reg 0x20: [io  0xf000-0xf01f]
[    0.498038] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.498194] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
[    0.498240] pci 0000:02:00.0: reg 0x10: [io  0xe000-0xe0ff]
[    0.498293] pci 0000:02:00.0: reg 0x18: [mem 0xdfe04000-0xdfe04fff
64bit pref]
[    0.498333] pci 0000:02:00.0: reg 0x20: [mem 0xdfe00000-0xdfe03fff
64bit pref]
[    0.498520] pci 0000:02:00.0: supports D1 D2
[    0.498531] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.498849] pci 0000:00:1c.1: PCI bridge to [bus 02]
[    0.498867] pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
[    0.498881] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff]
[    0.499021] pci 0000:03:00.0: [10ec:8168] type 00 class 0x020000
[    0.499067] pci 0000:03:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    0.499120] pci 0000:03:00.0: reg 0x18: [mem 0xdfd04000-0xdfd04fff
64bit pref]
[    0.499169] pci 0000:03:00.0: reg 0x20: [mem 0xdfd00000-0xdfd03fff
64bit pref]
[    0.499358] pci 0000:03:00.0: supports D1 D2
[    0.499369] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.499686] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    0.499704] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.499719] pci 0000:00:1c.2:   bridge window [mem 0xdfd00000-0xdfdfffff]
[    0.499862] pci 0000:04:00.0: [1b21:0612] type 00 class 0x010601
[    0.499910] pci 0000:04:00.0: reg 0x10: [io  0xc050-0xc057]
[    0.499939] pci 0000:04:00.0: reg 0x14: [io  0xc040-0xc043]
[    0.499967] pci 0000:04:00.0: reg 0x18: [io  0xc030-0xc037]
[    0.499995] pci 0000:04:00.0: reg 0x1c: [io  0xc020-0xc023]
[    0.500023] pci 0000:04:00.0: reg 0x20: [io  0xc000-0xc01f]
[    0.500051] pci 0000:04:00.0: reg 0x24: [mem 0xdfc00000-0xdfc001ff]
[    0.500260] pci 0000:04:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:1c.3 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[    0.500483] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    0.500500] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.500515] pci 0000:00:1c.3:   bridge window [mem 0xdfc00000-0xdfcfffff]
[    0.500568] pci_bus 0000:05: extended config space not accessible
[    0.500670] pci 0000:00:1e.0: PCI bridge to [bus 05] (subtractive decode)
[    0.500698] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7
window] (subtractive decode)
[    0.500711] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff
window] (subtractive decode)
[    0.500724] pci 0000:00:1e.0:   bridge window [mem
0x000a0000-0x000fffff window] (subtractive decode)
[    0.500737] pci 0000:00:1e.0:   bridge window [mem
0xcf800000-0xfebfffff window] (subtractive decode)
[    0.503322] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.503491] ACPI: PCI: Interrupt link LNKB configured for IRQ 7
[    0.503660] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.503820] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    0.503978] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.503990] ACPI: PCI: Interrupt link LNKE disabled
[    0.504157] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.504169] ACPI: PCI: Interrupt link LNKF disabled
[    0.504331] ACPI: PCI: Interrupt link LNKG configured for IRQ 5
[    0.504493] ACPI: PCI: Interrupt link LNKH configured for IRQ 7
[    0.505291] iommu: Default domain type: Translated
[    0.505307] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.505358] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.505358] pci 0000:00:02.0: vgaarb: VGA device added:
decodes=io+mem,owns=io+mem,locks=none
[    0.505358] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.505358] vgaarb: loaded
[    0.505399] SCSI subsystem initialized
[    0.505431] libata version 3.00 loaded.
[    0.505431] ACPI: bus type USB registered
[    0.505431] usbcore: registered new interface driver usbfs
[    0.505431] usbcore: registered new interface driver hub
[    0.505431] usbcore: registered new device driver usb
[    0.505438] mc: Linux media interface: v0.10
[    0.505468] videodev: Linux video capture interface: v2.00
[    0.505492] pps_core: LinuxPPS API ver. 1 registered
[    0.505501] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.506164] PTP clock support registered
[    0.506304] Registered efivars operations
[    0.506616] Advanced Linux Sound Architecture Driver Initialized.
[    0.506961] NetLabel: Initializing
[    0.506971] NetLabel:  domain hash size = 128
[    0.506978] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.507178] NetLabel:  unlabeled traffic allowed by default
[    0.507242] PCI: Using ACPI for IRQ routing
[    0.520584] PCI: pci_cache_line_size set to 64 bytes
[    0.520681] Expanded resource Reserved due to conflict with PCI Bus 0000:00
[    0.520695] e820: reserve RAM buffer [mem 0x020d9018-0x03ffffff]
[    0.520702] e820: reserve RAM buffer [mem 0x021da018-0x03ffffff]
[    0.520707] e820: reserve RAM buffer [mem 0x02215018-0x03ffffff]
[    0.520711] e820: reserve RAM buffer [mem 0x02237018-0x03ffffff]
[    0.520714] e820: reserve RAM buffer [mem 0xcf32d000-0xcfffffff]
[    0.520719] e820: reserve RAM buffer [mem 0xcf5bb000-0xcfffffff]
[    0.520723] e820: reserve RAM buffer [mem 0xcf6f0000-0xcfffffff]
[    0.520740] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.520740] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    0.522237] clocksource: Switched to clocksource hpet
[    0.562334] VFS: Disk quotas dquot_6.6.0
[    0.562397] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.562589] pnp: PnP ACPI init
[    0.563122] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.563407] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.563430] system 00:01: [io  0xffff] has been reserved
[    0.563447] system 00:01: [io  0xffff] has been reserved
[    0.563463] system 00:01: [io  0xffff] has been reserved
[    0.563479] system 00:01: [io  0x0400-0x047f] has been reserved
[    0.563495] system 00:01: [io  0x0500-0x057f] has been reserved
[    0.563512] system 00:01: [io  0x0600-0x061f] has been reserved
[    0.563743] system 00:02: [io  0x06a0-0x06af] has been reserved
[    0.563764] system 00:02: [io  0x06b0-0x06ef] has been reserved
[    0.564448] system 00:04: [io  0x0a00-0x0a1f] has been reserved
[    0.564471] system 00:04: [io  0x0a30-0x0a3f] has been reserved
[    0.565772] pnp 00:07: [dma 3]
[    0.566809] pnp 00:08: [dma 0 disabled]
[    0.567667] pnp 00:09: [dma 0 disabled]
[    0.568706] ACPI: IRQ 10 override to edge, high
[    0.568730] pnp 00:0b: [dma 0 disabled]
[    0.569624] ACPI: IRQ 10 override to edge, high
[    0.569645] pnp 00:0c: [dma 0 disabled]
[    0.570533] ACPI: IRQ 10 override to edge, high
[    0.570558] pnp 00:0d: [dma 0 disabled]
[    0.571452] ACPI: IRQ 10 override to edge, high
[    0.571472] pnp 00:0e: [dma 0 disabled]
[    0.571888] system 00:0f: [io  0x04d0-0x04d1] has been reserved
[    0.572364] system 00:10: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.572387] system 00:10: [mem 0x00000000-0x00003fff] could not be reserved
[    0.572405] system 00:10: [mem 0x00000000-0x00000fff] could not be reserved
[    0.572421] system 00:10: [mem 0x00000000-0x00000fff] could not be reserved
[    0.572438] system 00:10: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.573101] system 00:11: [mem 0xfed14000-0xfed19fff] has been reserved
[    0.573123] system 00:11: [mem 0xe0000000-0xefffffff] has been reserved
[    0.573706] system 00:12: [io  0x0400-0x047f] has been reserved
[    0.573727] system 00:12: [io  0x0500-0x053f] has been reserved
[    0.573749] system 00:12: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.573767] system 00:12: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.573784] system 00:12: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.573800] system 00:12: [mem 0xfed20000-0xfed8ffff] could not be reserved
[    0.573817] system 00:12: [mem 0xffe00000-0xffffffff] has been reserved
[    0.573854] pnp: PnP ACPI: found 19 devices
[    0.585160] clocksource: acpi_pm: mask: 0xffffff max_cycles:
0xffffff, max_idle_ns: 2085701024 ns
[    0.585277] NET: Registered PF_INET protocol family
[    0.585547] IP idents hash table entries: 65536 (order: 7, 524288
bytes, linear)
[    0.587680] tcp_listen_portaddr_hash hash table entries: 2048
(order: 3, 32768 bytes, linear)
[    0.587738] TCP established hash table entries: 32768 (order: 6,
262144 bytes, linear)
[    0.587950] TCP bind hash table entries: 32768 (order: 7, 524288
bytes, linear)
[    0.588337] TCP: Hash tables configured (established 32768 bind 32768)
[    0.588594] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.588672] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.588878] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.589273] RPC: Registered named UNIX socket transport module.
[    0.589292] RPC: Registered udp transport module.
[    0.589303] RPC: Registered tcp transport module.
[    0.589313] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.589993] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to
[bus 01] add_size 1000
[    0.590020] pci 0000:00:1c.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000
add_align 100000
[    0.590045] pci 0000:00:1c.0: bridge window [mem
0x00100000-0x000fffff] to [bus 01] add_size 200000 add_align 100000
[    0.590069] pci 0000:00:1c.1: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000
add_align 100000
[    0.590094] pci 0000:00:1c.2: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 03] add_size 200000
add_align 100000
[    0.590119] pci 0000:00:1c.3: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 04] add_size 200000
add_align 100000
[    0.590192] pci 0000:00:1c.0: BAR 8: assigned [mem 0xd0000000-0xd01fffff]
[    0.590220] pci 0000:00:1c.0: BAR 9: assigned [mem
0xd0200000-0xd03fffff 64bit pref]
[    0.590246] pci 0000:00:1c.1: BAR 9: assigned [mem
0xd0400000-0xd05fffff 64bit pref]
[    0.590272] pci 0000:00:1c.2: BAR 9: assigned [mem
0xd0600000-0xd07fffff 64bit pref]
[    0.590297] pci 0000:00:1c.3: BAR 9: assigned [mem
0xd0800000-0xd09fffff 64bit pref]
[    0.590319] pci 0000:00:1c.0: BAR 7: assigned [io  0x1000-0x1fff]
[    0.590340] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.590357] pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
[    0.590377] pci 0000:00:1c.0:   bridge window [mem 0xd0000000-0xd01fffff]
[    0.590396] pci 0000:00:1c.0:   bridge window [mem
0xd0200000-0xd03fffff 64bit pref]
[    0.590422] pci 0000:00:1c.1: PCI bridge to [bus 02]
[    0.590436] pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
[    0.590456] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff]
[    0.590474] pci 0000:00:1c.1:   bridge window [mem
0xd0400000-0xd05fffff 64bit pref]
[    0.590500] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    0.590514] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.590534] pci 0000:00:1c.2:   bridge window [mem 0xdfd00000-0xdfdfffff]
[    0.590552] pci 0000:00:1c.2:   bridge window [mem
0xd0600000-0xd07fffff 64bit pref]
[    0.590577] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    0.590592] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.590612] pci 0000:00:1c.3:   bridge window [mem 0xdfc00000-0xdfcfffff]
[    0.590630] pci 0000:00:1c.3:   bridge window [mem
0xd0800000-0xd09fffff 64bit pref]
[    0.590656] pci 0000:00:1e.0: PCI bridge to [bus 05]
[    0.590687] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.590702] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.590717] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000fffff window]
[    0.590733] pci_bus 0000:00: resource 7 [mem 0xcf800000-0xfebfffff window]
[    0.590749] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    0.590763] pci_bus 0000:01: resource 1 [mem 0xd0000000-0xd01fffff]
[    0.590778] pci_bus 0000:01: resource 2 [mem 0xd0200000-0xd03fffff
64bit pref]
[    0.590795] pci_bus 0000:02: resource 0 [io  0xe000-0xefff]
[    0.590810] pci_bus 0000:02: resource 1 [mem 0xdfe00000-0xdfefffff]
[    0.590824] pci_bus 0000:02: resource 2 [mem 0xd0400000-0xd05fffff
64bit pref]
[    0.590842] pci_bus 0000:03: resource 0 [io  0xd000-0xdfff]
[    0.590856] pci_bus 0000:03: resource 1 [mem 0xdfd00000-0xdfdfffff]
[    0.590871] pci_bus 0000:03: resource 2 [mem 0xd0600000-0xd07fffff
64bit pref]
[    0.590889] pci_bus 0000:04: resource 0 [io  0xc000-0xcfff]
[    0.590903] pci_bus 0000:04: resource 1 [mem 0xdfc00000-0xdfcfffff]
[    0.590918] pci_bus 0000:04: resource 2 [mem 0xd0800000-0xd09fffff
64bit pref]
[    0.590935] pci_bus 0000:05: resource 4 [io  0x0000-0x0cf7 window]
[    0.590950] pci_bus 0000:05: resource 5 [io  0x0d00-0xffff window]
[    0.590965] pci_bus 0000:05: resource 6 [mem 0x000a0000-0x000fffff window]
[    0.590981] pci_bus 0000:05: resource 7 [mem 0xcf800000-0xfebfffff window]
[    0.619369] pci 0000:00:1d.7: quirk_usb_early_handoff+0x0/0x720
took 26010 usecs
[    0.619458] PCI: CLS 64 bytes, default 64
[    0.619487] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.619499] software IO TLB: mapped [mem
0x00000000cb32d000-0x00000000cf32d000] (64MB)
[    1.316623] Initialise system trusted keyrings
[    1.316813] workingset: timestamp_bits=56 max_order=20 bucket_order=0
[    1.322483] NFS: Registering the id_resolver key type
[    1.322516] Key type id_resolver registered
[    1.322525] Key type id_legacy registered
[    1.322588] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.322605] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    1.322615] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    1.337474] NET: Registered PF_ALG protocol family
[    1.337496] xor: measuring software checksum speed
[    1.338956]    prefetch64-sse  :  6898 MB/sec
[    1.340591]    generic_sse     :  6208 MB/sec
[    1.340602] xor: using function: prefetch64-sse (6898 MB/sec)
[    1.340615] Key type asymmetric registered
[    1.340623] Asymmetric key parser 'x509' registered
[    1.340630] Asymmetric key parser 'pkcs8' registered
[    1.340939] kworker/u8:0 (52) used greatest stack depth: 14736 bytes left
[    1.341587] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    1.341654] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 248)
[    1.341668] io scheduler mq-deadline registered
[    1.341676] io scheduler kyber registered
[    1.343449] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    1.343587] ACPI: button: Power Button [PWRB]
[    1.343693] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.343767] ACPI: button: Sleep Button [SLPB]
[    1.343872] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.343974] ACPI: button: Power Button [PWRF]
[    1.345062] Monitor-Mwait will be used to enter C-1 state
[    1.345084] ACPI: \_PR_.CPU0: Found 1 idle states
[    1.345668] ACPI: \_PR_.CPU1: Found 1 idle states
[    1.346135] ACPI: \_PR_.CPU2: Found 1 idle states
[    1.346646] ACPI: \_PR_.CPU3: Found 1 idle states
[    1.347793] thermal LNXTHERM:00: registered as thermal_zone0
[    1.347810] ACPI: thermal: Thermal Zone [THRM] (52 C)
[    1.348084] thermal LNXTHERM:01: registered as thermal_zone1
[    1.348096] ACPI: thermal: Thermal Zone [TZ00] (27 C)
[    1.348858] thermal LNXTHERM:02: registered as thermal_zone2
[    1.348872] ACPI: thermal: Thermal Zone [TZ01] (27 C)
[    1.349102] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.349317] 00:08: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200)
is a 16550A
[    1.349554] 00:09: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200)
is a 16550A
[    1.349776] 00:0b: ttyS4 at I/O 0x4e0 (irq = 10, base_baud =
115200) is a 16550A
[    1.349987] 00:0c: ttyS5 at I/O 0x4e8 (irq = 10, base_baud =
115200) is a 16550A
[    1.350233] 00:0d: ttyS6 at I/O 0x4f0 (irq = 10, base_baud =
115200) is a 16550A
[    1.350452] 00:0e: ttyS7 at I/O 0x4f8 (irq = 10, base_baud =
115200) is a 16550A
[    1.354411] Non-volatile memory driver v1.3
[    1.354609] Linux agpgart interface v0.103
[    1.354711] ACPI: bus type drm_connector registered
[    1.354743] [drm:drm_core_init] Initialized
[    1.359978] loop: module loaded
[    1.360217] ahci 0000:00:1f.2: version 3.0
[    1.360556] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[    1.360617] ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 4 ports 3
Gbps 0x3 impl SATA mode
[    1.360634] ahci 0000:00:1f.2: flags: 64bit ncq stag pm led clo pio slum part
[    1.361827] scsi host0: ahci
[    1.362328] scsi host1: ahci
[    1.362709] scsi host2: ahci
[    1.363088] scsi host3: ahci
[    1.363280] ata1: SATA max UDMA/133 abar m1024@0xdff04000 port
0xdff04100 irq 24
[    1.363297] ata2: SATA max UDMA/133 abar m1024@0xdff04000 port
0xdff04180 irq 24
[    1.363309] ata3: DUMMY
[    1.363315] ata4: DUMMY
[    1.363744] ahci 0000:04:00.0: SSS flag set, parallel bus scan disabled
[    1.363822] ahci 0000:04:00.0: AHCI 0001.0200 32 slots 2 ports 6
Gbps 0x3 impl SATA mode
[    1.363838] ahci 0000:04:00.0: flags: 64bit ncq sntf stag led clo
pmp pio slum part ccc sxs
[    1.364683] scsi host4: ahci
[    1.365100] scsi host5: ahci
[    1.365287] ata5: SATA max UDMA/133 abar m512@0xdfc00000 port
0xdfc00100 irq 25
[    1.365305] ata6: SATA max UDMA/133 abar m512@0xdfc00000 port
0xdfc00180 irq 25
[    1.365647] wireguard: WireGuard 1.0.0 loaded. See
www.wireguard.com for information.
[    1.365662] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[    1.366267] e100: Intel(R) PRO/100 Network Driver
[    1.366279] e100: Copyright(c) 1999-2006 Intel Corporation
[    1.366316] e1000: Intel(R) PRO/1000 Network Driver
[    1.366325] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.366368] e1000e: Intel(R) PRO/1000 Network Driver
[    1.366376] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.366427] sky2: driver version 1.30
[    1.366747] r8169 0000:02:00.0: can't disable ASPM; OS doesn't have
ASPM control
[    1.368590] r8169 0000:02:00.0 eth0: RTL8168evl/8111evl,
00:30:18:a1:77:72, XID 2c9, IRQ 26
[    1.368614] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194
bytes, tx checksumming: ko]
[    1.368838] r8169 0000:03:00.0: can't disable ASPM; OS doesn't have
ASPM control
[    1.370455] r8169 0000:03:00.0 eth1: RTL8168evl/8111evl,
00:30:18:a1:77:73, XID 2c9, IRQ 27
[    1.370480] r8169 0000:03:00.0 eth1: jumbo features [frames: 9194
bytes, tx checksumming: ko]
[    1.370767] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.370782] ehci-pci: EHCI PCI platform driver
[    1.371054] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    1.371216] ehci-pci 0000:00:1d.7: new USB bus registered, assigned
bus number 1
[    1.371249] ehci-pci 0000:00:1d.7: debug port 1
[    1.375221] ehci-pci 0000:00:1d.7: irq 23, io mem 0xdff05000
[    1.382188] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    1.382318] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.17
[    1.382335] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.382347] usb usb1: Product: EHCI Host Controller
[    1.382356] usb usb1: Manufacturer: Linux 5.17.1 ehci_hcd
[    1.382365] usb usb1: SerialNumber: 0000:00:1d.7
[    1.382700] hub 1-0:1.0: USB hub found
[    1.382727] hub 1-0:1.0: 8 ports detected
[    1.383461] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.383493] ohci-pci: OHCI PCI platform driver
[    1.383534] uhci_hcd: USB Universal Host Controller Interface driver
[    1.383740] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    1.383889] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned
bus number 2
[    1.383945] uhci_hcd 0000:00:1d.0: irq 23, io port 0x0000f0a0
[    1.384100] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.384117] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.384129] usb usb2: Product: UHCI Host Controller
[    1.384138] usb usb2: Manufacturer: Linux 5.17.1 uhci_hcd
[    1.384174] usb usb2: SerialNumber: 0000:00:1d.0
[    1.384499] hub 2-0:1.0: USB hub found
[    1.384525] hub 2-0:1.0: 2 ports detected
[    1.385050] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    1.385233] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned
bus number 3
[    1.385317] uhci_hcd 0000:00:1d.1: irq 19, io port 0x0000f080
[    1.385473] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.385490] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.385502] usb usb3: Product: UHCI Host Controller
[    1.385511] usb usb3: Manufacturer: Linux 5.17.1 uhci_hcd
[    1.385520] usb usb3: SerialNumber: 0000:00:1d.1
[    1.385821] hub 3-0:1.0: USB hub found
[    1.385848] hub 3-0:1.0: 2 ports detected
[    1.386402] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    1.386550] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned
bus number 4
[    1.386627] uhci_hcd 0000:00:1d.2: irq 18, io port 0x0000f060
[    1.386784] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.386801] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.386813] usb usb4: Product: UHCI Host Controller
[    1.386822] usb usb4: Manufacturer: Linux 5.17.1 uhci_hcd
[    1.386831] usb usb4: SerialNumber: 0000:00:1d.2
[    1.387130] hub 4-0:1.0: USB hub found
[    1.387185] hub 4-0:1.0: 2 ports detected
[    1.387718] uhci_hcd 0000:00:1d.3: UHCI Host Controller
[    1.387863] uhci_hcd 0000:00:1d.3: new USB bus registered, assigned
bus number 5
[    1.387946] uhci_hcd 0000:00:1d.3: irq 16, io port 0x0000f040
[    1.388105] usb usb5: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.388122] usb usb5: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.388134] usb usb5: Product: UHCI Host Controller
[    1.388143] usb usb5: Manufacturer: Linux 5.17.1 uhci_hcd
[    1.388190] usb usb5: SerialNumber: 0000:00:1d.3
[    1.388763] hub 5-0:1.0: USB hub found
[    1.388791] hub 5-0:1.0: 2 ports detected
[    1.389289] usbcore: registered new interface driver usblp
[    1.389351] usbcore: registered new interface driver usb-storage
[    1.389421] usbcore: registered new interface driver ftdi_sio
[    1.389444] usbserial: USB Serial support registered for FTDI USB
Serial Device
[    1.389650] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M]
at 0x60,0x64 irq 1,12
[    1.390246] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.390265] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.390824] usbcore: registered new interface driver usbtouchscreen
[    1.390901] rtc_cmos 00:03: RTC can wake from S4
[    1.391468] rtc_cmos 00:03: registered as rtc0
[    1.391528] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes
nvram, hpet irqs
[    1.391645] i801_smbus 0000:00:1f.3: enabling device (0000 -> 0001)
[    1.391848] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    1.392495] i2c i2c-0: 2/2 memory slots populated (from DMI)
[    1.394473] i2c i2c-0: Successfully instantiated SPD at 0x50
[    1.396410] i2c i2c-0: Successfully instantiated SPD at 0x51
[    1.396546] usbcore: registered new interface driver uvcvideo
[    1.396854] f71808e_wdt: Found f71869 watchdog chip, revision 32
[    1.397378] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22)
initialised: dm-devel@redhat.com
[    1.397399] intel_pstate: CPU model not supported
[    1.397490] efifb: probing for efifb
[    1.397530] efifb: framebuffer at 0xcf800000, using 1876k, total 1875k
[    1.397542] efifb: mode is 800x600x32, linelength=3200, pages=1
[    1.397552] efifb: scrolling: redraw
[    1.397558] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.402084] Console: switching to colour frame buffer device 100x37
[    1.406506] fb0: EFI VGA frame buffer device
[    1.406594] EFI Variables Facility v0.08 2004-May-17
[    1.470383] hid: raw HID events driver (C) Jiri Kosina
[    1.470972] usbcore: registered new interface driver usbhid
[    1.471059] usbhid: USB HID core driver
[    1.471563] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
[    1.473478] Initializing XFRM netlink socket
[    1.473889] NET: Registered PF_INET6 protocol family
[    1.474876] Segment Routing with IPv6
[    1.474963] In-situ OAM (IOAM) with IPv6
[    1.475116] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.475587] NET: Registered PF_PACKET protocol family
[    1.477949] Key type dns_resolver registered
[    1.480940] microcode: sig=0x30661, pf=0x4, revision=0x10d
[    1.482806] snd_hda_intel 0000:00:1b.0: Cannot probe codecs, giving up
[    1.483674] microcode: Microcode Update Driver: v2.2.
[    1.485842] IPI shorthand broadcast: enabled
[    1.490405] registered taskstats version 1
[    1.492582] Loading compiled-in X.509 certificates
[    1.499265] checking generic (cf800000 1d5000) vs hw (0 ffffffffffffffff)
[    1.499275] fb0: switching to gma500 from EFI VGA
[    1.501598] Console: switching to colour dummy device 80x25
[    1.501939] [drm:psb_intel_opregion_setup] OpRegion detected at 0xcf3c7018
[    1.501966] [drm:psb_intel_opregion_setup] Public ACPI methods supported
[    1.501972] [drm:psb_intel_opregion_setup] ASLE supported
[    1.502051] [drm:psb_intel_init_bios] Using VBT from OpRegion: $VBT
CEDARVIEW      d
[    1.502062] [drm:psb_intel_init_bios] LVDS VBT config bits: 0x1
[    1.502071] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    1.502090] [drm:psb_intel_init_bios] No SDVO device info is found in VBT
[    1.502097] [drm:psb_intel_init_bios] EDP timing in vbt t1_t3 2000
t8 10 t9 2000 t10 500 t11_t12 5000
[    1.502104] [drm:psb_intel_init_bios] VBT reports EDP: Lane_count
1, Lane_rate 6, Bpp 18
[    1.502110] [drm:psb_intel_init_bios] VBT reports EDP: VSwing  0, Preemph 0
[    1.509997] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
no  post: no)
[    1.510397] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    1.516270] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSDDC_C
[    1.516930] [drm:cdv_intel_dp_init] i2c_init DPDDC-B
[    1.517442] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    1.517452] [drm:cdv_intel_dp_i2c_aux_ch] aux_ch failed -110
[    1.517961] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    1.517967] [drm:cdv_intel_dp_i2c_aux_ch] aux_ch failed -110
[    1.518670] [drm:cdv_intel_dp_init] i2c_init DPDDC-C
[    1.518879] [drm:cdv_intel_dp_i2c_aux_ch] aux_i2c nack
[    1.622178] usb 1-7: new high-speed USB device number 2 using ehci-pci
[    1.673651] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.673738] ata5: SATA link down (SStatus 0 SControl 300)
[    1.675672] ata1.00: ATA-11: ST8000VN004-2M2101, SC60, max UDMA/133
[    1.688493] ata1.00: 15628053168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.688952] ata1.00: Features: NCQ-sndrcv
[    1.703950] ata1.00: configured for UDMA/133
[    1.704233] scsi 0:0:0:0: Direct-Access     ATA
ST8000VN004-2M21 SC60 PQ: 0 ANSI: 5
[    1.704941] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.705107] sd 0:0:0:0: [sda] 15628053168 512-byte logical blocks:
(8.00 TB/7.28 TiB)
[    1.705130] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.705225] sd 0:0:0:0: [sda] Write Protect is off
[    1.705244] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.705337] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    1.750390]  sda: sda1 sda2 sda3 sda4
[    1.751643] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.755049] usb 1-7: New USB device found, idVendor=1d6b,
idProduct=0104, bcdDevice= 1.00
[    1.755068] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.755080] usb 1-7: Product: Composite KVM Device
[    1.755089] usb 1-7: Manufacturer: PiKVM
[    1.755098] usb 1-7: SerialNumber: CAFEBABE
[    1.756928] input: PiKVM Composite KVM Device as
/devices/pci0000:00/0000:00:1d.7/usb1/1-7/1-7:1.0/0003:1D6B:0104.0001/input/input7
[    1.808616] hid-generic 0003:1D6B:0104.0001: input,hidraw0: USB HID
v1.01 Keyboard [PiKVM Composite KVM Device] on
usb-0000:00:1d.7-7/input0
[    1.810002] input: PiKVM Composite KVM Device as
/devices/pci0000:00/0000:00:1d.7/usb1/1-7/1-7:1.1/0003:1D6B:0104.0002/input/input8
[    1.810256] hid-generic 0003:1D6B:0104.0002: input,hidraw1: USB HID
v1.01 Mouse [PiKVM Composite KVM Device] on usb-0000:00:1d.7-7/input1
[    1.810602] usb-storage 1-7:1.2: USB Mass Storage device detected
[    1.810991] scsi host6: usb-storage 1-7:1.2
[    1.890844] [drm:drm_client_modeset_probe]
[    1.890862] [drm:drm_mode_object_get] OBJ ID: 37 (2)
[    1.890873] [drm:drm_mode_object_get] OBJ ID: 39 (2)
[    1.890880] [drm:drm_mode_object_get] OBJ ID: 41 (2)
[    1.890887] [drm:drm_mode_object_get] OBJ ID: 43 (2)
[    1.890894] [drm:drm_mode_object_get] OBJ ID: 47 (2)
[    1.890900] [drm:drm_mode_object_get] OBJ ID: 49 (2)
[    1.890908] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1]
[    1.905172] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] status updated from unknown to disconnected
[    1.905183] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] disconnected
[    1.905194] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1]
[    1.905201] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] status updated from unknown to connected
[    1.909708] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSBLC_B
[    1.909764] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] probed modes :
[    1.909772] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    1.909785] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1]
[    2.009626] ata2: SATA link down (SStatus 0 SControl 300)
[    2.118811] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.118823] [drm:drm_add_display_info] non_desktop set to 0
[    2.118830] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    2.118837] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    2.118843] [drm:drm_add_display_info] CEA VCDB 0x7f
[    2.118856] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] status updated from unknown to connected
[    2.313664] ata6: SATA link down (SStatus 0 SControl 300)
[    2.327912] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.327923] [drm:drm_add_display_info] non_desktop set to 0
[    2.327929] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    2.327935] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    2.327941] [drm:drm_add_display_info] CEA VCDB 0x7f
[    2.327950] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[    2.327961] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.327967] [drm:drm_add_display_info] non_desktop set to 0
[    2.327973] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    2.327979] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    2.327985] [drm:drm_add_display_info] CEA VCDB 0x7f
[    2.327993] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    2.328002] [drm:drm_add_edid_modes] ELD monitor Toshiba-H2C
[    2.328009] [drm:drm_add_edid_modes] HDMI: latency present 0 0,
video latency 0 0, audio latency 0 0
[    2.328017] [drm:drm_add_edid_modes] ELD size 32, SAD count 0
[    2.328024] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.328030] [drm:drm_add_display_info] non_desktop set to 0
[    2.328036] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    2.328042] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    2.328048] [drm:drm_add_display_info] CEA VCDB 0x7f
[    2.329450] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] probed modes :
[    2.329460] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    2.329472] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[    2.329483] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    2.329493] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    2.329504] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[    2.329514] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    2.329525] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    2.329535] [drm:drm_mode_debug_printmodeline] Modeline
"1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[    2.329546] [drm:drm_mode_debug_printmodeline] Modeline "1440x900":
60 106470 1440 1520 1672 1904 900 901 907 934 0x40 0xa
[    2.329556] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    2.329567] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    2.329577] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[    2.329588] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74250 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    2.329598] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74176 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    2.329609] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
25 74250 1280 3700 3740 3960 720 725 730 750 0x40 0x5
[    2.329620] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59400 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    2.329630] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59341 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    2.329641] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[    2.329651] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    2.329662] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    2.329672] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[    2.329682] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    2.329693] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[    2.329703] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    2.329714] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    2.329724] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    2.329735] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    2.329745] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0x5
[    2.329756] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    2.329766] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    2.329776] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    2.329787] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    2.329797] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
73 31500 640 664 704 832 480 489 492 520 0x40 0xa
[    2.329807] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
67 30240 640 704 768 864 480 483 486 525 0x40 0xa
[    2.329818] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    2.329828] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    2.329839] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    2.329850] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:43:DP-1]
[    2.330361] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    2.330371] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] status updated from unknown to disconnected
[    2.330378] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] disconnected
[    2.330386] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2]
[    2.362198] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm HDMIC
[    2.362206] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] status updated from unknown to disconnected
[    2.362214] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] disconnected
[    2.362221] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:49:DP-2]
[    2.362431] [drm:cdv_intel_dp_detect] DPCD: Rev=10 LN_Rate=a
LN_CNT=82 LN_DOWNSP=40
[    2.363462] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    2.390107] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    2.390117] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.390124] [drm:drm_add_display_info] non_desktop set to 0
[    2.390130] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    2.390140] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] status updated from unknown to connected
[    2.391173] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    2.417824] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    2.417834] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.417841] [drm:drm_add_display_info] non_desktop set to 0
[    2.417847] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    2.417856] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    2.417865] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.417871] [drm:drm_add_display_info] non_desktop set to 0
[    2.417877] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    2.417885] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (1)
[    2.417894] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    2.417900] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    2.417906] [drm:drm_add_display_info] non_desktop set to 0
[    2.417911] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    2.418055] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] probed modes :
[    2.418062] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    2.418073] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
50 46760 1024 1072 1104 1184 768 771 775 790 0x40 0x9
[    2.418084] [drm:drm_client_modeset_probe] connector 37 enabled? no
[    2.418091] [drm:drm_client_modeset_probe] connector 39 enabled? yes
[    2.418097] [drm:drm_client_modeset_probe] connector 41 enabled? yes
[    2.418103] [drm:drm_client_modeset_probe] connector 43 enabled? no
[    2.418109] [drm:drm_client_modeset_probe] connector 47 enabled? no
[    2.418115] [drm:drm_client_modeset_probe] connector 49 enabled? yes
[    2.418122] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 39
[    2.418129] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 39 0
[    2.418135] [drm:drm_client_modeset_probe] found mode 1024x768
[    2.418140] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 41
[    2.418162] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 41 0
[    2.418169] [drm:drm_client_modeset_probe] found mode 1280x720
[    2.418175] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 49
[    2.418180] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 49 0
[    2.418186] [drm:drm_client_modeset_probe] found mode 1024x768
[    2.418192] [drm:drm_client_modeset_probe] picking CRTCs for 4096x4096 config
[    2.418204] [drm:drm_client_modeset_probe] desired mode 1280x720
set on crtc 32 (0,0)
[    2.418212] [drm:drm_mode_object_get] OBJ ID: 41 (2)
[    2.418219] [drm:drm_client_modeset_probe] desired mode 1024x768
set on crtc 34 (0,0)
[    2.418226] [drm:drm_mode_object_get] OBJ ID: 49 (2)
[    2.418233] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    2.418239] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    2.418246] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[    2.418252] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    2.418258] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    2.418264] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (3)
[    2.418275] gma500 0000:00:02.0:
[drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary
plane
[    2.418285] gma500 0000:00:02.0:
[drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 1 primary
plane
[    2.419518] fbcon: gma500drmfb (fb0) is primary device
[    2.419652] [drm:drm_crtc_helper_set_config]
[    2.419662] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:53] #connectors=1 (x y) (0 0)
[    2.419674] [drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[    2.419680] [drm:drm_crtc_helper_set_config] modes are different,
full mode set
[    2.419686] [drm:drm_mode_debug_printmodeline] Modeline "": 0 0 0 0
0 0 0 0 0 0 0x0 0x0
[    2.419695] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    2.419706] [drm:drm_mode_object_get] OBJ ID: 41 (2)
[    2.419713] [drm:drm_crtc_helper_set_config] encoder changed, full
mode switch
[    2.419720] [drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[    2.419725] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.419734] [drm:drm_crtc_helper_set_config] attempting to set mode
from userspace
[    2.419739] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    2.419752] [drm:drm_crtc_helper_set_mode] [CRTC:32:crtc-0]
[    2.439774] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    2.442182] [drm:cdv_sb_write] 0x00008018: 0x0068a701 (before)
[    2.442192] [drm:cdv_sb_write] 0x00008018: 0x0068a701
[    2.448175] [drm:cdv_sb_write] 0x00008018: 0x0068a701 (after)
[    2.451175] [drm:cdv_intel_crtc_mode_set] use their DPLL for pipe A/B
[    2.454176] [drm:cdv_sb_write] 0x00008010: 0x7e40221c (before)
[    2.454184] [drm:cdv_sb_write] 0x00008010: 0x7e40221c
[    2.460177] [drm:cdv_sb_write] 0x00008010: 0x7e40221c (after)
[    2.466175] [drm:cdv_sb_write] 0x00008008: 0x4800217f (before)
[    2.466184] [drm:cdv_sb_write] 0x00008008: 0x6c00217f
[    2.472175] [drm:cdv_sb_write] 0x00008008: 0x6c00217f (after)
[    2.478175] [drm:cdv_sb_write] 0x00008014: 0x06080157 (before)
[    2.478184] [drm:cdv_sb_write] 0x00008014: 0x84000157
[    2.484175] [drm:cdv_sb_write] 0x00008014: 0x84000157 (after)
[    2.490175] [drm:cdv_sb_write] 0x0000801c: 0x05555000 (before)
[    2.490183] [drm:cdv_sb_write] 0x0000801c: 0x05554000
[    2.496175] [drm:cdv_sb_write] 0x0000801c: 0x05554000 (after)
[    2.502175] [drm:cdv_sb_write] 0x00000120: 0x003000c4 (before)
[    2.502184] [drm:cdv_sb_write] 0x00000120: 0x003000c4
[    2.508175] [drm:cdv_sb_write] 0x00000120: 0x003000c4 (after)
[    2.514175] [drm:cdv_sb_write] 0x00000220: 0x003000c4 (before)
[    2.514184] [drm:cdv_sb_write] 0x00000220: 0x003000c4
[    2.520175] [drm:cdv_sb_write] 0x00000220: 0x003000c4 (after)
[    2.520334] [drm:cdv_intel_crtc_mode_set] Mode for pipe A:
[    2.520340] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    2.560517] [drm:drm_crtc_helper_set_mode] [ENCODER:42:TMDS-42] set
[MODE:1280x720]
[    2.600723] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 32: hwmode: htotal 1650,
vtotal 750, vdisplay 720
[    2.600734] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 32: clock 74250 kHz
framedur 16666666 linedur 22222
[    2.600743] [drm:drm_crtc_helper_set_config] Setting connector DPMS
state to on
[    2.600749] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
set DPMS on
[    2.680789] [drm:drm_mode_object_get] OBJ ID: 53 (1)
[    2.680800] [drm:drm_crtc_helper_set_config]
[    2.680805] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:53] #connectors=1 (x y) (0 0)
[    2.680842] [drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[    2.680852] [drm:drm_crtc_helper_set_config] modes are different,
full mode set
[    2.680857] [drm:drm_mode_debug_printmodeline] Modeline "": 0 0 0 0
0 0 0 0 0 0 0x0 0x0
[    2.680867] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    2.680877] [drm:drm_mode_object_get] OBJ ID: 49 (2)
[    2.680885] [drm:drm_crtc_helper_set_config] encoder changed, full
mode switch
[    2.680891] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.680898] [drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[    2.680903] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    2.680912] [drm:drm_crtc_helper_set_config] attempting to set mode
from userspace
[    2.680917] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    2.680931] [drm:cdv_intel_dp_mode_fixup] Display port link bw 0a
lane count 1 clock 270000
[    2.680940] [drm:drm_crtc_helper_set_mode] [CRTC:34:crtc-1]
[    2.760970] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
289 270000 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    2.763178] [drm:cdv_sb_write] 0x00008038: 0x0068a701 (before)
[    2.763187] [drm:cdv_sb_write] 0x00008038: 0x0068a701
[    2.769175] [drm:cdv_sb_write] 0x00008038: 0x0068a701 (after)
[    2.772175] [drm:cdv_intel_crtc_mode_set] use their DPLL for pipe A/B
[    2.775176] [drm:cdv_sb_write] 0x00008030: 0x7e40221c (before)
[    2.775184] [drm:cdv_sb_write] 0x00008030: 0x7e40221c
[    2.781176] [drm:cdv_sb_write] 0x00008030: 0x7e40221c (after)
[    2.787175] [drm:cdv_sb_write] 0x00008028: 0x5900217f (before)
[    2.787184] [drm:cdv_sb_write] 0x00008028: 0x8500217f
[    2.793175] [drm:cdv_sb_write] 0x00008028: 0x8500217f (after)
[    2.799175] [drm:cdv_sb_write] 0x00008034: 0x16000157 (before)
[    2.799184] [drm:cdv_sb_write] 0x00008034: 0x55000157
[    2.805175] [drm:cdv_sb_write] 0x00008034: 0x55000157 (after)
[    2.811175] [drm:cdv_sb_write] 0x0000803c: 0x85552000 (before)
[    2.811183] [drm:cdv_sb_write] 0x0000803c: 0x05551000
[    2.817175] [drm:cdv_sb_write] 0x0000803c: 0x05551000 (after)
[    2.822472] scsi 6:0:0:0: CD-ROM            Pi-KVM   CD-ROM Drive
  0515 PQ: 0 ANSI: 2
[    2.823178] [drm:cdv_sb_write] 0x00002320: 0x003000c4 (before)
[    2.823188] [drm:cdv_sb_write] 0x00002320: 0x003000c4
[    2.823298] sr 6:0:0:0: Power-on or device reset occurred
[    2.824655] random: fast init done
[    2.824949] sr 6:0:0:0: [sr0] scsi-1 drive
[    2.824955] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.826190] sr 6:0:0:0: Attached scsi CD-ROM sr0
[    2.826357] sr 6:0:0:0: Attached scsi generic sg1 type 5
[    2.829179] [drm:cdv_sb_write] 0x00002320: 0x003000c4 (after)
[    2.835177] [drm:cdv_sb_write] 0x00002420: 0x003000c4 (before)
[    2.835187] [drm:cdv_sb_write] 0x00002420: 0x003000c4
[    2.841175] [drm:cdv_sb_write] 0x00002420: 0x003000c4 (after)
[    2.841335] [drm:cdv_intel_crtc_mode_set] Mode for pipe B:
[    2.841341] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    2.881517] [drm:drm_crtc_helper_set_mode] [ENCODER:50:TMDS-50] set
[MODE:1024x768]
[    2.881527] [drm:cdv_intel_dp_mode_set] DP expected reg is 70000008
[    2.961736] [drm:cdv_intel_dp_start_link_train] Link config
[    2.961946] [drm:cdv_intel_dp_start_link_train] Start train
[    2.961951] [drm:cdv_intel_dp_start_link_train] DP Link Train Set
0, Link_config a, 1
[    2.962866] [drm:cdv_intel_dp_start_link_train] DP Link status 0,
0, 80, 0, 1, 0
[    2.962877] [drm:cdv_intel_dp_start_link_train] DP Link Train Set
1, Link_config a, 1
[    2.963791] [drm:cdv_intel_dp_start_link_train] DP Link status 1,
0, 80, 0, 1, 0
[    2.963800] [drm:cdv_intel_dp_start_link_train] PT1 train is done
[    2.963805] [drm:cdv_intel_dp_complete_link_train]
[    2.963811] [drm:cdv_intel_dp_complete_link_train] DP Link Train
Set 1, Link_config a, 1
[    2.965525] [drm:cdv_intel_dp_complete_link_train] DP Link status
1, 0, 81, 0, 5, 0
[    2.965536] [drm:cdv_intel_dp_complete_link_train] DP Link Train
Set 9, Link_config a, 1
[    2.967262] [drm:cdv_intel_dp_complete_link_train] DP Link status
1, 0, 81, 0, 9, 0
[    2.967272] [drm:cdv_intel_dp_complete_link_train] DP Link Train
Set 11, Link_config a, 1
[    2.968986] [drm:cdv_intel_dp_complete_link_train] DP Link status
7, 0, 81, 0, 9, 0
[    2.968996] [drm:cdv_intel_dp_complete_link_train] PT2 train is done
[    2.969207] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 34: hwmode: htotal 1184,
vtotal 790, vdisplay 768
[    2.969217] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 34: clock 56120 kHz
framedur 16667141 linedur 21097
[    2.969225] [drm:drm_crtc_helper_set_config] Setting connector DPMS
state to on
[    2.969231] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] set DPMS on
[    2.969252] [drm:drm_mode_object_get] OBJ ID: 53 (2)
[    2.969259] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (3)
[    2.969264] [drm:drm_mode_object_get] OBJ ID: 53 (2)
[    2.969300] [drm:drm_crtc_helper_set_config]
[    2.969307] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:53] #connectors=1 (x y) (0 0)
[    2.969320] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.969328] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    2.969335] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.969341] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.969347] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.969352] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.969358] [drm:drm_crtc_helper_set_config]
[    2.969363] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:53] #connectors=1 (x y) (0 0)
[    2.969375] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.969383] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    2.969390] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.969396] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.969402] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.969407] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.975997] Console: switching to colour frame buffer device 128x45
[    2.976012] [drm:drm_crtc_helper_set_config]
[    2.976019] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:53] #connectors=1 (x y) (0 0)
[    2.976031] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.976039] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    2.976046] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.976052] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.976058] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.976063] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.976069] [drm:drm_crtc_helper_set_config]
[    2.976074] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:53] #connectors=1 (x y) (0 0)
[    2.976085] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    2.976093] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    2.976100] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.976106] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.976112] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    2.976117] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    2.983381] gma500 0000:00:02.0: [drm] fb0: gma500drmfb frame buffer device
[    2.983583] [drm:drm_minor_register]
[    2.983592] [drm:drm_minor_register]
[    2.983788] [drm:drm_minor_register] new minor registered 0
[    2.983824] [drm:drm_sysfs_connector_add] adding "VGA-1" to sysfs
[    2.983888] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:37:VGA-1]
generating connector hotplug event
[    2.983908] [drm:drm_sysfs_connector_add] adding "LVDS-1" to sysfs
[    2.983967] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:39:LVDS-1]
generating connector hotplug event
[    2.983987] [drm:drm_sysfs_connector_add] adding "DVI-D-1" to sysfs
[    2.984049] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:41:DVI-D-1]
generating connector hotplug event
[    2.984068] [drm:drm_sysfs_connector_add] adding "DP-1" to sysfs
[    2.984126] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:43:DP-1] generating
connector hotplug event
[    2.984172] [drm:drm_sysfs_connector_add] adding "DVI-D-2" to sysfs
[    2.984253] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:47:DVI-D-2]
generating connector hotplug event
[    2.984274] [drm:drm_sysfs_connector_add] adding "DP-2" to sysfs
[    2.984331] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:49:DP-2] generating
connector hotplug event
[    2.984348] [drm] Initialized gma500 1.0.0 20140314 for
0000:00:02.0 on minor 0
[    2.984606] PM:   Magic number: 2:645:950
[    2.984813] tty tty7: hash matches
[    2.984963] printk: console [netcon0] enabled
[    2.985037] netconsole: network logging started
[    2.985620] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    2.987930] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.988118] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    2.988274] cfg80211: failed to load regulatory.db
[    2.988434] Unstable clock detected, switching default tracing
clock to "global"
               If you want to keep using the local clock, then add:
                 "trace_clock=local"
               on the kernel command line
[    2.994806] ALSA device list:
[    2.997853]   No soundcards found.
[    3.000910] md: Waiting for all devices to be available before autodetect
[    3.003972] md: If you don't use raid, use raid=noautodetect
[    3.007037] md: Autodetecting RAID arrays.
[    3.010065] md: autorun ...
[    3.013002] md: ... autorun DONE.
[    3.050670] EXT4-fs (sda3): mounted filesystem with ordered data
mode. Quota mode: none.
[    3.053703] VFS: Mounted root (ext4 filesystem) readonly on device 8:3.
[    3.071329] devtmpfs: mounted
[    3.075364] Freeing unused kernel image (initmem) memory: 1276K
[    3.078436] Write protecting the kernel read-only data: 26624k
[    3.083629] Freeing unused kernel image (text/rodata gap) memory: 2032K
[    3.087192] Freeing unused kernel image (rodata/data gap) memory: 548K
[    3.090171] Run /sbin/init as init process
[    3.093030]   with arguments:
[    3.093033]     /sbin/init
[    3.093036]   with environment:
[    3.093037]     HOME=/
[    3.093040]     TERM=linux
[    3.454449] modprobe (131) used greatest stack depth: 13280 bytes left
[    3.866122] random: crng init done
[    3.869829] systemd[1]: Successfully credited entropy passed from
boot loader.
[    3.888185] systemd[1]: systemd 250 running in system mode (-PAM
-AUDIT -SELINUX -APPARMOR -IMA -SMACK -SECCOMP +GCRYPT -GNUTLS
+OPENSSL -ACL +BLKID +CURL +ELFUTILS -FIDO2 -IDN2 -IDN +IPTC +KMOD
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2
-LZ4 +XZ +ZLIB -ZSTD -BPF_FRAMEWORK +XKBCOMMON -UTMP -SYSVINIT
default-hierarchy=unified)
[    3.909335] systemd[1]: Detected architecture x86-64.
[    3.958022] systemd[1]: Hostname set to <buildroot>.
[    4.035388] systemd[1]: Using hardware watchdog 'f71869 watchdog',
version 0, device /dev/watchdog0
[    4.038667] systemd[1]: Watchdog running with a timeout of 20s.
[    4.039199] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    4.042583] gma500 0000:00:02.0: [drm:drm_fb_helper_hotplug_event.part.0]
[    4.042599] [drm:drm_client_modeset_probe]
[    4.042609] [drm:drm_mode_object_get] OBJ ID: 37 (2)
[    4.042622] [drm:drm_mode_object_get] OBJ ID: 39 (2)
[    4.042632] [drm:drm_mode_object_get] OBJ ID: 41 (4)
[    4.042641] [drm:drm_mode_object_get] OBJ ID: 43 (2)
[    4.042652] [drm:drm_mode_object_get] OBJ ID: 47 (2)
[    4.042662] [drm:drm_mode_object_get] OBJ ID: 49 (4)
[    4.042674] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1]
[    4.057178] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] disconnected
[    4.057204] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1]
[    4.061712] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSBLC_B
[    4.061770] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] probed modes :
[    4.061778] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    4.061791] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1]
[    4.226377] lvmconfig (145) used greatest stack depth: 13048 bytes left
[    4.273041] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.273060] [drm:drm_add_display_info] non_desktop set to 0
[    4.273068] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    4.273074] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    4.273081] [drm:drm_add_display_info] CEA VCDB 0x7f
[    4.273095] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[    4.489597] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.489614] [drm:drm_add_display_info] non_desktop set to 0
[    4.489621] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    4.489628] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    4.489634] [drm:drm_add_display_info] CEA VCDB 0x7f
[    4.489645] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (1)
[    4.489656] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.489663] [drm:drm_add_display_info] non_desktop set to 0
[    4.489669] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    4.489675] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    4.489681] [drm:drm_add_display_info] CEA VCDB 0x7f
[    4.489689] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[    4.489698] [drm:drm_add_edid_modes] ELD monitor Toshiba-H2C
[    4.489705] [drm:drm_add_edid_modes] HDMI: latency present 0 0,
video latency 0 0, audio latency 0 0
[    4.489714] [drm:drm_add_edid_modes] ELD size 32, SAD count 0
[    4.489720] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.489727] [drm:drm_add_display_info] non_desktop set to 0
[    4.489732] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    4.489739] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    4.489744] [drm:drm_add_display_info] CEA VCDB 0x7f
[    4.491009] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[    4.491024] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491031] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    4.491041] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491047] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    4.491058] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491063] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[    4.491074] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491080] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    4.491090] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491096] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    4.491106] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: VIRTUAL_X
[    4.491112] [drm:drm_mode_debug_printmodeline] Modeline
"1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[    4.491122] [drm:drm_mode_prune_invalid] Not using 1280x1024 mode: VIRTUAL_Y
[    4.491128] [drm:drm_mode_debug_printmodeline] Modeline "1440x900":
60 106470 1440 1520 1672 1904 900 901 907 934 0x40 0xa
[    4.491139] [drm:drm_mode_prune_invalid] Not using 1440x900 mode: VIRTUAL_X
[    4.491180] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] probed modes :
[    4.491191] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    4.491207] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    4.491220] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    4.491231] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[    4.491242] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74250 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    4.491252] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74176 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    4.491263] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
25 74250 1280 3700 3740 3960 720 725 730 750 0x40 0x5
[    4.491273] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59400 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    4.491284] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59341 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    4.491295] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[    4.491305] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    4.491316] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    4.491326] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[    4.491337] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    4.491347] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[    4.491358] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    4.491368] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    4.491378] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    4.491389] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    4.491399] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0x5
[    4.491410] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    4.491420] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    4.491431] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    4.491441] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    4.491451] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
73 31500 640 664 704 832 480 489 492 520 0x40 0xa
[    4.491462] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
67 30240 640 704 768 864 480 483 486 525 0x40 0xa
[    4.491472] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    4.491483] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    4.491493] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    4.491505] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:43:DP-1]
[    4.492017] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    4.492026] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] disconnected
[    4.492034] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2]
[    4.524201] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm HDMIC
[    4.524212] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] disconnected
[    4.524223] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:49:DP-2]
[    4.524433] [drm:cdv_intel_dp_detect] DPCD: Rev=10 LN_Rate=a
LN_CNT=82 LN_DOWNSP=40
[    4.525465] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    4.547188] systemd[1]: /usr/lib/systemd/system/cups.socket:6:
ListenStream= references a path below legacy directory /var/run/,
updating /var/run/cups/cups.sock \xe2\x86\x92 /run/cups/cups.sock;
please update the unit file accordingly.
[    4.552139] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    4.553828] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.553837] [drm:drm_add_display_info] non_desktop set to 0
[    4.553843] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    4.553855] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    4.554877] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    4.581565] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    4.581576] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.581584] [drm:drm_add_display_info] non_desktop set to 0
[    4.581590] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    4.581599] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[    4.581609] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.581616] [drm:drm_add_display_info] non_desktop set to 0
[    4.581622] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    4.581630] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    4.581638] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    4.581644] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    4.581651] [drm:drm_add_display_info] non_desktop set to 0
[    4.581656] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    4.581804] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] probed modes :
[    4.581812] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    4.581823] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
50 46760 1024 1072 1104 1184 768 771 775 790 0x40 0x9
[    4.581834] [drm:drm_client_modeset_probe] connector 37 enabled? no
[    4.581842] [drm:drm_client_modeset_probe] connector 39 enabled? yes
[    4.581848] [drm:drm_client_modeset_probe] connector 41 enabled? yes
[    4.581854] [drm:drm_client_modeset_probe] connector 43 enabled? no
[    4.581860] [drm:drm_client_modeset_probe] connector 47 enabled? no
[    4.581866] [drm:drm_client_modeset_probe] connector 49 enabled? yes
[    4.581873] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 39
[    4.581879] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 39 0
[    4.581886] [drm:drm_client_modeset_probe] found mode 1024x768
[    4.581891] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 41
[    4.581897] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 41 0
[    4.581903] [drm:drm_client_modeset_probe] found mode 1280x720
[    4.581909] [drm:drm_client_modeset_probe] looking for cmdline mode
on connector 49
[    4.581914] [drm:drm_client_modeset_probe] looking for preferred
mode on connector 49 0
[    4.581920] [drm:drm_client_modeset_probe] found mode 1024x768
[    4.581925] [drm:drm_client_modeset_probe] picking CRTCs for 1280x768 config
[    4.581938] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[    4.581945] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[    4.581951] [drm:drm_client_modeset_probe] desired mode 1280x720
set on crtc 32 (0,0)
[    4.581959] [drm:drm_mode_object_get] OBJ ID: 41 (3)
[    4.581965] [drm:drm_client_modeset_probe] desired mode 1024x768
set on crtc 34 (0,0)
[    4.581972] [drm:drm_mode_object_get] OBJ ID: 49 (3)
[    4.581979] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    4.581985] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    4.581991] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[    4.581997] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    4.582003] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    4.582009] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[    4.582026] [drm:drm_crtc_helper_set_config]
[    4.582033] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:53] #connectors=1 (x y) (0 0)
[    4.582047] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    4.582055] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    4.582063] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    4.582070] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    4.582076] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    4.582082] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    4.582089] [drm:drm_crtc_helper_set_config]
[    4.582095] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:53] #connectors=1 (x y) (0 0)
[    4.582107] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    4.582115] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    4.582123] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    4.582129] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    4.582135] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    4.582141] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    4.654324] systemd[1]: Configuration file
/usr/lib/systemd/system/cups-browsed.service is marked executable.
Please remove executable permission bits. Proceeding anyway.
[    4.686796] systemd[1]: Queued start job for default target
Multi-User System.
[    4.693886] systemd[1]: Created slice Slice /system/getty.
[    4.702416] systemd[1]: Created slice Slice /system/modprobe.
[    4.710793] systemd[1]: Created slice Slice /system/systemd-fsck.
[    4.718657] systemd[1]: Created slice User and Session Slice.
[    4.726185] systemd[1]: Started Dispatch Password Requests to
Console Directory Watch.
[    4.733850] systemd[1]: Started Forward Password Requests to Wall
Directory Watch.
[    4.741995] systemd[1]: Reached target NFS client services.
[    4.749818] systemd[1]: Reached target Preparation for Remote File Systems.
[    4.757697] systemd[1]: Reached target Remote File Systems.
[    4.765699] systemd[1]: Reached target Slice Units.
[    4.773614] systemd[1]: Reached target Swaps.
[    4.781856] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    4.799054] systemd[1]: Listening on RPCbind Server Activation Socket.
[    4.807332] systemd[1]: Reached target RPC Port Mapper.
[    4.816206] systemd[1]: Listening on Journal Audit Socket.
[    4.824670] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.832928] systemd[1]: Listening on Journal Socket.
[    4.841316] systemd[1]: Listening on udev Control Socket.
[    4.849533] systemd[1]: Listening on udev Kernel Socket.
[    4.859478] systemd[1]: Mounting Huge Pages File System...
[    4.869434] systemd[1]: Mounting POSIX Message Queue File System...
[    4.878896] systemd[1]: Mounting NFSD configuration filesystem...
[    4.889570] systemd[1]: Mounting Kernel Debug File System...
[    4.899070] systemd[1]: Mounting Kernel Trace File System...
[    4.909210] systemd[1]: Mounting Temporary Directory /tmp...
[    4.918975] systemd[1]: Starting Availability of block devices...
[    4.928958] systemd[1]: Started Entropy Daemon based on the HAVEGE algorithm.
[    4.936530] systemd[1]: Create List of Static Device Nodes was
skipped because of a failed condition check
(ConditionFileNotEmpty=/lib/modules/5.17.1/modules.devname).
[    4.946330] systemd[1]: Starting Monitoring of LVM2 mirrors,
snapshots etc. using dmeventd or progress polling...
[    4.961965] systemd[1]: Starting Load Kernel Module configfs...
[    4.976324] systemd[1]: Starting Load Kernel Module drm...
[    4.987499] systemd[1]: Starting Load Kernel Module fuse...
[    4.999644] systemd[1]: Starting RPC Bind...
[    5.012199] systemd[1]: Starting File System Check on Root Device...
[    5.025260] systemd[1]: Starting Journal Service...
[    5.051476] systemd[1]: Starting Load Kernel Modules...
[    5.065338] systemd[1]: Starting Generate network units from Kernel
command line...
[    5.079879] systemd[1]: Starting Create Static Device Nodes in /dev...
[    5.091521] systemd[1]: Starting Coldplug All udev Devices...
[    5.110989] systemd[1]: Started RPC Bind.
[    5.122218] systemd[1]: Mounted Huge Pages File System.
[    5.132884] systemd[1]: Mounted POSIX Message Queue File System.
[    5.143947] systemd[1]: Mounted NFSD configuration filesystem.
[    5.154979] systemd[1]: Mounted Kernel Debug File System.
[    5.166127] systemd[1]: Mounted Kernel Trace File System.
[    5.177046] systemd[1]: Mounted Temporary Directory /tmp.
[    5.188754] systemd[1]: Finished Availability of block devices.
[    5.200378] systemd[1]: Finished Monitoring of LVM2 mirrors,
snapshots etc. using dmeventd or progress polling.
[    5.212865] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    5.218026] systemd[1]: Finished Load Kernel Module configfs.
[    5.226773] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.230986] systemd[1]: Finished Load Kernel Module drm.
[    5.239284] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    5.243287] systemd[1]: Finished Load Kernel Module fuse.
[    5.251259] systemd[1]: Finished File System Check on Root Device.
[    5.259297] systemd[1]: Finished Load Kernel Modules.
[    5.267222] systemd[1]: Finished Generate network units from Kernel
command line.
[    5.280428] systemd[1]: FUSE Control File System was skipped
because of a failed condition check
(ConditionPathExists=/sys/fs/fuse/connections).
[    5.290987] systemd[1]: Kernel Configuration File System was
skipped because of a failed condition check
(ConditionPathExists=/sys/kernel/config).
[    5.305264] systemd[1]: Starting Remount Root and Kernel File Systems...
[    5.320283] systemd[1]: Starting Apply Kernel Variables...
[    5.352980] EXT4-fs (sda3): re-mounted. Quota mode: none.
[    5.365661] systemd[1]: Finished Create Static Device Nodes in /dev.
[    5.378038] systemd[1]: Finished Remount Root and Kernel File Systems.
[    5.390432] systemd[1]: Finished Apply Kernel Variables.
[    5.402336] systemd[1]: Started Journal Service.
[    5.452300] systemd-journald[165]: Received client request to flush
runtime journal.
[    5.457692] audit: type=1334 audit(1649620621.164:2): prog-id=6 op=LOAD
[    5.462569] audit: type=1334 audit(1649620621.169:3): prog-id=7 op=LOAD
[    5.467331] audit: type=1334 audit(1649620621.174:4): prog-id=8 op=LOAD
[    6.036513] r8169 0000:02:00.0 enp2s0: renamed from eth0
[    6.071593] r8169 0000:03:00.0 enp3s0: renamed from eth1
[    7.019379] FAT-fs (sda1): Volume was not properly unmounted. Some
data may be corrupt. Please run fsck.
[    7.870412] EXT4-fs (sda4): mounted filesystem with ordered data
mode. Quota mode: none.
[    7.967270] audit: type=1334 audit(1649620623.674:5): prog-id=9 op=LOAD
[    7.979404] audit: type=1334 audit(1649620623.686:6): prog-id=10 op=LOAD
[    8.400514] audit: type=1325 audit(1649620624.107:7): table=mangle
family=2 entries=0 op=xt_register pid=250 subj=kernel
comm="iptables-restor"
[    8.408942] audit: type=1334 audit(1649620624.113:8): prog-id=11 op=LOAD
[    8.416835] audit: type=1334 audit(1649620624.113:9): prog-id=12 op=LOAD
[    8.416860] audit: type=1334 audit(1649620624.114:10): prog-id=13 op=LOAD
[    8.416877] audit: type=1300 audit(1649620624.107:7): arch=c000003e
syscall=55 success=yes exit=0 a0=5 a1=0 a2=40 a3=7ffd284cc764 items=0
ppid=1 pid=250 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="iptables-restor"
exe="/usr/sbin/xtables-legacy-multi" subj=kernel key=(null)
[    8.980214] RTL8211E Gigabit Ethernet r8169-0-200:00: attached PHY
driver (mii_bus:phy_addr=r8169-0-200:00, irq=MAC)
[    9.055339] [drm:drm_crtc_helper_set_config]
[    9.055362] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:53] #connectors=1 (x y) (0 0)
[    9.055387] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    9.055398] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    9.055408] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    9.055418] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    9.055425] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    9.055433] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    9.055441] [drm:drm_crtc_helper_set_config]
[    9.055448] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:53] #connectors=1 (x y) (0 0)
[    9.055464] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[    9.055474] [drm:drm_crtc_helper_set_config] [CONNECTOR:49:DP-2] to
[CRTC:34:crtc-1]
[    9.055484] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    9.055491] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    9.055499] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[    9.055507] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[    9.077835] [drm:drm_stub_open]
[    9.077858] [drm:drm_open] comm="weston", pid=276, minor=0
[    9.077896] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_MAGIC
[    9.077920] gma500 0000:00:02.0: [drm:drm_getmagic] 1
[    9.077936] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_AUTH_MAGIC
[    9.077951] gma500 0000:00:02.0: [drm:drm_authmagic] 1
[    9.077985] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    9.078017] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    9.078349] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    9.078392] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    9.078411] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    9.078428] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    9.078448] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    9.078466] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    9.078481] [drm:drm_ioctl] comm="weston", pid=276, ret=-95
[    9.078578] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    9.078650] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    9.078667] [drm:drm_ioctl] comm="weston", pid=276, ret=-22
[    9.078683] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    9.078803] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    9.078837] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    9.078869] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.078893] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.078918] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.078939] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.078965] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
[    9.078986] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
[    9.079005] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    9.079026] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    9.079075] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.079101] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.079127] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.079185] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.079228] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    9.079251] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    9.079277] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.079299] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.079323] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.079343] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.264805] RTL8211E Gigabit Ethernet r8169-0-300:00: attached PHY
driver (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
[    9.265111] r8169 0000:02:00.0 enp2s0: Link is Down
[    9.433092] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.433126] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1]
[    9.445222] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] disconnected
[    9.445260] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    9.445299] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.445326] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    9.445378] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.445400] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    9.445418] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.445437] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    9.445462] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445484] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445510] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445532] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445560] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445582] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445609] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445631] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445655] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.445674] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.446084] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    9.446114] [drm:drm_ioctl] comm="weston", pid=276, ret=-2
[    9.446289] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.446322] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1]
[    9.451186] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSBLC_B
[    9.451297] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] probed modes :
[    9.451313] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    9.451333] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    9.451370] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.451392] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    9.451436] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.451454] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    9.451468] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.451484] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    9.451504] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451522] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451543] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451561] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451585] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451604] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451625] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451642] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451662] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451678] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451696] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451714] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451736] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.451752] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.452102] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    9.452122] [drm:drm_ioctl] comm="weston", pid=276, ret=-2
[    9.452266] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.452288] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1]
[    9.518102] r8169 0000:03:00.0 enp3s0: Link is Down
[    9.774376] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    9.774402] [drm:drm_add_display_info] non_desktop set to 0
[    9.774411] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    9.774420] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    9.774429] [drm:drm_add_display_info] CEA VCDB 0x7f
[    9.872541] ip (368) used greatest stack depth: 12648 bytes left
[    9.898233] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (1)
[   10.251722] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.251747] [drm:drm_add_display_info] non_desktop set to 0
[   10.251757] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   10.251766] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   10.251774] [drm:drm_add_display_info] CEA VCDB 0x7f
[   10.347211] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[   10.347251] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.347265] [drm:drm_add_display_info] non_desktop set to 0
[   10.347275] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   10.347285] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   10.347295] [drm:drm_add_display_info] CEA VCDB 0x7f
[   10.347310] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (1)
[   10.347327] [drm:drm_add_edid_modes] ELD monitor Toshiba-H2C
[   10.347339] [drm:drm_add_edid_modes] HDMI: latency present 0 0,
video latency 0 0, audio latency 0 0
[   10.347353] [drm:drm_add_edid_modes] ELD size 32, SAD count 0
[   10.347364] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.347374] [drm:drm_add_display_info] non_desktop set to 0
[   10.347383] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   10.347393] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   10.347401] [drm:drm_add_display_info] CEA VCDB 0x7f
[   10.349197] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] probed modes :
[   10.349225] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[   10.349244] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[   10.349261] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[   10.349277] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[   10.349294] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[   10.349311] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[   10.349329] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[   10.349346] [drm:drm_mode_debug_printmodeline] Modeline
"1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[   10.349363] [drm:drm_mode_debug_printmodeline] Modeline "1440x900":
60 106470 1440 1520 1672 1904 900 901 907 934 0x40 0xa
[   10.349381] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[   10.349398] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[   10.349415] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[   10.349433] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74250 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   10.349450] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74176 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   10.349466] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
25 74250 1280 3700 3740 3960 720 725 730 750 0x40 0x5
[   10.349482] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59400 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   10.349498] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59341 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   10.349515] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[   10.349531] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[   10.349547] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[   10.349563] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[   10.349579] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[   10.349596] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[   10.349614] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[   10.349631] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[   10.349649] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[   10.349667] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[   10.349684] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0x5
[   10.349701] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   10.349719] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   10.349737] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   10.349755] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[   10.349771] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
73 31500 640 664 704 832 480 489 492 520 0x40 0xa
[   10.349788] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
67 30240 640 704 768 864 480 483 486 525 0x40 0xa
[   10.349803] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[   10.349819] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   10.349836] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   10.353225] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   10.353279] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.353327] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   10.353375] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.353396] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   10.353414] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.353432] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   10.353457] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353478] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353503] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353525] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353553] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353575] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353601] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353622] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353646] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353665] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353687] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353707] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.353734] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   10.353751] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)
[   10.353767] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   10.353783] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)
[   10.354138] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[   10.354225] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCRTC
[   10.354366] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.354391] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:43:DP-1]
[   10.354912] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[   10.354931] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] disconnected
[   10.354948] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   10.354975] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.354996] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   10.355035] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.355054] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   10.355068] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.355083] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   10.355103] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355120] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355140] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355196] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355222] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355240] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355263] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355281] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355301] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355317] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355336] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355355] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355376] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355393] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.355690] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[   10.355711] [drm:drm_ioctl] comm="weston", pid=276, ret=-2
[   10.355783] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.355803] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2]
[   10.418205] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm HDMIC
[   10.418229] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] disconnected
[   10.422225] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   10.422273] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.422301] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   10.422343] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.422362] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   10.422377] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.422394] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   10.422415] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422434] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422456] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422476] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422502] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422521] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422545] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422563] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422585] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422603] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422623] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422643] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.422994] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[   10.423025] [drm:drm_ioctl] comm="weston", pid=276, ret=-2
[   10.423207] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.423235] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:49:DP-2]
[   10.423455] [drm:cdv_intel_dp_detect] DPCD: Rev=10 LN_Rate=a
LN_CNT=82 LN_DOWNSP=40
[   10.424494] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   10.451431] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   10.451463] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.451475] [drm:drm_add_display_info] non_desktop set to 0
[   10.451484] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   10.513727] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[   10.514795] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   10.541617] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   10.541646] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.541661] [drm:drm_add_display_info] non_desktop set to 0
[   10.541672] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   10.568931] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (1)
[   10.568968] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.568982] [drm:drm_add_display_info] non_desktop set to 0
[   10.568993] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   10.569010] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[   10.569026] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   10.569036] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   10.569045] [drm:drm_add_display_info] non_desktop set to 0
[   10.569054] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   10.569290] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] probed modes :
[   10.569312] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[   10.569332] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
50 46760 1024 1072 1104 1184 768 771 775 790 0x40 0x9
[   10.569377] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[   10.569413] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   10.569437] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[   10.569478] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.569499] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[   10.569516] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   10.570973] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[   10.571289] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571322] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571349] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571370] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571396] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571419] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571444] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571466] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571679] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571706] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571729] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571752] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571778] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571800] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   10.571826] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   10.571842] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (2)
[   10.571860] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   10.571876] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (2)
[   10.572630] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[   10.572675] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCRTC
[   10.576674] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[   10.576727] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCRTC
[   10.576754] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   10.578690] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_ADDFB2
[   10.578729] [drm:drm_mode_addfb2] [FB:51]
[   10.578743] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   10.578797] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   10.578830] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_ADDFB2
[   10.578849] [drm:drm_mode_addfb2] [FB:55]
[   10.578860] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   10.657545] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETCRTC
[   10.657580] [drm:drm_mode_setcrtc] [CRTC:34:crtc-1]
[   10.657594] [drm:drm_crtc_helper_set_config]
[   10.657603] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1] [NOFB]
[   10.657617] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (4)
[   10.657649] [drm:cdv_intel_dp_link_down.isra.0]
[   10.832187] [drm:drm_mode_object_get] OBJ ID: 53 (3)
[   10.832212] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (4)
[   10.832222] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (3)
[   10.832263] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETCRTC
[   10.832284] [drm:drm_mode_setcrtc] [CRTC:32:crtc-0]
[   10.832305] [drm:drm_mode_setcrtc] [CONNECTOR:41:DVI-D-1]
[   10.832315] [drm:drm_crtc_helper_set_config]
[   10.832325] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0]
[FB:55] #connectors=1 (x y) (0 0)
[   10.832348] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:32:crtc-0]
[   10.832368] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   10.832378] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (2)
[   10.832387] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   10.832397] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   10.832447] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   10.832481] gma500 0000:00:02.0: [drm:drm_vblank_enable] enabling
vblank on crtc 0, ret: 0
[   10.832504] [drm:drm_mode_object_get] OBJ ID: 55 (3)
[   10.832514] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (4)
[   10.832524] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   10.832540] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   10.832559] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (4)
[   11.836857] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   11.836895] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 142337 to client
[   11.887742] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   11.887787] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   11.887799] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   11.887808] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   11.922241] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   11.922286] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   11.922298] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   11.922307] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   11.974844] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   11.974893] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   11.974905] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   11.974915] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.023828] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.023872] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.023884] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.023893] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.074269] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.074315] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.074327] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.074336] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.130334] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.130380] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.130392] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.130402] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.173926] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.173975] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.173986] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.173995] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.241143] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.241214] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.241226] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.241235] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.291739] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.291785] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.291797] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.291806] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.341216] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.341260] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.341271] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.341280] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.391181] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.391225] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.391237] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.391245] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.440744] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.440790] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.440802] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.440810] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.490643] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.490688] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.490700] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.490708] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.540619] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.540665] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.540678] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.540688] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.590619] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.590666] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.590678] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.590687] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.631644] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.631692] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.631703] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.631712] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.681975] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.682027] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.682042] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.682052] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.727411] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.727459] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.727472] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.727481] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.755712] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.755758] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.755769] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.755779] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   12.788844] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.788890] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   12.788902] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   12.788912] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   12.819312] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   12.819357] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   12.819369] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   12.819378] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   13.046231] r8169 0000:03:00.0 enp3s0: Link is Up - 1Gbps/Full -
flow control off
[   13.046273] IPv6: ADDRCONF(NETDEV_CHANGE): enp3s0: link becomes ready
[   14.222357] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   14.222392] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 179201 to client
[   14.549486] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   14.549534] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   14.549549] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   14.549560] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   18.621609] NFSD: Using nfsdcld client tracking operations.
[   18.621630] NFSD: no clients to reclaim, skipping NFSv4 grace
period (net f0000098)
[   19.329188] ip (512) used greatest stack depth: 12264 bytes left
[   19.449915] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   19.449954] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 259329 to client
[   19.566206] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   19.566263] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   19.566276] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   19.566285] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   21.060825] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   21.060867] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 284161 to client
[   21.147858] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   21.147903] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   21.147915] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   21.147924] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   21.670223] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   21.670259] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 293633 to client
[   21.765326] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   21.765373] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   21.765386] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   21.765394] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   21.991433] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   21.991470] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 298497 to client
[   22.067767] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   22.067812] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   22.067823] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   22.067832] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   22.228640] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   22.228682] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 302081 to client
[   22.322925] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   22.322970] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   22.322982] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   22.322990] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   27.396174] gma500 0000:00:02.0: [drm:vblank_disable_fn] disabling
vblank on crtc 0
[   33.534444] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   33.534487] gma500 0000:00:02.0: [drm:drm_vblank_enable] enabling
vblank on crtc 0, ret: 0
[   33.534507] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 475649 to client
[   33.534550] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   33.534583] [drm:drm_mode_object_get] OBJ ID: 51 (3)
[   33.534595] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (4)
[   33.534603] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   33.650302] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   33.650350] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   33.650362] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   33.650371] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   33.766683] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   33.766719] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 479233 to client
[   33.875469] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   33.875515] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   33.875527] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   33.875536] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   34.006240] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   34.006277] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 483073 to client
[   34.089118] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   34.089196] [drm:drm_mode_object_get] OBJ ID: 55 (2)
[   34.089209] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (3)
[   34.089217] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   36.058321] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_WAIT_VBLANK
[   36.058358] gma500 0000:00:02.0: [drm:drm_wait_vblank_ioctl] crtc 0
returning 514561 to client
[   36.146317] [drm:drm_ioctl] comm="weston" pid=276, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[   36.146360] [drm:drm_mode_object_get] OBJ ID: 51 (2)
[   36.146372] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)
[   36.146381] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)


>
> What machine is this? I've seen very few gma500 devices with UEFI.

Yeah, it's probably not the most common board:
https://www.jetwayipc.com/product/nf9b-2550/

>
> >
> > >
> > > -Patrik
> > >
> > > > ---
> > > > Changes v2 -> v3:
> > > >   - select EFI_FB instead of depending on it
> > > > Changes v1 -> v2:
> > > >   - use depends instead of select
> > > > ---
> > > >  drivers/gpu/drm/gma500/Kconfig | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> > > > index 0cff20265f97..a422fa84d53b 100644
> > > > --- a/drivers/gpu/drm/gma500/Kconfig
> > > > +++ b/drivers/gpu/drm/gma500/Kconfig
> > > > @@ -2,11 +2,13 @@
> > > >  config DRM_GMA500
> > > >         tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> > > >         depends on DRM && PCI && X86 && MMU
> > > > +       depends on FB
> > > >         select DRM_KMS_HELPER
> > > >         # GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
> > > >         select ACPI_VIDEO if ACPI
> > > >         select BACKLIGHT_CLASS_DEVICE if ACPI
> > > >         select INPUT if ACPI
> > > > +       select FB_EFI if EFI
> > > >         help
> > > >           Say yes for an experimental 2D KMS framebuffer driver for the
> > > >           Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
> > > > --
> > > > 2.25.1
> > > >
