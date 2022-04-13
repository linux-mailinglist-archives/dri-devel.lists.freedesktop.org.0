Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A94FFD9F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 20:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D23710E1A0;
	Wed, 13 Apr 2022 18:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB44E10E1A0;
 Wed, 13 Apr 2022 18:14:56 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-d6ca46da48so2811977fac.12; 
 Wed, 13 Apr 2022 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fH4yuLLLuzeYj6XEgOCX/QQKNgdHqrP2KwHaxxyRlY=;
 b=BbobB4cck0hEvowPlHb9ebwk0XJa7fl46jhu2yMF59qbERdy4nS7a/XCdtRyJU9wJe
 Wtcp8LUQOD3yu0bs9B+Hc/zj8SRop6DJn79fxcupQ1BhzAdJ388Hj0SFxprkoF6XHhpz
 l35i6Gzd9YwZiBeVmVpLHAeejnCX5ZAYUsy4f1j5Uk4qflZi1n1GPu7EESbdnSpf0zpv
 33KyYGKqu92U9EJDT9MlNLnf/i/AvRoBS/2Dg89eDS7hNt08krlcQhreQw5Mk++oFmNQ
 +tacTqek/ZSdhYcNGj+OxYkwxT7RxbQCWu3rhBVuPQF0MSDWea8sWBWRS4MM9OUqK0eF
 eZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fH4yuLLLuzeYj6XEgOCX/QQKNgdHqrP2KwHaxxyRlY=;
 b=axXfG5DegFpbEadzBg+YmPTjAN6riVh5+6IPk4b1TcTTSe3biF8JuN83IejsRNHhRD
 /u2p+8vqXlyXdDrIWih9kvkCCtURz0gVUOCFNJehsajq9tRDhA1LU1GkPJMye+LVYKpH
 +4sW4AN/Y+ypCm3IZ17GgHgsbQSoKs4TNmCPupDAlC04NXrEH74K+tHIh0Py09GZg0ox
 4ov1dUGsw2EMFgu8fXn+mSLDpENv7/zUvw/EoE03iLYPXOBOogQYnSLlfObcF34karjH
 dB4i+v8N66rw0KOuoJcMG8qfTg0dUCKY6Dnzsi/ZL8d3OeJzIzQEdO+sI6ViRYSF1W76
 Tdag==
X-Gm-Message-State: AOAM5308V0DFuSk3+g8TXm3TUZn5Rnx6DCEbdj+2pH/cZ4Nt20Uzv+LN
 g4NwqpcqfU7+aMhlSrg1yWO7s87KZ7WiiIG3LWLCiBf8
X-Google-Smtp-Source: ABdhPJzIxB9bhsRZX5hibub4dtOTEVYxGmiFFUJ/TCJJaNusQActQM304FcsFrptN4ZYhxFdYYjR5K2ryrEhgHgBVY4=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr25352oap.253.1649873695169; Wed, 13 Apr
 2022 11:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220403132322.51c90903@darkstar.example.org>
 <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
 <20220404213940.09a56d15@darkstar.example.org>
 <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
 <20220409182831.185e5d92@darkstar.example.org>
 <CADnq5_MvGGONvAvhwgokDxRpTbnsGEFROcgsZteJby9Bya81Nw@mail.gmail.com>
 <20220413193337.16ecc808@darkstar.example.org>
