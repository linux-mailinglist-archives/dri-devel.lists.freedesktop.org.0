Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322DCAC901
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A2510E10F;
	Mon,  8 Dec 2025 08:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="KEQx/DoF";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="eSeqyEsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-b3-smtp.messagingengine.com
 (flow-b3-smtp.messagingengine.com [202.12.124.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DB110E10F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 08:56:02 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 0B6321300A3E;
 Mon,  8 Dec 2025 03:56:01 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
 by phl-compute-04.internal (MEProxy); Mon, 08 Dec 2025 03:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1765184160;
 x=1765191360; bh=rI4kmm8q4SBgeZUfyMe9K0dGX4rw95g6gNmAZHmnGI4=; b=
 KEQx/DoFTWe87vjgaF/lltZ4ROhdyVzifWOmm0ric0cJB5GIwIlXMBPdzfFUSjmu
 jc8YJftIpHI0P6Hr/mFAa7Hg0gne2WsNbxeDvrib6J4TNASjXySZhHqZg6aW1sfs
 OcTjac9718xt+KlzbSF/x7Yc9DD6c7iuDogGUJbnrxtnsPxKfEbVYIe4bsPD1GQh
 xU7hrvJclwTD95ij8Z0L5AweK2etlv2je4ICAc96VfsG5WQ5G831y//6BAb/4kDv
 jANl68EQ7NWvE4dgjg2Jgzh/W/muSag5AEZRtBprPYq0bBJ5Yw0DNKKikbfnd1I2
 A3K/NjEFytYRCq7veJpJ0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765184160; x=
 1765191360; bh=rI4kmm8q4SBgeZUfyMe9K0dGX4rw95g6gNmAZHmnGI4=; b=e
 SeqyEsjjH4KIDKVWZWQnPpkIj8V27aOGXCIUv3KqWLbPoVXVTB8CpxBHqQClHYsa
 kpDnrfmZ/Do4gHJ70tOwX4QJqMfbE5dFqjHzFX5vl7lRcUGD3fa2+Oson6+bqWdA
 KfzoD9RacrpnvX/Z6F2rgdN+g7HK2CzrdqwucakBqpI2TmtpwG4Ncr7GJEPKMweI
 8a1TxyyhWdGACgEMZG9PPKVuuNc16ylnzjv4VzhinhfMUrJT8vnXgJdM1VPNWLd9
 hIQHjQRFhZw/c3sbeLXLthF/QQ96cHNotcBAahBH0Mn51vxw6uB4yelZg3ZjMdcw
 lfPxGjJz0KwUhMjvMR/Ow==
X-ME-Sender: <xms:n5I2af3AOJhJM8AZu7vJj2vLP6N-g43FMHtVswkk4IQEA4JJTbnQfg>
 <xme:n5I2aY5NWPgdu6u-31Ph43b_F-Lsq264_Q7FV33-fn75S6mkFJ7D7W_wnOqIVfBmU
 DiIF2zko78sdD9QREmze-J_kJdp85MvKLQYBC5HqPr-YjYj4he15g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpeejkeetleelgeeukeekhefhtedtkeduuefhffehueejgeeihfeulefhgeejhfegleen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgpdhgih
 hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvhedpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsegtrhgrphhouhhilhhlohhurdhn
 vghtpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomh
 dprhgtphhtthhopehhvhgrihgshhgrvhdrlhhinhhugiesghhmrghilhdrtghomhdprhgt
 phhtthhopehjtghmvhgskhgstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrgiiii
 hivghsrggttghouhhnthesghhmrghilhdrtghomhdprhgtphhtthhopehrughunhhlrghp
 sehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhitgdvfeeskhgvrhhnvghlrd
 horhhgpdhrtghpthhtohepshhrihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 giekieeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:n5I2aWwfV8uojphryA4LMwvhxBD1lSSLxiL6gnkJPQjtfRjYR-x8vA>
 <xmx:n5I2abdylMnetpIIFpQZmx8ZEpFo6JUFVPuRC__c1vvm4enk8iT1mA>
 <xmx:n5I2aScjp6Ox44YOHm51rgR0Mr9Ks_Z-hseL7SDUtrPSG-OFb-WnTQ>
 <xmx:n5I2adZU1k7BYPSdKrT6-sy_WehWFCXQ_6Ovy7ofNuSa_TuuU6O_wA>
 <xmx:oJI2aeOU8RNJqW6MFLWxWiLR6QwmLwTtSNYK68Yfe2XTmH0U_4KugIRA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EC25DC40054; Mon,  8 Dec 2025 03:55:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdXK0EwxrYhs
Date: Mon, 08 Dec 2025 09:55:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Cc: "Andy Shevchenko" <andy.shevchenko@gmail.com>, andrew.jones@linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>, openbmc@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Paul Kocialkowski" <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 "Paul Cercueil" <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matti Vaittinen" <mazziesaccount@gmail.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "Vaibhav Hiremath" <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, "Max Filippov" <jcmvbkbc@gmail.com>
Message-Id: <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Subject: Re: Kconfig dangling references (BZ 216748)
Content-Type: text/plain
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

On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that 
> were noise).
>
> I'll try to Cc: all of the relevant mailing lists or individuals.
>
>
> ARCH_HAS_HOLES_MEMORYMODEL ---
> arch/arm/mach-omap1/Kconfig:7:	select ARCH_HAS_HOLES_MEMORYMODEL

My mistake, this was a botched rebase.

> ARM_ERRATA_794072 ---
> arch/arm/mach-npcm/Kconfig:33:	select ARM_ERRATA_794072

This apparently never made it upstream because it was unreliable
https://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/244343.html

> MACH_JZ4755 ---
> drivers/clk/ingenic/Kconfig:20:	default MACH_JZ4755
> drivers/pinctrl/pinctrl-ingenic.c:158:	IS_ENABLED(CONFIG_MACH_JZ4755) 
> << ID_JZ4755 |
> drivers/pinctrl/pinctrl-ingenic.c:4616:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)
>
> MACH_JZ4760 ---
> drivers/clk/ingenic/Kconfig:40:	default MACH_JZ4760
> drivers/pinctrl/pinctrl-ingenic.c:159:	IS_ENABLED(CONFIG_MACH_JZ4760) 
> << ID_JZ4760 |
> drivers/pinctrl/pinctrl-ingenic.c:4620:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
> drivers/pinctrl/pinctrl-ingenic.c:4624:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
>
> MACH_STM32MP25 ---
> drivers/pinctrl/stm32/Kconfig:58:	default MACH_STM32MP25 || (ARCH_STM32 
> && ARM64)

