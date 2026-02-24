Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJMZDf/qnGnqMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:04:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0518019E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 01:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD110E464;
	Tue, 24 Feb 2026 00:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BiCxi3L9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA910E464
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 00:04:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B311A600AE;
 Tue, 24 Feb 2026 00:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E022C116C6;
 Tue, 24 Feb 2026 00:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771891447;
 bh=eSEVzSG1u7kDX0qIB57v1bGEdvuxp7q/644aS2mjq3Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BiCxi3L9JoXgkrh8SC5MAkJMhbY/Gt/ee8dkTYQlEReSuB4BTdHAinqlJ2OFDp6yS
 K2IocFIKpN9ibOJpRL9+VOLTSUbH7qQsPiBKrovipxTbo9eajt0gUvhxCDhwVDhO+8
 5Rlxa1CWbGyQ9Q36KM5NC+FfklyKper67d1Qv2aJIuTZ7s4KnLHKQM7iB0zRPc84mq
 jsXCWBPoX2cNDpVLYgAQmic4uvU8sr2uc48rEwfkKkj6Mxf3f1OBn5Wx+AaROlWqSn
 ntIjCz+6RR634lgigRfzRx83aoqzpm4WdYAuAXJwSFy0UCaudKb02bX6tegaaBV0nb
 MfkMoAbVPBZkQ==
Date: Mon, 23 Feb 2026 16:04:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "Vaibhaav Ram T . L"
 <vaibhaavram.tl@microchip.com>, Kumaravel Thiagarajan
 <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, Xinpeng
 Sun <xinpeng.sun@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang
 <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, Vinod
 Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, Jijie Shao
 <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, Sunil Goutham
 <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, Karol Wachowski
 <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, Mika
 Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Tian
 Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Srujana Challa
 <schalla@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Antoine
 Tenart <atenart@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Raag
 Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, Nirmal
 Patel <nirmal.patel@linux.intel.com>, Kurt Schwemmer
 <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 netdev@vger.kernel.org, nic_swsd@realtek.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-serial@vger.kernel.org, mhi@lists.linux.dev, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
 linux-i2c@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, Jonathan Derrick
 <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
Message-ID: <20260223160402.3ad8f079@kernel.org>
In-Reply-To: <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shawn.lin@rock-chips.com,m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m:raag.jadav@intel.com,m:hansg@kernel.org,m:greg
 kh@linuxfoundation.org,m:jirislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:phasta@kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhu
 ang@gmail.com,m:linux-spi@vger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuba@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[87];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 47B0518019E
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 23:29:40 +0800 Shawn Lin wrote:
> pcim_alloc_irq_vectors() and pcim_alloc_irq_vectors_affinity() are created for
> pci device drivers which rely on the devres machinery to help cleanup the IRQ
> vectors.

If you can please add this API with just a few users, and then convert
remaining users via the subsystem trees in the next cycle.
There's no need to risk wasting maintainer time on conflicts with
conversions like this.
