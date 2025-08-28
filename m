Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA1B3A04A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B010E9C5;
	Thu, 28 Aug 2025 14:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="bsDz/JCH";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="KnoKqNrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E063110E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:11:15 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 6AE921380D48;
 Thu, 28 Aug 2025 10:01:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 28 Aug 2025 10:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389715;
 x=1756396915; bh=Xu3JOng37W5zWLpo3vy/P+e2Hn4Gptr5ML14ZioQ1Rw=; b=
 bsDz/JCHCniSwAEdQtsCVp1YfsOaL/vn30CzQcWWNduiuI9vSLaF1VDipUWpprDU
 Q1guoMAH2MSvK0nkEm4x1XfWR8XdGe4SYnWfUJ34e53NGQZv+aVE8ibUlUa8YKqN
 FApVeiy3FukmCVps5yBEnLz+MQfHoUi3yyzyVk5jVxVqFw0wyvwqkhmh0jEdvmNQ
 bAjaX9gqHx54Pr6+qY4szl0AJh6ypJwOUSiBLcYuJdwXMMhXYfnCns7hOhf8Czh2
 56/6CJe5KtvphhCe+LTEgp4pq/Wz+Y2maxcleTlMMw4aq/RSVw0bGYaVitjgxsTM
 H0uRj13uLuWOUWIBxlpF5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389715; x=
 1756396915; bh=Xu3JOng37W5zWLpo3vy/P+e2Hn4Gptr5ML14ZioQ1Rw=; b=K
 noKqNrFz4aucZTDY2zGI3IO22qw1t16SYdGX4LuicyoEgPRMwvxdiX2WzL88jOih
 LyzQrN/qmEgOV54Ivo8gPWpv8e/d+3NN6iwtmSh0eiDXqWUyxOBWos77hsfZeglx
 3tf8qLemMMP8c/L8jkqpk9C8dEJBghUBlMaXQOyxvkwCa83NmiwTtOu03Uq0v725
 8795DJ4/F6RdHNASW7yIDX04jmlh4Auc3qk5kW4skDaG9B9uwVcSDfDrx4rn7FIc
 IAaEvYmdkDxdkC0+xGLgcPkuoD7DSAs1YmjXae/XOlSO5ypMYmRjxIeKMRRP1fEy
 s2FF3ublAzDDWBkVTaqBg==
X-ME-Sender: <xms:UmGwaOxn-KCtw4i0mEhmcT0ZVD0z09s0pWTkofVvbFvdBQwUMvk_Lw>
 <xme:UmGwaEW6DCykKMKMsknwILtEwqrgsw4m-HC7QQ_lkGjDfEMVDBiWLIYFic05ZV9w-
 4_zap9DklUmmNWVaVU>
X-ME-Received: <xmr:UmGwaPZonSL-HPiscHL1MymD-I4K5NJwqzKPdpAv8sz15QGZVjy0FG_HlJxLtb7paBedRpQM_QCoVG3LWm4rTmxExJoHjrGUXzFTYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
 ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepjhhohhgrnhhnvghssehsihhpshholhhuthhiohhnshdrnhgvthdprhgtphhtthho
 pehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghsugdrohhrgh
 dprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgr
 ghhisehgrhhimhgsvghrghdrmhgvpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvg
 hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UmGwaMonhvVggK4DbmsQGYHkZSqAf9cVV5E2leLN4JBuXfLJA4PI8g>
 <xmx:UmGwaMHwAvNFoEvte7QRX1OP-DeHMb6ZfFNYHZi4-7bzGsfWV_tDmg>
 <xmx:UmGwaCBDXDwHnOV2RCGPGIO05p6kcKPyo2kpVtkdZ7C8B8S4SuoMMg>
 <xmx:UmGwaPOpgpU9MQSXGY2VYoohIkwlQgH4l-nYv0KWYg9yQ9s7Gxunew>
 <xmx:U2GwaFSeTgFUii2sbXaYdB1grZ6QZzGdByRQlmNHemUscqD0D8sZ5Gqi>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:53 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:24 +0200
Subject: [PATCH 05/37] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 t6020 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-5-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=dosYRxXs4Kj6PK0G3JZlKpl3QJAspXR+xFz3dDkwWz0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNieZTat480/z0w7/TZHVSecSDJaJpu4+v+7Koy+/2r
 0fv15ie6ChlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRd28YGV5tWSCXvJfLZqXs
 mRtLfx3M5VN1lVNdL7es7+Kjx2V3ZbwYGXoc+3O2l114JfQucGppImP6gzmR61borSy5uUtzj1D
 yPH4A
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

The CPU frequency control on M2 Pro/Max/Ultra SoCs is compatible to
the M2 (T8112) one. So add this with the per-SoC compatible to the
bindings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 896276b8c6bbed25ba4d5ddb8a40159713e2a372..b51913a817917537f50e79a573d291267509850f 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -35,6 +35,9 @@ properties:
           - const: apple,t7000-cluster-cpufreq
           - const: apple,s5l8960x-cluster-cpufreq
       - const: apple,s5l8960x-cluster-cpufreq
+      - items:
+          - const: apple,t6020-cluster-cpufreq
+          - const: apple,t8112-cluster-cpufreq
 
   reg:
     maxItems: 1

-- 
2.51.0

