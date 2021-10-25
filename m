Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75245439B8B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12486E176;
	Mon, 25 Oct 2021 16:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0786E176;
 Mon, 25 Oct 2021 16:32:08 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id w2so10857403qtn.0;
 Mon, 25 Oct 2021 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fi1viPO37RPErOrjd4ieHuV2yNGlzJz/MD0WbPsjcIc=;
 b=QaQjDIdMjyvVbf/paR9TGvExd3uD5ue8IknJlpKdKN45iyJFhUPS963b7WaLoSaw8F
 A0ax4Hq2Nh5MufrUcfsz1ljFpMRpYIkfFNonRp07whhTSOBaMVSIGLBEziRJ9+ytraIi
 8a2VGxZi4tS4S6QmX2QSQQ+TVv6wHbeFAOzMDSDe0ZU5+HbR4cUJPg3M3ZhoyK0V2Aeo
 y1wo2fHNKTyYT6IfK7vvuOF8hYyMcrgb17qyY8aobqsFQU0nJPp/EirtOROOx1k5CCnE
 uw3NXYdyJ6dJNJYq3mfQb3InMqUs2S9yPXNW123P++T6M5nIW/4OVccs5gQeIRXk0ZB0
 OW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fi1viPO37RPErOrjd4ieHuV2yNGlzJz/MD0WbPsjcIc=;
 b=MR0Q19dWzKSnvsMxRweN1If+YIHAnG0zmzUxflAs9gm4B4stajnkus3swZ4Utl0ZRh
 bU6fdjfslVgbRAAKGbrj2O/vG9AqRtAkj2n7qUF/JDvNeuYmSQw3zCslvh8sOVBaOrDy
 C09pdbElfxdPDS9UGFzdvTJWS3KhM3ugKgNCnBRtRDT8hYcRTQLVfdf3uDOjfLrQ5n64
 bSiztJiEfHhtDbq2+cOHMw7uwbW5faWHqPq4WEPescMBF37pa6ZANKeNAwqhBIGrjFNS
 ne9pNry+8OFEAZ46jWkAL4CXJFRsYJbNWhzfAoh3q8nXW6sCrK2StTxdIOz8GvfXX5gy
 g64w==
X-Gm-Message-State: AOAM530MWU17GQpAJalCj/55sZrENybnbCdDQz1hKJSKI1O8Bl3iW2qJ
 eW6k2ZYBI1FpaYZRnY/W4XZwAA16F9E=
X-Google-Smtp-Source: ABdhPJzmY7kigh+TO79Y4+BgzAj4KHDcoDcEL9f+niTe0h2absz4jVCFmubie/bO52LQVVUWu65jgw==
X-Received: by 2002:a05:622a:1889:: with SMTP id
 v9mr19147126qtc.48.1635179527108; 
 Mon, 25 Oct 2021 09:32:07 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id f21sm9741090qtk.51.2021.10.25.09.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 09:32:06 -0700 (PDT)
Message-ID: <b412bb59-8f60-6b4a-9bc4-e606c6b9f66a@gmail.com>
Date: Mon, 25 Oct 2021 12:32:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: amdgpu "Fatal error during GPU init"; Ryzen 5600G integrated GPU
 + kernel 5.14.13
Content-Language: en-US
To: lijo.lazar@amd.com, alexdeucher@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
 <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
 <CADnq5_PsKDreYH0aNNzfR_TbfMMsfVK=-hCCB0ThZ0PzcLPCpw@mail.gmail.com>
 <27b8936d-ba79-cc13-7768-692565bedc2f@amd.com>
From: PGNet Dev <pgnet.dev@gmail.com>
In-Reply-To: <27b8936d-ba79-cc13-7768-692565bedc2f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: pgnet.dev@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi

>> The driver is not able to find the vbios image which is required for
>> the driver to properly enumerate the hardware.  I would guess it's a
>> platform issue.  Is there a newer sbios image available for your
>> platform?
...
>> I would start with an sbios update is possible.

not that i'm aware.

this board is an ASRockRack X470D4U server board

	https://www.asrockrack.com/general/productdetail.asp?Model=X470D4U#Specifications

latest BIOS

	https://www.asrockrack.com/general/productdetail.asp?Model=X470D4U#Download

is,

	4.20	8/12/2021	BIOS

