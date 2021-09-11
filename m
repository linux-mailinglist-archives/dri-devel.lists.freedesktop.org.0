Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03084074BE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 04:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F6C6EB39;
	Sat, 11 Sep 2021 02:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966776EB38;
 Sat, 11 Sep 2021 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=lXPY8M8Y0FN23tN6vtiG+/UAEm0QHFlPVzDxxKVLyeI=; b=cMrKyQhCSTHspPx9hTklI610jh
 myl4XPPx3jiFlBs6A+8wEUzQh7fJCxgsoYhj0y1FNqUbSXAz+uWxfvlOB2yuL0TiUvgRJ13FZUA7Z
 wAJ24qACFYVD2mAPB8ZJhMsRZH6/OaR6OTxBlsJY+K4VdY0FstLbH1W6myP2TUZGO4CrNmn0a1DM2
 6KIvO468zhY9/shumZ+wOpf2s3H/zGJFTQ8LtfavvqtKR9b6tGvUqzaAkZ3eIFQ8mQYOJTEpjf2we
 qjAakm7b/obGzYefrbMFZ2bBddkBaUaenBMyDyce201DUXJnKY24m/4dDyJw8IjO5xsmvLwz2Av2K
 imTFuVxg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOt5m-00EAl5-QC; Sat, 11 Sep 2021 02:50:11 +0000
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Intel UHD resolutions
Message-ID: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
Date: Fri, 10 Sep 2021 19:50:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I would like to use QHD resolution (2560x1440) with my shiny new
computer and display. That resolution works if I boot Windows 10
(cough).

What do I need to do to use that resolution in Linux?

I first tried openSUSE 15.3 (kernel 5.3.18-59.19-default)
then I build a v5.14 kernel and tried that.
Both of them max out at FHD (1920x1080).

I am booting with "i915.force_probe=4c8a" on the kernel command line.

My desktop is XFCE4.

CPU is:
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 167
model name	: 11th Gen Intel(R) Core(TM) i9-11900 @ 2.50GHz
stepping	: 1
microcode	: 0x40
cpu MHz		: 1021.742
cache size	: 16384 KB
physical id	: 0
siblings	: 16

with an H470 chipset. (ASRock DeskMini H470)

00:02.0 VGA compatible controller: Intel Corporation RocketLake-S GT1 [UHD Graphics 750] (rev 04)

or verbose:

00:02.0 VGA compatible controller: Intel Corporation RocketLake-S GT1 [UHD Graphics 750] (rev 04) (prog-if 00 [VGA controller])
	Subsystem: ASRock Incorporation Device 4c8a
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 153
	Region 0: Memory at b0000000 (64-bit, non-prefetchable) [size=16M]
	Region 2: Memory at a0000000 (64-bit, prefetchable) [size=256M]
	Region 4: I/O ports at 3000 [size=64]
	[virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: [40] Vendor Specific Information: Len=0c <?>
	Capabilities: [70] Express (v2) Root Complex Integrated Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, O
BFF Not Supported
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
			 AtomicOpsCtl: ReqEn-
	Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable+ 64bit-
		Address: fee00018  Data: 0000
		Masking: 00000000  Pending: 00000000
	Capabilities: [d0] Power Management version 2
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot
-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Process Address Space ID (PASID)
		PASIDCap: Exec- Priv-, Max PASID Width: 14
		PASIDCtl: Enable- Exec- Priv-
	Capabilities: [200 v1] Address Translation Service (ATS)
		ATSCap:	Invalidate Queue Depth: 00
		ATSCtl:	Enable-, Smallest Translation Unit: 00
	Capabilities: [300 v1] Page Request Interface (PRI)
		PRICtl: Enable- Reset-
		PRISta: RF- UPRGI- Stopped+
		Page Request Capacity: 00008000, Page Request Allocation: 00000000
	Kernel driver in use: i915
	Kernel modules: i915


thanks.
-- 
~Randy

