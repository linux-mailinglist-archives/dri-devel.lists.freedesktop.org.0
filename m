Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DD5247EE
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 10:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3C10EE10;
	Thu, 12 May 2022 08:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E410EE10;
 Thu, 12 May 2022 08:35:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6C911F8C9;
 Thu, 12 May 2022 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652344533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JvNZ/Ytj4l8SyWiC7GNmH6Y+jubIEiOLVqwY/NTCd4=;
 b=VJMN8tKNHfmNqeI0ORGWwLqrL6zsjXcqn34rbFHF75zBGKb69okpknU16pc8RPs12PRd71
 rObIKipD6FCn9A2UDDloSCTClUmFl1QNz47yG5DrIHeT++xyKq1h3yALxgOjcvrgwJE3bT
 RWE2ikCXlHFMWlqkzcxJTYiXOQZmmVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652344533;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JvNZ/Ytj4l8SyWiC7GNmH6Y+jubIEiOLVqwY/NTCd4=;
 b=PlZukCo6neSi617fEwDzS+CsyZRs0WvY8Q1Q+zNi39IubmvqY0yiBPBReq4MjFfBl5/ffq
 OhMWb/O+Fi26qcAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60C4613ABE;
 Thu, 12 May 2022 08:35:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MwoQFtXGfGJYHAAAMHmgww
 (envelope-from <jroedel@suse.de>); Thu, 12 May 2022 08:35:33 +0000
Date: Thu, 12 May 2022 10:35:32 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
Message-ID: <YnzG1KE9tasxdUbX@suse.de>
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
 <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
 <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
 <CADnq5_PoWLHydAGqHXKNwBnnc_Uz7xc01Mmp2ri-h+RtnRqgfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y/sm5vv153e45xiY"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PoWLHydAGqHXKNwBnnc_Uz7xc01Mmp2ri-h+RtnRqgfQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y/sm5vv153e45xiY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 10, 2022 at 04:41:57PM -0400, Alex Deucher wrote:
> Does setting amdgpu.runpm=0 on the kernel command line in grub help?
> If so, that should fixed with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f95af4a9236695caed24fe6401256bb974e8f2a7

Unfortunatly, no, this option doesn't help. Tested with v5.18-rc6, full
dmesg attached.

Any idea what the BadTLP messages migh be caused by?

Regards,

	Joerg

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 Nürnberg
Germany
 
