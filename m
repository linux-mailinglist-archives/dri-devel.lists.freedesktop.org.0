Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA31BD4EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051FF6ECB0;
	Wed, 29 Apr 2020 06:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918F16E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 20:32:22 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id o19so23251983qkk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=KkLm9Pi6aQr4bvE1oGSex6kAAt6zgdWomqcl71iBuH8=;
 b=gNdRgNQiXOOfsBqhH8gmwB3zRfIQvwQixMP8RigSFq3Nac40yhBowu0FpYGoNOlZVY
 zsawZ/83YW1SpMMLxtKBcJXBWmm6RlO251iO/LhIMw6h5YmMGMbzdM6O31TsSbJa39j6
 IOgeoz/ytmVIlco9XjhtTETll5HiO4MNBpDS6x4JqwntYNiFuWcYwV+fygTCLOnM72vv
 Zn+05/GtZdSDHXeLp2C7qYvoP1NcayWSZ2Mb/7eZwKypZd2FPvQCcTjX7lElfz4ocQtO
 vfWOlkessksUfBxcluMM37HVFHbALyGZlKvbhzQdkNct1PS1pRiJbv39WlBGjfiNtL9w
 WKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KkLm9Pi6aQr4bvE1oGSex6kAAt6zgdWomqcl71iBuH8=;
 b=nJNvYaHjbeUsr86xh3p6TdScis3h3oLrrTGfWoQvQ9jHqbaNi95+o3IAVNpgWi2HdS
 8jwlnFQOoXHvXJKJlXjcXPfRx7mwuDXik/oZn+x7O6093Y10cnLPVzzmvEq6pcmv5H+U
 rwAva0lu9k4jIs0LkizjcU7jJJ2U7f3MdA0zcy+tG0ac0UaaXiI9Ky/Dm40fwsi5aFKW
 3xFF1HK7sH7ROsZ26QD+GH3HVo8fD9nubCBbDbJkybEsccyDHAtagDhyUhWu6boxs0nM
 lHkNJhieXM1Cga3suNT/qczvul71gtfvXVLMr6XLOOOY2SvGIRdNS93ueMq2BrKxjj/p
 GO9g==
X-Gm-Message-State: AGi0PuZRd5gjO0XcPS1Tjw1P2MSL6wiXNzj4oi6TLTVKo42A0tf+LBRz
 25MuKtoJo5o6vSQfEZkKuyU=
X-Google-Smtp-Source: APiQypLDPPzcAj3mGwLRlu7XDJG/5nQW1h5weesucTBokDcOuzZDgYFmr3A2kCszd33/wZGK0zJU3g==
X-Received: by 2002:a37:de16:: with SMTP id h22mr28102489qkj.195.1588105941007; 
 Tue, 28 Apr 2020 13:32:21 -0700 (PDT)
Received: from cogarre-lenovo-linux.localdomain ([2602:4b:7802:7c01::146])
 by smtp.gmail.com with ESMTPSA id o94sm14506659qtd.34.2020.04.28.13.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 13:32:20 -0700 (PDT)
Message-ID: <c65c61281ca8243ffaf8dc19de492f0e0df27742.camel@gmail.com>
Subject: Re: Msg "PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast]
 returns -22" after migrating to V5.6.7 kernel from v5.5.10.
From: Cary Garrett <cogarre@gmail.com>
To: David Airlie <airlied@redhat.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
Date: Tue, 28 Apr 2020 15:32:18 -0500
In-Reply-To: <CAMwc25pMJp7gS4dOOsieywAcGA53XjtOK47k5e8svL5QLP6muw@mail.gmail.com>
References: <b0e7694c33aadb8e3c87dee281e2bc56c9dbbc9e.camel@gmail.com>
 <CAMwc25pMJp7gS4dOOsieywAcGA53XjtOK47k5e8svL5QLP6muw@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dave,

Generating & booting v5.5.19 kernel, system will successfully enter suspend state.

Generating & booting v5.6.0  kernel, system fails to enter suspend state.

v5.5.19 "lspci -vvvv -s 00:04:00" output:

04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30) (prog-if
00 [VGA controller])
	DeviceName: Onboard VGA
	Subsystem: Super Micro Computer Inc ASPEED Graphics Family
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR-
<PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
	Region 2: I/O ports at d000 [size=128]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Kernel driver in use: ast
	Kernel modules: ast

v5.6.0 "lspci -vvvv -s 00:04:00" output:

04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30) (prog-if
00 [VGA controller])
	DeviceName: Onboard VGA
	Subsystem: Super Micro Computer Inc ASPEED Graphics Family
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR-
<PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
	Region 2: I/O ports at d000 [size=128]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Kernel driver in use: ast
	Kernel modules: ast


v5.5.19 "modinfo ast" output:

