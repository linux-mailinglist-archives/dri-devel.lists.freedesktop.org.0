Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3FB3A049
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E610E9C3;
	Thu, 28 Aug 2025 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="mhUdIwS1";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZXx6dRtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Thu, 28 Aug 2025 14:11:14 UTC
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80AA10E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:11:14 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 503511380D3B;
 Thu, 28 Aug 2025 10:01:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 28 Aug 2025 10:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389709;
 x=1756396909; bh=9fiZHP2mA91TXEue45ZDKPalnrgVSq7w0RmGZwoTtow=; b=
 mhUdIwS19lsgeAdCwUErovGMM6KmYqU3FcxkYjzL0QUU7G6tPe9R654zTfuV26ud
 wg5EhSBKuV6sQ0Sf0uFMcBwBMuX+rUFgJFEBOavXsagbv5EgbPkCu1h1gCEyARn4
 oP4EzS9WNiYDnFBDnOveRgvAHjAsdqCxg23n6/TG5g90eiP9OTWVeA7mFg/Ywbm3
 QjexiDwuOydxJca/IwtG0+tDO2GVZyJQ93WjfeoNeeGI025RHTp0Qkz4K0R9utl4
 1oKbBaqrtr5wTrLeIMIwNd8k93052CsM7qwd+yJRwowVo6qlPaSsgL18puMJibeF
 mK1MZdEOQoaQKd9/REh3TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389709; x=
 1756396909; bh=9fiZHP2mA91TXEue45ZDKPalnrgVSq7w0RmGZwoTtow=; b=Z
 Xx6dRtRm/595FZqc4PsGXUU3K2mTjTF9/5IV/Bcnt8SnP+QluQmqVoENXjGJrPdA
 wBToLUdrEUCURk9PDNSzbu7eNEo92IzjUQIPsEVI3N+kEnrAWAA7LoXKb1C3ivqH
 JY/lfof3QvWqPi6bFVr19HoMv/FMvNIJx/b3Zgi5m8Y5PPMyCZorbXz3ihmp3ZOw
 gvrp67QJPjqg3YtECD8Dp6dbjIU2wMPNJjxKNsorhd9cwvXDi5DjJxesQTVRzv9k
 1ju8cRSQO3bpF1rQvQqPGENFk5Zp5OP4F4Xpb9Jg2hfUid3xFs79UGHip1CwKU9b
 CM5yAdooiGcEj2zuQvP0Q==
X-ME-Sender: <xms:TGGwaPMmxHiY0GT6tRWS7oXG6aDwUdR52bLLafWDCuZ8zsV_IZUcYg>
 <xme:TGGwaBbLqnslsC_es328z0HzTZdxOY7_9bl0F0ErTAKZBR-FhGljH_rdAGMcGXE44
 tdXGfwf_GBH0XeMz4M>
X-ME-Received: <xmr:TGGwaHNIPbiovCpubn7YaILGK_ORMCpQC2NLZ9IDk3NZbBW0DDwaAS8ZsE4c7P89g1ZZSvzx7_VRhM2p04HVwVVEoFcBJQxJYglApQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
 ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
 ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
 hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
 gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
 gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TGGwaOqlJnLYLX-LRwkTQ9Pj5Toae98sleKvM1jQMmIYKv2YDjYTXw>
 <xmx:TGGwaGtTlzJZYuH1Lezti8jQVvd8aJnPMGkFiejP1xgn8Q3LXToWcg>
 <xmx:TGGwaCTCQJRkZrBR0Z2HZY90jY_GGBaCrUzxQXwZVQ0vzeq_FLJ6_g>
 <xmx:TGGwaGB0mjR8XfymBeUnS7dSsgWnedFH3wTBEDh1ejkCpnUclOQiLA>
 <xmx:TWGwaLamilxnxkezdfKH8vaaHQiXC3H98yKn2YSfdElRSBdXZH0s3IoC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:47 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:22 +0200
Subject: [PATCH 03/37] pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-3-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=b7+v0xQ3X5CAkmlIu2RDcUdn1sjt6ck/7EixXu3eeFo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNieZfXW1atKMYp9uL/Ytg69f3EUvhzClNV6l15pvsf
 j2q1KqjlIVBjItBVkyRJUn7ZQfD6hrFmNoHYTBzWJlAhjBwcQrARPaxMDIstWss1Ole17jwRvz8
 vVNrJ+0QuXZ1/Upr3TU/botXLWQQYPjvtSbLj01sVsrqbxe3PlJnYrI/3swpLmW2QNrXPPaxkhw
 PAA==
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

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,pmgr-pwrstate" anymore [1]. Use
"apple,t8103-pmgr-pwrstate" as base compatible as it is the SoC the
driver and bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/pmdomain/apple/pmgr-pwrstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/apple/pmgr-pwrstate.c b/drivers/pmdomain/apple/pmgr-pwrstate.c
index 9467235110f4654e00ab96c25e160e125ef0f3e5..82c33cf727a825d2536644d2fe09c0282acd1ef8 100644
--- a/drivers/pmdomain/apple/pmgr-pwrstate.c
+++ b/drivers/pmdomain/apple/pmgr-pwrstate.c
@@ -306,6 +306,7 @@ static int apple_pmgr_ps_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_pmgr_ps_of_match[] = {
+	{ .compatible = "apple,t8103-pmgr-pwrstate" },
 	{ .compatible = "apple,pmgr-pwrstate" },
 	{}
 };

-- 
2.51.0