This was likely intended for 32-bit kernels on 64-bit STM32MP25
chips, which we don't support. I think this can go.

> MIPS_BAIKAL_T1 ---
> drivers/ata/Kconfig:197:	select MFD_SYSCON if (MIPS_BAIKAL_T1 || 
> COMPILE_TEST)
> drivers/bus/Kconfig:43:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/bus/Kconfig:58:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/clk/baikal-t1/Kconfig:4:	depends on (MIPS_BAIKAL_T1 && OF) || 

I don't think we'll merge the rest of Baikal, we should probably
remove the entire platform.

> PINCTRL_MILBEAUT ---
> arch/arm/mach-milbeaut/Kconfig:16:	select PINCTRL_MILBEAUT

Same for Milbeaut

> USB_OHCI_SH ---
> arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/configs/sh7757lcr_defconfig:61:CONFIG_USB_OHCI_SH=y

Should have been removed as part of 7518f0763ecd ("sh: convert
boards to use the OHCI platform driver")

> X86_P6_NOP ---
> arch/x86/Kconfig.cpufeatures:41:	depends on X86_64 || X86_P6_NOP
> arch/x86/Makefile_32.cpu:48:ifneq ($(CONFIG_X86_P6_NOP),y)

I missed this in f388f60ca904 ("x86/cpu: Drop configuration options
for early 64-bit CPUs"). Both references can be removed, because
p6-nop was already disallowed for 32-bit CPUs at the time.

I don't know if any supported binutils still require -mtune=generic32

> XTENSA_PLATFORM_ESP32 ---
> drivers/tty/serial/Kconfig:1598:	depends on XTENSA_PLATFORM_ESP32 || 
> (COMPILE_TEST && OF)
> drivers/tty/serial/Kconfig:1611:	depends on XTENSA_PLATFORM_ESP32 || 
> (COMPILE_TEST && OF)

Max is still working on esp32 support as far as I know, it's just
slow progress, see
https://github.com/jcmvbkbc/linux-xtensa/commits/xtensa-6.16-esp32

       Arnd