filename:       /lib/modules/5.5.19/kernel/drivers/gpu/drm/ast/ast.ko.xz
license:        GPL and additional rights
description:    AST
author:         Dave Airlie
firmware:       ast_dp501_fw.bin
srcversion:     ABBD643B3936ECA879F0CE8
alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,drm_vram_helper,i2c-algo-bit
retpoline:      Y
intree:         Y
name:           ast
vermagic:       5.5.19 SMP preempt mod_unload 
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        1F:7D:19:82:14:6F:30:FF:FD:11:EF:72:8D:00:41:52:AA:7E:C7:26
sig_hashalgo:   sha512
signature:      A6:B0:FE:86:CD:71:93:67:1B:13:7B:C8:F7:4F:06:19:83:DA:0A:B3:
		04:3A:F9:84:AA:84:BB:A1:86:A0:E6:94:03:EA:95:70:0A:D4:08:5E:
		37:C6:8A:E0:4C:A9:09:E9:F0:F1:16:A9:7B:08:BD:B5:99:F1:4E:99:
		3D:BF:78:37:54:90:6A:DF:8C:E8:AD:08:75:17:38:94:02:24:2F:27:
		74:D7:F6:8D:0A:14:70:98:5C:95:3D:7F:D6:9A:38:39:DC:70:CF:37:
		EB:E5:06:88:92:31:84:CF:AD:E8:E2:94:77:69:7B:66:01:55:C6:B7:
		20:21:B5:CB:89:84:97:FB:27:FF:65:D2:DD:EF:74:DC:6A:4A:68:72:
		3A:2C:C9:CD:E6:62:0D:8F:FA:74:ED:C6:5E:F3:C8:52:19:23:66:9B:
		B5:56:98:78:C0:4A:3E:ED:6D:FF:E5:71:58:2E:0E:E0:EC:AD:19:62:
		22:87:60:D8:F2:D2:9E:15:7F:4F:2C:AB:F6:CE:76:2B:A1:CA:86:67:
		E8:B3:3A:9C:47:B0:B4:46:2D:2A:80:05:F1:73:C9:63:DE:49:48:C5:
		AE:C2:21:2B:CB:CD:63:AB:06:F1:EF:1D:27:8E:C5:E1:8E:9A:49:6B:
		F3:90:39:6C:01:C4:F4:E4:C4:E4:0C:F7:32:D6:A2:AA:46:C4:A7:B2:
		C3:D9:0B:BC:79:A5:7B:2D:6C:58:AD:4A:41:FD:8F:F4:DF:C9:D3:D4:
		51:12:E9:16:FC:53:C4:C7:4E:63:19:6B:A6:B4:63:37:52:E2:60:AD:
		B3:57:43:AD:3B:A9:8E:11:83:68:8C:CE:23:8A:AE:75:6C:C7:3F:40:
		61:5E:70:C9:78:75:6E:D0:5A:48:DB:47:35:6C:50:F5:D0:E0:54:B5:
		94:A5:44:81:DE:01:02:AC:55:5C:BD:2D:85:F8:93:B4:04:D6:83:4D:
		99:75:0F:F4:7E:54:DD:5F:27:53:20:7A:B2:B9:41:F4:EC:F4:2F:7E:
		01:B3:05:6B:1E:04:2F:48:E9:62:3B:56:B7:EE:2C:60:C0:5A:CB:34:
		A2:7F:B6:63:D4:F5:5A:83:FE:7E:08:E4:31:0F:9F:F7:B7:1E:50:04:
		0F:A9:C7:CB:19:2B:D6:0B:FF:BB:DD:8C:2E:84:30:93:83:4C:E5:29:
		FB:F3:F0:70:0C:D1:EF:00:DD:AC:78:D7:A0:1B:0F:2E:42:92:33:91:
		C0:61:3F:FC:B3:EF:92:57:0D:6D:21:DB:3F:C9:75:34:85:14:C4:D2:
		9C:1D:60:42:5F:8C:06:59:1E:3A:D4:62:3C:EB:83:05:57:18:D0:13:
		59:C7:E6:C4:EC:3C:BC:DE:94:B1:18:04
parm:           modeset:Disable/Enable modesetting (int)


v5.6.0 "modinfo ast" output:

filename:       /lib/modules/5.6.0/kernel/drivers/gpu/drm/ast/ast.ko.xz
license:        GPL and additional rights
description:    AST
author:         Dave Airlie
firmware:       ast_dp501_fw.bin
srcversion:     64E79F607231209C250D3DF
alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,drm_vram_helper,i2c-algo-bit
retpoline:      Y
intree:         Y
name:           ast
vermagic:       5.6.0 SMP preempt mod_unload 
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        23:40:BB:E8:3F:5D:32:51:08:5D:65:C5:CA:11:F1:FE:85:C0:21:62
sig_hashalgo:   sha512
signature:      5D:9D:FD:C8:07:49:D6:79:3F:71:1E:9B:34:A5:CB:9D:B8:3B:4C:12:
		44:AD:B9:DD:83:45:62:28:0F:2D:F0:F4:97:CD:E1:A6:22:E9:61:70:
		58:3C:E1:90:CA:ED:71:F5:22:ED:DF:2E:3E:EA:9F:24:58:91:EC:94:
		78:2A:D9:47:94:E9:8A:14:82:38:09:FC:2A:C5:4B:00:28:BD:9E:6C:
		FA:78:2F:17:7C:1E:B8:05:64:F4:D7:A1:AD:00:7E:31:7F:21:6C:44:
		8B:42:DB:FF:5D:7B:F2:0E:8A:50:F9:2D:9E:D2:C6:38:B6:CE:65:16:
		4A:FC:AD:21:19:93:A7:F9:92:B2:5B:13:9A:6B:17:53:E3:13:55:86:
		FB:44:5D:1F:F0:26:EB:2D:CC:48:85:EE:05:06:10:7F:EF:12:A5:25:
		50:53:BF:61:7B:14:5B:51:D2:F3:71:91:BA:92:41:06:9D:19:64:21:
		F1:E1:73:88:6E:C1:24:E9:5E:70:71:3A:D3:E2:D5:CB:E9:BF:0E:DD:
		7D:CA:A2:6D:A3:25:50:DB:91:61:00:95:CD:CF:96:05:E5:79:EE:B4:
		1E:92:52:82:0F:CB:C6:8C:61:B5:E4:28:59:DB:9D:32:D4:1F:70:26:
		69:1A:1F:D3:DC:18:02:09:7C:8E:9E:BA:EF:26:EB:14:C8:37:3E:33:
		A7:C2:B0:A6:11:28:19:6F:A3:6E:55:43:0E:00:B5:8A:D1:90:92:DD:
		F2:24:A2:B8:F8:66:8D:54:A5:7B:FD:08:AF:DE:25:82:1D:A8:A0:46:
		DD:A2:37:6F:BD:30:95:98:F6:C7:AB:4C:D0:24:CB:95:CB:5C:DD:67:
		B6:75:00:B5:BA:B5:D8:53:14:75:FE:C7:DF:08:F7:2D:01:86:07:C8:
		DD:A9:B7:A3:98:51:D1:E4:A7:45:AA:B2:A2:20:A3:59:0A:CF:93:8B:
		04:DA:5E:3D:60:01:FA:04:51:6E:04:DC:1B:DF:7E:4D:A8:C2:93:11:
		08:34:DD:F5:2B:5F:A9:97:0C:F6:AB:82:09:82:95:C3:AF:2F:7F:74:
		75:67:AB:3F:6B:AA:47:33:FC:E6:D0:70:3C:98:54:19:6B:06:05:E5:
		E9:AC:50:E7:79:86:D5:28:D1:16:EE:0C:E4:49:CA:CD:8A:66:D2:44:
		21:A2:91:68:BB:52:12:CC:54:10:24:93:B9:3D:E6:54:E1:2A:38:CA:
		8B:31:D5:7C:B4:1B:BF:4A:30:A4:8F:E1:38:EA:43:B3:61:FB:1A:9B:
		42:31:3E:3D:DC:FF:4D:16:AE:66:6F:2F:17:6E:C1:22:9B:EB:39:93:
		ED:B3:6D:A5:DE:FD:2B:8F:3B:8D:72:8A
