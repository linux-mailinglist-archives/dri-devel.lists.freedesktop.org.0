Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A278CE9AD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4138F10F5A9;
	Fri, 24 May 2024 18:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jCyit2UI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f97.google.com (mail-lf1-f97.google.com
 [209.85.167.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77C510F0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:03 +0000 (UTC)
Received: by mail-lf1-f97.google.com with SMTP id
 2adb3069b0e04-5295c65d3fdso1125157e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575281; x=1717180081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILGqA7+HzXQqr0Ob8oymTx1wN+C0088/4KfGywkxvSc=;
 b=jCyit2UIb/yTJCSWmZ6qzRbekgS6wTrJjLvrXgma+oohRQ0nM1SX2Gq8GX8dbNAuqF
 zuxHaThDF1/GUzFog4ZeAv3/buLcPPtQ4ddngV0cMJVNT7OU0z5rv4pCHqaK26UNfZe5
 DQcv58poPGTyqC6q6qkoD2QlT/mktHXiNOed2XpOdgIhKnv1MJL6UsLf/0trB7TnyWCS
 37EtZb4vQo5BrYURvV1oOTojY23bNoucHjJDs3tJNxWTGx4SrU4ir5zmQbmtoFpfpZSi
 YimCW9i5e8ilwRLlA06u41s62NeKI6LNGRAktbD7PBUGKoWznwt79rk2wMJO9AI7sFMZ
 GigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575281; x=1717180081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILGqA7+HzXQqr0Ob8oymTx1wN+C0088/4KfGywkxvSc=;
 b=tvFJTuK7CHBJYoEFtwL0T4kJVBIeRdMtFZDBR5MoUGm23BWGurOS2dyp38TyD4977K
 K6ly3DzegsqrJ3FBBeeidKE4uu/exxSKnPqN096np8SwF+1ysR3MRpZUTkJHk55UGNEp
 tuAAk8FcYpGek2MfF6+eZIZF0i11oyhZkz4/XmTPXSjbF43tVMkHTGNA/JfAGbIZaSb/
 n1cq2gGGepkzTawnmKlLaM7zlYTHSG6kqXkS8onUfaZAywU+QFL0u98ApV4VPFWCgdSb
 modilbBsyYtbHpekIN7k1fOuQGtxVPhh5nxQDbGNb1btYWtAQWiT40MPXu3uNgZrr+RQ
 1ZDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAfy94IuBVX2cdAaDnXhA7nlqloLU1bK9QY4YmJ4lt+RCiLAQeXgkmrqIv3QI4ZnhoLHGngzWvTflc7MD+K+oafFSTO82IPeAln+YC1IO/
X-Gm-Message-State: AOJu0YwSQqPAyM8H2qNt8P5jRBbsR6F8TxFJWsex5th7i2K9tvQFzHpn
 6dUoRR2G35QASQwKtVXm8zekHcjlFddvmrFiXvweBBp/Kiejc1z7PiCOSGW7eGnMvuiBwHkf0yZ
 HcdsANUMT+NpQ+5batzacZFzXmWhC3/7E
X-Google-Smtp-Source: AGHT+IF1+0vxRvmRUWINjGzopDgrgXSdoJO/81rJkJR0w/gJjv8782tLukyv6IUMN4Wu5q+/dPS8x/uZhNPk
X-Received: by 2002:a05:6512:290:b0:51d:7d4a:517e with SMTP id
 2adb3069b0e04-527ef210aa5mr1916182e87.9.1716575281453; 
 Fri, 24 May 2024 11:28:01 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 38308e7fff4ca-2e95bcd2393sm339921fa.6.2024.05.24.11.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:28:01 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux.dev, linux-sound@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 17/18] ASoC: bcm2835-i2s: Use phys addresses for DAI DMA
Date: Fri, 24 May 2024 19:27:01 +0100
Message-Id: <20240524182702.1317935-18-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Phil Elwell <phil@raspberrypi.com>

Contrary to what struct snd_dmaengine_dai_dma_data suggests, the
configuration of addresses of DMA slave interfaces should be done in
CPU physical addresses.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 9bda6499e66e..2d0fe53245f0 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -30,7 +30,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <sound/core.h>
@@ -830,8 +829,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	struct bcm2835_i2s_dev *dev;
 	int ret;
 	void __iomem *base;
-	const __be32 *addr;
-	dma_addr_t dma_base;
+	struct resource *res;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev),
 			   GFP_KERNEL);
@@ -846,7 +844,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 				     "could not get clk\n");
 
 	/* Request ioarea */
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -855,19 +853,11 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_regmap))
 		return PTR_ERR(dev->i2s_regmap);
 
-	/* Set the DMA address - we have to parse DT ourselves */
-	addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(&pdev->dev, "could not get DMA-register address\n");
-		return -EINVAL;
-	}
-	dma_base = be32_to_cpup(addr);
-
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	dev->dma_data[SNDRV_PCM_STREAM_CAPTURE].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	/* Set the bus width */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr_width =
-- 
2.34.1

