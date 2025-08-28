Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05EB3A2DF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FF210EA00;
	Thu, 28 Aug 2025 14:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="naO5RlnA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gtTcendF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9B210EA02
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:56:39 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 2A49B1380B20;
 Thu, 28 Aug 2025 10:56:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 28 Aug 2025 10:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756392999;
 x=1756400199; bh=x+zOoeFqoqbdML/hojvHJE4J3hnCLwy+Wq2e4pfe8dY=; b=
 naO5RlnAcjV6ciQqEchUumcMLrGgttJU34BNh8/fMEyCoY5ocL82XLbrb83EJ2O2
 Fc4w/Dr0TQI+aWyk3/RuhOWAZewPpC3rkz4BOq/QoNzSN0HRepKeV9Nxh4y8Bgrg
 P3NeioJ6GKJX9O0VcZtcRrDKVhBuodYb+5uARvDDFqLxMrfA2wQ+Frb/ZyFIReEv
 4RyNtkEsayuYo9YhRXL1Gosioej6QLx+pQNdWz1FxOOGUKttlOGZOACmt775BS1J
 21k5l2wKk+nONNPDFSJ0YBaqVFErUtVfr9Fgy8DnZCcTjhYrrf9zNsVD7utj7M3F
 GjIDV7XFPx4JddnfOEzA7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756392999; x=
 1756400199; bh=x+zOoeFqoqbdML/hojvHJE4J3hnCLwy+Wq2e4pfe8dY=; b=g
 tTcendFSMFmGj5jmLjXZseMZb7AT2y4KMkh/PzuplcB5Ct9GoXbcK9G/P+saAyQA
 wq0hj3Lh0/dBWIP1HSSsqob9qSCSXzVxrDy9QEFnQwdtdysWPx/H4nXp8zTOHmd8
 ma1phYzvOqIWVNzoXKQgCWmlH1ZJv4C9AxSJ5a3OtVbbJqAcBAvfAQdIh694tcGX
 b+r21Erc2h8cCapwetBGzgVRZycBOnhKpbYK2171uYsJ56BYNlybuBdhOaz6XCIc
 WQ/+UITEi8MMM5SkbaPLzyaUaS5+7K3xkPxJrH7f5qEN2tVyU/dCl7BDpSbGxXDp
 DAGt0EFo8lEPhOZoEqazw==
X-ME-Sender: <xms:JW6waDIFsV6cw86kmEeFjdiTNKqL7TJWcfZPiRcO7mTCBolPue4d4g>
 <xme:JW6waOkFRrXlLXU7IMlcRYcQ_d9s8rECg5Q1sNGAwyNJSnOjWoDa-p-mXJ8sBom9a
 5zTHiVJDKHm8Me0Uf8>
X-ME-Received: <xmr:JW6waErmsupYEU-kaWVcaskggy2wxrCvh7bRHCu9ATOEUXYt4yv8w1Z0LrmI1dbVQsNMdYnqUK2kecUwT5gvgr3A_CUVh-eShhZpwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedufeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
 ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrh
 hoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
 rhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
 gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtth
 hopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhgvshhhrdhk
 uhhmrghrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:JW6waHUEPo5rwriE_fbKvlwsJnIvHkeyEFsKPib0wF6Gtjfqrrwk2g>
 <xmx:JW6waJp2n9mN2Njur7szV0YZ6mP9AFg_eNNRaMlLuuL4YivU38xHlA>
 <xmx:JW6waCf3pzMU6h7Lye9k4h3mgLVgUzJWx8FZze3xgauvAtlDltp-1Q>
 <xmx:JW6waKe48EWVqiUSqovty-Ea2Mo9a9ZUtbNgOXahny_CAT9VaViAmw>
 <xmx:J26waBn7LHKRyTCaBMKkgnyWLIhF-8878I4eUg39MGXk4zG41hbUoSGE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:56:36 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:52:11 +0200
Subject: [PATCH 33/37] arm64: dts: apple: Add ethernet0 alias for J375 template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-33-bb8e1b87edef@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>,  Lee Jones <lee@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=j@jannau.net; s=yk2024; 
 h=from:subject:message-id;
 bh=UD09qhA3R42KTHJ/xUWZ97rxg7UWqV6PBk3soTPZLRY=; 
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNOf87Vk0vKPzVV2csaxhV+udwQI9xy/734sUbl08p2
 vb3xs2AjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPxz2dk+Lmvb3kor70v45mv
 0WLh343bJz7/drch8uH5LcbWd+UcpRgZ3td5at/8rDhPISH0EscH9tdc2+dqHP+74cE1IavtLyu
 V2QE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

The alias is used by the boot loader to fill the MAC address.

Fixes: aaa1d42a4ce3 ("arm64: dts: apple: Add J375 devicetrees")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index ed38acc0dfc36a1e30b1d44f1a8dcee089e87232..c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -12,6 +12,7 @@
 / {
 	aliases {
 		bluetooth0 = &bluetooth0;
+		ethernet0 = &ethernet0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
 	};

-- 
2.51.0