parm:           modeset:Disable/Enable modesetting (int)

v5.5.19 journalctl output with successful suspend:

Apr 28 13:08:25.718612 systemd[1]: Starting Suspend...
Apr 28 13:08:25.738711 systemd-sleep[834]: Suspending system...
Apr 28 13:08:25.742174 kernel: PM: suspend entry (deep)
Apr 28 13:10:04.675314 kernel: Filesystems sync: 0.115 seconds
Apr 28 13:10:04.677105 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
Apr 28 13:10:04.677307 kernel: OOM killer disabled.
Apr 28 13:10:04.677528 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
Apr 28 13:10:04.677681 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
Apr 28 13:10:04.677819 kernel: sd 0:0:1:0: [sdb] Synchronizing SCSI cache
Apr 28 13:10:04.678897 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
Apr 28 13:10:04.679825 kernel: sd 1:0:0:0: [sdc] Synchronizing SCSI cache
Apr 28 13:10:04.680809 kernel: sd 1:0:0:0: [sdc] Stopping disk
Apr 28 13:10:04.681478 kernel: serial 00:09: disabled
Apr 28 13:10:04.682073 kernel: serial 00:06: disabled
Apr 28 13:10:04.682589 kernel: serial 00:05: disabled
Apr 28 13:10:04.683123 kernel: mpt2sas_cm0: pdev=0x00000000a26a7193, slot=0000:02:00.0, entering
operating state [D3]
Apr 28 13:10:04.683216 kernel: mpt2sas_cm0: sending message unit reset !!
Apr 28 13:10:04.683321 kernel: mpt2sas_cm0: message unit reset: SUCCESS
Apr 28 13:10:04.683407 kernel: ACPI: Preparing to enter system sleep state S3
Apr 28 13:10:04.683520 kernel: PM: Saving platform NVS memory
Apr 28 13:10:04.683588 kernel: Disabling non-boot CPUs ...
Apr 28 13:10:04.683695 kernel: smpboot: CPU 1 is now offline
Apr 28 13:10:04.683771 kernel: smpboot: CPU 2 is now offline
Apr 28 13:10:04.683826 kernel: smpboot: CPU 3 is now offline
Apr 28 13:10:04.683910 kernel: smpboot: CPU 4 is now offline
Apr 28 13:10:04.683994 kernel: smpboot: CPU 5 is now offline
Apr 28 13:10:04.684086 kernel: smpboot: CPU 6 is now offline
Apr 28 13:10:04.684151 kernel: smpboot: CPU 7 is now offline
Apr 28 13:10:04.684182 kernel: ACPI: Low-level resume complete
Apr 28 13:10:04.684224 kernel: PM: Restoring platform NVS memory
Apr 28 13:10:04.684258 kernel: Enabling non-boot CPUs ...
Apr 28 13:10:04.684284 kernel: x86: Booting SMP configuration:
Apr 28 13:10:04.684311 kernel: smpboot: Booting Node 0 Processor 1 APIC 0x2
Apr 28 13:10:04.684354 kernel: CPU1 is up
Apr 28 13:10:04.684383 kernel: smpboot: Booting Node 0 Processor 2 APIC 0x4
Apr 28 13:10:04.684433 kernel: CPU2 is up
Apr 28 13:10:04.684469 kernel: smpboot: Booting Node 0 Processor 3 APIC 0x6
Apr 28 13:10:04.684508 kernel: CPU3 is up
Apr 28 13:10:04.684556 kernel: smpboot: Booting Node 0 Processor 4 APIC 0x1
Apr 28 13:10:04.684595 kernel: CPU4 is up
Apr 28 13:10:04.684641 kernel: smpboot: Booting Node 0 Processor 5 APIC 0x3
Apr 28 13:10:04.684672 kernel: CPU5 is up
Apr 28 13:10:04.684705 kernel: smpboot: Booting Node 0 Processor 6 APIC 0x5
Apr 28 13:10:04.684729 kernel: CPU6 is up
Apr 28 13:10:04.684751 kernel: smpboot: Booting Node 0 Processor 7 APIC 0x7
Apr 28 13:10:04.684780 kernel: CPU7 is up
Apr 28 13:10:04.684821 kernel: ACPI: Waking up from system sleep state S3