which is installed,

	dmidecode | grep "BIOS Information" -A5
	BIOS Information
         	Vendor: American Megatrends International, LLC.
         	Version: P4.20
         	Release Date: 04/14/2021
         	Address: 0xF0000
         	Runtime Size: 64 kB

>> check if there are any options in the
>> sbios regarding the behavior of the integrated graphics when an
>> external GPU is present.  I suspect the one of the following is the
>> problem:
>> 1. The sbios should disable the integrated graphics when a dGPU is
>> present, but due to a bug in the sbios or a particular sbios settings
>> it has failed to.
>> 2. The sbios should be providing a vbios image for the integrated
>> graphics, but due to a bug in the sbios or a particular sbios settings
>> it has failed to.
>> 3. The platform uses some alternative method to provide access to the
>> vbios image for the integrated graphics that Linux does not yet
>> handle.

Checking on the specific options for Dual/Concurrent GPU support is ... challenging ... so far.
I haven't found a clear statement/doc on how it's intended to behave, what options are available, or details on the individual options.

Per a chat late last week with ASRockRack, my understanding is that dual CPU support is *supposed* to work.

atm, I'm not clear on how specifically test/answer for any of your suspected issues :-/
Reading online to see what to check, etc.

> To add to the list - check if ACPI support is broken or skipped.

It doesn't appear to me to be; here's dmesg output,