In-Reply-To: <20220413193337.16ecc808@darkstar.example.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Apr 2022 14:14:42 -0400
Message-ID: <CADnq5_MVO8B-EH70XJ=L6pp7haHz5ZeF1rGFvPEX5nD1+4n1AQ@mail.gmail.com>
Subject: Re: AMDGPU: regression on 5.17.1
To: Michele Ballabio <ballabio.m@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000866e4b05dc8d271f"
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000866e4b05dc8d271f
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 13, 2022 at 1:33 PM Michele Ballabio <ballabio.m@gmail.com> wrote:
>
> On Mon, 11 Apr 2022 14:34:37 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Sat, Apr 9, 2022 at 12:28 PM Michele Ballabio
> > <ballabio.m@gmail.com> wrote:
> > >
> > > On Tue, 5 Apr 2022 10:23:16 -0400
> > > Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > > On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio
> > > > <ballabio.m@gmail.com> wrote:
> > > > >
> > > > > On Mon, 4 Apr 2022 13:03:41 -0400
> > > > > Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > >
> > > > > > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > > > > > <ballabio.m@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >         I've hit a regression on 5.17.1 (haven't tested
> > > > > > > 5.17.0, but 5.16-stable didn't have this problem).
> > > > > > >
> > > > > > > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> > > > > > >
> > > > > > > The regression I hit seems to trigger when the machine is
> > > > > > > left idle at boot (I don't boot straight to X, I boot to a
> > > > > > > tty, login and then start X). The machine after a while
> > > > > > > blanks the screen. Usually, the screen unblanks as the
> > > > > > > keyboard is hit or the mouse moves, but with kernel 5.17.1
> > > > > > > the screen does not wake up. The machine seems to run
> > > > > > > mostly fine: I can login from ssh, but I cannot reboot or
> > > > > > > halt it: a sysrq sequence is needed for that. Note that if
> > > > > > > the screen goes blank under X, it wakes up fine.
> > > > > > >
> > > > > > > Below a dmesg and two traces from syslog (they're quite
> > > > > > > similar).
> > > > > >
> > > > > > Can you bisect?  Does setting amdgpu.runpm=0 help?
> > > > >
> > > > > I can try to bisect, should I narrow the search to
> > > > > drivers/gpu/drm/ ?
> > > >
> > > > I would just do a full bisect if possible in case the change
> > > > happens to be outside of drm.
> > > >
> > > > >
> > > > > Setting amdgpu.runpm=0 works, the display now unblanks without
> > > > > problems.
> > > >
> > >
> > > Hi,
> > >     I bisected this, and the first bad commit is
> > > [087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: use generic
> > > fb helpers instead of setting up AMD own's.
> > >
> > > Let me know if you need some more testing.
> >
> > Thanks.  Do the attached patches fix the issue?
> >
> > Thanks,
> >
> > Alex
>
> Sorry, no. I applied them both on top of 5.17.1.

Thanks.  Please try the attached patch.

Thanks,

Alex

> I'm pasting the output of dmesg and decode_stacktrace.sh:
>
> dmesg:
> -------
>
> [    0.000000] Linux version 5.17.1+ (mike@darkstar.example.org) (gcc (GCC) 11.2.0, GNU ld version 2.38-slack151) #221 SMP PREEMPT Wed Apr 13 18:51:36 CEST 2022
> [    0.000000] Command line: BOOT_IMAGE=bzImage ro root=806 debug
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
> [    0.000000] signal: max sigframe size: 1776
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d3ff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000009d400-0x000000000009ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000003ffffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000004000000-0x0000000004009fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000000400a000-0x0000000009bfffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000009c00000-0x0000000009ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000affffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000d4434fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000d4435000-0x00000000d444ffff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000d4450000-0x00000000da830fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000da831000-0x00000000da970fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000da971000-0x00000000da97afff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000da97b000-0x00000000daa82fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000daa83000-0x00000000dae3efff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000dae3f000-0x00000000db93efff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000db93f000-0x00000000ddffffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000de000000-0x00000000dfffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fd800000-0x00000000fdffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000041f37ffff] usable
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 3.1.1 present.
> [    0.000000] DMI: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> [    0.000000] tsc: Fast TSC calibration failed
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] last_pfn = 0x41f380 max_arch_pfn = 0x400000000
> [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> [    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==> reserved
> [    0.000000] last_pfn = 0xde000 max_arch_pfn = 0x400000000
> [    0.000000] Using GB pages for direct mapping
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F05B0 000024 (v02 ALASKA)
> [    0.000000] ACPI: XSDT 0x00000000D4435098 0000A4 (v01 ALASKA A M I    01072009 AMI  00010013)
> [    0.000000] ACPI: FACP 0x00000000D443FAC0 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
> [    0.000000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock has valid Length but zero Address: 0x0000000000000000/0x1 (20211217/tbfadt-615)
> [    0.000000] ACPI: DSDT 0x00000000D44351D0 00A8EA (v02 ALASKA A M I    01072009 INTL 20120913)
> [    0.000000] ACPI: FACS 0x00000000DAE27E00 000040
> [    0.000000] ACPI: APIC 0x00000000D443FBD8 0000DE (v03 ALASKA A M I    01072009 AMI  00010013)
> [    0.000000] ACPI: FPDT 0x00000000D443FCB8 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
> [    0.000000] ACPI: FIDT 0x00000000D443FD00 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
> [    0.000000] ACPI: SSDT 0x00000000D444E140 001A41 (v01 AMD    AmdTable 00000001 INTL 20120913)
> [    0.000000] ACPI: SSDT 0x00000000D443FDF8 008C98 (v02 AMD    AMD ALIB 00000002 MSFT 04000000)
> [    0.000000] ACPI: SSDT 0x00000000D4448A90 001A58 (v01 AMD    AMD CPU  00000001 AMD  00000001)
> [    0.000000] ACPI: CRAT 0x00000000D444A4E8 000BD0 (v01 AMD    AMD CRAT 00000001 AMD  00000001)
> [    0.000000] ACPI: CDIT 0x00000000D444B0B8 000029 (v01 AMD    AMD CDIT 00000001 AMD  00000001)
> [    0.000000] ACPI: SSDT 0x00000000D444B0E8 002DA8 (v01 AMD    AMD AOD  00000001 INTL 20120913)
> [    0.000000] ACPI: MCFG 0x00000000D444DE90 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
> [    0.000000] ACPI: HPET 0x00000000D444DED0 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
> [    0.000000] ACPI: SSDT 0x00000000D444DF08 000024 (v01 AMDFCH FCHZP    00001000 INTL 20120913)
> [    0.000000] ACPI: UEFI 0x00000000D444DF30 000042 (v01                 00000000      00000000)
> [    0.000000] ACPI: IVRS 0x00000000D444DF78 0000D0 (v02 AMD    AMD IVRS 00000001 AMD  00000000)
> [    0.000000] ACPI: SSDT 0x00000000D444E048 0000F8 (v01 AMD    AMD PT   00001000 INTL 20120913)
> [    0.000000] ACPI: Reserving FACP table memory at [mem 0xd443fac0-0xd443fbd3]
> [    0.000000] ACPI: Reserving DSDT table memory at [mem 0xd44351d0-0xd443fab9]
> [    0.000000] ACPI: Reserving FACS table memory at [mem 0xdae27e00-0xdae27e3f]
> [    0.000000] ACPI: Reserving APIC table memory at [mem 0xd443fbd8-0xd443fcb5]
> [    0.000000] ACPI: Reserving FPDT table memory at [mem 0xd443fcb8-0xd443fcfb]
> [    0.000000] ACPI: Reserving FIDT table memory at [mem 0xd443fd00-0xd443fd9b]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd444e140-0xd444fb80]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd443fdf8-0xd4448a8f]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd4448a90-0xd444a4e7]
> [    0.000000] ACPI: Reserving CRAT table memory at [mem 0xd444a4e8-0xd444b0b7]
> [    0.000000] ACPI: Reserving CDIT table memory at [mem 0xd444b0b8-0xd444b0e0]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd444b0e8-0xd444de8f]
> [    0.000000] ACPI: Reserving MCFG table memory at [mem 0xd444de90-0xd444decb]
> [    0.000000] ACPI: Reserving HPET table memory at [mem 0xd444ded0-0xd444df07]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd444df08-0xd444df2b]
> [    0.000000] ACPI: Reserving UEFI table memory at [mem 0xd444df30-0xd444df71]
> [    0.000000] ACPI: Reserving IVRS table memory at [mem 0xd444df78-0xd444e047]
> [    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd444e048-0xd444e13f]
> [    0.000000] system APIC only can use physical flat
> [    0.000000] Setting APIC routing to physical flat.
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000041f37ffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x41f37b000-0x41f37ffff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000041f37ffff]
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009cfff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000003ffffff]
> [    0.000000]   node   0: [mem 0x000000000400a000-0x0000000009bfffff]
> [    0.000000]   node   0: [mem 0x000000000a000000-0x000000000affffff]
> [    0.000000]   node   0: [mem 0x000000000b020000-0x00000000d4434fff]
> [    0.000000]   node   0: [mem 0x00000000d4450000-0x00000000da830fff]
> [    0.000000]   node   0: [mem 0x00000000da97b000-0x00000000daa82fff]
> [    0.000000]   node   0: [mem 0x00000000db93f000-0x00000000ddffffff]
> [    0.000000]   node   0: [mem 0x0000000100000000-0x000000041f37ffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000041f37ffff]
> [    0.000000] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA: 99 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 10 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 1024 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 32 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 27 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 330 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA32: 3772 pages in unavailable ranges
> [    0.000000] On node 0, zone Normal: 8192 pages in unavailable ranges
> [    0.000000] On node 0, zone Normal: 3200 pages in unavailable ranges
> [    0.000000] ACPI: PM-Timer IO Port: 0x808
> [    0.000000] system APIC only can use physical flat
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
> [    0.000000] IOAPIC[0]: apic_id 13, version 33, address 0xfec00000, GSI 0-23
> [    0.000000] IOAPIC[1]: apic_id 14, version 33, address 0xfec01000, GSI 24-55
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.000000] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
> [    0.000000] smpboot: Allowing 16 CPUs, 4 hotplug CPUs
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000dffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000e0000-0x000fffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x04000000-0x04009fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x09c00000-0x09ffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd4435000-0xd444ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xda831000-0xda970fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xda971000-0xda97afff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdaa83000-0xdae3efff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdae3f000-0xdb93efff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xde000000-0xdfffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfc000000-0xfd7fffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfd800000-0xfdffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe9fffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0xfedfffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
> [    0.000000] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
> [    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on bare hardware
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:16 nr_node_ids:1
> [    0.000000] percpu: Embedded 59 pages/cpu s204800 r8192 d28672 u262144
> [    0.000000] pcpu-alloc: s204800 r8192 d28672 u262144 alloc=1*2097152
> [    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15
> [    0.000000] Fallback order for Node 0: 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 4112184
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line: BOOT_IMAGE=bzImage ro root=806 debug
> [    0.000000] Unknown kernel command line parameters "BOOT_IMAGE=bzImage", will be passed to user space.
> [    0.000000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 16301444K/16710468K available (22542K kernel code, 3541K rwdata, 9392K rodata, 1884K init, 4236K bss, 408764K reserved, 0K cma-reserved)
> [    0.000000] random: get_random_u64 called from __kmem_cache_create+0x28/0x530 with crng_init=0
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
> [    0.000000] ftrace: allocating 63796 entries in 250 pages
> [    0.000000] ftrace: allocated 250 pages with 6 groups
> [    0.000000] Dynamic Preempt: full
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu:     CONFIG_RCU_FANOUT set to non-default value of 32.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=16.
> [    0.000000]  Trampoline variant of Tasks RCU enabled.
> [    0.000000]  Rude variant of Tasks RCU enabled.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
> [    0.000000] NR_IRQS: 16640, nr_irqs: 1096, preallocated irqs: 16
> [    0.000000] random: crng init done (trusting CPU's manufacturer)
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] printk: console [tty0] enabled
> [    0.000000] ACPI: Core revision 20211217
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
> [    0.000000] APIC: Switch to symmetric I/O mode setup
> [    0.001000] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.007000] tsc: PIT calibration matches HPET. 1 loops
> [    0.007000] tsc: Detected 3193.623 MHz processor
> [    0.000004] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e08c1da398, max_idle_ns: 440795268375 ns
> [    0.000080] Calibrating delay loop (skipped), value calculated using timer frequency.. 6387.24 BogoMIPS (lpj=3193623)
> [    0.000496] pid_max: default: 32768 minimum: 301
> [    0.000576] LSM: Security Framework initializing
> [    0.000661] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.000747] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.001232] LVT offset 1 assigned for vector 0xf9
> [    0.001350] LVT offset 2 assigned for vector 0xf4
> [    0.001423] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.001484] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
> [    0.001549] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    0.001620] Spectre V2 : Mitigation: Retpolines
> [    0.001678] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    0.001748] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    0.001818] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    0.003640] Freeing SMP alternatives memory: 52K
> [    0.106859] smpboot: CPU0: AMD Ryzen 5 1600 Six-Core Processor (family: 0x17, model: 0x1, stepping: 0x1)
> [    0.107026] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.107079] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.107079] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.107079] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.107079] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.107079] ... version:                0
> [    0.107079] ... bit width:              48
> [    0.107079] ... generic registers:      6
> [    0.107079] ... value mask:             0000ffffffffffff
> [    0.107079] ... max period:             00007fffffffffff
> [    0.107079] ... fixed-purpose events:   0
> [    0.107079] ... event mask:             000000000000003f
> [    0.107079] rcu: Hierarchical SRCU implementation.
> [    0.107204] MCE: In-kernel MCE decoding enabled.
> [    0.107356] smp: Bringing up secondary CPUs ...
> [    0.107478] x86: Booting SMP configuration:
> [    0.107535] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11
> [    0.121101] smp: Brought up 1 node, 12 CPUs
> [    0.121227] smpboot: Max logical packages: 2
> [    0.121285] smpboot: Total of 12 processors activated (76646.95 BogoMIPS)
> [    0.122529] devtmpfs: initialized
> [    0.122529] x86/mm: Memory block size: 128MB
> [    0.123727] ACPI: PM: Registering ACPI NVS region [mem 0x04000000-0x04009fff] (40960 bytes)
> [    0.123727] ACPI: PM: Registering ACPI NVS region [mem 0xdaa83000-0xdae3efff] (3915776 bytes)
> [    0.123727] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.124086] futex hash table entries: 4096 (order: 6, 262144 bytes, linear)
> [    0.124197] pinctrl core: initialized pinctrl subsystem
> [    0.124444] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.124586] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
> [    0.124653] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.124723] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.124801] audit: initializing netlink subsys (disabled)
> [    0.124867] audit: type=2000 audit(1649868999.131:1): state=initialized audit_enabled=0 res=1
> [    0.124867] thermal_sys: Registered thermal governor 'fair_share'
> [    0.124867] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.124867] thermal_sys: Registered thermal governor 'step_wise'
> [    0.125081] thermal_sys: Registered thermal governor 'user_space'
> [    0.125152] cpuidle: using governor ladder
> [    0.126140] cpuidle: using governor menu
> [    0.127114] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.127212] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
> [    0.127287] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
> [    0.127359] PCI: Using configuration type 1 for base access
> [    0.130847] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.130847] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.131100] cryptd: max_cpu_qlen set to 1000
> [    0.131180] raid6: skipped pq benchmark and selected avx2x4
> [    0.131180] raid6: using avx2x2 recovery algorithm
> [    0.131251] ACPI: Added _OSI(Module Device)
> [    0.131309] ACPI: Added _OSI(Processor Device)
> [    0.131367] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.131425] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.131486] ACPI: Added _OSI(Linux-Dell-Video)
> [    0.131544] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    0.131605] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    0.140402] ACPI: 7 ACPI AML tables successfully acquired and loaded
> [    0.141614] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.144030] ACPI: Interpreter enabled
> [    0.144097] ACPI: PM: (supports S0 S3 S4 S5)
> [    0.144155] ACPI: Using IOAPIC for interrupt routing
> [    0.144494] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.144811] ACPI: Enabled 4 GPEs in block 00 to 1F
> [    0.160676] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.160743] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.160892] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug PME LTR DPC]
> [    0.161099] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
> [    0.161170] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
> [    0.161507] PCI host bridge to bus 0000:00
> [    0.161566] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [    0.161630] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.161694] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [    0.161758] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    0.161822] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
> [    0.161891] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2ffff window]
> [    0.161959] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
> [    0.162027] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.162091] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
> [    0.162227] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
> [    0.162369] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
> [    0.162480] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
> [    0.162638] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
> [    0.163146] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
> [    0.163263] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
> [    0.163365] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
> [    0.163518] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
> [    0.163678] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
> [    0.163799] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
> [    0.163901] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
> [    0.164082] pci 0000:00:07.1: enabling Extended Tags
> [    0.164205] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
> [    0.164361] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
> [    0.164463] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
> [    0.164552] pci 0000:00:08.1: enabling Extended Tags
> [    0.164675] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    0.165208] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    0.165472] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    0.165738] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
> [    0.165828] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
> [    0.165918] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
> [    0.166007] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
> [    0.166114] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
> [    0.166205] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
> [    0.166294] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
> [    0.166383] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
> [    0.166560] pci 0000:01:00.0: [1022:43bb] type 00 class 0x0c0330
> [    0.166636] pci 0000:01:00.0: reg 0x10: [mem 0xfe7a0000-0xfe7a7fff 64bit]
> [    0.166779] pci 0000:01:00.0: PME# supported from D3hot D3cold
> [    0.166934] pci 0000:01:00.1: [1022:43b7] type 00 class 0x010601
> [    0.167035] pci 0000:01:00.1: reg 0x24: [mem 0xfe780000-0xfe79ffff]
> [    0.167086] pci 0000:01:00.1: reg 0x30: [mem 0xfe700000-0xfe77ffff pref]
> [    0.167188] pci 0000:01:00.1: PME# supported from D3hot D3cold
> [    0.167314] pci 0000:01:00.2: [1022:43b2] type 01 class 0x060400
> [    0.167450] pci 0000:01:00.2: PME# supported from D3hot D3cold
> [    0.167593] pci 0000:00:01.3: PCI bridge to [bus 01-06]
> [    0.167655] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
> [    0.167718] pci 0000:00:01.3:   bridge window [mem 0xfe600000-0xfe7fffff]
> [    0.167859] pci 0000:02:00.0: [1022:43b4] type 01 class 0x060400
> [    0.168010] pci 0000:02:00.0: PME# supported from D3hot D3cold
> [    0.168163] pci 0000:02:01.0: [1022:43b4] type 01 class 0x060400
> [    0.168313] pci 0000:02:01.0: PME# supported from D3hot D3cold
> [    0.168459] pci 0000:02:04.0: [1022:43b4] type 01 class 0x060400
> [    0.168609] pci 0000:02:04.0: PME# supported from D3hot D3cold
> [    0.168760] pci 0000:01:00.2: PCI bridge to [bus 02-06]
> [    0.168823] pci 0000:01:00.2:   bridge window [io  0xf000-0xffff]
> [    0.168887] pci 0000:01:00.2:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.169015] pci 0000:03:00.0: [10ec:8168] type 00 class 0x020000
> [    0.169106] pci 0000:03:00.0: reg 0x10: [io  0xf000-0xf0ff]
> [    0.169201] pci 0000:03:00.0: reg 0x18: [mem 0xfe604000-0xfe604fff 64bit]
> [    0.169286] pci 0000:03:00.0: reg 0x20: [mem 0xfe600000-0xfe603fff 64bit]
> [    0.169490] pci 0000:03:00.0: supports D1 D2
> [    0.169548] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.169794] pci 0000:02:00.0: PCI bridge to [bus 03]
> [    0.169857] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [    0.169921] pci 0000:02:00.0:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.170080] pci 0000:04:00.0: [1b21:1080] type 01 class 0x060400
> [    0.170328] pci 0000:04:00.0: supports D1 D2
> [    0.170386] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.173103] pci 0000:02:01.0: PCI bridge to [bus 04-05]
> [    0.173239] pci_bus 0000:05: extended config space not accessible
> [    0.173402] pci 0000:04:00.0: PCI bridge to [bus 05]
> [    0.173529] pci 0000:02:04.0: PCI bridge to [bus 06]
> [    0.173677] pci 0000:07:00.0: [1002:67ff] type 00 class 0x030000
> [    0.173753] pci 0000:07:00.0: reg 0x10: [mem 0xe0000000-0xefffffff 64bit pref]
> [    0.173831] pci 0000:07:00.0: reg 0x18: [mem 0xf0000000-0xf01fffff 64bit pref]
> [    0.173905] pci 0000:07:00.0: reg 0x20: [io  0xe000-0xe0ff]
> [    0.173972] pci 0000:07:00.0: reg 0x24: [mem 0xfe900000-0xfe93ffff]
> [    0.174040] pci 0000:07:00.0: reg 0x30: [mem 0xfe940000-0xfe95ffff pref]
> [    0.174101] pci 0000:07:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
> [    0.174225] pci 0000:07:00.0: supports D1 D2
> [    0.174283] pci 0000:07:00.0: PME# supported from D1 D2 D3hot D3cold
> [    0.174468] pci 0000:07:00.1: [1002:aae0] type 00 class 0x040300
> [    0.174545] pci 0000:07:00.1: reg 0x10: [mem 0xfe960000-0xfe963fff 64bit]
> [    0.174683] pci 0000:07:00.1: supports D1 D2
> [    0.174809] pci 0000:00:03.1: PCI bridge to [bus 07]
> [    0.174871] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
> [    0.174934] pci 0000:00:03.1:   bridge window [mem 0xfe900000-0xfe9fffff]
> [    0.174999] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.175146] pci 0000:08:00.0: [1022:145a] type 00 class 0x130000
> [    0.175235] pci 0000:08:00.0: enabling Extended Tags
> [    0.175365] pci 0000:08:00.2: [1022:1456] type 00 class 0x108000
> [    0.175439] pci 0000:08:00.2: reg 0x18: [mem 0xfe400000-0xfe4fffff]
> [    0.175511] pci 0000:08:00.2: reg 0x24: [mem 0xfe500000-0xfe501fff]
> [    0.175580] pci 0000:08:00.2: enabling Extended Tags
> [    0.175722] pci 0000:08:00.3: [1022:145c] type 00 class 0x0c0330
> [    0.175793] pci 0000:08:00.3: reg 0x10: [mem 0xfe300000-0xfe3fffff 64bit]
> [    0.175875] pci 0000:08:00.3: enabling Extended Tags
> [    0.175960] pci 0000:08:00.3: PME# supported from D0 D3hot D3cold
> [    0.176105] pci 0000:00:07.1: PCI bridge to [bus 08]
> [    0.176168] pci 0000:00:07.1:   bridge window [mem 0xfe300000-0xfe5fffff]
> [    0.176299] pci 0000:09:00.0: [1022:1455] type 00 class 0x130000
> [    0.176390] pci 0000:09:00.0: enabling Extended Tags
> [    0.176523] pci 0000:09:00.2: [1022:7901] type 00 class 0x010601
> [    0.176608] pci 0000:09:00.2: reg 0x24: [mem 0xfe808000-0xfe808fff]
> [    0.176677] pci 0000:09:00.2: enabling Extended Tags
> [    0.176765] pci 0000:09:00.2: PME# supported from D3hot D3cold
> [    0.176885] pci 0000:09:00.3: [1022:1457] type 00 class 0x040300
> [    0.176954] pci 0000:09:00.3: reg 0x10: [mem 0xfe800000-0xfe807fff]
> [    0.177040] pci 0000:09:00.3: enabling Extended Tags
> [    0.177108] pci 0000:09:00.3: PME# supported from D0 D3hot D3cold
> [    0.177233] pci 0000:00:08.1: PCI bridge to [bus 09]
> [    0.177296] pci 0000:00:08.1:   bridge window [mem 0xfe800000-0xfe8fffff]
> [    0.177667] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    0.177774] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    0.177874] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    0.177982] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    0.178109] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    0.178205] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    0.178300] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    0.178395] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    0.178895] iommu: Default domain type: Translated
> [    0.178895] iommu: DMA domain TLB invalidation policy: lazy mode
> [    0.179083] pci 0000:07:00.0: vgaarb: setting as boot VGA device
> [    0.179145] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.179217] pci 0000:07:00.0: vgaarb: bridge control possible
> [    0.179278] vgaarb: loaded
> [    0.179405] SCSI subsystem initialized
> [    0.179468] libata version 3.00 loaded.
> [    0.179468] ACPI: bus type USB registered
> [    0.179468] usbcore: registered new interface driver usbfs
> [    0.179468] usbcore: registered new interface driver hub
> [    0.179468] usbcore: registered new device driver usb
> [    0.179468] pps_core: LinuxPPS API ver. 1 registered
> [    0.179480] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.180082] PTP clock support registered
> [    0.180149] EDAC MC: Ver: 3.0.0
> [    0.180219] Advanced Linux Sound Architecture Driver Initialized.
> [    0.180246] PCI: Using ACPI for IRQ routing
> [    0.185340] PCI: pci_cache_line_size set to 64 bytes
> [    0.185454] e820: reserve RAM buffer [mem 0x0009d400-0x0009ffff]
> [    0.185516] e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
> [    0.185577] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
> [    0.185639] e820: reserve RAM buffer [mem 0xd4435000-0xd7ffffff]
> [    0.185700] e820: reserve RAM buffer [mem 0xda831000-0xdbffffff]
> [    0.185762] e820: reserve RAM buffer [mem 0xdaa83000-0xdbffffff]
> [    0.185824] e820: reserve RAM buffer [mem 0xde000000-0xdfffffff]
> [    0.185885] e820: reserve RAM buffer [mem 0x41f380000-0x41fffffff]
> [    0.186117] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
> [    0.186232] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    0.186295] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    0.188128] clocksource: Switched to clocksource tsc-early
> [    0.194886] VFS: Disk quotas dquot_6.6.0
> [    0.194957] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.195090] pnp: PnP ACPI init
> [    0.195257] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
> [    0.195377] system 00:01: [mem 0xfeb80000-0xfebfffff] could not be reserved
> [    0.195637] system 00:03: [io  0x0300-0x030f] has been reserved
> [    0.195700] system 00:03: [io  0x0230-0x023f] has been reserved
> [    0.195767] system 00:03: [io  0x0290-0x029f] has been reserved
> [    0.196043] pnp 00:04: [dma 0 disabled]
> [    0.196289] system 00:05: [io  0x04d0-0x04d1] has been reserved
> [    0.196352] system 00:05: [io  0x040b] has been reserved
> [    0.196412] system 00:05: [io  0x04d6] has been reserved
> [    0.196473] system 00:05: [io  0x0c00-0x0c01] has been reserved
> [    0.196534] system 00:05: [io  0x0c14] has been reserved
> [    0.196595] system 00:05: [io  0x0c50-0x0c51] has been reserved
> [    0.196658] system 00:05: [io  0x0c52] has been reserved
> [    0.196718] system 00:05: [io  0x0c6c] has been reserved
> [    0.196780] system 00:05: [io  0x0c6f] has been reserved
> [    0.196840] system 00:05: [io  0x0cd0-0x0cd1] has been reserved
> [    0.196901] system 00:05: [io  0x0cd2-0x0cd3] has been reserved
> [    0.196963] system 00:05: [io  0x0cd4-0x0cd5] has been reserved
> [    0.197024] system 00:05: [io  0x0cd6-0x0cd7] has been reserved
> [    0.197085] system 00:05: [io  0x0cd8-0x0cdf] has been reserved
> [    0.197146] system 00:05: [io  0x0800-0x089f] has been reserved
> [    0.197208] system 00:05: [io  0x0b00-0x0b0f] has been reserved
> [    0.197269] system 00:05: [io  0x0b20-0x0b3f] has been reserved
> [    0.197330] system 00:05: [io  0x0900-0x090f] has been reserved
> [    0.197391] system 00:05: [io  0x0910-0x091f] has been reserved
> [    0.197453] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
> [    0.197517] system 00:05: [mem 0xfec01000-0xfec01fff] could not be reserved
> [    0.197581] system 00:05: [mem 0xfedc0000-0xfedc0fff] has been reserved
> [    0.197644] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
> [    0.197708] system 00:05: [mem 0xfed80000-0xfed8ffff] could not be reserved
> [    0.197773] system 00:05: [mem 0xfec10000-0xfec10fff] has been reserved
> [    0.197836] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
> [    0.198257] pnp: PnP ACPI: found 6 devices
> [    0.203984] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [    0.204111] NET: Registered PF_INET protocol family
> [    0.204379] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.206105] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
> [    0.206193] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.206397] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
> [    0.206581] TCP: Hash tables configured (established 131072 bind 65536)
> [    0.206734] MPTCP token hash table entries: 16384 (order: 6, 393216 bytes, linear)
> [    0.206856] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
> [    0.206945] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
> [    0.207077] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.207217] RPC: Registered named UNIX socket transport module.
> [    0.207279] RPC: Registered udp transport module.
> [    0.207338] RPC: Registered tcp transport module.
> [    0.207397] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.207572] NET: Registered PF_XDP protocol family
> [    0.207643] pci 0000:02:00.0: PCI bridge to [bus 03]
> [    0.207704] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [    0.207773] pci 0000:02:00.0:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.207843] pci 0000:04:00.0: PCI bridge to [bus 05]
> [    0.207921] pci 0000:02:01.0: PCI bridge to [bus 04-05]
> [    0.207990] pci 0000:02:04.0: PCI bridge to [bus 06]
> [    0.208057] pci 0000:01:00.2: PCI bridge to [bus 02-06]
> [    0.208118] pci 0000:01:00.2:   bridge window [io  0xf000-0xffff]
> [    0.208182] pci 0000:01:00.2:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.208251] pci 0000:00:01.3: PCI bridge to [bus 01-06]
> [    0.208312] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
> [    0.208375] pci 0000:00:01.3:   bridge window [mem 0xfe600000-0xfe7fffff]
> [    0.208442] pci 0000:00:03.1: PCI bridge to [bus 07]
> [    0.208502] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
> [    0.208566] pci 0000:00:03.1:   bridge window [mem 0xfe900000-0xfe9fffff]
> [    0.208630] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.208701] pci 0000:00:07.1: PCI bridge to [bus 08]
> [    0.208763] pci 0000:00:07.1:   bridge window [mem 0xfe300000-0xfe5fffff]
> [    0.208830] pci 0000:00:08.1: PCI bridge to [bus 09]
> [    0.208891] pci 0000:00:08.1:   bridge window [mem 0xfe800000-0xfe8fffff]
> [    0.208957] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [    0.209020] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.209083] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [    0.209145] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [    0.209207] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
> [    0.209271] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff window]
> [    0.209335] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff window]
> [    0.209399] pci_bus 0000:01: resource 0 [io  0xf000-0xffff]
> [    0.209460] pci_bus 0000:01: resource 1 [mem 0xfe600000-0xfe7fffff]
> [    0.209522] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
> [    0.209583] pci_bus 0000:02: resource 1 [mem 0xfe600000-0xfe6fffff]
> [    0.209645] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
> [    0.209706] pci_bus 0000:03: resource 1 [mem 0xfe600000-0xfe6fffff]
> [    0.209770] pci_bus 0000:07: resource 0 [io  0xe000-0xefff]
> [    0.209831] pci_bus 0000:07: resource 1 [mem 0xfe900000-0xfe9fffff]
> [    0.209893] pci_bus 0000:07: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.209961] pci_bus 0000:08: resource 1 [mem 0xfe300000-0xfe5fffff]
> [    0.210024] pci_bus 0000:09: resource 1 [mem 0xfe800000-0xfe8fffff]
> [    0.210252] pci 0000:04:00.0: Disabling ASPM L0s/L1
> [    0.210332] pci 0000:07:00.1: D0 power state depends on 0000:07:00.0
> [    0.210539] PCI: CLS 64 bytes, default 64
> [    0.210604] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
> [    0.210697] pci 0000:00:01.0: Adding to iommu group 0
> [    0.210769] pci 0000:00:01.3: Adding to iommu group 1
> [    0.210839] pci 0000:00:02.0: Adding to iommu group 2
> [    0.210908] pci 0000:00:03.0: Adding to iommu group 3
> [    0.210974] pci 0000:00:03.1: Adding to iommu group 4
> [    0.211043] pci 0000:00:04.0: Adding to iommu group 5
> [    0.211112] pci 0000:00:07.0: Adding to iommu group 6
> [    0.211179] pci 0000:00:07.1: Adding to iommu group 7
> [    0.211248] pci 0000:00:08.0: Adding to iommu group 8
> [    0.211314] pci 0000:00:08.1: Adding to iommu group 9
> [    0.211386] pci 0000:00:14.0: Adding to iommu group 10
> [    0.211454] pci 0000:00:14.3: Adding to iommu group 10
> [    0.211541] pci 0000:00:18.0: Adding to iommu group 11
> [    0.211606] pci 0000:00:18.1: Adding to iommu group 11
> [    0.211672] pci 0000:00:18.2: Adding to iommu group 11
> [    0.211740] pci 0000:00:18.3: Adding to iommu group 11
> [    0.211806] pci 0000:00:18.4: Adding to iommu group 11
> [    0.211871] pci 0000:00:18.5: Adding to iommu group 11
> [    0.211937] pci 0000:00:18.6: Adding to iommu group 11
> [    0.212002] pci 0000:00:18.7: Adding to iommu group 11
> [    0.212076] pci 0000:01:00.0: Adding to iommu group 12
> [    0.212143] pci 0000:01:00.1: Adding to iommu group 12
> [    0.212210] pci 0000:01:00.2: Adding to iommu group 12
> [    0.212272] pci 0000:02:00.0: Adding to iommu group 12
> [    0.212335] pci 0000:02:01.0: Adding to iommu group 12
> [    0.212397] pci 0000:02:04.0: Adding to iommu group 12
> [    0.212459] pci 0000:03:00.0: Adding to iommu group 12
> [    0.212520] pci 0000:04:00.0: Adding to iommu group 12
> [    0.212601] pci 0000:07:00.0: Adding to iommu group 13
> [    0.212667] pci 0000:07:00.1: Adding to iommu group 13
> [    0.212735] pci 0000:08:00.0: Adding to iommu group 14
> [    0.212809] pci 0000:08:00.2: Adding to iommu group 15
> [    0.212876] pci 0000:08:00.3: Adding to iommu group 16
> [    0.212943] pci 0000:09:00.0: Adding to iommu group 17
> [    0.213010] pci 0000:09:00.2: Adding to iommu group 18
> [    0.213077] pci 0000:09:00.3: Adding to iommu group 19
> [    0.215179] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    0.215245] AMD-Vi: Extended features (0xf77ef22294ada): PPR NX GT IA GA PC GA_vAPIC
> [    0.215317] AMD-Vi: Interrupt remapping enabled
> [    0.215374] AMD-Vi: Virtual APIC enabled
> [    0.215542] software IO TLB: tearing down default memory pool
> [    0.216734] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
> [    0.216805] RAPL PMU: hw unit of domain package 2^-16 Joules
> [    0.216869] amd_uncore: 4  amd_df counters detected
> [    0.216930] amd_uncore: 6  amd_l3 counters detected
> [    0.217132] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    0.217293] SVM: TSC scaling supported
> [    0.217350] kvm: Nested Virtualization enabled
> [    0.217407] SVM: kvm: Nested Paging enabled
> [    0.217466] SEV supported: 16 ASIDs
> [    0.217533] SVM: Virtual VMLOAD VMSAVE supported
> [    0.217591] SVM: Virtual GIF supported
> [    0.217647] SVM: LBR virtualization supported
> [    0.223424] Initialise system trusted keyrings
> [    0.223490] Key type blacklist registered
> [    0.223579] workingset: timestamp_bits=40 max_order=22 bucket_order=0
> [    0.224570] zbud: loaded
> [    0.226585] NFS: Registering the id_resolver key type
> [    0.226648] Key type id_resolver registered
> [    0.226706] Key type id_legacy registered
> [    0.226777] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [    0.226842] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [    0.226913] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [    0.226980] fuse: init (API version 7.36)
> [    0.236082] xor: automatically using best checksumming function   avx
> [    0.236147] async_tx: api initialized (async)
> [    0.236205] Key type asymmetric registered
> [    0.236263] Asymmetric key parser 'x509' registered
> [    0.236562] alg: self-tests for CTR-KDF (hmac(sha256)) passed
> [    0.236631] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
> [    0.236727] io scheduler mq-deadline registered
> [    0.236975] atomic64_test: passed for x86-64 platform with CX8 and with SSE
> [    0.238998] pcieport 0000:00:01.3: AER: enabled with IRQ 26
> [    0.239268] pcieport 0000:00:03.1: AER: enabled with IRQ 27
> [    0.239533] pcieport 0000:00:07.1: AER: enabled with IRQ 28
> [    0.240142] pcieport 0000:00:08.1: AER: enabled with IRQ 30
> [    0.240848] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [    0.240933] ACPI: button: Power Button [PWRB]
> [    0.241022] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> [    0.241118] ACPI: button: Power Button [PWRF]
> [    0.241227] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.241299] ACPI: \_PR_.P000: Found 2 idle states
> [    0.241455] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.241525] ACPI: \_PR_.P001: Found 2 idle states
> [    0.241663] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.241735] ACPI: \_PR_.P002: Found 2 idle states
> [    0.241875] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.241947] ACPI: \_PR_.P003: Found 2 idle states
> [    0.242103] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.242175] ACPI: \_PR_.P004: Found 2 idle states
> [    0.242319] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.242393] ACPI: \_PR_.P005: Found 2 idle states
> [    0.242525] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.242597] ACPI: \_PR_.P006: Found 2 idle states
> [    0.242736] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.242806] ACPI: \_PR_.P007: Found 2 idle states
> [    0.242916] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.242983] ACPI: \_PR_.P008: Found 2 idle states
> [    0.243092] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.243160] ACPI: \_PR_.P009: Found 2 idle states
> [    0.243302] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.243371] ACPI: \_PR_.P00A: Found 2 idle states
> [    0.243514] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.243583] ACPI: \_PR_.P00B: Found 2 idle states
> [    0.244514] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.244648] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [    0.245290] Linux agpgart interface v0.103
> [    0.245390] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [    0.245527] ACPI: bus type drm_connector registered
> [    0.245593] [drm] amdgpu kernel modesetting enabled.
> [    0.245685] amdgpu: Ignoring ACPI CRAT on non-APU system
> [    0.245749] amdgpu: Virtual CRAT table created for CPU
> [    0.245814] amdgpu: Topology: Add CPU node
> [    0.245917] amdgpu 0000:07:00.0: vgaarb: deactivate vga console
> [    0.247086] Console: switching to colour dummy device 80x25
> [    0.247155] [drm] initializing kernel modesetting (POLARIS11 0x1002:0x67FF 0x1DA2:0xE348 0xCF).
> [    0.247161] amdgpu 0000:07:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
> [    0.247168] [drm] register mmio base: 0xFE900000
> [    0.247170] [drm] register mmio size: 262144
> [    0.247175] [drm] add ip block number 0 <vi_common>
> [    0.247177] [drm] add ip block number 1 <gmc_v8_0>
> [    0.247179] [drm] add ip block number 2 <tonga_ih>
> [    0.247181] [drm] add ip block number 3 <gfx_v8_0>
> [    0.247183] [drm] add ip block number 4 <sdma_v3_0>
> [    0.247185] [drm] add ip block number 5 <powerplay>
> [    0.247187] [drm] add ip block number 6 <dm>
> [    0.247189] [drm] add ip block number 7 <uvd_v6_0>
> [    0.247190] [drm] add ip block number 8 <vce_v3_0>
> [    0.247433] amdgpu 0000:07:00.0: No more image in the PCI ROM
> [    0.247451] amdgpu 0000:07:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [    0.247453] amdgpu: ATOM BIOS: 113-34830H2-U02
> [    0.247466] [drm] UVD is enabled in VM mode
> [    0.247468] [drm] UVD ENC is enabled in VM mode
> [    0.247471] [drm] VCE enabled in VM mode
> [    0.247493] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
> [    0.247503] amdgpu 0000:07:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
> [    0.247507] amdgpu 0000:07:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
> [    0.247512] [drm] Detected VRAM RAM=2048M, BAR=256M
> [    0.247514] [drm] RAM width 128bits GDDR5
> [    0.247540] [drm] amdgpu: 2048M of VRAM memory ready
> [    0.247542] [drm] amdgpu: 3072M of GTT memory ready.
> [    0.247545] [drm] GART: num cpu pages 65536, num gpu pages 65536
> [    0.249118] [drm] PCIE GART of 256M enabled (table at 0x000000F400900000).
> [    0.249170] [drm] Chained IB support enabled!
> [    0.249842] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
> [    0.249853] [drm] Found UVD firmware Version: 1.130 Family ID: 16
> [    0.250560] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
> [    0.584088] [drm] Display Core initialized with v3.2.167!
> [    0.625566] [drm] UVD and UVD ENC initialized successfully.
> [    0.726479] [drm] VCE initialized successfully.
> [    0.727221] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [    0.727284] amdgpu: SRAT table not found
> [    0.727286] amdgpu: Virtual CRAT table created for GPU
> [    0.727319] amdgpu: Topology: Add dGPU node [0x67ff:0x1002]
> [    0.727323] kfd kfd: amdgpu: added device 1002:67ff
> [    0.727334] amdgpu 0000:07:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 8, active_cu_number 16
> [    0.731402] amdgpu 0000:07:00.0: amdgpu: Using BACO for runtime pm
> [    0.731589] [drm] Initialized amdgpu 3.44.0 20150101 for 0000:07:00.0 on minor 0
> [    0.738000] fbcon: amdgpudrmfb (fb0) is primary device
> [    0.801234] Console: switching to colour frame buffer device 240x67
> [    0.818522] amdgpu 0000:07:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    0.820399] brd: module loaded
> [    0.821540] loop: module loaded
> [    0.821821] ahci 0000:01:00.1: version 3.0
> [    0.821981] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
> [    0.822049] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x33 impl SATA mode
> [    0.822090] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst
> [    0.822544] scsi host0: ahci
> [    0.822656] scsi host1: ahci
> [    0.822752] scsi host2: ahci
> [    0.822846] scsi host3: ahci
> [    0.822953] scsi host4: ahci
> [    0.823040] scsi host5: ahci
> [    0.823130] scsi host6: ahci
> [    0.823211] scsi host7: ahci
> [    0.823257] ata1: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780100 irq 39
> [    0.823296] ata2: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780180 irq 39
> [    0.823335] ata3: DUMMY
> [    0.823353] ata4: DUMMY
> [    0.823371] ata5: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780300 irq 39
> [    0.823409] ata6: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780380 irq 39
> [    0.823446] ata7: DUMMY
> [    0.823464] ata8: DUMMY
> [    0.823741] ahci 0000:09:00.2: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0xc impl SATA mode
> [    0.823792] ahci 0000:09:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part
> [    0.824063] scsi host8: ahci
> [    0.824156] scsi host9: ahci
> [    0.824250] scsi host10: ahci
> [    0.824342] scsi host11: ahci
> [    0.824390] ata9: DUMMY
> [    0.824408] ata10: DUMMY
> [    0.824427] ata11: SATA max UDMA/133 abar m4096@0xfe808000 port 0xfe808200 irq 43
> [    0.824465] ata12: SATA max UDMA/133 abar m4096@0xfe808000 port 0xfe808280 irq 44
> [    0.825089] scsi host12: pata_legacy
> [    0.825136] ata13: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> [    1.240093] tsc: Refined TSC clocksource calibration: 3193.999 MHz
> [    1.240762] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2e0a24cf65f, max_idle_ns: 440795271781 ns
> [    1.241397] clocksource: Switched to clocksource tsc
> [    1.288105] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    1.288107] ata11: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    1.289466] ata12: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [    1.290548] ata1.00: ATA-8: ST3500320AS, SD1A, max UDMA/133
> [    1.290575] ata11.00: ATA-8: ST31000528AS, CC49, max UDMA/133
> [    1.291243] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    1.291880] ata11.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    1.293188] ata12.00: ATAPI: HL-DT-ST DVDRAM GH24NSD1, LG00, max UDMA/133
> [    1.294515] ata1.00: configured for UDMA/133
> [    1.295146] ata12.00: configured for UDMA/133
> [    1.303017] ata11.00: configured for UDMA/133
> [    3.864112] floppy0: no floppy controllers found
> [    3.865013] scsi 0:0:0:0: Direct-Access     ATA      ST3500320AS      SD1A PQ: 0 ANSI: 5
> [    3.865983] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
> [    3.866790] sd 0:0:0:0: [sda] Write Protect is off
> [    3.867528] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    3.868476] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    3.921071]  sda: sda1 sda2 < sda5 sda6 >
> [    3.931203] sd 0:0:0:0: [sda] Attached SCSI disk
> [    4.328095] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    4.332558] ata2.00: ATA-8: WDC WD15EADS-00P8B0, 01.00A01, max UDMA/133
> [    4.333569] ata2.00: 2930277168 sectors, multi 16: LBA48 NCQ (depth 32), AA
> [    4.338662] ata2.00: configured for UDMA/133
> [    4.339551] scsi 1:0:0:0: Direct-Access     ATA      WDC WD15EADS-00P 0A01 PQ: 0 ANSI: 5
> [    4.340516] sd 1:0:0:0: [sdb] 2930277168 512-byte logical blocks: (1.50 TB/1.36 TiB)
> [    4.341233] sd 1:0:0:0: [sdb] Write Protect is off
> [    4.341918] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
> [    4.342592] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    4.373244]  sdb: sdb1
> [    4.380207] sd 1:0:0:0: [sdb] Attached SCSI disk
> [    4.800095] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [    4.802255] ata5.00: ATA-8: ST3500320AS, SD1A, max UDMA/133
> [    4.802874] ata5.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    4.805347] ata5.00: configured for UDMA/133
> [    4.806061] scsi 4:0:0:0: Direct-Access     ATA      ST3500320AS      SD1A PQ: 0 ANSI: 5
> [    4.807119] sd 4:0:0:0: [sdc] 976773168 512-byte logical blocks: (500 GB/466 GiB)
> [    4.807940] sd 4:0:0:0: [sdc] Write Protect is off
> [    4.808828] sd 4:0:0:0: [sdc] Mode Sense: 00 3a 00 00
> [    4.809551] sd 4:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    4.855096]  sdc: sdc1 sdc2 < sdc5 >
> [    4.861151] sd 4:0:0:0: [sdc] Attached SCSI disk
> [    5.272095] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [    5.273632] ata6.00: ATA-8: ST2000DL003-9VT166, CC32, max UDMA/133
> [    5.274448] ata6.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    5.275990] ata6.00: configured for UDMA/133
> [    5.276938] scsi 5:0:0:0: Direct-Access     ATA      ST2000DL003-9VT1 CC32 PQ: 0 ANSI: 5
> [    5.277900] sd 5:0:0:0: [sdd] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
> [    5.278020] scsi 10:0:0:0: Direct-Access     ATA      ST31000528AS     CC49 PQ: 0 ANSI: 5
> [    5.278815] sd 5:0:0:0: [sdd] Write Protect is off
> [    5.279766] sd 10:0:0:0: [sde] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [    5.280440] sd 5:0:0:0: [sdd] Mode Sense: 00 3a 00 00
> [    5.281287] sd 10:0:0:0: [sde] Write Protect is off
> [    5.282137] sd 5:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    5.282143] scsi 11:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH24NSD1  LG00 PQ: 0 ANSI: 5
> [    5.282944] sd 10:0:0:0: [sde] Mode Sense: 00 3a 00 00
> [    5.285477] sd 10:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    5.319446]  sde: sde1
> [    5.321274] sr 11:0:0:0: [sr0] scsi3-mmc drive: 48x/12x writer dvd-ram cd/rw xa/form2 cdda tray
> [    5.322253] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    5.327151] sd 10:0:0:0: [sde] Attached SCSI disk
> [    5.339732]  sdd: sdd1
> [    5.340795] sr 11:0:0:0: Attached scsi CD-ROM sr0
> [    5.346152] sd 5:0:0:0: [sdd] Attached SCSI disk
> [    5.347660] scsi host12: pata_legacy
> [    5.348572] ata14: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
> [    5.517647] r8169 0000:03:00.0 eth0: RTL8168h/8111h, 10:7b:44:50:35:01, XID 541, IRQ 57
> [    5.518509] r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> [    5.519356] usbcore: registered new interface driver rt73usb
> [    5.520303] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    5.521733] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
> [    5.578449] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000010048000410
> [    5.579434] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.17
> [    5.580774] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    5.582091] usb usb1: Product: xHCI Host Controller
> [    5.583379] usb usb1: Manufacturer: Linux 5.17.1+ xhci-hcd
> [    5.584642] usb usb1: SerialNumber: 0000:01:00.0
> [    5.586025] hub 1-0:1.0: USB hub found
> [    5.587404] hub 1-0:1.0: 10 ports detected
> [    5.593440] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    5.594386] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
> [    5.595796] xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [    5.597566] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [    5.598533] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.17
> [    5.599422] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    5.600276] usb usb2: Product: xHCI Host Controller
> [    5.601064] usb usb2: Manufacturer: Linux 5.17.1+ xhci-hcd
> [    5.601865] usb usb2: SerialNumber: 0000:01:00.0
> [    5.602725] hub 2-0:1.0: USB hub found
> [    5.603578] hub 2-0:1.0: 4 ports detected
> [    5.606340] xhci_hcd 0000:08:00.3: xHCI Host Controller
> [    5.607395] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 3
> [    5.608881] xhci_hcd 0000:08:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000040000410
> [    5.610225] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.17
> [    5.611456] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    5.612679] usb usb3: Product: xHCI Host Controller
> [    5.614045] usb usb3: Manufacturer: Linux 5.17.1+ xhci-hcd
> [    5.615261] usb usb3: SerialNumber: 0000:08:00.3
> [    5.616688] hub 3-0:1.0: USB hub found
> [    5.617971] hub 3-0:1.0: 4 ports detected
> [    5.619434] xhci_hcd 0000:08:00.3: xHCI Host Controller
> [    5.620742] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 4
> [    5.621911] xhci_hcd 0000:08:00.3: Host supports USB 3.0 SuperSpeed
> [    5.623198] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
> [    5.624521] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.17
> [    5.625740] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    5.626930] usb usb4: Product: xHCI Host Controller
> [    5.628118] usb usb4: Manufacturer: Linux 5.17.1+ xhci-hcd
> [    5.629308] usb usb4: SerialNumber: 0000:08:00.3
> [    5.630574] hub 4-0:1.0: USB hub found
> [    5.631791] hub 4-0:1.0: 4 ports detected
> [    5.633247] i8042: PNP: No PS/2 controller found.
> [    5.634529] mousedev: PS/2 mouse device common for all mice
> [    5.635790] rtc_cmos 00:02: RTC can wake from S4
> [    5.637424] rtc_cmos 00:02: registered as rtc0
> [    5.638586] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    5.639795] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [    5.641050] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
> [    5.642281] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> [    5.648376] device-mapper: uevent: version 1.0.3
> [    5.649445] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
> [    5.650726] ccp 0000:08:00.2: ccp enabled
> [    5.651476] hid: raw HID events driver (C) Jiri Kosina
> [    5.652226] usbcore: registered new interface driver usbhid
> [    5.652984] usbhid: USB HID core driver
> [    5.653704] asus_wmi: ASUS WMI generic driver loaded
> [    5.654615] asus_wmi: Initialization: 0x0
> [    5.655296] asus_wmi: BIOS WMI version: 0.9
> [    5.656083] asus_wmi: SFUN value: 0x0
> [    5.656822] eeepc-wmi eeepc-wmi: Detected ASUSWMI, use DCTS
> [    5.657930] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/input/input2
> [    5.659946] intel_rapl_common: Found RAPL domain package
> [    5.660778] intel_rapl_common: Found RAPL domain core
> [    5.662128] snd_hda_intel 0000:07:00.1: Force to non-snoop mode
> [    5.663631] Initializing XFRM netlink socket
> [    5.664431] NET: Registered PF_INET6 protocol family
> [    5.666018] Segment Routing with IPv6
> [    5.666776] RPL Segment Routing with IPv6
> [    5.667562] In-situ OAM (IOAM) with IPv6
> [    5.668413] NET: Registered PF_PACKET protocol family
> [    5.669313] snd_hda_intel 0000:07:00.1: bound 0000:07:00.0 (ops amdgpu_dm_audio_component_bind_ops)
> [    5.670195] 8021q: 802.1Q VLAN Support v1.8
> [    5.671035] Key type dns_resolver registered
> [    5.671306] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input3
> [    5.672820] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input4
> [    5.672975] microcode: CPU0: patch_level=0x08001137
> [    5.673715] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input5
> [    5.674409] microcode: CPU1: patch_level=0x08001137
> [    5.675430] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input6
> [    5.676258] microcode: CPU2: patch_level=0x08001137
> [    5.677313] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input7
> [    5.678042] microcode: CPU3: patch_level=0x08001137
> [    5.679969] microcode: CPU4: patch_level=0x08001137
> [    5.680851] microcode: CPU5: patch_level=0x08001137
> [    5.681773] microcode: CPU6: patch_level=0x08001137
> [    5.682979] microcode: CPU7: patch_level=0x08001137
> [    5.683159] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
> [    5.683709] microcode: CPU8: patch_level=0x08001137
> [    5.684500] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    5.685298] microcode: CPU9: patch_level=0x08001137
> [    5.686180] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [    5.687178] microcode: CPU10: patch_level=0x08001137
> [    5.687878] microcode: CPU11: patch_level=0x08001137
> [    5.688803] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    5.689663] microcode: Microcode Update Driver: v2.2.
> [    5.690566] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x11/0x0
> [    5.690567] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    5.690569] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
> [    5.691500] IPI shorthand broadcast: enabled
> [    5.692303] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
> [    5.693215] AVX2 version of gcm_enc/dec engaged.
> [    5.694117] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
> [    5.697749] AES CTR mode by8 optimization enabled
> [    5.698892] sched_clock: Marking stable (5705804000, -6920351)->(5737799777, -38916128)
> [    5.700185] registered taskstats version 1
> [    5.700999] Loading compiled-in X.509 certificates
> [    5.701955] zswap: loaded using pool lzo/zbud
> [    5.704552] Key type ._fscrypt registered
> [    5.705325] Key type .fscrypt registered
> [    5.706424] Key type fscrypt-provisioning registered
> [    5.708605] Key type encrypted registered
> [    5.711238] netpoll: netconsole: local port 6666
> [    5.712117] netpoll: netconsole: local IPv4 address 192.168.1.99
> [    5.712898] netpoll: netconsole: interface 'wlan0'
> [    5.713641] netpoll: netconsole: remote port 6666
> [    5.714406] netpoll: netconsole: remote IPv4 address 192.168.1.98
> [    5.715906] netpoll: netconsole: wlan0 doesn't exist, aborting
> [    5.716626] netconsole: cleaning up
> [    5.716830] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input8
> [    5.718705] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input9
> [    5.719952] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input10
> [    5.719956] acpi_cpufreq: overriding BIOS provided _PSD data
> [    5.721231] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input11
> [    5.723354] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input12
> [    5.723365] RAS: Correctable Errors collector initialized.
> [    5.725472] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [    5.726744] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    5.727680] ALSA device list:
> [    5.728490]   #0: HDA ATI HDMI at 0xfe960000 irq 65
> [    5.729338]   #1: HD-Audio Generic at 0xfe800000 irq 67
> [    5.730258] md: Waiting for all devices to be available before autodetect
> [    5.731069] md: If you don't use raid, use raid=noautodetect
> [    5.731906] md: Autodetecting RAID arrays.
> [    5.732788] md: autorun ...
> [    5.733570] md: ... autorun DONE.
> [    5.734778] EXT4-fs (sda6): mounting ext3 file system using the ext4 subsystem
> [    5.858098] usb 3-1: new low-speed USB device number 2 using xhci_hcd
> [    5.944216] EXT4-fs (sda6): mounted filesystem with ordered data mode. Quota mode: none.
> [    5.947142] VFS: Mounted root (ext3 filesystem) readonly on device 8:6.
> [    5.974400] devtmpfs: mounted
> [    5.979063] Freeing unused decrypted memory: 2036K
> [    5.981577] Freeing unused kernel image (initmem) memory: 1884K
> [    5.984103] Write protecting the kernel read-only data: 34816k
> [    5.987251] Freeing unused kernel image (text/rodata gap) memory: 2032K
> [    5.989400] Freeing unused kernel image (rodata/data gap) memory: 848K
> [    5.991963] rodata_test: all tests were successful
> [    5.993655] Run /sbin/init as init process
> [    5.995954]   with arguments:
> [    5.997654]     /sbin/init
> [    5.999870]   with environment:
> [    6.002164]     HOME=/
> [    6.002969]     TERM=linux
> [    6.003676]     BOOT_IMAGE=bzImage
> [    6.023412] usb 3-1: New USB device found, idVendor=046d, idProduct=c216, bcdDevice= 3.00
> [    6.024229] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    6.024908] usb 3-1: Product: Logitech Dual Action
> [    6.025617] usb 3-1: Manufacturer: Logitech
> [    6.067477] input: Logitech Logitech Dual Action as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-1/3-1:1.0/0003:046D:C216.0001/input/input13
> [    6.069603] logitech 0003:046D:C216.0001: input,hidraw0: USB HID v1.10 Joystick [Logitech Logitech Dual Action] on usb-0000:08:00.3-1/input0
> [    6.185112] usb 3-2: new low-speed USB device number 3 using xhci_hcd
> [    6.350343] usb 3-2: New USB device found, idVendor=03f0, idProduct=2a41, bcdDevice= 1.00
> [    6.352037] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    6.353816] usb 3-2: Product: HP 1000 USB Optical Mouse
> [    6.355470] usb 3-2: Manufacturer: PixArt
> [    6.386800] input: PixArt HP 1000 USB Optical Mouse as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-2/3-2:1.0/0003:03F0:2A41.0002/input/input14
> [    6.390166] hid-generic 0003:03F0:2A41.0002: input,hidraw1: USB HID v1.11 Mouse [PixArt HP 1000 USB Optical Mouse] on usb-0000:08:00.3-2/input0
> [    6.507115] usb 3-3: new low-speed USB device number 4 using xhci_hcd
> [    6.659353] usb 3-3: New USB device found, idVendor=0b38, idProduct=0010, bcdDevice= 1.02
> [    6.661305] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    6.699697] input: HID 0b38:0010 as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.0/0003:0B38:0010.0003/input/input15
> [    6.753282] hid-generic 0003:0B38:0010.0003: input,hidraw2: USB HID v1.10 Keyboard [HID 0b38:0010] on usb-0000:08:00.3-3/input0
> [    6.766784] input: HID 0b38:0010 System Control as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.1/0003:0B38:0010.0004/input/input16
> [    6.820258] input: HID 0b38:0010 Consumer Control as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.1/0003:0B38:0010.0004/input/input17
> [    6.823973] hid-generic 0003:0B38:0010.0004: input,hidraw3: USB HID v1.10 Device [HID 0b38:0010] on usb-0000:08:00.3-3/input1
> [    6.941116] usb 3-4: new high-speed USB device number 5 using xhci_hcd
> [    7.213497] usb 3-4: New USB device found, idVendor=07d1, idProduct=3c03, bcdDevice= 0.01
> [    7.215764] usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    7.217995] usb 3-4: Product: 802.11 bg WLAN
> [    7.220212] usb 3-4: Manufacturer: Ralink
> [    7.338224] usb 3-4: reset high-speed USB device number 5 using xhci_hcd
> [    7.800095] ieee80211 phy0: rt2x00_set_chip: Info - Chipset detected - rt: 2573, rf: 0002, rev: 000a
> [    7.803985] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
> [   14.167117] udevd[361]: starting eudev-3.2.11
> [   14.454091] udevd[391]: could not find module by name='rtc_cmos'
> [   16.614867] r8169 0000:03:00.0 eth126: renamed from eth0
> [   16.631390] r8169 0000:03:00.0 eth1: renamed from eth126
> [   19.910357] Adding 1228936k swap on /dev/sda5.  Priority:-2 extents:1 across:1228936k FS
> [   21.038918] EXT4-fs (sda6): re-mounted. Quota mode: none.
> [   30.373581] ieee80211 phy0: rt2x00lib_request_firmware: Info - Loading firmware file 'rt73.bin'
> [   30.373589] ieee80211 phy0: rt2x00lib_request_firmware: Info - Firmware detected - version: 1.7
> [   46.104109] Generic FE-GE Realtek PHY r8169-0-300:00: attached PHY driver (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
> [   46.268209] r8169 0000:03:00.0 eth1: Link is Down
> [   62.603310] wlan0: authenticate with e0:60:66:f0:2f:93
> [   62.621465] wlan0: send auth to e0:60:66:f0:2f:93 (try 1/3)
> [   62.623074] wlan0: authenticated
> [   62.624182] wlan0: associate with e0:60:66:f0:2f:93 (try 1/3)
> [   62.627562] wlan0: RX AssocResp from e0:60:66:f0:2f:93 (capab=0x1411 status=0 aid=2)
> [   62.633584] wlan0: associated
> [   62.685750] wlan0: Limiting TX power to 20 (20 - 0) dBm as advertised by e0:60:66:f0:2f:93
> [   62.754379] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [   68.089561] EXT4-fs (sdd1): mounted filesystem with ordered data mode. Quota mode: none.
> [   68.299787] EXT4-fs (sde1): mounted filesystem with ordered data mode. Quota mode: none.
> [  166.136768] amdgpu:
>                 last message was failed ret is 65535
> [  166.136774] amdgpu:
>                 failed to send message 145 ret is 65535
> [  166.136778] amdgpu:
>                 last message was failed ret is 65535
> [  166.136789] amdgpu:
>                 failed to send message 146 ret is 65535
> [  166.136794] amdgpu:
>                 last message was failed ret is 65535
> [  166.136800] amdgpu:
>                 failed to send message 306 ret is 65535
> [  166.136804] amdgpu:
>                 last message was failed ret is 65535
> [  166.136811] amdgpu:
>                 failed to send message 5e ret is 65535
> [  166.136818] amdgpu:
>                 last message was failed ret is 65535
> [  166.136825] amdgpu:
>                 failed to send message 148 ret is 65535
> [  166.136833] amdgpu:
>                 last message was failed ret is 65535
> [  166.136839] amdgpu:
>                 failed to send message 145 ret is 65535
> [  166.136847] amdgpu:
>                 last message was failed ret is 65535
> [  166.136853] amdgpu:
>                 failed to send message 146 ret is 65535
> [  186.139887] [drm:atom_op_jump] *ERROR* atombios stuck in loop for more than 20secs aborting
> [  186.139892] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck executing BFFE (len 62, WS 0, PS 0) @ 0xC01A
> [  186.139894] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck executing AFDE (len 1272, WS 8, PS 8) @ 0xB246
> [  186.389536] ------------[ cut here ]------------
> [  186.389537] WARNING: CPU: 3 PID: 1100 at drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1189 dc_commit_state+0xa67/0xac0
> [  186.389542] Modules linked in:
> [  186.389543] CPU: 3 PID: 1100 Comm: gpm Not tainted 5.17.1+ #221
> [  186.389546] Hardware name: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> [  186.389547] RIP: 0010:dc_commit_state+0xa67/0xac0
> [  186.389549] Code: c0 74 bf 48 8b 78 08 e8 67 b2 e9 ff eb b4 be 03 00 00 00 e8 6b 43 ab ff e9 3f f8 ff ff 80 b8 80 03 00 00 00 0f 84 d5 fd ff ff <0f> 0b e9 ce fd ff ff 48 89 ef e8 0a d0 00 00 48 89 ef e8 e2 8a 77
> [  186.389551] RSP: 0018:ffffb369c209f798 EFLAGS: 00010202
> [  186.389552] RAX: ffff941ec84e8c00 RBX: ffff941ee69e01e8 RCX: 0000000000000003
> [  186.389554] RDX: 0000000000001220 RSI: 0000000000000c7a RDI: 0000009ac0011080
> [  186.389555] RBP: 0000000000000000 R08: ffffb369c209f764 R09: 0000000000000465
> [  186.389556] R10: 0000000000000000 R11: 0000000000001a60 R12: ffff941ee69e0000
> [  186.389556] R13: ffff941ee69e3218 R14: 0000000000000001 R15: ffff941ec3e90000
> [  186.389557] FS:  00007fb3e6356740(0000) GS:ffff9421cecc0000(0000) knlGS:0000000000000000
> [  186.389559] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  186.389560] CR2: 0000563095fa21a8 CR3: 0000000110514000 CR4: 00000000003506e0
> [  186.389561] Call Trace:
> [  186.389562]  <TASK>
> [  186.389564]  amdgpu_dm_atomic_commit_tail+0x55c/0x2690
> [  186.389568]  ? ttm_bo_move_memcpy+0x140/0x210
> [  186.389571]  ? amdgpu_bo_get_metadata+0x41/0x80
> [  186.389574]  ? amdgpu_bo_move+0x26c/0x7f0
> [  186.389575]  ? preempt_count_add+0x68/0xa0
> [  186.389578]  ? _raw_spin_lock+0x13/0x30
> [  186.389581]  ? unmap_mapping_pages+0x60/0x130
> [  186.389583]  ? ttm_bo_handle_move_mem+0x8d/0x190
> [  186.389585]  ? ttm_bo_validate+0xc1/0x130
> [  186.389588]  ? dm_plane_helper_prepare_fb+0x211/0x270
> [  186.389589]  ? drm_atomic_helper_setup_commit+0x1c9/0x800
> [  186.389592]  ? preempt_count_add+0x68/0xa0
> [  186.389593]  ? _raw_spin_lock_irq+0x14/0x2f
> [  186.389595]  ? _raw_spin_unlock_irq+0x13/0x30
> [  186.389596]  ? wait_for_completion_timeout+0xcd/0x100
> [  186.389598]  ? preempt_count_add+0x68/0xa0
> [  186.389599]  ? _raw_spin_lock_irq+0x14/0x2f
> [  186.389601]  commit_tail+0x94/0x120
> [  186.389603]  drm_atomic_helper_commit+0x113/0x140
> [  186.389604]  drm_client_modeset_commit_atomic+0x1e4/0x220
> [  186.389607]  drm_client_modeset_dpms+0x8c/0x210
> [  186.389609]  ? bit_cursor+0x38f/0x5d0
> [  186.389612]  drm_fb_helper_blank+0xf0/0x110
> [  186.389614]  fb_blank+0x57/0xa0
> [  186.389616]  fbcon_blank+0x1d5/0x280
> [  186.389618]  ? preempt_count_add+0x68/0xa0
> [  186.389619]  ? get_nohz_timer_target+0x18/0x1a0
> [  186.389621]  ? lock_timer_base+0x61/0x80
> [  186.389624]  ? preempt_count_add+0x68/0xa0
> [  186.389625]  ? _raw_spin_unlock_irqrestore+0x1b/0x30
> [  186.389627]  ? __mod_timer+0x204/0x3c0
> [  186.389628]  do_unblank_screen+0xaa/0x150
> [  186.389631]  set_selection_kernel+0x42/0x650
> [  186.389633]  set_selection_user+0x41/0x70
> [  186.389634]  tty_ioctl+0x379/0x8a0
> [  186.389636]  ? __do_sys_newfstatat+0x40/0x70
> [  186.389639]  __x64_sys_ioctl+0x82/0xb0
> [  186.389642]  do_syscall_64+0x3b/0x90
> [  186.389644]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  186.389646] RIP: 0033:0x7fb3e646b418
> [  186.389648] Code: 00 00 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 0e 44 89 c0 c3 66 2e 0f 1f 84 00 00 00
> [  186.389649] RSP: 002b:00007ffde61f8da8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  186.389650] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fb3e646b418
> [  186.389651] RDX: 00007ffde61f8db5 RSI: 000000000000541c RDI: 0000000000000006
> [  186.389652] RBP: 0000000000000006 R08: 00000000000000fd R09: 0000000000000003
> [  186.389653] R10: 0000000000001000 R11: 0000000000000246 R12: 000000000041e000
> [  186.389653] R13: 000000000041ddc0 R14: 0000000000000001 R15: 0000000000419738
> [  186.389655]  </TASK>
> [  186.389655] ---[ end trace 0000000000000000 ]---
> [  186.389791] amdgpu:
>                 last message was failed ret is 65535
> [  186.389797] amdgpu:
>                 failed to send message 148 ret is 65535
> [  186.389802] amdgpu:
>                 last message was failed ret is 65535
> [  186.389808] amdgpu:
>                 failed to send message 145 ret is 65535
> [  186.389816] amdgpu:
>                 last message was failed ret is 65535
> [  186.389822] amdgpu:
>                 failed to send message 146 ret is 65535
>
>
> -------
>
> decoded stacktrace:
> [  186.389536] ------------[ cut here ]------------
> [  186.389537] WARNING: CPU: 3 PID: 1100 at drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1189 dc_commit_state+0xa67/0xac0
> [  186.389542] Modules linked in:
> [  186.389546] Hardware name: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> [  186.389547] RIP: dc_commit_state+0xa67/0xac0
> [ 186.389549] Code: c0 74 bf 48 8b 78 08 e8 67 b2 e9 ff eb b4 be 03 00 00 00 e8 6b 43 ab ff e9 3f f8 ff ff 80 b8 80 03 00 00 00 0f 84 d5 fd ff ff <0f> 0b e9 ce fd ff ff 48 89 ef e8 0a d0 00 00 48 89 ef e8 e2 8a 77
> All code
> ========
>    0:   c0 74 bf 48 8b          shlb   $0x8b,0x48(%rdi,%rdi,4)
>    5:   78 08                   js     0xf
>    7:   e8 67 b2 e9 ff          call   0xffffffffffe9b273
>    c:   eb b4                   jmp    0xffffffffffffffc2
>    e:   be 03 00 00 00          mov    $0x3,%esi
>   13:   e8 6b 43 ab ff          call   0xffffffffffab4383
>   18:   e9 3f f8 ff ff          jmp    0xfffffffffffff85c
>   1d:   80 b8 80 03 00 00 00    cmpb   $0x0,0x380(%rax)
>   24:   0f 84 d5 fd ff ff       je     0xfffffffffffffdff
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   e9 ce fd ff ff          jmp    0xfffffffffffffdff
>   31:   48 89 ef                mov    %rbp,%rdi
>   34:   e8 0a d0 00 00          call   0xd043
>   39:   48 89 ef                mov    %rbp,%rdi
>   3c:   e8                      .byte 0xe8
>   3d:   e2 8a                   loop   0xffffffffffffffc9
>   3f:   77                      .byte 0x77
>
> Code starting with the faulting instruction
> ===========================================
>    0:   0f 0b                   ud2
>    2:   e9 ce fd ff ff          jmp    0xfffffffffffffdd5
>    7:   48 89 ef                mov    %rbp,%rdi
>    a:   e8 0a d0 00 00          call   0xd019
>    f:   48 89 ef                mov    %rbp,%rdi
>   12:   e8                      .byte 0xe8
>   13:   e2 8a                   loop   0xffffffffffffff9f
>   15:   77                      .byte 0x77
> [  186.389551] RSP: 0018:ffffb369c209f798 EFLAGS: 00010202
> [  186.389552] RAX: ffff941ec84e8c00 RBX: ffff941ee69e01e8 RCX: 0000000000000003
> [  186.389554] RDX: 0000000000001220 RSI: 0000000000000c7a RDI: 0000009ac0011080
> [  186.389555] RBP: 0000000000000000 R08: ffffb369c209f764 R09: 0000000000000465
> [  186.389556] R10: 0000000000000000 R11: 0000000000001a60 R12: ffff941ee69e0000
> [  186.389556] R13: ffff941ee69e3218 R14: 0000000000000001 R15: ffff941ec3e90000
> [  186.389557] FS:  00007fb3e6356740(0000) GS:ffff9421cecc0000(0000) knlGS:0000000000000000
> [  186.389559] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  186.389560] CR2: 0000563095fa21a8 CR3: 0000000110514000 CR4: 00000000003506e0
> [  186.389561] Call Trace:
> [  186.389562]  <TASK>
> [  186.389564] amdgpu_dm_atomic_commit_tail+0x55c/0x2690
> [  186.389568] ? ttm_bo_move_memcpy+0x140/0x210
> [  186.389571] ? amdgpu_bo_get_metadata+0x41/0x80
> [  186.389574] ? amdgpu_bo_move+0x26c/0x7f0
> [  186.389575] ? preempt_count_add+0x68/0xa0
> [  186.389578] ? _raw_spin_lock+0x13/0x30
> [  186.389581] ? unmap_mapping_pages+0x60/0x130
> [  186.389583] ? ttm_bo_handle_move_mem+0x8d/0x190
> [  186.389585] ? ttm_bo_validate+0xc1/0x130
> [  186.389588] ? dm_plane_helper_prepare_fb+0x211/0x270
> [  186.389589] ? drm_atomic_helper_setup_commit+0x1c9/0x800
> [  186.389592] ? preempt_count_add+0x68/0xa0
> [  186.389593] ? _raw_spin_lock_irq+0x14/0x2f
> [  186.389595] ? _raw_spin_unlock_irq+0x13/0x30
> [  186.389596] ? wait_for_completion_timeout+0xcd/0x100
> [  186.389598] ? preempt_count_add+0x68/0xa0
> [  186.389599] ? _raw_spin_lock_irq+0x14/0x2f
> [  186.389601] commit_tail+0x94/0x120
> [  186.389603] drm_atomic_helper_commit+0x113/0x140
> [  186.389604] drm_client_modeset_commit_atomic+0x1e4/0x220
> [  186.389607] drm_client_modeset_dpms+0x8c/0x210
> [  186.389609] ? bit_cursor+0x38f/0x5d0
> [  186.389612] drm_fb_helper_blank+0xf0/0x110
> [  186.389614] fb_blank+0x57/0xa0
> [  186.389616] fbcon_blank+0x1d5/0x280
> [  186.389618] ? preempt_count_add+0x68/0xa0
> [  186.389619] ? get_nohz_timer_target+0x18/0x1a0
> [  186.389621] ? lock_timer_base+0x61/0x80
> [  186.389624] ? preempt_count_add+0x68/0xa0
> [  186.389625] ? _raw_spin_unlock_irqrestore+0x1b/0x30
> [  186.389627] ? __mod_timer+0x204/0x3c0
> [  186.389628] do_unblank_screen+0xaa/0x150
> [  186.389631] set_selection_kernel+0x42/0x650
> [  186.389633] set_selection_user+0x41/0x70
> [  186.389634] tty_ioctl+0x379/0x8a0
> [  186.389636] ? __do_sys_newfstatat+0x40/0x70
> [  186.389639] __x64_sys_ioctl+0x82/0xb0
> [  186.389642] do_syscall_64+0x3b/0x90
> [  186.389644] entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  186.389646] RIP: 0033:0x7fb3e646b418
> [ 186.389648] Code: 00 00 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 0e 44 89 c0 c3 66 2e 0f 1f 84 00 00 00
> All code
> ========
>    0:   00 00                   add    %al,(%rax)
>    2:   48 8d 44 24 08          lea    0x8(%rsp),%rax
>    7:   48 89 54 24 e0          mov    %rdx,-0x20(%rsp)
>    c:   48 89 44 24 c0          mov    %rax,-0x40(%rsp)
>   11:   48 8d 44 24 d0          lea    -0x30(%rsp),%rax
>   16:   48 89 44 24 c8          mov    %rax,-0x38(%rsp)
>   1b:   b8 10 00 00 00          mov    $0x10,%eax
>   20:   c7 44 24 b8 10 00 00    movl   $0x10,-0x48(%rsp)
>   27:   00
>   28:   0f 05                   syscall
>   2a:*  41 89 c0                mov    %eax,%r8d                <-- trapping instruction
>   2d:   3d 00 f0 ff ff          cmp    $0xfffff000,%eax
>   32:   77 0e                   ja     0x42
>   34:   44 89 c0                mov    %r8d,%eax
>   37:   c3                      ret
>   38:   66                      data16
>   39:   2e                      cs
>   3a:   0f                      .byte 0xf
>   3b:   1f                      (bad)
>   3c:   84 00                   test   %al,(%rax)
>         ...
>
> Code starting with the faulting instruction
> ===========================================
>    0:   41 89 c0                mov    %eax,%r8d
>    3:   3d 00 f0 ff ff          cmp    $0xfffff000,%eax
>    8:   77 0e                   ja     0x18
>    a:   44 89 c0                mov    %r8d,%eax
>    d:   c3                      ret
>    e:   66                      data16
>    f:   2e                      cs
>   10:   0f                      .byte 0xf
>   11:   1f                      (bad)
>   12:   84 00                   test   %al,(%rax)
>         ...
> [  186.389649] RSP: 002b:00007ffde61f8da8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  186.389650] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fb3e646b418
> [  186.389651] RDX: 00007ffde61f8db5 RSI: 000000000000541c RDI: 0000000000000006
> [  186.389652] RBP: 0000000000000006 R08: 00000000000000fd R09: 0000000000000003
> [  186.389653] R10: 0000000000001000 R11: 0000000000000246 R12: 000000000041e000
> [  186.389653] R13: 000000000041ddc0 R14: 0000000000000001 R15: 0000000000419738
> [  186.389655]  </TASK>
> [  186.389655] ---[ end trace 0000000000000000 ]---
>
> -------
>
> Thanks,
>     Michele Ballabio