v5.6.0 journalctl output with suspend failure:

Apr 28 14:36:07.392012 systemd[1]: Starting Suspend...
Apr 28 14:36:07.411391 systemd-sleep[822]: Suspending system...
Apr 28 14:36:07.412243 kernel: PM: suspend entry (deep)
Apr 28 14:36:07.737049 kernel: Filesystems sync: 0.072 seconds
Apr 28 14:36:07.737448 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
Apr 28 14:36:07.737554 kernel: OOM killer disabled.
Apr 28 14:36:07.737621 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
Apr 28 14:36:07.737699 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
Apr 28 14:36:07.737772 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
Apr 28 14:36:07.738414 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
Apr 28 14:36:07.739050 kernel: serial 00:09: disabled
Apr 28 14:36:07.739401 kernel: serial 00:06: disabled
Apr 28 14:36:07.740474 kernel: serial 00:05: disabled


Apr 28 14:36:07.741713 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22   <<<
Apr 28 14:36:07.742794 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22      <<<
Apr 28 14:36:07.744096 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22        <<<


Apr 28 14:36:07.746388 kernel: mpt2sas_cm0: pdev=0x000000000c3287bf, slot=0000:02:00.0, entering
operating state [D3]
Apr 28 14:36:07.746664 kernel: mpt2sas_cm0: sending message unit reset !!
Apr 28 14:36:07.746717 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
Apr 28 14:36:07.747016 kernel: mpt2sas_cm0: message unit reset: SUCCESS
Apr 28 14:36:07.747065 kernel: sd 0:0:0:0: [sda] Stopping disk
Apr 28 14:36:07.747319 kernel: PM: Some devices failed to suspend, or early wake event detected
Apr 28 14:36:07.747359 kernel: sd 0:0:0:0: [sda] Starting disk
Apr 28 14:36:07.747613 kernel: serial 00:05: activated
Apr 28 14:36:07.747835 kernel: serial 00:06: activated
Apr 28 14:36:07.748042 kernel: serial 00:09: activated
Apr 28 14:36:07.748240 kernel: mpt2sas_cm0: pdev=0x000000000c3287bf, slot=0000:02:00.0, previous
operating state [D0]
Apr 28 14:36:07.748277 kernel: mpt2sas_cm0: 64 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem
(16354840 kB)
Apr 28 14:36:07.748319 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size
to 4k
Apr 28 14:36:07.748360 kernel: mpt2sas_cm0: MSI-X vectors supported: 16
Apr 28 14:36:07.748394 kernel:          no of cores: 8, max_msix_vectors: -1
Apr 28 14:36:07.748429 kernel: mpt2sas_cm0:  0 8
Apr 28 14:36:07.748474 kernel: mpt2sas_cm0: High IOPs queues : disabled
Apr 28 14:36:07.748509 kernel: mpt2sas0-msix0: PCI-MSI-X enabled: IRQ 42
Apr 28 14:36:07.748544 kernel: mpt2sas0-msix1: PCI-MSI-X enabled: IRQ 43
Apr 28 14:36:07.748586 kernel: mpt2sas0-msix2: PCI-MSI-X enabled: IRQ 44
Apr 28 14:36:07.748621 kernel: mpt2sas0-msix3: PCI-MSI-X enabled: IRQ 45
Apr 28 14:36:07.748655 kernel: mpt2sas0-msix4: PCI-MSI-X enabled: IRQ 46
Apr 28 14:36:07.748701 kernel: mpt2sas0-msix5: PCI-MSI-X enabled: IRQ 47
Apr 28 14:36:07.749424 kernel: mpt2sas0-msix6: PCI-MSI-X enabled: IRQ 48
Apr 28 14:36:07.749470 kernel: mpt2sas0-msix7: PCI-MSI-X enabled: IRQ 49
Apr 28 14:36:07.749495 kernel: mpt2sas_cm0: iomem(0x00000000f7240000), mapped(0x00000000c0192d50),
size(65536)
Apr 28 14:36:07.749528 kernel: mpt2sas_cm0: ioport(0x000000000000e000), size(256)
Apr 28 14:36:07.749556 kernel: mpt2sas_cm0: Issuing Hard Reset as part of OS Resume
Apr 28 14:36:07.749579 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size
to 4k
Apr 28 14:36:07.749606 kernel: mpt2sas_cm0: LSISAS2308: FWVersion(20.00.04.00), ChipRevision(0x05),
BiosVersion(07.39.00.00)
Apr 28 14:36:07.749639 kernel: mpt2sas_cm0: Protocol=(Initiator,Target),
Capabilities=(TLR,EEDP,Snapshot Buffer,Diag Trace Buffer,Task Set Full,NCQ)
Apr 28 14:36:07.749662 kernel: mpt2sas_cm0: sending port enable !!
Apr 28 14:36:07.749692 kernel: mpt2sas_cm0: port enable: SUCCESS
Apr 28 14:36:07.749732 kernel: mpt2sas_cm0: search for end-devices: start
Apr 28 14:36:07.749767 kernel: scsi target6:0:1: handle(0x0009), sas_addr(0x4433221101000000)
Apr 28 14:36:07.750041 kernel: scsi target6:0:1: enclosure logical id(0x50030480119cb000), slot(2)
Apr 28 14:36:07.750296 kernel: scsi target6:0:0: handle(0x000a), sas_addr(0x4433221103000000)
Apr 28 14:36:07.750554 kernel: scsi target6:0:0: enclosure logical id(0x50030480119cb000), slot(0)
Apr 28 14:36:07.750793 kernel: mpt2sas_cm0: search for end-devices: complete
Apr 28 14:36:07.750828 kernel: mpt2sas_cm0: search for end-devices: start
Apr 28 14:36:07.750861 kernel: mpt2sas_cm0: search for PCIe end-devices: complete
Apr 28 14:36:07.750883 kernel: mpt2sas_cm0: search for expanders: start
Apr 28 14:36:07.750905 kernel: mpt2sas_cm0: search for expanders: complete
Apr 28 14:36:07.750932 kernel: mpt2sas_cm0: mpt3sas_base_hard_reset_handler: SUCCESS
Apr 28 14:36:07.750958 kernel: mpt2sas_cm0: removing unresponding devices: start
Apr 28 14:36:07.750989 kernel: mpt2sas_cm0: removing unresponding devices: end-devices
Apr 28 14:36:07.751011 kernel: mpt2sas_cm0: Removing unresponding devices: pcie end-devices
Apr 28 14:36:07.751037 kernel: mpt2sas_cm0: removing unresponding devices: expanders
Apr 28 14:36:07.751064 kernel: mpt2sas_cm0: removing unresponding devices: complete
Apr 28 14:36:07.751087 kernel: mpt2sas_cm0: scan devices: start
Apr 28 14:36:07.751107 kernel: mpt2sas_cm0:         scan devices: expanders start
Apr 28 14:36:07.751129 kernel: mpt2sas_cm0:         break from expander scan: ioc_status(0x0022),
loginfo(0x310f0400)
Apr 28 14:36:07.751159 kernel: mpt2sas_cm0:         scan devices: expanders complete
Apr 28 14:36:07.751187 kernel: mpt2sas_cm0:         scan devices: end devices start
Apr 28 14:36:07.751219 kernel: OOM killer enabled.
Apr 28 14:36:07.751256 kernel: Restarting tasks ... 
Apr 28 14:36:07.751283 kernel: mpt2sas_cm0:         break from end device scan: ioc_status(0x0022),
loginfo(0x310f0400)
Apr 28 14:36:07.751311 kernel: mpt2sas_cm0:         scan devices: end devices complete
Apr 28 14:36:07.751333 kernel: mpt2sas_cm0:         scan devices: pcie end devices start
Apr 28 14:36:07.751360 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
sub_code(0x011d)
Apr 28 14:36:07.751397 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
sub_code(0x011d)
Apr 28 14:36:07.751425 kernel: mpt2sas_cm0:         break from pcie end device scan:
ioc_status(0x0022), loginfo(0x3003011d)
Apr 28 14:36:07.751447 kernel: mpt2sas_cm0:         pcie devices: pcie end devices complete
Apr 28 14:36:07.751474 kernel: mpt2sas_cm0: scan devices: complete
Apr 28 14:36:07.751501 kernel: done.
Apr 28 14:36:07.751523 kernel: PM: suspend exit
Apr 28 14:36:07.751544 kernel: PM: suspend entry (s2idle)
Apr 28 14:36:08.055762 kernel: Filesystems sync: 0.069 seconds
Apr 28 14:36:08.055898 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
Apr 28 14:36:08.056031 kernel: OOM killer disabled.
Apr 28 14:36:08.056108 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
Apr 28 14:36:08.056182 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
Apr 28 14:36:08.056239 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
Apr 28 14:36:08.056872 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
Apr 28 14:36:08.057477 kernel: serial 00:09: disabled
Apr 28 14:36:08.057795 kernel: serial 00:06: disabled
Apr 28 14:36:08.058070 kernel: serial 00:05: disabled
Apr 28 14:36:08.058332 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
Apr 28 14:36:08.058386 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
Apr 28 14:36:08.058435 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
Apr 28 14:36:08.058472 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
Apr 28 14:36:08.058879 kernel: sd 0:0:0:0: [sda] Stopping disk
Apr 28 14:36:08.059229 kernel: ata6: SATA link down (SStatus 0 SControl 300)
Apr 28 14:36:08.059289 kernel: ata4: SATA link down (SStatus 0 SControl 300)
Apr 28 14:36:08.059337 kernel: ata2: SATA link down (SStatus 0 SControl 300)
Apr 28 14:36:08.059384 kernel: ata3: SATA link down (SStatus 0 SControl 300)
Apr 28 14:36:08.059433 kernel: ata5: SATA link down (SStatus 0 SControl 300)
Apr 28 14:36:08.059470 kernel: PM: Some devices failed to suspend, or early wake event detected
Apr 28 14:36:08.059515 kernel: sd 0:0:0:0: [sda] Starting disk
Apr 28 14:36:08.059840 kernel: serial 00:05: activated
Apr 28 14:36:08.060115 kernel: serial 00:06: activated
Apr 28 14:36:08.060378 kernel: serial 00:09: activated
Apr 28 14:36:08.060632 kernel: OOM killer enabled.
Apr 28 14:36:08.060684 kernel: Restarting tasks ... done.
Apr 28 14:36:08.060738 kernel: PM: suspend exit
Apr 28 14:36:08.056877 systemd-sleep[822]: Failed to suspend system. System resumed again: Invalid
argument

