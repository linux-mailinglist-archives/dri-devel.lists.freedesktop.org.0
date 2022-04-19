Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F578507D3B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 01:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343610E36F;
	Tue, 19 Apr 2022 23:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1508E10E2F0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 23:42:14 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z8so312284oix.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7K3W59/mzfUqmZkuFiPGNrFtmn+blZ2rgxd+d4AeJwA=;
 b=M5ORAizL8a0Om53r9mNFXJpd3nYLqM8aOJ+sT4b8GlOrXrhkwNynLHIVFKPiIpA0jP
 r0vqbD3kl5Z02MREfD5uUrAJTbB01yOI5+TCqdQgxZMD7eisrLwbQ9FtVOQlKfZ/18Yi
 0wVxxRayc+aZoaEfgkHqaGZO1iQhOxwRwhft0fiobXMFnLJIf3116+6Rn43lE37KrF+5
 +o8tJJd5HbmcDtCeLD3Xr9p7znisLZcRuX6RyNOAuj3+GoLyRV2R8Ju59gttsrPNHZX4
 c9GrGbqzRMqsNcYSScqGOay5C3EofVTvcA2tW/Z3lhS4YRXm7uySbmGIDrYjopYgZaSG
 W+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7K3W59/mzfUqmZkuFiPGNrFtmn+blZ2rgxd+d4AeJwA=;
 b=LhIdpZg8CpNoxBCQXbWTuc8Ge+kxtP/rJUtFiIcTvtZAHrsXslN6hoSuGqz5Jb36h2
 jeHFRF4saFo9gxW7pl5DU4yyzYtGpdkp7MHtnT1kHfSigQxvyx3QUrqkAMIV2KqAs7+t
 TqPAEEIacpQzdaf1NG1uhf8DpxA8sKS+nH3WHqEepblRCQOUWdM7794ndich/CwwY1DM
 /UIoaH8RnOBZUO8BNcycKWOI19a4XaBsMy+2ju9t2PO0AnPFE+XUFywWZErZhrZrX5P9
 WetCYWJULNWeI+4c/xR8y2LdvoeyhnxVWC0Iv80QGAjP2SJRl6L59CC9PdRJfOGaU+gk
 f6eg==
X-Gm-Message-State: AOAM533O6CyPHATFLuS7Bbvl8jWfhuizQ24/gt9p7t8JbgwkLX+EgbIj
 yfUdK9BUa6Z7j0FOLVjxYMVUWHHkAuAc/bBwIgY=
X-Google-Smtp-Source: ABdhPJxSRjXEUKCNCKNboV81q6ow6B6aLvDuzTNhCt81J2ErzZgNnnhy+UIgy2Ax3/j9wylaxsemyDvzskxDAlJD0GY=
X-Received: by 2002:a05:6808:10c9:b0:322:b09e:a077 with SMTP id
 s9-20020a05680810c900b00322b09ea077mr489788ois.99.1650411732329; Tue, 19 Apr
 2022 16:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
 <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
 <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
 <CADvTj4rR5zt5iFTDrrYfNQ267KV896dHnjJHx6yq=e10+V_Okg@mail.gmail.com>
 <CAMeQTsZyp40ybkNxnYDCR=pvXRzWvtBLkT+i4VPyjNiwwWg0-A@mail.gmail.com>
In-Reply-To: <CAMeQTsZyp40ybkNxnYDCR=pvXRzWvtBLkT+i4VPyjNiwwWg0-A@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Apr 2022 18:42:01 -0500
Message-ID: <CADvTj4rtFzOSCG0nPCTxqhNfVcDLX3JuY4QGTS24m79VGWfWVQ@mail.gmail.com>
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

On Tue, Apr 12, 2022 at 3:30 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Tue, Apr 12, 2022 at 3:48 AM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Mon, Apr 11, 2022 at 3:27 AM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > >
> > > On Sun, Apr 10, 2022 at 10:05 PM James Hilliard
> > > <james.hilliard1@gmail.com> wrote:
> > > >
> > > > On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
> > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > >
> > > > > On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > > >
> > > > > > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > > > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Select the efi framebuffer if efi is enabled.
> > > > > > > >
> > > > > > > > This appears to be needed for video output to function correctly.
> > > > > > > >
> > > > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > > > >
> > > > > > > Hi James,
> > > > > > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > > > > > hardware. What makes you think it's required?
> > > > > >
> > > > > > I wasn't getting any HDMI video output without it enabled for some reason,
> > > > > > I assume it is doing some sort of initialization needed by gma500
> > > > > > during startup.
> > > > >
> > > > > Then it sounds like you might just be using EFI_FB and not gma500. Can
> > > > > you provide the kernel log with drm.debug=0x1f set on kernel
> > > > > command-line.
> > > >
> > > > Seems efifb loads first and then hands off to gma500
> > >
> > > That is how it normally works but efifb shouldn't change the state of
> > > the currently set mode so shouldn't affect gma500.
> > > From the logs I can see that you have LVDS (internal panel), HDMI and
> > > DP (3 displays in total) connected. This sounds wrong. Your version of
> > > gma500 (Cedarview) doesn't support more than 2 crtcs/pipes. This might
> > > be a problem.
> >
> > Yeah, there's a bug there with the connector status, only DVI-D-1 is actually
> > connected, I have DP-2 and LVDS-1 turned off in weston.
>
> Ok, but are the connectors physically connected to anything?

There is one HDMI cable physically connected to the board

> Regardless of what you do in Weston, the connectors shouldn't be
> getting modes if they aren't used.

Yeah, it seems there's a bug there, not sure if that's related to the
output failure when efifb isn't available.

> LVDS might be from VBIOS but I'm
> not sure where the DP modes come from. It would help if you also
> provide kernel logs with drm.debug=0x1f when the outputs doesn't work
> so I have something to compare with.

Log with efifb/fb not enabled in kernel build which causes no
HDMI output:

[    0.000000] Linux version 5.17.3 (buildroot@james-x399)
(x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot
2022.02-533-g95bc9df0b3) 10.3.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP
PREEMPT Tue Apr 19 15:14:53 MDT 2022
[    0.000000] Command line:
root=PARTUUID=dea0d091-16af-704f-977c-1a5475cf261c rootwait
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
[    0.000000] tsc: Detected 1862.242 MHz processor
[    0.001842] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.001852] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001878] last_pfn = 0x130000 max_arch_pfn = 0x400000000
[    0.001927] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.002220] last_pfn = 0xcf6f0 max_arch_pfn = 0x400000000
[    0.007860] found SMP MP-table at [mem 0x000fce60-0x000fce6f]
[    0.011551] Secure boot disabled
[    0.011559] ACPI: Early table checksum verification disabled
[    0.011570] ACPI: RSDP 0x00000000CF386000 000024 (v02 _     )
[    0.011582] ACPI: XSDT 0x00000000CF386068 00004C (v01 _      _
  01072009 AMI  00010013)
[    0.011598] ACPI: FACP 0x00000000CF38D538 0000F4 (v04 _      _
  01072009 AMI  00010013)
[    0.011614] ACPI: DSDT 0x00000000CF386140 0073F2 (v02 _      _
  00000A03 INTL 20051117)
[    0.011627] ACPI: FACS 0x00000000CF3D0F80 000040
[    0.011636] ACPI: APIC 0x00000000CF38D630 000072 (v03 _      _
  01072009 AMI  00010013)
[    0.011648] ACPI: MCFG 0x00000000CF38D6A8 00003C (v01 _      _
  01072009 MSFT 00000097)
[    0.011660] ACPI: HPET 0x00000000CF38D6E8 000038 (v01 _      _
  01072009 AMI. 00000004)
[    0.011672] ACPI: SSDT 0x00000000CF38D720 000655 (v01 PmRef  CpuPm
  00003000 INTL 20051117)