--000000000000866e4b05dc8d271f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-don-t-runtime-suspend-if-there-are-displa.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-don-t-runtime-suspend-if-there-are-displa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l1xw6c090>
X-Attachment-Id: f_l1xw6c090

RnJvbSBiYWZmZGQ5MzQ3ZDdkNzBhY2E3MGI1MmM5ZjA5ZmE5YzM2N2ZjMDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjggRGVjIDIwMjEgMTc6MjY6MjQgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBkb24ndCBydW50aW1lIHN1c3BlbmQgaWYgdGhlcmUgYXJlIGRpc3BsYXlz
CiBhdHRhY2hlZCAodjIpCgpXZSBub3JtYWxseSBydW50aW1lIHN1c3BlbmQgd2hlbiB0aGVyZSBh
cmUgZGlzcGxheXMgYXR0YWNoZWQgaWYgdGhleQphcmUgaW4gdGhlIERQTVMgb2ZmIHN0YXRlLCBo
b3dldmVyLCBpZiBzb21ldGhpbmcgd2FrZXMgdGhlIEdQVQp3ZSBzZW5kIGEgaG90cGx1ZyBldmVu
dCBvbiByZXN1bWUgKGluIGNhc2UgYW55IGRpc3BsYXlzIHdlcmUgY29ubmVjdGVkCndoaWxlIHRo
ZSBHUFUgd2FzIGluIHN1c3BlbmQpIHdoaWNoIGNhbiBjYXVzZSB1c2Vyc3BhY2UgdG8gbGlnaHQK
dXAgdGhlIGRpc3BsYXlzIGFnYWluIHNvb24gYWZ0ZXIgdGhleSB3ZXJlIHR1cm5lZCBvZmYuCgpQ
cmlvciB0bwpjb21taXQgMDg3NDUxZjM3MmJmNzYgKCJkcm0vYW1kZ3B1OiB1c2UgZ2VuZXJpYyBm
YiBoZWxwZXJzIGluc3RlYWQgb2Ygc2V0dGluZyB1cCBBTUQgb3duJ3MuIiksCnRoZSBkcml2ZXIg
dG9vayBhIHJ1bnRpbWUgcG0gcmVmZXJlbmNlIHdoZW4gdGhlIGZiZGV2IGVtdWxhdGlvbiB3YXMK
ZW5hYmxlZCBiZWNhdXNlIHdlIGRpZG4ndCBpbXBsZW1lbnQgcHJvcGVyIHNoYWRvd2luZyBzdXBw
b3J0IGZvcgp2cmFtIGFjY2VzcyB3aGVuIHRoZSBkZXZpY2Ugd2FzIG9mZiBzbyB0aGUgZGV2aWNl
IG5ldmVyIHJ1bnRpbWUKc3VzcGVuZGVkIHdoZW4gdGhlcmUgd2FzIGEgY29uc29sZSBib3VuZC4g
IE9uY2UgdGhhdCBjb21taXQgbGFuZGVkLAp3ZSBub3cgdXRpbGl6ZSB0aGUgY29yZSBmYiBoZWxw
ZXIgaW1wbGVtZW50YXRpb24gd2hpY2ggcHJvcGVybHkKaGFuZGxlcyB0aGUgZW11bGF0aW9uLCBz
byBydW50aW1lIHBtIG5vdyBzdXNwZW5kcyBpbiBjYXNlcyB3aGVyZSBpdCBkaWQKbm90IGJlZm9y
ZS4gIFVsdGltYXRlbHksIHdlIG5lZWQgdG8gc29ydCBvdXQgd2h5IHJ1bnRpbWUgc3VzcGVuZCBp
biBub3QKd29ya2luZyBpbiB0aGlzIGNhc2UgZm9yIHNvbWUgdXNlcnMsIGJ1dCB0aGlzIHNob3Vs
ZCByZXN0b3JlIHNpbWlsYXIKYmVoYXZpb3IgdG8gYmVmb3JlLgoKdjI6IG1vdmUgY2hlY2sgaW50
byBydW50aW1lX3N1c3BlbmQKCkZpeGVzOiAwODc0NTFmMzcyYmY3NiAoImRybS9hbWRncHU6IHVz
ZSBnZW5lcmljIGZiIGhlbHBlcnMgaW5zdGVhZCBvZiBzZXR0aW5nIHVwIEFNRCBvd24ncy4iKQpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTA3ICsrKysrKysr
KysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDM1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA0
ZWZhYTE4M2FiY2QuLjk3YTFhYTAyZDc2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwpAQCAtMjM5NSw2ICsyMzk1LDcxIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3Bz
X3Jlc3RvcmUoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiBhbWRncHVfZGV2aWNlX3Jlc3Vt
ZShkcm1fZGV2LCB0cnVlKTsKIH0KIAorc3RhdGljIGludCBhbWRncHVfcnVudGltZV9pZGxlX2No
ZWNrX2Rpc3BsYXkoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2RldihkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dl
dF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2Fk
ZXYoZHJtX2Rldik7CisKKwlpZiAoYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjKSB7CisJCXN0cnVj
dCBkcm1fY29ubmVjdG9yICpsaXN0X2Nvbm5lY3RvcjsKKwkJc3RydWN0IGRybV9jb25uZWN0b3Jf
bGlzdF9pdGVyIGl0ZXI7CisJCWludCByZXQgPSAwOworCisJCS8qIFhYWDogUmV0dXJuIGJ1c3kg
aWYgYW55IGRpc3BsYXlzIGFyZSBjb25uZWN0ZWQgdG8gYXZvaWQKKwkJICogcG9zc2libGUgZGlz
cGxheSB3YWtlIHVwcyBhZnRlciBydW50aW1lIHJlc3VtZSBkdWUgdG8KKwkJICogaG90cGx1ZyBl
dmVudHMgaW4gY2FzZSBhbnkgZGlzcGxheXMgd2VyZSBjb25uZWN0ZWQgd2hpbGUKKwkJICogdGhl
IEdQVSB3YXMgaW4gc3VzcGVuZC4gIFJlbW92ZSB0aGlzIG9uY2UgdGhhdCBpcyBmaXhlZC4KKwkJ
ICovCisJCW11dGV4X2xvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11dGV4KTsKKwkJZHJtX2Nv
bm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZHJtX2RldiwgJml0ZXIpOworCQlkcm1fZm9yX2VhY2hf
Y29ubmVjdG9yX2l0ZXIobGlzdF9jb25uZWN0b3IsICZpdGVyKSB7CisJCQlpZiAobGlzdF9jb25u
ZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZCkgeworCQkJCXJldCA9
IC1FQlVTWTsKKwkJCQlicmVhazsKKwkJCX0KKwkJfQorCQlkcm1fY29ubmVjdG9yX2xpc3RfaXRl
cl9lbmQoJml0ZXIpOworCQltdXRleF91bmxvY2soJmRybV9kZXYtPm1vZGVfY29uZmlnLm11dGV4
KTsKKworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQlpZiAoYW1kZ3B1X2RldmljZV9o
YXNfZGNfc3VwcG9ydChhZGV2KSkgeworCQkJc3RydWN0IGRybV9jcnRjICpjcnRjOworCisJCQlk
cm1fZm9yX2VhY2hfY3J0YyhjcnRjLCBkcm1fZGV2KSB7CisJCQkJZHJtX21vZGVzZXRfbG9jaygm
Y3J0Yy0+bXV0ZXgsIE5VTEwpOworCQkJCWlmIChjcnRjLT5zdGF0ZS0+YWN0aXZlKQorCQkJCQly
ZXQgPSAtRUJVU1k7CisJCQkJZHJtX21vZGVzZXRfdW5sb2NrKCZjcnRjLT5tdXRleCk7CisJCQkJ
aWYgKHJldCA8IDApCisJCQkJCWJyZWFrOworCQkJfQorCQl9IGVsc2UgeworCQkJbXV0ZXhfbG9j
aygmZHJtX2Rldi0+bW9kZV9jb25maWcubXV0ZXgpOworCQkJZHJtX21vZGVzZXRfbG9jaygmZHJt
X2Rldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCwgTlVMTCk7CisKKwkJCWRybV9jb25u
ZWN0b3JfbGlzdF9pdGVyX2JlZ2luKGRybV9kZXYsICZpdGVyKTsKKwkJCWRybV9mb3JfZWFjaF9j
b25uZWN0b3JfaXRlcihsaXN0X2Nvbm5lY3RvciwgJml0ZXIpIHsKKwkJCQlpZiAobGlzdF9jb25u
ZWN0b3ItPmRwbXMgPT0gIERSTV9NT0RFX0RQTVNfT04pIHsKKwkJCQkJcmV0ID0gLUVCVVNZOwor
CQkJCQlicmVhazsKKwkJCQl9CisJCQl9CisKKwkJCWRybV9jb25uZWN0b3JfbGlzdF9pdGVyX2Vu
ZCgmaXRlcik7CisKKwkJCWRybV9tb2Rlc2V0X3VubG9jaygmZHJtX2Rldi0+bW9kZV9jb25maWcu
Y29ubmVjdGlvbl9tdXRleCk7CisJCQltdXRleF91bmxvY2soJmRybV9kZXYtPm1vZGVfY29uZmln
Lm11dGV4KTsKKwkJfQorCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4g
MDsKK30KKwogc3RhdGljIGludCBhbWRncHVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
QEAgLTI0MDcsNiArMjQ3MiwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19ydW50aW1lX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCQlyZXR1cm4gLUVCVVNZOwogCX0KIAorCXJldCA9
IGFtZGdwdV9ydW50aW1lX2lkbGVfY2hlY2tfZGlzcGxheShkZXYpOworCWlmIChyZXQpCisJCXJl
dHVybiByZXQ7CisKIAkvKiB3YWl0IGZvciBhbGwgcmluZ3MgdG8gZHJhaW4gYmVmb3JlIHN1c3Bl
bmRpbmcgKi8KIAlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgaSsrKSB7CiAJCXN0
cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFkZXYtPnJpbmdzW2ldOwpAQCAtMjUxNiw0MSArMjU4
NSw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJCXJldHVybiAtRUJVU1k7CiAJfQogCi0JaWYgKGFtZGdwdV9kZXZpY2VfaGFzX2Rj
X3N1cHBvcnQoYWRldikpIHsKLQkJc3RydWN0IGRybV9jcnRjICpjcnRjOwotCi0JCWRybV9mb3Jf
ZWFjaF9jcnRjKGNydGMsIGRybV9kZXYpIHsKLQkJCWRybV9tb2Rlc2V0X2xvY2soJmNydGMtPm11
dGV4LCBOVUxMKTsKLQkJCWlmIChjcnRjLT5zdGF0ZS0+YWN0aXZlKQotCQkJCXJldCA9IC1FQlVT
WTsKLQkJCWRybV9tb2Rlc2V0X3VubG9jaygmY3J0Yy0+bXV0ZXgpOwotCQkJaWYgKHJldCA8IDAp
Ci0JCQkJYnJlYWs7Ci0JCX0KLQotCX0gZWxzZSB7Ci0JCXN0cnVjdCBkcm1fY29ubmVjdG9yICps
aXN0X2Nvbm5lY3RvcjsKLQkJc3RydWN0IGRybV9jb25uZWN0b3JfbGlzdF9pdGVyIGl0ZXI7Ci0K
LQkJbXV0ZXhfbG9jaygmZHJtX2Rldi0+bW9kZV9jb25maWcubXV0ZXgpOwotCQlkcm1fbW9kZXNl
dF9sb2NrKCZkcm1fZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4LCBOVUxMKTsKLQot
CQlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihkcm1fZGV2LCAmaXRlcik7Ci0JCWRybV9m
b3JfZWFjaF9jb25uZWN0b3JfaXRlcihsaXN0X2Nvbm5lY3RvciwgJml0ZXIpIHsKLQkJCWlmIChs
aXN0X2Nvbm5lY3Rvci0+ZHBtcyA9PSAgRFJNX01PREVfRFBNU19PTikgewotCQkJCXJldCA9IC1F
QlVTWTsKLQkJCQlicmVhazsKLQkJCX0KLQkJfQotCi0JCWRybV9jb25uZWN0b3JfbGlzdF9pdGVy
X2VuZCgmaXRlcik7Ci0KLQkJZHJtX21vZGVzZXRfdW5sb2NrKCZkcm1fZGV2LT5tb2RlX2NvbmZp
Zy5jb25uZWN0aW9uX211dGV4KTsKLQkJbXV0ZXhfdW5sb2NrKCZkcm1fZGV2LT5tb2RlX2NvbmZp
Zy5tdXRleCk7Ci0JfQotCi0JaWYgKHJldCA9PSAtRUJVU1kpCi0JCURSTV9ERUJVR19EUklWRVIo
ImZhaWxpbmcgdG8gcG93ZXIgb2ZmIC0gY3J0YyBhY3RpdmVcbiIpOworCXJldCA9IGFtZGdwdV9y
dW50aW1lX2lkbGVfY2hlY2tfZGlzcGxheShkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7
CiAKIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGRldik7CiAJcG1fcnVudGltZV9hdXRvc3Vz
cGVuZChkZXYpOwotLSAKMi4zNS4xCgo=
--000000000000866e4b05dc8d271f--