dmesg | grep -i acpi
	...
	[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20efff] ACPI NVS
	[    0.000000] BIOS-e820: [mem 0x00000000bae2e000-0x00000000bae70fff] ACPI data
	[    0.000000] BIOS-e820: [mem 0x00000000bae71000-0x00000000bd0defff] ACPI NVS
	[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20efff] ACPI NVS
	[    0.000000] reserve setup_data: [mem 0x00000000bae2e000-0x00000000bae70fff] ACPI data
	[    0.000000] reserve setup_data: [mem 0x00000000bae71000-0x00000000bd0defff] ACPI NVS
	[    0.000000] efi: ACPI=0xbd0c8000 ACPI 2.0=0xbd0c8014 SMBIOS=0xbdd6d000 SMBIOS 3.0=0xbdd6c000 MEMATTR=0xb5ee6698 ESRT=0xb5804518 MOKvar=0xb568b000 RNG=0xbdd9eb18
	[    0.004625] ACPI: Early table checksum verification disabled
	[    0.004627] ACPI: RSDP 0x00000000BD0C8014 000024 (v02 ALASKA)
	[    0.004630] ACPI: XSDT 0x00000000BD0C7728 0000E4 (v01 ALASKA A M I    01072009 AMI  01000013)
	[    0.004634] ACPI: FACP 0x00000000BAE60000 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
	[    0.004637] ACPI: DSDT 0x00000000BAE59000 006308 (v02 ALASKA A M I    01072009 INTL 20120913)
	[    0.004639] ACPI: FACS 0x00000000BC0C2000 000040
	[    0.004640] ACPI: IVRS 0x00000000BAE70000 0000D0 (v02 AMD    AmdTable 00000001 AMD  00000001)
	[    0.004642] ACPI: SPMI 0x00000000BAE6F000 000041 (v05 ALASKA A M I    00000000 AMI. 00000000)
	[    0.004644] ACPI: SPMI 0x00000000BAE6E000 000041 (v05 ALASKA A M I    00000000 AMI. 00000000)
	[    0.004645] ACPI: SSDT 0x00000000BAE66000 007229 (v02 AMD    MYRTLE   00000002 MSFT 04000000)
	[    0.004647] ACPI: SSDT 0x00000000BAE62000 003BD7 (v01 AMD    AMD AOD  00000001 INTL 20120913)
	[    0.004648] ACPI: SSDT 0x00000000BAE61000 0000C8 (v02 ALASKA CPUSSDT  01072009 AMI  01072009)
	[    0.004650] ACPI: FIDT 0x00000000BAE58000 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
	[    0.004651] ACPI: MCFG 0x00000000BAE57000 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
	[    0.004653] ACPI: AAFT 0x00000000BAE56000 000068 (v01 ALASKA OEMAAFT  01072009 MSFT 00000097)
	[    0.004654] ACPI: HPET 0x00000000BAE55000 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
	[    0.004656] ACPI: SPCR 0x00000000BAE54000 000050 (v02 A M I  APTIO V  01072009 AMI. 00050011)
	[    0.004657] ACPI: SSDT 0x00000000BAE51000 002B44 (v02 AMD    AmdTable 00000001 AMD  00000001)
	[    0.004659] ACPI: CRAT 0x00000000BAE50000 000B68 (v01 AMD    AmdTable 00000001 AMD  00000001)
	[    0.004660] ACPI: CDIT 0x00000000BAE4F000 000029 (v01 AMD    AmdTable 00000001 AMD  00000001)
	[    0.004662] ACPI: SSDT 0x00000000BAE4E000 000D53 (v01 AMD    MYRTLEG2 00000001 INTL 20120913)
	[    0.004663] ACPI: SSDT 0x00000000BAE4D000 00022A (v01 AMD    MYRTLEGP 00000001 INTL 20120913)
	[    0.004665] ACPI: SSDT 0x00000000BAE49000 00381A (v01 AMD    MYRTLE   00000001 INTL 20120913)
	[    0.004666] ACPI: SSDT 0x00000000BAE48000 0000BF (v01 AMD    AmdTable 00001000 INTL 20120913)
	[    0.004668] ACPI: WSMT 0x00000000BAE47000 000028 (v01 ALASKA A M I    01072009 AMI  00010013)
	[    0.004669] ACPI: APIC 0x00000000BAE46000 00015E (v03 ALASKA A M I    01072009 AMI  00010013)
	[    0.004671] ACPI: SSDT 0x00000000BAE45000 00051B (v01 AMD    MYRTLERN 00000001 INTL 20120913)
	[    0.004672] ACPI: SSDT 0x00000000BAE43000 0010AF (v01 AMD    MYRTLE   00000001 INTL 20120913)
	[    0.004674] ACPI: FPDT 0x00000000BAE42000 000044 (v01 ALASKA A M I    01072009 AMI  01000013)
	[    0.004675] ACPI: Reserving FACP table memory at [mem 0xbae60000-0xbae60113]
	[    0.004676] ACPI: Reserving DSDT table memory at [mem 0xbae59000-0xbae5f307]
	[    0.004676] ACPI: Reserving FACS table memory at [mem 0xbc0c2000-0xbc0c203f]
	[    0.004677] ACPI: Reserving IVRS table memory at [mem 0xbae70000-0xbae700cf]
	[    0.004677] ACPI: Reserving SPMI table memory at [mem 0xbae6f000-0xbae6f040]
	[    0.004678] ACPI: Reserving SPMI table memory at [mem 0xbae6e000-0xbae6e040]
	[    0.004679] ACPI: Reserving SSDT table memory at [mem 0xbae66000-0xbae6d228]
	[    0.004679] ACPI: Reserving SSDT table memory at [mem 0xbae62000-0xbae65bd6]
	[    0.004680] ACPI: Reserving SSDT table memory at [mem 0xbae61000-0xbae610c7]
	[    0.004680] ACPI: Reserving FIDT table memory at [mem 0xbae58000-0xbae5809b]
	[    0.004681] ACPI: Reserving MCFG table memory at [mem 0xbae57000-0xbae5703b]
	[    0.004681] ACPI: Reserving AAFT table memory at [mem 0xbae56000-0xbae56067]
	[    0.004682] ACPI: Reserving HPET table memory at [mem 0xbae55000-0xbae55037]
	[    0.004682] ACPI: Reserving SPCR table memory at [mem 0xbae54000-0xbae5404f]
	[    0.004683] ACPI: Reserving SSDT table memory at [mem 0xbae51000-0xbae53b43]
	[    0.004683] ACPI: Reserving CRAT table memory at [mem 0xbae50000-0xbae50b67]
	[    0.004684] ACPI: Reserving CDIT table memory at [mem 0xbae4f000-0xbae4f028]
	[    0.004684] ACPI: Reserving SSDT table memory at [mem 0xbae4e000-0xbae4ed52]
	[    0.004685] ACPI: Reserving SSDT table memory at [mem 0xbae4d000-0xbae4d229]
	[    0.004686] ACPI: Reserving SSDT table memory at [mem 0xbae49000-0xbae4c819]
	[    0.004686] ACPI: Reserving SSDT table memory at [mem 0xbae48000-0xbae480be]
	[    0.004687] ACPI: Reserving WSMT table memory at [mem 0xbae47000-0xbae47027]
	[    0.004687] ACPI: Reserving APIC table memory at [mem 0xbae46000-0xbae4615d]
	[    0.004688] ACPI: Reserving SSDT table memory at [mem 0xbae45000-0xbae4551a]
	[    0.004688] ACPI: Reserving SSDT table memory at [mem 0xbae43000-0xbae440ae]
	[    0.004689] ACPI: Reserving FPDT table memory at [mem 0xbae42000-0xbae42043]
	[    0.070746] ACPI: PM-Timer IO Port: 0x808
	[    0.070752] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
	[    0.070770] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
	[    0.070771] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
	[    0.070773] ACPI: Using ACPI (MADT) for SMP configuration information
	[    0.070774] ACPI: HPET id: 0x10228201 base: 0xfed00000
	[    0.070778] ACPI: SPCR: console: uart,io,0x3f8,115200
	[    0.296452] ACPI: Core revision 20210604
	[    0.418616] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20efff] (61440 bytes)
	[    0.418619] ACPI: PM: Registering ACPI NVS region [mem 0xbae71000-0xbd0defff] (36102144 bytes)
	[    0.419845] ACPI: bus type PCI registered
	[    0.419847] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
	[    0.505757] ACPI: Added _OSI(Module Device)
	[    0.505757] ACPI: Added _OSI(Processor Device)
	[    0.505757] ACPI: Added _OSI(3.0 _SCP Extensions)
	[    0.505757] ACPI: Added _OSI(Processor Aggregator Device)
	[    0.505757] ACPI: Added _OSI(Linux-Dell-Video)
	[    0.505757] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
	[    0.505757] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
	[    0.505757] ACPI: Added _OSI(Linux)
	[    0.511109] ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP0.VGA], AE_ALREADY_EXISTS (20210604/dswload2-326)
	[    0.511115] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20210604/psobject-220)
	[    0.511117] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
	[    0.511119] ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP0.HDAU], AE_ALREADY_EXISTS (20210604/dswload2-326)
	[    0.511121] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20210604/psobject-220)
	[    0.511123] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
	[    0.511321] ACPI: 11 ACPI AML tables successfully acquired and loaded
	[    0.515248] ACPI: Interpreter enabled
	[    0.515257] ACPI: PM: (supports S0 S4 S5)
	[    0.515258] ACPI: Using IOAPIC for interrupt routing
	[    0.515427] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
	[    0.515619] ACPI: Enabled 4 GPEs in block 00 to 1F
	[    0.520321] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
	[    0.520325] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
	[    0.520401] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug LTR DPC]
	[    0.520471] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
	[    0.520479] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-7f] only partially covers this bridge
	[    0.530700] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
	[    0.530727] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
	[    0.530750] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
	[    0.530779] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
	[    0.530805] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
	[    0.530826] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
	[    0.530847] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
	[    0.530868] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
	[    0.531910] ACPI: bus type USB registered
	[    0.531910] PCI: Using ACPI for IRQ routing
	[    0.543389] pnp: PnP ACPI init
	[    0.544422] pnp: PnP ACPI: found 7 devices
	[    0.549677] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
	[    0.597052] ACPI: button: Power Button [PWRB]
	[    0.597085] ACPI: button: Power Button [PWRF]
	[    0.597121] ACPI: \_PR_.C000: Found 3 idle states
	[    0.597212] ACPI: \_PR_.C002: Found 3 idle states
	[    0.597676] ACPI: \_PR_.C004: Found 3 idle states
	[    0.597735] ACPI: \_PR_.C006: Found 3 idle states
	[    0.597787] ACPI: \_PR_.C008: Found 3 idle states
	[    0.597841] ACPI: \_PR_.C00A: Found 3 idle states
	[    0.597891] ACPI: \_PR_.C001: Found 3 idle states
	[    0.597936] ACPI: \_PR_.C003: Found 3 idle states
	[    0.598059] ACPI: \_PR_.C005: Found 3 idle states
	[    0.598201] ACPI: \_PR_.C007: Found 3 idle states
	[    0.598327] ACPI: \_PR_.C009: Found 3 idle states
	[    0.598411] ACPI: \_PR_.C00B: Found 3 idle states
	...


