Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98534F0FE4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F4610E733;
	Mon,  4 Apr 2022 07:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FAC10E733;
 Mon,  4 Apr 2022 07:17:46 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nbGy7-0001oj-Et; Mon, 04 Apr 2022 09:17:43 +0200
Message-ID: <eb5d7666-068b-6e97-d952-52130e343f54@leemhuis.info>
Date: Mon, 4 Apr 2022 09:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
References: <20220403132322.51c90903@darkstar.example.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: AMDGPU: regression on 5.17.1
In-Reply-To: <20220403132322.51c90903@darkstar.example.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1649056666;
 ec45536c; 
X-HE-SMSGID: 1nbGy7-0001oj-Et
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Michele Ballabio <ballabio.m@gmail.com>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker.

On 03.04.22 13:23, Michele Ballabio wrote:
> Hi,
> 	I've hit a regression on 5.17.1 (haven't tested 5.17.0, but
> 5.16-stable didn't have this problem).
> 
> The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> 
> The regression I hit seems to trigger when the machine is left
> idle at boot (I don't boot straight to X, I boot to a tty, login and then
> start X). The machine after a while blanks the screen. Usually, the screen
> unblanks as the keyboard is hit or the mouse moves, but with kernel 5.17.1
> the screen does not wake up. The machine seems to run mostly fine: I can
> login from ssh, but I cannot reboot or halt it: a sysrq sequence is needed
> for that. Note that if the screen goes blank under X, it wakes up fine.
>
> Below a dmesg and two traces from syslog (they're quite similar).

Thanks for the report. Adding the amdgpu maintainers to the list of
recipients.

Anyway, to be sure below issue doesn't fall through the cracks
unnoticed, I'm adding it to regzbot, my Linux kernel regression tracking
bot:

#regzbot ^introduced v5.16..v5.17
#regzbot title drm: amdgpu: atombios stuck in loop for more than 20secs
aborting
#regzbot ignore-activity

If it turns out this isn't a regression, free free to remove it from the
tracking by sending a reply to this thread containing a paragraph like
"#regzbot invalid: reason why this is invalid" (without the quotes).

Reminder for developers: when fixing the issue, please add a 'Link:'
tags pointing to the report (the mail quoted above) using
lore.kernel.org/r/, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. Regzbot needs them to
automatically connect reports with fixes, but they are useful in
general, too.

I'm sending this to everyone that got the initial report, to make
everyone aware of the tracking. I also hope that messages like this
motivate people to directly get at least the regression mailing list and
ideally even regzbot involved when dealing with regressions, as messages
like this wouldn't be needed then. And don't worry, if I need to send
other mails regarding this regression only relevant for regzbot I'll
send them to the regressions lists only (with a tag in the subject so
people can filter them away). With a bit of luck no such messages will
be needed anyway.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.


> dmesg:
> ----------
> [    0.000000] Linux version 5.17.1 (root@darkstar.example.org) (gcc (GCC) 11.2.0, GNU ld version 2.38-slack151) #1 SMP PREEMPT Thu Mar 31 18:20:46 CEST 2022
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
> [    0.000000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 16317808K/16710468K available (14346K kernel code, 2837K rwdata, 5032K rodata, 1668K init, 3176K bss, 392400K reserved, 0K cma-reserved)
> [    0.000000] random: get_random_u64 called from __kmem_cache_create+0x28/0x530 with crng_init=0
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
> [    0.000000] ftrace: allocating 44802 entries in 176 pages
> [    0.000000] ftrace section at ffffffff83e413e0 sorted properly
> [    0.000000] ftrace: allocated 176 pages with 3 groups
> [    0.000000] Dynamic Preempt: full
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu: 	CONFIG_RCU_FANOUT set to non-default value of 32.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=16.
> [    0.000000] 	Trampoline variant of Tasks RCU enabled.
> [    0.000000] 	Rude variant of Tasks RCU enabled.
> [    0.000000] 	Tracing variant of Tasks RCU enabled.
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
> [    0.007000] tsc: Detected 3193.505 MHz processor
> [    0.000003] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e08529f382, max_idle_ns: 440795326127 ns
> [    0.000079] Calibrating delay loop (skipped), value calculated using timer frequency.. 6387.01 BogoMIPS (lpj=3193505)
> [    0.000155] pid_max: default: 32768 minimum: 301
> [    0.000233] LSM: Security Framework initializing
> [    0.000315] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.000402] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.000655] LVT offset 1 assigned for vector 0xf9
> [    0.000771] LVT offset 2 assigned for vector 0xf4
> [    0.000843] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.001079] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
> [    0.001144] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    0.001214] Spectre V2 : Mitigation: Retpolines
> [    0.001272] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    0.001341] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    0.001411] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    0.002558] Freeing SMP alternatives memory: 44K
> [    0.105257] smpboot: CPU0: AMD Ryzen 5 1600 Six-Core Processor (family: 0x17, model: 0x1, stepping: 0x1)
> [    0.105424] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.105494] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.105566] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.105637] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.105708] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.105774] ... version:                0
> [    0.105831] ... bit width:              48
> [    0.105888] ... generic registers:      6
> [    0.105945] ... value mask:             0000ffffffffffff
> [    0.106004] ... max period:             00007fffffffffff
> [    0.106064] ... fixed-purpose events:   0
> [    0.106078] ... event mask:             000000000000003f
> [    0.106078] rcu: Hierarchical SRCU implementation.
> [    0.106256] smp: Bringing up secondary CPUs ...
> [    0.106377] x86: Booting SMP configuration:
> [    0.106435] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11
> [    0.120097] smp: Brought up 1 node, 12 CPUs
> [    0.120226] smpboot: Max logical packages: 2
> [    0.120285] smpboot: Total of 12 processors activated (76644.12 BogoMIPS)
> [    0.128001] allocated 67108864 bytes of page_ext
> [    0.128288] devtmpfs: initialized
> [    0.128288] x86/mm: Memory block size: 128MB
> [    0.129351] Stack Depot allocating hash table with kvmalloc
> [    0.130541] ACPI: PM: Registering ACPI NVS region [mem 0x04000000-0x04009fff] (40960 bytes)
> [    0.130541] ACPI: PM: Registering ACPI NVS region [mem 0xdaa83000-0xdae3efff] (3915776 bytes)
> [    0.130541] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    0.130541] futex hash table entries: 4096 (order: 6, 262144 bytes, linear)
> [    0.130541] pinctrl core: initialized pinctrl subsystem
> [    0.131281] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.131418] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
> [    0.131486] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.131557] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.131636] audit: initializing netlink subsys (disabled)
> [    0.131702] audit: type=2000 audit(1648976208.138:1): state=initialized audit_enabled=0 res=1
> [    0.131702] thermal_sys: Registered thermal governor 'fair_share'
> [    0.131702] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.132079] thermal_sys: Registered thermal governor 'step_wise'
> [    0.132141] thermal_sys: Registered thermal governor 'user_space'
> [    0.132212] cpuidle: using governor ladder
> [    0.132334] cpuidle: using governor menu
> [    0.132432] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.133118] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
> [    0.133192] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
> [    0.133264] PCI: Using configuration type 1 for base access
> [    0.134808] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.134808] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.135101] cryptd: max_cpu_qlen set to 1000
> [    0.135187] raid6: skipped pq benchmark and selected avx2x4
> [    0.135187] raid6: using avx2x2 recovery algorithm
> [    0.135254] ACPI: Added _OSI(Module Device)
> [    0.135311] ACPI: Added _OSI(Processor Device)
> [    0.135369] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.135428] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.135488] ACPI: Added _OSI(Linux-Dell-Video)
> [    0.135546] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    0.135607] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    0.143886] ACPI: 7 ACPI AML tables successfully acquired and loaded
> [    0.145073] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.147352] ACPI: Interpreter enabled
> [    0.147422] ACPI: PM: (supports S0 S3 S4 S5)
> [    0.147480] ACPI: Using IOAPIC for interrupt routing
> [    0.147814] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.148123] ACPI: Enabled 4 GPEs in block 00 to 1F
> [    0.163346] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.163414] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    0.163558] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug PME LTR DPC]
> [    0.163763] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
> [    0.163835] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
> [    0.164174] PCI host bridge to bus 0000:00
> [    0.164233] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [    0.164297] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [    0.164361] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [    0.164425] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    0.164489] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
> [    0.164557] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2ffff window]
> [    0.164625] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
> [    0.164694] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.164764] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
> [    0.164892] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
> [    0.165036] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
> [    0.165128] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
> [    0.165361] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
> [    0.165523] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
> [    0.165640] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
> [    0.165742] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
> [    0.165894] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
> [    0.166167] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
> [    0.166287] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
> [    0.166388] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
> [    0.166476] pci 0000:00:07.1: enabling Extended Tags
> [    0.166597] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
> [    0.166750] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
> [    0.167098] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
> [    0.167329] pci 0000:00:08.1: enabling Extended Tags
> [    0.167453] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    0.167646] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    0.167909] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    0.168176] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
> [    0.168266] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
> [    0.168356] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
> [    0.168447] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
> [    0.168536] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
> [    0.168625] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
> [    0.168716] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
> [    0.168807] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
> [    0.168984] pci 0000:01:00.0: [1022:43bb] type 00 class 0x0c0330
> [    0.169060] pci 0000:01:00.0: reg 0x10: [mem 0xfe7a0000-0xfe7a7fff 64bit]
> [    0.169156] pci 0000:01:00.0: PME# supported from D3hot D3cold
> [    0.169308] pci 0000:01:00.1: [1022:43b7] type 00 class 0x010601
> [    0.169410] pci 0000:01:00.1: reg 0x24: [mem 0xfe780000-0xfe79ffff]
> [    0.169478] pci 0000:01:00.1: reg 0x30: [mem 0xfe700000-0xfe77ffff pref]
> [    0.169579] pci 0000:01:00.1: PME# supported from D3hot D3cold
> [    0.169706] pci 0000:01:00.2: [1022:43b2] type 01 class 0x060400
> [    0.169842] pci 0000:01:00.2: PME# supported from D3hot D3cold
> [    0.169992] pci 0000:00:01.3: PCI bridge to [bus 01-06]
> [    0.170081] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
> [    0.170143] pci 0000:00:01.3:   bridge window [mem 0xfe600000-0xfe7fffff]
> [    0.170284] pci 0000:02:00.0: [1022:43b4] type 01 class 0x060400
> [    0.170435] pci 0000:02:00.0: PME# supported from D3hot D3cold
> [    0.170581] pci 0000:02:01.0: [1022:43b4] type 01 class 0x060400
> [    0.170732] pci 0000:02:01.0: PME# supported from D3hot D3cold
> [    0.170877] pci 0000:02:04.0: [1022:43b4] type 01 class 0x060400
> [    0.171026] pci 0000:02:04.0: PME# supported from D3hot D3cold
> [    0.171171] pci 0000:01:00.2: PCI bridge to [bus 02-06]
> [    0.171235] pci 0000:01:00.2:   bridge window [io  0xf000-0xffff]
> [    0.171298] pci 0000:01:00.2:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.171426] pci 0000:03:00.0: [10ec:8168] type 00 class 0x020000
> [    0.171513] pci 0000:03:00.0: reg 0x10: [io  0xf000-0xf0ff]
> [    0.171608] pci 0000:03:00.0: reg 0x18: [mem 0xfe604000-0xfe604fff 64bit]
> [    0.171693] pci 0000:03:00.0: reg 0x20: [mem 0xfe600000-0xfe603fff 64bit]
> [    0.171897] pci 0000:03:00.0: supports D1 D2
> [    0.171954] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.172236] pci 0000:02:00.0: PCI bridge to [bus 03]
> [    0.172299] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [    0.172362] pci 0000:02:00.0:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.172495] pci 0000:04:00.0: [1b21:1080] type 01 class 0x060400
> [    0.172740] pci 0000:04:00.0: supports D1 D2
> [    0.172797] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.175095] pci 0000:02:01.0: PCI bridge to [bus 04-05]
> [    0.175227] pci_bus 0000:05: extended config space not accessible
> [    0.175385] pci 0000:04:00.0: PCI bridge to [bus 05]
> [    0.175511] pci 0000:02:04.0: PCI bridge to [bus 06]
> [    0.175657] pci 0000:07:00.0: [1002:67ff] type 00 class 0x030000
> [    0.175733] pci 0000:07:00.0: reg 0x10: [mem 0xe0000000-0xefffffff 64bit pref]
> [    0.175810] pci 0000:07:00.0: reg 0x18: [mem 0xf0000000-0xf01fffff 64bit pref]
> [    0.175884] pci 0000:07:00.0: reg 0x20: [io  0xe000-0xe0ff]
> [    0.175950] pci 0000:07:00.0: reg 0x24: [mem 0xfe900000-0xfe93ffff]
> [    0.176018] pci 0000:07:00.0: reg 0x30: [mem 0xfe940000-0xfe95ffff pref]
> [    0.176100] pci 0000:07:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
> [    0.176224] pci 0000:07:00.0: supports D1 D2
> [    0.176282] pci 0000:07:00.0: PME# supported from D1 D2 D3hot D3cold
> [    0.176464] pci 0000:07:00.1: [1002:aae0] type 00 class 0x040300
> [    0.176539] pci 0000:07:00.1: reg 0x10: [mem 0xfe960000-0xfe963fff 64bit]
> [    0.176678] pci 0000:07:00.1: supports D1 D2
> [    0.176801] pci 0000:00:03.1: PCI bridge to [bus 07]
> [    0.176863] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
> [    0.176925] pci 0000:00:03.1:   bridge window [mem 0xfe900000-0xfe9fffff]
> [    0.176991] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.177126] pci 0000:08:00.0: [1022:145a] type 00 class 0x130000
> [    0.177216] pci 0000:08:00.0: enabling Extended Tags
> [    0.177346] pci 0000:08:00.2: [1022:1456] type 00 class 0x108000
> [    0.177420] pci 0000:08:00.2: reg 0x18: [mem 0xfe400000-0xfe4fffff]
> [    0.177493] pci 0000:08:00.2: reg 0x24: [mem 0xfe500000-0xfe501fff]
> [    0.177561] pci 0000:08:00.2: enabling Extended Tags
> [    0.177704] pci 0000:08:00.3: [1022:145c] type 00 class 0x0c0330
> [    0.177774] pci 0000:08:00.3: reg 0x10: [mem 0xfe300000-0xfe3fffff 64bit]
> [    0.178097] pci 0000:08:00.3: enabling Extended Tags
> [    0.178182] pci 0000:08:00.3: PME# supported from D0 D3hot D3cold
> [    0.178309] pci 0000:00:07.1: PCI bridge to [bus 08]
> [    0.178371] pci 0000:00:07.1:   bridge window [mem 0xfe300000-0xfe5fffff]
> [    0.178503] pci 0000:09:00.0: [1022:1455] type 00 class 0x130000
> [    0.178594] pci 0000:09:00.0: enabling Extended Tags
> [    0.178731] pci 0000:09:00.2: [1022:7901] type 00 class 0x010601
> [    0.178817] pci 0000:09:00.2: reg 0x24: [mem 0xfe808000-0xfe808fff]
> [    0.178886] pci 0000:09:00.2: enabling Extended Tags
> [    0.178975] pci 0000:09:00.2: PME# supported from D3hot D3cold
> [    0.179124] pci 0000:09:00.3: [1022:1457] type 00 class 0x040300
> [    0.179193] pci 0000:09:00.3: reg 0x10: [mem 0xfe800000-0xfe807fff]
> [    0.179278] pci 0000:09:00.3: enabling Extended Tags
> [    0.179365] pci 0000:09:00.3: PME# supported from D0 D3hot D3cold
> [    0.179492] pci 0000:00:08.1: PCI bridge to [bus 09]
> [    0.179555] pci 0000:00:08.1:   bridge window [mem 0xfe800000-0xfe8fffff]
> [    0.179924] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    0.180029] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    0.180116] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    0.180223] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    0.180327] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    0.180421] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    0.180516] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    0.180610] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    0.181114] iommu: Default domain type: Translated 
> [    0.181145] iommu: DMA domain TLB invalidation policy: lazy mode 
> [    0.181214] pci 0000:07:00.0: vgaarb: setting as boot VGA device
> [    0.181214] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.181221] pci 0000:07:00.0: vgaarb: bridge control possible
> [    0.181282] vgaarb: loaded
> [    0.181412] SCSI subsystem initialized
> [    0.181476] libata version 3.00 loaded.
> [    0.181476] ACPI: bus type USB registered
> [    0.181476] usbcore: registered new interface driver usbfs
> [    0.181476] usbcore: registered new interface driver hub
> [    0.181476] usbcore: registered new device driver usb
> [    0.182089] pps_core: LinuxPPS API ver. 1 registered
> [    0.182148] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.182220] PTP clock support registered
> [    0.182289] EDAC MC: Ver: 3.0.0
> [    0.183174] PCI: Using ACPI for IRQ routing
> [    0.187538] PCI: pci_cache_line_size set to 64 bytes
> [    0.187653] e820: reserve RAM buffer [mem 0x0009d400-0x0009ffff]
> [    0.187715] e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
> [    0.187778] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
> [    0.187839] e820: reserve RAM buffer [mem 0xd4435000-0xd7ffffff]
> [    0.187900] e820: reserve RAM buffer [mem 0xda831000-0xdbffffff]
> [    0.187962] e820: reserve RAM buffer [mem 0xdaa83000-0xdbffffff]
> [    0.188023] e820: reserve RAM buffer [mem 0xde000000-0xdfffffff]
> [    0.188079] e820: reserve RAM buffer [mem 0x41f380000-0x41fffffff]
> [    0.188146] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    0.188169] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    0.190126] clocksource: Switched to clocksource tsc-early
> [    0.194771] VFS: Disk quotas dquot_6.6.0
> [    0.194840] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.194957] pnp: PnP ACPI init
> [    0.195097] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
> [    0.195212] system 00:01: [mem 0xfeb80000-0xfebfffff] could not be reserved
> [    0.195464] system 00:03: [io  0x0300-0x030f] has been reserved
> [    0.195527] system 00:03: [io  0x0230-0x023f] has been reserved
> [    0.195589] system 00:03: [io  0x0290-0x029f] has been reserved
> [    0.195870] pnp 00:04: [dma 0 disabled]
> [    0.196118] system 00:05: [io  0x04d0-0x04d1] has been reserved
> [    0.196181] system 00:05: [io  0x040b] has been reserved
> [    0.196242] system 00:05: [io  0x04d6] has been reserved
> [    0.196303] system 00:05: [io  0x0c00-0x0c01] has been reserved
> [    0.196364] system 00:05: [io  0x0c14] has been reserved
> [    0.196426] system 00:05: [io  0x0c50-0x0c51] has been reserved
> [    0.196488] system 00:05: [io  0x0c52] has been reserved
> [    0.196548] system 00:05: [io  0x0c6c] has been reserved
> [    0.196608] system 00:05: [io  0x0c6f] has been reserved
> [    0.196669] system 00:05: [io  0x0cd0-0x0cd1] has been reserved
> [    0.196730] system 00:05: [io  0x0cd2-0x0cd3] has been reserved
> [    0.196794] system 00:05: [io  0x0cd4-0x0cd5] has been reserved
> [    0.196856] system 00:05: [io  0x0cd6-0x0cd7] has been reserved
> [    0.196918] system 00:05: [io  0x0cd8-0x0cdf] has been reserved
> [    0.196980] system 00:05: [io  0x0800-0x089f] has been reserved
> [    0.197042] system 00:05: [io  0x0b00-0x0b0f] has been reserved
> [    0.197103] system 00:05: [io  0x0b20-0x0b3f] has been reserved
> [    0.197165] system 00:05: [io  0x0900-0x090f] has been reserved
> [    0.197228] system 00:05: [io  0x0910-0x091f] has been reserved
> [    0.197290] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
> [    0.197354] system 00:05: [mem 0xfec01000-0xfec01fff] could not be reserved
> [    0.197419] system 00:05: [mem 0xfedc0000-0xfedc0fff] has been reserved
> [    0.197482] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
> [    0.197546] system 00:05: [mem 0xfed80000-0xfed8ffff] could not be reserved
> [    0.197610] system 00:05: [mem 0xfec10000-0xfec10fff] has been reserved
> [    0.197673] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
> [    0.198076] pnp: PnP ACPI: found 6 devices
> [    0.203794] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [    0.203908] NET: Registered PF_INET protocol family
> [    0.204161] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.205901] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
> [    0.205988] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.206195] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
> [    0.206384] TCP: Hash tables configured (established 131072 bind 65536)
> [    0.206534] MPTCP token hash table entries: 16384 (order: 6, 393216 bytes, linear)
> [    0.206628] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
> [    0.206721] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
> [    0.206881] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.207020] RPC: Registered named UNIX socket transport module.
> [    0.207082] RPC: Registered udp transport module.
> [    0.207141] RPC: Registered tcp transport module.
> [    0.207199] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.207262] NET: Registered PF_XDP protocol family
> [    0.207333] pci 0000:02:00.0: PCI bridge to [bus 03]
> [    0.207395] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [    0.207461] pci 0000:02:00.0:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.207531] pci 0000:04:00.0: PCI bridge to [bus 05]
> [    0.207609] pci 0000:02:01.0: PCI bridge to [bus 04-05]
> [    0.207677] pci 0000:02:04.0: PCI bridge to [bus 06]
> [    0.207744] pci 0000:01:00.2: PCI bridge to [bus 02-06]
> [    0.207808] pci 0000:01:00.2:   bridge window [io  0xf000-0xffff]
> [    0.207872] pci 0000:01:00.2:   bridge window [mem 0xfe600000-0xfe6fffff]
> [    0.207940] pci 0000:00:01.3: PCI bridge to [bus 01-06]
> [    0.208001] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
> [    0.208064] pci 0000:00:01.3:   bridge window [mem 0xfe600000-0xfe7fffff]
> [    0.208132] pci 0000:00:03.1: PCI bridge to [bus 07]
> [    0.208192] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
> [    0.208255] pci 0000:00:03.1:   bridge window [mem 0xfe900000-0xfe9fffff]
> [    0.208319] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.208390] pci 0000:00:07.1: PCI bridge to [bus 08]
> [    0.208451] pci 0000:00:07.1:   bridge window [mem 0xfe300000-0xfe5fffff]
> [    0.208518] pci 0000:00:08.1: PCI bridge to [bus 09]
> [    0.208579] pci 0000:00:08.1:   bridge window [mem 0xfe800000-0xfe8fffff]
> [    0.208645] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [    0.208708] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [    0.208772] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [    0.208835] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [    0.208897] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
> [    0.208961] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff window]
> [    0.209024] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff window]
> [    0.209088] pci_bus 0000:01: resource 0 [io  0xf000-0xffff]
> [    0.209149] pci_bus 0000:01: resource 1 [mem 0xfe600000-0xfe7fffff]
> [    0.209212] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
> [    0.209273] pci_bus 0000:02: resource 1 [mem 0xfe600000-0xfe6fffff]
> [    0.209335] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
> [    0.209396] pci_bus 0000:03: resource 1 [mem 0xfe600000-0xfe6fffff]
> [    0.209459] pci_bus 0000:07: resource 0 [io  0xe000-0xefff]
> [    0.209520] pci_bus 0000:07: resource 1 [mem 0xfe900000-0xfe9fffff]
> [    0.209582] pci_bus 0000:07: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
> [    0.209650] pci_bus 0000:08: resource 1 [mem 0xfe300000-0xfe5fffff]
> [    0.209713] pci_bus 0000:09: resource 1 [mem 0xfe800000-0xfe8fffff]
> [    0.209951] pci 0000:04:00.0: Disabling ASPM L0s/L1
> [    0.210032] pci 0000:07:00.1: D0 power state depends on 0000:07:00.0
> [    0.210231] PCI: CLS 64 bytes, default 64
> [    0.210297] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
> [    0.210392] pci 0000:00:01.0: Adding to iommu group 0
> [    0.210459] pci 0000:00:01.3: Adding to iommu group 1
> [    0.210528] pci 0000:00:02.0: Adding to iommu group 2
> [    0.210598] pci 0000:00:03.0: Adding to iommu group 3
> [    0.210665] pci 0000:00:03.1: Adding to iommu group 4
> [    0.210733] pci 0000:00:04.0: Adding to iommu group 5
> [    0.210805] pci 0000:00:07.0: Adding to iommu group 6
> [    0.210872] pci 0000:00:07.1: Adding to iommu group 7
> [    0.210941] pci 0000:00:08.0: Adding to iommu group 8
> [    0.211008] pci 0000:00:08.1: Adding to iommu group 9
> [    0.211080] pci 0000:00:14.0: Adding to iommu group 10
> [    0.211146] pci 0000:00:14.3: Adding to iommu group 10
> [    0.211233] pci 0000:00:18.0: Adding to iommu group 11
> [    0.211301] pci 0000:00:18.1: Adding to iommu group 11
> [    0.211367] pci 0000:00:18.2: Adding to iommu group 11
> [    0.211433] pci 0000:00:18.3: Adding to iommu group 11
> [    0.211499] pci 0000:00:18.4: Adding to iommu group 11
> [    0.211564] pci 0000:00:18.5: Adding to iommu group 11
> [    0.211630] pci 0000:00:18.6: Adding to iommu group 11
> [    0.211696] pci 0000:00:18.7: Adding to iommu group 11
> [    0.211773] pci 0000:01:00.0: Adding to iommu group 12
> [    0.211840] pci 0000:01:00.1: Adding to iommu group 12
> [    0.211907] pci 0000:01:00.2: Adding to iommu group 12
> [    0.211970] pci 0000:02:00.0: Adding to iommu group 12
> [    0.212032] pci 0000:02:01.0: Adding to iommu group 12
> [    0.212094] pci 0000:02:04.0: Adding to iommu group 12
> [    0.212157] pci 0000:03:00.0: Adding to iommu group 12
> [    0.212218] pci 0000:04:00.0: Adding to iommu group 12
> [    0.212299] pci 0000:07:00.0: Adding to iommu group 13
> [    0.212366] pci 0000:07:00.1: Adding to iommu group 13
> [    0.212435] pci 0000:08:00.0: Adding to iommu group 14
> [    0.212504] pci 0000:08:00.2: Adding to iommu group 15
> [    0.212572] pci 0000:08:00.3: Adding to iommu group 16
> [    0.212640] pci 0000:09:00.0: Adding to iommu group 17
> [    0.212707] pci 0000:09:00.2: Adding to iommu group 18
> [    0.212785] pci 0000:09:00.3: Adding to iommu group 19
> [    0.214929] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    0.214994] AMD-Vi: Extended features (0xf77ef22294ada): PPR NX GT IA GA PC GA_vAPIC
> [    0.215066] AMD-Vi: Interrupt remapping enabled
> [    0.215124] AMD-Vi: Virtual APIC enabled
> [    0.215281] software IO TLB: tearing down default memory pool
> [    0.216482] amd_uncore: 4  amd_df counters detected
> [    0.216544] amd_uncore: 6  amd_l3 counters detected
> [    0.216775] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    0.218007] Initialise system trusted keyrings
> [    0.218073] Key type blacklist registered
> [    0.218163] workingset: timestamp_bits=40 max_order=22 bucket_order=0
> [    0.219112] zbud: loaded
> [    0.219454] NFS: Registering the id_resolver key type
> [    0.219516] Key type id_resolver registered
> [    0.219574] Key type id_legacy registered
> [    0.219641] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [    0.219705] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [    0.219780] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [    0.228685] xor: automatically using best checksumming function   avx       
> [    0.228750] async_tx: api initialized (async)
> [    0.228810] Key type asymmetric registered
> [    0.230531] Asymmetric key parser 'x509' registered
> [    0.230868] alg: self-tests for CTR-KDF (hmac(sha256)) passed
> [    0.230938] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
> [    0.231038] io scheduler mq-deadline registered
> [    0.231272] atomic64_test: passed for x86-64 platform with CX8 and with SSE
> [    0.233208] pcieport 0000:00:01.3: AER: enabled with IRQ 26
> [    0.233471] pcieport 0000:00:03.1: AER: enabled with IRQ 27
> [    0.233731] pcieport 0000:00:07.1: AER: enabled with IRQ 28
> [    0.234378] pcieport 0000:00:08.1: AER: enabled with IRQ 30
> [    0.235021] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.235089] ACPI: \_PR_.P000: Found 2 idle states
> [    0.235235] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.235303] ACPI: \_PR_.P001: Found 2 idle states
> [    0.235448] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.235516] ACPI: \_PR_.P002: Found 2 idle states
> [    0.235658] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.235726] ACPI: \_PR_.P003: Found 2 idle states
> [    0.235876] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.235946] ACPI: \_PR_.P004: Found 2 idle states
> [    0.236084] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.236152] ACPI: \_PR_.P005: Found 2 idle states
> [    0.236267] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.236339] ACPI: \_PR_.P006: Found 2 idle states
> [    0.236484] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.236554] ACPI: \_PR_.P007: Found 2 idle states
> [    0.236696] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.236767] ACPI: \_PR_.P008: Found 2 idle states
> [    0.236892] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.236964] ACPI: \_PR_.P009: Found 2 idle states
> [    0.237107] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.237177] ACPI: \_PR_.P00A: Found 2 idle states
> [    0.237297] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
> [    0.237368] ACPI: \_PR_.P00B: Found 2 idle states
> [    0.238428] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.238562] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [    0.240934] brd: module loaded
> [    0.241192] ahci 0000:01:00.1: version 3.0
> [    0.241335] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
> [    0.241430] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x33 impl SATA mode
> [    0.241502] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
> [    0.241953] scsi host0: ahci
> [    0.242103] scsi host1: ahci
> [    0.242239] scsi host2: ahci
> [    0.242367] scsi host3: ahci
> [    0.242493] scsi host4: ahci
> [    0.242619] scsi host5: ahci
> [    0.242746] scsi host6: ahci
> [    0.242875] scsi host7: ahci
> [    0.242952] ata1: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780100 irq 37
> [    0.243022] ata2: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780180 irq 37
> [    0.243090] ata3: DUMMY
> [    0.243144] ata4: DUMMY
> [    0.243201] ata5: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780300 irq 37
> [    0.243269] ata6: SATA max UDMA/133 abar m131072@0xfe780000 port 0xfe780380 irq 37
> [    0.243342] ata7: DUMMY
> [    0.243396] ata8: DUMMY
> [    0.243718] ahci 0000:09:00.2: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0xc impl SATA mode
> [    0.243794] ahci 0000:09:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
> [    0.244098] scsi host8: ahci
> [    0.244226] scsi host9: ahci
> [    0.244355] scsi host10: ahci
> [    0.244485] scsi host11: ahci
> [    0.244566] ata9: DUMMY
> [    0.244621] ata10: DUMMY
> [    0.244675] ata11: SATA max UDMA/133 abar m4096@0xfe808000 port 0xfe808200 irq 41
> [    0.244744] ata12: SATA max UDMA/133 abar m4096@0xfe808000 port 0xfe808280 irq 42
> [    0.245401] scsi host12: pata_legacy
> [    0.245480] ata13: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> [    0.713101] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    0.713568] ata11: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    0.713649] ata12: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [    0.714761] ata11.00: ATA-8: ST31000528AS, CC49, max UDMA/133
> [    0.714799] ata1.00: ATA-8: ST3500320AS, SD1A, max UDMA/133
> [    0.714832] ata11.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    0.714895] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    0.714964] ata12.00: ATAPI: HL-DT-ST DVDRAM GH24NSD1, LG00, max UDMA/133
> [    0.716261] ata11.00: configured for UDMA/133
> [    0.716356] ata12.00: configured for UDMA/133
> [    0.716983] ata1.00: configured for UDMA/133
> [    1.240100] tsc: Refined TSC clocksource calibration: 3194.000 MHz
> [    1.240170] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2e0a25d85ab, max_idle_ns: 440795234405 ns
> [    1.240339] clocksource: Switched to clocksource tsc
> [    3.288113] floppy0: no floppy controllers found
> [    3.288471] scsi 0:0:0:0: Direct-Access     ATA      ST3500320AS      SD1A PQ: 0 ANSI: 5
> [    3.288742] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
> [    3.288823] sd 0:0:0:0: [sda] Write Protect is off
> [    3.288886] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    3.288961] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    3.337048]  sda: sda1 sda2 < sda5 sda6 >
> [    3.342308] sd 0:0:0:0: [sda] Attached SCSI disk
> [    3.752099] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    3.755374] ata2.00: ATA-8: WDC WD15EADS-00P8B0, 01.00A01, max UDMA/133
> [    3.755763] ata2.00: 2930277168 sectors, multi 16: LBA48 NCQ (depth 32), AA
> [    3.759227] ata2.00: configured for UDMA/133
> [    3.759506] scsi 1:0:0:0: Direct-Access     ATA      WDC WD15EADS-00P 0A01 PQ: 0 ANSI: 5
> [    3.759764] sd 1:0:0:0: [sdb] 2930277168 512-byte logical blocks: (1.50 TB/1.36 TiB)
> [    3.759848] sd 1:0:0:0: [sdb] Write Protect is off
> [    3.759909] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
> [    3.759987] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    3.794650]  sdb: sdb1
> [    3.800207] sd 1:0:0:0: [sdb] Attached SCSI disk
> [    4.224101] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> [    4.225821] ata5.00: ATA-8: ST3500320AS, SD1A, max UDMA/133
> [    4.225885] ata5.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    4.227946] ata5.00: configured for UDMA/133
> [    4.228202] scsi 4:0:0:0: Direct-Access     ATA      ST3500320AS      SD1A PQ: 0 ANSI: 5
> [    4.228467] sd 4:0:0:0: [sdc] 976773168 512-byte logical blocks: (500 GB/466 GiB)
> [    4.228546] sd 4:0:0:0: [sdc] Write Protect is off
> [    4.228607] sd 4:0:0:0: [sdc] Mode Sense: 00 3a 00 00
> [    4.228681] sd 4:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    4.281376]  sdc: sdc1 sdc2 < sdc5 >
> [    4.287205] sd 4:0:0:0: [sdc] Attached SCSI disk
> [    4.688110] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [    4.688838] ata6.00: ATA-8: ST2000DL003-9VT166, CC32, max UDMA/133
> [    4.688900] ata6.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32)
> [    4.689684] ata6.00: configured for UDMA/133
> [    4.689941] scsi 5:0:0:0: Direct-Access     ATA      ST2000DL003-9VT1 CC32 PQ: 0 ANSI: 5
> [    4.690201] sd 5:0:0:0: [sdd] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
> [    4.690299] sd 5:0:0:0: [sdd] Write Protect is off
> [    4.690300] scsi 10:0:0:0: Direct-Access     ATA      ST31000528AS     CC49 PQ: 0 ANSI: 5
> [    4.690359] sd 5:0:0:0: [sdd] Mode Sense: 00 3a 00 00
> [    4.690507] sd 5:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    4.690567] sd 10:0:0:0: [sde] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [    4.690654] sd 10:0:0:0: [sde] Write Protect is off
> [    4.690714] sd 10:0:0:0: [sde] Mode Sense: 00 3a 00 00
> [    4.690781] sd 10:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    4.691245] scsi 11:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH24NSD1  LG00 PQ: 0 ANSI: 5
> [    4.716420]  sde: sde1
> [    4.725304] sd 10:0:0:0: [sde] Attached SCSI disk
> [    4.733089] sr 11:0:0:0: [sr0] scsi3-mmc drive: 48x/12x writer dvd-ram cd/rw xa/form2 cdda tray
> [    4.733162] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    4.750750] sr 11:0:0:0: Attached scsi CD-ROM sr0
> [    4.769483]  sdd: sdd1
> [    4.775191] sd 5:0:0:0: [sdd] Attached SCSI disk
> [    4.781420] scsi host12: pata_legacy
> [    4.781497] ata14: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
> [    4.942219] i8042: PNP: No PS/2 controller found.
> [    4.942315] mousedev: PS/2 mouse device common for all mice
> [    4.942412] rtc_cmos 00:02: RTC can wake from S4
> [    4.942825] rtc_cmos 00:02: registered as rtc0
> [    4.942891] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
> [    4.943007] device-mapper: uevent: version 1.0.3
> [    4.943102] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
> [    4.943265] Initializing XFRM netlink socket
> [    4.943324] NET: Registered PF_PACKET protocol family
> [    4.943421] Key type dns_resolver registered
> [    4.944246] microcode: CPU0: patch_level=0x08001137
> [    4.944309] microcode: CPU1: patch_level=0x08001137
> [    4.946043] microcode: CPU2: patch_level=0x08001137
> [    4.946109] microcode: CPU3: patch_level=0x08001137
> [    4.946211] microcode: CPU4: patch_level=0x08001137
> [    4.946278] microcode: CPU5: patch_level=0x08001137
> [    4.946354] microcode: CPU6: patch_level=0x08001137
> [    4.946423] microcode: CPU7: patch_level=0x08001137
> [    4.946498] microcode: CPU8: patch_level=0x08001137
> [    4.946567] microcode: CPU9: patch_level=0x08001137
> [    4.946631] microcode: CPU10: patch_level=0x08001137
> [    4.946699] microcode: CPU11: patch_level=0x08001137
> [    4.946784] microcode: Microcode Update Driver: v2.2.
> [    4.946787] IPI shorthand broadcast: enabled
> [    4.946908] AVX2 version of gcm_enc/dec engaged.
> [    4.947267] AES CTR mode by8 optimization enabled
> [    4.947572] sched_clock: Marking stable (4954486612, -6921571)->(4986857212, -39292171)
> [    4.947984] registered taskstats version 1
> [    4.948044] Loading compiled-in X.509 certificates
> [    4.948221] zswap: loaded using pool lzo/zbud
> [    4.948580] Key type ._fscrypt registered
> [    4.948639] Key type .fscrypt registered
> [    4.948696] Key type fscrypt-provisioning registered
> [    4.949674] Key type encrypted registered
> [    4.952093] RAS: Correctable Errors collector initialized.
> [    4.952179] md: Waiting for all devices to be available before autodetect
> [    4.952242] md: If you don't use raid, use raid=noautodetect
> [    4.952302] md: Autodetecting RAID arrays.
> [    4.952359] md: autorun ...
> [    4.952413] md: ... autorun DONE.
> [    5.168634] VFS: Mounted root (ext3 filesystem) readonly on device 8:6.
> [    5.198775] devtmpfs: mounted
> [    5.200493] Freeing unused decrypted memory: 2036K
> [    5.200833] Freeing unused kernel image (initmem) memory: 1668K
> [    5.200896] Write protecting the kernel read-only data: 22528k
> [    5.201465] Freeing unused kernel image (text/rodata gap) memory: 2036K
> [    5.201770] Freeing unused kernel image (rodata/data gap) memory: 1112K
> [    5.201837] rodata_test: all tests were successful
> [    5.201898] Run /sbin/init as init process
> [    5.201956]   with arguments:
> [    5.202011]     /sbin/init
> [    5.202065]   with environment:
> [    5.202122]     HOME=/
> [    5.202175]     TERM=linux
> [    8.229581] loop: module loaded
> [   14.407289] udevd[674]: starting eudev-3.2.11
> [   14.902936] acpi_cpufreq: overriding BIOS provided _PSD data
> [   14.999625] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> [   14.999743] ACPI: button: Power Button [PWRB]
> [   14.999879] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> [   15.003154] ACPI: button: Power Button [PWRF]
> [   15.030886] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
> [   15.936560] ccp 0000:08:00.2: ccp enabled
> [   16.301022] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
> [   16.301103] RAPL PMU: hw unit of domain package 2^-16 Joules
> [   16.342509] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [   16.342596] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
> [   16.342775] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> [   16.535845] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [   16.536022] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
> [   16.591459] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000010048000410
> [   16.591701] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.17
> [   16.591773] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   16.591843] usb usb1: Product: xHCI Host Controller
> [   16.591902] usb usb1: Manufacturer: Linux 5.17.1 xhci-hcd
> [   16.591963] usb usb1: SerialNumber: 0000:01:00.0
> [   16.592156] hub 1-0:1.0: USB hub found
> [   16.592226] hub 1-0:1.0: 10 ports detected
> [   16.596678] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [   16.596783] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
> [   16.596853] xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [   16.596943] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [   16.597028] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.17
> [   16.597104] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   16.597173] usb usb2: Product: xHCI Host Controller
> [   16.597232] usb usb2: Manufacturer: Linux 5.17.1 xhci-hcd
> [   16.597293] usb usb2: SerialNumber: 0000:01:00.0
> [   16.597425] hub 2-0:1.0: USB hub found
> [   16.597489] hub 2-0:1.0: 4 ports detected
> [   16.599330] xhci_hcd 0000:08:00.3: xHCI Host Controller
> [   16.599438] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 3
> [   16.599600] xhci_hcd 0000:08:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000040000410
> [   16.599772] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.17
> [   16.599844] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   16.599912] usb usb3: Product: xHCI Host Controller
> [   16.599971] usb usb3: Manufacturer: Linux 5.17.1 xhci-hcd
> [   16.600032] usb usb3: SerialNumber: 0000:08:00.3
> [   16.600171] hub 3-0:1.0: USB hub found
> [   16.600234] hub 3-0:1.0: 4 ports detected
> [   16.600415] xhci_hcd 0000:08:00.3: xHCI Host Controller
> [   16.600504] xhci_hcd 0000:08:00.3: new USB bus registered, assigned bus number 4
> [   16.600573] xhci_hcd 0000:08:00.3: Host supports USB 3.0 SuperSpeed
> [   16.600646] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
> [   16.600732] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.17
> [   16.600804] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [   16.600873] usb usb4: Product: xHCI Host Controller
> [   16.600932] usb usb4: Manufacturer: Linux 5.17.1 xhci-hcd
> [   16.600993] usb usb4: SerialNumber: 0000:08:00.3
> [   16.601128] hub 4-0:1.0: USB hub found
> [   16.601202] hub 4-0:1.0: 4 ports detected
> [   16.781028] Linux agpgart interface v0.103
> [   16.843124] usb 3-1: new low-speed USB device number 2 using xhci_hcd
> [   17.005795] usb 3-1: New USB device found, idVendor=046d, idProduct=c216, bcdDevice= 3.00
> [   17.005881] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   17.005955] usb 3-1: Product: Logitech Dual Action
> [   17.006022] usb 3-1: Manufacturer: Logitech
> [   17.139113] usb 3-2: new low-speed USB device number 3 using xhci_hcd
> [   17.298797] usb 3-2: New USB device found, idVendor=03f0, idProduct=2a41, bcdDevice= 1.00
> [   17.298885] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   17.298959] usb 3-2: Product: HP 1000 USB Optical Mouse
> [   17.299027] usb 3-2: Manufacturer: PixArt
> [   17.427190] usb 3-3: new low-speed USB device number 4 using xhci_hcd
> [   17.573800] usb 3-3: New USB device found, idVendor=0b38, idProduct=0010, bcdDevice= 1.02
> [   17.573887] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [   17.707127] usb 3-4: new high-speed USB device number 5 using xhci_hcd
> [   17.945725] ACPI: bus type drm_connector registered
> [   17.975567] usb 3-4: New USB device found, idVendor=07d1, idProduct=3c03, bcdDevice= 0.01
> [   17.975654] usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   17.975729] usb 3-4: Product: 802.11 bg WLAN
> [   17.975794] usb 3-4: Manufacturer: Ralink
> [   17.989532] r8169 0000:03:00.0 eth0: RTL8168h/8111h, 10:7b:44:50:35:01, XID 541, IRQ 61
> [   17.989617] r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> [   18.271546] SVM: TSC scaling supported
> [   18.271613] kvm: Nested Virtualization enabled
> [   18.271676] SVM: kvm: Nested Paging enabled
> [   18.271740] SEV supported: 16 ASIDs
> [   18.271815] SVM: Virtual VMLOAD VMSAVE supported
> [   18.271878] SVM: Virtual GIF supported
> [   18.271938] SVM: LBR virtualization supported
> [   19.058133] MCE: In-kernel MCE decoding enabled.
> [   19.486556] snd_hda_intel 0000:07:00.1: Force to non-snoop mode
> [   19.943481] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input2
> [   19.943643] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input3
> [   19.943791] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input4
> [   19.943938] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input5
> [   19.945796] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.1/0000:07:00.1/sound/card0/input6
> [   20.235398] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [   20.334895] asus_wmi: ASUS WMI generic driver loaded
> [   20.429843] asus_wmi: Initialization: 0x0
> [   20.429967] asus_wmi: BIOS WMI version: 0.9
> [   20.430203] asus_wmi: SFUN value: 0x0
> [   20.430268] eeepc-wmi eeepc-wmi: Detected ASUSWMI, use DCTS
> [   20.431254] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/input/input7
> [   20.451616] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
> [   20.451718] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   20.451798] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [   20.451878] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [   20.451948] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x11/0x0
> [   20.452018] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [   20.452091] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
> [   20.452161] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
> [   20.452231] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
> [   20.465322] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input8
> [   20.465484] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input9
> [   20.465631] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input10
> [   20.465789] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input11
> [   20.465944] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:09:00.3/sound/card1/input12
> [   21.220229] r8169 0000:03:00.0 eth126: renamed from eth0
> [   21.229266] r8169 0000:03:00.0 eth1: renamed from eth126
> [   21.229619] intel_rapl_common: Found RAPL domain package
> [   21.229694] intel_rapl_common: Found RAPL domain core
> [   21.780059] [drm] amdgpu kernel modesetting enabled.
> [   21.780211] amdgpu: Ignoring ACPI CRAT on non-APU system
> [   21.780273] amdgpu: Virtual CRAT table created for CPU
> [   21.780339] amdgpu: Topology: Add CPU node
> [   21.780473] amdgpu 0000:07:00.0: vgaarb: deactivate vga console
> [   21.781693] Console: switching to colour dummy device 80x25
> [   21.781816] [drm] initializing kernel modesetting (POLARIS11 0x1002:0x67FF 0x1DA2:0xE348 0xCF).
> [   21.781823] amdgpu 0000:07:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
> [   21.781833] [drm] register mmio base: 0xFE900000
> [   21.781835] [drm] register mmio size: 262144
> [   21.781840] [drm] add ip block number 0 <vi_common>
> [   21.781843] [drm] add ip block number 1 <gmc_v8_0>
> [   21.781845] [drm] add ip block number 2 <tonga_ih>
> [   21.781847] [drm] add ip block number 3 <gfx_v8_0>
> [   21.781849] [drm] add ip block number 4 <sdma_v3_0>
> [   21.781851] [drm] add ip block number 5 <powerplay>
> [   21.781852] [drm] add ip block number 6 <dm>
> [   21.781854] [drm] add ip block number 7 <uvd_v6_0>
> [   21.781856] [drm] add ip block number 8 <vce_v3_0>
> [   21.782104] amdgpu 0000:07:00.0: No more image in the PCI ROM
> [   21.782123] amdgpu 0000:07:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [   21.782127] amdgpu: ATOM BIOS: 113-34830H2-U02
> [   21.782140] [drm] UVD is enabled in VM mode
> [   21.782142] [drm] UVD ENC is enabled in VM mode
> [   21.782145] [drm] VCE enabled in VM mode
> [   21.782169] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
> [   22.327861] amdgpu 0000:07:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
> [   22.327878] amdgpu 0000:07:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
> [   22.327897] [drm] Detected VRAM RAM=2048M, BAR=256M
> [   22.327902] [drm] RAM width 128bits GDDR5
> [   22.327966] [drm] amdgpu: 2048M of VRAM memory ready
> [   22.327973] [drm] amdgpu: 3072M of GTT memory ready.
> [   22.327982] [drm] GART: num cpu pages 65536, num gpu pages 65536
> [   22.330027] [drm] PCIE GART of 256M enabled (table at 0x000000F400900000).
> [   23.189069] [drm] Chained IB support enabled!
> [   23.839244] hid: raw HID events driver (C) Jiri Kosina
> [   23.847054] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
> [   24.015602] [drm] Found UVD firmware Version: 1.130 Family ID: 16
> [   24.115974] usbcore: registered new interface driver usbhid
> [   24.115988] usbhid: USB HID core driver
> [   24.267571] input: PixArt HP 1000 USB Optical Mouse as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-2/3-2:1.0/0003:03F0:2A41.0002/input/input13
> [   24.267747] hid-generic 0003:03F0:2A41.0002: input,hidraw0: USB HID v1.11 Mouse [PixArt HP 1000 USB Optical Mouse] on usb-0000:08:00.3-2/input0
> [   24.268037] input: HID 0b38:0010 as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.0/0003:0B38:0010.0003/input/input14
> [   24.297768] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
> [   24.312047] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [   24.317267] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   24.319339] hid-generic 0003:0B38:0010.0003: input,hidraw1: USB HID v1.10 Keyboard [HID 0b38:0010] on usb-0000:08:00.3-3/input0
> [   24.319613] input: HID 0b38:0010 System Control as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.1/0003:0B38:0010.0004/input/input15
> [   24.371272] input: HID 0b38:0010 Consumer Control as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-3/3-3:1.1/0003:0B38:0010.0004/input/input16
> [   24.371373] hid-generic 0003:0B38:0010.0004: input,hidraw2: USB HID v1.10 Device [HID 0b38:0010] on usb-0000:08:00.3-3/input1
> [   24.824972] input: Logitech Logitech Dual Action as /devices/pci0000:00/0000:00:07.1/0000:08:00.3/usb3/3-1/3-1:1.0/0003:046D:C216.0001/input/input17
> [   24.825185] logitech 0003:046D:C216.0001: input,hidraw3: USB HID v1.10 Joystick [Logitech Logitech Dual Action] on usb-0000:08:00.3-1/input0
> [   25.071908] [drm] Display Core initialized with v3.2.167!
> [   25.073006] snd_hda_intel 0000:07:00.1: bound 0000:07:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [   25.089292] usb 3-4: reset high-speed USB device number 5 using xhci_hcd
> [   25.116352] [drm] UVD and UVD ENC initialized successfully.
> [   25.217279] [drm] VCE initialized successfully.
> [   25.218200] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   25.218316] amdgpu: SRAT table not found
> [   25.218319] amdgpu: Virtual CRAT table created for GPU
> [   25.218354] amdgpu: Topology: Add dGPU node [0x67ff:0x1002]
> [   25.218358] kfd kfd: amdgpu: added device 1002:67ff
> [   25.218371] amdgpu 0000:07:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 8, active_cu_number 16
> [   25.222208] amdgpu 0000:07:00.0: amdgpu: Using BACO for runtime pm
> [   25.222446] [drm] Initialized amdgpu 3.44.0 20150101 for 0000:07:00.0 on minor 0
> [   25.228808] fbcon: amdgpudrmfb (fb0) is primary device
> [   25.259504] Console: switching to colour frame buffer device 240x67
> [   25.282533] amdgpu 0000:07:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [   25.547344] ieee80211 phy0: rt2x00_set_chip: Info - Chipset detected - rt: 2573, rf: 0002, rev: 000a
> [   25.547757] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
> [   25.548624] usbcore: registered new interface driver rt73usb
> [   26.108547] Adding 1228936k swap on /dev/sda5.  Priority:-2 extents:1 across:1228936k FS
> [   31.086960] fuse: init (API version 7.36)
> [   34.768686] NET: Registered PF_INET6 protocol family
> [   34.773975] Segment Routing with IPv6
> [   34.773978] RPL Segment Routing with IPv6
> [   34.773991] In-situ OAM (IOAM) with IPv6
> [   42.016881] ieee80211 phy0: rt2x00lib_request_firmware: Info - Loading firmware file 'rt73.bin'
> [   42.040295] ieee80211 phy0: rt2x00lib_request_firmware: Info - Firmware detected - version: 1.7
> [   58.771135] Generic FE-GE Realtek PHY r8169-0-300:00: attached PHY driver (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
> [   58.935230] r8169 0000:03:00.0 eth1: Link is Down
> [   63.960768] wlan0: authenticate with e0:60:66:f0:2f:93
> [   63.979101] wlan0: send auth to e0:60:66:f0:2f:93 (try 1/3)
> [   63.980786] wlan0: authenticated
> [   63.981099] wlan0: associate with e0:60:66:f0:2f:93 (try 1/3)
> [   63.984509] wlan0: RX AssocResp from e0:60:66:f0:2f:93 (capab=0x1411 status=0 aid=3)
> [   63.990656] wlan0: associated
> [   64.038301] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [   64.060929] wlan0: Limiting TX power to 20 (20 - 0) dBm as advertised by e0:60:66:f0:2f:93
> [   64.577535] 8021q: 802.1Q VLAN Support v1.8
> [  437.219968] printk: console [netcon_ext0] enabled
> [  437.219969] printk: console [netcon0] enabled
> [ 2655.122165] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122171] amdgpu: 
>                 failed to send message 145 ret is 65535 
> [ 2655.122181] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122185] amdgpu: 
>                 failed to send message 146 ret is 65535 
> [ 2655.122195] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122201] amdgpu: 
>                 failed to send message 306 ret is 65535 
> [ 2655.122205] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122212] amdgpu: 
>                 failed to send message 5e ret is 65535 
> [ 2655.122218] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122226] amdgpu: 
>                 failed to send message 148 ret is 65535 
> [ 2655.122234] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122240] amdgpu: 
>                 failed to send message 145 ret is 65535 
> [ 2655.122248] amdgpu: 
>                 last message was failed ret is 65535
> [ 2655.122254] amdgpu: 
>                 failed to send message 146 ret is 65535 
> [ 2675.123318] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 20secs aborting
> [ 2675.123440] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing BFFE (len 62, WS 0, PS 0) @ 0xC01A
> [ 2675.123552] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing AFDE (len 1272, WS 8, PS 8) @ 0xB246
> [ 2675.373379] ------------[ cut here ]------------
> [ 2675.373380] WARNING: CPU: 5 PID: 1500 at drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1189 dc_commit_state+0xa67/0xac0 [amdgpu]
> [ 2675.373534] Modules linked in: netconsole iptable_filter xt_tcpudp ip_tables x_tables hwmon_vid 8021q garp mrp stp llc ipv6 fuse rt73usb rt2x00usb rt2x00lib hid_logitech joydev mac80211 hid_generic cfg80211 usbhid hid amdgpu intel_rapl_msr intel_rapl_common snd_hda_codec_realtek eeepc_wmi asus_wmi iommu_v2 snd_hda_codec_generic platform_profile snd_hda_codec_hdmi battery gpu_sched sparse_keymap ledtrig_audio rfkill video snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec edac_mce_amd drm_ttm_helper snd_hda_core ttm drm_kms_helper snd_hwdep snd_pcm kvm_amd wmi_bmof evdev snd_timer r8169 drm kvm snd agpgart realtek i2c_algo_bit irqbypass mdio_devres fb_sys_fops xhci_pci syscopyarea xhci_pci_renesas sysfillrect libphy xhci_hcd sysimgblt mfd_core crct10dif_pclmul crc32_pclmul soundcore i2c_piix4 ghash_clmulni_intel rapl i2c_core ccp k10temp wmi button acpi_cpufreq gpio_amdpt gpio_generic loop
> [ 2675.373568] CPU: 5 PID: 1500 Comm: gpm Not tainted 5.17.1 #1
> [ 2675.373571] Hardware name: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> [ 2675.373572] RIP: 0010:dc_commit_state+0xa67/0xac0 [amdgpu]
> [ 2675.373723] Code: c0 74 bf 48 8b 78 08 e8 67 b2 e9 ff eb b4 be 03 00 00 00 e8 5b e8 aa c1 e9 3f f8 ff ff 80 b8 80 03 00 00 00 0f 84 d5 fd ff ff <0f> 0b e9 ce fd ff ff 48 89 ef e8 0a d0 00 00 48 89 ef e8 62 ea 77
> [ 2675.373724] RSP: 0018:ffffaf5c4183f798 EFLAGS: 00010202
> [ 2675.373726] RAX: ffff9f32c9af8000 RBX: ffff9f32e63401e8 RCX: 0000000000000005
> [ 2675.373727] RDX: 0000000000001260 RSI: 0000000000000c7a RDI: 000007df1bbed380
> [ 2675.373728] RBP: 0000000000000000 R08: ffffaf5c4183f764 R09: 0000000000000465
> [ 2675.373729] R10: 0000000000000000 R11: 0000000000001a60 R12: ffff9f32e6340000
> [ 2675.373730] R13: ffff9f32e6343218 R14: 0000000000000001 R15: ffff9f32d2f00000
> [ 2675.373731] FS:  00007f8210799740(0000) GS:ffff9f35ced40000(0000) knlGS:0000000000000000
> [ 2675.373732] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2675.373733] CR2: 0000000000d353f8 CR3: 000000010bfd8000 CR4: 00000000003506e0
> [ 2675.373734] Call Trace:
> [ 2675.373736]  <TASK>
> [ 2675.373738]  amdgpu_dm_atomic_commit_tail+0x55c/0x2690 [amdgpu]
> [ 2675.373892]  ? ttm_bo_move_memcpy+0x140/0x210 [ttm]
> [ 2675.373897]  ? amdgpu_bo_get_metadata+0x21/0x80 [amdgpu]
> [ 2675.374008]  ? amdgpu_bo_move+0x26c/0x7f0 [amdgpu]
> [ 2675.374119]  ? preempt_count_add+0x68/0xa0
> [ 2675.374122]  ? _raw_spin_lock+0x13/0x30
> [ 2675.374125]  ? unmap_mapping_pages+0x60/0x130
> [ 2675.374128]  ? ttm_bo_handle_move_mem+0x8d/0x190 [ttm]
> [ 2675.374132]  ? ttm_bo_validate+0xc1/0x130 [ttm]
> [ 2675.374137]  ? dm_plane_helper_prepare_fb+0x211/0x270 [amdgpu]
> [ 2675.374287]  ? drm_atomic_helper_setup_commit+0x6b1/0x800 [drm_kms_helper]
> [ 2675.374302]  ? preempt_count_add+0x68/0xa0
> [ 2675.374304]  ? _raw_spin_lock_irq+0x14/0x2f
> [ 2675.374305]  ? _raw_spin_unlock_irq+0x13/0x30
> [ 2675.374307]  ? wait_for_completion_timeout+0xcd/0x100
> [ 2675.374308]  ? preempt_count_add+0x68/0xa0
> [ 2675.374310]  ? _raw_spin_lock_irq+0x14/0x2f
> [ 2675.374312]  commit_tail+0x94/0x120 [drm_kms_helper]
> [ 2675.374328]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> [ 2675.374341]  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
> [ 2675.374362]  drm_client_modeset_dpms+0x8c/0x210 [drm]
> [ 2675.374381]  ? bit_cursor+0x38f/0x5d0
> [ 2675.374384]  drm_fb_helper_blank+0xf0/0x110 [drm_kms_helper]
> [ 2675.374396]  fb_blank+0x57/0xa0
> [ 2675.374398]  fbcon_blank+0x1d5/0x280
> [ 2675.374400]  ? preempt_count_add+0x68/0xa0
> [ 2675.374402]  ? get_nohz_timer_target+0x18/0x1a0
> [ 2675.374403]  ? lock_timer_base+0x61/0x80
> [ 2675.374405]  ? preempt_count_add+0x68/0xa0
> [ 2675.374407]  ? _raw_spin_unlock_irqrestore+0x1b/0x30
> [ 2675.374408]  ? __mod_timer+0x204/0x3c0
> [ 2675.374410]  do_unblank_screen+0xaa/0x150
> [ 2675.374413]  set_selection_kernel+0x42/0x650
> [ 2675.374414]  set_selection_user+0x41/0x70
> [ 2675.374416]  tty_ioctl+0x379/0x8a0
> [ 2675.374418]  ? __do_sys_newfstatat+0x40/0x70
> [ 2675.374421]  __x64_sys_ioctl+0x82/0xb0
> [ 2675.374423]  do_syscall_64+0x3b/0xc0
> [ 2675.374426]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 2675.374428] RIP: 0033:0x7f82108ae418
> [ 2675.374430] Code: 00 00 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 0e 44 89 c0 c3 66 2e 0f 1f 84 00 00 00
> [ 2675.374431] RSP: 002b:00007fffe0a44b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [ 2675.374433] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f82108ae418
> [ 2675.374433] RDX: 00007fffe0a44b65 RSI: 000000000000541c RDI: 0000000000000006
> [ 2675.374434] RBP: 0000000000000006 R08: 00000000000000ff R09: 0000000000000003
> [ 2675.374435] R10: 0000000000001000 R11: 0000000000000246 R12: 000000000041e000
> [ 2675.374436] R13: 000000000041ddc0 R14: 0000000000000001 R15: 0000000000419738
> [ 2675.374437]  </TASK>
> [ 2675.374438] ---[ end trace 0000000000000000 ]---
> [ 2675.374574] amdgpu: 
>                 last message was failed ret is 65535
> [ 2675.374580] amdgpu: 
>                 failed to send message 148 ret is 65535 
> [ 2675.374585] amdgpu: 
>                 last message was failed ret is 65535
> [ 2675.374591] amdgpu: 
>                 failed to send message 145 ret is 65535 
> [ 2675.374599] amdgpu: 
>                 last message was failed ret is 65535
> [ 2675.374605] amdgpu: 
>                 failed to send message 146 ret is 65535 
> ----------
> 
> syslog 1:
> ----------
> Apr  1 18:34:58 darkstar kernel: acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
> Apr  1 18:35:08 darkstar kernel: amdgpu: SRAT table not found
> Apr  1 18:35:44 darkstar named[1297]: config.c: option 'trust-anchor-telemetry' is experimental and subject to change in the future
> Apr  1 18:35:45 darkstar named[1297]: managed-keys-zone: Unable to fetch DNSKEY set '.': failure
> Apr  1 18:54:32 darkstar kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 20secs aborting
> Apr  1 18:54:32 darkstar kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing BFFE (len 62, WS 0, PS 0) @ 0xC01A
> Apr  1 18:54:32 darkstar kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing AFDE (len 1272, WS 8, PS 8) @ 0xB246
> Apr  1 18:54:33 darkstar kernel: ------------[ cut here ]------------
> Apr  1 18:54:33 darkstar kernel: WARNING: CPU: 7 PID: 123 at drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1189 dc_commit_state+0xa67/0xac0 [amdgpu]
> Apr  1 18:54:33 darkstar kernel: Modules linked in: iptable_filter xt_tcpudp ip_tables x_tables hwmon_vid 8021q garp mrp stp llc ipv6 fuse rt73usb rt2x00usb hid_logitech rt2x00lib joydev mac80211 hid_generic usbhid cfg80211 hid amdgpu iommu_v2 gpu_sched drm_ttm_helper ttm drm_kms_helper intel_rapl_msr snd_hda_codec_realtek intel_rapl_common eeepc_wmi asus_wmi snd_hda_codec_hdmi snd_hda_codec_generic ledtrig_audio edac_mce_amd platform_profile battery sparse_keymap rfkill snd_hda_intel kvm_amd video snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec drm wmi_bmof kvm snd_hda_core evdev agpgart r8169 i2c_algo_bit snd_hwdep snd_pcm irqbypass fb_sys_fops syscopyarea sysfillrect sysimgblt mfd_core realtek mdio_devres libphy snd_timer crct10dif_pclmul crc32_pclmul ghash_clmulni_intel rapl snd ccp soundcore xhci_pci xhci_pci_renesas i2c_piix4 xhci_hcd i2c_core wmi button k10temp gpio_amdpt gpio_generic acpi_cpufreq loop
> Apr  1 18:54:33 darkstar kernel: CPU: 7 PID: 123 Comm: kworker/7:1 Not tainted 5.17.1 #1
> Apr  1 18:54:33 darkstar kernel: Hardware name: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> Apr  1 18:54:33 darkstar kernel: Workqueue: events console_callback
> Apr  1 18:54:33 darkstar kernel: RIP: 0010:dc_commit_state+0xa67/0xac0 [amdgpu]
> Apr  1 18:54:33 darkstar kernel: Code: c0 74 bf 48 8b 78 08 e8 67 b2 e9 ff eb b4 be 03 00 00 00 e8 5b 68 a0 ea e9 3f f8 ff ff 80 b8 80 03 00 00 00 0f 84 d5 fd ff ff <0f> 0b e9 ce fd ff ff 48 89 ef e8 0a d0 00 00 48 89 ef e8 62 6a 6d
> Apr  1 18:54:33 darkstar kernel: RSP: 0018:ffffac0a40edf808 EFLAGS: 00010202
> Apr  1 18:54:33 darkstar kernel: RAX: ffff9764100ed800 RBX: ffff9764311601e8 RCX: 0000000000000007
> Apr  1 18:54:33 darkstar kernel: RDX: 00000000000012c0 RSI: 0000000000000c7a RDI: 00000391a4064ca0
> Apr  1 18:54:33 darkstar kernel: RBP: 0000000000000000 R08: ffffac0a40edf7d4 R09: 0000000000000465
> Apr  1 18:54:33 darkstar kernel: R10: 0000000000000000 R11: 0000000000001a60 R12: ffff976431160000
> Apr  1 18:54:33 darkstar kernel: R13: ffff976431163218 R14: 0000000000000001 R15: ffff976413b30000
> Apr  1 18:54:33 darkstar kernel: FS:  0000000000000000(0000) GS:ffff97670edc0000(0000) knlGS:0000000000000000
> Apr  1 18:54:33 darkstar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Apr  1 18:54:33 darkstar kernel: CR2: 00007f804ac6e6c0 CR3: 0000000108c64000 CR4: 00000000003506e0
> Apr  1 18:54:33 darkstar kernel: Call Trace:
> Apr  1 18:54:33 darkstar kernel:  <TASK>
> Apr  1 18:54:33 darkstar kernel:  amdgpu_dm_atomic_commit_tail+0x55c/0x2690 [amdgpu]
> Apr  1 18:54:33 darkstar kernel:  ? ttm_bo_move_memcpy+0x140/0x210 [ttm]
> Apr  1 18:54:33 darkstar kernel:  ? amdgpu_bo_get_metadata+0x21/0x80 [amdgpu]
> Apr  1 18:54:33 darkstar kernel:  ? amdgpu_bo_move+0x26c/0x7f0 [amdgpu]
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  ? _raw_spin_lock+0x13/0x30
> Apr  1 18:54:33 darkstar kernel:  ? unmap_mapping_pages+0x60/0x130
> Apr  1 18:54:33 darkstar kernel:  ? ttm_bo_handle_move_mem+0x8d/0x190 [ttm]
> Apr  1 18:54:33 darkstar kernel:  ? ttm_bo_validate+0xc1/0x130 [ttm]
> Apr  1 18:54:33 darkstar kernel:  ? dm_plane_helper_prepare_fb+0x211/0x270 [amdgpu]
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  ? _raw_spin_lock_irq+0x14/0x2f
> Apr  1 18:54:33 darkstar kernel:  ? _raw_spin_unlock_irq+0x13/0x30
> Apr  1 18:54:33 darkstar kernel:  ? wait_for_completion_timeout+0xcd/0x100
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  ? _raw_spin_lock_irq+0x14/0x2f
> Apr  1 18:54:33 darkstar kernel:  commit_tail+0x94/0x120 [drm_kms_helper]
> Apr  1 18:54:33 darkstar kernel:  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> Apr  1 18:54:33 darkstar kernel:  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
> Apr  1 18:54:33 darkstar kernel:  drm_client_modeset_dpms+0x8c/0x210 [drm]
> Apr  1 18:54:33 darkstar kernel:  ? bit_cursor+0x38f/0x5d0
> Apr  1 18:54:33 darkstar kernel:  drm_fb_helper_blank+0xf0/0x110 [drm_kms_helper]
> Apr  1 18:54:33 darkstar kernel:  fb_blank+0x57/0xa0
> Apr  1 18:54:33 darkstar kernel:  fbcon_blank+0x1d5/0x280
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  ? get_nohz_timer_target+0x18/0x1a0
> Apr  1 18:54:33 darkstar kernel:  ? lock_timer_base+0x61/0x80
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  ? _raw_spin_unlock_irqrestore+0x1b/0x30
> Apr  1 18:54:33 darkstar kernel:  ? __mod_timer+0x204/0x3c0
> Apr  1 18:54:33 darkstar kernel:  do_unblank_screen+0xaa/0x150
> Apr  1 18:54:33 darkstar kernel:  console_callback+0x12e/0x180
> Apr  1 18:54:33 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  1 18:54:33 darkstar kernel:  process_one_work+0x216/0x3e0
> Apr  1 18:54:33 darkstar kernel:  worker_thread+0x4d/0x3c0
> Apr  1 18:54:33 darkstar kernel:  ? rescuer_thread+0x380/0x380
> Apr  1 18:54:33 darkstar kernel:  kthread+0xe7/0x110
> Apr  1 18:54:33 darkstar kernel:  ? kthread_complete_and_exit+0x20/0x20
> Apr  1 18:54:33 darkstar kernel:  ret_from_fork+0x22/0x30
> Apr  1 18:54:33 darkstar kernel:  </TASK>
> Apr  1 18:54:33 darkstar kernel: ---[ end trace 0000000000000000 ]---
> Apr  1 18:54:43 darkstar kernel: Emergency Sync complete
> ----------
> 
> syslog 2:
> ----------
> Apr  2 10:00:16 darkstar kernel: [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in loop for more than 20secs aborting
> Apr  2 10:00:16 darkstar kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing BFFE (len 62, WS 0, PS 0) @ 0xC01A
> Apr  2 10:00:16 darkstar kernel: [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR* atombios stuck executing AFDE (len 1272, WS 8, PS 8) @ 0xB246
> Apr  2 10:00:16 darkstar kernel: ------------[ cut here ]------------
> Apr  2 10:00:16 darkstar kernel: WARNING: CPU: 10 PID: 1499 at drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1189 dc_commit_state+0xa67/0xac0 [amdgpu]
> Apr  2 10:00:16 darkstar kernel: Modules linked in: iptable_filter xt_tcpudp ip_tables x_tables hwmon_vid 8021q garp mrp stp llc ipv6 fuse rt73usb rt2x00usb rt2x00lib hid_logitech joydev mac80211 hid_generic usbh
> id cfg80211 hid amdgpu snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi ledtrig_audio intel_rapl_msr iommu_v2 snd_hda_intel gpu_sched intel_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi eeepc_wmi 
> asus_wmi snd_hda_codec platform_profile drm_ttm_helper battery ttm sparse_keymap rfkill edac_mce_amd drm_kms_helper video snd_hda_core kvm_amd drm wmi_bmof snd_hwdep kvm snd_pcm evdev snd_timer agpgart irqbypass 
> r8169 snd crct10dif_pclmul crc32_pclmul i2c_algo_bit fb_sys_fops realtek syscopyarea sysfillrect sysimgblt soundcore mfd_core mdio_devres libphy ghash_clmulni_intel rapl xhci_pci xhci_pci_renesas xhci_hcd i2c_pii
> x4 i2c_core ccp wmi k10temp button gpio_amdpt acpi_cpufreq gpio_generic loop
> Apr  2 10:00:16 darkstar kernel: CPU: 10 PID: 1499 Comm: gpm Not tainted 5.17.1 #1
> Apr  2 10:00:16 darkstar kernel: Hardware name: System manufacturer System Product Name/PRIME B350-PLUS, BIOS 4011 04/19/2018
> Apr  2 10:00:16 darkstar kernel: RIP: 0010:dc_commit_state+0xa67/0xac0 [amdgpu]
> Apr  2 10:00:16 darkstar kernel: Code: c0 74 bf 48 8b 78 08 e8 67 b2 e9 ff eb b4 be 03 00 00 00 e8 5b 88 c3 db e9 3f f8 ff ff 80 b8 80 03 00 00 00 0f 84 d5 fd ff ff <0f> 0b e9 ce fd ff ff 48 89 ef e8 0a d0 00 00 
> 48 89 ef e8 62 8a 90
> Apr  2 10:00:16 darkstar kernel: RSP: 0018:ffffb48301cb3798 EFLAGS: 00010202
> Apr  2 10:00:16 darkstar kernel: RAX: ffff9c9749aa4c00 RBX: ffff9c9752f801e8 RCX: 000000000000000a
> Apr  2 10:00:16 darkstar kernel: RDX: 0000000000001260 RSI: 0000000000000c7a RDI: 0000037ba4e17a40
> Apr  2 10:00:16 darkstar kernel: RBP: 0000000000000000 R08: ffffb48301cb3764 R09: 0000000000000465
> Apr  2 10:00:16 darkstar kernel: R10: 0000000000000000 R11: 0000000000001a60 R12: ffff9c9752f80000
> Apr  2 10:00:16 darkstar kernel: R13: ffff9c9752f83218 R14: 0000000000000001 R15: ffff9c974c320000
> Apr  2 10:00:16 darkstar kernel: FS:  00007f3eda09a740(0000) GS:ffff9c9a4ee80000(0000) knlGS:0000000000000000
> Apr  2 10:00:16 darkstar kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Apr  2 10:00:16 darkstar kernel: CR2: 00007fa78233c838 CR3: 000000010c0fa000 CR4: 00000000003506e0
> Apr  2 10:00:16 darkstar kernel: Call Trace:
> Apr  2 10:00:16 darkstar kernel:  <TASK>
> Apr  2 10:00:16 darkstar kernel:  amdgpu_dm_atomic_commit_tail+0x55c/0x2690 [amdgpu]
> Apr  2 10:00:16 darkstar kernel:  ? ttm_bo_move_memcpy+0x140/0x210 [ttm]
> Apr  2 10:00:16 darkstar kernel:  ? amdgpu_bo_get_metadata+0x21/0x80 [amdgpu]
> Apr  2 10:00:16 darkstar kernel:  ? amdgpu_bo_move+0x26c/0x7f0 [amdgpu]
> Apr  2 10:00:16 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  2 10:00:16 darkstar kernel:  ? _raw_spin_lock+0x13/0x30
> Apr  2 10:00:16 darkstar kernel:  ? unmap_mapping_pages+0x60/0x130
> Apr  2 10:00:16 darkstar kernel:  ? ttm_bo_handle_move_mem+0x8d/0x190 [ttm]
> Apr  2 10:00:16 darkstar kernel:  ? ttm_bo_validate+0xc1/0x130 [ttm]
> Apr  2 10:00:16 darkstar kernel:  ? dm_plane_helper_prepare_fb+0x211/0x270 [amdgpu]
> Apr  2 10:00:16 darkstar kernel:  ? __slab_alloc.constprop.0+0x57/0x80
> Apr  2 10:00:16 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  2 10:00:16 darkstar kernel:  ? _raw_spin_lock_irq+0x14/0x2f
> Apr  2 10:00:16 darkstar kernel:  ? _raw_spin_unlock_irq+0x13/0x30
> Apr  2 10:00:16 darkstar kernel:  ? wait_for_completion_timeout+0xcd/0x100
> Apr  2 10:00:16 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  2 10:00:16 darkstar kernel:  ? _raw_spin_lock_irq+0x14/0x2f
> Apr  2 10:00:16 darkstar kernel:  commit_tail+0x94/0x120 [drm_kms_helper]
> Apr  2 10:00:16 darkstar kernel:  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> Apr  2 10:00:16 darkstar kernel:  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
> Apr  2 10:00:16 darkstar kernel:  drm_client_modeset_dpms+0x8c/0x210 [drm]
> Apr  2 10:00:16 darkstar kernel:  ? bit_cursor+0x38f/0x5d0
> Apr  2 10:00:16 darkstar kernel:  drm_fb_helper_blank+0xf0/0x110 [drm_kms_helper]
> Apr  2 10:00:16 darkstar kernel:  fb_blank+0x57/0xa0
> Apr  2 10:00:16 darkstar kernel:  fbcon_blank+0x1d5/0x280
> Apr  2 10:00:16 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  2 10:00:16 darkstar kernel:  ? get_nohz_timer_target+0x18/0x1a0
> Apr  2 10:00:16 darkstar kernel:  ? lock_timer_base+0x61/0x80
> Apr  2 10:00:16 darkstar kernel:  ? preempt_count_add+0x68/0xa0
> Apr  2 10:00:16 darkstar kernel:  ? _raw_spin_unlock_irqrestore+0x1b/0x30
> Apr  2 10:00:16 darkstar kernel:  ? __mod_timer+0x204/0x3c0
> Apr  2 10:00:16 darkstar kernel:  do_unblank_screen+0xaa/0x150
> Apr  2 10:00:16 darkstar kernel:  set_selection_kernel+0x42/0x650
> Apr  2 10:00:16 darkstar kernel:  set_selection_user+0x41/0x70
> Apr  2 10:00:16 darkstar kernel:  tty_ioctl+0x379/0x8a0
> Apr  2 10:00:16 darkstar kernel:  ? __do_sys_newfstatat+0x40/0x70
> Apr  2 10:00:16 darkstar kernel:  __x64_sys_ioctl+0x82/0xb0
> Apr  2 10:00:16 darkstar kernel:  do_syscall_64+0x3b/0xc0
> Apr  2 10:00:16 darkstar kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
> Apr  2 10:00:16 darkstar kernel: RIP: 0033:0x7f3eda1af418
> Apr  2 10:00:16 darkstar kernel: Code: 00 00 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 0e 44 89 c0 c3 66 2e 0f 1f 84 00 00 00
> Apr  2 10:00:16 darkstar kernel: RSP: 002b:00007ffdea2d2668 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> Apr  2 10:00:16 darkstar kernel: RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f3eda1af418
> Apr  2 10:00:16 darkstar kernel: RDX: 00007ffdea2d2675 RSI: 000000000000541c RDI: 0000000000000006
> Apr  2 10:00:16 darkstar kernel: RBP: 0000000000000006 R08: 00000000000000fd R09: 0000000000000003
> Apr  2 10:00:16 darkstar kernel: R10: 0000000000001000 R11: 0000000000000246 R12: 000000000041e000
> Apr  2 10:00:16 darkstar kernel: R13: 000000000041ddc0 R14: 0000000000000001 R15: 0000000000419738
> Apr  2 10:00:16 darkstar kernel:  </TASK>
> Apr  2 10:00:16 darkstar kernel: ---[ end trace 0000000000000000 ]---
> Apr  2 10:03:00 darkstar kernel: Emergency Sync complete
> ----------
> 
> 	Michele Ballabio
> 
> 
-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.