[    0.011682] ACPI: Reserving FACP table memory at [mem 0xcf38d538-0xcf38d62b]
[    0.011689] ACPI: Reserving DSDT table memory at [mem 0xcf386140-0xcf38d531]
[    0.011695] ACPI: Reserving FACS table memory at [mem 0xcf3d0f80-0xcf3d0fbf]
[    0.011700] ACPI: Reserving APIC table memory at [mem 0xcf38d630-0xcf38d6a1]
[    0.011706] ACPI: Reserving MCFG table memory at [mem 0xcf38d6a8-0xcf38d6e3]
[    0.011711] ACPI: Reserving HPET table memory at [mem 0xcf38d6e8-0xcf38d71f]
[    0.011717] ACPI: Reserving SSDT table memory at [mem 0xcf38d720-0xcf38dd74]
[    0.011972] No NUMA configuration found
[    0.011977] Faking a node at [mem 0x0000000000000000-0x000000012fffffff]
[    0.011990] NODE_DATA(0) allocated [mem 0x12fff8000-0x12fffbfff]
[    0.012063] Zone ranges:
[    0.012067]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.012074]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.012080]   Normal   [mem 0x0000000100000000-0x000000012fffffff]
[    0.012086] Movable zone start for each node
[    0.012090] Early memory node ranges
[    0.012092]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.012098]   node   0: [mem 0x0000000000100000-0x00000000cf32cfff]
[    0.012104]   node   0: [mem 0x00000000cf43b000-0x00000000cf5bafff]
[    0.012108]   node   0: [mem 0x00000000cf6e7000-0x00000000cf6effff]
[    0.012113]   node   0: [mem 0x0000000100000000-0x000000012fffffff]
[    0.012119] Initmem setup node 0 [mem 0x0000000000001000-0x000000012fffffff]
[    0.012131] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.012209] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.048130] On node 0, zone DMA32: 270 pages in unavailable ranges
[    0.048152] On node 0, zone DMA32: 300 pages in unavailable ranges
[    0.056654] On node 0, zone Normal: 2320 pages in unavailable ranges
[    0.057060] ACPI: PM-Timer IO Port: 0x408
[    0.057079] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.057102] IOAPIC[0]: apic_id 4, version 32, address 0xfec00000, GSI 0-23
[    0.057111] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.057117] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.057128] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.057132] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.057146] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.057252] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.057262] PM: hibernation: Registered nosave memory: [mem
0x000a0000-0x000fffff]
[    0.057272] PM: hibernation: Registered nosave memory: [mem
0x020d9000-0x020d9fff]
[    0.057281] PM: hibernation: Registered nosave memory: [mem
0x020e5000-0x020e5fff]
[    0.057290] PM: hibernation: Registered nosave memory: [mem
0x021da000-0x021dafff]
[    0.057299] PM: hibernation: Registered nosave memory: [mem
0x021ea000-0x021eafff]
[    0.057308] PM: hibernation: Registered nosave memory: [mem
0x02215000-0x02215fff]
[    0.057317] PM: hibernation: Registered nosave memory: [mem
0x0221d000-0x0221dfff]
[    0.057326] PM: hibernation: Registered nosave memory: [mem
0x02237000-0x02237fff]
[    0.057336] PM: hibernation: Registered nosave memory: [mem
0x02243000-0x02243fff]
[    0.057345] PM: hibernation: Registered nosave memory: [mem
0xcf32d000-0xcf374fff]
[    0.057350] PM: hibernation: Registered nosave memory: [mem
0xcf375000-0xcf385fff]
[    0.057354] PM: hibernation: Registered nosave memory: [mem
0xcf386000-0xcf38dfff]
[    0.057358] PM: hibernation: Registered nosave memory: [mem
0xcf38e000-0xcf3b5fff]
[    0.057363] PM: hibernation: Registered nosave memory: [mem
0xcf3b6000-0xcf3b6fff]
[    0.057367] PM: hibernation: Registered nosave memory: [mem
0xcf3b7000-0xcf3c6fff]
[    0.057371] PM: hibernation: Registered nosave memory: [mem
0xcf3c7000-0xcf3d2fff]
[    0.057375] PM: hibernation: Registered nosave memory: [mem
0xcf3d3000-0xcf3f7fff]
[    0.057379] PM: hibernation: Registered nosave memory: [mem
0xcf3f8000-0xcf43afff]
[    0.057389] PM: hibernation: Registered nosave memory: [mem
0xcf5bb000-0xcf6e6fff]
[    0.057399] PM: hibernation: Registered nosave memory: [mem
0xcf6f0000-0xcfffffff]
[    0.057403] PM: hibernation: Registered nosave memory: [mem
0xd0000000-0xdfffffff]
[    0.057407] PM: hibernation: Registered nosave memory: [mem
0xe0000000-0xefffffff]
[    0.057412] PM: hibernation: Registered nosave memory: [mem
0xf0000000-0xfebfffff]
[    0.057416] PM: hibernation: Registered nosave memory: [mem
0xfec00000-0xfec00fff]
[    0.057420] PM: hibernation: Registered nosave memory: [mem
0xfec01000-0xfecfffff]
[    0.057424] PM: hibernation: Registered nosave memory: [mem
0xfed00000-0xfed00fff]
[    0.057428] PM: hibernation: Registered nosave memory: [mem
0xfed01000-0xfed13fff]
[    0.057433] PM: hibernation: Registered nosave memory: [mem
0xfed14000-0xfed19fff]
[    0.057437] PM: hibernation: Registered nosave memory: [mem
0xfed1a000-0xfed1bfff]
[    0.057441] PM: hibernation: Registered nosave memory: [mem
0xfed1c000-0xfed8ffff]
[    0.057445] PM: hibernation: Registered nosave memory: [mem
0xfed90000-0xfedfffff]
[    0.057449] PM: hibernation: Registered nosave memory: [mem
0xfee00000-0xfee00fff]
[    0.057453] PM: hibernation: Registered nosave memory: [mem
0xfee01000-0xffdfffff]
[    0.057458] PM: hibernation: Registered nosave memory: [mem
0xffe00000-0xffffffff]
[    0.057464] [mem 0xd0000000-0xdfffffff] available for PCI devices
[    0.057477] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.074900] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64
nr_cpu_ids:4 nr_node_ids:1
[    0.078358] percpu: Embedded 53 pages/cpu s179544 r8192 d29352 u524288
[    0.078395] pcpu-alloc: s179544 r8192 d29352 u524288 alloc=1*2097152
[    0.078403] pcpu-alloc: [0] 0 1 2 3
[    0.078498] Fallback order for Node 0: 0
[    0.078510] Built 1 zonelists, mobility grouping on.  Total pages: 1029091
[    0.078515] Policy zone: Normal
[    0.078520] Kernel command line:
root=PARTUUID=dea0d091-16af-704f-977c-1a5475cf261c rootwait
drm.debug=0x1f console=tty1
[    0.082440] Dentry cache hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    0.084381] Inode-cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.084480] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.284517] Memory: 3984680K/4182356K available (18445K kernel
code, 2855K rwdata, 5568K rodata, 1276K init, 656K bss, 197416K
reserved, 0K cma-reserved)
[    0.284673] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.286322] Dynamic Preempt: voluntary
[    0.286429] rcu: Preemptible hierarchical RCU implementation.
[    0.286435] rcu: RCU event tracing is enabled.
[    0.286438] rcu: RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
[    0.286443] Trampoline variant of Tasks RCU enabled.
[    0.286446] Tracing variant of Tasks RCU enabled.
[    0.286450] rcu: RCU calculated value of scheduler-enlistment delay
is 100 jiffies.
[    0.286454] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.290849] NR_IRQS: 4352, nr_irqs: 456, preallocated irqs: 16
[    0.291329] random: get_random_bytes called from
start_kernel+0x49c/0x66b with crng_init=0
[    0.291421] Console: colour dummy device 80x25
[    0.292426] printk: console [tty1] enabled
[    0.292487] ACPI: Core revision 20211217
[    0.292702] clocksource: hpet: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 133484882848 ns
[    0.292743] APIC: Switch to symmetric I/O mode setup
[    0.293353] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=0 pin2=0
[    0.297744] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x35afae52766, max_idle_ns: 881590503306 ns
[    0.297771] Calibrating delay loop (skipped), value calculated
using timer frequency.. 3724.48 BogoMIPS (lpj=1862242)
[    0.297788] pid_max: default: 32768 minimum: 301
[    0.308142] LSM: Security Framework initializing
[    0.308182] SELinux:  Initializing.
[    0.308300] Mount-cache hash table entries: 8192 (order: 4, 65536
bytes, linear)
[    0.308345] Mountpoint-cache hash table entries: 8192 (order: 4,
65536 bytes, linear)
[    0.308826] Disabled fast string operations
[    0.308860] CPU0: Thermal monitoring enabled (TM1)
[    0.308888] process: using mwait in idle threads
[    0.308900] Last level iTLB entries: 4KB 32, 2MB 0, 4MB 0
[    0.308909] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 8, 1GB 0
[    0.326596] Freeing SMP alternatives memory: 48K
[    0.429523] smpboot: CPU0: Intel(R) Atom(TM) CPU D2550   @ 1.86GHz
(family: 0x6, model: 0x36, stepping: 0x1)
[    0.429762] cblist_init_generic: Setting adjustable number of
callback queues.
[    0.429762] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.429762] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.429762] Performance Events: PEBS fmt0+, Atom events, 8-deep
LBR, Intel PMU driver.
[    0.429762] ... version:                3
[    0.429762] ... bit width:              40
[    0.429762] ... generic registers:      2
[    0.429762] ... value mask:             000000ffffffffff
[    0.429762] ... max period:             000000007fffffff
[    0.429762] ... fixed-purpose events:   3
[    0.429762] ... event mask:             0000000700000003
[    0.429762] rcu: Hierarchical SRCU implementation.
[    0.430521] smp: Bringing up secondary CPUs ...
[    0.430900] x86: Booting SMP configuration:
[    0.430915] .... node  #0, CPUs:      #1
[    0.002497] Disabled fast string operations
[    0.431762] TSC synchronization [CPU#0 -> CPU#1]:
[    0.431762] Measured 3332 cycles TSC warp between CPUs, turning off
TSC clock.
[    0.431762] tsc: Marking TSC unstable due to check_tsc_sync_source failed
[    0.432120]  #2
[    0.002497] Disabled fast string operations
[    0.433096]  #3
[    0.002497] Disabled fast string operations
[    0.433244] smp: Brought up 1 node, 4 CPUs
[    0.433244] smpboot: Max logical packages: 1
[    0.433244] smpboot: Total of 4 processors activated (14897.93 BogoMIPS)
[    0.434772] devtmpfs: initialized
[    0.435178] ACPI: PM: Registering ACPI NVS region [mem
0xcf32d000-0xcf374fff] (294912 bytes)
[    0.435178] ACPI: PM: Registering ACPI NVS region [mem
0xcf3b6000-0xcf3b6fff] (4096 bytes)
[    0.435178] ACPI: PM: Registering ACPI NVS region [mem
0xcf3c7000-0xcf3d2fff] (49152 bytes)
[    0.435178] ACPI: PM: Registering ACPI NVS region [mem
0xcf3f8000-0xcf43afff] (274432 bytes)
[    0.435178] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.435178] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.435783] PM: RTC time: 23:34:15, date: 2022-04-19
[    0.436035] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.436343] audit: initializing netlink subsys (disabled)
[    0.436386] audit: type=2000 audit(1650411255.143:1):
state=initialized audit_enabled=0 res=1
[    0.436826] thermal_sys: Registered thermal governor 'step_wise'
[    0.436832] thermal_sys: Registered thermal governor 'user_space'
[    0.436902] cpuidle: using governor menu
[    0.436983] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
0xe0000000-0xefffffff] (base 0xe0000000)
[    0.437009] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.437033] pmd_set_huge: Cannot satisfy [mem
0xe0000000-0xe0200000] with a huge-page mapping due to MTRR override.
[    0.437817] PCI: Using configuration type 1 for base access
[    0.446870] kprobes: kprobe jump-optimization is enabled. All
kprobes are optimized if possible.
[    0.446905] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.447800] ACPI: Added _OSI(Module Device)
[    0.447816] ACPI: Added _OSI(Processor Device)
[    0.447824] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.447832] ACPI: Added _OSI(Processor Aggregator Device)
[    0.447841] ACPI: Added _OSI(Linux-Dell-Video)
[    0.447849] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.447858] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.457460] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.459788] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.461088] ACPI: Dynamic OEM Table Load:
[    0.461121] ACPI: SSDT 0xFFFF8A81002C9800 0006D5 (v01 PmRef
Cpu0Cst  00003001 INTL 20051117)
[    0.463205] ACPI: Dynamic OEM Table Load:
[    0.463229] ACPI: SSDT 0xFFFF8A81009B80C0 00008D (v01 PmRef  ApCst
  00003000 INTL 20051117)
