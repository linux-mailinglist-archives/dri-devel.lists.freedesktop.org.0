Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEDB3A52C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C0310E3BD;
	Thu, 28 Aug 2025 16:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="I0vds5M2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UQwmO8gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a8-smtp.messagingengine.com
 (flow-a8-smtp.messagingengine.com [103.168.172.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0A10E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:01:02 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.phl.internal (Postfix) with ESMTP id CFDC31380BD6;
 Thu, 28 Aug 2025 12:01:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 12:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756396861;
 x=1756404061; bh=X0y5RQTmfwxUObhRto5XKdRlcInx4/Tzp/ibu8iObz8=; b=
 I0vds5M2ZwZ/2oQ5PNgXiYYN+e9KqQ+21lQKMj2rlUB7qGtjIwE2S1czCT6Kj3mO
 B3rCT4TSXFmrs2KqxhrTjjzcNHj1PKES0qeM4gAIqognX5qNWUmCKwEySizle3oV
 FgJPiOVf6COGjfksPddIITc3Qi40GWDNi5ySxPvgf4+rryLSti++rzyclUXCPExt
 VmvDLkEzuRoUPIKITRnFr9T1C4s5yQx6WpmkX9ZaT6d0jXKS/3t6T6q0YOtf5HPo
 5wSdBfPjOhtvp+2Lx8cCFC4itL5YsBqXSHvMJR/FJGGCCi34aO63jYfdIJqpRqhi
 HtoEsRbYXoY5Dfxl4Uv6Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756396861; x=
 1756404061; bh=X0y5RQTmfwxUObhRto5XKdRlcInx4/Tzp/ibu8iObz8=; b=U
 QwmO8gISdU25Fs3HSYuPhjs9y7oII5xEQZmiGUN6AynJMwVcwv1yPJOzlr3OGowA
 J3kw2w52WOa7u2NUKOxzlAjTtjdUEa+UjUu1AyeUiMeIXa7nyD0ZxJLsl471kUzN
 z38wDdRjfnKe9fx8F7dnq0FaG8NMvEuvWT7Xxxcjt0dGSF7AQ2ZLHNLOwqQq+JKp
 vtyv6t4WFCa5A18ZKdeQn2Ao2X5/tij28k21rRW7LYGsjO+SkUvRJaTcv+VcN2aa
 u3Zf/oqcuHBmRF/LknGTuZWN6sIntoqw+fb+j1GMTj1Fal4hRXQnCNpMSK+KYWTe
 gDBSKWi41Ng7rYALGBwBg==
X-ME-Sender: <xms:On2waIxJlexuPzypFfc2uxTpdNwLE_OHXPTlfTfwFUFslgrePoufjg>
 <xme:On2waDv810MwADrY_nRVH_KwjmB3F0NMW_ws2Wrj-VWfWFKq08Xz6Zbgvzk7-JulL
 XJbkV8aOPj6CAlPclM>
X-ME-Received: <xmr:On2waDRzvvGywk6DwPkLvk9uBcG00uECS6wd59vVf4ke3ZxWDi0fSZhxMPoY9B8Qh9uJIEolZzSsKsd-tT30ZdyMq_qYM5dJRrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 efkeeuudettddvffevhfevvdekhffgveehfefhffehfeetgfetffeugfevfefhnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepthhofihinhgthhgvnhhmihesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
 gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
 vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
 eprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
 nhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
 hrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprhgrfhgr
 vghlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:On2waBdAe8K_bVqvNlQR0j5V1DKUm0Ra1Gjf1ktaipolDUs-krUtjQ>
 <xmx:On2waJRmnZC6YgZWEQVw_LwCMcqtoCD8bnwuizrYGROWUpfHSKqzHQ>
 <xmx:On2waJnA2UkyifRmB3uklG3XznqZxfoMS-lY1Z4ov7UTS6RuoDIXUg>
 <xmx:On2waDHqNwU0uR-xpYaUzht54A7lAkmGOQO7gUi2D5fEP12ITgI9gw>
 <xmx:PX2waMoTJjhez4WANByCdWAkFMP5JaWhXJAkwB8SD_dJwvTzPB-wYtf2>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:00:57 -0400 (EDT)
Date: Thu, 28 Aug 2025 18:00:55 +0200
From: Janne Grunau <j@jannau.net>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,	Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,	Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,	Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,	Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>,	Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>,	Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,	asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,	linux-pm@vger.kernel.org,
 iommu@lists.linux.dev,	linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org,	dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org,	linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org,	linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org,	dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org,	linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
Subject: Re: [PATCH 34/37] arm64: dts: apple: Add initial t6020/t6021/t6022 DTs
Message-ID: <20250828160055.GB204299@robin.jannau.net>
References: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
 <20250828-dt-apple-t6020-v1-34-bb8e1b87edef@jannau.net>
 <5e0e51db-17ae-483a-bb96-8ab88ad2fbad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e0e51db-17ae-483a-bb96-8ab88ad2fbad@gmail.com>
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

On Thu, Aug 28, 2025 at 11:37:08PM +0800, Nick Chan wrote:
> 
> Janne Grunau 於 2025/8/28 夜晚10:52 寫道:
> > From: Hector Martin <marcan@marcan.st>
> >
> > These SoCs are found in Apple devices with M2 Pro (t6020), M2 Max
> > (t6021) and M2 Ultra (t6022) and follow the pattern of their M1
> > counterparts.
> >
> > t6020 is a cut-down version of t6021, so the former just includes the
> > latter and disables the missing bits (This is currently just one PMGR
> > node and all of its domains.
> >
> > t6022 is two connected t6021 dies. The implementation seems to use
> > t6021 with blocks disabled (mostly on the second die). MMIO addresses on
> > the second die have a constant offset. The interrupt controller is
> > multi-die aware. This setup can be represented in the device tree with
> > two top level "soc" nodes. The MMIO offset is applied via "ranges" and
> > devices are included with preproceesor macros to make the node labels
> > unique and to specify the die number for the interrupt definition.
> >
> > Device nodes are distributed over dtsi files based on whether they are
> > present on both dies or just on the first die. The only exception is the
> > NVMe controller which resides on the second die. Its nodes are in a
> > separate file.
> 
> There are some outdated / copy pasted from M1-series parts.

All fixed locally. I also removed an outdated "hypothetical T6022 (M2
Ultra)" from t602x-dieX.dtsi.

thanks for spotting these,

Janne