Hopes this helps. Cary

On Tue, 2020-04-28 at 09:11 +1000, David Airlie wrote:
> Adding dri-devel.
> 
> This might need a bisect to work out where it went wrong,
> 
> Dave.
> 
> On Tue, Apr 28, 2020 at 7:48 AM Cary Garrett <cogarre@gmail.com> wrote:
> > Hello,
> > 
> > System won't go into suspend state after migrating to V5.6.7 kernel. Working in V5.5.10.
> > 
> > Journal showing following:
> > 
> > Apr 27 16:07:54 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> > Apr 27 16:07:54 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> > Apr 27 16:07:54 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
> > 
> > Journalctl output at time of failure:
> > 
> > -- Logs begin at Tue 2020-04-21 17:10:11 CDT, end at Mon 2020-04-27 16:23:33 CDT. --
> > Apr 27 16:07:54 systemd[1]: Reached target Sleep.
> > Apr 27 16:07:54 systemd[1]: Starting Suspend...
> > Apr 27 16:07:54 systemd-sleep[1104]: Suspending system...
> > Apr 27 16:07:54 kernel: PM: suspend entry (deep)
> > Apr 27 16:07:54 kernel: Filesystems sync: 0.091 seconds
> > Apr 27 16:07:54 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
> > Apr 27 16:07:54 kernel: OOM killer disabled.
> > Apr 27 16:07:54 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > Apr 27 16:07:54 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
> > Apr 27 16:07:54 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
> > Apr 27 16:07:54 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
> > Apr 27 16:07:54 kernel: serial 00:09: disabled
> > Apr 27 16:07:54 kernel: serial 00:06: disabled
> > Apr 27 16:07:54 kernel: serial 00:05: disabled
> > Apr 27 16:07:54 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> > Apr 27 16:07:54 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> > Apr 27 16:07:54 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
> > Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Stopping disk
> > Apr 27 16:07:54 kernel: PM: Some devices failed to suspend, or early wake event detected
> > Apr 27 16:07:54 kernel: sd 0:0:0:0: [sda] Starting disk
> > Apr 27 16:07:54 kernel: serial 00:05: activated
> > Apr 27 16:07:54 kernel: serial 00:06: activated
> > Apr 27 16:07:54 kernel: serial 00:09: activated
> > Apr 27 16:07:54 kernel: OOM killer enabled.
> > Apr 27 16:07:54 kernel: Restarting tasks ... done.
> > Apr 27 16:07:54 kernel: PM: suspend exit
> > Apr 27 16:07:54 kernel: PM: suspend entry (s2idle)
> > Apr 27 16:07:55 kernel: Filesystems sync: 0.078 seconds
> > Apr 27 16:07:55 kernel: Freezing user space processes ... (elapsed 0.001 seconds) done.
> > Apr 27 16:07:55 kernel: OOM killer disabled.
> > Apr 27 16:07:55 kernel: Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > Apr 27 16:07:55 kernel: printk: Suspending console(s) (use no_console_suspend to debug)
> > Apr 27 16:07:55 kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
> > Apr 27 16:07:55 kernel: sd 6:0:1:0: [sdc] Synchronizing SCSI cache
> > Apr 27 16:07:55 kernel: serial 00:09: disabled
> > Apr 27 16:07:55 kernel: serial 00:06: disabled
> > Apr 27 16:07:55 kernel: serial 00:05: disabled
> > Apr 27 16:07:55 kernel: PM: pci_pm_suspend(): ast_pm_suspend+0x0/0x40 [ast] returns -22
> > Apr 27 16:07:55 kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -22
> > Apr 27 16:07:55 kernel: PM: Device 0000:04:00.0 failed to suspend async: error -22
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: pdev=0x0000000003c9e977, slot=0000:02:00.0, entering
> > operating
> > state [D4]
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: sending message unit reset !!
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: message unit reset: SUCCESS
> > Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Stopping disk
> > Apr 27 16:07:55 kernel: ata3: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata2: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata4: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata6: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata5: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: PM: Some devices failed to suspend, or early wake event detected
> > Apr 27 16:07:55 kernel: sd 0:0:0:0: [sda] Starting disk
> > Apr 27 16:07:55 kernel: serial 00:05: activated
> > Apr 27 16:07:55 kernel: serial 00:06: activated
> > Apr 27 16:07:55 kernel: serial 00:09: activated
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: pdev=0x0000000003c9e977, slot=0000:02:00.0, previous
> > operating
> > state [D0]
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: 64 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem
> > (16354848
> > kB)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to
> > 4k
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: MSI-X vectors supported: 16
> > Apr 27 16:07:55 kernel:          no of cores: 8, max_msix_vectors: -1
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:  0 8
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: High IOPs queues : disabled
> > Apr 27 16:07:55 kernel: mpt2sas0-msix0: PCI-MSI-X enabled: IRQ 42
> > Apr 27 16:07:55 kernel: mpt2sas0-msix1: PCI-MSI-X enabled: IRQ 43
> > Apr 27 16:07:55 kernel: mpt2sas0-msix2: PCI-MSI-X enabled: IRQ 44
> > Apr 27 16:07:55 kernel: mpt2sas0-msix3: PCI-MSI-X enabled: IRQ 45
> > Apr 27 16:07:55 kernel: mpt2sas0-msix4: PCI-MSI-X enabled: IRQ 46
> > Apr 27 16:07:55 kernel: mpt2sas0-msix5: PCI-MSI-X enabled: IRQ 47
> > Apr 27 16:07:55 kernel: mpt2sas0-msix6: PCI-MSI-X enabled: IRQ 48
> > Apr 27 16:07:55 kernel: mpt2sas0-msix7: PCI-MSI-X enabled: IRQ 49
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: iomem(0x00000000f7240000), mapped(0x00000000213f11d5),
> > size(65536)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: ioport(0x000000000000e000), size(256)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: Issuing Hard Reset as part of OS Resume
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: CurrentHostPageSize is 0: Setting default host page size to
> > 4k
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: LSISAS2308: FWVersion(20.00.04.00), ChipRevision(0x05),
> > BiosVersion(07.39.00.00)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: Protocol=(Initiator,Target),
> > Capabilities=(TLR,EEDP,Snapshot
> > Buffer,Diag Trace Buffer,Task Set Full,NCQ)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: sending port enable !!
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: port enable: SUCCESS
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: start
> > Apr 27 16:07:55 kernel: scsi target6:0:1: handle(0x0009), sas_addr(0x4433221101000000)
> > Apr 27 16:07:55 kernel: scsi target6:0:1: enclosure logical id(0x50030480119cb000), slot(2)
> > Apr 27 16:07:55 kernel: scsi target6:0:0: handle(0x000a), sas_addr(0x4433221103000000)
> > Apr 27 16:07:55 kernel: scsi target6:0:0: enclosure logical id(0x50030480119cb000), slot(0)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for end-devices: start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for PCIe end-devices: complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for expanders: start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: search for expanders: complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: mpt3sas_base_hard_reset_handler: SUCCESS
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: end-devices
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: Removing unresponding devices: pcie end-devices
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: expanders
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: removing unresponding devices: complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: scan devices: start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: expanders start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from expander scan: ioc_status(0x0022),
> > loginfo(0x310f0400)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: expanders complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: end devices start
> > Apr 27 16:07:55 kernel: OOM killer enabled.
> > Apr 27 16:07:55 kernel: Restarting tasks ...
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from end device scan: ioc_status(0x0022),
> > loginfo(0x310f0400)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: end devices complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         scan devices: pcie end devices start
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
> > sub_code(0x011d)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: log_info(0x3003011d): originator(IOP), code(0x03),
> > sub_code(0x011d)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         break from pcie end device scan:
> > ioc_status(0x0022),
> > loginfo(0x3003011d)
> > Apr 27 16:07:55 kernel: mpt2sas_cm0:         pcie devices: pcie end devices complete
> > Apr 27 16:07:55 kernel: mpt2sas_cm0: scan devices: complete
> > Apr 27 16:07:55 kernel: done.
> > Apr 27 16:07:55 kernel: PM: suspend exit
> > Apr 27 16:07:55 systemd-sleep[1104]: Failed to suspend system. System resumed again: Invalid
> > argument
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Set Up Additional Binary Formats being
> > skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Store a System Token in an EFI Variable
> > being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in First Boot Wizard being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Commit a transient machine-id on disk
> > being
> > skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Load Kernel Modules being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in FUSE Control File System being skipped.
> > Apr 27 16:07:55 systemd[1]: Starting Atop advanced performance monitor...
> > Apr 27 16:07:55 kernel: Process accounting resumed
> > Apr 27 16:07:55 systemd[1]: Started Atop advanced performance monitor.
> > Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
> > msg='unit=atop
> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
> > Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.058:119): pid=1 uid=0 auid=4294967295
> > ses=4294967295 msg='unit=atop comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> > terminal=? res=success'
> > Apr 27 16:07:55 systemd[1]: systemd-suspend.service: Main process exited, code=exited,
> > status=1/FAILURE
> > Apr 27 16:07:55 systemd[1]: systemd-suspend.service: Failed with result 'exit-code'.
> > Apr 27 16:07:55 systemd[1]: Failed to start Suspend.
> > Apr 27 16:07:55 systemd[1]: Dependency failed for Suspend.
> > Apr 27 16:07:55 systemd[1]: suspend.target: Job suspend.target/start failed with result
> > 'dependency'.
> > Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
> > msg='unit=systemd-suspend comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> > terminal=?
> > res=failed'
> > Apr 27 16:07:55 systemd-logind[653]: Operation 'sleep' finished.
> > Apr 27 16:07:55 systemd-networkd[681]: lo: Reset carrier
> > Apr 27 16:07:55 systemd[1]: Stopped target Sleep.
> > Apr 27 16:07:55 systemd-networkd[681]: eno2: DHCP lease lost
> > Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.061:120): pid=1 uid=0 auid=4294967295
> > ses=4294967295 msg='unit=systemd-suspend comm="systemd" exe="/usr/lib/systemd/systemd"
> > hostname=?
> > addr=? terminal=? res=failed'
> > Apr 27 16:07:55 systemd-networkd[681]: eno2: DHCPv6 lease lost
> > Apr 27 16:07:55 minidlnad[742]: getifaddr.c:109: error: Network interface eno2 not found
> > Apr 27 16:07:55 dbus-daemon[647]: [system] Activating via systemd: service
> > name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service' requested by
> > ':1.3'
> > (uid=193 pid=681 comm="/usr/lib/systemd/systemd-networkd ")
> > Apr 27 16:07:55 systemd-networkd[681]: eno2: Reset carrier
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Set Up Additional Binary Formats being
> > skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Store a System Token in an EFI Variable
> > being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in First Boot Wizard being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Commit a transient machine-id on disk
> > being
> > skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in Load Kernel Modules being skipped.
> > Apr 27 16:07:55 systemd[1]: Condition check resulted in FUSE Control File System being skipped.
> > Apr 27 16:07:55 kernel: audit: type=1334 audit(1588021675.071:121): prog-id=12 op=LOAD
> > Apr 27 16:07:55 kernel: audit: type=1334 audit(1588021675.071:122): prog-id=13 op=LOAD
> > Apr 27 16:07:55 audit: AUDIT1334 prog-id=12 op=LOAD
> > Apr 27 16:07:55 audit: AUDIT1334 prog-id=13 op=LOAD
> > Apr 27 16:07:55 systemd[1]: Starting Hostname Service...
> > Apr 27 16:07:55 kernel: ata4: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata6: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata3: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata2: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 kernel: ata5: SATA link down (SStatus 0 SControl 300)
> > Apr 27 16:07:55 dbus-daemon[647]: [system] Successfully activated service
> > 'org.freedesktop.hostname1'
> > Apr 27 16:07:55 systemd[1]: Started Hostname Service.
> > Apr 27 16:07:55 audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295
> > msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> > terminal=? res=success'
> > Apr 27 16:07:55 kernel: audit: type=1130 audit(1588021675.375:123): pid=1 uid=0 auid=4294967295
> > ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd"
> > hostname=?
> > addr=? terminal=? res=success'
> > 
> > 
> > 
> > "lspci -vvvv -s 00:04:00" output:
> > 
> > 04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
> > (prog-if
> > 00 [VGA controller])
> >         DeviceName: Onboard VGA
> >         Subsystem: Super Micro Computer Inc ASPEED Graphics Family
> >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR-
> > FastB2B-
> > DisINTx-
> >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort-
> > >SERR-
> > <PERR- INTx-
> >         Latency: 0
> >         Interrupt: pin A routed to IRQ 16
> >         Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
> >         Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
> >         Region 2: I/O ports at d000 [size=128]
> >         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> >         Capabilities: [40] Power Management version 3
> >                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> >                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> >         Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
> >                 Address: 0000000000000000  Data: 0000
> >         Kernel driver in use: ast
> >         Kernel modules: ast
> > 
> > 
> > 
> > "modinfo ast" output:
> > 
> > filename:       /lib/modules/5.6.7-arch1-1/kernel/drivers/gpu/drm/ast/ast.ko.xz
> > license:        GPL and additional rights
> > description:    AST
> > author:         Dave Airlie
> > firmware:       ast_dp501_fw.bin
> > srcversion:     64E79F607231209C250D3DF
> > alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
> > alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
> > depends:        drm,drm_kms_helper,drm_vram_helper,i2c-algo-bit
> > retpoline:      Y
> > intree:         Y
> > name:           ast
> > vermagic:       5.6.7-arch1-1 SMP preempt mod_unload
> > sig_id:         PKCS#7
> > signer:         Build time autogenerated kernel key
> > sig_key:        45:29:5C:B9:2E:80:AC:38:4F:95:8E:5C:8E:23:D8:83:BB:A6:34:42
> > sig_hashalgo:   sha512
> > signature:      29:C2:6D:CA:F4:4C:BE:87:80:66:F3:1B:EB:EA:69:CB:75:1F:2E:FD:
> >                 74:08:9F:B1:A4:AE:B3:55:6D:92:94:76:81:C7:95:58:34:37:11:99:
> >                 16:E7:71:C8:0C:AF:B0:64:FE:FB:39:69:0D:78:CA:36:E3:AC:87:D4:
> >                 93:B1:6F:04:AF:E8:C7:41:0B:CC:5E:34:95:E2:17:CC:F3:FA:E6:70:
> >                 2B:07:24:DE:DB:C1:DA:48:6E:BF:F3:F3:88:E0:73:85:F2:AE:1B:E8:
> >                 39:F8:8F:31:0D:87:40:4B:D8:09:2D:83:F7:AA:57:A1:5B:48:A6:9C:
> >                 3E:B0:CA:7E:E1:45:D1:07:6B:1D:B4:41:5D:E7:43:05:3B:52:E3:F7:
> >                 E6:AD:7B:8D:FA:44:29:77:41:58:97:91:5D:F2:74:C0:AA:63:2F:E8:
> >                 0F:D3:99:44:A8:F7:CE:20:98:49:CD:11:E0:E1:F5:75:D6:89:41:02:
> >                 52:91:85:50:BC:23:E8:FD:C0:19:B9:34:79:8F:F3:B7:E7:81:93:F6:
> >                 50:35:10:38:53:FC:5D:AE:4A:AC:57:92:06:26:48:80:F2:B8:5F:55:
> >                 AB:51:7A:51:0C:8A:6C:0D:B5:44:AF:7F:22:33:69:43:93:7E:76:07:
> >                 5F:E6:CD:CC:A0:BA:F5:B6:BF:FE:51:43:8E:70:4E:15:9B:94:26:2F:
> >                 F6:69:A5:EA:F7:21:91:D2:89:BC:EC:3C:43:80:49:A8:AC:19:F8:F9:
> >                 8E:3F:F1:23:33:0E:EF:8F:CF:2A:B3:40:04:1A:69:AD:55:F7:BA:91:
> >                 CD:F8:C6:56:7E:BE:AC:55:AF:BA:BD:5E:FB:7E:2B:49:B1:A3:30:1F:
> >                 53:92:75:09:AA:CA:F9:AD:74:6B:F4:5B:56:D6:95:B1:54:93:B5:BF:
> >                 49:70:07:3C:BA:8A:81:70:0B:AB:DA:3A:88:A1:A6:AE:4B:9A:39:49:
> >                 6F:CA:E3:82:5E:4D:14:5A:F0:17:87:35:6E:A6:C8:A0:A0:BE:9C:0C:
> >                 31:5A:FD:5D:98:33:ED:BF:3D:C4:3C:4A:38:22:BE:DB:09:E3:5D:6E:
> >                 ED:6F:1C:B6:9A:6E:93:4E:FA:13:39:59:7F:81:13:34:0A:48:D4:91:
> >                 E6:10:72:EA:10:CE:43:53:77:A4:BE:79:F2:91:05:EB:AD:0D:7A:4E:
> >                 1C:94:63:D7:05:10:23:CC:A8:29:53:AB:6A:D6:91:0E:E6:3C:90:42:
> >                 5B:98:66:32:15:54:64:22:0A:78:98:DC:32:C4:5F:71:0C:87:80:A9:
> >                 FE:04:39:A1:43:0B:25:5D:D9:43:C8:DD:73:1D:FB:D1:EE:AA:F2:C5:
> >                 AF:DE:F4:DA:AA:DF:09:F9:A3:A7:AA:C9
> > parm:           modeset:Disable/Enable modesetting (int)
> > 
> > 
> > 
> > I could not find where this has been previously reported. Please contact me more info is needed>
> > 
> > Thanks, Cary Garrett
> > 
> > 
> > 
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