[    0.466652] ACPI: Interpreter enabled
[    0.466711] ACPI: PM: (supports S0 S1 S4 S5)
[    0.466722] ACPI: Using IOAPIC for interrupt routing
[    0.466818] PCI: Using host bridge windows from ACPI; if necessary,
use "pci=nocrs" and report a bug
[    0.467619] ACPI: Enabled 12 GPEs in block 00 to 1F
[    0.489742] ACPI: PM: Power Resource [FN00]
[    0.491691] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.491720] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI HPX-Type3]
[    0.491856] acpi PNP0A08:00: _OSC: OS requested [PME PCIeCapability LTR]
[    0.491870] acpi PNP0A08:00: _OSC: platform willing to grant [PME
PCIeCapability LTR]
[    0.491881] acpi PNP0A08:00: _OSC: platform retains control of PCIe
features (AE_ERROR)
[    0.492334] PCI host bridge to bus 0000:00
[    0.492348] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.492361] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.492372] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000fffff window]
[    0.492385] pci_bus 0000:00: root bus resource [mem
0xcf800000-0xfebfffff window]
[    0.492398] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.492435] pci 0000:00:00.0: [8086:0bf3] type 00 class 0x060000
[    0.492680] pci 0000:00:02.0: [8086:0be2] type 00 class 0x030000
[    0.492703] pci 0000:00:02.0: reg 0x10: [mem 0xdfb00000-0xdfbfffff]
[    0.492719] pci 0000:00:02.0: reg 0x14: [io  0xf100-0xf107]
[    0.492777] pci 0000:00:02.0: Video device with shadowed ROM at
[mem 0x000c0000-0x000dffff]
[    0.493055] pci 0000:00:1b.0: [8086:27d8] type 00 class 0x040300
[    0.493097] pci 0000:00:1b.0: reg 0x10: [mem 0xdff00000-0xdff03fff 64bit]
[    0.493250] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.493496] pci 0000:00:1c.0: [8086:27d0] type 01 class 0x060400
[    0.493679] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.493945] pci 0000:00:1c.1: [8086:27d2] type 01 class 0x060400
[    0.494128] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.494378] pci 0000:00:1c.2: [8086:27d4] type 01 class 0x060400
[    0.494560] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.494816] pci 0000:00:1c.3: [8086:27d6] type 01 class 0x060400
[    0.494998] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.495243] pci 0000:00:1d.0: [8086:27c8] type 00 class 0x0c0300
[    0.495328] pci 0000:00:1d.0: reg 0x20: [io  0xf0a0-0xf0bf]
[    0.495564] pci 0000:00:1d.1: [8086:27c9] type 00 class 0x0c0300
[    0.495649] pci 0000:00:1d.1: reg 0x20: [io  0xf080-0xf09f]
[    0.495900] pci 0000:00:1d.2: [8086:27ca] type 00 class 0x0c0300
[    0.495985] pci 0000:00:1d.2: reg 0x20: [io  0xf060-0xf07f]
[    0.496238] pci 0000:00:1d.3: [8086:27cb] type 00 class 0x0c0300
[    0.496323] pci 0000:00:1d.3: reg 0x20: [io  0xf040-0xf05f]
[    0.496582] pci 0000:00:1d.7: [8086:27cc] type 00 class 0x0c0320
[    0.496620] pci 0000:00:1d.7: reg 0x10: [mem 0xdff05000-0xdff053ff]
[    0.496772] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.496993] pci 0000:00:1e.0: [8086:2448] type 01 class 0x060401
[    0.497314] pci 0000:00:1f.0: [8086:27bc] type 00 class 0x060100
[    0.497666] pci 0000:00:1f.2: [8086:27c1] type 00 class 0x010601
[    0.497704] pci 0000:00:1f.2: reg 0x10: [io  0xf0f0-0xf0f7]
[    0.497728] pci 0000:00:1f.2: reg 0x14: [io  0xf0e0-0xf0e3]
[    0.497750] pci 0000:00:1f.2: reg 0x18: [io  0xf0d0-0xf0d7]
[    0.497781] pci 0000:00:1f.2: reg 0x1c: [io  0xf0c0-0xf0c3]
[    0.497805] pci 0000:00:1f.2: reg 0x20: [io  0xf020-0xf02f]
[    0.497828] pci 0000:00:1f.2: reg 0x24: [mem 0xdff04000-0xdff043ff]
[    0.497911] pci 0000:00:1f.2: PME# supported from D3hot
[    0.498116] pci 0000:00:1f.3: [8086:27da] type 00 class 0x0c0500
[    0.498184] pci 0000:00:1f.3: reg 0x20: [io  0xf000-0xf01f]
[    0.498477] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.498624] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
[    0.498669] pci 0000:02:00.0: reg 0x10: [io  0xe000-0xe0ff]
[    0.498723] pci 0000:02:00.0: reg 0x18: [mem 0xdfe04000-0xdfe04fff
64bit pref]
[    0.498776] pci 0000:02:00.0: reg 0x20: [mem 0xdfe00000-0xdfe03fff
64bit pref]
[    0.498966] pci 0000:02:00.0: supports D1 D2
[    0.498976] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.499283] pci 0000:00:1c.1: PCI bridge to [bus 02]
[    0.499300] pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
[    0.499314] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff]
[    0.499453] pci 0000:03:00.0: [10ec:8168] type 00 class 0x020000
[    0.499498] pci 0000:03:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    0.499552] pci 0000:03:00.0: reg 0x18: [mem 0xdfd04000-0xdfd04fff
64bit pref]
[    0.499591] pci 0000:03:00.0: reg 0x20: [mem 0xdfd00000-0xdfd03fff
64bit pref]
[    0.499786] pci 0000:03:00.0: supports D1 D2
[    0.499797] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.500102] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    0.500119] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.500133] pci 0000:00:1c.2:   bridge window [mem 0xdfd00000-0xdfdfffff]
[    0.500273] pci 0000:04:00.0: [1b21:0612] type 00 class 0x010601
[    0.500321] pci 0000:04:00.0: reg 0x10: [io  0xc050-0xc057]
[    0.500350] pci 0000:04:00.0: reg 0x14: [io  0xc040-0xc043]
[    0.500378] pci 0000:04:00.0: reg 0x18: [io  0xc030-0xc037]
[    0.500406] pci 0000:04:00.0: reg 0x1c: [io  0xc020-0xc023]
[    0.500434] pci 0000:04:00.0: reg 0x20: [io  0xc000-0xc01f]
[    0.500462] pci 0000:04:00.0: reg 0x24: [mem 0xdfc00000-0xdfc001ff]
[    0.500659] pci 0000:04:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:1c.3 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[    0.500884] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    0.500901] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.500915] pci 0000:00:1c.3:   bridge window [mem 0xdfc00000-0xdfcfffff]
[    0.500966] pci_bus 0000:05: extended config space not accessible
[    0.501070] pci 0000:00:1e.0: PCI bridge to [bus 05] (subtractive decode)
[    0.501098] pci 0000:00:1e.0:   bridge window [io  0x0000-0x0cf7
window] (subtractive decode)
[    0.501111] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff
window] (subtractive decode)
[    0.501124] pci 0000:00:1e.0:   bridge window [mem
0x000a0000-0x000fffff window] (subtractive decode)
[    0.501137] pci 0000:00:1e.0:   bridge window [mem
0xcf800000-0xfebfffff window] (subtractive decode)
[    0.503712] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[    0.503894] ACPI: PCI: Interrupt link LNKB configured for IRQ 7
[    0.504056] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.504226] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    0.504386] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.504398] ACPI: PCI: Interrupt link LNKE disabled
[    0.504553] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.504565] ACPI: PCI: Interrupt link LNKF disabled
[    0.504722] ACPI: PCI: Interrupt link LNKG configured for IRQ 5
[    0.504907] ACPI: PCI: Interrupt link LNKH configured for IRQ 7
[    0.505685] iommu: Default domain type: Translated
[    0.505700] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.505786] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.505799] pci 0000:00:02.0: vgaarb: VGA device added:
decodes=io+mem,owns=io+mem,locks=none
[    0.505822] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.505831] vgaarb: loaded
[    0.506006] SCSI subsystem initialized
[    0.506038] libata version 3.00 loaded.
[    0.506038] ACPI: bus type USB registered
[    0.506038] usbcore: registered new interface driver usbfs
[    0.506038] usbcore: registered new interface driver hub
[    0.506038] usbcore: registered new device driver usb
[    0.506045] mc: Linux media interface: v0.10
[    0.506076] videodev: Linux video capture interface: v2.00
[    0.506099] pps_core: LinuxPPS API ver. 1 registered
[    0.506108] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.506125] PTP clock support registered
[    0.506797] Registered efivars operations
[    0.507079] Advanced Linux Sound Architecture Driver Initialized.
[    0.507427] NetLabel: Initializing
[    0.507438] NetLabel:  domain hash size = 128
[    0.507445] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.507489] NetLabel:  unlabeled traffic allowed by default
[    0.507554] PCI: Using ACPI for IRQ routing
[    0.520780] PCI: pci_cache_line_size set to 64 bytes
[    0.520877] Expanded resource Reserved due to conflict with PCI Bus 0000:00
[    0.520890] e820: reserve RAM buffer [mem 0x020d9018-0x03ffffff]
[    0.520897] e820: reserve RAM buffer [mem 0x021da018-0x03ffffff]
[    0.520901] e820: reserve RAM buffer [mem 0x02215018-0x03ffffff]
[    0.520905] e820: reserve RAM buffer [mem 0x02237018-0x03ffffff]
[    0.520908] e820: reserve RAM buffer [mem 0xcf32d000-0xcfffffff]
[    0.520913] e820: reserve RAM buffer [mem 0xcf5bb000-0xcfffffff]
[    0.520917] e820: reserve RAM buffer [mem 0xcf6f0000-0xcfffffff]
[    0.520933] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.520933] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    0.522856] clocksource: Switched to clocksource hpet
[    0.562415] VFS: Disk quotas dquot_6.6.0
[    0.562484] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.562672] pnp: PnP ACPI init
[    0.563227] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.563449] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.563471] system 00:01: [io  0xffff] has been reserved
[    0.563487] system 00:01: [io  0xffff] has been reserved
[    0.563503] system 00:01: [io  0xffff] has been reserved
[    0.563518] system 00:01: [io  0x0400-0x047f] has been reserved
[    0.563534] system 00:01: [io  0x0500-0x057f] has been reserved
[    0.563550] system 00:01: [io  0x0600-0x061f] has been reserved
[    0.563807] system 00:02: [io  0x06a0-0x06af] has been reserved
[    0.563828] system 00:02: [io  0x06b0-0x06ef] has been reserved
[    0.564481] system 00:04: [io  0x0a00-0x0a1f] has been reserved
[    0.564504] system 00:04: [io  0x0a30-0x0a3f] has been reserved
[    0.565856] pnp 00:07: [dma 3]
[    0.566922] pnp 00:08: [dma 0 disabled]
[    0.567792] pnp 00:09: [dma 0 disabled]
[    0.568852] ACPI: IRQ 10 override to edge, high
[    0.568877] pnp 00:0b: [dma 0 disabled]
[    0.569792] ACPI: IRQ 10 override to edge, high
[    0.569814] pnp 00:0c: [dma 0 disabled]
[    0.570689] ACPI: IRQ 10 override to edge, high
[    0.570710] pnp 00:0d: [dma 0 disabled]
[    0.571610] ACPI: IRQ 10 override to edge, high
[    0.571631] pnp 00:0e: [dma 0 disabled]
[    0.572070] system 00:0f: [io  0x04d0-0x04d1] has been reserved
[    0.572503] system 00:10: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.572526] system 00:10: [mem 0x00000000-0x00003fff] could not be reserved
[    0.572543] system 00:10: [mem 0x00000000-0x00000fff] could not be reserved
[    0.572560] system 00:10: [mem 0x00000000-0x00000fff] could not be reserved
[    0.572577] system 00:10: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.573278] system 00:11: [mem 0xfed14000-0xfed19fff] has been reserved
[    0.573301] system 00:11: [mem 0xe0000000-0xefffffff] has been reserved
[    0.573872] system 00:12: [io  0x0400-0x047f] has been reserved
[    0.573893] system 00:12: [io  0x0500-0x053f] has been reserved
[    0.573915] system 00:12: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.573933] system 00:12: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.573949] system 00:12: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.573966] system 00:12: [mem 0xfed20000-0xfed8ffff] could not be reserved
[    0.573983] system 00:12: [mem 0xffe00000-0xffffffff] has been reserved
[    0.574020] pnp: PnP ACPI: found 19 devices
[    0.585252] clocksource: acpi_pm: mask: 0xffffff max_cycles:
0xffffff, max_idle_ns: 2085701024 ns
[    0.585384] NET: Registered PF_INET protocol family
[    0.585651] IP idents hash table entries: 65536 (order: 7, 524288
bytes, linear)
[    0.587838] tcp_listen_portaddr_hash hash table entries: 2048
(order: 3, 32768 bytes, linear)
[    0.587905] TCP established hash table entries: 32768 (order: 6,
262144 bytes, linear)
[    0.588169] TCP bind hash table entries: 32768 (order: 7, 524288
bytes, linear)
[    0.588487] TCP: Hash tables configured (established 32768 bind 32768)
[    0.588685] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.588813] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.589031] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.589391] RPC: Registered named UNIX socket transport module.
[    0.589411] RPC: Registered udp transport module.
[    0.589421] RPC: Registered tcp transport module.
[    0.589431] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.590149] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to
[bus 01] add_size 1000
[    0.590179] pci 0000:00:1c.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000
add_align 100000
[    0.590204] pci 0000:00:1c.0: bridge window [mem
0x00100000-0x000fffff] to [bus 01] add_size 200000 add_align 100000
[    0.590229] pci 0000:00:1c.1: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000
add_align 100000
[    0.590254] pci 0000:00:1c.2: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 03] add_size 200000
add_align 100000
[    0.590279] pci 0000:00:1c.3: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 04] add_size 200000
add_align 100000
[    0.590328] pci 0000:00:1c.0: BAR 8: assigned [mem 0xd0000000-0xd01fffff]
[    0.590355] pci 0000:00:1c.0: BAR 9: assigned [mem
0xd0200000-0xd03fffff 64bit pref]
[    0.590381] pci 0000:00:1c.1: BAR 9: assigned [mem
0xd0400000-0xd05fffff 64bit pref]
[    0.590407] pci 0000:00:1c.2: BAR 9: assigned [mem
0xd0600000-0xd07fffff 64bit pref]
[    0.590433] pci 0000:00:1c.3: BAR 9: assigned [mem
0xd0800000-0xd09fffff 64bit pref]
[    0.590455] pci 0000:00:1c.0: BAR 7: assigned [io  0x1000-0x1fff]
[    0.590476] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.590493] pci 0000:00:1c.0:   bridge window [io  0x1000-0x1fff]
[    0.590514] pci 0000:00:1c.0:   bridge window [mem 0xd0000000-0xd01fffff]
[    0.590533] pci 0000:00:1c.0:   bridge window [mem
0xd0200000-0xd03fffff 64bit pref]
[    0.590558] pci 0000:00:1c.1: PCI bridge to [bus 02]
[    0.590573] pci 0000:00:1c.1:   bridge window [io  0xe000-0xefff]
[    0.590593] pci 0000:00:1c.1:   bridge window [mem 0xdfe00000-0xdfefffff]
[    0.590611] pci 0000:00:1c.1:   bridge window [mem
0xd0400000-0xd05fffff 64bit pref]
[    0.590637] pci 0000:00:1c.2: PCI bridge to [bus 03]
[    0.590651] pci 0000:00:1c.2:   bridge window [io  0xd000-0xdfff]
[    0.590671] pci 0000:00:1c.2:   bridge window [mem 0xdfd00000-0xdfdfffff]
[    0.590689] pci 0000:00:1c.2:   bridge window [mem
0xd0600000-0xd07fffff 64bit pref]
[    0.590715] pci 0000:00:1c.3: PCI bridge to [bus 04]
[    0.590729] pci 0000:00:1c.3:   bridge window [io  0xc000-0xcfff]
[    0.590749] pci 0000:00:1c.3:   bridge window [mem 0xdfc00000-0xdfcfffff]
[    0.590796] pci 0000:00:1c.3:   bridge window [mem
0xd0800000-0xd09fffff 64bit pref]
[    0.590825] pci 0000:00:1e.0: PCI bridge to [bus 05]
[    0.590857] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.590872] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.590888] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000fffff window]
[    0.590903] pci_bus 0000:00: resource 7 [mem 0xcf800000-0xfebfffff window]
[    0.590920] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    0.590934] pci_bus 0000:01: resource 1 [mem 0xd0000000-0xd01fffff]
[    0.590949] pci_bus 0000:01: resource 2 [mem 0xd0200000-0xd03fffff
64bit pref]
[    0.590967] pci_bus 0000:02: resource 0 [io  0xe000-0xefff]
[    0.590982] pci_bus 0000:02: resource 1 [mem 0xdfe00000-0xdfefffff]
[    0.590997] pci_bus 0000:02: resource 2 [mem 0xd0400000-0xd05fffff
64bit pref]
[    0.591015] pci_bus 0000:03: resource 0 [io  0xd000-0xdfff]
[    0.591029] pci_bus 0000:03: resource 1 [mem 0xdfd00000-0xdfdfffff]
[    0.591044] pci_bus 0000:03: resource 2 [mem 0xd0600000-0xd07fffff
64bit pref]
[    0.591062] pci_bus 0000:04: resource 0 [io  0xc000-0xcfff]
[    0.591076] pci_bus 0000:04: resource 1 [mem 0xdfc00000-0xdfcfffff]
[    0.591091] pci_bus 0000:04: resource 2 [mem 0xd0800000-0xd09fffff
64bit pref]
[    0.591109] pci_bus 0000:05: resource 4 [io  0x0000-0x0cf7 window]
[    0.591124] pci_bus 0000:05: resource 5 [io  0x0d00-0xffff window]
[    0.591140] pci_bus 0000:05: resource 6 [mem 0x000a0000-0x000fffff window]
[    0.591155] pci_bus 0000:05: resource 7 [mem 0xcf800000-0xfebfffff window]
[    0.619012] pci 0000:00:1d.7: quirk_usb_early_handoff+0x0/0x720
took 25455 usecs
[    0.619090] PCI: CLS 64 bytes, default 64
[    0.619119] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.619131] software IO TLB: mapped [mem
0x00000000cb32d000-0x00000000cf32d000] (64MB)
[    1.253206] Initialise system trusted keyrings
[    1.253385] workingset: timestamp_bits=56 max_order=20 bucket_order=0
[    1.258828] NFS: Registering the id_resolver key type
[    1.258860] Key type id_resolver registered
[    1.258869] Key type id_legacy registered
[    1.258930] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.258946] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    1.258957] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    1.274053] NET: Registered PF_ALG protocol family
[    1.274075] xor: measuring software checksum speed
[    1.275555]    prefetch64-sse  :  6789 MB/sec
[    1.277215]    generic_sse     :  6090 MB/sec
[    1.277225] xor: using function: prefetch64-sse (6789 MB/sec)
[    1.277237] Key type asymmetric registered
[    1.277245] Asymmetric key parser 'x509' registered
[    1.277252] Asymmetric key parser 'pkcs8' registered
[    1.277540] kworker/u8:0 (53) used greatest stack depth: 14736 bytes left
[    1.278246] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    1.278323] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 248)
[    1.278337] io scheduler mq-deadline registered
[    1.278345] io scheduler kyber registered
[    1.280061] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    1.280201] ACPI: button: Power Button [PWRB]
[    1.280305] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.280379] ACPI: button: Sleep Button [SLPB]
[    1.280482] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.280586] ACPI: button: Power Button [PWRF]
[    1.281653] Monitor-Mwait will be used to enter C-1 state
[    1.281679] ACPI: \_PR_.CPU0: Found 1 idle states
[    1.282192] ACPI: \_PR_.CPU1: Found 1 idle states
[    1.282634] ACPI: \_PR_.CPU2: Found 1 idle states
[    1.283107] ACPI: \_PR_.CPU3: Found 1 idle states
[    1.284274] thermal LNXTHERM:00: registered as thermal_zone0
[    1.284293] ACPI: thermal: Thermal Zone [THRM] (53 C)
[    1.284566] thermal LNXTHERM:01: registered as thermal_zone1
[    1.284579] ACPI: thermal: Thermal Zone [TZ00] (27 C)
[    1.285335] thermal LNXTHERM:02: registered as thermal_zone2
[    1.285349] ACPI: thermal: Thermal Zone [TZ01] (27 C)
[    1.285563] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.285732] 00:08: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200)
is a 16550A
[    1.286017] 00:09: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200)
is a 16550A
[    1.286256] 00:0b: ttyS4 at I/O 0x4e0 (irq = 10, base_baud =
115200) is a 16550A
[    1.286478] 00:0c: ttyS5 at I/O 0x4e8 (irq = 10, base_baud =
115200) is a 16550A
[    1.286695] 00:0d: ttyS6 at I/O 0x4f0 (irq = 10, base_baud =
115200) is a 16550A
[    1.286947] 00:0e: ttyS7 at I/O 0x4f8 (irq = 10, base_baud =
115200) is a 16550A
[    1.290874] Non-volatile memory driver v1.3
[    1.291063] Linux agpgart interface v0.103
[    1.291167] ACPI: bus type drm_connector registered
[    1.291193] [drm:drm_core_init] Initialized
[    1.296421] loop: module loaded
[    1.296607] ahci 0000:00:1f.2: version 3.0
[    1.296982] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[    1.297043] ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 4 ports 3
Gbps 0x3 impl SATA mode
[    1.297060] ahci 0000:00:1f.2: flags: 64bit ncq stag pm led clo pio slum part
[    1.298225] scsi host0: ahci
[    1.298686] scsi host1: ahci
[    1.299111] scsi host2: ahci
[    1.299511] scsi host3: ahci
[    1.299664] ata1: SATA max UDMA/133 abar m1024@0xdff04000 port
0xdff04100 irq 24
[    1.299682] ata2: SATA max UDMA/133 abar m1024@0xdff04000 port
0xdff04180 irq 24
[    1.299693] ata3: DUMMY
[    1.299699] ata4: DUMMY
[    1.300176] ahci 0000:04:00.0: SSS flag set, parallel bus scan disabled
[    1.300256] ahci 0000:04:00.0: AHCI 0001.0200 32 slots 2 ports 6
Gbps 0x3 impl SATA mode
[    1.300272] ahci 0000:04:00.0: flags: 64bit ncq sntf stag led clo
pmp pio slum part ccc sxs
[    1.301143] scsi host4: ahci
[    1.301553] scsi host5: ahci
[    1.301707] ata5: SATA max UDMA/133 abar m512@0xdfc00000 port
0xdfc00100 irq 25
[    1.301725] ata6: SATA max UDMA/133 abar m512@0xdfc00000 port
0xdfc00180 irq 25
[    1.302127] wireguard: WireGuard 1.0.0 loaded. See
www.wireguard.com for information.
[    1.302145] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
[    1.302703] e100: Intel(R) PRO/100 Network Driver
[    1.302714] e100: Copyright(c) 1999-2006 Intel Corporation
[    1.302752] e1000: Intel(R) PRO/1000 Network Driver
[    1.302760] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.302839] e1000e: Intel(R) PRO/1000 Network Driver
[    1.302848] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.302898] sky2: driver version 1.30
[    1.303206] r8169 0000:02:00.0: can't disable ASPM; OS doesn't have
ASPM control
[    1.305013] r8169 0000:02:00.0 eth0: RTL8168evl/8111evl,
00:30:18:a1:77:72, XID 2c9, IRQ 26
[    1.305039] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194
bytes, tx checksumming: ko]
[    1.305267] r8169 0000:03:00.0: can't disable ASPM; OS doesn't have
ASPM control
[    1.306867] r8169 0000:03:00.0 eth1: RTL8168evl/8111evl,
00:30:18:a1:77:73, XID 2c9, IRQ 27
[    1.306892] r8169 0000:03:00.0 eth1: jumbo features [frames: 9194
bytes, tx checksumming: ko]
[    1.307169] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.307183] ehci-pci: EHCI PCI platform driver
[    1.307464] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    1.307612] ehci-pci 0000:00:1d.7: new USB bus registered, assigned
bus number 1
[    1.307647] ehci-pci 0000:00:1d.7: debug port 1
[    1.311643] ehci-pci 0000:00:1d.7: irq 23, io mem 0xdff05000
[    1.317800] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    1.317922] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.17
[    1.317939] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.317950] usb usb1: Product: EHCI Host Controller
[    1.317959] usb usb1: Manufacturer: Linux 5.17.3 ehci_hcd
[    1.317967] usb usb1: SerialNumber: 0000:00:1d.7
[    1.318302] hub 1-0:1.0: USB hub found
[    1.318337] hub 1-0:1.0: 8 ports detected
[    1.319044] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.319073] ohci-pci: OHCI PCI platform driver
[    1.319113] uhci_hcd: USB Universal Host Controller Interface driver
[    1.319320] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    1.319481] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned
bus number 2
[    1.319539] uhci_hcd 0000:00:1d.0: irq 23, io port 0x0000f0a0
[    1.319693] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.319709] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.319721] usb usb2: Product: UHCI Host Controller
[    1.319730] usb usb2: Manufacturer: Linux 5.17.3 uhci_hcd
[    1.319739] usb usb2: SerialNumber: 0000:00:1d.0
[    1.320085] hub 2-0:1.0: USB hub found
[    1.320114] hub 2-0:1.0: 2 ports detected
[    1.320647] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    1.320841] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned
bus number 3
[    1.320923] uhci_hcd 0000:00:1d.1: irq 19, io port 0x0000f080
[    1.321072] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.321089] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.321100] usb usb3: Product: UHCI Host Controller
[    1.321109] usb usb3: Manufacturer: Linux 5.17.3 uhci_hcd
[    1.321117] usb usb3: SerialNumber: 0000:00:1d.1
[    1.321434] hub 3-0:1.0: USB hub found
[    1.321462] hub 3-0:1.0: 2 ports detected
[    1.322048] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    1.322206] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned
bus number 4
[    1.322288] uhci_hcd 0000:00:1d.2: irq 18, io port 0x0000f060
[    1.322441] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.322457] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.322469] usb usb4: Product: UHCI Host Controller
[    1.322478] usb usb4: Manufacturer: Linux 5.17.3 uhci_hcd
[    1.322487] usb usb4: SerialNumber: 0000:00:1d.2
[    1.322971] hub 4-0:1.0: USB hub found
[    1.323001] hub 4-0:1.0: 2 ports detected
[    1.323532] uhci_hcd 0000:00:1d.3: UHCI Host Controller
[    1.323696] uhci_hcd 0000:00:1d.3: new USB bus registered, assigned
bus number 5
[    1.323950] uhci_hcd 0000:00:1d.3: irq 16, io port 0x0000f040
[    1.324098] usb usb5: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.17
[    1.324114] usb usb5: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    1.324126] usb usb5: Product: UHCI Host Controller
[    1.324135] usb usb5: Manufacturer: Linux 5.17.3 uhci_hcd
[    1.324143] usb usb5: SerialNumber: 0000:00:1d.3
[    1.324480] hub 5-0:1.0: USB hub found
[    1.324510] hub 5-0:1.0: 2 ports detected
[    1.325025] usbcore: registered new interface driver usblp
[    1.325086] usbcore: registered new interface driver usb-storage
[    1.325144] usbcore: registered new interface driver ftdi_sio
[    1.325170] usbserial: USB Serial support registered for FTDI USB
Serial Device
[    1.325378] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M]
at 0x60,0x64 irq 1,12
[    1.326070] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.326094] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.326813] usbcore: registered new interface driver usbtouchscreen
[    1.326972] rtc_cmos 00:03: RTC can wake from S4
[    1.327517] rtc_cmos 00:03: registered as rtc0
[    1.327574] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes
nvram, hpet irqs
[    1.327694] i801_smbus 0000:00:1f.3: enabling device (0000 -> 0001)
[    1.327936] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    1.328485] i2c i2c-0: 2/2 memory slots populated (from DMI)
[    1.330449] i2c i2c-0: Successfully instantiated SPD at 0x50
[    1.332392] i2c i2c-0: Successfully instantiated SPD at 0x51
[    1.332520] usbcore: registered new interface driver uvcvideo
[    1.332849] f71808e_wdt: Found f71869 watchdog chip, revision 32
[    1.333378] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22)
initialised: dm-devel@redhat.com
[    1.333402] intel_pstate: CPU model not supported
[    1.333492] EFI Variables Facility v0.08 2004-May-17
[    1.397258] hid: raw HID events driver (C) Jiri Kosina
[    1.397752] usbcore: registered new interface driver usbhid
[    1.397787] usbhid: USB HID core driver
[    1.398228] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
[    1.400148] Initializing XFRM netlink socket
[    1.400474] NET: Registered PF_INET6 protocol family
[    1.401304] Segment Routing with IPv6
[    1.401336] In-situ OAM (IOAM) with IPv6
[    1.401423] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.401821] NET: Registered PF_PACKET protocol family
[    1.401888] Key type dns_resolver registered
[    1.402460] microcode: sig=0x30661, pf=0x4, revision=0x10d
[    1.402527] microcode: Microcode Update Driver: v2.2.
[    1.402538] IPI shorthand broadcast: enabled
[    1.402754] registered taskstats version 1
[    1.402801] Loading compiled-in X.509 certificates
[    1.408664] [drm:psb_intel_opregion_setup] OpRegion detected at 0xcf3c7018
[    1.408696] [drm:psb_intel_opregion_setup] Public ACPI methods supported
[    1.408704] [drm:psb_intel_opregion_setup] ASLE supported
[    1.408829] [drm:psb_intel_init_bios] Using VBT from OpRegion: $VBT
CEDARVIEW      d
[    1.408842] [drm:psb_intel_init_bios] LVDS VBT config bits: 0x1
[    1.408854] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    1.408876] [drm:psb_intel_init_bios] No SDVO device info is found in VBT
[    1.408886] [drm:psb_intel_init_bios] EDP timing in vbt t1_t3 2000
t8 10 t9 2000 t10 500 t11_t12 5000
[    1.408898] [drm:psb_intel_init_bios] VBT reports EDP: Lane_count
1, Lane_rate 6, Bpp 18
[    1.408907] [drm:psb_intel_init_bios] VBT reports EDP: VSwing  0, Preemph 0
[    1.409483] snd_hda_intel 0000:00:1b.0: Cannot probe codecs, giving up
[    1.415642] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
no  post: no)
[    1.416038] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    1.421946] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSDDC_C
[    1.422609] [drm:cdv_intel_dp_init] i2c_init DPDDC-B
[    1.423121] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    1.423132] [drm:cdv_intel_dp_i2c_aux_ch] aux_ch failed -110
[    1.423641] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    1.423647] [drm:cdv_intel_dp_i2c_aux_ch] aux_ch failed -110
[    1.424348] [drm:cdv_intel_dp_init] i2c_init DPDDC-C
[    1.424558] [drm:cdv_intel_dp_i2c_aux_ch] aux_i2c nack
[    1.609238] ata5: SATA link down (SStatus 0 SControl 300)
[    1.609350] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.611381] ata1.00: ATA-11: ST8000VN004-2M2101, SC60, max UDMA/133
[    1.624215] ata1.00: 15628053168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.624680] ata1.00: Features: NCQ-sndrcv
[    1.639743] ata1.00: configured for UDMA/133
[    1.640022] scsi 0:0:0:0: Direct-Access     ATA
ST8000VN004-2M21 SC60 PQ: 0 ANSI: 5
[    1.640674] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.640944] sd 0:0:0:0: [sda] 15628053168 512-byte logical blocks:
(8.00 TB/7.28 TiB)
[    1.640969] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.641031] sd 0:0:0:0: [sda] Write Protect is off
[    1.641048] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.641144] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    1.677986]  sda: sda1 sda2 sda3 sda4
[    1.679250] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.789797] usb 1-7: new high-speed USB device number 2 using ehci-pci
[    1.796661] [drm:drm_minor_register]
[    1.796671] [drm:drm_minor_register]
[    1.796866] [drm:drm_minor_register] new minor registered 0
[    1.796899] [drm:drm_sysfs_connector_add] adding "VGA-1" to sysfs
[    1.796970] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:37:VGA-1]
generating connector hotplug event
[    1.796991] [drm:drm_sysfs_connector_add] adding "LVDS-1" to sysfs
[    1.797048] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:39:LVDS-1]
generating connector hotplug event
[    1.797067] [drm:drm_sysfs_connector_add] adding "DVI-D-1" to sysfs
[    1.797124] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:41:DVI-D-1]
generating connector hotplug event
[    1.797143] [drm:drm_sysfs_connector_add] adding "DP-1" to sysfs
[    1.797211] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:43:DP-1] generating
connector hotplug event
[    1.797231] [drm:drm_sysfs_connector_add] adding "DVI-D-2" to sysfs
[    1.797286] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:47:DVI-D-2]
generating connector hotplug event
[    1.797306] [drm:drm_sysfs_connector_add] adding "DP-2" to sysfs
[    1.797366] gma500 0000:00:02.0:
[drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:49:DP-2] generating
connector hotplug event
[    1.797383] [drm] Initialized gma500 1.0.0 20140314 for
0000:00:02.0 on minor 0
[    1.797548] PM:   Magic number: 2:885:605
[    1.797803] printk: console [netcon0] enabled
[    1.797823] netconsole: network logging started
[    1.798288] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    1.800469] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.800508] Unstable clock detected, switching default tracing
clock to "global"
               If you want to keep using the local clock, then add:
                 "trace_clock=local"
               on the kernel command line
