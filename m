Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B103B2104A8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76796E831;
	Wed,  1 Jul 2020 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E83B89AB3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 23:08:15 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q7so11417566ljm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CTHETCCcr7pcK8f59gUFcOxi5cMeOQzQ89XRV2fTl00=;
 b=dQiiv8WScJCw2ACUjB2Hi0bT2vXMupqFLi1Fjy5sEPluJLtxhOv8MChZ/NJpqlc7Xm
 ePvKvqXgt4jPxSbLAjN0W2mdWcNnobHxwpCTE4X8a8ZuOuQraODgHdJk/UU/pvwOtum3
 TDTALvVHv4SufJYaPlw1CiGvppNLFP8JOqFqnT+wmBT7yZ5Ux3Nhxk5lupE0W96VjyGk
 O9R69GPvjro69zW1ksZI7xfCpkzOhp6waXWc2KEkwWMy+I9Jzj10y2rFcaoTZgFpetWb
 YM4AYhRtXPZiXcfioLMzTJ3f63b7Bc/hWM8XbuztlE3h/h+w98fvvw+kXCIqDTjmDkKh
 WZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CTHETCCcr7pcK8f59gUFcOxi5cMeOQzQ89XRV2fTl00=;
 b=mEDgfCCwawJ/hRFTzNCrPaGDaWSu3qUNVt1LeQ71MpgawMG2jvwSVfUQBhfWnNDiWU
 y886oYt96Ic/tLumFdL2oiDuZ9o7bzp88QCRF1Em6jekNhbjcv79Gd5Wke+45Of2xIoP
 DxrR2PBbWZRZXMOhyYOZsZ+1jQx7fBtX/qImQPB36kQ0CLbOTk1mx07kbAq74Shiq6jx
 wgXkQcRaaX4YvZJPiHJZSG3pUMaBTCbMX60ofV7+19ac/eZDMXRczE+hix/ktaelMr9x
 04g6qMu4+kxmG5JOBCEB1/BmQgpuTFot0iVNW92VbabU15S9LusJIgqytgIhcSa2MZw1
 zV0Q==
X-Gm-Message-State: AOAM531IblfgADBSycFG5UzFahU3TVsAJ4WfWtAsKBIJL8s0K/mhrrAe
 6jnjf6HqtIQjyGF+wnNF5lTdhA==
X-Google-Smtp-Source: ABdhPJzkq3+TmoyXhiHT2heVILMUREhkyq5xfepM3x3YyJHgG2eJMxDYW+TGZvRA3j54AlhIV45+SQ==
X-Received: by 2002:a2e:b541:: with SMTP id a1mr10790315ljn.4.1593558493300;
 Tue, 30 Jun 2020 16:08:13 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id w6sm1177657ljw.11.2020.06.30.16.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 16:08:11 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id C8E3810118B; Wed,  1 Jul 2020 02:08:08 +0300 (+03)
Date: Wed, 1 Jul 2020 02:08:08 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: James Jones <jajones@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200630230808.wj2xlt44vrszqfzx@box>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="m6vgdjlaqypp74er"
Content-Disposition: inline
In-Reply-To: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m6vgdjlaqypp74er
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 04:06:32PM +1000, Dave Airlie wrote:
> James Jones (4):
...
>       drm/nouveau/kms: Support NVIDIA format modifiers

This commit is the first one that breaks Xorg startup for my setup:
GTX 1080 + Dell UP2414Q (4K DP MST monitor).

I believe this is the crucial part of dmesg (full dmesg is attached):

[   29.997140] [drm:nouveau_framebuffer_new] Unsupported modifier: 0x300000000000014
[   29.997143] [drm:drm_internal_framebuffer_create] could not create framebuffer
[   29.997145] [drm:drm_ioctl] pid=3393, ret = -22

Any suggestions?

-- 
 Kirill A. Shutemov

--m6vgdjlaqypp74er
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.log"

[    0.000000] microcode: microcode updated early to revision 0x2006906, date = 2020-04-24
[    0.000000] Linux version 5.7.0-rc2-01340-gfa4f4c213f5f (kas@box) (gcc version 9.3.0 (Gentoo 9.3.0-r1 p3), GNU ld (Gentoo 2.34 p4) 2.34.0) #47 SMP PREEMPT Wed Jul 1 01:41:46 +03 2020
[    0.000000] Command line: initrd=\initramfs
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: xstate_offset[5]:  960, xstate_sizes[5]:   64
[    0.000000] x86/fpu: xstate_offset[6]: 1024, xstate_sizes[6]:  512
[    0.000000] x86/fpu: xstate_offset[7]: 1536, xstate_sizes[7]: 1024
[    0.000000] x86/fpu: Enabled xstate features 0xff, context size is 2560 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000356effff] usable
[    0.000000] BIOS-e820: [mem 0x00000000356f0000-0x00000000366ccfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000366cd000-0x00000000369cbfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000369cc000-0x000000003780cfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000003780d000-0x00000000386dcfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000386dd000-0x000000004fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000050000000-0x000000006fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000109fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x2cb65018-0x2cb75e57] usable ==> usable
[    0.000000] e820: update [mem 0x2cb65018-0x2cb75e57] usable ==> usable
[    0.000000] e820: update [mem 0x2cb45018-0x2cb64a57] usable ==> usable
[    0.000000] e820: update [mem 0x2cb45018-0x2cb64a57] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000002cb45017] usable
[    0.000000] reserve setup_data: [mem 0x000000002cb45018-0x000000002cb64a57] usable
[    0.000000] reserve setup_data: [mem 0x000000002cb64a58-0x000000002cb65017] usable
[    0.000000] reserve setup_data: [mem 0x000000002cb65018-0x000000002cb75e57] usable
[    0.000000] reserve setup_data: [mem 0x000000002cb75e58-0x00000000356effff] usable
[    0.000000] reserve setup_data: [mem 0x00000000356f0000-0x00000000366ccfff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000366cd000-0x00000000369cbfff] usable
[    0.000000] reserve setup_data: [mem 0x00000000369cc000-0x000000003780cfff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000003780d000-0x00000000386dcfff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000386dd000-0x000000004fffffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000050000000-0x000000006fffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000109fffffff] usable
[    0.000000] efi: EFI v2.60 by American Megatrends
[    0.000000] efi:  ACPI 2.0=0x369cc000  ACPI=0x369cc000  SMBIOS=0x3853f000  SMBIOS 3.0=0x3853e000  ESRT=0x33c03c98  MEMATTR=0x33bfc018 
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F5d 11/28/2019
[    0.000000] tsc: Detected 2800.000 MHz processor
[    0.000000] tsc: Detected 2799.927 MHz TSC
[    0.000000] [Firmware Bug]: TSC ADJUST: CPU0: -1264110401798 force to 0
[    0.000861] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000863] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000868] last_pfn = 0x10a0000 max_arch_pfn = 0x400000000
[    0.000872] MTRR default type: uncachable
[    0.000874] MTRR fixed ranges enabled:
[    0.000875]   00000-9FFFF write-back
[    0.000876]   A0000-BFFFF uncachable
[    0.000877]   C0000-FFFFF write-protect
[    0.000879] MTRR variable ranges enabled:
[    0.000880]   0 base 000000000000 mask 3FF000000000 write-back
[    0.000882]   1 base 001000000000 mask 3FFF80000000 write-back
[    0.000883]   2 base 001080000000 mask 3FFFE0000000 write-back
[    0.000884]   3 base 000060000000 mask 3FFFE0000000 uncachable
[    0.000885]   4 base 000080000000 mask 3FFF80000000 uncachable
[    0.000886]   5 base 00005F000000 mask 3FFFFF000000 uncachable
[    0.000887]   6 disabled
[    0.000888]   7 disabled
[    0.000889]   8 disabled
[    0.000890]   9 disabled
[    0.001955] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.007411] e820: update [mem 0x5f000000-0xffffffff] usable ==> reserved
[    0.007416] last_pfn = 0x50000 max_arch_pfn = 0x400000000
[    0.012828] found SMP MP-table at [mem 0x000fcfd0-0x000fcfdf]
[    0.012838] esrt: Reserving ESRT space from 0x0000000033c03c98 to 0x0000000033c03cd0.
[    0.012843] e820: update [mem 0x33c03000-0x33c03fff] usable ==> reserved
[    0.012852] check: Scanning 1 areas for low memory corruption
[    0.012856] Using GB pages for direct mapping
[    0.012859] BRK [0x62da01000, 0x62da01fff] PGTABLE
[    0.012862] BRK [0x62da02000, 0x62da02fff] PGTABLE
[    0.012863] BRK [0x62da03000, 0x62da03fff] PGTABLE
[    0.012881] BRK [0x62da04000, 0x62da04fff] PGTABLE
[    0.012882] BRK [0x62da05000, 0x62da05fff] PGTABLE
[    0.012883] BRK [0x62da06000, 0x62da06fff] PGTABLE
[    0.013034] BRK [0x62da07000, 0x62da07fff] PGTABLE
[    0.013052] BRK [0x62da08000, 0x62da08fff] PGTABLE
[    0.013055] BRK [0x62da09000, 0x62da09fff] PGTABLE
[    0.013064] BRK [0x62da0a000, 0x62da0afff] PGTABLE
[    0.013076] BRK [0x62da0b000, 0x62da0bfff] PGTABLE
[    0.013138] Secure boot disabled
[    0.013140] RAMDISK: [mem 0x2cb77000-0x2ce30fff]
[    0.013145] ACPI: Early table checksum verification disabled
[    0.013148] ACPI: RSDP 0x00000000369CC000 000024 (v02 ALASKA)
[    0.013152] ACPI: XSDT 0x00000000369CC0D8 00012C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.013158] ACPI: FACP 0x00000000369EBA28 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
[    0.013163] ACPI: DSDT 0x00000000369CC298 01F78F (v02 ALASKA A M I    01072009 INTL 20160422)
[    0.013167] ACPI: FACS 0x000000003780A080 000040
[    0.013170] ACPI: FPDT 0x00000000369EBB40 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.013173] ACPI: FIDT 0x00000000369EBB88 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.013176] ACPI: SSDT 0x00000000369EBC28 007A4B (v01 GBT    GSWApp   00000001 INTL 20160422)
[    0.013180] ACPI: UEFI 0x00000000369F3678 000042 (v01 ALASKA A M I    00000002      01000013)
[    0.013183] ACPI: MCFG 0x00000000369F36C0 00003C (v01 ALASKA A M I    01072009 MSFT 00000097)
[    0.013186] ACPI: HPET 0x00000000369F3700 000038 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013190] ACPI: APIC 0x00000000369F3738 00071E (v03 ALASKA A M I    00000000 INTL 20091013)
[    0.013193] ACPI: MCFG 0x00000000369F3E58 00003C (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013196] ACPI: MIGT 0x00000000369F3E98 000040 (v01 ALASKA A M I    00000000 INTL 20091013)
[    0.013199] ACPI: MSCT 0x00000000369F3ED8 00004E (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013202] ACPI: PCCT 0x00000000369F3F28 00006E (v01 ALASKA A M I    00000002 INTL 20091013)
[    0.013206] ACPI: RASF 0x00000000369F3F98 000030 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013209] ACPI: SLIT 0x00000000369F3FC8 00006C (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013212] ACPI: SRAT 0x00000000369F4038 000A30 (v03 ALASKA A M I    00000002 INTL 20091013)
[    0.013215] ACPI: SVOS 0x00000000369F4A68 000032 (v01 ALASKA A M I    00000000 INTL 20091013)
[    0.013219] ACPI: WDDT 0x00000000369F4AA0 000040 (v01 ALASKA A M I    00000000 INTL 20091013)
[    0.013222] ACPI: OEM4 0x00000000369F4AE0 029A72 (v02 INTEL  CPU  CST 00003000 INTL 20160422)
[    0.013225] ACPI: OEM1 0x0000000036A1E558 00ABCB (v02 INTEL  CPU EIST 00003000 INTL 20160422)
[    0.013228] ACPI: OEM2 0x0000000036A29128 006AB0 (v02 INTEL  CPU  HWP 00003000 INTL 20160422)
[    0.013232] ACPI: SSDT 0x0000000036A2FBD8 00D427 (v02 INTEL  SSDT  PM 00004000 INTL 20160422)
[    0.013235] ACPI: NITR 0x0000000036A3D000 000071 (v02 ALASKA A M I    00000001 INTL 20091013)
[    0.013238] ACPI: SSDT 0x0000000036A3D078 000956 (v02 ALASKA A M I    00000000 INTL 20091013)
[    0.013242] ACPI: LPIT 0x0000000036A3D9D0 000094 (v01 INTEL  SKL      00000000 MSFT 0000005F)
[    0.013245] ACPI: WSMT 0x0000000036A3DA68 000028 (v01 INTEL  SKL      00000000 MSFT 0000005F)
[    0.013248] ACPI: WDAT 0x0000000036A3DA90 000134 (v01 INTEL  SKL      00000000 MSFT 0000005F)
[    0.013251] ACPI: SSDT 0x0000000036A3DBC8 00029F (v02 INTEL  sensrhub 00000000 INTL 20160422)
[    0.013255] ACPI: SSDT 0x0000000036A3DE68 003002 (v02 INTEL  PtidDevc 00001000 INTL 20160422)
[    0.013258] ACPI: DBGP 0x0000000036A40E70 000034 (v01 INTEL           00000002 MSFT 0000005F)
[    0.013261] ACPI: DBG2 0x0000000036A40EA8 000054 (v00 INTEL           00000002 MSFT 0000005F)
[    0.013265] ACPI: BGRT 0x0000000036A40F00 000038 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.013268] ACPI: DMAR 0x0000000036A40F38 0000D8 (v01 ALASKA A M I    00000001 INTL 20091013)
[    0.013271] ACPI: WSMT 0x0000000036A41010 000028 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.013279] ACPI: Local APIC address 0xfee00000
[    0.013305] SRAT: PXM 0 -> APIC 0x00 -> Node 0
[    0.013307] SRAT: PXM 0 -> APIC 0x02 -> Node 0
[    0.013309] SRAT: PXM 0 -> APIC 0x04 -> Node 0
[    0.013310] SRAT: PXM 0 -> APIC 0x06 -> Node 0
[    0.013312] SRAT: PXM 0 -> APIC 0x08 -> Node 0
[    0.013314] SRAT: PXM 0 -> APIC 0x0a -> Node 0
[    0.013315] SRAT: PXM 0 -> APIC 0x0c -> Node 0
[    0.013317] SRAT: PXM 0 -> APIC 0x0e -> Node 0
[    0.013319] SRAT: PXM 0 -> APIC 0x10 -> Node 0
[    0.013320] SRAT: PXM 0 -> APIC 0x12 -> Node 0
[    0.013322] SRAT: PXM 0 -> APIC 0x14 -> Node 0
[    0.013324] SRAT: PXM 0 -> APIC 0x16 -> Node 0
[    0.013325] SRAT: PXM 0 -> APIC 0x18 -> Node 0
[    0.013327] SRAT: PXM 0 -> APIC 0x1a -> Node 0
[    0.013329] SRAT: PXM 0 -> APIC 0x1c -> Node 0
[    0.013330] SRAT: PXM 0 -> APIC 0x1e -> Node 0
[    0.013332] SRAT: PXM 0 -> APIC 0x01 -> Node 0
[    0.013334] SRAT: PXM 0 -> APIC 0x03 -> Node 0
[    0.013335] SRAT: PXM 0 -> APIC 0x05 -> Node 0
[    0.013337] SRAT: PXM 0 -> APIC 0x07 -> Node 0
[    0.013339] SRAT: PXM 0 -> APIC 0x09 -> Node 0
[    0.013340] SRAT: PXM 0 -> APIC 0x0b -> Node 0
[    0.013342] SRAT: PXM 0 -> APIC 0x0d -> Node 0
[    0.013344] SRAT: PXM 0 -> APIC 0x0f -> Node 0
[    0.013346] SRAT: PXM 0 -> APIC 0x11 -> Node 0
[    0.013347] SRAT: PXM 0 -> APIC 0x13 -> Node 0
[    0.013349] SRAT: PXM 0 -> APIC 0x15 -> Node 0
[    0.013351] SRAT: PXM 0 -> APIC 0x17 -> Node 0
[    0.013352] SRAT: PXM 0 -> APIC 0x19 -> Node 0
[    0.013354] SRAT: PXM 0 -> APIC 0x1b -> Node 0
[    0.013356] SRAT: PXM 0 -> APIC 0x1d -> Node 0
[    0.013357] SRAT: PXM 0 -> APIC 0x1f -> Node 0
[    0.013363] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0xffffffff]
[    0.013365] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x109fffffff]
[    0.013368] NUMA: Initialized distance table, cnt=1
[    0.013370] NUMA: Node 0 [mem 0x00000000-0xffffffff] + [mem 0x100000000-0x109fffffff] -> [mem 0x00000000-0x109fffffff]
[    0.013374] NODE_DATA(0) allocated [mem 0x109fffb000-0x109fffefff]
[    0.089198] Zone ranges:
[    0.089201]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.089203]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.089205]   Normal   [mem 0x0000000100000000-0x000000109fffffff]
[    0.089207] Movable zone start for each node
[    0.089209] Early memory node ranges
[    0.089211]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.089213]   node   0: [mem 0x0000000000100000-0x00000000356effff]
[    0.089215]   node   0: [mem 0x00000000366cd000-0x00000000369cbfff]
[    0.089216]   node   0: [mem 0x00000000386dd000-0x000000004fffffff]
[    0.089218]   node   0: [mem 0x0000000100000000-0x000000109fffffff]
[    0.089290] Zeroed struct page in unavailable ranges: 11599 pages
[    0.089290] Initmem setup node 0 [mem 0x0000000000001000-0x000000109fffffff]
[    0.089293] On node 0 totalpages: 16700081
[    0.089295]   DMA zone: 64 pages used for memmap
[    0.089296]   DMA zone: 25 pages reserved
[    0.089297]   DMA zone: 3999 pages, LIFO batch:0
[    0.089335]   DMA32 zone: 4877 pages used for memmap
[    0.089337]   DMA32 zone: 312082 pages, LIFO batch:63
[    0.092158]   Normal zone: 256000 pages used for memmap
[    0.092160]   Normal zone: 16384000 pages, LIFO batch:63
[    0.242079] ACPI: PM-Timer IO Port: 0x1808
[    0.242082] ACPI: Local APIC address 0xfee00000
[    0.242090] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.242093] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.242123] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.242131] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
[    0.242137] IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
[    0.242142] IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
[    0.242147] IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
[    0.242150] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.242153] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.242155] ACPI: IRQ0 used by override.
[    0.242157] ACPI: IRQ9 used by override.
[    0.242159] Using ACPI (MADT) for SMP configuration information
[    0.242162] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.242168] e820: update [mem 0x314db000-0x31531fff] usable ==> reserved
[    0.242175] smpboot: Allowing 32 CPUs, 0 hotplug CPUs
[    0.242193] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.242195] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.242197] PM: hibernation: Registered nosave memory: [mem 0x2cb45000-0x2cb45fff]
[    0.242200] PM: hibernation: Registered nosave memory: [mem 0x2cb64000-0x2cb64fff]
[    0.242201] PM: hibernation: Registered nosave memory: [mem 0x2cb65000-0x2cb65fff]
[    0.242204] PM: hibernation: Registered nosave memory: [mem 0x2cb75000-0x2cb75fff]
[    0.242206] PM: hibernation: Registered nosave memory: [mem 0x314db000-0x31531fff]
[    0.242208] PM: hibernation: Registered nosave memory: [mem 0x33c03000-0x33c03fff]
[    0.242210] PM: hibernation: Registered nosave memory: [mem 0x356f0000-0x366ccfff]
[    0.242213] PM: hibernation: Registered nosave memory: [mem 0x369cc000-0x3780cfff]
[    0.242214] PM: hibernation: Registered nosave memory: [mem 0x3780d000-0x386dcfff]
[    0.242217] PM: hibernation: Registered nosave memory: [mem 0x50000000-0x6fffffff]
[    0.242218] PM: hibernation: Registered nosave memory: [mem 0x70000000-0xfdffffff]
[    0.242220] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.242222] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.242223] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.242225] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.242227] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.242228] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfedfffff]
[    0.242230] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.242232] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.242233] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.242237] [mem 0x70000000-0xfdffffff] available for PCI devices
[    0.242239] Booting paravirtualized kernel on bare hardware
[    0.242243] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.247694] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128 nr_cpu_ids:32 nr_node_ids:1
[    0.248821] percpu: Embedded 72 pages/cpu s256208 r8192 d30512 u524288
[    0.248829] pcpu-alloc: s256208 r8192 d30512 u524288 alloc=1*2097152
[    0.248830] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.248834] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.248837] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23 
[    0.248840] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31 
[    0.248872] Built 1 zonelists, mobility grouping on.  Total pages: 16439115
[    0.248874] Policy zone: Normal
[    0.248881] Kernel command line: root=/dev/mapper/box-root dolvm rw rootfstype=ext4 drm.debug=0xf
[    0.248954] printk: log_buf_len individual max cpu contribution: 131072 bytes
[    0.248956] printk: log_buf_len total cpu_extra contributions: 4063232 bytes
[    0.248958] printk: log_buf_len min size: 524288 bytes
[    0.249376] printk: log_buf_len: 8388608 bytes
[    0.249378] printk: early log buf free: 505360(96%)
[    0.252261] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    0.253701] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.253908] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.370506] Memory: 65452028K/66800324K available (20487K kernel code, 2562K rwdata, 12324K rodata, 1784K init, 11984K bss, 1348296K reserved, 0K cma-reserved)
[    0.370624] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    0.370654] Kernel/User page tables isolation: enabled
[    0.370714] ftrace: allocating 58094 entries in 227 pages
[    0.387778] ftrace: allocated 227 pages with 5 groups
[    0.388064] Running RCU self tests
[    0.388070] rcu: Preemptible hierarchical RCU implementation.
[    0.388072] rcu: 	RCU lockdep checking is enabled.
[    0.388074] rcu: 	RCU restricting CPUs from NR_CPUS=128 to nr_cpu_ids=32.
[    0.388076] 	Tasks RCU enabled.
[    0.388078] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.388080] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.390807] NR_IRQS: 8448, nr_irqs: 1224, preallocated irqs: 16
[    0.391162] random: get_random_bytes called from start_kernel+0x318/0x4ea with crng_init=0
[    0.391224] Console: colour dummy device 80x25
[    0.394035] printk: console [tty0] enabled
[    0.394046] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.394062] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.394071] ... MAX_LOCK_DEPTH:          48
[    0.394080] ... MAX_LOCKDEP_KEYS:        8192
[    0.394089] ... CLASSHASH_SIZE:          4096
[    0.394099] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.394109] ... MAX_LOCKDEP_CHAINS:      65536
[    0.394118] ... CHAINHASH_SIZE:          32768
[    0.394128]  memory used by lock dependency info: 6301 kB
[    0.394139]  memory used for stack traces: 4224 kB
[    0.394149]  per task-struct memory footprint: 1920 bytes
[    0.394203] ACPI: Core revision 20200326
[    0.394769] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.394900] APIC: Switch to symmetric I/O mode setup
[    0.394913] DMAR: Host address width 46
[    0.394922] DMAR: DRHD base: 0x000000b5ffc000 flags: 0x0
[    0.394948] DMAR: dmar0: reg_base_addr b5ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    0.394965] DMAR: DRHD base: 0x000000d8ffc000 flags: 0x0
[    0.394979] DMAR: dmar1: reg_base_addr d8ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    0.394996] DMAR: DRHD base: 0x000000fbffc000 flags: 0x0
[    0.395011] DMAR: dmar2: reg_base_addr fbffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    0.395027] DMAR: DRHD base: 0x00000092ffc000 flags: 0x1
[    0.395041] DMAR: dmar3: reg_base_addr 92ffc000 ver 1:0 cap 8d2078c106f0466 ecap f020df
[    0.395058] DMAR: RMRR base: 0x00000037804000 end: 0x00000037806fff
[    0.395071] DMAR: [Firmware Bug]: No firmware reserved region can cover this RMRR [0x0000000037804000-0x0000000037806fff], contact BIOS vendor for fixes
[    0.395097] DMAR: [Firmware Bug]: Your BIOS is broken; bad RMRR [0x0000000037804000-0x0000000037806fff]
               BIOS vendor: American Megatrends Inc.; Ver: F5d; Product Version: Default string
