Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDA9KVpinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCA183BF9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5B210E4F3;
	Tue, 24 Feb 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="D1NXrLDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com
 [220.197.31.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6B710E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:29:46 +0000 (UTC)
Received: from [172.16.12.14] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 34be19b08;
 Tue, 24 Feb 2026 10:29:38 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>,
 Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach
 <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>,
 Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 Mark Brown <broonie@kernel.org>, Nirmal Patel
 <nirmal.patel@linux.intel.com>, Kurt Schwemmer
 <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 netdev@vger.kernel.org, nic_swsd@realtek.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 mhi@lists.linux.dev, Jan Dabros <jsd@semihalf.com>,
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
 <cb878741-7b61-b72c-5a72-6ed6d5091b1f@rock-chips.com>
 <aZyQmc7nOt87jitX@smile.fi.intel.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <f2ea12bb-d90a-2b5e-eb4f-fabb3b702ca5@rock-chips.com>
Date: Tue, 24 Feb 2026 10:29:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aZyQmc7nOt87jitX@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8d7b0eac09cckunm431e2ebe9c2487
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1JSlYfQ0xKSUgZSExJTR5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
 pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
 b=D1NXrLDXYu05Q03TAx05oty8f+yTvVFdBAZyiSUmQKIY0HvT8qR+fZzXAm5BOQ41zzptRcoWbADvnv7drXshfBmn85RqQEDxVHw/jKK+KYsM4769ieUIh+QcpalR29uuc0K0fEj0iBdlNJUhOg6fCPz7HghkYa/b9akRJdf4g50=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=913DgA+wi5Qtxbiu+wfSgg50lMszTH4hoG4VFZ28+hE=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:andy.shevchenko@gmail.com,m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m:raag.jadav@intel.c
 om,m:hansg@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:phasta@kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhuang@gmai
 l.com,m:linux-spi@vger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[rock-chips.com,gmail.com,google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[88];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4BCCA183BF9
X-Rspamd-Action: no action

在 2026/02/24 星期二 1:38, Andy Shevchenko 写道:
> On Tue, Feb 24, 2026 at 12:09:37AM +0800, Shawn Lin wrote:
>> 在 2026/02/23 星期一 23:50, Andy Shevchenko 写道:
>>> On Mon, Feb 23, 2026 at 5:32 PM Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>>
>>>> This patch series addresses a long-standing design issue in the PCI/MSI
>>>> subsystem where the implicit, automatic management of IRQ vectors by
>>>> the devres framework conflicts with explicit driver cleanup, creating
>>>> ambiguity and potential resource management bugs.
>>>>
>>>> ==== The Problem: Implicit vs. Explicit Management ====
>>>> Historically, `pcim_enable_device()` not only manages standard PCI resources
>>>> (BARs) via devres but also implicitly triggers automatic IRQ vector management
>>>> by setting a flag that registers `pcim_msi_release()` as a cleanup action.
>>>>
>>>> This creates an ambiguous ownership model. Many drivers follow a pattern of:
>>>> 1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
>>>> 2. Also calling `pci_free_irq_vectors()` in their error paths or remove routines.
>>>>
>>>> When such a driver also uses `pcim_enable_device()`, the devres framework may
>>>> attempt to free the IRQ vectors a second time upon device release, leading to
>>>> a double-free. Analysis of the tree shows this hazardous pattern exists widely,
>>>> while 35 other drivers correctly rely solely on the implicit cleanup.
>>>
>>> Is this confirmed? What I read from the cover letter, this series was
>>> only compile-tested, so how can you prove the problem exists in the
>>> first place?
>>
>> Yes, it's confirmed. My debug of a double free issue of a out-of-tree
>> PCIe wifi driver which uses
>> pcim_enable_device + pci_alloc_irq_vectors + pci_free_irq_vectors expose
>> it. And we did have a TODO to cleanup this hybrid usage, targeted in
>> this cycle[1] suggested by Philipp:
> 
> Okay, fair enough. I think this bit was missing in the cover letter.
> 
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=msi
> 
>>>> ==== The Solution: Making Management Explicit ====
>>>> This series enforces a clear, predictable model:
>>>> 1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
>>>>       pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed IRQ
>>>>       vectors should use these functions, which set the is_msi_managed flag and
>>>>       ensure automatic cleanup.
>>>> 2.  Patches 2 through 36 convert each driver that uses pcim_enable_device() alongside
>>>>       pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup to instead
>>>>       make an explicit call to pcim_alloc_irq_vectors().
>>>> 3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim_setup_msi_release()
>>>>       to check only the is_msi_managed flag. This decouples automatic IRQ cleanup from
>>>>       pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors*()
>>>>       are now solely the driver's responsibility to free with pci_free_irq_vectors().
>>>>
>>>> With these changes, we clear ownership model: Explicit resource management eliminates
>>>> ambiguity and follows the "principle of least surprise." New drivers choose one model and
>>>> be consistent.
>>>> - Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit control.
>>>> - Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.
>>>
>>> Have you checked previous attempts? Why is your series better than those?
>>

Thanks for sharing this 5-years-old discusstion, I totally missed it.

I read the V7 discussion, and it seems to have disappeared without much
follow-up, like a stone dropped into the ocean. For five years, newly
added drivers have continued to misuse these APIs incorrectly, and
we’ve been watching it happen. I can’t really claim this patch series
is inherently better than Dejin’s earlier work at its core, this is
just about fixing one entire category of misuse in a single pass.

According to Bjorn's final search and reply, if we include the removal
of deprecated APIs, it would require a massive amount of work and might
span many release cycles. Unfortunately, the work never began, and the
cleanup might never be completed. I’m not sure if folks have changed
their minds now. Can we at least start by completing the changes for the
pci_alloc_irq_vectors category?


>> There seems not previous attempts.
> 
> Maybe we are looking to the different projects...
> 
> https://lore.kernel.org/all/?q=pcim_alloc_irq_vectors
> 
>>>> ==== Testing And Review ====
>>>> 1. This series is only compiled test with allmodconfig.
>>>> 2. Given the substantial size of this patch series, I have structured the mailing
>>>>      to facilitate efficient review. The cover letter, the first patch and the last one will be sent
>>>>      to all relevant mailing lists and key maintainers to ensure broad visibility and
>>>>      initial feedback on the overall approach. The remaining subsystem-specific patches
>>>>      will be sent only to the respective subsystem maintainers and their associated
>>>>      mailing lists, reducing noise.
> 
