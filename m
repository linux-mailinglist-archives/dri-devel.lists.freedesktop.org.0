Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82509B3A6E3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CF310EA4F;
	Thu, 28 Aug 2025 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="mv9+17Kg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="IyWfsEtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a1-smtp.messagingengine.com
 (flow-a1-smtp.messagingengine.com [103.168.172.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC07F10EA4F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:50:18 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id E3DD31380CD9;
 Thu, 28 Aug 2025 12:50:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 12:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756399817;
 x=1756407017; bh=0NVIgLeywlcdQ7Q96WR+bM0acpRT6H98AkXzmXrivW0=; b=
 mv9+17KgF+5GxOl9vLcdUtzFnoGfgshEXGSdE9REgEQZq3GUbd6cGMl+1XHjHaGn
 gRn5J3tBrLwKGOLArwU+SwnGxXBrO+6XMrQMC9uhnBHq4N7p4rC7aYyfMR/x7+VH
 Kr1yZrgBgm4iZmu8nkX4VwnTVuEvm67D/eKs/7ybS2UNFANfW290F7mPGfTI/Dm3
 5H0qXfPBjnhZzDwVXAiYOykUCMM0Z//BS8hMucloljBJmasWT9rSaZedbFDVhESx
 Os9ak1XmWvhp8pecHT+xvsYiP9YA86zvkqt0LcDKtGaAX/lpBJqSVaybMEnv7kJz
 fbmEr3UZ1qv3GSlhUph4IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756399817; x=
 1756407017; bh=0NVIgLeywlcdQ7Q96WR+bM0acpRT6H98AkXzmXrivW0=; b=I
 yWfsEtvH5pa0deFWH5y+3Wv8iC++fyUJzaKl0zTLlHTFsrFBKltzqsCKNE2bpW7H
 WZEdNUyqlCWPJ1gDLWtRpoUDSa9fNg+b8PAqdSspStFRXQR0qIjJasbTc5VXnDJY
 LV0vY26Or4luziTABSgI82H/8Ov1+fhNzsxpTCEmcopAYLQhNfqfTcox4lobPbO8
 tI9jNPtHd+bBhTSMwAAVyVUmvBXJiIGDe0RdmYT94+GNLj6uC0NVka3y5otetQ7K
 jjfzsE5+DRrT+7N9usH8oy60yQi0nSoP46sUUZ+s/W9b0RCt9d99oXcOTu7zze7y
 WBgtUjFRANmVIPI+elMlg==
X-ME-Sender: <xms:xoiwaIbwiPlONZyvvi3nrwonaYX0GPTt0j98poxImmWpqps68_1DbQ>
 <xme:xoiwaK2wEmopWAvQU09c0ZiTiWKcZT5jfQSOlyZunfuU5U7zsvsT6xpQcPiFu5btz
 VzOLCZ9pvfsENega0I>
X-ME-Received: <xmr:xoiwaL6z8yuoEP9fblhgra2VNvMI-jh6RKnJtliUwx53eQO20tt6-2dicZxHzpQoO5lU9j9tP1u5Te1bCfbmfw321V6aP0TULq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduheefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:xoiwaNm2W47ghLtWIAD_pLahxBhBVbtlB0HjuziPYBUZSeeRVEXQTA>
 <xmx:xoiwaC5DusAdyl5Pk1di6jyPCo5sIoppiKD0TupQW-3eWXylCA373w>
 <xmx:xoiwaCsKTp4DaYaYaIDjWLqlvlKWjo035Lklt_v6NWHAVsNG6jOhjg>
 <xmx:xoiwaFtpbONR3sJOiA3GJesirPwRAbsZWp3JhVVJESjdloGO55-IPQ>
 <xmx:yYiwaGZUykDrx6nBmdQEI6U-4WzN_i3nfk1N2dRMiDOlhpPNNeGnuj8c>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:50:13 -0400 (EDT)
Date: Thu, 28 Aug 2025 18:50:12 +0200
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
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Message-ID: <20250828165012.GC204299@robin.jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
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

On Fri, Aug 29, 2025 at 12:11:40AM +0800, Nick Chan wrote:
> 
> Janne Grunau 於 2025/8/28 晚上10:01 寫道:
> > This series adds device trees for Apple's M2 Pro, Max and Ultra based
> > devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> > follow design of the t600x family so copy the structure of SoC *.dtsi
> > files.
> [...]
> > After discussion with the devicetree maintainers we agreed to not extend
> > lists with the generic compatibles anymore [1]. Instead either the first
> > compatible SoC or t8103 is used as fallback compatible supported by the
> > drivers. t8103 is used as default since most drivers and bindings were
> > initially written for M1 based devices.
> >
> > The series adds those fallback compatibles to drivers where necessary,
> > annotates the SoC lists for generic compatibles as "do not extend" and
> > adds t6020 per-SoC compatibles.
> 
> The series is inconsistent about the use of generic fallback compatibles.
> 
> "apple,aic2", "apple,s5l-fpwm", "apple,asc-mailbox-v4" is still used.

Those are less generic than say "apple,spi". For "apple,aic2" especially
it's clear which SoCs use it and the set is closed (ignoring iphone SoCs
which very likely will never run linux). For the interrupt controller
the fallout of not using the "apple,aic2" is larger since even m1n1
expect that. irq driver is special in so far as it requires more than
adding a compatible.
I think "apple,s5l-fpwm" and "apple,asc-mailbox-v4" are specific enough
and describe simple hardware so the will not cause issues unlike the
complex firmware based "apple,nvme-ans2".

Janne