(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev


--y/sm5vv153e45xiY
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="error.log"
Content-Transfer-Encoding: 8bit

[    0.000000] Linux version 5.18.0-rc6-vanilla (joro@cap.home.8bytes.org) (gcc (SUSE Linux) 11.2.1 20220420 [revision 691af15031e00227ba6d5935c1d737026cda4129], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.38.20220411-4) #2 SMP PREEMPT_DYNAMIC Mon May 9 09:43:39 CEST 2022
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-5.18.0-rc6-vanilla root=/dev/mapper/cap_vg-root splash=silent resume=/dev/cap_vg/swap mitigations=auto quiet iommu=nopt amdgpu.runpm=0
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20afff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20b000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000d0214fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d0215000-0x00000000d0236fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000d0237000-0x00000000d9103fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d9104000-0x00000000d9273fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000d9274000-0x00000000d9282fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000d9283000-0x00000000d939bfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000d939c000-0x00000000d9790fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000d9791000-0x00000000da58cfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000da58d000-0x00000000dcffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dd000000-0x00000000dfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd100000-0x00000000fd1fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000101f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xcfe9b018-0xcfedca57] usable ==> usable
[    0.000000] e820: update [mem 0xcfe9b018-0xcfedca57] usable ==> usable
[    0.000000] e820: update [mem 0xcfe59018-0xcfe9aa57] usable ==> usable
[    0.000000] e820: update [mem 0xcfe59018-0xcfe9aa57] usable ==> usable
[    0.000000] e820: update [mem 0xcfe47018-0xcfe58057] usable ==> usable
[    0.000000] e820: update [mem 0xcfe47018-0xcfe58057] usable ==> usable
[    0.000000] e820: update [mem 0xcfe2a018-0xcfe46c57] usable ==> usable
[    0.000000] e820: update [mem 0xcfe2a018-0xcfe46c57] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009d00000-0x0000000009ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20afff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20b000-0x000000000affffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000cfe2a017] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe2a018-0x00000000cfe46c57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe46c58-0x00000000cfe47017] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe47018-0x00000000cfe58057] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe58058-0x00000000cfe59017] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe59018-0x00000000cfe9aa57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe9aa58-0x00000000cfe9b017] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfe9b018-0x00000000cfedca57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cfedca58-0x00000000d0214fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000d0215000-0x00000000d0236fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000d0237000-0x00000000d9103fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000d9104000-0x00000000d9273fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000d9274000-0x00000000d9282fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000d9283000-0x00000000d939bfff] usable
[    0.000000] reserve setup_data: [mem 0x00000000d939c000-0x00000000d9790fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000d9791000-0x00000000da58cfff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000da58d000-0x00000000dcffffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dd000000-0x00000000dfffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd100000-0x00000000fd1fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000101f37ffff] usable
[    0.000000] efi: EFI v2.60 by American Megatrends
[    0.000000] efi: TPMFinalLog=0xd9743000 ACPI 2.0=0xd0215000 ACPI=0xd0215000 SMBIOS=0xda452000 SMBIOS 3.0=0xda451000 ESRT=0xd68cf398 MEMATTR=0xd58a6018 MOKvar=0xd58a7000 RNG=0xda425618 TPMEventLog=0xcfedd018 
[    0.000000] efi: seeding entropy pool
[    0.000000] random: crng init done
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: System manufacturer System Product Name/PRIME X470-PRO, BIOS 5406 11/13/2019
[    0.000000] tsc: Fast TSC calibration failed
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] last_pfn = 0x101f380 max_arch_pfn = 0x400000000
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==> reserved
[    0.000000] last_pfn = 0xdd000 max_arch_pfn = 0x400000000
[    0.000000] esrt: Reserving ESRT space from 0x00000000d68cf398 to 0x00000000d68cf3d0.
[    0.000000] e820: update [mem 0xd68cf000-0xd68cffff] usable ==> reserved
[    0.000000] e820: update [mem 0xd58a7000-0xd58a7fff] usable ==> reserved
[    0.000000] Using GB pages for direct mapping
[    0.000000] Secure boot disabled
[    0.000000] RAMDISK: [mem 0x5a32d000-0x5cb62fff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000D0215000 000024 (v02 ALASKA)
[    0.000000] ACPI: XSDT 0x00000000D02150A0 0000BC (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FACP 0x00000000D0224650 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: DSDT 0x00000000D02151F8 00F457 (v02 ALASKA A M I    01072009 INTL 20120913)
[    0.000000] ACPI: FACS 0x00000000D9778D80 000040
[    0.000000] ACPI: APIC 0x00000000D0224768 00015E (v03 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FPDT 0x00000000D02248C8 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FIDT 0x00000000D0224910 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: SSDT 0x00000000D02249B0 0000FC (v02 ALASKA CPUSSDT  01072009 AMI  01072009)
[    0.000000] ACPI: SSDT 0x00000000D0236040 0000BF (v01 AMD    AMD PT   00001000 INTL 20120913)
[    0.000000] ACPI: SSDT 0x00000000D0224B08 008C98 (v02 AMD    AMD ALIB 00000002 MSFT 04000000)
[    0.000000] ACPI: SSDT 0x00000000D022D7A0 00368A (v01 AMD    AMD AOD  00000001 INTL 20120913)
[    0.000000] ACPI: MCFG 0x00000000D0230E30 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
[    0.000000] ACPI: HPET 0x00000000D0230E70 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
[    0.000000] ACPI: SSDT 0x00000000D0230EA8 000024 (v01 AMDFCH FCHZP    00001000 INTL 20120913)
[    0.000000] ACPI: UEFI 0x00000000D0230ED0 000042 (v01                 00000000      00000000)
[    0.000000] ACPI: BGRT 0x00000000D0230F18 000038 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: TPM2 0x00000000D0230F50 000034 (v03 ALASKA A M I    00000001 AMI  00000000)
[    0.000000] ACPI: IVRS 0x00000000D0230F88 0000D0 (v02 AMD    AMD IVRS 00000001 AMD  00000000)
[    0.000000] ACPI: SSDT 0x00000000D0231058 002314 (v01 AMD    AMD CPU  00000001 AMD  00000001)
[    0.000000] ACPI: CRAT 0x00000000D0233370 000F50 (v01 AMD    AMD CRAT 00000001 AMD  00000001)
[    0.000000] ACPI: CDIT 0x00000000D02342C0 000029 (v01 AMD    AMD CDIT 00000001 AMD  00000001)
[    0.000000] ACPI: SSDT 0x00000000D02342F0 001D4A (v01 AMD    AmdTable 00000001 INTL 20120913)
[    0.000000] ACPI: Reserving FACP table memory at [mem 0xd0224650-0xd0224763]
[    0.000000] ACPI: Reserving DSDT table memory at [mem 0xd02151f8-0xd022464e]
[    0.000000] ACPI: Reserving FACS table memory at [mem 0xd9778d80-0xd9778dbf]
[    0.000000] ACPI: Reserving APIC table memory at [mem 0xd0224768-0xd02248c5]
[    0.000000] ACPI: Reserving FPDT table memory at [mem 0xd02248c8-0xd022490b]
[    0.000000] ACPI: Reserving FIDT table memory at [mem 0xd0224910-0xd02249ab]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd02249b0-0xd0224aab]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd0236040-0xd02360fe]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd0224b08-0xd022d79f]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd022d7a0-0xd0230e29]
[    0.000000] ACPI: Reserving MCFG table memory at [mem 0xd0230e30-0xd0230e6b]
[    0.000000] ACPI: Reserving HPET table memory at [mem 0xd0230e70-0xd0230ea7]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd0230ea8-0xd0230ecb]
[    0.000000] ACPI: Reserving UEFI table memory at [mem 0xd0230ed0-0xd0230f11]
[    0.000000] ACPI: Reserving BGRT table memory at [mem 0xd0230f18-0xd0230f4f]
[    0.000000] ACPI: Reserving TPM2 table memory at [mem 0xd0230f50-0xd0230f83]
[    0.000000] ACPI: Reserving IVRS table memory at [mem 0xd0230f88-0xd0231057]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd0231058-0xd023336b]
[    0.000000] ACPI: Reserving CRAT table memory at [mem 0xd0233370-0xd02342bf]
[    0.000000] ACPI: Reserving CDIT table memory at [mem 0xd02342c0-0xd02342e8]
[    0.000000] ACPI: Reserving SSDT table memory at [mem 0xd02342f0-0xd0236039]
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000101f37ffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x101f355000-0x101f37ffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000101f37ffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.000000]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.000000]   node   0: [mem 0x000000000a20b000-0x000000000affffff]
[    0.000000]   node   0: [mem 0x000000000b020000-0x00000000d0214fff]
[    0.000000]   node   0: [mem 0x00000000d0237000-0x00000000d9103fff]
[    0.000000]   node   0: [mem 0x00000000d9283000-0x00000000d939bfff]
[    0.000000]   node   0: [mem 0x00000000da58d000-0x00000000dcffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000101f37ffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000101f37ffff]
[    0.000000] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 11 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 34 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 383 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 4593 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 12288 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 3200 pages in unavailable ranges
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 17, version 33, address 0xfec00000, GSI 0-23
[    0.000000] IOAPIC[1]: apic_id 18, version 33, address 0xfec01000, GSI 24-55
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.000000] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.000000] e820: update [mem 0xd5309000-0xd54b9fff] usable ==> reserved
[    0.000000] smpboot: Allowing 32 CPUs, 16 hotplug CPUs
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x09d00000-0x09ffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20afff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe2a000-0xcfe2afff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe46000-0xcfe46fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe47000-0xcfe47fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe58000-0xcfe58fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe59000-0xcfe59fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe9a000-0xcfe9afff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfe9b000-0xcfe9bfff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xcfedc000-0xcfedcfff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd0215000-0xd0236fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd5309000-0xd54b9fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd58a7000-0xd58a7fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd68cf000-0xd68cffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd9104000-0xd9273fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd9274000-0xd9282fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd939c000-0xd9790fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd9791000-0xda58cfff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdd000000-0xdfffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfc000000-0xfd0fffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfd100000-0xfd1fffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfd200000-0xfe9fffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0xfedfffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:1
[    0.000000] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
[    0.000000] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.000000] pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31 
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16493839
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-5.18.0-rc6-vanilla root=/dev/mapper/cap_vg-root splash=silent resume=/dev/cap_vg/swap mitigations=auto quiet iommu=nopt amdgpu.runpm=0
[    0.000000] Unknown kernel command line parameters "BOOT_IMAGE=/vmlinuz-5.18.0-rc6-vanilla splash=silent", will be passed to user space.
[    0.000000] printk: log_buf_len individual max cpu contribution: 32768 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 1015808 bytes
[    0.000000] printk: log_buf_len min size: 262144 bytes
[    0.000000] printk: log_buf_len: 2097152 bytes
[    0.000000] printk: early log buf free: 242576(92%)
[    0.000000] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 3519896K/67023240K available (14342K kernel code, 3370K rwdata, 10124K rodata, 2628K init, 5728K bss, 1416420K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    0.000000] ftrace: allocating 41477 entries in 163 pages
[    0.000000] ftrace: allocated 163 pages with 4 groups
[    0.000000] Dynamic Preempt: voluntary
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=32.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.000000] NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] printk: console [tty0] enabled
[    0.000000] ACPI: Core revision 20211217
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.000000] APIC: Switch to symmetric I/O mode setup
[    0.000000] Switched APIC routing to physical flat.
[    0.000000] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.032000] tsc: Unable to calibrate against PIT
[    0.032000] tsc: using HPET reference calibration
[    0.032000] tsc: Detected 3692.599 MHz processor
[    0.000002] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6a740f748d1, max_idle_ns: 881591072050 ns
[    0.000006] Calibrating delay loop (skipped), value calculated using timer frequency.. 7385.19 BogoMIPS (lpj=14770396)
[    0.000008] pid_max: default: 32768 minimum: 301
[    0.004031] LSM: Security Framework initializing
[    0.004050] AppArmor: AppArmor initialized
[    0.004149] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.004236] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.004449] LVT offset 1 assigned for vector 0xf9
[    0.004508] LVT offset 2 assigned for vector 0xf4
[    0.004523] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.004524] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.004526] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.004528] Spectre V2 : Mitigation: Retpolines
[    0.004528] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.004529] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.004531] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.006427] Freeing SMP alternatives memory: 36K
[    0.117436] smpboot: CPU0: AMD Ryzen 7 2700X Eight-Core Processor (family: 0x17, model: 0x8, stepping: 0x2)
[    0.117525] cblist_init_generic: Setting adjustable number of callback queues.
[    0.117529] cblist_init_generic: Setting shift to 5 and lim to 1.
[    0.117541] cblist_init_generic: Setting shift to 5 and lim to 1.
[    0.117551] cblist_init_generic: Setting shift to 5 and lim to 1.
[    0.117561] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.117564] ... version:                0
[    0.117565] ... bit width:              48
[    0.117565] ... generic registers:      6
[    0.117566] ... value mask:             0000ffffffffffff
[    0.117567] ... max period:             00007fffffffffff
[    0.117567] ... fixed-purpose events:   0
[    0.117568] ... event mask:             000000000000003f
[    0.117612] rcu: Hierarchical SRCU implementation.
[    0.117923] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.118111] smp: Bringing up secondary CPUs ...
[    0.118175] x86: Booting SMP configuration:
[    0.118176] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
[    0.150173] smp: Brought up 1 node, 16 CPUs
[    0.150173] smpboot: Max logical packages: 2
[    0.150173] smpboot: Total of 16 processors activated (118163.16 BogoMIPS)
[    0.224108] node 0 deferred pages initialised in 76ms
[    0.225601] devtmpfs: initialized
[    0.225601] x86/mm: Memory block size: 2048MB
[    0.228228] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20afff] (45056 bytes)
[    0.228228] ACPI: PM: Registering ACPI NVS region [mem 0xd939c000-0xd9790fff] (4149248 bytes)
[    0.228228] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.228228] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.228228] pinctrl core: initialized pinctrl subsystem
[    0.228316] PM: RTC time: 17:30:30, date: 2022-05-11
[    0.228485] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.228560] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.228568] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.228574] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.228582] audit: initializing netlink subsys (disabled)
[    0.228587] audit: type=2000 audit(1652290229.260:1): state=initialized audit_enabled=0 res=1
[    0.228587] thermal_sys: Registered thermal governor 'fair_share'
[    0.228587] thermal_sys: Registered thermal governor 'bang_bang'
[    0.228587] thermal_sys: Registered thermal governor 'step_wise'
[    0.228587] thermal_sys: Registered thermal governor 'user_space'
[    0.228587] cpuidle: using governor ladder
[    0.228587] cpuidle: using governor menu
[    0.228587] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.228587] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.228587] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.228587] PCI: Using configuration type 1 for base access
[    0.229130] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.229136] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.229136] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.229136] ACPI: Added _OSI(Module Device)
[    0.229136] ACPI: Added _OSI(Processor Device)
[    0.229136] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.229136] ACPI: Added _OSI(Processor Aggregator Device)
[    0.229136] ACPI: Added _OSI(Linux-Dell-Video)
[    0.229136] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.229136] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.243600] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.244992] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.247861] ACPI: EC: EC started
[    0.247862] ACPI: EC: interrupt blocked
[    0.247925] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.247927] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
[    0.247928] ACPI: Interpreter enabled
[    0.247940] ACPI: PM: (supports S0 S3 S4 S5)
[    0.247941] ACPI: Using IOAPIC for interrupt routing
[    0.248289] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.248580] ACPI: Enabled 4 GPEs in block 00 to 1F
[    0.264833] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.264838] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.264927] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME LTR DPC]
[    0.265089] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
[    0.265097] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.265392] PCI host bridge to bus 0000:00
[    0.265394] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.265396] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.265397] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.265398] pci_bus 0000:00: root bus resource [io  0x0d00-0xefff window]
[    0.265399] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
[    0.265400] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2ffff window]
[    0.265401] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
[    0.265402] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.265411] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    0.265478] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
[    0.265554] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    0.265594] pci 0000:00:01.1: [1022:1453] type 01 class 0x060400
[    0.265879] pci 0000:00:01.1: enabling Extended Tags
[    0.265948] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.266998] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
[    0.267887] pci 0000:00:01.3: enabling Extended Tags
[    0.267956] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.268129] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    0.268184] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    0.268224] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
[    0.269068] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.270120] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    0.270179] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    0.270217] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    0.271005] pci 0000:00:07.1: enabling Extended Tags
[    0.271070] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.272126] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    0.272167] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    0.273014] pci 0000:00:08.1: enabling Extended Tags
[    0.273081] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.274167] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    0.274370] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    0.274574] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    0.274602] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    0.274629] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    0.274657] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    0.274684] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    0.274711] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    0.274739] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    0.274766] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    0.275067] pci 0000:01:00.0: [144d:a808] type 00 class 0x010802
[    0.275082] pci 0000:01:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
[    0.276141] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.276145] pci 0000:00:01.1:   bridge window [mem 0xfcf00000-0xfcffffff]
[    0.276950] pci 0000:02:00.0: [1022:43d0] type 00 class 0x0c0330
[    0.276965] pci 0000:02:00.0: reg 0x10: [mem 0xfc9a0000-0xfc9a7fff 64bit]
[    0.276998] pci 0000:02:00.0: enabling Extended Tags
[    0.277047] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.277139] pci 0000:02:00.1: [1022:43c8] type 00 class 0x010601
[    0.277179] pci 0000:02:00.1: reg 0x24: [mem 0xfc980000-0xfc99ffff]
[    0.277186] pci 0000:02:00.1: reg 0x30: [mem 0xfc900000-0xfc97ffff pref]
[    0.277191] pci 0000:02:00.1: enabling Extended Tags
[    0.277226] pci 0000:02:00.1: PME# supported from D3hot D3cold
[    0.277287] pci 0000:02:00.2: [1022:43c6] type 01 class 0x060400
[    0.277324] pci 0000:02:00.2: enabling Extended Tags
[    0.277363] pci 0000:02:00.2: PME# supported from D3hot D3cold
[    0.277440] pci 0000:00:01.3: PCI bridge to [bus 02-09]
[    0.277443] pci 0000:00:01.3:   bridge window [io  0xc000-0xdfff]
[    0.277445] pci 0000:00:01.3:   bridge window [mem 0xfc500000-0xfc9fffff]
[    0.277527] pci 0000:03:00.0: [1022:43c7] type 01 class 0x060400
[    0.277567] pci 0000:03:00.0: enabling Extended Tags
[    0.277617] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.277702] pci 0000:03:04.0: [1022:43c7] type 01 class 0x060400
[    0.277742] pci 0000:03:04.0: enabling Extended Tags
[    0.277792] pci 0000:03:04.0: PME# supported from D3hot D3cold
[    0.277870] pci 0000:03:06.0: [1022:43c7] type 01 class 0x060400
[    0.277910] pci 0000:03:06.0: enabling Extended Tags
[    0.277960] pci 0000:03:06.0: PME# supported from D3hot D3cold
[    0.278039] pci 0000:03:07.0: [1022:43c7] type 01 class 0x060400
[    0.278080] pci 0000:03:07.0: enabling Extended Tags
[    0.278129] pci 0000:03:07.0: PME# supported from D3hot D3cold
[    0.278209] pci 0000:03:09.0: [1022:43c7] type 01 class 0x060400
[    0.278249] pci 0000:03:09.0: enabling Extended Tags
[    0.278299] pci 0000:03:09.0: PME# supported from D3hot D3cold
[    0.278372] pci 0000:02:00.2: PCI bridge to [bus 03-09]
[    0.278377] pci 0000:02:00.2:   bridge window [io  0xc000-0xdfff]
[    0.278379] pci 0000:02:00.2:   bridge window [mem 0xfc500000-0xfc8fffff]
[    0.278440] pci 0000:04:00.0: [19a2:0710] type 00 class 0x020000
[    0.278466] pci 0000:04:00.0: reg 0x10: [mem 0xfc604000-0xfc607fff 64bit]
[    0.278482] pci 0000:04:00.0: reg 0x18: [mem 0xfc5e0000-0xfc5fffff 64bit]
[    0.278498] pci 0000:04:00.0: reg 0x20: [mem 0xfc5c0000-0xfc5dffff 64bit]
[    0.278508] pci 0000:04:00.0: reg 0x30: [mem 0xfc540000-0xfc57ffff pref]
[    0.278620] pci 0000:04:00.0: PME# supported from D3hot D3cold
[    0.278703] pci 0000:04:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:03:00.0 (capable of 32.000 Gb/s with 5.0 GT/s PCIe x8 link)
[    0.278774] pci 0000:04:00.1: [19a2:0710] type 00 class 0x020000
[    0.278800] pci 0000:04:00.1: reg 0x10: [mem 0xfc600000-0xfc603fff 64bit]
[    0.278817] pci 0000:04:00.1: reg 0x18: [mem 0xfc5a0000-0xfc5bffff 64bit]
[    0.278832] pci 0000:04:00.1: reg 0x20: [mem 0xfc580000-0xfc59ffff 64bit]
[    0.278842] pci 0000:04:00.1: reg 0x30: [mem 0xfc500000-0xfc53ffff pref]
[    0.278954] pci 0000:04:00.1: PME# supported from D3hot D3cold
[    0.279094] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.279101] pci 0000:03:00.0:   bridge window [mem 0xfc500000-0xfc6fffff]
[    0.279161] pci 0000:05:00.0: [1b21:1242] type 00 class 0x0c0330
[    0.279189] pci 0000:05:00.0: reg 0x10: [mem 0xfc800000-0xfc807fff 64bit]
[    0.279253] pci 0000:05:00.0: enabling Extended Tags
[    0.279348] pci 0000:05:00.0: PME# supported from D3hot D3cold
[    0.279481] pci 0000:03:04.0: PCI bridge to [bus 05]
[    0.279487] pci 0000:03:04.0:   bridge window [mem 0xfc800000-0xfc8fffff]
[    0.279555] pci 0000:06:00.0: [10b5:8112] type 01 class 0x060400
[    0.279792] pci 0000:06:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    0.279803] pci 0000:03:06.0: PCI bridge to [bus 06-07]
[    0.279807] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.279864] pci_bus 0000:07: extended config space not accessible
[    0.279895] pci 0000:07:04.0: [13f6:8788] type 00 class 0x040100
[    0.279924] pci 0000:07:04.0: reg 0x10: [io  0xd000-0xd0ff]
[    0.280057] pci 0000:07:04.0: supports D1 D2
[    0.280155] pci 0000:06:00.0: PCI bridge to [bus 07]
[    0.280160] pci 0000:06:00.0:   bridge window [io  0xd000-0xdfff]
[    0.280257] pci 0000:08:00.0: [8086:1539] type 00 class 0x020000
[    0.280287] pci 0000:08:00.0: reg 0x10: [mem 0xfc700000-0xfc71ffff]
[    0.280319] pci 0000:08:00.0: reg 0x18: [io  0xc000-0xc01f]
[    0.280335] pci 0000:08:00.0: reg 0x1c: [mem 0xfc720000-0xfc723fff]
[    0.280508] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.280666] pci 0000:03:07.0: PCI bridge to [bus 08]
[    0.280670] pci 0000:03:07.0:   bridge window [io  0xc000-0xcfff]
[    0.280673] pci 0000:03:07.0:   bridge window [mem 0xfc700000-0xfc7fffff]
[    0.280705] pci 0000:03:09.0: PCI bridge to [bus 09]
[    0.280947] pci 0000:0a:00.0: [1002:6995] type 00 class 0x030000
[    0.280961] pci 0000:0a:00.0: reg 0x10: [mem 0xe0000000-0xefffffff 64bit pref]
[    0.280971] pci 0000:0a:00.0: reg 0x18: [mem 0xf0000000-0xf01fffff 64bit pref]
[    0.280977] pci 0000:0a:00.0: reg 0x20: [io  0xe000-0xe0ff]
[    0.280983] pci 0000:0a:00.0: reg 0x24: [mem 0xfce00000-0xfce3ffff]
[    0.280989] pci 0000:0a:00.0: reg 0x30: [mem 0xfce40000-0xfce5ffff pref]
[    0.281008] pci 0000:0a:00.0: BAR 0: assigned to efifb
[    0.281012] pci 0000:0a:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.281066] pci 0000:0a:00.0: supports D1 D2
[    0.281067] pci 0000:0a:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.281184] pci 0000:0a:00.1: [1002:aae0] type 00 class 0x040300
[    0.281198] pci 0000:0a:00.1: reg 0x10: [mem 0xfce60000-0xfce63fff 64bit]
[    0.281272] pci 0000:0a:00.1: supports D1 D2
[    0.281338] pci 0000:00:03.1: PCI bridge to [bus 0a]
[    0.281340] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.281342] pci 0000:00:03.1:   bridge window [mem 0xfce00000-0xfcefffff]
[    0.281344] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.281833] pci 0000:0b:00.0: [1022:145a] type 00 class 0x130000
[    0.281854] pci 0000:0b:00.0: enabling Extended Tags
[    0.281921] pci 0000:0b:00.2: [1022:1456] type 00 class 0x108000
[    0.281931] pci 0000:0b:00.2: reg 0x18: [mem 0xfcb00000-0xfcbfffff]
[    0.281938] pci 0000:0b:00.2: reg 0x24: [mem 0xfcc00000-0xfcc01fff]
[    0.281944] pci 0000:0b:00.2: enabling Extended Tags
[    0.282021] pci 0000:0b:00.3: [1022:145f] type 00 class 0x0c0330
[    0.282029] pci 0000:0b:00.3: reg 0x10: [mem 0xfca00000-0xfcafffff 64bit]
[    0.282048] pci 0000:0b:00.3: enabling Extended Tags
[    0.282075] pci 0000:0b:00.3: PME# supported from D0 D3hot D3cold
[    0.282136] pci 0000:00:07.1: PCI bridge to [bus 0b]
[    0.282140] pci 0000:00:07.1:   bridge window [mem 0xfca00000-0xfccfffff]
[    0.282839] pci 0000:0c:00.0: [1022:1455] type 00 class 0x130000
[    0.282862] pci 0000:0c:00.0: enabling Extended Tags
[    0.282933] pci 0000:0c:00.2: [1022:7901] type 00 class 0x010601
[    0.282956] pci 0000:0c:00.2: reg 0x24: [mem 0xfcd08000-0xfcd08fff]
[    0.282963] pci 0000:0c:00.2: enabling Extended Tags
[    0.282992] pci 0000:0c:00.2: PME# supported from D3hot D3cold
[    0.283047] pci 0000:0c:00.3: [1022:1457] type 00 class 0x040300
[    0.283053] pci 0000:0c:00.3: reg 0x10: [mem 0xfcd00000-0xfcd07fff]
[    0.283071] pci 0000:0c:00.3: enabling Extended Tags
[    0.283098] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.283159] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.283163] pci 0000:00:08.1:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.283530] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.283582] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.283627] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.283684] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.283735] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.283777] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.283818] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.283860] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.284387] ACPI: EC: interrupt unblocked
[    0.284387] ACPI: EC: event unblocked
[    0.284394] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.284395] ACPI: EC: GPE=0x2
[    0.284396] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
[    0.284397] ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
[    0.284430] iommu: Default domain type: Translated (set via kernel command line)
[    0.284430] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.284430] SCSI subsystem initialized
[    0.284430] libata version 3.00 loaded.
[    0.284430] pps_core: LinuxPPS API ver. 1 registered
[    0.284430] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.284430] PTP clock support registered
[    0.284430] EDAC MC: Ver: 3.0.0
[    0.284430] Registered efivars operations
[    0.284430] NetLabel: Initializing
[    0.284430] NetLabel:  domain hash size = 128
[    0.284430] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.284430] NetLabel:  unlabeled traffic allowed by default
[    0.284430] mctp: management component transport protocol core
[    0.284430] NET: Registered PF_MCTP protocol family
[    0.284430] PCI: Using ACPI for IRQ routing
[    0.288876] PCI: pci_cache_line_size set to 64 bytes
[    0.288955] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.288956] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.288957] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.288957] e820: reserve RAM buffer [mem 0xcfe2a018-0xcfffffff]
[    0.288958] e820: reserve RAM buffer [mem 0xcfe47018-0xcfffffff]
[    0.288959] e820: reserve RAM buffer [mem 0xcfe59018-0xcfffffff]
[    0.288960] e820: reserve RAM buffer [mem 0xcfe9b018-0xcfffffff]
[    0.288960] e820: reserve RAM buffer [mem 0xd0215000-0xd3ffffff]
[    0.288961] e820: reserve RAM buffer [mem 0xd5309000-0xd7ffffff]
[    0.288962] e820: reserve RAM buffer [mem 0xd58a7000-0xd7ffffff]
[    0.288963] e820: reserve RAM buffer [mem 0xd68cf000-0xd7ffffff]
[    0.288963] e820: reserve RAM buffer [mem 0xd9104000-0xdbffffff]
[    0.288964] e820: reserve RAM buffer [mem 0xd939c000-0xdbffffff]
[    0.288965] e820: reserve RAM buffer [mem 0xdd000000-0xdfffffff]
[    0.288965] e820: reserve RAM buffer [mem 0x101f380000-0x101fffffff]
[    0.288975] pci 0000:0a:00.0: vgaarb: setting as boot VGA device
[    0.288975] pci 0000:0a:00.0: vgaarb: bridge control possible
[    0.288975] pci 0000:0a:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.288975] vgaarb: loaded
[    0.288975] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.288975] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.290110] clocksource: Switched to clocksource tsc-early
[    0.293601] VFS: Disk quotas dquot_6.6.0
[    0.293613] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.293703] AppArmor: AppArmor Filesystem Enabled
[    0.293731] pnp: PnP ACPI init
[    0.293853] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.294066] system 00:02: [io  0x0300-0x030f] has been reserved
[    0.294068] system 00:02: [io  0x0230-0x023f] has been reserved
[    0.294070] system 00:02: [io  0x0290-0x029f] has been reserved
[    0.294315] pnp 00:03: [dma 0 disabled]
[    0.294538] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.294540] system 00:04: [io  0x040b] has been reserved
[    0.294541] system 00:04: [io  0x04d6] has been reserved
[    0.294542] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    0.294543] system 00:04: [io  0x0c14] has been reserved
[    0.294544] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    0.294545] system 00:04: [io  0x0c52] has been reserved
[    0.294546] system 00:04: [io  0x0c6c] has been reserved
[    0.294547] system 00:04: [io  0x0c6f] has been reserved
[    0.294547] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    0.294548] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    0.294549] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    0.294550] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    0.294551] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    0.294552] system 00:04: [io  0x0800-0x089f] has been reserved
[    0.294553] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    0.294553] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    0.294554] system 00:04: [io  0x0900-0x090f] has been reserved
[    0.294555] system 00:04: [io  0x0910-0x091f] has been reserved
[    0.294556] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.294558] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reserved
[    0.294559] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.294561] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.294562] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reserved
[    0.294563] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.294565] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    0.294978] pnp: PnP ACPI: found 5 devices
[    0.300515] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.300559] NET: Registered PF_INET protocol family
[    0.300750] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.302116] tcp_listen_portaddr_hash hash table entries: 32768 (order: 7, 524288 bytes, linear)
[    0.302163] TCP established hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.302615] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.302715] TCP: Hash tables configured (established 524288 bind 65536)
[    0.302949] MPTCP token hash table entries: 65536 (order: 8, 1572864 bytes, linear)
[    0.303024] UDP hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.303107] UDP-Lite hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.303263] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.303267] NET: Registered PF_XDP protocol family
[    0.303287] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.303292] pci 0000:00:01.1:   bridge window [mem 0xfcf00000-0xfcffffff]
[    0.303297] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.303301] pci 0000:03:00.0:   bridge window [mem 0xfc500000-0xfc6fffff]
[    0.303307] pci 0000:03:04.0: PCI bridge to [bus 05]
[    0.303311] pci 0000:03:04.0:   bridge window [mem 0xfc800000-0xfc8fffff]
[    0.303317] pci 0000:06:00.0: PCI bridge to [bus 07]
[    0.303321] pci 0000:06:00.0:   bridge window [io  0xd000-0xdfff]
[    0.303343] pci 0000:03:06.0: PCI bridge to [bus 06-07]
[    0.303345] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.303353] pci 0000:03:07.0: PCI bridge to [bus 08]
[    0.303355] pci 0000:03:07.0:   bridge window [io  0xc000-0xcfff]
[    0.303358] pci 0000:03:07.0:   bridge window [mem 0xfc700000-0xfc7fffff]
[    0.303364] pci 0000:03:09.0: PCI bridge to [bus 09]
[    0.303373] pci 0000:02:00.2: PCI bridge to [bus 03-09]
[    0.303374] pci 0000:02:00.2:   bridge window [io  0xc000-0xdfff]
[    0.303378] pci 0000:02:00.2:   bridge window [mem 0xfc500000-0xfc8fffff]
[    0.303383] pci 0000:00:01.3: PCI bridge to [bus 02-09]
[    0.303385] pci 0000:00:01.3:   bridge window [io  0xc000-0xdfff]
[    0.303387] pci 0000:00:01.3:   bridge window [mem 0xfc500000-0xfc9fffff]
[    0.303391] pci 0000:00:03.1: PCI bridge to [bus 0a]
[    0.303392] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.303394] pci 0000:00:03.1:   bridge window [mem 0xfce00000-0xfcefffff]
[    0.303396] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.303399] pci 0000:00:07.1: PCI bridge to [bus 0b]
[    0.303401] pci 0000:00:07.1:   bridge window [mem 0xfca00000-0xfccfffff]
[    0.303405] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    0.303407] pci 0000:00:08.1:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.303412] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.303413] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.303414] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.303415] pci_bus 0000:00: resource 7 [io  0x0d00-0xefff window]
[    0.303416] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
[    0.303417] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff window]
[    0.303418] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff window]
[    0.303419] pci_bus 0000:01: resource 1 [mem 0xfcf00000-0xfcffffff]
[    0.303420] pci_bus 0000:02: resource 0 [io  0xc000-0xdfff]
[    0.303421] pci_bus 0000:02: resource 1 [mem 0xfc500000-0xfc9fffff]
[    0.303422] pci_bus 0000:03: resource 0 [io  0xc000-0xdfff]
[    0.303423] pci_bus 0000:03: resource 1 [mem 0xfc500000-0xfc8fffff]
[    0.303424] pci_bus 0000:04: resource 1 [mem 0xfc500000-0xfc6fffff]
[    0.303425] pci_bus 0000:05: resource 1 [mem 0xfc800000-0xfc8fffff]
[    0.303426] pci_bus 0000:06: resource 0 [io  0xd000-0xdfff]
[    0.303427] pci_bus 0000:07: resource 0 [io  0xd000-0xdfff]
[    0.303427] pci_bus 0000:08: resource 0 [io  0xc000-0xcfff]
[    0.303428] pci_bus 0000:08: resource 1 [mem 0xfc700000-0xfc7fffff]
[    0.303429] pci_bus 0000:0a: resource 0 [io  0xe000-0xefff]
[    0.303430] pci_bus 0000:0a: resource 1 [mem 0xfce00000-0xfcefffff]
[    0.303431] pci_bus 0000:0a: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.303432] pci_bus 0000:0b: resource 1 [mem 0xfca00000-0xfccfffff]
[    0.303433] pci_bus 0000:0c: resource 1 [mem 0xfcd00000-0xfcdfffff]
[    0.303790] pci 0000:0a:00.1: D0 power state depends on 0000:0a:00.0
[    0.303927] PCI: CLS 64 bytes, default 64
[    0.303937] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.303969] pci 0000:00:01.0: Adding to iommu group 0
[    0.303970] Unpacking initramfs...
[    0.303977] pci 0000:00:01.1: Adding to iommu group 1
[    0.303984] pci 0000:00:01.3: Adding to iommu group 2
[    0.303995] pci 0000:00:02.0: Adding to iommu group 3
[    0.304006] pci 0000:00:03.0: Adding to iommu group 4
[    0.304013] pci 0000:00:03.1: Adding to iommu group 5
[    0.304023] pci 0000:00:04.0: Adding to iommu group 6
[    0.304034] pci 0000:00:07.0: Adding to iommu group 7
[    0.304042] pci 0000:00:07.1: Adding to iommu group 8
[    0.304052] pci 0000:00:08.0: Adding to iommu group 9
[    0.304060] pci 0000:00:08.1: Adding to iommu group 10
[    0.304072] pci 0000:00:14.0: Adding to iommu group 11
[    0.304079] pci 0000:00:14.3: Adding to iommu group 11
[    0.304110] pci 0000:00:18.0: Adding to iommu group 12
[    0.304116] pci 0000:00:18.1: Adding to iommu group 12
[    0.304123] pci 0000:00:18.2: Adding to iommu group 12
[    0.304129] pci 0000:00:18.3: Adding to iommu group 12
[    0.304136] pci 0000:00:18.4: Adding to iommu group 12
[    0.304142] pci 0000:00:18.5: Adding to iommu group 12
[    0.304149] pci 0000:00:18.6: Adding to iommu group 12
[    0.304155] pci 0000:00:18.7: Adding to iommu group 12
[    0.304163] pci 0000:01:00.0: Adding to iommu group 13
[    0.304179] pci 0000:02:00.0: Adding to iommu group 14
[    0.304187] pci 0000:02:00.1: Adding to iommu group 14
[    0.304195] pci 0000:02:00.2: Adding to iommu group 14
[    0.304198] pci 0000:03:00.0: Adding to iommu group 14
[    0.304201] pci 0000:03:04.0: Adding to iommu group 14
[    0.304204] pci 0000:03:06.0: Adding to iommu group 14
[    0.304208] pci 0000:03:07.0: Adding to iommu group 14
[    0.304212] pci 0000:03:09.0: Adding to iommu group 14
[    0.304215] pci 0000:04:00.0: Adding to iommu group 14
[    0.304219] pci 0000:04:00.1: Adding to iommu group 14
[    0.304221] pci 0000:05:00.0: Adding to iommu group 14
[    0.304224] pci 0000:06:00.0: Adding to iommu group 14
[    0.304227] pci 0000:07:04.0: Adding to iommu group 14
[    0.304231] pci 0000:08:00.0: Adding to iommu group 14
[    0.304253] pci 0000:0a:00.0: Adding to iommu group 15
[    0.304262] pci 0000:0a:00.1: Adding to iommu group 15
[    0.304270] pci 0000:0b:00.0: Adding to iommu group 16
[    0.304278] pci 0000:0b:00.2: Adding to iommu group 17
[    0.304286] pci 0000:0b:00.3: Adding to iommu group 18
[    0.304295] pci 0000:0c:00.0: Adding to iommu group 19
[    0.304303] pci 0000:0c:00.2: Adding to iommu group 20
[    0.304311] pci 0000:0c:00.3: Adding to iommu group 21
[    0.308250] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    0.308253] AMD-Vi: Extended features (0xf77ef22294ada): PPR NX GT IA GA PC GA_vAPIC
[    0.308257] AMD-Vi: Interrupt remapping enabled
[    0.308258] AMD-Vi: Virtual APIC enabled
[    0.308339] software IO TLB: tearing down default memory pool
[    0.309338] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
[    0.309339] RAPL PMU: hw unit of domain package 2^-16 Joules
[    0.309344] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.309759] Initialise system trusted keyrings
[    0.309767] Key type blacklist registered
[    0.309787] workingset: timestamp_bits=36 max_order=24 bucket_order=0
[    0.310557] zbud: loaded
[    0.310715] integrity: Platform Keyring initialized
[    0.318254] Key type asymmetric registered
[    0.318255] Asymmetric key parser 'x509' registered
[    0.452841] Freeing initrd memory: 41176K
[    0.456453] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    0.456463] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
[    0.456495] io scheduler mq-deadline registered
[    0.456497] io scheduler kyber registered
[    0.456511] io scheduler bfq registered
[    0.459174] pcieport 0000:00:01.1: AER: enabled with IRQ 28
[    0.461258] pcieport 0000:00:01.3: AER: enabled with IRQ 29
[    0.462211] pcieport 0000:00:03.1: AER: enabled with IRQ 30
[    0.463182] pcieport 0000:00:07.1: AER: enabled with IRQ 31
[    0.465279] pcieport 0000:00:08.1: AER: enabled with IRQ 32
[    0.466767] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.466810] Monitor-Mwait will be used to enter C-1 state
[    0.466816] ACPI: \_PR_.C000: Found 2 idle states
[    0.466875] ACPI: \_PR_.C002: Found 2 idle states
[    0.466939] ACPI: \_PR_.C004: Found 2 idle states
[    0.467005] ACPI: \_PR_.C006: Found 2 idle states
[    0.467058] ACPI: \_PR_.C008: Found 2 idle states
[    0.467131] ACPI: \_PR_.C00A: Found 2 idle states
[    0.467206] ACPI: \_PR_.C00C: Found 2 idle states
[    0.467278] ACPI: \_PR_.C00E: Found 2 idle states
[    0.467350] ACPI: \_PR_.C001: Found 2 idle states
[    0.467419] ACPI: \_PR_.C003: Found 2 idle states
[    0.467489] ACPI: \_PR_.C005: Found 2 idle states
[    0.467561] ACPI: \_PR_.C007: Found 2 idle states
[    0.467618] ACPI: \_PR_.C009: Found 2 idle states
[    0.467702] ACPI: \_PR_.C00B: Found 2 idle states
[    0.467783] ACPI: \_PR_.C00D: Found 2 idle states
[    0.467842] ACPI: \_PR_.C00F: Found 2 idle states
[    0.467998] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.468189] 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.469672] Non-volatile memory driver v1.3
[    0.469673] Linux agpgart interface v0.103
[    0.470109] tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the entire command/response buffer. [mem 0xd9255000-0xd9255fff flags 0x200] vs d9255000 4000
[    0.470121] tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the entire command/response buffer. [mem 0xd9259000-0xd9259fff flags 0x200] vs d9259000 4000
[    0.532604] ahci 0000:02:00.1: version 3.0
[    0.532705] ahci 0000:02:00.1: SSS flag set, parallel bus scan disabled
[    0.532755] ahci 0000:02:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[    0.532757] ahci 0000:02:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
[    0.533150] scsi host0: ahci
[    0.533233] scsi host1: ahci
[    0.533290] scsi host2: ahci
[    0.533342] scsi host3: ahci
[    0.533396] scsi host4: ahci
[    0.533447] scsi host5: ahci
[    0.533504] scsi host6: ahci
[    0.533559] scsi host7: ahci
[    0.533579] ata1: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980100 irq 41
[    0.533581] ata2: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980180 irq 41
[    0.533583] ata3: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980200 irq 41
[    0.533584] ata4: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980280 irq 41
[    0.533586] ata5: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980300 irq 41
[    0.533587] ata6: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980380 irq 41
[    0.533588] ata7: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980400 irq 41
[    0.533590] ata8: SATA max UDMA/133 abar m131072@0xfc980000 port 0xfc980480 irq 41
[    0.533705] ahci 0000:0c:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    0.533708] ahci 0000:0c:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
[    0.533802] scsi host8: ahci
[    0.533825] ata9: SATA max UDMA/133 abar m4096@0xfcd08000 port 0xfcd08100 irq 43
[    0.533855] i8042: PNP: No PS/2 controller found.
[    0.533892] mousedev: PS/2 mouse device common for all mice
[    0.533932] rtc_cmos 00:01: RTC can wake from S4
[    0.534305] rtc_cmos 00:01: registered as rtc0
[    0.534366] rtc_cmos 00:01: setting system clock to 2022-05-11T17:30:30 UTC (1652290230)
[    0.534377] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.534464] ledtrig-cpu: registered to indicate activity on CPUs
[    0.534477] efifb: probing for efifb
[    0.534484] efifb: framebuffer at 0xe0000000, using 3072k, total 3072k
[    0.534485] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    0.534486] efifb: scrolling: redraw
[    0.534486] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.534541] Console: switching to colour frame buffer device 128x48
[    0.535215] fb0: EFI VGA frame buffer device
[    0.535219] EFI Variables Facility v0.08 2004-May-17
[    0.539361] efivars: duplicate variable: DeploymentModeNv-97e8965f-c761-4f48-b6e4-9ffa9cb2a2d6
[    0.539378] hid: raw HID events driver (C) Jiri Kosina
[    0.539437] drop_monitor: Initializing network drop monitor service
[    0.549196] NET: Registered PF_INET6 protocol family
[    0.552704] Segment Routing with IPv6
[    0.552705] RPL Segment Routing with IPv6
[    0.552709] In-situ OAM (IOAM) with IPv6
[    0.553477] microcode: CPU0: patch_level=0x0800820d
[    0.553481] microcode: CPU1: patch_level=0x0800820d
[    0.553486] microcode: CPU2: patch_level=0x0800820d
[    0.553491] microcode: CPU3: patch_level=0x0800820d
[    0.553498] microcode: CPU4: patch_level=0x0800820d
[    0.553505] microcode: CPU5: patch_level=0x0800820d
[    0.553511] microcode: CPU6: patch_level=0x0800820d
[    0.553518] microcode: CPU7: patch_level=0x0800820d
[    0.553523] microcode: CPU8: patch_level=0x0800820d
[    0.553528] microcode: CPU9: patch_level=0x0800820d
[    0.553533] microcode: CPU10: patch_level=0x0800820d
[    0.553538] microcode: CPU11: patch_level=0x0800820d
[    0.553543] microcode: CPU12: patch_level=0x0800820d
[    0.553549] microcode: CPU13: patch_level=0x0800820d
[    0.553554] microcode: CPU14: patch_level=0x0800820d
[    0.553559] microcode: CPU15: patch_level=0x0800820d
[    0.553563] microcode: Microcode Update Driver: v2.2.
[    0.553566] IPI shorthand broadcast: enabled
[    0.553572] sched_clock: Marking stable (585416112, -31994679)->(931951844, -378530411)
[    0.553999] registered taskstats version 1
[    0.554109] Loading compiled-in X.509 certificates
[    0.554458] zswap: loaded using pool lzo/zbud
[    0.554598] page_owner is disabled
[    0.554639] Key type ._fscrypt registered
[    0.554640] Key type .fscrypt registered
[    0.554641] Key type fscrypt-provisioning registered
[    0.557607] Key type encrypted registered
[    0.557610] AppArmor: AppArmor sha1 policy hashing enabled
[    0.558477] integrity: Loading X.509 certificate: UEFI:db
[    0.596601] integrity: Loaded X.509 cert 'ASUSTeK MotherBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
[    0.596602] integrity: Loading X.509 certificate: UEFI:db
[    0.596720] integrity: Loaded X.509 cert 'ASUSTeK Notebook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
[    0.596721] integrity: Loading X.509 certificate: UEFI:db
[    0.596735] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.596736] integrity: Loading X.509 certificate: UEFI:db
[    0.596748] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.596749] integrity: Loading X.509 certificate: UEFI:db
[    0.596868] integrity: Loaded X.509 cert 'Canonical Ltd. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
[    0.597540] Loading compiled-in module X.509 certificates
[    0.597542] ima: Allocated hash algorithm: sha256
[    0.731919] ima: No architecture policies found
[    0.731930] evm: Initialising EVM extended attributes:
[    0.731931] evm: security.selinux
[    0.731932] evm: security.SMACK64 (disabled)
[    0.731932] evm: security.SMACK64EXEC (disabled)
[    0.731933] evm: security.SMACK64TRANSMUTE (disabled)
[    0.731933] evm: security.SMACK64MMAP (disabled)
[    0.731934] evm: security.apparmor
[    0.731934] evm: security.ima
[    0.731934] evm: security.capability
[    0.731935] evm: HMAC attrs: 0x1
[    0.818881] PM:   Magic number: 6:102:542
[    0.819031] RAS: Correctable Errors collector initialized.
[    0.846637] ata9: SATA link down (SStatus 0 SControl 300)
[    0.848391] ata1: SATA link down (SStatus 0 SControl 330)
[    1.164930] ata2: SATA link down (SStatus 0 SControl 330)
[    1.340412] tsc: Refined TSC clocksource calibration: 3693.060 MHz
[    1.340424] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6a77744cfd5, max_idle_ns: 881590969987 ns
[    1.340474] clocksource: Switched to clocksource tsc
[    1.476051] ata3: SATA link down (SStatus 0 SControl 330)
[    1.793024] ata4: SATA link down (SStatus 0 SControl 330)
[    2.104072] ata5: SATA link down (SStatus 0 SControl 300)
[    2.420109] ata6: SATA link down (SStatus 0 SControl 330)
[    2.737438] ata7: SATA link down (SStatus 0 SControl 330)
[    3.048035] ata8: SATA link down (SStatus 0 SControl 330)
[    3.049681] Freeing unused decrypted memory: 2036K
[    3.049934] Freeing unused kernel image (initmem) memory: 2628K
[    3.064014] Write protecting the kernel read-only data: 26624k
[    3.064943] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    3.065078] Freeing unused kernel image (rodata/data gap) memory: 116K
[    3.065083] Run /init as init process
[    3.065084]   with arguments:
[    3.065084]     /init
[    3.065085]   with environment:
[    3.065085]     HOME=/
[    3.065086]     TERM=linux
[    3.065086]     BOOT_IMAGE=/vmlinuz-5.18.0-rc6-vanilla
[    3.065087]     splash=silent
[    3.070595] efivarfs: module verification failed: signature and/or required key missing - tainting kernel
[    3.079125] efivars: duplicate variable: DeploymentModeNv-97e8965f-c761-4f48-b6e4-9ffa9cb2a2d6
[    3.080856] systemd[1]: systemd 250.4+suse.54.g736db5a59f running in system mode (+PAM +AUDIT +SELINUX +APPARMOR -IMA -SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    3.100041] systemd[1]: Detected architecture x86-64.
[    3.100043] systemd[1]: Running in initial RAM disk.
[    3.100064] systemd[1]: No hostname configured, using default hostname.
[    3.100099] systemd[1]: Hostname set to <localhost>.
[    3.130776] systemd[1]: /usr/lib/systemd/system/plymouth-start.service:15: Unit configured to use KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update your service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.
[    3.138536] systemd[1]: Queued start job for default target Initrd Default Target.
[    3.139177] systemd[1]: Created slice Slice /system/systemd-cryptsetup.
[    3.139400] systemd[1]: Created slice Slice /system/systemd-hibernate-resume.
[    3.139446] systemd[1]: Reached target Initrd /usr File System.
[    3.139468] systemd[1]: Reached target Slice Units.
[    3.139480] systemd[1]: Reached target Swaps.
[    3.139489] systemd[1]: Reached target Timer Units.
[    3.139564] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.139626] systemd[1]: Listening on Journal Socket.
[    3.139701] systemd[1]: Listening on udev Control Socket.
[    3.139754] systemd[1]: Listening on udev Kernel Socket.
[    3.139766] systemd[1]: Reached target Socket Units.
[    3.140638] systemd[1]: Started Entropy Daemon based on the HAVEGE algorithm.
[    3.141209] systemd[1]: Starting Create List of Static Device Nodes...
[    3.142138] systemd[1]: Starting Journal Service...
[    3.142697] systemd[1]: Starting Load Kernel Modules...
[    3.143131] systemd[1]: Starting Setup Virtual Console...
[    3.143482] systemd[1]: Finished Create List of Static Device Nodes.
[    3.143970] systemd[1]: Starting Create Static Device Nodes in /dev...
[    3.147238] systemd[1]: Finished Create Static Device Nodes in /dev.
[    3.147497] alua: device handler registered
[    3.147675] emc: device handler registered
[    3.147873] rdac: device handler registered
[    3.150765] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    3.150787] device-mapper: uevent: version 1.0.3
[    3.150823] device-mapper: ioctl: 4.46.0-ioctl (2022-02-22) initialised: dm-devel@redhat.com
[    3.156510] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[    3.156943] Bridge firewalling registered
[    3.158196] systemd[1]: Finished Load Kernel Modules.
[    3.158820] systemd[1]: Starting Apply Kernel Variables...
[    3.162113] systemd[1]: Finished Apply Kernel Variables.
[    3.178675] systemd[1]: Started Journal Service.
[    3.354895] nvme nvme0: pci function 0000:01:00.0
[    3.354912] ACPI: bus type USB registered
[    3.354951] usbcore: registered new interface driver usbfs
[    3.354961] usbcore: registered new interface driver hub
[    3.354991] usbcore: registered new device driver usb
[    3.356160] ccp 0000:0b:00.2: enabling device (0000 -> 0002)
[    3.356540] ccp 0000:0b:00.2: ccp enabled
[    3.357437] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    3.357500] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    3.357589] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    3.362252] cryptd: max_cpu_qlen set to 1000
[    3.363571] AVX2 version of gcm_enc/dec engaged.
[    3.363610] AES CTR mode by8 optimization enabled
[    5.823229] nvme nvme0: Shutdown timeout set to 8 seconds
[    5.855015] nvme nvme0: 32/0/0 default/read/poll queues
[    5.865189]  nvme0n1: p1 p2 p3
[    5.866663] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    5.866672] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 1
[    5.872495] ACPI: bus type drm_connector registered
[    5.879444] AMD-Vi: AMD IOMMUv2 loaded and initialized
[    5.922005] xhci_hcd 0000:02:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
[    5.922333] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
[    5.922336] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.922337] usb usb1: Product: xHCI Host Controller
[    5.922338] usb usb1: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.922339] usb usb1: SerialNumber: 0000:02:00.0
[    5.922423] hub 1-0:1.0: USB hub found
[    5.922438] hub 1-0:1.0: 14 ports detected
[    5.928282] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    5.928285] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 2
[    5.928287] xhci_hcd 0000:02:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    5.928324] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.928334] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
[    5.928336] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.928337] usb usb2: Product: xHCI Host Controller
[    5.928338] usb usb2: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.928339] usb usb2: SerialNumber: 0000:02:00.0
[    5.928397] hub 2-0:1.0: USB hub found
[    5.928406] hub 2-0:1.0: 8 ports detected
[    5.929224] usb: port power management may be unreliable
[    5.931853] xhci_hcd 0000:05:00.0: xHCI Host Controller
[    5.931857] xhci_hcd 0000:05:00.0: new USB bus registered, assigned bus number 3
[    5.957757] [drm] amdgpu kernel modesetting enabled.
[    5.957815] amdgpu: Ignoring ACPI CRAT on non-APU system
[    5.957818] amdgpu: Virtual CRAT table created for CPU
[    5.957824] amdgpu: Topology: Add CPU node
[    5.957896] checking generic (e0000000 300000) vs hw (e0000000 10000000)
[    5.957899] checking generic (e0000000 300000) vs hw (e0000000 10000000)
[    5.957900] fb0: switching to amdgpu from EFI VGA
[    5.958044] Console: switching to colour dummy device 80x25
[    5.958135] amdgpu 0000:0a:00.0: vgaarb: deactivate vga console
[    5.958243] [drm] initializing kernel modesetting (POLARIS12 0x1002:0x6995 0x1002:0x0B0C 0x00).
[    5.958247] amdgpu 0000:0a:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[    5.958255] [drm] register mmio base: 0xFCE00000
[    5.958256] [drm] register mmio size: 262144
[    5.958300] [drm] add ip block number 0 <vi_common>
[    5.958301] [drm] add ip block number 1 <gmc_v8_0>
[    5.958302] [drm] add ip block number 2 <tonga_ih>
[    5.958304] [drm] add ip block number 3 <gfx_v8_0>
[    5.958305] [drm] add ip block number 4 <sdma_v3_0>
[    5.958305] [drm] add ip block number 5 <powerplay>
[    5.958306] [drm] add ip block number 6 <dm>
[    5.958307] [drm] add ip block number 7 <uvd_v6_0>
[    5.958308] [drm] add ip block number 8 <vce_v3_0>
[    5.958552] amdgpu 0000:0a:00.0: No more image in the PCI ROM
[    5.958570] amdgpu 0000:0a:00.0: amdgpu: Fetched VBIOS from ROM BAR
[    5.958572] amdgpu: ATOM BIOS: 113-D0910200-100
[    5.958588] [drm] UVD is enabled in VM mode
[    5.958589] [drm] UVD ENC is enabled in VM mode
[    5.958590] [drm] VCE enabled in VM mode
[    5.958616] [drm] vm size is 256 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[    5.959561] amdgpu 0000:0a:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
[    5.959563] amdgpu 0000:0a:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[    5.959570] [drm] Detected VRAM RAM=2048M, BAR=256M
[    5.959571] [drm] RAM width 64bits GDDR5
[    5.959602] [drm] amdgpu: 2048M of VRAM memory ready
[    5.959603] [drm] amdgpu: 3072M of GTT memory ready.
[    5.959610] [drm] GART: num cpu pages 65536, num gpu pages 65536
[    5.961192] [drm] PCIE GART of 256M enabled (table at 0x000000F400300000).
[    5.962558] [drm] Chained IB support enabled!
[    5.968419] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
[    5.982977] [drm] Found UVD firmware Version: 1.130 Family ID: 16
[    5.989371] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
[    5.990678] xhci_hcd 0000:05:00.0: hcc params 0x0200eec0 hci version 0x110 quirks 0x0000000000800010
[    5.990999] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
[    5.991001] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.991002] usb usb3: Product: xHCI Host Controller
[    5.991003] usb usb3: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.991004] usb usb3: SerialNumber: 0000:05:00.0
[    5.991093] hub 3-0:1.0: USB hub found
[    5.991099] hub 3-0:1.0: 2 ports detected
[    5.991209] xhci_hcd 0000:05:00.0: xHCI Host Controller
[    5.991211] xhci_hcd 0000:05:00.0: new USB bus registered, assigned bus number 4
[    5.991213] xhci_hcd 0000:05:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    5.991236] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.991245] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
[    5.991247] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.991248] usb usb4: Product: xHCI Host Controller
[    5.991262] usb usb4: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.991263] usb usb4: SerialNumber: 0000:05:00.0
[    5.991333] hub 4-0:1.0: USB hub found
[    5.991340] hub 4-0:1.0: 2 ports detected
[    5.991481] xhci_hcd 0000:0b:00.3: xHCI Host Controller
[    5.991484] xhci_hcd 0000:0b:00.3: new USB bus registered, assigned bus number 5
[    5.991577] xhci_hcd 0000:0b:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000000000410
[    5.991823] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
[    5.991825] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.991826] usb usb5: Product: xHCI Host Controller
[    5.991826] usb usb5: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.991827] usb usb5: SerialNumber: 0000:0b:00.3
[    5.991882] hub 5-0:1.0: USB hub found
[    5.991887] hub 5-0:1.0: 4 ports detected
[    5.992025] xhci_hcd 0000:0b:00.3: xHCI Host Controller
[    5.992027] xhci_hcd 0000:0b:00.3: new USB bus registered, assigned bus number 6
[    5.992029] xhci_hcd 0000:0b:00.3: Host supports USB 3.0 SuperSpeed
[    5.992040] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    5.992055] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
[    5.992057] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    5.992059] usb usb6: Product: xHCI Host Controller
[    5.992060] usb usb6: Manufacturer: Linux 5.18.0-rc6-vanilla xhci-hcd
[    5.992061] usb usb6: SerialNumber: 0000:0b:00.3
[    5.992134] hub 6-0:1.0: USB hub found
[    5.992139] hub 6-0:1.0: 4 ports detected
[    6.244009] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[    6.312024] usb 3-1: new full-speed USB device number 2 using xhci_hcd
[    6.331313] [drm] Display Core initialized with v3.2.177!
[    6.395042] usb 5-1: New USB device found, idVendor=152e, idProduct=1640, bcdDevice= 1.59
[    6.395045] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.395047] usb 5-1: Product: SuperMulti RW   
[    6.395048] usb 5-1: Manufacturer: HLDS Inc
[    6.395049] usb 5-1: SerialNumber: 0010101640003D095
[    6.397235] usb-storage 5-1:1.0: USB Mass Storage device detected
[    6.397317] scsi host9: usb-storage 5-1:1.0
[    6.397360] usbcore: registered new interface driver usb-storage
[    6.397883] usbcore: registered new interface driver uas
[    6.525105] usb 5-2: new full-speed USB device number 3 using xhci_hcd
[    6.618293] [drm] UVD and UVD ENC initialized successfully.
[    6.711076] usb 5-2: New USB device found, idVendor=0472, idProduct=0065, bcdDevice= 1.00
[    6.711080] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    6.711083] usb 5-2: Product: Generic USB Hub
[    6.711084] usb 5-2: Manufacturer: Chicony 
[    6.718186] [drm] VCE initialized successfully.
[    6.719267] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    6.719377] amdgpu: SRAT table not found
[    6.719377] amdgpu: Virtual CRAT table created for GPU
[    6.719404] amdgpu: Topology: Add dGPU node [0x6995:0x1002]
[    6.719405] kfd kfd: amdgpu: added device 1002:6995
[    6.719420] amdgpu 0000:0a:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 5, active_cu_number 8
[    6.723310] [drm] Initialized amdgpu 3.46.0 20150101 for 0000:0a:00.0 on minor 0
[    6.730764] fbcon: amdgpudrmfb (fb0) is primary device
[    6.812579] usb 3-1: New USB device found, idVendor=0a12, idProduct=0001, bcdDevice=52.76
[    6.812583] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    6.872751] Console: switching to colour frame buffer device 160x45
[    6.889097] hub 5-2:1.0: USB hub found
[    6.890856] amdgpu 0000:0a:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    6.894074] hub 5-2:1.0: 3 ports detected
[    7.020015] usb 3-2: new high-speed USB device number 3 using xhci_hcd
[    7.216030] usb 5-2.1: new full-speed USB device number 4 using xhci_hcd
[    7.361074] usb 5-2.1: New USB device found, idVendor=0472, idProduct=0065, bcdDevice= 1.00
[    7.361079] usb 5-2.1: New USB device strings: Mfr=3, Product=4, SerialNumber=0
[    7.361081] usb 5-2.1: Product: PFU-65 USB Keyboard
[    7.361082] usb 5-2.1: Manufacturer: Chicony 
[    7.422460] scsi 9:0:0:0: CD-ROM            HL-DT-ST DVDRAM GE20NU11  CN01 PQ: 0 ANSI: 0
[    7.422620] scsi 9:0:0:0: Attached scsi generic sg0 type 5
[    7.528735] sr 9:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
[    7.528741] cdrom: Uniform CD-ROM driver Revision: 3.20
[    7.534600] sr 9:0:0:0: Attached scsi CD-ROM sr0
[    7.554145] usbcore: registered new interface driver usbhid
[    7.554147] usbhid: USB HID core driver
[    7.556213] input: Chicony  PFU-65 USB Keyboard as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.1/5-2.1:1.0/0003:0472:0065.0001/input/input0
[    7.616657] hid-generic 0003:0472:0065.0001: input,hidraw0: USB HID v1.00 Keyboard [Chicony  PFU-65 USB Keyboard] on usb-0000:0b:00.3-2.1/input0
[    7.624541] usb 5-2.3: new full-speed USB device number 5 using xhci_hcd
[    7.766085] usb 5-2.3: New USB device found, idVendor=046d, idProduct=c52b, bcdDevice=12.11
[    7.766089] usb 5-2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    7.766091] usb 5-2.3: Product: USB Receiver
[    7.766092] usb 5-2.3: Manufacturer: Logitech
[    8.187312] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.0/0003:046D:C52B.0002/input/input1
[    8.244519] hid-generic 0003:046D:C52B.0002: input,hidraw1: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:0b:00.3-2.3/input0
[    8.265305] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.1/0003:046D:C52B.0003/input/input2
[    8.265378] input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.1/0003:046D:C52B.0003/input/input3
[    8.324459] input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.1/0003:046D:C52B.0003/input/input4
[    8.324549] hid-generic 0003:046D:C52B.0003: input,hiddev96,hidraw2: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:0b:00.3-2.3/input1
[    8.338284] hid-generic 0003:046D:C52B.0004: hiddev97,hidraw3: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:0b:00.3-2.3/input2
[    8.577084] logitech-djreceiver 0003:046D:C52B.0004: hiddev96,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:0b:00.3-2.3/input2
[    8.700226] input: Logitech Wireless Device PID:406d Mouse as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.2/0003:046D:C52B.0004/0003:046D:406D.0005/input/input6
[    8.700300] hid-generic 0003:046D:406D.0005: input,hidraw2: USB HID v1.11 Mouse [Logitech Wireless Device PID:406d] on usb-0000:0b:00.3-2.3/input2:1
[    8.784122] input: Logitech M705 as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-2/5-2.3/5-2.3:1.2/0003:046D:C52B.0004/0003:046D:406D.0005/input/input10
[    8.784194] logitech-hidpp-device 0003:046D:406D.0005: input,hidraw2: USB HID v1.11 Mouse [Logitech M705] on usb-0000:0b:00.3-2.3/input2:1
[    9.453796] usb 3-2: New USB device found, idVendor=046d, idProduct=082d, bcdDevice= 0.11
[    9.453800] usb 3-2: New USB device strings: Mfr=0, Product=2, SerialNumber=1
[    9.453802] usb 3-2: Product: HD Pro Webcam C920
[    9.453802] usb 3-2: SerialNumber: FD767EAF
[   16.330803] Key type trusted registered
[   16.756973] PM: Image not found (code -22)
[   16.934929] SGI XFS with ACLs, security attributes, quota, no debug enabled
[   16.935913] XFS (dm-1): Mounting V5 Filesystem
[   16.980119] XFS (dm-1): Ending clean mount
[   17.194810] systemd-journald[307]: Received SIGTERM from PID 1 (systemd).
[   17.263002] systemd[1]: systemd 250.4+suse.54.g736db5a59f running in system mode (+PAM +AUDIT +SELINUX +APPARMOR -IMA -SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[   17.280037] systemd[1]: Detected architecture x86-64.
[   17.400740] systemd[1]: Configuration file /usr/lib/systemd/system/iscsi.service is marked executable. Please remove executable permission bits. Proceeding anyway.
[   17.400973] systemd[1]: Configuration file /usr/lib/systemd/system/iscsi-init.service is marked executable. Please remove executable permission bits. Proceeding anyway.
[   17.401207] systemd[1]: Configuration file /usr/lib/systemd/system/iscsid.socket is marked executable. Please remove executable permission bits. Proceeding anyway.
[   17.401377] systemd[1]: Configuration file /usr/lib/systemd/system/iscsid.service is marked executable. Please remove executable permission bits. Proceeding anyway.
[   17.401561] systemd[1]: Configuration file /usr/lib/systemd/system/iscsiuio.service is marked executable. Please remove executable permission bits. Proceeding anyway.
[   17.425161] systemd[1]: /etc/systemd/system/teamviewerd.service:9: PIDFile= references a path below legacy directory /var/run/, updating /var/run/teamviewerd.pid â†’ /run/teamviewerd.pid; please update the unit file accordingly.
[   17.442071] systemd[1]: /usr/lib/systemd/system/plymouth-start.service:15: Unit configured to use KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update your service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.
[   17.512968] systemd[1]: initrd-switch-root.service: Deactivated successfully.
[   17.513030] systemd[1]: Stopped Switch Root.
[   17.513240] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   17.513361] systemd[1]: Created slice Virtual Machine and Container Slice.
[   17.513588] systemd[1]: Created slice Slice /system/getty.
[   17.513813] systemd[1]: Created slice Slice /system/modprobe.
[   17.514036] systemd[1]: Created slice Slice /system/systemd-fsck.
[   17.514159] systemd[1]: Created slice User and Session Slice.
[   17.514208] systemd[1]: Arbitrary Executable File Formats File System Automount Point was skipped because of a failed condition check (ConditionPathExists=/proc/sys/fs/binfmt_misc).
[   17.514218] systemd[1]: Reached target Block Device Preparation for /dev/mapper/cr_nvme-Samsung_SSD_970_EVO_1TB_S467NF0K505274P-part3.
[   17.514243] systemd[1]: Stopped target Switch Root.
[   17.514258] systemd[1]: Stopped target Initrd File Systems.
[   17.514270] systemd[1]: Stopped target Initrd Root File System.
[   17.514285] systemd[1]: Reached target Local Integrity Protected Volumes.
[   17.514318] systemd[1]: Reached target Slice Units.
[   17.514338] systemd[1]: Reached target System Time Set.
[   17.514368] systemd[1]: Reached target Local Verity Protected Volumes.
[   17.514416] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   17.514573] systemd[1]: Listening on LVM2 poll daemon socket.
[   17.514617] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   17.514968] systemd[1]: Listening on udev Control Socket.
[   17.515028] systemd[1]: Listening on udev Kernel Socket.
[   17.515507] systemd[1]: Activating swap /dev/cap_vg/swap...
[   17.515986] systemd[1]: Mounting Huge Pages File System...
[   17.516474] systemd[1]: Mounting POSIX Message Queue File System...
[   17.516961] systemd[1]: Mounting Kernel Debug File System...
[   17.517447] systemd[1]: Mounting Kernel Trace File System...
[   17.518047] systemd[1]: Starting Load AppArmor profiles...
[   17.518735] systemd[1]: Starting Create List of Static Device Nodes...
[   17.519396] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   17.519745] Adding 8388604k swap on /dev/mapper/cap_vg-swap.  Priority:-2 extents:1 across:8388604k SSFS
[   17.520167] systemd[1]: Starting Load Kernel Module configfs...
[   17.520739] systemd[1]: Starting Load Kernel Module drm...
[   17.521366] systemd[1]: Starting Load Kernel Module fuse...
[   17.521450] systemd[1]: plymouth-start.service: Deactivated successfully.
[   17.521471] systemd[1]: plymouth-start.service: Unit process 504 (plymouthd) remains running after unit stopped.
[   17.521550] systemd[1]: Stopped Show Plymouth Boot Screen.
[   17.521653] systemd[1]: Dispatch Password Requests to Console Directory Watch was skipped because of a failed condition check (ConditionPathExists=!/run/plymouth/pid).
[   17.521676] systemd[1]: Reached target Local Encrypted Volumes.
[   17.521709] systemd[1]: plymouth-switch-root.service: Deactivated successfully.
[   17.521736] systemd[1]: Stopped Plymouth switch root service.
[   17.521792] systemd[1]: systemd-fsck-root.service: Deactivated successfully.
[   17.521816] systemd[1]: Stopped File System Check on Root Device.
[   17.521869] systemd[1]: Stopped Journal Service.
[   17.521944] systemd[1]: Stopping Entropy Daemon based on the HAVEGE algorithm...
[   17.522804] systemd[1]: Starting Load Kernel Modules...
[   17.523354] systemd[1]: Starting Remount Root and Kernel File Systems...
[   17.523956] systemd[1]: Starting Coldplug All udev Devices...
[   17.527053] fuse: init (API version 7.36)
[   17.529420] xfs filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
[   17.539000] audit: type=1400 audit(1652290247.498:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/lessopen.sh" pid=1009 comm="apparmor_parser"
[   17.539177] audit: type=1400 audit(1652290247.498:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="klogd" pid=1006 comm="apparmor_parser"
[   17.539259] audit: type=1400 audit(1652290247.498:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="dovecot-anvil" pid=1011 comm="apparmor_parser"
[   17.539984] audit: type=1400 audit(1652290247.498:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=998 comm="apparmor_parser"
[   17.540311] audit: type=1400 audit(1652290247.502:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=999 comm="apparmor_parser"
[   17.540316] audit: type=1400 audit(1652290247.502:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=999 comm="apparmor_parser"
[   17.541687] audit: type=1400 audit(1652290247.502:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ping" pid=996 comm="apparmor_parser"
[   17.541797] audit: type=1400 audit(1652290247.502:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="syslogd" pid=1008 comm="apparmor_parser"
[   17.542031] audit: type=1400 audit(1652290247.502:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/colord" pid=1010 comm="apparmor_parser"
[   17.542191] audit: type=1400 audit(1652290247.502:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ghostscript" pid=997 comm="apparmor_parser"
[   17.566554] systemd[1]: Activated swap /dev/cap_vg/swap.
[   17.566953] systemd[1]: haveged.service: Deactivated successfully.
[   17.567033] systemd[1]: Stopped Entropy Daemon based on the HAVEGE algorithm.
[   17.567611] systemd[1]: Mounted Huge Pages File System.
[   17.567677] systemd[1]: Mounted POSIX Message Queue File System.
[   17.567738] systemd[1]: Mounted Kernel Debug File System.
[   17.567801] systemd[1]: Mounted Kernel Trace File System.
[   17.567912] systemd[1]: Finished Load AppArmor profiles.
[   17.568040] systemd[1]: Finished Create List of Static Device Nodes.
[   17.568172] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[   17.568230] systemd[1]: Finished Load Kernel Module configfs.
[   17.568356] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   17.568412] systemd[1]: Finished Load Kernel Module drm.
[   17.568538] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[   17.568594] systemd[1]: Finished Load Kernel Module fuse.
[   17.568705] systemd[1]: Finished Load Kernel Modules.
[   17.568820] systemd[1]: Finished Remount Root and Kernel File Systems.
[   17.569388] systemd[1]: Reached target Swaps.
[   17.569841] systemd[1]: Mounting FUSE Control File System...
[   17.570243] systemd[1]: Mounting Kernel Configuration File System...
[   17.570431] systemd[1]: tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
[   17.571029] systemd[1]: Mounting Temporary Directory /tmp...
[   17.571097] systemd[1]: One time configuration for iscsid.service was skipped because of a failed condition check (ConditionPathExists=!/etc/iscsi/initiatorname.iscsi).
[   17.571150] systemd[1]: First Boot Wizard was skipped because of a failed condition check (ConditionFirstBoot=yes).
[   17.571664] systemd[1]: Rebuild Hardware Database was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
[   17.572784] systemd[1]: Starting Journal Service...
[   17.573362] systemd[1]: Starting Load/Save Random Seed...
[   17.573423] systemd[1]: Create System Users was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
[   17.574033] systemd[1]: Starting Create Static Device Nodes in /dev...
[   17.574620] systemd[1]: Mounted FUSE Control File System.
[   17.574710] systemd[1]: Mounted Kernel Configuration File System.
[   17.574786] systemd[1]: Mounted Temporary Directory /tmp.
[   17.583565] systemd[1]: Finished Load/Save Random Seed.
[   17.583673] systemd[1]: First Boot Complete was skipped because of a failed condition check (ConditionFirstBoot=yes).
[   17.586099] systemd[1]: Started Journal Service.
[   17.590539] systemd-journald[1051]: Received client request to flush runtime journal.
[   17.655023] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Quota mode: none.
[   17.682191] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input11
[   17.682247] ACPI: button: Power Button [PWRB]
[   17.682290] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input12
[   17.682348] ACPI: button: Power Button [PWRF]
[   17.682412] acpi_cpufreq: overriding BIOS provided _PSD data
[   17.689033] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
[   17.706113] dca service started, version 1.12.1
[   17.708214] be2net 0000:04:00.0: enabling device (0000 -> 0002)
[   17.708489] be2net 0000:04:00.0: PCIe error reporting enabled
[   17.710694] igb: Intel(R) Gigabit Ethernet Network Driver
[   17.710698] igb: Copyright (c) 2007-2014 Intel Corporation.
[   17.712398] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[   17.712401] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[   17.712859] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[   17.719281] efivars: duplicate variable: DeploymentModeNv-97e8965f-c761-4f48-b6e4-9ffa9cb2a2d6
[   17.719295] pstore: Using crash dump compression: lzo
[   17.719300] pstore: Registered efi as persistent store backend
[   17.722475] input: PC Speaker as /devices/platform/pcspkr/input/input13
[   17.730693] mc: Linux media interface: v0.10
[   17.730872] snd_virtuoso 0000:07:04.0: enabling device (0000 -> 0001)
[   17.741348] videodev: Linux video capture interface: v2.00
[   17.743542] pps pps0: new PPS source ptp0
[   17.743600] igb 0000:08:00.0: added PHC on eth0
[   17.743603] igb 0000:08:00.0: Intel(R) Gigabit Ethernet Network Connection
[   17.743604] igb 0000:08:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:ed:fb:72:e7:20
[   17.743609] igb 0000:08:00.0: eth0: PBA No: FFFFFF-0FF
[   17.743611] igb 0000:08:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
[   17.744673] snd_hda_intel 0000:0a:00.1: Force to non-snoop mode
[   17.744735] snd_hda_intel 0000:0c:00.3: enabling device (0000 -> 0002)
[   17.756473] Bluetooth: Core ver 2.22
[   17.756497] NET: Registered PF_BLUETOOTH protocol family
[   17.756498] Bluetooth: HCI device and connection manager initialized
[   17.756503] Bluetooth: HCI socket layer initialized
[   17.756505] Bluetooth: L2CAP socket layer initialized
[   17.756509] Bluetooth: SCO socket layer initialized
[   17.777773] snd_hda_intel 0000:0a:00.1: bound 0000:0a:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   17.786601] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card1/input14
[   17.789082] SVM: TSC scaling supported
[   17.789084] kvm: Nested Virtualization enabled
[   17.789085] SVM: kvm: Nested Paging enabled
[   17.789087] SEV supported: 16 ASIDs
[   17.789088] SEV-ES supported: 4294967295 ASIDs
[   17.789111] SVM: Virtual VMLOAD VMSAVE supported
[   17.789111] SVM: Virtual GIF supported
[   17.789112] SVM: LBR virtualization supported
[   17.789941] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card1/input15
[   17.790881] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card1/input16
[   17.791686] snd_hda_codec_realtek hdaudioC2D0: autoconfig for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
[   17.791691] snd_hda_codec_realtek hdaudioC2D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   17.791694] snd_hda_codec_realtek hdaudioC2D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
[   17.791701] snd_hda_codec_realtek hdaudioC2D0:    mono: mono_out=0x0
[   17.791703] snd_hda_codec_realtek hdaudioC2D0:    dig-out=0x1e/0x0
[   17.791704] snd_hda_codec_realtek hdaudioC2D0:    inputs:
[   17.791706] snd_hda_codec_realtek hdaudioC2D0:      Front Mic=0x19
[   17.791707] snd_hda_codec_realtek hdaudioC2D0:      Rear Mic=0x18
[   17.791708] snd_hda_codec_realtek hdaudioC2D0:      Line=0x1a
[   17.792353] igb 0000:08:00.0 enp8s0: renamed from eth0
[   17.792638] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card1/input17
[   17.792790] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card1/input18
[   17.798877] asus_wmi: ASUS WMI generic driver loaded
[   17.799990] asus_wmi: Initialization: 0x0
[   17.800003] intel_rapl_common: Found RAPL domain package
[   17.800012] intel_rapl_common: Found RAPL domain core
[   17.800049] asus_wmi: BIOS WMI version: 0.9
[   17.800245] asus_wmi: SFUN value: 0x0
[   17.800249] eeepc-wmi eeepc-wmi: Detected ASUSWMI, use DCTS
[   17.801036] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/input/input19
[   17.807745] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input20
[   17.807797] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input21
[   17.807836] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input22
[   17.807864] input: HD-Audio Generic Line Out Front as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input23
[   17.807896] input: HD-Audio Generic Line Out Surround as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input24
[   17.807946] input: HD-Audio Generic Line Out CLFE as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input25
[   17.807987] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card2/input26
[   17.808065] snd_hda_intel 0000:0c:00.3: device 1043:8733 is on the power_save denylist, forcing power_save to 0
[   17.809238] usbcore: registered new interface driver btusb
[   17.848230] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   17.848233] Bluetooth: BNEP filters: protocol multicast
[   17.848237] Bluetooth: BNEP socket layer initialized
[   17.972113] usbcore: registered new interface driver snd-usb-audio
[   17.972157] usb 3-2: Found UVC 1.00 device HD Pro Webcam C920 (046d:082d)
[   17.973466] input: HD Pro Webcam C920 as /devices/pci0000:00/0000:00:01.3/0000:02:00.2/0000:03:04.0/0000:05:00.0/usb3/3-2/3-2:1.0/input/input27
[   17.973520] usbcore: registered new interface driver uvcvideo
[   18.078779] NET: Registered PF_ALG protocol family
[   18.094304] bpfilter: Loaded bpfilter_umh pid 1392
[   18.094582] Started bpfilter
[   18.580016] be2net 0000:04:00.0: FW config: function_mode=0x10003, function_caps=0x7
[   18.812041] be2net 0000:04:00.0: Max: txqs 16, rxqs 17, rss 16, eqs 16, vfs 0
[   18.812047] be2net 0000:04:00.0: Max: uc-macs 30, mc-macs 64, vlans 64
[   18.812200] be2net 0000:04:00.0: enabled 4 MSI-x vector(s) for NIC
[   19.256039] be2net 0000:04:00.0: created 4 TX queue(s)
[   19.384033] be2net 0000:04:00.0: created 5 RX queue(s)
[   19.481036] be2net 0000:04:00.0: FW version is 10.0.803.19
[   19.482064] be2net 0000:04:00.0: HW Flow control - TX:1 RX:1
[   19.519063] be2net 0000:04:00.0: Adapter does not support HW error recovery
[   19.519319] be2net 0000:04:00.0: Emulex OneConnect(be3): PF  port 0
[   19.519354] be2net 0000:04:00.1: enabling device (0000 -> 0002)
[   19.519595] be2net 0000:04:00.1: PCIe error reporting enabled
[   19.792039] be2net 0000:04:00.1: FW config: function_mode=0x10003, function_caps=0x7
[   19.996417] be2net 0000:04:00.1: Max: txqs 16, rxqs 17, rss 16, eqs 16, vfs 0
[   19.996425] be2net 0000:04:00.1: Max: uc-macs 30, mc-macs 64, vlans 64
[   19.996585] be2net 0000:04:00.1: enabled 4 MSI-x vector(s) for NIC
[   20.416034] be2net 0000:04:00.1: created 4 TX queue(s)
[   20.536401] be2net 0000:04:00.1: created 5 RX queue(s)
[   20.633029] be2net 0000:04:00.1: FW version is 10.0.803.19
[   20.634037] be2net 0000:04:00.1: HW Flow control - TX:1 RX:1
[   20.671025] be2net 0000:04:00.1: Adapter does not support HW error recovery
[   20.671275] be2net 0000:04:00.1: Emulex OneConnect(be3): PF  port 1
[   20.677009] be2net 0000:04:00.1 enp4s0f1: renamed from eth1
[   20.696334] be2net 0000:04:00.0 enp4s0f0: renamed from eth0
[   20.890999] be2net 0000:04:00.1 enp4s0f1: Link is Up
[   20.894045] be2net 0000:04:00.1 enp4s0f1: Link is Up
[   21.041075] be2net 0000:04:00.0 enp4s0f0: Link is Down
[   21.116293] NET: Registered PF_PACKET protocol family
[   29.510824] usb 3-2: reset high-speed USB device number 3 using xhci_hcd
[   29.558556] rfkill: input handler disabled
[   30.735418] Bluetooth: RFCOMM TTY layer initialized
[   30.735426] Bluetooth: RFCOMM socket layer initialized
[   30.735429] Bluetooth: RFCOMM ver 1.11
[   32.962101] logitech-hidpp-device 0003:046D:406D.0005: HID++ 4.5 device connected.
[14039.852392] pcieport 0000:00:03.1: AER: Multiple Corrected error received: 0000:0a:00.0
[14039.852404] amdgpu 0000:0a:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
[14039.852407] amdgpu 0000:0a:00.0:   device [1002:6995] error status/mask=000000c0/00002000
[14039.852410] amdgpu 0000:0a:00.0:    [ 6] BadTLP                
[14039.852412] amdgpu 0000:0a:00.0:    [ 7] BadDLLP               
[40927.221157] ------------[ cut here ]------------
[40927.221159] WARNING: CPU: 4 PID: 652 at drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.c:140 dce110_fill_display_configs+0x4a/0x150 [amdgpu]
[40927.221405] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) rfcomm(E) af_packet(E) ocrdma(E) ib_uverbs(E) ib_core(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_tables(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) cmac(E) bpfilter(E) algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) intel_rapl_msr(E) eeepc_wmi(E) intel_rapl_common(E) asus_wmi(E) btusb(E) battery(E) snd_hda_codec_realtek(E) btrtl(E) sparse_keymap(E) dmi_sysfs(E) btbcm(E) uvcvideo(E) kvm_amd(E) snd_hda_codec_generic(E) videobuf2_vmalloc(E) btintel(E) video(E) wmi_bmof(E) platform_profile(E)
[40927.221436]  mxm_wmi(E) ledtrig_audio(E) btmtk(E) videobuf2_memops(E) asus_wmi_sensors(E) snd_hda_codec_hdmi(E) videobuf2_v4l2(E) videobuf2_common(E) bluetooth(E) kvm(E) snd_usb_audio(E) snd_hda_intel(E) snd_intel_dspcfg(E) irqbypass(E) videodev(E) snd_usbmidi_lib(E) snd_hda_codec(E) snd_virtuoso(E) mc(E) snd_hwdep(E) snd_oxygen_lib(E) snd_hda_core(E) snd_mpu401_uart(E) ecdh_generic(E) snd_rawmidi(E) snd_pcm(E) rfkill(E) pcspkr(E) snd_seq_device(E) efi_pstore(E) snd_timer(E) k10temp(E) i2c_piix4(E) snd(E) soundcore(E) igb(E) dca(E) be2net(E) wmi(E) gpio_amdpt(E) gpio_generic(E) tiny_power_button(E) button(E) acpi_cpufreq(E) nls_iso8859_1(E) nls_cp437(E) vfat(E) fat(E) ext4(E) mbcache(E) jbd2(E) fuse(E) configfs(E) ip_tables(E) x_tables(E) xfs(E) libcrc32c(E) dm_crypt(E) essiv(E) authenc(E) trusted(E) asn1_encoder(E) tee(E) hid_logitech_hidpp(E) hid_logitech_dj(E) hid_generic(E) usbhid(E) sr_mod(E) cdrom(E) uas(E) usb_storage(E) amdgpu(E) drm_ttm_helper(E) ttm(E)
[40927.221469]  iommu_v2(E) gpu_sched(E) i2c_algo_bit(E) crct10dif_pclmul(E) drm_dp_helper(E) crc32_pclmul(E) crc32c_intel(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) drm(E) xhci_pci(E) xhci_pci_renesas(E) cec(E) ghash_clmulni_intel(E) aesni_intel(E) crypto_simd(E) cryptd(E) sp5100_tco(E) xhci_hcd(E) ccp(E) rc_core(E) nvme(E) usbcore(E) nvme_core(E) sg(E) br_netfilter(E) bridge(E) stp(E) llc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) ledtrig_timer(E) msr(E) efivarfs(E)
[40927.221490] CPU: 4 PID: 652 Comm: kworker/4:1H Tainted: G            E     5.18.0-rc6-vanilla #2 8069f438b6581b6a5888034894c08ee033ce6cec
[40927.221493] Hardware name: System manufacturer System Product Name/PRIME X470-PRO, BIOS 5406 11/13/2019
[40927.221495] Workqueue: events_highpri dm_irq_work_func [amdgpu]
[40927.221727] RIP: 0010:dce110_fill_display_configs+0x4a/0x150 [amdgpu]
[40927.221963] Code: 31 ff 4d 8d 98 f0 01 00 00 49 8b 0c f8 4c 89 da 31 c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 10 08 00 00 83 f8 06 75 e8 <0f> 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 00 48 8b 50 08 8b
[40927.221964] RSP: 0018:ffffb09b806a3be0 EFLAGS: 00010246
[40927.221966] RAX: 0000000000000006 RBX: ffff89acb1d20000 RCX: ffff89adc52c5800
[40927.221968] RDX: ffff89acb1d23250 RSI: ffff89acb1d32980 RDI: 0000000000000001
[40927.221969] RBP: ffff89ac613f0000 R08: ffff89acb1d20000 R09: 0000000000000000
[40927.221970] R10: ffff89acb1d32980 R11: ffff89acb1d201f0 R12: ffff89acb1d32980
[40927.221970] R13: ffff89acb1d20000 R14: 0000000000000006 R15: 0000000000003258
[40927.221972] FS:  0000000000000000(0000) GS:ffff89bb1eb00000(0000) knlGS:0000000000000000
[40927.221973] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[40927.221974] CR2: 00005649e6633868 CR3: 0000000187902000 CR4: 00000000003506e0
[40927.221976] Call Trace:
[40927.221978]  <TASK>
[40927.221980]  dce11_pplib_apply_display_requirements+0x129/0x200 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.222216]  dce112_update_clocks+0x8d/0xf0 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.222451]  dc_commit_updates_for_stream+0x1a91/0x1ef0 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.222681]  ? detect_link_and_local_sink+0x3b4/0xb40 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.222908]  set_all_streams_dpms_off_for_link+0x10e/0x120 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.223136]  dc_link_detect+0x187/0x420 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.223368]  handle_hpd_irq_helper+0xe9/0x190 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.223599]  process_one_work+0x217/0x3e0
[40927.223604]  worker_thread+0x4d/0x3c0
[40927.223606]  ? rescuer_thread+0x380/0x380
[40927.223608]  kthread+0xd9/0x100
[40927.223611]  ? kthread_complete_and_exit+0x20/0x20
[40927.223613]  ret_from_fork+0x22/0x30
[40927.223617]  </TASK>
[40927.223617] ---[ end trace 0000000000000000 ]---
[40927.223620] BUG: kernel NULL pointer dereference, address: 0000000000000008
[40927.223624] #PF: supervisor read access in kernel mode
[40927.223626] #PF: error_code(0x0000) - not-present page
[40927.223627] PGD 0 P4D 0 
[40927.223630] Oops: 0000 [#1] PREEMPT SMP NOPTI
[40927.223632] CPU: 4 PID: 652 Comm: kworker/4:1H Tainted: G        W   E     5.18.0-rc6-vanilla #2 8069f438b6581b6a5888034894c08ee033ce6cec
[40927.223635] Hardware name: System manufacturer System Product Name/PRIME X470-PRO, BIOS 5406 11/13/2019
[40927.223636] Workqueue: events_highpri dm_irq_work_func [amdgpu]
[40927.223868] RIP: 0010:dce110_fill_display_configs+0x5b/0x150 [amdgpu]
[40927.224104] Code: c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 10 08 00 00 83 f8 06 75 e8 0f 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 00 <48> 8b 50 08 8b 9a 44 03 00 00 49 63 d1 41 83 c1 01 48 8d 14 92 49
[40927.224106] RSP: 0018:ffffb09b806a3be0 EFLAGS: 00010246
[40927.224108] RAX: 0000000000000000 RBX: ffff89acb1d20000 RCX: ffff89adc52c5800
[40927.224109] RDX: ffff89acb1d23250 RSI: ffff89acb1d32980 RDI: 0000000000000001
[40927.224111] RBP: ffff89ac613f0000 R08: ffff89acb1d20000 R09: 0000000000000000
[40927.224112] R10: ffff89acb1d32980 R11: ffff89acb1d201f0 R12: ffff89acb1d32980
[40927.224113] R13: ffff89acb1d20000 R14: 0000000000000006 R15: 0000000000003258
[40927.224115] FS:  0000000000000000(0000) GS:ffff89bb1eb00000(0000) knlGS:0000000000000000
[40927.224117] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[40927.224118] CR2: 0000000000000008 CR3: 0000000187902000 CR4: 00000000003506e0
[40927.224120] Call Trace:
[40927.224121]  <TASK>
[40927.224122]  dce11_pplib_apply_display_requirements+0x129/0x200 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.224358]  dce112_update_clocks+0x8d/0xf0 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.224593]  dc_commit_updates_for_stream+0x1a91/0x1ef0 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.224821]  ? detect_link_and_local_sink+0x3b4/0xb40 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.225048]  set_all_streams_dpms_off_for_link+0x10e/0x120 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.225276]  dc_link_detect+0x187/0x420 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.225503]  handle_hpd_irq_helper+0xe9/0x190 [amdgpu 0759483da7d8595cc918e08b982675c40db95651]
[40927.225735]  process_one_work+0x217/0x3e0
[40927.225738]  worker_thread+0x4d/0x3c0
[40927.225741]  ? rescuer_thread+0x380/0x380
[40927.225743]  kthread+0xd9/0x100
[40927.225745]  ? kthread_complete_and_exit+0x20/0x20
[40927.225748]  ret_from_fork+0x22/0x30
[40927.225751]  </TASK>
[40927.225752] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) rfcomm(E) af_packet(E) ocrdma(E) ib_uverbs(E) ib_core(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_tables(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) cmac(E) bpfilter(E) algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) intel_rapl_msr(E) eeepc_wmi(E) intel_rapl_common(E) asus_wmi(E) btusb(E) battery(E) snd_hda_codec_realtek(E) btrtl(E) sparse_keymap(E) dmi_sysfs(E) btbcm(E) uvcvideo(E) kvm_amd(E) snd_hda_codec_generic(E) videobuf2_vmalloc(E) btintel(E) video(E) wmi_bmof(E) platform_profile(E)
[40927.225778]  mxm_wmi(E) ledtrig_audio(E) btmtk(E) videobuf2_memops(E) asus_wmi_sensors(E) snd_hda_codec_hdmi(E) videobuf2_v4l2(E) videobuf2_common(E) bluetooth(E) kvm(E) snd_usb_audio(E) snd_hda_intel(E) snd_intel_dspcfg(E) irqbypass(E) videodev(E) snd_usbmidi_lib(E) snd_hda_codec(E) snd_virtuoso(E) mc(E) snd_hwdep(E) snd_oxygen_lib(E) snd_hda_core(E) snd_mpu401_uart(E) ecdh_generic(E) snd_rawmidi(E) snd_pcm(E) rfkill(E) pcspkr(E) snd_seq_device(E) efi_pstore(E) snd_timer(E) k10temp(E) i2c_piix4(E) snd(E) soundcore(E) igb(E) dca(E) be2net(E) wmi(E) gpio_amdpt(E) gpio_generic(E) tiny_power_button(E) button(E) acpi_cpufreq(E) nls_iso8859_1(E) nls_cp437(E) vfat(E) fat(E) ext4(E) mbcache(E) jbd2(E) fuse(E) configfs(E) ip_tables(E) x_tables(E) xfs(E) libcrc32c(E) dm_crypt(E) essiv(E) authenc(E) trusted(E) asn1_encoder(E) tee(E) hid_logitech_hidpp(E) hid_logitech_dj(E) hid_generic(E) usbhid(E) sr_mod(E) cdrom(E) uas(E) usb_storage(E) amdgpu(E) drm_ttm_helper(E) ttm(E)
[40927.225806]  iommu_v2(E) gpu_sched(E) i2c_algo_bit(E) crct10dif_pclmul(E) drm_dp_helper(E) crc32_pclmul(E) crc32c_intel(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) drm(E) xhci_pci(E) xhci_pci_renesas(E) cec(E) ghash_clmulni_intel(E) aesni_intel(E) crypto_simd(E) cryptd(E) sp5100_tco(E) xhci_hcd(E) ccp(E) rc_core(E) nvme(E) usbcore(E) nvme_core(E) sg(E) br_netfilter(E) bridge(E) stp(E) llc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) ledtrig_timer(E) msr(E) efivarfs(E)
[40927.225825] CR2: 0000000000000008
[40927.225826] ---[ end trace 0000000000000000 ]---
[40927.288694] RIP: 0010:dce110_fill_display_configs+0x5b/0x150 [amdgpu]
[40927.288881] Code: c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 10 08 00 00 83 f8 06 75 e8 0f 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 00 <48> 8b 50 08 8b 9a 44 03 00 00 49 63 d1 41 83 c1 01 48 8d 14 92 49
[40927.288883] RSP: 0018:ffffb09b806a3be0 EFLAGS: 00010246
[40927.288885] RAX: 0000000000000000 RBX: ffff89acb1d20000 RCX: ffff89adc52c5800
[40927.288886] RDX: ffff89acb1d23250 RSI: ffff89acb1d32980 RDI: 0000000000000001
[40927.288887] RBP: ffff89ac613f0000 R08: ffff89acb1d20000 R09: 0000000000000000
[40927.288888] R10: ffff89acb1d32980 R11: ffff89acb1d201f0 R12: ffff89acb1d32980
[40927.288889] R13: ffff89acb1d20000 R14: 0000000000000006 R15: 0000000000003258
[40927.288890] FS:  0000000000000000(0000) GS:ffff89bb1eb00000(0000) knlGS:0000000000000000
[40927.288892] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[40927.288893] CR2: 0000000000000008 CR3: 0000000187902000 CR4: 00000000003506e0
[40964.855142] BUG: workqueue lockup - pool cpus=4 node=0 flags=0x0 nice=-20 stuck for 37s!
[40964.855165] Showing busy workqueues and worker pools:
[40964.855173] workqueue events_highpri: flags=0x10
[40964.855179]   pwq 9: cpus=4 node=0 flags=0x0 nice=-20 active=2/256 refcnt=3
[40964.855184]     in-flight: 652:dm_irq_work_func [amdgpu]
[40964.855532]     pending: mix_interrupt_randomness
[40964.855579] workqueue kblockd: flags=0x18
[40964.855583]   pwq 9: cpus=4 node=0 flags=0x0 nice=-20 active=1/256 refcnt=2
[40964.855587]     pending: blk_mq_run_work_fn
[40964.855676] workqueue be_wq: flags=0xe000a
[40964.855679]   pwq 64: cpus=0-31 flags=0x4 nice=0 active=1/1 refcnt=3
[40964.855683]     pending: be_worker [be2net]
[40964.855696] workqueue be_err_recover: flags=0xe000a
[40964.855699]   pwq 64: cpus=0-31 flags=0x4 nice=0 active=1/1 refcnt=3
[40964.855702]     pending: be_err_detection_task [be2net]
[40964.855721] pool 9: cpus=4 node=0 flags=0x0 nice=-20 hung=37s workers=4 idle: 43 10628 10627

--y/sm5vv153e45xiY--