[    0.395131] DMAR: ATSR flags: 0x0
[    0.395140] DMAR-IR: IOAPIC id 12 under DRHD base  0xfbffc000 IOMMU 2
[    0.395154] DMAR-IR: IOAPIC id 11 under DRHD base  0xd8ffc000 IOMMU 1
[    0.395167] DMAR-IR: IOAPIC id 10 under DRHD base  0xb5ffc000 IOMMU 0
[    0.395180] DMAR-IR: IOAPIC id 8 under DRHD base  0x92ffc000 IOMMU 3
[    0.395193] DMAR-IR: IOAPIC id 9 under DRHD base  0x92ffc000 IOMMU 3
[    0.395206] DMAR-IR: HPET id 0 under DRHD base 0x92ffc000
[    0.395218] DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
[    0.395218] DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
[    0.396052] DMAR-IR: Enabled IRQ remapping in xapic mode
[    0.396065] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.396086] Switched APIC routing to physical flat.
[    0.397353] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.411551] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x285bfbafad2, max_idle_ns: 440795215530 ns
[    0.411585] Calibrating delay loop (skipped), value calculated using timer frequency.. 5602.18 BogoMIPS (lpj=9333090)
[    0.411607] pid_max: default: 32768 minimum: 301
[    0.417187] LSM: Security Framework initializing
[    0.417202] Yama: becoming mindful.
[    0.417223] TOMOYO Linux initialized
[    0.417338] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.417433] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.417973] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.418031] process: using mwait in idle threads
[    0.418043] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.418055] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.418070] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.418088] Spectre V2 : Mitigation: Full generic retpoline
[    0.418100] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.418116] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.418131] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.418148] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.418163] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.418187] TAA: Mitigation: Clear CPU buffers
[    0.418196] MDS: Mitigation: Clear CPU buffers
[    0.418573] Freeing SMP alternatives memory: 48K
[    0.419066] TSC deadline timer enabled
[    0.419075] smpboot: CPU0: Intel(R) Core(TM) i9-7960X CPU @ 2.80GHz (family: 0x6, model: 0x55, stepping: 0x4)
[    0.419397] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.419427] ... version:                4
[    0.419437] ... bit width:              48
[    0.419446] ... generic registers:      4
[    0.419456] ... value mask:             0000ffffffffffff
[    0.419468] ... max period:             00007fffffffffff
[    0.419479] ... fixed-purpose events:   3
[    0.419489] ... event mask:             000000070000000f
[    0.419635] rcu: Hierarchical SRCU implementation.
[    0.422162] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.422761] smp: Bringing up secondary CPUs ...
[    0.423119] x86: Booting SMP configuration:
[    0.423140] .... node  #0, CPUs:        #1
[    0.003800] [Firmware Bug]: TSC ADJUST differs within socket(s), fixing all errors
[    0.428527]   #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15 #16
[    0.503355] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.503355] TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
[    0.503355]  #17 #18 #19 #20 #21 #22 #23 #24 #25 #26 #27 #28 #29 #30 #31
[    0.532176] smp: Brought up 1 node, 32 CPUs
[    0.532176] smpboot: Max logical packages: 1
[    0.532176] smpboot: Total of 32 processors activated (179267.80 BogoMIPS)
[    0.536967] devtmpfs: initialized
[    0.536967] x86/mm: Memory block size: 512MB
[    0.541882] PM: Registering ACPI NVS region [mem 0x369cc000-0x3780cfff] (14946304 bytes)
[    0.542832] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.542832] futex hash table entries: 8192 (order: 8, 1048576 bytes, linear)
[    0.542832] xor: automatically using best checksumming function   avx       
[    0.542832] PM: RTC time: 22:43:02, date: 2020-06-30
[    0.542832] thermal_sys: Registered thermal governor 'fair_share'
[    0.542832] thermal_sys: Registered thermal governor 'step_wise'
[    0.542832] thermal_sys: Registered thermal governor 'user_space'
[    0.542832] NET: Registered protocol family 16
[    0.542899] audit: initializing netlink subsys (disabled)
[    0.542926] audit: type=2000 audit(1593556982.149:1): state=initialized audit_enabled=0 res=1
[    0.545080] cpuidle: using governor ladder
[    0.545127] cpuidle: using governor menu
[    0.545142] Detected 1 PCC Subspaces
[    0.545200] Registering PCC driver as Mailbox controller
[    0.545276] ACPI: bus type PCI registered
[    0.545276] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.545276] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x60000000-0x6fffffff] (base 0x60000000)
[    0.545276] PCI: MMCONFIG at [mem 0x60000000-0x6fffffff] reserved in E820
[    0.545276] pmd_set_huge: Cannot satisfy [mem 0x60000000-0x60200000] with a huge-page mapping due to MTRR override.
[    0.545413] PCI: Using configuration type 1 for base access
[    0.549031] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.557341] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.557341] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.558334] cryptd: max_cpu_qlen set to 1000
[    0.618251] raid6: avx512x4 gen() 50991 MB/s
[    0.671584] raid6: avx512x4 xor()  9686 MB/s
[    0.728249] raid6: avx512x2 gen() 51079 MB/s
[    0.784918] raid6: avx512x2 xor() 31005 MB/s
[    0.841584] raid6: avx512x1 gen() 45643 MB/s
[    0.898251] raid6: avx512x1 xor() 27507 MB/s
[    0.954919] raid6: avx2x4   gen() 37784 MB/s
[    1.011584] raid6: avx2x4   xor()  7180 MB/s
[    1.068250] raid6: avx2x2   gen() 38514 MB/s
[    1.124919] raid6: avx2x2   xor() 22744 MB/s
[    1.181583] raid6: avx2x1   gen() 31882 MB/s
[    1.238251] raid6: avx2x1   xor() 18107 MB/s
[    1.294919] raid6: sse2x4   gen() 11882 MB/s
[    1.351585] raid6: sse2x4   xor()  7397 MB/s
[    1.408250] raid6: sse2x2   gen() 12970 MB/s
[    1.464919] raid6: sse2x2   xor()  7730 MB/s
[    1.521584] raid6: sse2x1   gen() 11791 MB/s
[    1.578252] raid6: sse2x1   xor()  6233 MB/s
[    1.578264] raid6: using algorithm avx512x2 gen() 51079 MB/s
[    1.578277] raid6: .... xor() 31005 MB/s, rmw enabled
[    1.578290] raid6: using avx512x2 recovery algorithm
[    1.581586] ACPI: Added _OSI(Module Device)
[    1.581586] ACPI: Added _OSI(Processor Device)
[    1.581586] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.581586] ACPI: Added _OSI(Processor Aggregator Device)
[    1.581586] ACPI: Added _OSI(Linux-Dell-Video)
[    1.581586] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.581586] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    1.630839] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    1.678610] ACPI: Dynamic OEM Table Load:
[    1.696167] ACPI: Dynamic OEM Table Load:
[    1.705009] ACPI: Dynamic OEM Table Load:
[    1.786918] ACPI: Interpreter enabled
[    1.786965] ACPI: (supports S0 S3 S4 S5)
[    1.786975] ACPI: Using IOAPIC for interrupt routing
[    1.787025] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    1.788136] ACPI: Enabled 9 GPEs in block 00 to 7F
[    1.838574] ACPI BIOS Error (bug): Could not resolve symbol [\SHAD._STA.SDS0], AE_NOT_FOUND (20200326/psargs-330)
[    1.838613] ACPI Error: Aborting method \SHAD._STA due to previous error (AE_NOT_FOUND) (20200326/psparse-529)
[    1.853405] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-15])
[    1.853425] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    1.853783] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR]
[    1.854115] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    1.855912] PCI host bridge to bus 0000:00
[    1.855924] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    1.855941] pci_bus 0000:00: root bus resource [io  0x1000-0x3fff window]
[    1.855958] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[    1.855976] pci_bus 0000:00: root bus resource [mem 0xfe010000-0xfe010fff window]
[    1.855994] pci_bus 0000:00: root bus resource [mem 0x70000000-0x92ffffff window]
[    1.856012] pci_bus 0000:00: root bus resource [mem 0x380000000000-0x3800ffffffff window]
[    1.856032] pci_bus 0000:00: root bus resource [bus 00-15]
[    1.856073] pci 0000:00:00.0: [8086:2020] type 00 class 0x060000
[    1.856649] pci 0000:00:04.0: [8086:2021] type 00 class 0x088000
[    1.856675] pci 0000:00:04.0: reg 0x10: [mem 0x92f64000-0x92f67fff 64bit]
[    1.857114] pci 0000:00:04.1: [8086:2021] type 00 class 0x088000
[    1.857140] pci 0000:00:04.1: reg 0x10: [mem 0x92f60000-0x92f63fff 64bit]
[    1.857576] pci 0000:00:04.2: [8086:2021] type 00 class 0x088000
[    1.857602] pci 0000:00:04.2: reg 0x10: [mem 0x92f5c000-0x92f5ffff 64bit]
[    1.858042] pci 0000:00:04.3: [8086:2021] type 00 class 0x088000
[    1.858067] pci 0000:00:04.3: reg 0x10: [mem 0x92f58000-0x92f5bfff 64bit]
[    1.858512] pci 0000:00:04.4: [8086:2021] type 00 class 0x088000
[    1.858537] pci 0000:00:04.4: reg 0x10: [mem 0x92f54000-0x92f57fff 64bit]
[    1.858975] pci 0000:00:04.5: [8086:2021] type 00 class 0x088000
[    1.859000] pci 0000:00:04.5: reg 0x10: [mem 0x92f50000-0x92f53fff 64bit]
[    1.859435] pci 0000:00:04.6: [8086:2021] type 00 class 0x088000
[    1.859460] pci 0000:00:04.6: reg 0x10: [mem 0x92f4c000-0x92f4ffff 64bit]
[    1.859895] pci 0000:00:04.7: [8086:2021] type 00 class 0x088000
[    1.859920] pci 0000:00:04.7: reg 0x10: [mem 0x92f48000-0x92f4bfff 64bit]
[    1.860356] pci 0000:00:05.0: [8086:2024] type 00 class 0x088000
[    1.860788] pci 0000:00:05.2: [8086:2025] type 00 class 0x088000
[    1.861184] pci 0000:00:05.4: [8086:2026] type 00 class 0x080020
[    1.861208] pci 0000:00:05.4: reg 0x10: [mem 0x92f6e000-0x92f6efff]
[    1.861608] pci 0000:00:08.0: [8086:2014] type 00 class 0x088000
[    1.862035] pci 0000:00:08.1: [8086:2015] type 00 class 0x110100
[    1.862401] pci 0000:00:08.2: [8086:2016] type 00 class 0x088000
[    1.862804] pci 0000:00:14.0: [8086:a2af] type 00 class 0x0c0330
[    1.862839] pci 0000:00:14.0: reg 0x10: [mem 0x92f30000-0x92f3ffff 64bit]
[    1.862921] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    1.863435] pci 0000:00:16.0: [8086:a2ba] type 00 class 0x078000
[    1.863475] pci 0000:00:16.0: reg 0x10: [mem 0x92f6d000-0x92f6dfff 64bit]
[    1.863565] pci 0000:00:16.0: PME# supported from D3hot
[    1.863993] pci 0000:00:17.0: [8086:a282] type 00 class 0x010601
[    1.864024] pci 0000:00:17.0: reg 0x10: [mem 0x92f68000-0x92f69fff]
[    1.864045] pci 0000:00:17.0: reg 0x14: [mem 0x92f6c000-0x92f6c0ff]
[    1.864066] pci 0000:00:17.0: reg 0x18: [io  0x3050-0x3057]
[    1.864086] pci 0000:00:17.0: reg 0x1c: [io  0x3040-0x3043]
[    1.864106] pci 0000:00:17.0: reg 0x20: [io  0x3020-0x303f]
[    1.864126] pci 0000:00:17.0: reg 0x24: [mem 0x92f6b000-0x92f6b7ff]
[    1.864181] pci 0000:00:17.0: PME# supported from D3hot
[    1.864641] pci 0000:00:1b.0: [8086:a2e7] type 01 class 0x060400
[    1.864740] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    1.865322] pci 0000:00:1c.0: [8086:a290] type 01 class 0x060400
[    1.865421] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    1.865974] pci 0000:00:1c.4: [8086:a294] type 01 class 0x060400
[    1.866070] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    1.866631] pci 0000:00:1d.0: [8086:a298] type 01 class 0x060400
[    1.867003] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    1.867540] pci 0000:00:1f.0: [8086:a2d2] type 00 class 0x060100
[    1.868066] pci 0000:00:1f.2: [8086:a2a1] type 00 class 0x058000
[    1.868096] pci 0000:00:1f.2: reg 0x10: [mem 0x92f44000-0x92f47fff]
[    1.868590] pci 0000:00:1f.3: [8086:a2f0] type 00 class 0x040300
[    1.868626] pci 0000:00:1f.3: reg 0x10: [mem 0x92f40000-0x92f43fff 64bit]
[    1.868668] pci 0000:00:1f.3: reg 0x20: [mem 0x92f20000-0x92f2ffff 64bit]
[    1.868726] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    1.869216] pci 0000:00:1f.4: [8086:a2a3] type 00 class 0x0c0500
[    1.869290] pci 0000:00:1f.4: reg 0x10: [mem 0x92f6a000-0x92f6a0ff 64bit]
[    1.869374] pci 0000:00:1f.4: reg 0x20: [io  0x3000-0x301f]
[    1.869847] pci 0000:00:1f.6: [8086:15b8] type 00 class 0x020000
[    1.869889] pci 0000:00:1f.6: reg 0x10: [mem 0x92f00000-0x92f1ffff]
[    1.870015] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    1.870543] pci 0000:00:1b.0: PCI bridge to [bus 01]
[    1.870638] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    1.870743] pci 0000:03:00.0: [1b21:2142] type 00 class 0x0c0330
[    1.870786] pci 0000:03:00.0: reg 0x10: [mem 0x92e00000-0x92e07fff 64bit]
[    1.870851] pci 0000:03:00.0: enabling Extended Tags
[    1.870935] pci 0000:03:00.0: PME# supported from D0
[    1.871141] pci 0000:00:1c.4: PCI bridge to [bus 03]
[    1.871157] pci 0000:00:1c.4:   bridge window [mem 0x92e00000-0x92efffff]
[    1.871251] pci 0000:00:1d.0: PCI bridge to [bus 04]
[    1.871292] pci_bus 0000:00: on NUMA node 0
[    1.872986] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 16-63])
[    1.873004] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    1.874235] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplug AER LTR]
[    1.874770] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    1.875370] PCI host bridge to bus 0000:16
[    1.875383] pci_bus 0000:16: root bus resource [io  0x4000-0x7fff window]
[    1.875400] pci_bus 0000:16: root bus resource [mem 0x93000000-0xb5ffffff window]
[    1.875418] pci_bus 0000:16: root bus resource [mem 0x380100000000-0x3801ffffffff window]
[    1.875437] pci_bus 0000:16: root bus resource [bus 16-63]
[    1.875466] pci 0000:16:05.0: [8086:2034] type 00 class 0x088000
[    1.875660] pci 0000:16:05.2: [8086:2035] type 00 class 0x088000
[    1.875847] pci 0000:16:05.4: [8086:2036] type 00 class 0x080020
[    1.875870] pci 0000:16:05.4: reg 0x10: [mem 0xb5f00000-0xb5f00fff]
[    1.876058] pci 0000:16:08.0: [8086:208d] type 00 class 0x088000
[    1.876257] pci 0000:16:08.1: [8086:208d] type 00 class 0x088000
[    1.876412] pci 0000:16:08.2: [8086:208d] type 00 class 0x088000
[    1.876568] pci 0000:16:08.3: [8086:208d] type 00 class 0x088000
[    1.876723] pci 0000:16:08.4: [8086:208d] type 00 class 0x088000
[    1.876877] pci 0000:16:08.5: [8086:208d] type 00 class 0x088000
[    1.877030] pci 0000:16:08.6: [8086:208d] type 00 class 0x088000
[    1.877184] pci 0000:16:08.7: [8086:208d] type 00 class 0x088000
[    1.877339] pci 0000:16:09.0: [8086:208d] type 00 class 0x088000
[    1.877532] pci 0000:16:09.1: [8086:208d] type 00 class 0x088000
[    1.877688] pci 0000:16:09.2: [8086:208d] type 00 class 0x088000
[    1.877842] pci 0000:16:09.3: [8086:208d] type 00 class 0x088000
[    1.877995] pci 0000:16:09.4: [8086:208d] type 00 class 0x088000
[    1.878149] pci 0000:16:09.5: [8086:208d] type 00 class 0x088000
[    1.878305] pci 0000:16:09.6: [8086:208d] type 00 class 0x088000
[    1.878466] pci 0000:16:09.7: [8086:208d] type 00 class 0x088000
[    1.878622] pci 0000:16:0a.0: [8086:208d] type 00 class 0x088000
[    1.878817] pci 0000:16:0a.1: [8086:208d] type 00 class 0x088000
[    1.878977] pci 0000:16:0e.0: [8086:208e] type 00 class 0x088000
[    1.879173] pci 0000:16:0e.1: [8086:208e] type 00 class 0x088000
[    1.879327] pci 0000:16:0e.2: [8086:208e] type 00 class 0x088000
[    1.879481] pci 0000:16:0e.3: [8086:208e] type 00 class 0x088000
[    1.879635] pci 0000:16:0e.4: [8086:208e] type 00 class 0x088000
[    1.879790] pci 0000:16:0e.5: [8086:208e] type 00 class 0x088000
[    1.879942] pci 0000:16:0e.6: [8086:208e] type 00 class 0x088000
[    1.880097] pci 0000:16:0e.7: [8086:208e] type 00 class 0x088000
[    1.880251] pci 0000:16:0f.0: [8086:208e] type 00 class 0x088000
[    1.880444] pci 0000:16:0f.1: [8086:208e] type 00 class 0x088000
[    1.880598] pci 0000:16:0f.2: [8086:208e] type 00 class 0x088000
[    1.880753] pci 0000:16:0f.3: [8086:208e] type 00 class 0x088000
[    1.880906] pci 0000:16:0f.4: [8086:208e] type 00 class 0x088000
[    1.881061] pci 0000:16:0f.5: [8086:208e] type 00 class 0x088000
[    1.881216] pci 0000:16:0f.6: [8086:208e] type 00 class 0x088000
[    1.881370] pci 0000:16:0f.7: [8086:208e] type 00 class 0x088000
[    1.881525] pci 0000:16:10.0: [8086:208e] type 00 class 0x088000
[    1.881719] pci 0000:16:10.1: [8086:208e] type 00 class 0x088000
[    1.881892] pci 0000:16:1d.0: [8086:2054] type 00 class 0x088000
[    1.882089] pci 0000:16:1d.1: [8086:2055] type 00 class 0x088000
[    1.882243] pci 0000:16:1d.2: [8086:2056] type 00 class 0x088000
[    1.882399] pci 0000:16:1d.3: [8086:2057] type 00 class 0x088000
[    1.882559] pci 0000:16:1e.0: [8086:2080] type 00 class 0x088000
[    1.882753] pci 0000:16:1e.1: [8086:2081] type 00 class 0x088000
[    1.882908] pci 0000:16:1e.2: [8086:2082] type 00 class 0x088000
[    1.883064] pci 0000:16:1e.3: [8086:2083] type 00 class 0x088000
[    1.883219] pci 0000:16:1e.4: [8086:2084] type 00 class 0x088000
[    1.883374] pci 0000:16:1e.5: [8086:2085] type 00 class 0x088000
[    1.883529] pci 0000:16:1e.6: [8086:2086] type 00 class 0x088000
[    1.883685] pci_bus 0000:16: on NUMA node 0
[    1.883947] ACPI: PCI Root Bridge [PC02] (domain 0000 [bus 64-b1])
[    1.883965] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    1.885160] acpi PNP0A08:02: _OSC: platform does not support [SHPCHotplug AER LTR]
[    1.885681] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    1.886142] PCI host bridge to bus 0000:64
[    1.886154] pci_bus 0000:64: root bus resource [mem 0x000a0000-0x000bffff window]
[    1.886172] pci_bus 0000:64: root bus resource [io  0x8000-0xbfff window]
[    1.886189] pci_bus 0000:64: root bus resource [io  0x03b0-0x03bb window]
[    1.886205] pci_bus 0000:64: root bus resource [io  0x03c0-0x03df window]
[    1.886221] pci_bus 0000:64: root bus resource [mem 0xb6000000-0xd8ffffff window]
[    1.886240] pci_bus 0000:64: root bus resource [mem 0x380200000000-0x3802ffffffff window]
[    1.886259] pci_bus 0000:64: root bus resource [bus 64-b1]
[    1.886285] pci 0000:64:00.0: [8086:2030] type 01 class 0x060400
[    1.886371] pci 0000:64:00.0: PME# supported from D0 D3hot D3cold
[    1.886598] pci 0000:64:05.0: [8086:2034] type 00 class 0x088000
[    1.886760] pci 0000:64:05.2: [8086:2035] type 00 class 0x088000
[    1.886921] pci 0000:64:05.4: [8086:2036] type 00 class 0x080020
[    1.886944] pci 0000:64:05.4: reg 0x10: [mem 0xd8100000-0xd8100fff]
[    1.887109] pci 0000:64:08.0: [8086:2066] type 00 class 0x088000
[    1.887303] pci 0000:64:09.0: [8086:2066] type 00 class 0x088000
[    1.887496] pci 0000:64:0a.0: [8086:2040] type 00 class 0x088000
[    1.887688] pci 0000:64:0a.1: [8086:2041] type 00 class 0x088000
[    1.887842] pci 0000:64:0a.2: [8086:2042] type 00 class 0x088000
[    1.887994] pci 0000:64:0a.3: [8086:2043] type 00 class 0x088000
[    1.888144] pci 0000:64:0a.4: [8086:2044] type 00 class 0x088000
[    1.888296] pci 0000:64:0a.5: [8086:2045] type 00 class 0x088000
[    1.888446] pci 0000:64:0a.6: [8086:2046] type 00 class 0x088000
[    1.888600] pci 0000:64:0a.7: [8086:2047] type 00 class 0x088000
[    1.888750] pci 0000:64:0b.0: [8086:2048] type 00 class 0x088000
[    1.888940] pci 0000:64:0b.1: [8086:2049] type 00 class 0x088000
[    1.889093] pci 0000:64:0b.2: [8086:204a] type 00 class 0x088000
[    1.889243] pci 0000:64:0b.3: [8086:204b] type 00 class 0x088000
[    1.889396] pci 0000:64:0c.0: [8086:2040] type 00 class 0x088000
[    1.889586] pci 0000:64:0c.1: [8086:2041] type 00 class 0x088000
[    1.889737] pci 0000:64:0c.2: [8086:2042] type 00 class 0x088000
[    1.889888] pci 0000:64:0c.3: [8086:2043] type 00 class 0x088000
[    1.890038] pci 0000:64:0c.4: [8086:2044] type 00 class 0x088000
[    1.890188] pci 0000:64:0c.5: [8086:2045] type 00 class 0x088000
[    1.890339] pci 0000:64:0c.6: [8086:2046] type 00 class 0x088000
[    1.890488] pci 0000:64:0c.7: [8086:2047] type 00 class 0x088000
[    1.890638] pci 0000:64:0d.0: [8086:2048] type 00 class 0x088000
[    1.890827] pci 0000:64:0d.1: [8086:2049] type 00 class 0x088000
[    1.890978] pci 0000:64:0d.2: [8086:204a] type 00 class 0x088000
[    1.891129] pci 0000:64:0d.3: [8086:204b] type 00 class 0x088000
[    1.891382] pci 0000:65:00.0: [10de:1b80] type 00 class 0x030000
[    1.891416] pci 0000:65:00.0: reg 0x10: [mem 0xd7000000-0xd7ffffff]
[    1.891441] pci 0000:65:00.0: reg 0x14: [mem 0xc0000000-0xcfffffff 64bit pref]
[    1.891467] pci 0000:65:00.0: reg 0x1c: [mem 0xd0000000-0xd1ffffff 64bit pref]
[    1.891491] pci 0000:65:00.0: reg 0x24: [io  0xb000-0xb07f]
[    1.891510] pci 0000:65:00.0: reg 0x30: [mem 0xd8000000-0xd807ffff pref]
[    1.891550] pci 0000:65:00.0: BAR 3: assigned to efifb
[    1.891644] pci 0000:65:00.0: 32.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x16 link at 0000:64:00.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[    1.891810] pci 0000:65:00.1: [10de:10f0] type 00 class 0x040300
[    1.891840] pci 0000:65:00.1: reg 0x10: [mem 0xd8080000-0xd8083fff]
[    1.892056] pci 0000:64:00.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[    1.901684] pci 0000:64:00.0: PCI bridge to [bus 65]
[    1.901726] pci 0000:64:00.0:   bridge window [io  0xb000-0xbfff]
[    1.901773] pci 0000:64:00.0:   bridge window [mem 0xd7000000-0xd80fffff]
[    1.901838] pci 0000:64:00.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    1.901907] pci_bus 0000:64: on NUMA node 0
[    1.902193] ACPI: PCI Root Bridge [PC03] (domain 0000 [bus b2-ff])
[    1.902211] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    1.903416] acpi PNP0A08:03: _OSC: platform does not support [SHPCHotplug AER LTR]
[    1.903934] acpi PNP0A08:03: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    1.904417] PCI host bridge to bus 0000:b2
[    1.904429] pci_bus 0000:b2: root bus resource [io  0xc000-0xffff window]
[    1.904445] pci_bus 0000:b2: root bus resource [mem 0xd9000000-0xfbffffff window]
[    1.904464] pci_bus 0000:b2: root bus resource [mem 0x380300000000-0x3803ffffffff window]
[    1.904483] pci_bus 0000:b2: root bus resource [bus b2-ff]
[    1.904511] pci 0000:b2:05.0: [8086:2034] type 00 class 0x088000
[    1.904675] pci 0000:b2:05.2: [8086:2035] type 00 class 0x088000
[    1.904835] pci 0000:b2:05.4: [8086:2036] type 00 class 0x080020
[    1.904859] pci 0000:b2:05.4: reg 0x10: [mem 0xfbf00000-0xfbf00fff]
[    1.905032] pci 0000:b2:12.0: [8086:204c] type 00 class 0x110100
[    1.905223] pci 0000:b2:12.1: [8086:204d] type 00 class 0x110100
[    1.905352] pci 0000:b2:12.2: [8086:204e] type 00 class 0x088000
[    1.905485] pci 0000:b2:15.0: [8086:2018] type 00 class 0x088000
[    1.905656] pci 0000:b2:16.0: [8086:2018] type 00 class 0x088000
[    1.905827] pci 0000:b2:16.4: [8086:2018] type 00 class 0x088000
[    1.905958] pci 0000:b2:17.0: [8086:2018] type 00 class 0x088000
[    1.906130] pci_bus 0000:b2: on NUMA node 0
[    1.906489] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.906613] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    1.906727] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.906841] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.906954] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.907067] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.907180] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.907293] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    1.907433] ACPI BIOS Error (bug): Could not resolve symbol [\SHAD._STA.SDS0], AE_NOT_FOUND (20200326/psargs-330)
[    1.907461] ACPI Error: Aborting method \SHAD._STA due to previous error (AE_NOT_FOUND) (20200326/psparse-529)
[    1.907847] iommu: Default domain type: Translated 
[    1.907847] pci 0000:65:00.0: vgaarb: setting as boot VGA device
[    1.907847] pci 0000:65:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    1.907847] pci 0000:65:00.0: vgaarb: bridge control possible
[    1.907847] vgaarb: loaded
[    1.908417] SCSI subsystem initialized
[    1.908518] libata version 3.00 loaded.
[    1.908518] ACPI: bus type USB registered
[    1.908518] usbcore: registered new interface driver usbfs
[    1.908518] usbcore: registered new interface driver hub
[    1.908536] usbcore: registered new device driver usb
[    1.908570] mc: Linux media interface: v0.10
[    1.908589] videodev: Linux video capture interface: v2.00
[    1.908634] pps_core: LinuxPPS API ver. 1 registered
[    1.908646] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.908668] PTP clock support registered
[    1.908707] EDAC MC: Ver: 3.0.0
[    1.908940] Registered efivars operations
[    1.908940] Advanced Linux Sound Architecture Driver Initialized.
[    1.908940] PCI: Using ACPI for IRQ routing
[    1.914650] PCI: pci_cache_line_size set to 64 bytes
[    1.914793] e820: reserve RAM buffer [mem 0x2cb45018-0x2fffffff]
[    1.914797] e820: reserve RAM buffer [mem 0x2cb65018-0x2fffffff]
[    1.914799] e820: reserve RAM buffer [mem 0x314db000-0x33ffffff]
[    1.914801] e820: reserve RAM buffer [mem 0x33c03000-0x33ffffff]
[    1.914802] e820: reserve RAM buffer [mem 0x356f0000-0x37ffffff]
[    1.914804] e820: reserve RAM buffer [mem 0x369cc000-0x37ffffff]
[    1.915141] Bluetooth: Core ver 2.22
[    1.915163] NET: Registered protocol family 31
[    1.915174] Bluetooth: HCI device and connection manager initialized
[    1.915196] Bluetooth: HCI socket layer initialized
[    1.915208] Bluetooth: L2CAP socket layer initialized
[    1.915230] Bluetooth: SCO socket layer initialized
[    1.915262] NetLabel: Initializing
[    1.915270] NetLabel:  domain hash size = 128
[    1.915280] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.915320] NetLabel:  unlabeled traffic allowed by default
[    1.915926] acpi PNP0C14:03: duplicate WMI GUID DEADBEEF-4001-0000-00A0-C90629100000 (first instance was on PNP0C14:03)
[    1.916108] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    1.916125] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    1.918401] clocksource: Switched to clocksource tsc-early
[    1.976320] VFS: Disk quotas dquot_6.6.0
[    1.976354] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.976575] pnp: PnP ACPI init
[    1.977123] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.977320] system 00:01: [io  0x0500-0x053f] has been reserved
[    1.977337] system 00:01: [io  0x0400-0x047f] has been reserved
[    1.977353] system 00:01: [io  0x0540-0x057f] has been reserved
[    1.977368] system 00:01: [io  0x0600-0x061f] has been reserved
[    1.977383] system 00:01: [io  0x0ca0-0x0ca5] has been reserved
[    1.977398] system 00:01: [io  0x0880-0x0883] has been reserved
[    1.977413] system 00:01: [io  0x0800-0x081f] has been reserved
[    1.977429] system 00:01: [mem 0xfed1c000-0xfed3ffff] has been reserved
[    1.977446] system 00:01: [mem 0xfed45000-0xfed8bfff] has been reserved
[    1.977462] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
[    1.977479] system 00:01: [mem 0xfee00000-0xfeefffff] could not be reserved
[    1.977497] system 00:01: [mem 0xfed12000-0xfed1200f] has been reserved
[    1.977513] system 00:01: [mem 0xfed12010-0xfed1201f] has been reserved
[    1.977530] system 00:01: [mem 0xfed1b000-0xfed1bfff] has been reserved
[    1.977551] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.977905] system 00:02: [io  0x0a00-0x0a2f] has been reserved
[    1.977920] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    1.977935] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    1.977955] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.978328] system 00:03: [mem 0xfd000000-0xfdabffff] has been reserved
[    1.978346] system 00:03: [mem 0xfdad0000-0xfdadffff] has been reserved
[    1.978362] system 00:03: [mem 0xfdb00000-0xfdffffff] has been reserved
[    1.978379] system 00:03: [mem 0xfe000000-0xfe00ffff] has been reserved
[    1.978395] system 00:03: [mem 0xfe011000-0xfe01ffff] has been reserved
[    1.978412] system 00:03: [mem 0xfe036000-0xfe03bfff] has been reserved
[    1.978428] system 00:03: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    1.978445] system 00:03: [mem 0xfe410000-0xfe7fffff] has been reserved
[    1.978465] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.978776] system 00:04: [io  0x0f00-0x0ffe] has been reserved
[    1.978796] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.980090] system 00:05: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    1.980108] system 00:05: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    1.980124] system 00:05: [mem 0xfdac0000-0xfdacffff] has been reserved
[    1.980145] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.981268] ACPI BIOS Error (bug): Could not resolve symbol [\SHAD._STA.SDS0], AE_NOT_FOUND (20200326/psargs-330)
[    1.981294] ACPI Error: Aborting method \SHAD._STA due to previous error (AE_NOT_FOUND) (20200326/psparse-529)
[    1.981323] pnp: PnP ACPI: found 6 devices
[    1.989228] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.989258] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
[    1.989277] pci 0000:00:1d.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 04] add_size 200000 add_align 100000
[    1.989301] pci 0000:00:1d.0: bridge window [mem 0x00100000-0x000fffff] to [bus 04] add_size 200000 add_align 100000
[    1.989329] pci 0000:00:1d.0: BAR 14: assigned [mem 0x70000000-0x701fffff]
[    1.989346] pci 0000:00:1d.0: BAR 15: assigned [mem 0x380000000000-0x3800001fffff 64bit pref]
[    1.989366] pci 0000:00:1d.0: BAR 13: assigned [io  0x1000-0x1fff]
[    1.989381] pci 0000:00:1b.0: PCI bridge to [bus 01]
[    1.989401] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    1.989421] pci 0000:00:1c.4: PCI bridge to [bus 03]
[    1.989435] pci 0000:00:1c.4:   bridge window [mem 0x92e00000-0x92efffff]
[    1.989454] pci 0000:00:1d.0: PCI bridge to [bus 04]
[    1.989466] pci 0000:00:1d.0:   bridge window [io  0x1000-0x1fff]
[    1.989482] pci 0000:00:1d.0:   bridge window [mem 0x70000000-0x701fffff]
[    1.989498] pci 0000:00:1d.0:   bridge window [mem 0x380000000000-0x3800001fffff 64bit pref]
[    1.989520] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.989534] pci_bus 0000:00: resource 5 [io  0x1000-0x3fff window]
[    1.989547] pci_bus 0000:00: resource 6 [mem 0x000c4000-0x000c7fff window]
[    1.989562] pci_bus 0000:00: resource 7 [mem 0xfe010000-0xfe010fff window]
[    1.989577] pci_bus 0000:00: resource 8 [mem 0x70000000-0x92ffffff window]
[    1.989592] pci_bus 0000:00: resource 9 [mem 0x380000000000-0x3800ffffffff window]
[    1.989609] pci_bus 0000:03: resource 1 [mem 0x92e00000-0x92efffff]
[    1.989622] pci_bus 0000:04: resource 0 [io  0x1000-0x1fff]
[    1.989635] pci_bus 0000:04: resource 1 [mem 0x70000000-0x701fffff]
[    1.989649] pci_bus 0000:04: resource 2 [mem 0x380000000000-0x3800001fffff 64bit pref]
[    1.989899] pci_bus 0000:16: resource 4 [io  0x4000-0x7fff window]
[    1.989912] pci_bus 0000:16: resource 5 [mem 0x93000000-0xb5ffffff window]
[    1.989927] pci_bus 0000:16: resource 6 [mem 0x380100000000-0x3801ffffffff window]
[    1.989981] pci 0000:64:00.0: PCI bridge to [bus 65]
[    1.989993] pci 0000:64:00.0:   bridge window [io  0xb000-0xbfff]
[    1.990008] pci 0000:64:00.0:   bridge window [mem 0xd7000000-0xd80fffff]
[    1.990024] pci 0000:64:00.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    1.990043] pci_bus 0000:64: resource 4 [mem 0x000a0000-0x000bffff window]
[    1.990058] pci_bus 0000:64: resource 5 [io  0x8000-0xbfff window]
[    1.990072] pci_bus 0000:64: resource 6 [io  0x03b0-0x03bb window]
[    1.990085] pci_bus 0000:64: resource 7 [io  0x03c0-0x03df window]
[    1.990099] pci_bus 0000:64: resource 8 [mem 0xb6000000-0xd8ffffff window]
[    1.990114] pci_bus 0000:64: resource 9 [mem 0x380200000000-0x3802ffffffff window]
[    1.990130] pci_bus 0000:65: resource 0 [io  0xb000-0xbfff]
[    1.990143] pci_bus 0000:65: resource 1 [mem 0xd7000000-0xd80fffff]
[    1.990156] pci_bus 0000:65: resource 2 [mem 0xc0000000-0xd1ffffff 64bit pref]
[    1.990199] pci_bus 0000:b2: resource 4 [io  0xc000-0xffff window]
[    1.990213] pci_bus 0000:b2: resource 5 [mem 0xd9000000-0xfbffffff window]
[    1.990228] pci_bus 0000:b2: resource 6 [mem 0x380300000000-0x3803ffffffff window]
[    1.990326] NET: Registered protocol family 2
[    1.990655] tcp_listen_portaddr_hash hash table entries: 32768 (order: 9, 2621440 bytes, linear)
[    1.991338] TCP established hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    1.992172] TCP bind hash table entries: 65536 (order: 10, 4718592 bytes, vmalloc)
[    1.993551] TCP: Hash tables configured (established 524288 bind 65536)
[    1.994304] UDP hash table entries: 32768 (order: 10, 5242880 bytes, vmalloc)
[    1.996323] UDP-Lite hash table entries: 32768 (order: 10, 5242880 bytes, vmalloc)
[    1.997861] NET: Registered protocol family 1
[    2.054173] pci 0000:00:14.0: quirk_usb_early_handoff+0x0/0x645 took 54802 usecs
[    2.054226] pci 0000:03:00.0: PME# does not work under D0, disabling it
[    2.054620] pci 0000:16:05.0: disabled boot interrupts on device [8086:2034]
[    2.054710] pci 0000:64:05.0: disabled boot interrupts on device [8086:2034]
[    2.054777] pci 0000:65:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    2.054798] pci 0000:65:00.0: CLS mismatch (64 != 32), using 64 bytes
[    2.054871] pci 0000:65:00.1: D0 power state depends on 0000:65:00.0
[    2.054978] pci 0000:b2:05.0: disabled boot interrupts on device [8086:2034]
[    2.055121] Unpacking initramfs...
[    2.269455] Freeing initrd memory: 2792K
[    2.269567] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    2.269582] software IO TLB: mapped [mem 0x4c000000-0x50000000] (64MB)
[    2.269995] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 655360 ms ovfl timer
[    2.270013] RAPL PMU: hw unit of domain package 2^-14 Joules
[    2.270025] RAPL PMU: hw unit of domain dram 2^-16 Joules
[    2.277740] check: Scanning for low memory corruption every 60 seconds
[    2.282719] Initialise system trusted keyrings
[    2.282810] workingset: timestamp_bits=56 max_order=24 bucket_order=0
[    2.286663] zbud: loaded
[    2.288266] Key type cifs.idmap registered
[    2.288346] fuse: init (API version 7.31)
[    2.291169] Key type asymmetric registered
[    2.291189] Asymmetric key parser 'x509' registered
[    2.291218] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    2.292293] pcieport 0000:00:1b.0: PME: Signaling with IRQ 24
[    2.292942] pcieport 0000:00:1c.0: PME: Signaling with IRQ 25
[    2.293158] pcieport 0000:00:1c.4: PME: Signaling with IRQ 26
[    2.293692] pcieport 0000:00:1d.0: PME: Signaling with IRQ 27
[    2.293758] pcieport 0000:00:1d.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    2.294589] pcieport 0000:64:00.0: PME: Signaling with IRQ 29
[    2.294979] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.295100] efifb: probing for efifb
[    2.295133] efifb: framebuffer at 0xd1000000, using 3072k, total 3072k
[    2.295149] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    2.295163] efifb: scrolling: redraw
[    2.295173] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    2.296671] Console: switching to colour frame buffer device 128x48
[    2.297903] fb0: EFI VGA frame buffer device
[    2.297935] intel_idle: MWAIT substates: 0x2020
[    2.298038] Monitor-Mwait will be used to enter C-1 state
[    2.298053] Monitor-Mwait will be used to enter C-2 state
[    2.298060] ACPI: \_SB_.SCK0.CP00: Found 2 idle states
[    2.298085] intel_idle: v0.5.1 model 0x55
[    2.300982] intel_idle: Local APIC timer is reliable in all C-states
[    2.301310] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
[    2.301404] ACPI: Sleep Button [SLPB]
[    2.301523] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    2.301605] ACPI: Power Button [PWRB]
[    2.301682] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    2.305148] ACPI: Power Button [PWRF]
[    2.310319] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    2.311346] Non-volatile memory driver v1.3
[    2.311405] Linux agpgart interface v0.103
[    2.311594] [drm:drm_core_init] Initialized
[    2.311649] [drm:nouveau_drm_init] Loading Nouveau with parameters:
[    2.311651] [drm:nouveau_drm_init] ... tv_disable   : 0
[    2.311652] [drm:nouveau_drm_init] ... ignorelid    : 0
[    2.311654] [drm:nouveau_drm_init] ... duallink     : 1
[    2.311655] [drm:nouveau_drm_init] ... nofbaccel    : 0
[    2.311656] [drm:nouveau_drm_init] ... config       : (null)
[    2.311658] [drm:nouveau_drm_init] ... debug        : (null)
[    2.311659] [drm:nouveau_drm_init] ... noaccel      : 0
[    2.311661] [drm:nouveau_drm_init] ... modeset      : -1
[    2.311662] [drm:nouveau_drm_init] ... runpm        : -1
[    2.311663] [drm:nouveau_drm_init] ... vram_pushbuf : 0
[    2.311665] [drm:nouveau_drm_init] ... hdmimhz      : 0
[    2.311667] MXM: GUID detected in BIOS
[    2.312139] checking generic (d1000000 300000) vs hw (c0000000 10000000)
[    2.312149] checking generic (d1000000 300000) vs hw (d0000000 2000000)
[    2.312155] fb0: switching to nouveaufb from EFI VGA
[    2.313171] Console: switching to colour dummy device 80x25
[    2.313551] nouveau 0000:65:00.0: NVIDIA GP104 (134000a1)
[    2.424113] nouveau 0000:65:00.0: bios: version 86.04.60.40.1f
[    2.425807] nouveau 0000:65:00.0: fb: 8192 MiB GDDR5X
[    2.458289] [TTM] Zone  kernel: Available graphics memory: 32757026 KiB
[    2.458331] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    2.458348] [TTM] Initializing pool allocator
[    2.458368] [TTM] Initializing DMA pool allocator
[    2.458423] nouveau 0000:65:00.0: DRM: VRAM: 8192 MiB
[    2.458439] nouveau 0000:65:00.0: DRM: GART: 536870912 MiB
[    2.458454] nouveau 0000:65:00.0: DRM: BIT table 'A' not found
[    2.458468] nouveau 0000:65:00.0: DRM: BIT table 'L' not found
[    2.458483] nouveau 0000:65:00.0: DRM: TMDS table version 2.0
[    2.458497] nouveau 0000:65:00.0: DRM: DCB version 4.1
[    2.458510] nouveau 0000:65:00.0: DRM: DCB outp 00: 01000f42 00020030
[    2.458526] nouveau 0000:65:00.0: DRM: DCB outp 01: 04811f96 04600020
[    2.458541] nouveau 0000:65:00.0: DRM: DCB outp 02: 04011f92 00020020
[    2.458557] nouveau 0000:65:00.0: DRM: DCB outp 03: 04822f86 04600010
[    2.458572] nouveau 0000:65:00.0: DRM: DCB outp 04: 04022f82 00020010
[    2.458588] nouveau 0000:65:00.0: DRM: DCB outp 06: 02033f62 00020010
[    2.458603] nouveau 0000:65:00.0: DRM: DCB outp 07: 02844f76 04600020
[    2.458619] nouveau 0000:65:00.0: DRM: DCB outp 08: 02044f72 00020020
[    2.458634] nouveau 0000:65:00.0: DRM: DCB conn 00: 00001031
[    2.458648] nouveau 0000:65:00.0: DRM: DCB conn 01: 02000146
[    2.458662] nouveau 0000:65:00.0: DRM: DCB conn 02: 01000246
[    2.458676] nouveau 0000:65:00.0: DRM: DCB conn 03: 00010361
[    2.458690] nouveau 0000:65:00.0: DRM: DCB conn 04: 00020446
[    2.458704] nouveau 0000:65:00.0: DRM: Pointer to flat panel table invalid
[    2.459445] nouveau 0000:65:00.0: DRM: MM: using COPY for buffer copies
[    2.480945] [drm:drm_dp_dpcd_access] Too many retries, giving up. First error: -6
[    2.500821] [drm:drm_dp_dpcd_access] Too many retries, giving up. First error: -6
[    2.501505] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.501540] 0088 1 core507d_init
[    2.501556] 	f0000000
[    2.540783] [drm:drm_client_modeset_probe] 
[    2.540816] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[    2.540830] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[    2.540840] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[    2.540848] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[    2.540857] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[    2.540940] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[    2.542376] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] status updated from unknown to disconnected
[    2.542416] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[    2.542428] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[    2.594958] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] status updated from unknown to disconnected
[    2.594967] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[    2.594976] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[    2.648290] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] status updated from unknown to disconnected
[    2.648298] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[    2.648307] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[    2.649602] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] status updated from unknown to disconnected
[    2.649610] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[    2.649619] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[    2.649848] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[    2.649942] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[    2.650003] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[    2.650240] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[    2.650479] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[    2.651736] [drm:drm_dp_mst_topology_mgr_set_mst] mstb 000000008fd28a05 (2)
[    2.652595] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (1)
[    2.652605] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] status updated from unknown to disconnected
[    2.652613] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[    2.652628] [drm:drm_client_modeset_probe] No connectors reported connected with modes
[    2.652643] [drm:drm_client_modeset_probe] connector 85 enabled? no
[    2.652650] [drm:drm_client_modeset_probe] connector 87 enabled? no
[    2.652657] [drm:drm_client_modeset_probe] connector 90 enabled? no
[    2.652664] [drm:drm_client_modeset_probe] connector 93 enabled? no
[    2.652671] [drm:drm_client_modeset_probe] connector 95 enabled? no
[    2.652727] [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
[    2.652742] [drm:drm_client_modeset_probe] picking CRTCs for 16384x16384 config
[    2.652754] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[    2.652761] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[    2.652768] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[    2.652774] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[    2.652781] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[    2.652805] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
[    2.652821] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 1 primary plane
[    2.652828] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 2 primary plane
[    2.652835] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 3 primary plane
[    2.652842] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    2.653554] [drm:drm_minor_register] 
[    2.654067] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.654142] [drm:drm_client_modeset_probe] 
[    2.654160] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[    2.654174] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[    2.654184] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[    2.654192] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[    2.654202] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[    2.654236] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[    2.655591] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[    2.655605] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[    2.668347] [drm:drm_minor_register] new minor registered 128
[    2.668353] [drm:drm_minor_register] 
[    2.668693] [drm:drm_minor_register] new minor registered 0
[    2.668997] [drm:drm_sysfs_connector_add] adding "DVI-D-1" to sysfs
[    2.669012] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.669251] [drm:drm_sysfs_connector_add] adding "DP-1" to sysfs
[    2.669258] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.669427] [drm:drm_sysfs_connector_add] adding "DP-2" to sysfs
[    2.669433] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.669605] [drm:drm_sysfs_connector_add] adding "HDMI-A-1" to sysfs
[    2.669611] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.669777] [drm:drm_sysfs_connector_add] adding "DP-3" to sysfs
[    2.669783] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.669852] [drm] Initialized nouveau 1.3.1 20120801 for 0000:65:00.0 on minor 0
[    2.686749] loop: module loaded
[    2.686922] usbcore: registered new interface driver rtsx_usb
[    2.708269] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[    2.708273] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[    2.761606] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[    2.761609] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[    2.762851] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[    2.762853] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[    2.763072] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[    2.763098] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[    2.763117] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[    2.763311] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[    2.763505] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[    2.763850] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[    2.763854] [drm:drm_client_modeset_probe] No connectors reported connected with modes
[    2.763858] [drm:drm_client_modeset_probe] connector 85 enabled? no
[    2.763860] [drm:drm_client_modeset_probe] connector 87 enabled? no
[    2.763862] [drm:drm_client_modeset_probe] connector 90 enabled? no
[    2.763864] [drm:drm_client_modeset_probe] connector 93 enabled? no
[    2.763866] [drm:drm_client_modeset_probe] connector 95 enabled? no
[    2.763883] [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
[    2.763888] [drm:drm_client_modeset_probe] picking CRTCs for 16384x16384 config
[    2.763892] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[    2.763894] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[    2.763896] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[    2.763898] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[    2.763900] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[    2.763906] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
[    2.763910] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 1 primary plane
[    2.763912] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 2 primary plane
[    2.763914] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 3 primary plane
[    2.763916] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    2.763972] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (2)
[    2.763977] [drm:drm_dp_mst_link_probe_work] Clearing payload ID table
[    2.764218] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.764613] ahci 0000:00:17.0: version 3.0
[    2.766623] nouveau 0000:65:00.0: DRM: service DP-3
[    2.767539] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.767544] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.771410] nouveau 0000:65:00.0: DRM: service DP-3
[    2.772275] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.772668] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.774767] nouveau 0000:65:00.0: DRM: service DP-3
[    2.775176] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[    2.775198] ahci 0000:00:17.0: flags: 64bit ncq sntf led clo only pio slum part ems deso sadm sds apst 
[    2.775611] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.776005] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.778273] nouveau 0000:65:00.0: DRM: service DP-3
[    2.779121] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.779513] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.779599] [drm:drm_dp_send_link_address] link address reply: 3
[    2.779610] [drm:drm_dp_send_link_address] port 0: input 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, ldps 0, sdp 0/0
[    2.779619] [drm:drm_dp_send_link_address] port 1: input 0, pdt: 3, pn: 8, dpcd_rev: 12, mcs: 0, ddps: 1, ldps 0, sdp 1/2
[    2.779626] [drm:drm_dp_send_link_address] port 2: input 0, pdt: 3, pn: 9, dpcd_rev: 12, mcs: 0, ddps: 1, ldps 0, sdp 0/0
[    2.779636] [drm:drm_dp_mst_add_port] mstb 000000008fd28a05 (2)
[    2.779644] [drm:drm_dp_send_link_address] port 000000005d2ad023 (2)
[    2.779652] [drm:drm_dp_mst_topology_put_port] port 000000005d2ad023 (1)
[    2.779661] [drm:drm_dp_mst_add_port] mstb 000000008fd28a05 (3)
[    2.779668] [drm:drm_dp_send_link_address] port 00000000554b0bb4 (2)
[    2.783176] nouveau 0000:65:00.0: DRM: service DP-3
[    2.784059] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.784062] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.784127] [drm:drm_dp_send_enum_path_resources] enum path resources 8: 2560 2560
[    2.784255] [drm:nv50_mstm_add_connector] port 00000000554b0bb4 (2)
[    2.784295] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.791536] nouveau 0000:65:00.0: DRM: service DP-3
[    2.792459] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.792462] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.792536] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.792559] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.799736] nouveau 0000:65:00.0: DRM: service DP-3
[    2.800616] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.801455] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.804366] nouveau 0000:65:00.0: DRM: service DP-3
[    2.805223] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.806036] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.808792] nouveau 0000:65:00.0: DRM: service DP-3
[    2.809637] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.810453] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.813446] nouveau 0000:65:00.0: DRM: service DP-3
[    2.814325] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.815140] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.815205] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.815224] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.822783] nouveau 0000:65:00.0: DRM: service DP-3
[    2.823665] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.824501] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.827220] nouveau 0000:65:00.0: DRM: service DP-3
[    2.828099] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.828925] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.831770] nouveau 0000:65:00.0: DRM: service DP-3
[    2.832612] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.833427] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.836319] nouveau 0000:65:00.0: DRM: service DP-3
[    2.837197] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.838013] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.838077] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.838157] [drm:drm_sysfs_connector_add] adding "DP-4" to sysfs
[    2.838161] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.838195] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    2.838198] [drm:drm_dp_mst_add_port] mstb 000000008fd28a05 (4)
[    2.838200] [drm:drm_dp_send_link_address] port 00000000a7dd8125 (2)
[    2.842423] nouveau 0000:65:00.0: DRM: service DP-3
[    2.843306] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.843309] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.843372] [drm:drm_dp_send_enum_path_resources] enum path resources 9: 1260 1260
[    2.843439] [drm:nv50_mstm_add_connector] port 00000000a7dd8125 (2)
[    2.843444] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.850617] nouveau 0000:65:00.0: DRM: service DP-3
[    2.851460] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.851463] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.854864] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.854889] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.855205] scsi host0: ahci
[    2.855531] scsi host1: ahci
[    2.855720] scsi host2: ahci
[    2.855903] scsi host3: ahci
[    2.856082] scsi host4: ahci
[    2.856292] scsi host5: ahci
[    2.856482] scsi host6: ahci
[    2.856664] scsi host7: ahci
[    2.856765] ata1: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b100 irq 33
[    2.856783] ata2: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b180 irq 33
[    2.856801] ata3: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b200 irq 33
[    2.856819] ata4: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b280 irq 33
[    2.856837] ata5: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b300 irq 33
[    2.856855] ata6: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b380 irq 33
[    2.856873] ata7: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b400 irq 33
[    2.856890] ata8: SATA max UDMA/133 abar m2048@0x92f6b000 port 0x92f6b480 irq 33
[    2.857193] tun: Universal TUN/TAP device driver, 1.6
[    2.857329] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    2.857342] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.857761] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[    2.862108] nouveau 0000:65:00.0: DRM: service DP-3
[    2.862952] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.863790] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.866677] nouveau 0000:65:00.0: DRM: service DP-3
[    2.867557] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.868370] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.871164] nouveau 0000:65:00.0: DRM: service DP-3
[    2.872009] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.872823] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.875861] nouveau 0000:65:00.0: DRM: service DP-3
[    2.876738] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.877554] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.877619] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.877637] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    2.885170] nouveau 0000:65:00.0: DRM: service DP-3
[    2.886050] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.886885] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.889655] nouveau 0000:65:00.0: DRM: service DP-3
[    2.890499] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.891313] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.894134] nouveau 0000:65:00.0: DRM: service DP-3
[    2.894980] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.895793] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.898667] nouveau 0000:65:00.0: DRM: service DP-3
[    2.899512] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (4)
[    2.900328] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (3)
[    2.911621] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    2.911758] [drm:drm_sysfs_connector_add] adding "DP-5" to sysfs
[    2.911765] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.911839] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    2.911848] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (1)
[    2.911863] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.911924] [drm:drm_client_modeset_probe] 
[    2.911945] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[    2.911960] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[    2.911970] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[    2.911978] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[    2.911988] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[    2.911997] [drm:drm_mode_object_get] OBJ ID: 98 (2)
[    2.912005] [drm:drm_mode_object_get] OBJ ID: 100 (2)
[    2.912042] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[    2.913382] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[    2.913397] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[    3.018288] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[    3.018298] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[    3.101606] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[    3.101610] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[    3.102854] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[    3.102857] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[    3.103076] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[    3.103104] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[    3.103122] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[    3.103316] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[    3.103510] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[    3.103855] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[    3.103858] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4]
[    3.103863] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.103868] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.103870] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4] status updated from unknown to connected
[    3.103876] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.103881] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103884] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.103887] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.103890] [drm:drm_add_display_info] non_desktop set to 0
[    3.103893] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103895] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.103898] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103901] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[    3.103903] [drm:drm_update_tile_info] tile cap 0x82
[    3.103906] [drm:drm_update_tile_info] tile_size 1920 x 2160
[    3.103908] [drm:drm_update_tile_info] topo num tiles 2x1, location 1x0
[    3.103911] [drm:drm_update_tile_info] vend DEL
[    3.103925] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103927] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    3.103930] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.103932] [drm:drm_add_display_info] non_desktop set to 0
[    3.103935] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103937] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.103948] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103951] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103954] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.103956] nouveau 0000:65:00.0: DRM: native mode from preferred
[    3.103983] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4] probed modes :
[    3.103988] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[    3.103990] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5]
[    3.103994] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.103997] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.103999] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5] status updated from unknown to connected
[    3.104002] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.104005] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104008] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.104011] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.104013] [drm:drm_add_display_info] non_desktop set to 0
[    3.104015] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104018] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.104020] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104023] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[    3.104026] [drm:drm_update_tile_info] tile cap 0x82
[    3.104028] [drm:drm_update_tile_info] tile_size 1920 x 2160
[    3.104031] [drm:drm_update_tile_info] topo num tiles 2x1, location 0x0
[    3.104033] [drm:drm_update_tile_info] vend DEL
[    3.104039] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104041] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    3.104044] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.104046] [drm:drm_add_display_info] non_desktop set to 0
[    3.104049] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104051] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.104073] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104075] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104078] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.104080] nouveau 0000:65:00.0: DRM: native mode from preferred
[    3.104157] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5] probed modes :
[    3.104160] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[    3.104162] [drm:drm_mode_debug_printmodeline] Modeline "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209 1245 0x40 0x6
[    3.104165] [drm:drm_mode_debug_printmodeline] Modeline "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0xa
[    3.104167] [drm:drm_mode_debug_printmodeline] Modeline "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204 1250 0x40 0x5
[    3.104169] [drm:drm_mode_debug_printmodeline] Modeline "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059 1089 0x40 0x6
[    3.104172] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
[    3.104174] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
[    3.104177] [drm:drm_mode_debug_printmodeline] Modeline "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 0x40 0x6
[    3.104179] [drm:drm_mode_debug_printmodeline] Modeline "1152x864": 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[    3.104182] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[    3.104184] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    3.104187] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    3.104189] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    3.104192] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    3.104194] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    3.104196] [drm:drm_mode_debug_printmodeline] Modeline "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[    3.104199] [drm:drm_client_modeset_probe] connector 85 enabled? no
[    3.104201] [drm:drm_client_modeset_probe] connector 87 enabled? no
[    3.104204] [drm:drm_client_modeset_probe] connector 90 enabled? no
[    3.104206] [drm:drm_client_modeset_probe] connector 93 enabled? no
[    3.104208] [drm:drm_client_modeset_probe] connector 95 enabled? no
[    3.104210] [drm:drm_client_modeset_probe] connector 98 enabled? yes
[    3.104212] [drm:drm_client_modeset_probe] connector 100 enabled? yes
[    3.104227] [drm:drm_client_firmware_config.isra.0] connector DP-4 has no encoder or crtc, skipping
[    3.104230] [drm:drm_client_firmware_config.isra.0] connector DP-5 has no encoder or crtc, skipping
[    3.104232] [drm:drm_client_firmware_config.isra.0] connector DVI-D-1 not enabled, skipping
[    3.104234] [drm:drm_client_firmware_config.isra.0] connector DP-1 not enabled, skipping
[    3.104237] [drm:drm_client_firmware_config.isra.0] connector DP-2 not enabled, skipping
[    3.104239] [drm:drm_client_firmware_config.isra.0] connector HDMI-A-1 not enabled, skipping
[    3.104242] [drm:drm_client_firmware_config.isra.0] connector DP-3 not enabled, skipping
[    3.104244] [drm:drm_client_firmware_config.isra.0] fallback: Not all outputs enabled
[    3.104246] [drm:drm_client_firmware_config.isra.0] Enabled: 0, detected: 2
[    3.104249] [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
[    3.104253] [drm:drm_client_modeset_probe] looking for cmdline mode on connector 100
[    3.104255] [drm:drm_client_modeset_probe] looking for preferred mode on connector 100 1
[    3.104258] [drm:drm_client_modeset_probe] found mode 1920x2160
[    3.104260] [drm:drm_client_modeset_probe] no modes for connector tiled 5 98
[    3.104262] [drm:drm_client_modeset_probe] returned 1920 0 for 1 0
[    3.104264] [drm:drm_client_modeset_probe] looking for cmdline mode on connector 98
[    3.104267] [drm:drm_client_modeset_probe] looking for preferred mode on connector 98 1
[    3.104269] [drm:drm_client_modeset_probe] found mode 1920x2160
[    3.104271] [drm:drm_client_modeset_probe] picking CRTCs for 16384x16384 config
[    3.104278] [drm:drm_client_modeset_probe] desired mode 1920x2160 set on crtc 50 (1920,0)
[    3.104283] [drm:drm_mode_object_get] OBJ ID: 98 (2)
[    3.104286] [drm:drm_client_modeset_probe] desired mode 1920x2160 set on crtc 61 (0,0)
[    3.104288] [drm:drm_mode_object_get] OBJ ID: 100 (2)
[    3.104291] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[    3.104293] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[    3.104295] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[    3.104297] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[    3.104299] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[    3.104301] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (3)
[    3.104303] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (3)
[    3.104310] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
[    3.104312] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 1 primary plane
[    3.104315] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 2 primary plane
[    3.104317] nouveau 0000:65:00.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 3 primary plane
[    3.104773] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    3.167997] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.168054] ata4: SATA link down (SStatus 4 SControl 300)
[    3.168688] ata1: SATA link down (SStatus 4 SControl 300)
[    3.168793] ata3: SATA link down (SStatus 4 SControl 300)
[    3.168839] ata2.00: ATA-10: INTEL SSDSC2KW010T8,  LHF0B1C, max UDMA/133
[    3.168859] ata2.00: 2000409264 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    3.169322] ata2.00: configured for UDMA/133
[    3.169721] scsi 1:0:0:0: Direct-Access     ATA      INTEL SSDSC2KW01 0B1C PQ: 0 ANSI: 5
[    3.170296] ata2.00: Enabling discard_zeroes_data
[    3.170298] sd 1:0:0:0: Attached scsi generic sg0 type 0
[    3.170470] sd 1:0:0:0: [sda] 2000409264 512-byte logical blocks: (1.02 TB/954 GiB)
[    3.170525] sd 1:0:0:0: [sda] Write Protect is off
[    3.170539] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.170566] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.170950] ata2.00: Enabling discard_zeroes_data
[    3.171250] ata5: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    3.171282] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    3.172018] ata8: SATA link down (SStatus 4 SControl 300)
[    3.172055] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.172277] ata7.00: ATA-8: INTEL SSDSC2BB240G4, D2010355, max UDMA/133
[    3.172292] ata7.00: 468862128 sectors, multi 1: LBA48 NCQ (depth 32)
[    3.172355]  sda: sda1 sda2
[    3.172520] ata7.00: configured for UDMA/133
[    3.173321] ata5.00: ATA-8: WDC WD1001FAES-75W7A0, 05.01D05, max UDMA/133
[    3.173342] ata5.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    3.174014] ata2.00: Enabling discard_zeroes_data
[    3.174201] sd 1:0:0:0: [sda] Attached SCSI disk
[    3.176106] ata5.00: configured for UDMA/133
[    3.176311] scsi 4:0:0:0: Direct-Access     ATA      WDC WD1001FAES-7 1D05 PQ: 0 ANSI: 5
[    3.176699] sd 4:0:0:0: Attached scsi generic sg1 type 0
[    3.176714] sd 4:0:0:0: [sdb] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[    3.176787] sd 4:0:0:0: [sdb] Write Protect is off
[    3.176811] sd 4:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    3.176848] sd 4:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.205938] ata6.00: ATAPI: TSSTcorp DVD+/-RW TS-H653H, D700, max UDMA/100
[    3.207673] ata6.00: configured for UDMA/100
[    3.209129] scsi 5:0:0:0: CD-ROM            TSSTcorp DVD+-RW TS-H653H D700 PQ: 0 ANSI: 5
[    3.221122]  sdb: sdb1
[    3.222830] sd 4:0:0:0: [sdb] Attached SCSI disk
[    3.246761] scsi 5:0:0:0: Attached scsi generic sg2 type 5
[    3.247102] scsi 6:0:0:0: Direct-Access     ATA      INTEL SSDSC2BB24 0355 PQ: 0 ANSI: 5
[    3.247382] ata7.00: Enabling discard_zeroes_data
[    3.247403] sd 6:0:0:0: Attached scsi generic sg3 type 0
[    3.247469] sd 6:0:0:0: [sdc] 468862128 512-byte logical blocks: (240 GB/224 GiB)
[    3.247501] sd 6:0:0:0: [sdc] Write Protect is off
[    3.247515] sd 6:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    3.247536] sd 6:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    3.247743] ata7.00: Enabling discard_zeroes_data
[    3.249447]  sdc: sdc1 sdc2 sdc3 sdc4
[    3.251141] ata7.00: Enabling discard_zeroes_data
[    3.251274] sd 6:0:0:0: [sdc] Attached SCSI disk
[    3.295046] tsc: Refined TSC clocksource calibration: 2808.000 MHz
[    3.295087] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2879c5f06f2, max_idle_ns: 440795220049 ns
[    3.295261] clocksource: Switched to clocksource tsc
[    3.389684] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
[    3.416914] nouveau 0000:65:00.0: DRM: allocated 3840x2160 fb: 0x200000, bo 00000000b9359c68
[    3.417137] fbcon: nouveaudrmfb (fb0) is primary device
[    3.417285] [drm:drm_mode_object_get] OBJ ID: 106 (1)
[    3.417296] [drm:drm_mode_object_get] OBJ ID: 98 (2)
[    3.417298] [drm:drm_mode_object_get] OBJ ID: 98 (3)
[    3.417303] [drm:drm_mode_object_get] OBJ ID: 106 (2)
[    3.417310] [drm:drm_mode_object_get] OBJ ID: 100 (2)
[    3.417312] [drm:drm_mode_object_get] OBJ ID: 100 (3)
[    3.417344] [drm:drm_dp_atomic_find_vcpi_slots] port 00000000554b0bb4 (3)
[    3.417347] [drm:drm_dp_atomic_find_vcpi_slots] port 00000000a7dd8125 (3)
[    3.417459] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.417461] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[    3.417463] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.417466] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[    3.417494] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.417505] [drm:drm_dp_mst_allocate_vcpi] initing vcpi for pbn=992 slots=25
[    3.417512] [drm:drm_dp_mst_allocate_vcpi] port 00000000a7dd8125 (4)
[    3.417514] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.417521] 0220 1 sor907d_ctrl
[    3.417524] 	00000902
[    3.417537] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.417540] [drm:drm_dp_mst_allocate_vcpi] initing vcpi for pbn=992 slots=25
[    3.417542] [drm:drm_dp_mst_allocate_vcpi] port 00000000554b0bb4 (4)
[    3.417544] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.417547] 0220 1 sor907d_ctrl
[    3.417549] 	00000903
[    3.417556] 0494 1 head907d_view
[    3.417558] 	00000000
[    3.417560] 04b8 1 head907d_view
[    3.417561] 	08700780
[    3.417563] 04c0 3 head907d_view
[    3.417565] 	08700780
[    3.417566] 	08700780
[    3.417568] 	08700780
[    3.417577] 0410 6 head907d_mode
[    3.417579] 	00000000
[    3.417580] 	08ae0820
[    3.417582] 	0009001f
[    3.417584] 	003a006f
[    3.417585] 	08aa07ef
[    3.417587] 	00000001
[    3.417589] 042c 2 head907d_mode
[    3.417590] 	00000000
[    3.417592] 	ffffff00
[    3.417594] 0450 3 head907d_mode
[    3.417595] 	10867fd0
[    3.417597] 	00200000
[    3.417599] 	10867fd0
[    3.417605] 0460 1 head907d_core_set
[    3.417607] 	00000000
[    3.417609] 0468 4 head907d_core_set
[    3.417610] 	08700f00
[    3.417612] 	01003c00
[    3.417614] 	0000cf00
[    3.417615] 	f0000001
[    3.417617] 04b0 1 head907d_core_set
[    3.417619] 	00000780
[    3.417625] 04d0 1 head917d_base
[    3.417627] 	00020301
[    3.417636] 04a0 1 head917d_dither
[    3.417637] 	00000003
[    3.417646] 0498 1 head907d_procamp
[    3.417648] 	00040000
[    3.417657] 0404 2 head907d_or
[    3.417659] 	00000151
[    3.417660] 	31ec6000
[    3.417718] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[    3.417732] 0794 1 head907d_view
[    3.417734] 	00000000
[    3.417736] 07b8 1 head907d_view
[    3.417737] 	08700780
[    3.417739] 07c0 3 head907d_view
[    3.417741] 	08700780
[    3.417742] 	08700780
[    3.417744] 	08700780
[    3.417750] 0710 6 head907d_mode
[    3.417752] 	00000000
[    3.417754] 	08ae0820
[    3.417755] 	0009001f
[    3.417757] 	003a006f
[    3.417759] 	08aa07ef
[    3.417760] 	00000001
[    3.417762] 072c 2 head907d_mode
[    3.417764] 	00000000
[    3.417765] 	ffffff00
[    3.417767] 0750 3 head907d_mode
[    3.417769] 	10867fd0
[    3.417770] 	00200000
[    3.417772] 	10867fd0
[    3.417778] 0760 1 head907d_core_set
[    3.417780] 	00000000
[    3.417782] 0768 4 head907d_core_set
[    3.417783] 	08700f00
[    3.417785] 	01003c00
[    3.417787] 	0000cf00
[    3.417788] 	f0000001
[    3.417790] 07b0 1 head907d_core_set
[    3.417792] 	00000000
[    3.417801] 07d0 1 head917d_base
[    3.417802] 	00020301
[    3.417809] 07a0 1 head917d_dither
[    3.417810] 	00000003
[    3.417817] 0798 1 head907d_procamp
[    3.417819] 	00040000
[    3.417830] 0704 2 head907d_or
[    3.417832] 	00000151
[    3.417834] 	33ec6000
[    3.418181] [drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 1 : scanoutpos query failed.
[    3.418187] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[    3.418526] [drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 1 : scanoutpos query failed.
[    3.418545] 00a0 2 base507c_ntfy_set
[    3.418547] 	00000060
[    3.418549] 	f0000000
[    3.418556] 0084 1 base907c_image_set
[    3.418558] 	00000010
[    3.418559] 00c0 1 base907c_image_set
[    3.418561] 	fb000000
[    3.418563] 0400 5 base907c_image_set
[    3.418564] 	00002000
[    3.418566] 	00000000
[    3.418568] 	08700f00
[    3.418569] 	01003c00
[    3.418571] 	0000cf00
[    3.418578] 00e0 3 base907c_xlut_set
[    3.418579] 	00000000
[    3.418581] 	00000000
[    3.418583] 	40000000
[    3.418584] 00fc 1 base907c_xlut_set
[    3.418586] 	00000000
[    3.418592] 00a0 2 base507c_ntfy_set
[    3.418594] 	000000a0
[    3.418596] 	f0000000
[    3.418602] 0084 1 base907c_image_set
[    3.418604] 	00000010
[    3.418605] 00c0 1 base907c_image_set
[    3.418607] 	fb000000
[    3.418609] 0400 5 base907c_image_set
[    3.418610] 	00002000
[    3.418612] 	00000000
[    3.418614] 	08700f00
[    3.418615] 	01003c00
[    3.418617] 	0000cf00
[    3.418623] 00e0 3 base907c_xlut_set
[    3.418625] 	00000000
[    3.418626] 	00000000
[    3.418628] 	40000000
[    3.418630] 00fc 1 base907c_xlut_set
[    3.418632] 	00000000
[    3.418638] 0080 1 base507c_update
[    3.418640] 	00000001
[    3.418646] 0080 1 base507c_update
[    3.418648] 	00000001
[    3.418657] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.419322] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.419330] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.419983] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.419994] 0084 1 core507d_update
[    3.419996] 	80000000
[    3.419998] 0080 2 core507d_update
[    3.419999] 	00000022
[    3.420001] 	00000000
[    3.455256] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) e0:d5:5e:e3:99:9a
[    3.455258] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
[    3.455335] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
[    3.455478] Intel(R) Wireless WiFi driver for Linux
[    3.455479] Copyright(c) 2003- 2015 Intel Corporation
[    3.455611] usbcore: registered new interface driver r8152
[    3.455623] usbcore: registered new interface driver asix
[    3.455632] usbcore: registered new interface driver ax88179_178a
[    3.455640] usbcore: registered new interface driver cdc_ether
[    3.455650] usbcore: registered new interface driver net1080
[    3.455658] usbcore: registered new interface driver cdc_subset
[    3.455666] usbcore: registered new interface driver zaurus
[    3.455679] usbcore: registered new interface driver cdc_ncm
[    3.455692] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.455701] ehci-pci: EHCI PCI platform driver
[    3.455746] ehci-platform: EHCI generic platform driver
[    3.456232] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    3.456282] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    3.457417] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
[    3.457421] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    3.458468] hub 1-0:1.0: USB hub found
[    3.458540] hub 1-0:1.0: 16 ports detected
[    3.464261] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    3.464277] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    3.464281] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    3.465689] hub 2-0:1.0: USB hub found
[    3.465883] hub 2-0:1.0: 10 ports detected
[    3.468371] usb: port power management may be unreliable
[    3.473927] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    3.473947] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 3
[    3.485260] [drm:drm_dp_update_payload_part2] payload 0 1
[    3.485264] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (2)
[    3.489823] nouveau 0000:65:00.0: DRM: service DP-3
[    3.491921] nouveau 0000:65:00.0: DRM: service DP-3
[    3.492749] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    3.492754] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    3.492770] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (1)
[    3.492773] [drm:drm_dp_update_payload_part2] payload 1 1
[    3.492776] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (2)
[    3.496833] nouveau 0000:65:00.0: DRM: service DP-3
[    3.499043] nouveau 0000:65:00.0: DRM: service DP-3
[    3.499883] [drm:drm_dp_mst_topology_try_get_mstb] mstb 000000008fd28a05 (3)
[    3.499886] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (2)
[    3.499897] [drm:drm_dp_mst_topology_put_mstb] mstb 000000008fd28a05 (1)
[    3.499952] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.499955] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.499984] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.499987] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.499992] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.499994] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.499999] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.500001] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.500004] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.500007] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.500012] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.500014] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.500017] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.500020] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.500024] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.500026] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.500030] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.500033] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.500038] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.500041] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.500043] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.500046] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.500051] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.500054] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.500058] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.500061] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.500068] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.500070] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.500079] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.500083] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[    3.500086] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.500089] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.500091] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.500093] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.500100] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.500102] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[    3.500105] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.500107] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.500165] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.500168] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[    3.500170] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.500172] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[    3.500176] 0460 1 head907d_core_set
[    3.500178] 	00000000
[    3.500180] 0468 4 head907d_core_set
[    3.500181] 	08700f00
[    3.500183] 	01003c00
[    3.500185] 	0000cf00
[    3.500186] 	f0000001
[    3.500188] 04b0 1 head907d_core_set
[    3.500190] 	00000000
[    3.500200] 0084 1 core507d_update
[    3.500201] 	80000000
[    3.500203] 0080 2 core507d_update
[    3.500205] 	00000000
[    3.500206] 	00000000
[    3.508173] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.508176] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.508178] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.508180] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.508183] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.508185] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.508188] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.508191] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.508228] [drm:vblank_disable_fn] disabling vblank on crtc 0
[    3.508259] [drm:vblank_disable_fn] disabling vblank on crtc 1
[    3.510592] Console: switching to colour frame buffer device 480x135
[    3.510600] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.510603] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.510607] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.510609] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.510614] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.510617] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.510619] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.510622] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.510627] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.510630] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.510633] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.510635] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.510639] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.510642] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.510646] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.510649] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.510654] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.510657] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.510659] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.510662] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.510667] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.510670] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.510674] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.510676] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.510684] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.510686] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.510693] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.510695] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[    3.510699] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.510701] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.510703] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.510705] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.510712] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.510714] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[    3.510717] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.510719] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.510774] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.510777] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[    3.510779] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.510781] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[    3.510790] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[    3.510803] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[    3.510840] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.510843] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.510845] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.510847] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.510849] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.510852] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.510855] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.510858] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.524874] [drm:vblank_disable_fn] disabling vblank on crtc 0
[    3.524908] [drm:vblank_disable_fn] disabling vblank on crtc 1
[    3.528770] xhci_hcd 0000:03:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000010
[    3.542310] hub 3-0:1.0: USB hub found
[    3.542333] hub 3-0:1.0: 2 ports detected
[    3.542638] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    3.542643] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 4
[    3.542646] xhci_hcd 0000:03:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    3.542698] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    3.543253] hub 4-0:1.0: USB hub found
[    3.543270] hub 4-0:1.0: 2 ports detected
[    3.543633] usbcore: registered new interface driver usb-storage
[    3.543845] nouveau 0000:65:00.0: fb0: nouveaudrmfb frame buffer device
[    3.544217] udc-core: couldn't find an available UDC - added [g_mass_storage] to list of pending drivers
[    3.549426] i8042: PNP: No PS/2 controller found.
[    3.549519] nouveau 0000:65:00.0: [drm:drm_fb_helper_hotplug_event.part.0] 
[    3.549775] [drm:drm_client_modeset_probe] 
[    3.549780] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[    3.549783] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[    3.549786] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[    3.549789] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[    3.549792] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[    3.549794] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.549797] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.549802] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[    3.549971] mousedev: PS/2 mouse device common for all mice
[    3.550687] input: PC Speaker as /devices/platform/pcspkr/input/input3
[    3.551122] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[    3.551134] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[    3.551147] rtc_cmos 00:00: RTC can wake from S4
[    3.552217] rtc_cmos 00:00: registered as rtc0
[    3.552770] rtc_cmos 00:00: setting system clock to 2020-06-30T22:43:05 UTC (1593556985)
[    3.553254] rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    3.601602] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[    3.601606] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[    3.654936] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[    3.654939] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[    3.656177] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[    3.656179] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[    3.656397] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[    3.656810] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[    3.657211] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[    3.657786] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[    3.658367] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[    3.659092] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[    3.659095] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4]
[    3.659102] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.659107] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.659110] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[    3.659115] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659117] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[    3.659121] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.659123] [drm:drm_add_display_info] non_desktop set to 0
[    3.659126] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659129] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.659131] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659134] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[    3.659136] [drm:drm_update_tile_info] tile cap 0x82
[    3.659139] [drm:drm_update_tile_info] tile_size 1920 x 2160
[    3.659141] [drm:drm_update_tile_info] topo num tiles 2x1, location 1x0
[    3.659144] [drm:drm_update_tile_info] vend DEL
[    3.659150] [drm:drm_mode_object_put.part.0] OBJ ID: 102 (1)
[    3.659156] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (1)
[    3.659160] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659163] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    3.659165] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.659168] [drm:drm_add_display_info] non_desktop set to 0
[    3.659170] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659173] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.659182] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659184] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659187] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659190] nouveau 0000:65:00.0: DRM: native mode from preferred
[    3.659601] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4] probed modes :
[    3.659605] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[    3.659607] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5]
[    3.659612] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.659615] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.659619] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.659622] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.659624] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[    3.659628] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659630] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[    3.659633] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.659635] [drm:drm_add_display_info] non_desktop set to 0
[    3.659638] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659640] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.659643] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659645] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[    3.659648] [drm:drm_update_tile_info] tile cap 0x82
[    3.659650] [drm:drm_update_tile_info] tile_size 1920 x 2160
[    3.659653] [drm:drm_update_tile_info] topo num tiles 2x1, location 0x0
[    3.659655] [drm:drm_update_tile_info] vend DEL
[    3.659659] [drm:drm_mode_object_put.part.0] OBJ ID: 104 (1)
[    3.659664] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (1)
[    3.659668] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659670] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[    3.659673] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[    3.659675] [drm:drm_add_display_info] non_desktop set to 0
[    3.659678] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659680] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.659698] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659701] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659703] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[    3.659706] nouveau 0000:65:00.0: DRM: native mode from preferred
[    3.660174] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5] probed modes :
[    3.660177] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[    3.660179] [drm:drm_mode_debug_printmodeline] Modeline "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209 1245 0x40 0x6
[    3.660182] [drm:drm_mode_debug_printmodeline] Modeline "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0xa
[    3.660184] [drm:drm_mode_debug_printmodeline] Modeline "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204 1250 0x40 0x5
[    3.660187] [drm:drm_mode_debug_printmodeline] Modeline "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059 1089 0x40 0x6
[    3.660189] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
[    3.660191] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
[    3.660194] [drm:drm_mode_debug_printmodeline] Modeline "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 0x40 0x6
[    3.660196] [drm:drm_mode_debug_printmodeline] Modeline "1152x864": 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[    3.660199] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[    3.660201] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    3.660204] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    3.660206] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    3.660209] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    3.660211] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    3.660214] [drm:drm_mode_debug_printmodeline] Modeline "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[    3.660216] [drm:drm_client_modeset_probe] connector 85 enabled? no
[    3.660218] [drm:drm_client_modeset_probe] connector 87 enabled? no
[    3.660221] [drm:drm_client_modeset_probe] connector 90 enabled? no
[    3.660223] [drm:drm_client_modeset_probe] connector 93 enabled? no
[    3.660225] [drm:drm_client_modeset_probe] connector 95 enabled? no
[    3.660227] [drm:drm_client_modeset_probe] connector 98 enabled? yes
[    3.660229] [drm:drm_client_modeset_probe] connector 100 enabled? yes
[    3.660243] [drm:drm_client_firmware_config.isra.0] looking for cmdline mode on connector DP-4
[    3.660245] [drm:drm_client_firmware_config.isra.0] looking for preferred mode on connector DP-4 1
[    3.660248] [drm:drm_client_firmware_config.isra.0] connector DP-4 on [CRTC:50:head-0]: 1920x2160
[    3.660250] [drm:drm_client_firmware_config.isra.0] looking for cmdline mode on connector DP-5
[    3.660253] [drm:drm_client_firmware_config.isra.0] looking for preferred mode on connector DP-5 1
[    3.660255] [drm:drm_client_firmware_config.isra.0] connector DP-5 on [CRTC:61:head-1]: 1920x2160
[    3.660258] [drm:drm_client_firmware_config.isra.0] connector DVI-D-1 not enabled, skipping
[    3.660260] [drm:drm_client_firmware_config.isra.0] connector DP-1 not enabled, skipping
[    3.660262] [drm:drm_client_firmware_config.isra.0] connector DP-2 not enabled, skipping
[    3.660265] [drm:drm_client_firmware_config.isra.0] connector HDMI-A-1 not enabled, skipping
[    3.660267] [drm:drm_client_firmware_config.isra.0] connector DP-3 not enabled, skipping
[    3.660272] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.660274] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.660277] [drm:drm_client_modeset_probe] desired mode 1920x2160 set on crtc 50 (0,0)
[    3.660280] [drm:drm_mode_object_get] OBJ ID: 98 (3)
[    3.660282] [drm:drm_client_modeset_probe] desired mode 1920x2160 set on crtc 61 (0,0)
[    3.660285] [drm:drm_mode_object_get] OBJ ID: 100 (3)
[    3.660288] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[    3.660290] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[    3.660292] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[    3.660294] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[    3.660296] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[    3.660298] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.660300] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.660319] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.660324] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.660328] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.660331] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.660335] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.660338] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.660342] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.660345] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.660349] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.660352] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.660356] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.660359] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.660365] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.660368] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.660370] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.660373] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.660379] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[    3.660382] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[    3.660386] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[    3.660389] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[    3.660396] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.660398] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.660407] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.660411] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[    3.660415] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.660418] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[    3.660420] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[    3.660423] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[    3.660429] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.660432] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[    3.660435] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.660437] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[    3.660492] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.660495] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[    3.660498] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[    3.660500] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[    3.660507] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[    3.660522] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[    3.660563] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[    3.660566] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[    3.660568] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[    3.660571] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[    3.660574] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[    3.660576] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[    3.660580] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[    3.660583] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[    3.660598] i801_smbus 0000:00:1f.4: enabling device (0001 -> 0003)
[    3.661272] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    3.661698] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    3.663643] IR XMP protocol handler initialized
[    3.664033] usbcore: registered new interface driver uvcvideo
[    3.664394] USB Video Class driver (1.1.1)
[    3.671034] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    3.671532] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[    3.672293] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    3.672687] iTCO_vendor_support: vendor-support=0
[    3.673098] device-mapper: uevent: version 1.0.3
[    3.673664] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    3.674242] Bluetooth: HCI UART driver ver 2.3
[    3.674665] Bluetooth: HCI UART protocol H4 registered
[    3.674858] [drm:vblank_disable_fn] disabling vblank on crtc 0
[    3.675092] Bluetooth: HCI UART protocol BCSP registered
[    3.675105] [drm:vblank_disable_fn] disabling vblank on crtc 1
[    3.675513] Bluetooth: HCI UART protocol ATH3K registered
[    3.675528] Bluetooth: HCI UART protocol Intel registered
[    3.677229] Bluetooth: HCI UART protocol AG6XX registered
[    3.677611] usbcore: registered new interface driver bpa10x
[    3.677994] usbcore: registered new interface driver bfusb
[    3.678379] usbcore: registered new interface driver btusb
[    3.678750] intel_pstate: Intel P-state driver initializing
[    3.685708] intel_pstate: HWP enabled
[    3.686434] sdhci: Secure Digital Host Controller Interface driver
[    3.687122] sdhci: Copyright(c) Pierre Ossman
[    3.690016] ledtrig-cpu: registered to indicate activity on CPUs
[    3.690781] hid: raw HID events driver (C) Jiri Kosina
[    3.692022] usbcore: registered new interface driver usbhid
[    3.692718] usbhid: USB HID core driver
[    3.696525] snd_hda_intel 0000:65:00.1: Disabling MSI
[    3.697659] snd_hda_intel 0000:65:00.1: Handle vga_switcheroo audio client
[    3.699090] usbcore: registered new interface driver snd-usb-audio
[    3.699909] drop_monitor: Initializing network drop monitor service
[    3.701053] NET: Registered protocol family 10
[    3.702973] Segment Routing with IPv6
[    3.710842] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC1220: line_outs=4 (0x14/0x15/0x16/0x17/0x0) type:line
[    3.712161] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.713388] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
[    3.714619] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    3.714788] NET: Registered protocol family 17
[    3.715853] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x1e/0x0
[    3.717025] Bridge firewalling registered
[    3.717754] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    3.719963] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
[    3.720937] snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
[    3.721912] snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
[    3.723108] Bluetooth: RFCOMM socket layer initialized
[    3.723979] snd_hda_intel 0000:65:00.1: bound 0000:65:00.0 (ops nv50_audio_component_bind_ops)
[    3.724504] Bluetooth: RFCOMM ver 1.11
[    3.726653] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    3.727659] Bluetooth: HIDP socket layer initialized
[    3.728603] random: fast init done
[    3.728788] 8021q: 802.1Q VLAN Support v1.8
[    3.734110] Key type dns_resolver registered
[    3.736188] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input4
[    3.737138] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input5
[    3.737992] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input6
[    3.738869] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input7
[    3.739827] input: HDA NVidia HDMI/DP,pcm=10 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input8
[    3.741482] input: HDA NVidia HDMI/DP,pcm=11 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input9
[    3.742349] input: HDA NVidia HDMI/DP,pcm=12 as /devices/pci0000:64/0000:64:00.0/0000:65:00.1/sound/card1/input10
[    3.745082] microcode: sig=0x50654, pf=0x4, revision=0x2006906
[    3.748646] microcode: Microcode Update Driver: v2.2.
[    3.748655] IPI shorthand broadcast: enabled
[    3.751009] AVX2 version of gcm_enc/dec engaged.
[    3.752190] AES CTR mode by8 optimization enabled
[    3.760106] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[    3.761048] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    3.761894] input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    3.762801] input: HDA Intel PCH Line Out Front as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    3.763638] input: HDA Intel PCH Line Out Surround as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    3.764477] input: HDA Intel PCH Line Out CLFE as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    3.765564] input: HDA Intel PCH Line Out Side as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    3.766837] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
[    3.767016] sched_clock: Marking stable (3766517127, 467554)->(3778732364, -11747683)
[    3.769479] registered taskstats version 1
[    3.770766] Loading compiled-in X.509 certificates
[    3.772406] zswap: loaded using pool lzo/zbud
[    3.775579] Btrfs loaded, crc32c=crc32c-intel
[    3.782023] RIO: rio_register_scan for mport_id=-1
[    3.782311] PM:   Magic number: 8:275:756
[    3.783630] ata_link link7: hash matches
[    3.784980]  link7: hash matches
[    3.786669] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    3.792981] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    3.794662] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    3.796070] cfg80211: failed to load regulatory.db
[    3.796802] ALSA device list:
[    3.799243]   #0: HDA Intel PCH at 0x92f40000 irq 44
[    3.800543]   #1: HDA NVidia at 0xd8080000 irq 45
[    3.808311] Freeing unused kernel image (initmem) memory: 1784K
[    3.841788] Write protecting the kernel read-only data: 36864k
[    3.845594] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    3.848578] Freeing unused kernel image (rodata/data gap) memory: 2012K
[    3.850162] Run /init as init process
[    3.851448]   with arguments:
[    3.851452]     /init
[    3.851455]     dolvm
[    3.851458]   with environment:
[    3.851462]     HOME=/
[    3.851465]     TERM=linux
[    3.888645] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    3.907987] hub 2-1:1.0: USB hub found
[    3.908068] hub 2-1:1.0: 4 ports detected
[    4.028369] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    4.046902] hub 1-1:1.0: USB hub found
[    4.046962] hub 1-1:1.0: 4 ports detected
[    4.171718] usb 1-6: new high-speed USB device number 3 using xhci_hcd
[    4.191408] usb-storage 1-6:1.0: USB Mass Storage device detected
[    4.192327] scsi host8: usb-storage 1-6:1.0
[    4.261898] usb 2-1.2: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
[    4.280744] hub 2-1.2:1.0: USB hub found
[    4.280885] hub 2-1.2:1.0: 3 ports detected
[    4.401742] usb 1-9: new full-speed USB device number 4 using xhci_hcd
[    4.550591] input: Yubico Yubikey NEO OTP+U2F as /devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9:1.0/0003:1050:0114.0001/input/input19
[    4.610691] hid-generic 0003:1050:0114.0001: input,hidraw0: USB HID v1.10 Keyboard [Yubico Yubikey NEO OTP+U2F] on usb-0000:00:14.0-9/input0
[    4.613249] hid-generic 0003:1050:0114.0002: hiddev0,hidraw1: USB HID v1.10 Device [Yubico Yubikey NEO OTP+U2F] on usb-0000:00:14.0-9/input1
[    4.624989] usb 1-1.1: new full-speed USB device number 5 using xhci_hcd
[    4.734323] input: TrulyErgonomic.com Truly Ergonomic Computer Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:0E6A:030C.0003/input/input20
[    4.789539] hid-generic 0003:0E6A:030C.0003: input,hidraw2: USB HID v1.11 Keyboard [TrulyErgonomic.com Truly Ergonomic Computer Keyboard] on usb-0000:00:14.0-1.1/input0
[    4.791701] random: lvm: uninitialized urandom read (4 bytes read)
[    4.792460] input: TrulyErgonomic.com Truly Ergonomic Computer Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0E6A:030C.0004/input/input21
[    4.795925] usb 2-1.4: new SuperSpeed Gen 1 USB device number 4 using xhci_hcd
[    4.848933] hid-generic 0003:0E6A:030C.0004: input,hidraw3: USB HID v1.11 Device [TrulyErgonomic.com Truly Ergonomic Computer Keyboard] on usb-0000:00:14.0-1.1/input1
[    4.921286] usb-storage 2-1.4:1.0: USB Mass Storage device detected
[    4.922287] scsi host9: usb-storage 2-1.4:1.0
[    4.937586] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null)
[    4.945111] usb 1-10: new full-speed USB device number 6 using xhci_hcd
[    5.139355] input: REIYIN Bluetooth Audio WT04 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.3/0003:0A12:E243.0005/input/input22
[    5.165058] usb 1-1.2: new high-speed USB device number 7 using xhci_hcd
[    5.183895] hub 1-1.2:1.0: USB hub found
[    5.183951] hub 1-1.2:1.0: 3 ports detected
[    5.195639] input: REIYIN Bluetooth Audio WT04 as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.3/0003:0A12:E243.0005/input/input23
[    5.196282] hid-generic 0003:0A12:E243.0005: input,hiddev1,hidraw4: USB HID v1.11 Device [REIYIN Bluetooth Audio WT04] on usb-0000:00:14.0-10/input3
[    5.218341] scsi 8:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-T20L  NC08 PQ: 0 ANSI: 0
[    5.220067] scsi 8:0:0:0: Attached scsi generic sg4 type 5
[    5.475117] usb 1-1.2.2: new full-speed USB device number 8 using xhci_hcd
[    5.586422] logitech-djreceiver 0003:046D:C52B.0008: hiddev2,hidraw5: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-1.2.2/input2
[    5.719146] input: Logitech Performance MX as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:101A.0009/input/input24
[    5.720132] logitech-hidpp-device 0003:046D:101A.0009: input,hidraw6: USB HID v1.11 Mouse [Logitech Performance MX] on usb-0000:00:14.0-1.2.2/input2:1
[    5.727256] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:4069.000A/input/input25
[    5.729122] logitech-hidpp-device 0003:046D:4069.000A: input,hidraw7: USB HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:00:14.0-1.2.2/input2:2
[    5.737206] input: Logitech MX Vertical as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:407B.000B/input/input26
[    5.738769] logitech-hidpp-device 0003:046D:407B.000B: input,hidraw8: USB HID v1.11 Keyboard [Logitech MX Vertical] on usb-0000:00:14.0-1.2.2/input2:3
[    5.781631] usb 1-1.2.3: new full-speed USB device number 9 using xhci_hcd
[    5.804908] random: lvm: uninitialized urandom read (4 bytes read)
[    5.820888] random: lvm: uninitialized urandom read (4 bytes read)
[    5.891134] hid-generic 0003:04D8:0B22.000C: hiddev3,hidraw9: USB HID v1.11 Device [Microchip Technology Inc. USB TO HID    Ver.2.00] on usb-0000:00:14.0-1.2.3/input0
[    5.942328] scsi 9:0:0:0: Direct-Access     Generic- SD/MMC/MS/MSPRO  1.00 PQ: 0 ANSI: 6
[    5.943935] sd 9:0:0:0: Attached scsi generic sg5 type 0
[    5.957066] sd 9:0:0:0: [sdd] Attached SCSI removable disk
[    7.642711] udevd[1814]: starting version 3.2.9
[    7.649057] random: udevd: uninitialized urandom read (16 bytes read)
[    7.649546] random: udevd: uninitialized urandom read (16 bytes read)
[    7.649582] random: udevd: uninitialized urandom read (16 bytes read)
[    7.666239] udevd[1814]: starting eudev-3.2.9
[    7.924847] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
[   10.286050] EXT4-fs (dm-0): re-mounted. Opts: (null)
[   10.645149] Adding 67108860k swap on /dev/mapper/box-swap.  Priority:-2 extents:1 across:67108860k SSFS
[   10.778512] FAT-fs (sda1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[   10.799477] EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
[   10.859994] random: crng init done
[   10.859999] random: 4 urandom warning(s) missed due to ratelimiting
[   18.671587] e1000e 0000:00:1f.6 enp0s31f6: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
[   18.672022] IPv6: ADDRCONF(NETDEV_CHANGE): enp0s31f6: link becomes ready
[   20.681505] CIFS: Attempting to mount //node/video
[   20.729916] CIFS: Attempting to mount //node/music
[   28.625316] [drm:drm_stub_open] 
[   28.625393] [drm:drm_open] pid = 3393, minor = 0
[   28.625787] [drm:drm_legacy_setup] 
[   28.625808] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
[   28.625827] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
[   28.625839] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
[   28.625878] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.625886] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.625899] [drm:drm_release] open_count = 1
[   28.625905] [drm:drm_file_free.part.0] pid = 3393, device = 0xe200, open_count = 1
[   28.626098] [drm:drm_lastclose] 
[   28.626110] [drm:drm_lastclose] driver lastclose completed
[   28.694865] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   28.694886] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   28.694901] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   28.694972] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   28.694980] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   28.694989] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   28.695002] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   28.695011] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   28.695021] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   28.695028] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   28.695040] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   28.695048] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   28.695060] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   28.695069] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   28.695089] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   28.695096] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   28.695103] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   28.695112] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   28.695128] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   28.695137] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   28.695148] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   28.695157] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   28.695183] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   28.695189] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   28.695225] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   28.695239] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   28.695250] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   28.695258] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   28.695265] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   28.695272] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   28.695291] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   28.695298] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   28.695306] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   28.695313] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   28.695520] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   28.695531] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   28.695538] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   28.695545] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   28.695576] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   28.695618] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[   28.695722] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   28.695730] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   28.695736] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   28.695743] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   28.695750] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   28.695758] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   28.695768] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   28.695778] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   28.696899] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   28.696938] [drm:vblank_disable_fn] disabling vblank on crtc 1
[   28.699481] [drm:drm_stub_open] 
[   28.699495] [drm:drm_open] pid = 3393, minor = 0
[   28.699653] [drm:drm_legacy_setup] 
[   28.699671] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.699745] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.699783] [drm:drm_release] open_count = 1
[   28.699789] [drm:drm_file_free.part.0] pid = 3393, device = 0xe200, open_count = 1
[   28.699856] [drm:drm_lastclose] 
[   28.699862] [drm:drm_lastclose] driver lastclose completed
[   28.700205] [drm:drm_stub_open] 
[   28.700213] [drm:drm_open] pid = 3393, minor = 0
[   28.700327] [drm:drm_legacy_setup] 
[   28.700339] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.700357] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.700409] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   28.700420] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.700436] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   28.700479] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   28.701109] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB
[   28.701126] [drm:drm_mode_addfb2] [FB:105]
[   28.701138] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_RMFB
[   28.701146] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (2)
[   28.701151] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (1)
[   28.701164] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
[   28.701570] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   28.701630] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   28.721334] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.721349] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.726148] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.977782] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.977797] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.981040] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.983031] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.983044] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   28.983184] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.983194] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.984523] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_CHANNEL_ALLOC
[   28.985949] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   28.986072] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.986983] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.987750] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.988518] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.989930] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.990745] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.991012] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   28.998900] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.999002] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.999064] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   28.999071] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.999112] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   28.999160] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   29.001137] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.037802] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   29.047872] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.047887] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.047898] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.047915] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   29.047938] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
[   29.047971] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.048021] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[   29.049492] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[   29.049511] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.049520] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.049582] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.049593] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049602] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049616] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049646] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049679] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049687] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049697] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049704] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049712] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049719] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049727] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049735] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049746] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049753] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049761] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049769] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049778] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049785] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049794] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049801] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049809] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049820] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049834] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049843] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049858] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049867] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049879] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049887] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049896] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049904] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049917] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049926] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049937] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049945] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.049959] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.050027] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.050035] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.050043] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.050051] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.050066] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.050073] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[   29.101596] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[   29.101601] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.101604] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.101611] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.101614] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101617] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101620] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101623] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101628] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101631] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101635] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101638] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101641] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101644] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101647] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101650] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101654] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101674] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101677] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101680] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101684] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101687] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101690] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101693] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101697] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101700] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101705] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101708] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101714] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101717] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101721] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101724] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101728] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101731] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101736] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101739] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101743] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101746] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101750] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.101756] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.101776] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101779] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101782] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101785] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.101791] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.101793] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[   29.154928] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[   29.154931] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.154934] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.154958] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.154961] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154964] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154967] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154970] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154976] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154979] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154983] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154986] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154990] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154993] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154996] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.154999] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155004] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155007] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155010] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155013] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155016] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155019] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155023] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155026] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155029] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155032] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155037] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155040] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155046] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155049] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155054] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155057] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155060] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155063] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155068] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155071] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155075] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155078] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155082] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.155087] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.155106] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155109] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155112] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155116] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.155121] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.155123] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[   29.156366] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[   29.156368] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.156371] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.156378] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.156381] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156383] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156386] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156389] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156394] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156397] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156400] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156403] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156406] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156409] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156412] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156415] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156419] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156421] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156424] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156427] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156430] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156433] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156436] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156439] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156442] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156447] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156452] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156454] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156460] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156462] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156467] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156469] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156472] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156475] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156479] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156482] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156486] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156489] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156492] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.156507] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156510] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156513] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156516] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.156520] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.156523] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[   29.156741] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[   29.156743] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[   29.156744] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[   29.156921] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[   29.157099] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[   29.157430] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[   29.157433] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.157435] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.157442] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.157445] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157448] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157451] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157453] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157458] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157461] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157465] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157467] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157470] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157473] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157476] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157479] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157483] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157486] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157489] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157491] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157494] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157497] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157500] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157503] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157506] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157509] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157514] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157516] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157521] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157524] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157528] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157531] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157534] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157537] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157541] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157544] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157548] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157551] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157554] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157559] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157573] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157575] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157578] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157581] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157586] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.157589] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4]
[   29.157595] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[   29.157600] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[   29.157603] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[   29.157609] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157610] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[   29.157613] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.157615] [drm:drm_add_display_info] non_desktop set to 0
[   29.157617] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157619] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.157621] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157623] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[   29.157625] [drm:drm_update_tile_info] tile cap 0x82
[   29.157627] [drm:drm_update_tile_info] tile_size 1920 x 2160
[   29.157629] [drm:drm_update_tile_info] topo num tiles 2x1, location 1x0
[   29.157630] [drm:drm_update_tile_info] vend DEL
[   29.157637] [drm:drm_mode_object_put.part.0] OBJ ID: 109 (1)
[   29.157642] [drm:drm_mode_object_put.part.0] OBJ ID: 102 (1)
[   29.157645] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157647] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   29.157649] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.157651] [drm:drm_add_display_info] non_desktop set to 0
[   29.157653] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157655] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.157664] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157666] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157668] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157670] nouveau 0000:65:00.0: DRM: native mode from preferred
[   29.157680] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4] probed modes :
[   29.157685] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[   29.157687] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.157690] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.157707] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.157710] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157713] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157716] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157719] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157724] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157726] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157730] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157733] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157736] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157739] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157742] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157744] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157748] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157751] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157754] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157757] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157760] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157763] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157766] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157769] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157772] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157774] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157779] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157782] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157787] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157790] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157794] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157797] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157800] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.157802] [drm:drm_mode_object_put.part.0] OBJ ID: 99 (2)
[   29.157805] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.157807] [drm:drm_mode_object_put.part.0] OBJ ID: 99 (2)
[   29.157809] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157812] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157815] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157817] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157822] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157825] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157829] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157831] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157838] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157843] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157847] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157852] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.157869] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157872] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157875] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157878] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.157882] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.157885] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5]
[   29.157889] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[   29.157892] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[   29.157894] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[   29.157896] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157898] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[   29.157900] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.157902] [drm:drm_add_display_info] non_desktop set to 0
[   29.157904] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157906] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.157907] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157909] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[   29.157911] [drm:drm_update_tile_info] tile cap 0x82
[   29.157913] [drm:drm_update_tile_info] tile_size 1920 x 2160
[   29.157915] [drm:drm_update_tile_info] topo num tiles 2x1, location 0x0
[   29.157917] [drm:drm_update_tile_info] vend DEL
[   29.157920] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (1)
[   29.157923] [drm:drm_mode_object_put.part.0] OBJ ID: 104 (1)
[   29.157926] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157928] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   29.157930] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.157932] [drm:drm_add_display_info] non_desktop set to 0
[   29.157933] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157935] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.157947] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157949] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157951] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.157953] nouveau 0000:65:00.0: DRM: native mode from preferred
[   29.158011] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5] probed modes :
[   29.158013] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[   29.158015] [drm:drm_mode_debug_printmodeline] Modeline "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209 1245 0x40 0x6
[   29.158016] [drm:drm_mode_debug_printmodeline] Modeline "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0xa
[   29.158018] [drm:drm_mode_debug_printmodeline] Modeline "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204 1250 0x40 0x5
[   29.158020] [drm:drm_mode_debug_printmodeline] Modeline "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059 1089 0x40 0x6
[   29.158022] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
[   29.158023] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
[   29.158025] [drm:drm_mode_debug_printmodeline] Modeline "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 0x40 0x6
[   29.158027] [drm:drm_mode_debug_printmodeline] Modeline "1152x864": 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[   29.158029] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[   29.158031] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[   29.158032] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[   29.158034] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[   29.158036] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[   29.158038] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   29.158039] [drm:drm_mode_debug_printmodeline] Modeline "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[   29.158042] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.158045] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.158057] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.158060] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158063] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158066] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158069] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158073] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158076] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158080] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158083] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158086] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158089] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158091] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158094] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158098] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158101] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158104] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158107] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158110] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158113] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158116] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158118] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158121] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158124] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158129] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158132] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158136] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158139] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158143] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158146] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158149] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.158151] [drm:drm_mode_object_put.part.0] OBJ ID: 101 (2)
[   29.158153] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.158155] [drm:drm_mode_object_put.part.0] OBJ ID: 101 (2)
[   29.158157] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158160] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158163] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158166] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158170] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158173] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158177] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158179] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158183] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.158188] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.158192] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.158197] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
[   29.158211] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158214] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158217] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158220] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.158233] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
[   29.158237] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   29.158279] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
[   29.158283] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   29.158326] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
[   29.158331] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   29.158343] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
[   29.158347] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   29.158362] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.158364] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1]
[   29.159628] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:85:DVI-D-1] disconnected
[   29.159631] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.159635] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.159643] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.159670] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.159672] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1]
[   29.211595] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:87:DP-1] disconnected
[   29.211598] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.211601] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.211624] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.211642] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.211645] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2]
[   29.264927] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:90:DP-2] disconnected
[   29.264930] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.264933] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.264956] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.264972] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.264975] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1]
[   29.266220] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:93:HDMI-A-1] disconnected
[   29.266223] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.266225] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.266232] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.266244] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.266246] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3]
[   29.266463] nouveau 0000:65:00.0: DRM: display: 4x540000 dpcd 0x12
[   29.266465] nouveau 0000:65:00.0: DRM: encoder: 4x810000
[   29.266466] nouveau 0000:65:00.0: DRM: maximum: 4x540000
[   29.266643] nouveau 0000:65:00.0: DRM: Sink OUI: 0080e1
[   29.266819] nouveau 0000:65:00.0: DRM: Branch OUI: 0080e1
[   29.267142] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:95:DP-3] disconnected
[   29.267144] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.267147] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.267153] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.267165] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.267167] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4]
[   29.267170] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[   29.267172] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[   29.267174] [drm:drm_dp_mst_topology_try_get_port] port 00000000554b0bb4 (2)
[   29.267177] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267179] [drm:drm_dp_mst_topology_put_port] port 00000000554b0bb4 (1)
[   29.267181] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.267183] [drm:drm_add_display_info] non_desktop set to 0
[   29.267185] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267187] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.267189] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267190] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[   29.267192] [drm:drm_update_tile_info] tile cap 0x82
[   29.267194] [drm:drm_update_tile_info] tile_size 1920 x 2160
[   29.267196] [drm:drm_update_tile_info] topo num tiles 2x1, location 1x0
[   29.267198] [drm:drm_update_tile_info] vend DEL
[   29.267201] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (1)
[   29.267205] [drm:drm_mode_object_put.part.0] OBJ ID: 109 (1)
[   29.267207] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267209] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   29.267211] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.267213] [drm:drm_add_display_info] non_desktop set to 0
[   29.267215] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267217] [drm:drm_add_display_info] DP-4: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.267223] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267224] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267226] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.267228] nouveau 0000:65:00.0: DRM: native mode from preferred
[   29.267235] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:98:DP-4] probed modes :
[   29.267237] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[   29.267239] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.267242] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.267250] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.267253] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267256] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267259] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.267261] [drm:drm_mode_object_put.part.0] OBJ ID: 104 (2)
[   29.267263] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.267265] [drm:drm_mode_object_put.part.0] OBJ ID: 104 (2)
[   29.267666] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267668] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267671] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267674] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267679] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267682] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267686] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267689] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267692] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267694] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267697] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.267699] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (2)
[   29.267702] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.267704] [drm:drm_mode_object_put.part.0] OBJ ID: 105 (2)
[   29.267711] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267714] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267717] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267720] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267724] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267727] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267731] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267734] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267737] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267740] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267742] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267745] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267752] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267754] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267757] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267760] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267763] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267766] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267769] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267772] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267775] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.267778] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.268836] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.268839] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5]
[   29.268843] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[   29.268847] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[   29.268849] [drm:drm_dp_mst_topology_try_get_port] port 00000000a7dd8125 (2)
[   29.268852] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268853] [drm:drm_dp_mst_topology_put_port] port 00000000a7dd8125 (1)
[   29.268856] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.268858] [drm:drm_add_display_info] non_desktop set to 0
[   29.268860] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268861] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.268863] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268865] [drm:drm_update_tile_info] block id 0x12, rev 0, len 22
[   29.268867] [drm:drm_update_tile_info] tile cap 0x82
[   29.268868] [drm:drm_update_tile_info] tile_size 1920 x 2160
[   29.268870] [drm:drm_update_tile_info] topo num tiles 2x1, location 0x0
[   29.268871] [drm:drm_update_tile_info] vend DEL
[   29.268875] [drm:drm_mode_object_put.part.0] OBJ ID: 102 (1)
[   29.268878] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (1)
[   29.268881] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268882] [drm:drm_add_edid_modes] ELD: no CEA Extension found
[   29.268885] [drm:drm_add_display_info] Supported Monitor Refresh rate range is 0 Hz - 0 Hz
[   29.268887] [drm:drm_add_display_info] non_desktop set to 0
[   29.268889] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268892] [drm:drm_add_display_info] DP-5: Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   29.268907] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268909] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268912] [drm:drm_find_displayid_extension] base revision 0x12, length 121, 0 0
[   29.268915] nouveau 0000:65:00.0: DRM: native mode from preferred
[   29.268980] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:100:DP-5] probed modes :
[   29.268988] [drm:drm_mode_debug_printmodeline] Modeline "1920x2160": 60 277250 1920 1968 2000 2080 2160 2163 2173 2222 0x48 0x9
[   29.268989] [drm:drm_mode_debug_printmodeline] Modeline "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209 1245 0x40 0x6
[   29.268991] [drm:drm_mode_debug_printmodeline] Modeline "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0xa
[   29.268992] [drm:drm_mode_debug_printmodeline] Modeline "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204 1250 0x40 0x5
[   29.268994] [drm:drm_mode_debug_printmodeline] Modeline "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059 1089 0x40 0x6
[   29.268996] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
[   29.268997] [drm:drm_mode_debug_printmodeline] Modeline "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
[   29.268999] [drm:drm_mode_debug_printmodeline] Modeline "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 0x40 0x6
[   29.269000] [drm:drm_mode_debug_printmodeline] Modeline "1152x864": 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[   29.269002] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[   29.269004] [drm:drm_mode_debug_printmodeline] Modeline "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[   29.269005] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[   29.269007] [drm:drm_mode_debug_printmodeline] Modeline "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[   29.269008] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[   29.269011] [drm:drm_mode_debug_printmodeline] Modeline "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[   29.269015] [drm:drm_mode_debug_printmodeline] Modeline "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[   29.269018] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.269024] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
[   29.269038] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.269042] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269046] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269051] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.269053] [drm:drm_mode_object_put.part.0] OBJ ID: 109 (2)
[   29.269056] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.269059] [drm:drm_mode_object_put.part.0] OBJ ID: 109 (2)
[   29.269651] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269654] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269657] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269660] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269665] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269668] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269672] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269674] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269678] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269680] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269683] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.269685] [drm:drm_mode_object_put.part.0] OBJ ID: 102 (2)
[   29.269687] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
[   29.269689] [drm:drm_mode_object_put.part.0] OBJ ID: 102 (2)
[   29.269695] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269697] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269700] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269703] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269709] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269712] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269717] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269721] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269725] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269729] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269732] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269736] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269741] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269746] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269749] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269752] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269755] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269758] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269761] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269764] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269768] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.269772] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.273682] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_SET_MASTER
[   29.273721] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   29.273815] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   29.273873] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   29.273928] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   29.274001] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CREATE_DUMB
[   29.275846] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   29.331102] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331118] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331130] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331141] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331159] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331169] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331183] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331193] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331205] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331215] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331225] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331235] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331251] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331261] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331272] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331282] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331293] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331303] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331314] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331324] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331335] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331346] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331362] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331373] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331391] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331401] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331432] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331460] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331498] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331508] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331521] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331533] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331539] [drm:drm_ioctl] pid=3393, ret = -22
[   29.331554] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331567] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331642] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331651] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331664] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331677] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331694] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331702] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331713] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331725] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331744] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331752] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331763] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331775] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331791] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331799] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331809] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331822] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331850] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331854] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331859] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331864] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331870] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331873] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331878] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331883] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331889] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331892] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331897] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.331902] [drm:drm_mode_object_get] OBJ ID: 85 (2)
[   29.331908] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (3)
[   29.331911] [drm:drm_mode_object_put.part.0] OBJ ID: 85 (2)
[   29.331916] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331920] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331924] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331928] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331934] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331938] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331944] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331948] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331952] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331956] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331960] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331964] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331970] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331974] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331978] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331982] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331986] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331990] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331995] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.331999] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332003] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332007] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332014] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332018] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332025] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332029] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332037] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332042] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332048] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332051] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332056] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332061] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332064] [drm:drm_ioctl] pid=3393, ret = -22
[   29.332068] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332073] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332080] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332083] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332087] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332092] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332100] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332103] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332107] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332111] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332117] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332119] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332123] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332127] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332132] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332135] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332138] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332142] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332148] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332151] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332155] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332159] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332164] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332167] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332171] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332175] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332181] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332183] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332187] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332191] [drm:drm_mode_object_get] OBJ ID: 87 (2)
[   29.332197] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (3)
[   29.332199] [drm:drm_mode_object_put.part.0] OBJ ID: 87 (2)
[   29.332203] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332207] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332212] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332217] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332224] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332228] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332236] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332240] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332244] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332247] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332251] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332255] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332262] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332266] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332270] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332274] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332280] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332284] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332291] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332295] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332299] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332303] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332310] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332313] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332320] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332323] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332330] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332334] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332340] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332342] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332346] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332350] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332352] [drm:drm_ioctl] pid=3393, ret = -22
[   29.332355] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332359] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332365] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332368] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332371] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332375] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332381] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332384] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332387] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332391] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332397] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332399] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332403] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332407] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332413] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332416] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332421] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332426] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332433] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332435] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332439] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332446] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332453] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332455] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332461] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332467] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332472] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332475] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332479] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332483] [drm:drm_mode_object_get] OBJ ID: 90 (2)
[   29.332489] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (3)
[   29.332491] [drm:drm_mode_object_put.part.0] OBJ ID: 90 (2)
[   29.332495] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332499] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332502] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332506] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332512] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332516] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332520] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332524] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332528] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332531] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332535] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332538] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332544] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332547] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332551] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332554] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332558] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332562] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332566] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332569] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332573] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332577] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332583] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332587] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332594] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332598] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332604] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332611] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332617] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332620] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332624] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332628] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332630] [drm:drm_ioctl] pid=3393, ret = -22
[   29.332634] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332638] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332644] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332646] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332650] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332654] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332659] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332662] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332665] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332670] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332675] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332678] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332681] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332685] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332691] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332693] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332697] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332701] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332706] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332709] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332713] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332717] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332723] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332725] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332729] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332733] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332740] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332744] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332748] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332752] [drm:drm_mode_object_get] OBJ ID: 93 (2)
[   29.332758] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (3)
[   29.332761] [drm:drm_mode_object_put.part.0] OBJ ID: 93 (2)
[   29.332766] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332772] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332777] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332782] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332789] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332793] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332798] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332803] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332824] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332828] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332832] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332835] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332840] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332844] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332848] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332851] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332855] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332859] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332863] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332866] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332870] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332873] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332879] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332883] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332889] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332893] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.332899] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332903] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.332909] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.332911] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.332915] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332919] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.332921] [drm:drm_ioctl] pid=3393, ret = -22
[   29.332924] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332929] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.332936] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.332938] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.332942] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.332947] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.332954] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333062] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333066] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333070] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333076] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333079] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333083] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333087] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333093] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333097] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333101] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333105] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333111] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333113] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333118] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333122] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333127] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333130] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333134] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333138] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333144] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333147] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333151] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333155] [drm:drm_mode_object_get] OBJ ID: 95 (2)
[   29.333161] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (3)
[   29.333164] [drm:drm_mode_object_put.part.0] OBJ ID: 95 (2)
[   29.333168] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333172] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333175] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333179] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333185] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333189] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333193] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333197] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333201] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333204] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333208] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333211] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333217] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333221] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333227] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333231] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333237] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333241] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333246] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333249] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333253] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333257] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333264] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333268] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333275] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333280] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333286] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333290] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333293] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333297] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.333301] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333306] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333308] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333312] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333330] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333334] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333345] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   29.333385] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333387] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333389] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333392] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333396] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333400] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333413] [drm:drm_ioctl] pid=3393, ret = -22
[   29.333417] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333422] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333424] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333429] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333436] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333438] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333450] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333452] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333454] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333457] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333462] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333466] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333467] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333470] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333477] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333478] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333490] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333492] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333493] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333496] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333498] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333502] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333503] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333505] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333512] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333514] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333524] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333526] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333528] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333530] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333533] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333536] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333537] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333539] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333546] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333548] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333558] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333560] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333561] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333564] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333566] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333570] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333571] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333573] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333580] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333581] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333592] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333594] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333596] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333598] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333602] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333606] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333609] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333611] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333614] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333616] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333619] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333621] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333629] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333632] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333643] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333644] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333646] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333648] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333651] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333655] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333656] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333658] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333664] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333666] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333676] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.333678] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.333679] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.333682] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.333685] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.333688] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   29.333689] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.333691] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.333698] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.333699] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.333708] 04a0 1 head917d_dither
[   29.333712] 	00000003
[   29.333724] 0084 1 core507d_update
[   29.333725] 	80000000
[   29.333726] 0080 2 core507d_update
[   29.333727] 	00000000
[   29.333728] 	00000000
[   29.346951] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.346953] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.346955] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.346957] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.346977] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.346982] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.346986] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.346990] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.346996] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.346999] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347003] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347007] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347011] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347015] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347018] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347024] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   29.347025] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347030] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347032] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347036] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347038] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347042] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347044] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347048] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347050] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347053] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347056] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347061] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347064] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347069] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347072] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347078] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347082] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347085] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347087] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[   29.347092] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347096] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347099] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347103] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347112] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347114] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347117] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[   29.347135] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347137] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347139] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347141] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347144] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347148] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347149] [drm:drm_ioctl] pid=3393, ret = -22
[   29.347152] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347156] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347157] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347159] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347167] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347169] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347179] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347182] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347183] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347186] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347189] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347192] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347193] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347195] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347202] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347204] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347214] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347216] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347218] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347220] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347223] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347226] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347227] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347229] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347236] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347238] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347248] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347250] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347252] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347254] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347257] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347260] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347262] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347276] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347283] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347285] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347296] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347299] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347308] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347310] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347314] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347317] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347318] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347320] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347327] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347329] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347340] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347342] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347344] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347346] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347349] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347353] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347354] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347356] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347363] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347365] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347376] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347377] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347379] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347382] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347386] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347390] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347392] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347394] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347401] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347403] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347414] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.347416] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.347419] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.347421] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.347425] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.347429] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   29.347431] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.347433] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.347440] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.347443] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.347445] 07a0 1 head917d_dither
[   29.347450] 	00000003
[   29.347457] 0084 1 core507d_update
[   29.347458] 	80000000
[   29.347461] 0080 2 core507d_update
[   29.347463] 	00000000
[   29.347464] 	00000000
[   29.363621] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.363623] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.363625] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.363627] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.363701] [drm:vblank_disable_fn] disabling vblank on crtc 1
[   29.364078] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.366220] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   29.366223] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[   29.367034] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GETPARAM
[   29.367342] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[   29.368221] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_LIST_LESSEES
[   29.368225] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_LIST_LESSEES
[   29.369212] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   29.369224] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   29.369231] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   29.369237] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
[   29.369243] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   29.369246] [drm:drm_ioctl] pid=3393, ret = -2
[   29.369646] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   29.369722] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   29.369768] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   29.370778] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   29.984388] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.984406] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.984425] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   29.984433] [drm:drm_mode_object_get] OBJ ID: 98 (6)
[   29.984456] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.984461] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.984468] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   29.984501] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   29.984505] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   29.984508] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.984513] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   29.984518] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   29.984525] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   29.984531] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   29.984534] [drm:drm_mode_object_get] OBJ ID: 100 (6)
[   29.984548] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.984551] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   29.984554] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[   29.984577] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   29.984580] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   29.984582] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   29.984586] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   29.985728] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   29.985823] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   29.985828] [drm:drm_ioctl] pid=3393, ret = -2
[   29.985838] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETGAMMA
[   29.985917] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   29.985920] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   29.985923] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   29.985952] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   29.985956] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   29.985975] 0448 2 head907d_olut_set
[   29.985978] 	87000000
[   29.985980] 	000005d0
[   29.985982] 045c 1 head907d_olut_set
[   29.985983] 	f0000001
[   29.986001] 0084 1 core507d_update
[   29.986003] 	80000000
[   29.986005] 0080 2 core507d_update
[   29.986007] 	00000000
[   29.986008] 	00000000
[   29.997092] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   29.997096] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   29.997116] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   29.997134] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB2
[   29.997140] [drm:nouveau_framebuffer_new] Unsupported modifier: 0x300000000000014
[   29.997143] [drm:drm_internal_framebuffer_create] could not create framebuffer
[   29.997145] [drm:drm_ioctl] pid=3393, ret = -22
[   29.997171] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   29.997410] [drm:vblank_disable_fn] disabling vblank on crtc 1
[   29.997503] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.263927] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.264023] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   30.264033] [drm:drm_ioctl] pid=3393, ret = -2
[   30.264284] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.264358] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   30.264366] [drm:drm_ioctl] pid=3393, ret = -2
[   30.293392] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.296842] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.586001] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.586566] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.586677] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.586798] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.586885] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.586953] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.587123] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.587161] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.587683] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   30.587739] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR2
[   30.587792] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   30.587800] [drm:drm_mode_object_get] OBJ ID: 110 (1)
[   30.587812] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   30.587819] [drm:drm_mode_object_put.part.0] OBJ ID: 110 (2)
[   30.587827] [drm:drm_mode_object_put.part.0] OBJ ID: 110 (1)
[   30.587848] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   30.587855] [drm:drm_mode_object_get] OBJ ID: 110 (1)
[   30.587863] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   30.587899] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   30.587909] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   30.587919] 0780 2 head907d_curs_set
[   30.587926] 	85000000
[   30.587931] 	00094000
[   30.587936] 078c 1 head907d_curs_set
[   30.587941] 	f0000001
[   30.587959] 0080 2 core507d_update
[   30.587964] 	00000000
[   30.587969] 	00000000
[   30.587988] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   30.587995] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   30.588005] [drm:drm_mode_object_put.part.0] OBJ ID: 110 (2)
[   30.588022] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   30.610537] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.610642] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.611564] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.611801] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.616054] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.616151] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   30.616161] [drm:drm_ioctl] pid=3393, ret = -2
[   30.634145] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.634250] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.635117] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.635226] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.700024] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.700143] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.700239] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704066] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.704222] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.704325] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704404] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.704478] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704533] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.704603] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704652] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.704735] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704784] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.704852] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.704901] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705029] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705083] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705152] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705202] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705331] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705381] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705469] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705521] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705607] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705657] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705725] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705795] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705875] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.705908] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.705973] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706049] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706120] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706145] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706209] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706231] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706306] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706330] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706392] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706414] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706476] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706531] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706596] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706620] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.706695] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.706734] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.706899] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.707174] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.707280] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_NEW
[   30.707408] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_CPU_PREP
[   30.718566] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.718694] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.718763] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.718826] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.718885] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.718944] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719002] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719061] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719119] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719176] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719233] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719291] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719350] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719409] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719466] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719525] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719583] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719641] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719699] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719757] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.719817] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.719870] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.720338] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   30.720511] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   30.720573] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DIRTYFB
[   30.720579] [drm:drm_ioctl] pid=3393, ret = -2
[   32.268230] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   32.268704] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_CURSOR
[   32.268732] [drm:drm_mode_object_get] OBJ ID: 110 (1)
[   32.268743] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.268750] [drm:drm_mode_object_put.part.0] OBJ ID: 110 (2)
[   32.268765] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.268802] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.268813] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.268824] 0780 1 head907d_curs_clr
[   32.268831] 	05000000
[   32.268837] 078c 1 head907d_curs_clr
[   32.268842] 	00000000
[   32.268859] 0080 2 core507d_update
[   32.268864] 	00000000
[   32.268869] 	00000000
[   32.268894] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.268902] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.268908] [drm:drm_mode_object_put.part.0] OBJ ID: 110 (1)
[   32.672317] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   32.672343] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.672351] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.672372] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   32.672379] [drm:drm_mode_object_get] OBJ ID: 98 (6)
[   32.672423] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.672433] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   32.672444] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   32.672489] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (6)
[   32.672498] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.672504] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.672510] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.672521] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   32.672534] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
[   32.672547] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.672564] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   32.672571] [drm:drm_mode_object_get] OBJ ID: 100 (6)
[   32.672602] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.672610] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.672617] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[   32.672652] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (6)
[   32.672660] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.672666] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.672675] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   32.675415] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, NOUVEAU_GEM_PUSHBUF
[   32.675559] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   32.675979] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
[   32.676113] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
[   32.676199] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
[   32.676260] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
[   32.676328] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_DROP_MASTER
[   32.676382] [drm:drm_ioctl] pid=3393, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[   32.677062] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677080] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677086] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677099] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.677106] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.677116] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677122] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677129] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.677136] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.677144] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677156] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677164] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677169] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677178] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677184] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677190] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677201] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677209] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677214] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677225] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.677233] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.677250] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677256] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677262] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.677269] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.677277] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677291] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677299] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677305] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677315] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.677323] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.677346] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.677352] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.677384] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.677397] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   32.677407] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.677414] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.677421] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.677426] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.677444] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.677450] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   32.677458] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.677464] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.677649] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.677658] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   32.677664] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.677670] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.677778] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.677786] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   32.677791] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.677798] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   32.677805] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677810] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677817] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.677825] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.677835] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677868] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677875] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677881] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677892] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.677900] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.677910] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677916] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677923] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.677929] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.677937] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677949] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.677956] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.677962] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.677971] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.677976] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.677983] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.677993] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678001] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678006] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678017] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.678024] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.678040] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.678046] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.678052] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.678059] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.678067] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.678081] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678089] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678094] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678105] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.678112] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.678133] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.678138] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.678157] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.678163] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   32.678171] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.678178] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.678184] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.678190] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.678208] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.678214] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   32.678221] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.678227] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.678436] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.678443] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   32.678449] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.678455] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.678522] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.678529] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   32.678535] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.678542] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   32.678548] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.678554] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.678561] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.678570] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.678578] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.678622] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678630] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678636] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678647] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.678654] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.678666] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.678672] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.678678] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.678685] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.678693] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.678706] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678713] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678719] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678728] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.678733] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.678741] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.678751] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678760] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678766] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678777] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.678784] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.678801] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.678807] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.678813] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.678821] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.678828] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.678843] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.678851] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.678856] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.678868] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.678875] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.678896] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.678901] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.678919] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.678925] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   32.678934] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.678940] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.678947] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.678952] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.678970] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.678976] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   32.678985] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.678991] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.679128] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.679135] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   32.679141] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.679147] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.679212] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.679219] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   32.679225] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.679232] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   32.679239] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.679245] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.679252] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.679260] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.679268] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.681038] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   32.681079] [drm:vblank_disable_fn] disabling vblank on crtc 1
[   32.681692] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.681701] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.681707] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.681717] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.681724] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.681738] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.681743] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.681750] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.681756] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.681764] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.681778] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.681785] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.681790] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.681798] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.681803] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.681809] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.681820] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.681826] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.681832] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.681842] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.681849] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.681863] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.681869] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.681875] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.681881] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.681888] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.681902] [drm:drm_mode_object_get] OBJ ID: 106 (3)
[   32.681909] [drm:drm_mode_object_get] OBJ ID: 107 (1)
[   32.681914] [drm:drm_mode_object_get] OBJ ID: 103 (1)
[   32.681925] [drm:drm_mode_object_get] OBJ ID: 106 (4)
[   32.681932] [drm:drm_mode_object_get] OBJ ID: 108 (1)
[   32.681951] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.681957] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.681975] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.681982] [drm:drm_mode_object_get] OBJ ID: 98 (5)
[   32.681990] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.681996] [drm:drm_mode_object_get] OBJ ID: 98 (4)
[   32.682002] [drm:drm_mode_object_get] OBJ ID: 106 (5)
[   32.682008] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (6)
[   32.682025] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.682030] [drm:drm_mode_object_get] OBJ ID: 100 (5)
[   32.682037] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.682043] [drm:drm_mode_object_get] OBJ ID: 100 (4)
[   32.682182] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.682189] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 50: clock 277250 kHz framedur 16670009 linedur 7502
[   32.682194] [drm:drm_calc_timestamping_constants] crtc 61: hwmode: htotal 2080, vtotal 2222, vdisplay 2160
[   32.682200] [drm:drm_atomic_helper_update_legacy_modeset_state] crtc 61: clock 277250 kHz framedur 16670009 linedur 7502
[   32.682209] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   32.682227] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[   32.682299] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (5)
[   32.682305] [drm:drm_mode_object_put.part.0] OBJ ID: 98 (4)
[   32.682310] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (5)
[   32.682316] [drm:drm_mode_object_put.part.0] OBJ ID: 100 (4)
[   32.682322] [drm:drm_mode_object_put.part.0] OBJ ID: 107 (2)
[   32.682327] [drm:drm_mode_object_put.part.0] OBJ ID: 103 (2)
[   32.682334] [drm:drm_mode_object_put.part.0] OBJ ID: 108 (2)
[   32.682341] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (5)
[   32.682349] [drm:drm_mode_object_put.part.0] OBJ ID: 106 (4)
[   32.697704] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   32.697743] [drm:vblank_disable_fn] disabling vblank on crtc 1
[   32.706799] [drm:drm_release] open_count = 1
[   32.706809] [drm:drm_file_free.part.0] pid = 3393, device = 0xe200, open_count = 1
[   32.739251] [drm:drm_lastclose] 
[   32.739261] [drm:drm_lastclose] driver lastclose completed

--m6vgdjlaqypp74er
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--m6vgdjlaqypp74er--