[    1.800601] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    1.800618] cfg80211: failed to load regulatory.db
[    1.800673] ALSA device list:
[    1.800682]   No soundcards found.
[    1.922723] usb 1-7: New USB device found, idVendor=1d6b,
idProduct=0104, bcdDevice= 1.00
[    1.922744] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.922756] usb 1-7: Product: Composite KVM Device
[    1.922782] usb 1-7: Manufacturer: PiKVM
[    1.922792] usb 1-7: SerialNumber: CAFEBABE
[    1.924589] input: PiKVM Composite KVM Device as
/devices/pci0000:00/0000:00:1d.7/usb1/1-7/1-7:1.0/0003:1D6B:0104.0001/input/input7
[    1.945295] ata2: SATA link down (SStatus 0 SControl 300)
[    1.976209] hid-generic 0003:1D6B:0104.0001: input,hidraw0: USB HID
v1.01 Keyboard [PiKVM Composite KVM Device] on
usb-0000:00:1d.7-7/input0
[    1.977524] input: PiKVM Composite KVM Device as
/devices/pci0000:00/0000:00:1d.7/usb1/1-7/1-7:1.1/0003:1D6B:0104.0002/input/input8
[    1.977718] hid-generic 0003:1D6B:0104.0002: input,hidraw1: USB HID
v1.01 Mouse [PiKVM Composite KVM Device] on usb-0000:00:1d.7-7/input1
[    1.978017] usb-storage 1-7:1.2: USB Mass Storage device detected
[    1.978367] scsi host6: usb-storage 1-7:1.2
[    2.249330] ata6: SATA link down (SStatus 0 SControl 300)
[    2.249409] md: Waiting for all devices to be available before autodetect
[    2.249428] md: If you don't use raid, use raid=noautodetect
[    2.249438] md: Autodetecting RAID arrays.
[    2.249445] md: autorun ...
[    2.249451] md: ... autorun DONE.
[    2.284100] EXT4-fs (sda2): mounted filesystem with ordered data
mode. Quota mode: none.
[    2.284157] VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
[    2.289452] devtmpfs: mounted
[    2.290465] Freeing unused kernel image (initmem) memory: 1276K
[    2.290502] Write protecting the kernel read-only data: 26624k
[    2.292741] Freeing unused kernel image (text/rodata gap) memory: 2032K
[    2.293330] Freeing unused kernel image (rodata/data gap) memory: 576K
[    2.293378] Run /sbin/init as init process
[    2.293386]   with arguments:
[    2.293388]     /sbin/init
[    2.293390]   with environment:
[    2.293392]     HOME=/
[    2.293394]     TERM=linux
[    2.366396] random: fast init done
[    2.640327] modprobe (131) used greatest stack depth: 13272 bytes left
[    3.012832] scsi 6:0:0:0: CD-ROM            Pi-KVM   CD-ROM Drive
  0515 PQ: 0 ANSI: 2
