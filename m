Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2445B3A0D9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092D610E9DD;
	Thu, 28 Aug 2025 14:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="hpiBR8Mn";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="RUbzd199";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C6410E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.phl.internal (Postfix) with ESMTP id 848B61380E07;
 Thu, 28 Aug 2025 10:03:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 10:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389782;
 x=1756396982; bh=bURsQAAakUTEkhaJubEx1UAKKyBOYc27UojVfJTZiY4=; b=
 hpiBR8MncnswE8nHZndnU+d6FrOe7PqPRaG5sOI4yHRidUCuFyODPMY6sxRTmKJk
 dXVAxE03RnZZ49kWTHa81pvaV+BfimoM9E5YhMSr6ytS7ybr50Lkb1irnyj37R3x
 DPiBFJLPtizzv8pkZXRMKEW6tm8kZriMvnfWukdeCXnsnaNx1e8BinOX3LwfK6+K
 ArZ9P0SI8TPLyRl4pxB2AcvNEemHfG3i4imMhQkuKqjH2uXX/LeBOk7utFnGeZGc
 GEqUAcQllg6dI7jiGa4ea7DriTJ+kNpvafG/GKBU4phoDzz2Al34mSuDGLPcHenC
 y9IZ/1Usf42rKuH+5dbLqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389782; x=
 1756396982; bh=bURsQAAakUTEkhaJubEx1UAKKyBOYc27UojVfJTZiY4=; b=R
 Ubzd199chBhrSuoG9Y9UrgxXfVLlad1JYjuM26tildVGdE39qtIRK+mGj+zO+GPj
 ks7YvBMD+ihxcCmRlKeRfLOvWuVpi+fZwDI8XjmByI8d06sGA1KCcgD+8TfTEPd9
 GLCEP5LnrMS+SoA+hjCVk/8yav9I89YSBKa1CgfUpQuu5z8AzqP1m26NgxdcDRcH
 gqCkcCrT2GH6Dga9L/wa7P1ncU3EINs8TkZ1jz2TckJ8UJ+TiOkRDRT3uSU/cgc8
 TZ9S3pYU/80PDciR48B+H2WtIaEHQiAFg8t+euM+H/eT7P6rD6Tfk6Q1SkYCTF00
 RIcSw6C1FKg149frcJeWA==
X-ME-Sender: <xms:lWGwaNeVX9wEHZKKykPwjK4TlfDRbhNFwZQIb9JiI3wM5LA7D7S83Q>
 <xme:lWGwaCraqXw2WFJSQk8MzfHIeq3UtuJjuUNPWtXHG9jE8lpKpAgTTBiYcsF3gCLRJ
 KfDBaHL7Pg-tS2wnoI>
X-ME-Received: <xmr:lWGwaPer0orhrg5X3ennTQRh0Ib0F5dEp_jwdZ83mbLFehkGh3q2rzfFbcX1G1b4eUNHw2Rp_P1pJwG_48PkGpTfqFbissXrTwVVVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
 ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
 ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
 hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
 gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
 gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lWGwaB6d2ohSfHjJgSdFwjWGPO7qFl8Y9wFXJw0ZAJmi-R5kxuMQGA>
 <xmx:lWGwaI9MQIkQCsTguLmb-J0Jfozk0ooI-NLUKfqBIzJe3_TpMyZqvw>
 <xmx:lWGwaHguOS9FXrRf4wi-NjXQBdm9OzEcRZU3cpnw6mlzTd582q2usQ>
 <xmx:lWGwaCQMJBeaKPRnJlry_DIogcB3_J_KArQdl0-z6Ut0R4dZvMRHJg>
 <xmx:lmGwaIqB7oY3MKaW91iLZf5gaRoMor-bonCS41mlNOeqJ3QiI3I0ELHc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:03:00 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:48 +0200
Subject: [PATCH 29/37] ASoC: apple: mca: Add "apple,t8103-mca" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-29-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=j@jannau.net; s=yk2024; 
 h=from:subject:message-id;
 bh=KRBKL2ymAhzun0Pvt+/W2fLdZdIxW+dzlhG8YGU3GvU=; 
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNidZhSk+SLLtzs4py1G9sX3J/SSz/Hwf/AxtXuWmud
 rXLPMjfUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCK7dRgZtiXkXbxn8VUqRdgp
 cZoUZ2hP7ISFxfEbc7QiJSbNepkYxvC/iEN3lcqbNxu83tTP7zr94t3UXYtkLXtrkm6cdVzi0fK
 FHwA=
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
lists with the generic compatible "apple,mca" anymore [1]. Use
"apple,t8103-mca" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 sound/soc/apple/mca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..c4dcb2b545912cd02ee219cc2d4958db5aa785ba 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1191,6 +1191,7 @@ static void apple_mca_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_mca_of_match[] = {
+	{ .compatible = "apple,t8103-mca", },
 	{ .compatible = "apple,mca", },
 	{}
 };

-- 
2.51.0