[    3.013919] sr 6:0:0:0: Power-on or device reset occurred
[    3.015922] sr 6:0:0:0: [sr0] scsi-1 drive
[    3.015951] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.017937] sr 6:0:0:0: Attached scsi CD-ROM sr0
[    3.018298] sr 6:0:0:0: Attached scsi generic sg1 type 5
[    3.073506] random: crng init done
[    3.073583] systemd[1]: Successfully credited entropy passed from
boot loader.
[    3.087669] systemd[1]: systemd 250 running in system mode (-PAM
-AUDIT -SELINUX -APPARMOR -IMA -SMACK -SECCOMP +GCRYPT -GNUTLS
+OPENSSL -ACL +BLKID +CURL +ELFUTILS -FIDO2 -IDN2 -IDN +IPTC +KMOD
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2
-LZ4 +XZ +ZLIB -ZSTD -BPF_FRAMEWORK +XKBCOMMON -UTMP -SYSVINIT
default-hierarchy=unified)
[    3.099946] systemd[1]: Detected architecture x86-64.
[    3.116051] systemd[1]: Hostname set to <buildroot>.
[    3.198714] systemd[1]: Using hardware watchdog 'f71869 watchdog',
version 0, device /dev/watchdog0
[    3.198826] systemd[1]: Watchdog running with a timeout of 20s.
[    3.376159] lvm2-activation (134) used greatest stack depth: 13040 bytes left
[    3.669552] systemd[1]: /usr/lib/systemd/system/cups.socket:6:
ListenStream= references a path below legacy directory /var/run/,
updating /var/run/cups/cups.sock \xe2\x86\x92 /run/cups/cups.sock;
please update the unit file accordingly.
[    3.769471] systemd[1]: Configuration file
/usr/lib/systemd/system/cups-browsed.service is marked executable.
Please remove executable permission bits. Proceeding anyway.
[    3.790826] systemd[1]: Queued start job for default target
Multi-User System.
[    3.794238] systemd[1]: Created slice Slice /system/getty.
[    3.795574] systemd[1]: Created slice Slice /system/modprobe.
[    3.796808] systemd[1]: Created slice Slice /system/systemd-fsck.
[    3.797595] systemd[1]: Created slice User and Session Slice.
[    3.798125] systemd[1]: Started Dispatch Password Requests to
Console Directory Watch.
[    3.798610] systemd[1]: Started Forward Password Requests to Wall
Directory Watch.
[    3.799302] systemd[1]: Reached target NFS client services.
[    3.799619] systemd[1]: Reached target Preparation for Remote File Systems.
[    3.799881] systemd[1]: Reached target Remote File Systems.
[    3.800143] systemd[1]: Reached target Slice Units.
[    3.800381] systemd[1]: Reached target Swaps.
[    3.801006] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    3.810395] systemd[1]: Listening on RPCbind Server Activation Socket.
[    3.810756] systemd[1]: Reached target RPC Port Mapper.
[    3.811760] systemd[1]: Listening on Journal Audit Socket.
[    3.812577] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.813412] systemd[1]: Listening on Journal Socket.
[    3.814379] systemd[1]: Listening on udev Control Socket.
[    3.815129] systemd[1]: Listening on udev Kernel Socket.
[    3.817551] systemd[1]: Mounting Huge Pages File System...
[    3.820239] systemd[1]: Mounting POSIX Message Queue File System...
[    3.822579] systemd[1]: Mounting NFSD configuration filesystem...
[    3.825481] systemd[1]: Mounting Kernel Debug File System...
[    3.828256] systemd[1]: Mounting Kernel Trace File System...
[    3.838066] systemd[1]: Mounting Temporary Directory /tmp...
[    3.842638] systemd[1]: Starting Availability of block devices...
[    3.847458] systemd[1]: Started Entropy Daemon based on the HAVEGE algorithm.
[    3.848210] systemd[1]: Create List of Static Device Nodes was
skipped because of a failed condition check
(ConditionFileNotEmpty=/lib/modules/5.17.3/modules.devname).
[    3.851051] systemd[1]: Starting Monitoring of LVM2 mirrors,
snapshots etc. using dmeventd or progress polling...
[    3.855644] systemd[1]: Starting Load Kernel Module configfs...
[    3.860307] systemd[1]: Starting Load Kernel Module drm...
[    3.866045] systemd[1]: Starting Load Kernel Module fuse...
[    3.871128] systemd[1]: Starting RPC Bind...
[    3.875478] systemd[1]: Starting File System Check on Root Device...
[    3.883606] systemd[1]: Starting Journal Service...
[    3.889320] systemd[1]: Starting Load Kernel Modules...
[    3.893403] systemd[1]: Starting Generate network units from Kernel
command line...
[    3.897368] systemd[1]: Starting Create Static Device Nodes in /dev...
[    3.901865] systemd[1]: Starting Coldplug All udev Devices...
[    3.914641] systemd[1]: Mounted Huge Pages File System.
[    3.915500] systemd[1]: Mounted POSIX Message Queue File System.
[    3.916310] systemd[1]: Mounted NFSD configuration filesystem.
[    3.916941] systemd[1]: Mounted Kernel Debug File System.
[    3.917519] systemd[1]: Mounted Kernel Trace File System.
[    3.918143] systemd[1]: Mounted Temporary Directory /tmp.
[    3.919253] systemd[1]: Finished Availability of block devices.
[    3.920520] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    3.921185] systemd[1]: Finished Load Kernel Module configfs.
[    3.922998] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    3.926339] systemd[1]: Finished Load Kernel Module drm.
[    3.928215] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    3.929008] systemd[1]: Finished Load Kernel Module fuse.
[    3.930512] systemd[1]: Finished Monitoring of LVM2 mirrors,
snapshots etc. using dmeventd or progress polling.
[    3.931920] systemd[1]: Finished Load Kernel Modules.
[    3.932969] systemd[1]: Finished Generate network units from Kernel
command line.
[    3.934563] systemd[1]: FUSE Control File System was skipped
because of a failed condition check
(ConditionPathExists=/sys/fs/fuse/connections).
[    3.935084] systemd[1]: Kernel Configuration File System was
skipped because of a failed condition check
(ConditionPathExists=/sys/kernel/config).
[    3.938204] systemd[1]: Starting Apply Kernel Variables...
[    3.966537] systemd[1]: Started RPC Bind.
[    3.983638] systemd[1]: Finished File System Check on Root Device.
[    3.987860] systemd[1]: Starting Remount Root and Kernel File Systems...
[    3.995512] systemd[1]: Finished Apply Kernel Variables.
[    4.040333] systemd[1]: Finished Create Static Device Nodes in /dev.
[    4.054160] EXT4-fs (sda2): re-mounted. Quota mode: none.
[    4.060927] systemd[1]: Finished Remount Root and Kernel File Systems.
[    4.061715] systemd[1]: Reached target Preparation for Local File Systems.
[    4.062627] systemd[1]: Set up automount EFI System Partition Automount.
[    4.064361] systemd[1]: Rebuild Hardware Database was skipped
because of a failed condition check (ConditionNeedsUpdate=/etc).
[    4.064642] systemd[1]: Platform Persistent Storage Archival was
skipped because of a failed condition check
(ConditionDirectoryNotEmpty=/sys/fs/pstore).
[    4.068194] systemd[1]: Starting Load/Save Random Seed...
[    4.072871] audit: type=1334 audit(1650411258.779:2): prog-id=6 op=LOAD
[    4.073179] audit: type=1334 audit(1650411258.779:3): prog-id=7 op=LOAD
[    4.073375] audit: type=1334 audit(1650411258.779:4): prog-id=8 op=LOAD
[    4.075487] systemd[1]: Starting Rule-based Manager for Device
Events and Files...
[    4.127404] systemd[1]: Finished Load/Save Random Seed.
[    4.128284] systemd[1]: First Boot Complete was skipped because of
a failed condition check (ConditionFirstBoot=yes).
[    4.254132] systemd[1]: Started Journal Service.
[    4.285483] systemd-journald[163]: Received client request to flush
runtime journal.
[    4.712084] r8169 0000:02:00.0 enp2s0: renamed from eth0
[    4.727701] r8169 0000:03:00.0 enp3s0: renamed from eth1
[    5.682272] FAT-fs (sda1): Volume was not properly unmounted. Some
data may be corrupt. Please run fsck.
[    6.500338] EXT4-fs (sda4): mounted filesystem with ordered data
mode. Quota mode: none.
[    6.618598] audit: type=1334 audit(1650411261.324:5): prog-id=9 op=LOAD
[    6.624355] audit: type=1334 audit(1650411261.330:6): prog-id=10 op=LOAD
[    6.964574] audit: type=1325 audit(1650411261.670:7): table=mangle
family=2 entries=0 op=xt_register pid=250 subj=kernel
comm="iptables-restor"
[    6.964700] audit: type=1300 audit(1650411261.670:7): arch=c000003e
syscall=55 success=yes exit=0 a0=5 a1=0 a2=40 a3=7ffdf5f4a174 items=0
ppid=1 pid=250 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="iptables-restor"
exe="/usr/sbin/xtables-legacy-multi" subj=kernel key=(null)
[    6.964752] audit: type=1327 audit(1650411261.670:7):
proctitle=2F7573722F7362696E2F69707461626C65732D726573746F7265002F6574632F69707461626C65732E72756C6573
[    6.979073] audit: type=1334 audit(1650411261.685:8): prog-id=11 op=LOAD
[    6.979474] audit: type=1334 audit(1650411261.685:9): prog-id=12 op=LOAD
[    6.979675] audit: type=1334 audit(1650411261.685:10): prog-id=13 op=LOAD
[    6.999636] audit: type=1325 audit(1650411261.705:11): table=mangle
family=2 entries=6 op=xt_replace pid=250 subj=kernel
comm="iptables-restor"
[    6.999688] audit: type=1300 audit(1650411261.705:11):
arch=c000003e syscall=54 success=yes exit=0 a0=5 a1=0 a2=40
a3=55a71ccfe830 items=0 ppid=1 pid=250 auid=4294967295 uid=0 gid=0
euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295
comm="iptables-restor" exe="/usr/sbin/xtables-legacy-multi"
subj=kernel key=(null)
[    7.449208] RTL8211E Gigabit Ethernet r8169-0-200:00: attached PHY
driver (mii_bus:phy_addr=r8169-0-200:00, irq=MAC)
[    7.496653] [drm:drm_stub_open]
[    7.496680] [drm:drm_open] comm="weston", pid=267, minor=0
[    7.496721] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_MAGIC
[    7.496748] gma500 0000:00:02.0: [drm:drm_getmagic] 1
[    7.496854] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_AUTH_MAGIC
[    7.496875] gma500 0000:00:02.0: [drm:drm_authmagic] 1
[    7.496917] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    7.496950] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    7.497184] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    7.497212] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    7.497228] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    7.497244] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    7.497263] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    7.497280] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    7.497291] [drm:drm_ioctl] comm="weston", pid=267, ret=-95
[    7.497370] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_GET_CAP
[    7.497443] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    7.497459] [drm:drm_ioctl] comm="weston", pid=267, ret=-22
[    7.497474] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_SET_CLIENT_CAP
[    7.497609] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    7.497639] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[    7.497666] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497690] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497714] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497735] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497758] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
[    7.497810] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
[    7.497831] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    7.497850] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    7.497893] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497916] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.497940] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.497962] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.497998] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    7.498018] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPLANE
[    7.498042] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.498064] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.498089] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.498111] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.709430] RTL8211E Gigabit Ethernet r8169-0-300:00: attached PHY
driver (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
[    7.709719] r8169 0000:02:00.0 enp2s0: Link is Down
[    7.893116] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    7.893148] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1]
[    7.907826] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] status updated from unknown to disconnected
[    7.907867] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] disconnected
[    7.907885] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    7.907916] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    7.907937] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    7.907978] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.907998] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    7.908016] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.908036] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[    7.908062] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908084] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908111] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908134] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908163] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908185] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908211] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908233] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908257] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908277] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.908698] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    7.908726] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    7.908873] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    7.908896] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1]
[    7.908910] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] status updated from unknown to connected
[    7.910097] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    7.919643] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSBLC_B
[    7.919722] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] probed modes :
[    7.919736] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[    7.919755] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    7.919814] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    7.919838] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    7.919878] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.919896] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    7.919912] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    7.919928] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[    7.919950] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.919969] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.919992] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920012] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920038] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920058] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920080] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920099] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920120] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920138] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920159] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920178] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920201] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920221] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    7.920565] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    7.920587] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    7.920674] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    7.920694] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1]
[    7.978488] r8169 0000:03:00.0 enp3s0: Link is Down
[    8.339483] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    8.339510] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    8.339522] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    8.339532] [drm:drm_add_display_info] CEA VCDB 0x7f
[    8.456152] ip (363) used greatest stack depth: 12512 bytes left
[    8.492837] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] status updated from unknown to connected
[    8.846656] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    8.846682] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    8.846693] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    8.846703] [drm:drm_add_display_info] CEA VCDB 0x7f
[    8.952797] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[    8.952834] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    8.952848] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    8.952858] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    8.952867] [drm:drm_add_display_info] CEA VCDB 0x7f
[    8.952881] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    8.952896] [drm:drm_add_edid_modes] ELD monitor Toshiba-H2C
[    8.952906] [drm:drm_add_edid_modes] HDMI: latency present 0 0,
video latency 0 0, audio latency 0 0
[    8.952918] [drm:drm_add_edid_modes] ELD size 32, SAD count 0
[    8.952928] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    8.952938] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[    8.952947] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[    8.952955] [drm:drm_add_display_info] CEA VCDB 0x7f
[    8.954755] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] probed modes :
[    8.954803] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    8.954824] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[    8.954841] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    8.954856] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    8.954870] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[    8.954884] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    8.954899] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    8.954914] [drm:drm_mode_debug_printmodeline] Modeline
"1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[    8.954928] [drm:drm_mode_debug_printmodeline] Modeline "1440x900":
60 106470 1440 1520 1672 1904 900 901 907 934 0x40 0xa
[    8.954943] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    8.954957] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    8.954972] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[    8.954987] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74250 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    8.955001] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74176 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    8.955015] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
25 74250 1280 3700 3740 3960 720 725 730 750 0x40 0x5
[    8.955029] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59400 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    8.955045] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59341 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[    8.955060] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[    8.955075] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    8.955090] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    8.955104] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[    8.955119] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    8.955133] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[    8.955148] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    8.955162] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    8.955177] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    8.955191] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    8.955206] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0x5
[    8.955220] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    8.955234] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    8.955249] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    8.955263] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    8.955278] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
73 31500 640 664 704 832 480 489 492 520 0x40 0xa
[    8.955292] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
67 30240 640 704 768 864 480 483 486 525 0x40 0xa
[    8.955307] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    8.955322] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    8.955337] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    8.955355] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (2)
[    8.955391] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    8.955429] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (2)
[    8.955475] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    8.955494] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (2)
[    8.955509] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    8.955524] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (2)
[    8.955544] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955563] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955583] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955602] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955625] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955643] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955664] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955682] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955702] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955718] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955737] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955755] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.955817] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[    8.955832] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[    8.955846] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[    8.955860] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[    8.956182] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    8.956203] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    8.956280] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    8.956299] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:43:DP-1]
[    8.956818] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[    8.956832] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] status updated from unknown to disconnected
[    8.956844] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] disconnected
[    8.956858] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    8.956879] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    8.956897] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    8.956927] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    8.956945] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    8.956959] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    8.956974] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[    8.956994] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957012] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957031] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957049] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957072] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957090] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957113] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957132] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957152] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957168] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957187] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957206] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957227] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957246] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    8.957492] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    8.957513] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    8.957581] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    8.957599] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2]
[    9.024855] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm HDMIC
[    9.024884] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] status updated from unknown to disconnected
[    9.024900] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] disconnected
[    9.038791] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    9.038844] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.038869] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    9.038912] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.038930] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    9.038945] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.038961] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[    9.038981] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.038999] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039020] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039038] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039062] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039080] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039102] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039120] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039140] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039156] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039175] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039193] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.039491] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    9.039513] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    9.039586] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.039604] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:49:DP-2]
[    9.039822] [drm:cdv_intel_dp_detect] DPCD: Rev=10 LN_Rate=a
LN_CNT=82 LN_DOWNSP=40
[    9.040854] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    9.067652] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    9.067681] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    9.067693] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    9.095808] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] status updated from unknown to connected
[    9.096907] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    9.127250] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[    9.127282] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    9.127297] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    9.154824] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[    9.154858] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    9.154872] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    9.154887] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (1)
[    9.154902] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    9.154912] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[    9.154923] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[    9.155114] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] probed modes :
[    9.155129] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[    9.155149] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
50 46760 1024 1072 1104 1184 768 771 775 790 0x40 0x9
[    9.155168] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[    9.155202] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[    9.155228] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[    9.155266] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.155285] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[    9.155303] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[    9.155321] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[    9.155345] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155366] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155390] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155412] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155440] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155462] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155487] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155508] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155531] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155550] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155572] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155594] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155620] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155643] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[    9.155669] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[    9.155686] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)
[    9.155702] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[    9.155715] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)
[    9.172105] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    9.172134] [drm:drm_ioctl] comm="weston", pid=267, ret=-2
[    9.172882] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETENCODER
[    9.172926] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCRTC
[    9.172950] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[    9.172997] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_ADDFB2
[    9.173019] [drm:drm_mode_addfb2] [FB:53]
[    9.173033] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_MAP_DUMB
[    9.173080] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[    9.173109] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_ADDFB2
[    9.173127] [drm:drm_mode_addfb2] [FB:54]
[    9.173138] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_MAP_DUMB
[    9.246320] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETCRTC
[    9.246352] [drm:drm_mode_setcrtc] [CRTC:32:crtc-0]
[    9.246366] [drm:drm_crtc_helper_set_config]
[    9.246375] [drm:drm_crtc_helper_set_config] [CRTC:32:crtc-0] [NOFB]
[    9.329803] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETCRTC
[    9.329835] [drm:drm_mode_setcrtc] [CRTC:34:crtc-1]
[    9.329856] [drm:drm_mode_setcrtc] [CONNECTOR:41:DVI-D-1]
[    9.329866] [drm:drm_crtc_helper_set_config]
[    9.329876] [drm:drm_crtc_helper_set_config] [CRTC:34:crtc-1]
[FB:54] #connectors=1 (x y) (0 0)
[    9.329894] [drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[    9.329903] [drm:drm_crtc_helper_set_config] modes are different,
full mode set
[    9.329911] [drm:drm_mode_debug_printmodeline] Modeline "": 0 0 0 0
0 0 0 0 0 0 0x0 0x0
[    9.329926] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    9.329941] [drm:drm_mode_object_get] OBJ ID: 41 (2)
[    9.329952] [drm:drm_crtc_helper_set_config] encoder changed, full
mode switch
[    9.329962] [drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[    9.329970] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
to [CRTC:34:crtc-1]
[    9.329983] [drm:drm_crtc_helper_set_config] attempting to set mode
from userspace
[    9.329992] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    9.330009] [drm:drm_crtc_helper_set_mode] [CRTC:34:crtc-1]
[    9.350047] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    9.367795] [drm:cdv_sb_write] 0x00008038: 0x0068a701 (before)
[    9.367819] [drm:cdv_sb_write] 0x00008038: 0x0068a701
[    9.373803] [drm:cdv_sb_write] 0x00008038: 0x0068a701 (after)
[    9.376803] [drm:cdv_intel_crtc_mode_set] use DPLLA for pipe B
[    9.379804] [drm:cdv_sb_write] 0x00008030: 0x7e40421c (before)
[    9.379826] [drm:cdv_sb_write] 0x00008030: 0x7e40421c
[    9.385800] [drm:cdv_sb_write] 0x00008030: 0x7e40421c (after)
[    9.391802] [drm:cdv_sb_write] 0x00008028: 0x5900217f (before)
[    9.391827] [drm:cdv_sb_write] 0x00008028: 0x6c00217f
[    9.397797] [drm:cdv_sb_write] 0x00008028: 0x6c00217f (after)
[    9.403801] [drm:cdv_sb_write] 0x00008034: 0x16000157 (before)
[    9.403825] [drm:cdv_sb_write] 0x00008034: 0x84000157
[    9.409803] [drm:cdv_sb_write] 0x00008034: 0x84000157 (after)
[    9.415796] [drm:cdv_sb_write] 0x0000803c: 0x85552000 (before)
[    9.415818] [drm:cdv_sb_write] 0x0000803c: 0x05554000
[    9.421797] [drm:cdv_sb_write] 0x0000803c: 0x05554000 (after)
[    9.427802] [drm:cdv_sb_write] 0x00000120: 0x003000c4 (before)
[    9.427827] [drm:cdv_sb_write] 0x00000120: 0x003000c4
[    9.433798] [drm:cdv_sb_write] 0x00000120: 0x003000c4 (after)
[    9.439800] [drm:cdv_sb_write] 0x00000220: 0x003000c4 (before)
[    9.439826] [drm:cdv_sb_write] 0x00000220: 0x003000c4
[    9.445798] [drm:cdv_sb_write] 0x00000220: 0x003000c4 (after)
[    9.445975] [drm:cdv_intel_crtc_mode_set] Mode for pipe B:
[    9.445986] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[    9.505801] [drm:drm_crtc_helper_set_mode] [ENCODER:42:TMDS-42] set
[MODE:1280x720]
[    9.546058] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 34: hwmode: htotal 1650,
vtotal 750, vdisplay 720
[    9.546086] gma500 0000:00:02.0:
[drm:drm_calc_timestamping_constants] crtc 34: clock 74250 kHz
framedur 16666666 linedur 22222
[    9.546100] [drm:drm_crtc_helper_set_config] Setting connector DPMS
state to on
[    9.546111] [drm:drm_crtc_helper_set_config] [CONNECTOR:41:DVI-D-1]
set DPMS on
[    9.626191] [drm:drm_mode_object_get] OBJ ID: 54 (2)
[    9.626218] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (3)
[    9.626229] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[    9.761878] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_PAGE_FLIP
[    9.761928] gma500 0000:00:02.0: [drm:drm_vblank_enable] enabling
vblank on crtc 1, ret: 0
[    9.761951] [drm:drm_mode_object_get] OBJ ID: 54 (3)
[    9.761963] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (4)
[    9.761971] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (3)
[    9.761987] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_SETPROPERTY
[    9.762006] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[   10.473272] r8169 0000:03:00.0 enp3s0: Link is Up - 1Gbps/Full -
flow control off
[   10.473315] IPv6: ADDRCONF(NETDEV_CHANGE): enp3s0: link becomes ready
[   16.565535] NFSD: Using nfsdcld client tracking operations.
[   16.565556] NFSD: no clients to reclaim, skipping NFSv4 grace
period (net f0000000)
[   17.209108] ip (501) used greatest stack depth: 12272 bytes left
[   18.179836] [drm:drm_sysfs_hotplug_event] generating hotplug event
[   18.185745] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   18.185828] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   18.185858] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   18.185878] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1]
[   18.197800] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:37:VGA-1] disconnected
[   18.197835] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[   18.197870] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   18.197892] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[   18.197913] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   18.197930] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[   18.197945] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   18.197961] [drm:drm_mode_object_put.part.0] OBJ ID: 37 (2)
[   18.197996] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198015] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198035] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198054] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198080] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198098] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198120] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198139] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198158] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198175] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.198208] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   18.198225] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1]
[   18.207564] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm LVDSBLC_B
[   18.209689] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:39:LVDS-1] probed modes :
[   18.209714] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x8 0xa
[   18.209737] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[   18.209825] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   18.209852] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[   18.209878] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   18.209898] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[   18.209915] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   18.209933] [drm:drm_mode_object_put.part.0] OBJ ID: 39 (2)
[   18.209968] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.209990] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210013] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210034] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210061] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210083] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210107] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210127] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210150] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210169] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210191] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210212] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210236] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210256] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   18.210298] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   18.210316] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1]
[   18.535911] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   18.535944] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   18.535954] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   18.535963] [drm:drm_add_display_info] CEA VCDB 0x7f
[   18.646792] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[   18.963194] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   18.963222] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   18.963232] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   18.963240] [drm:drm_add_display_info] CEA VCDB 0x7f
[   19.096800] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (1)
[   19.096832] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.096844] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   19.096853] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   19.096862] [drm:drm_add_display_info] CEA VCDB 0x7f
[   19.096875] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[   19.096889] [drm:drm_add_edid_modes] ELD monitor Toshiba-H2C
[   19.096898] [drm:drm_add_edid_modes] HDMI: latency present 0 0,
video latency 0 0, audio latency 0 0
[   19.096909] [drm:drm_add_edid_modes] ELD size 32, SAD count 0
[   19.096919] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.096927] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS clock 0 kHz
[   19.096936] [drm:drm_add_display_info] DVI-D-1: No deep color
support on this HDMI sink.
[   19.096943] [drm:drm_add_display_info] CEA VCDB 0x7f
[   19.098659] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:41:DVI-D-1] probed modes :
[   19.098682] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x48 0x5
[   19.098700] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[   19.098718] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[   19.098735] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[   19.098753] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[   19.098801] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[   19.098819] [drm:drm_mode_debug_printmodeline] Modeline
"1920x1080": 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[   19.098836] [drm:drm_mode_debug_printmodeline] Modeline
"1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[   19.098854] [drm:drm_mode_debug_printmodeline] Modeline "1440x900":
60 106470 1440 1520 1672 1904 900 901 907 934 0x40 0xa
[   19.098871] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[   19.098888] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[   19.098905] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[   19.098921] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74250 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   19.098937] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
30 74176 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   19.098953] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
25 74250 1280 3700 3740 3960 720 725 730 750 0x40 0x5
[   19.098969] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59400 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   19.098986] [drm:drm_mode_debug_printmodeline] Modeline "1280x720":
24 59341 1280 3040 3080 3300 720 725 730 750 0x40 0x5
[   19.099004] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[   19.099022] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[   19.099039] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[   19.099056] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[   19.099074] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[   19.099090] [drm:drm_mode_debug_printmodeline] Modeline "800x600":
56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[   19.099106] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[   19.099123] [drm:drm_mode_debug_printmodeline] Modeline "720x576":
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[   19.099140] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[   19.099157] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[   19.099175] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0x5
[   19.099192] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   19.099210] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   19.099227] [drm:drm_mode_debug_printmodeline] Modeline "720x480":
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[   19.099244] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[   19.099260] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
73 31500 640 664 704 832 480 489 492 520 0x40 0xa
[   19.099277] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
67 30240 640 704 768 864 480 483 486 525 0x40 0xa
[   19.099294] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[   19.099310] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   19.099328] [drm:drm_mode_debug_printmodeline] Modeline "640x480":
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   19.099351] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[   19.099411] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.099454] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[   19.099488] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.099508] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[   19.099525] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.099542] [drm:drm_mode_object_put.part.0] OBJ ID: 41 (3)
[   19.099593] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099614] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099639] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099662] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099691] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099712] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099737] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099756] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099811] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099832] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099855] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099878] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.099906] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   19.099923] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   19.099940] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   19.099955] [drm:drm_mode_object_put.part.0] OBJ ID: 55 (2)
[   19.100000] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.100020] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:43:DP-1]
[   19.100540] [drm:cdv_intel_dp_aux_ch] dp_aux_ch timeout status 0x51440064
[   19.100556] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:43:DP-1] disconnected
[   19.100574] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   19.100596] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.100618] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   19.100640] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.100658] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   19.100674] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.100692] [drm:drm_mode_object_put.part.0] OBJ ID: 43 (2)
[   19.100727] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100748] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100808] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100831] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100861] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100882] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100905] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100924] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100947] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100966] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.100989] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.101011] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.101038] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.101060] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.101095] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.101114] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2]
[   19.162825] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent
adapter intel drm HDMIC
[   19.162851] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:47:DVI-D-2] disconnected
[   19.162872] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   19.162904] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.162925] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   19.162948] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.162965] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   19.162979] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.162995] [drm:drm_mode_object_put.part.0] OBJ ID: 47 (2)
[   19.163028] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163047] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163068] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163087] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163112] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163130] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163151] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163168] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163187] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163204] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163222] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163241] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.163279] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.163296] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:49:DP-2]
[   19.163513] [drm:cdv_intel_dp_detect] DPCD: Rev=10 LN_Rate=a
LN_CNT=82 LN_DOWNSP=40
[   19.164542] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   19.209565] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   19.209593] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.209607] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   19.245374] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[   19.246427] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   19.273720] [drm:i2c_algo_dp_aux_xfer] dp_aux_xfer return 2
[   19.273743] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.273756] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   19.319827] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (1)
[   19.319869] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.319884] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   19.319900] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (1)
[   19.319915] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   19.319926] [drm:drm_add_display_info] Supported Monitor Refresh
rate range is 0 Hz - 0 Hz
[   19.319938] [drm:drm_add_display_info] DP-2: Assigning EDID-1.4
digital sink color depth as 8 bpc.
[   19.320134] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:49:DP-2] probed modes :
[   19.320152] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
60 56120 1024 1072 1104 1184 768 771 775 790 0x48 0x9
[   19.320170] [drm:drm_mode_debug_printmodeline] Modeline "1024x768":
50 46760 1024 1072 1104 1184 768 771 775 790 0x40 0x9
[   19.320191] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[   19.320239] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   19.320266] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[   19.320295] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.320315] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[   19.320333] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[   19.320351] [drm:drm_mode_object_put.part.0] OBJ ID: 49 (2)
[   19.320385] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320408] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320434] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320459] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320488] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320509] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320534] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320555] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320579] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320600] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320621] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320643] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320669] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320690] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   19.320716] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   19.320733] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   19.320752] [drm:drm_ioctl] comm="weston" pid=267, dev=0xe200,
auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   19.320827] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
