Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648E8CE9A8
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4A10F582;
	Fri, 24 May 2024 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OY0IiG7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887EA10ED95
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:03 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-420180b5897so31805875e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575282; x=1717180082;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gaJ2/2ZC9xmhH/6MleK2a1l8XHvCRgt0iv2l1bIIm7k=;
 b=OY0IiG7M2NNMhIkftPSSargrhnoDjW/1znbfxb2zL70+MifQFf91dyeRnwhvv3CQ5Q
 sxGwzULoJvAOnseCzfwgu57mqXkQ1jkn7gKjghkijIJ7EDDVLVo5+XonnvxWdBO+jO76
 1YDdefuF/Hfa0p+Aw814EceyyWVp+FnCbQuM4/C0s8SPiihPTK+/Yfl3Rtg4SJdZILFl
 eFmg4ETHIqChiLXhkbgp2aNrKaaikWS/XslxqM4TYpUUCmbbK37Omp9zMYyWGwQMeMLP
 KgydPhHMzXCJ/Tve1RVSfBdb1EYjtdrbyt5SnPhQUNYcUQu7hWkdUJ1UeZdou4caJiBx
 GsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575282; x=1717180082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaJ2/2ZC9xmhH/6MleK2a1l8XHvCRgt0iv2l1bIIm7k=;
 b=H4TZXTvA4jRuizgVfHH5/HSw8iEeF1qJxiYqoYZ5nuF8YNaMBUhYJnNa0MTRVgqM2I
 qJezGTiUmppQrVZnqrfWTVeGK8M6tJ2nzwh9Jiqp2h61ZGtJV2O6mu+MU0x1Ie804gCf
 WF+xJwwee5OMLFeGwFiELAT9GjcHthO7ofBSqFdDEc5+BSjQUXzj64dqQ4ryY/4QcbbR
 WUkHil8eeGNuZ9SOxRysbDu9OmNwA+cKuMr3w4+iKDk/j7rXhYzV5lIYJnRK9n6wFovA
 HNNaeKivnm3Erwpu/MtLCrm0EYptfvL1or6/I1UaMmRo9B6ndh478uRJtZa6qa/TSQ0M
 aLBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPYm7UCP9otMTc9XH/NUfY1zGDkTv5hBBoNS+agG4gWn5pe1TyKrmDgSn434tvMtseZaelanzAmFO2EUs8UMRTBj7pkqdTWg9m6Fi8igx7
X-Gm-Message-State: AOJu0YxeJ3+qQoa1I2D5jaUk/ChL6oshcC/QUmXP1lpEjpk2TnyfM48O
 ur5g6ddcChUMzczDp4KhiwDrgxWZ2DVGTDb8L2rkmPXRQuxTkFwqBloC39TPnjR4lRxf0q4D7VN
 2ahbIYDkWpIOZM4YfxVOtU/NSx/pl1Vh8
X-Google-Smtp-Source: AGHT+IGW0tEBfx8ikBiBvNc7paeaC57bk88c6mQfl/2RM8CdfU5tVZ5vx+/JsN/a6nuR9BJ11cex+eTG9kUv
X-Received: by 2002:a7b:cb8e:0:b0:420:2b5e:1808 with SMTP id
 5b1f17b1804b1-421089d8182mr27055785e9.16.1716575282092; 
 Fri, 24 May 2024 11:28:02 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-42100fbb0ffsm5433375e9.53.2024.05.24.11.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:28:02 -0700 (PDT)
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
Subject: [PATCH 18/18] dmaengine: bcm2835: Revert the workaround for DMA
 addresses
Date: Fri, 24 May 2024 19:27:02 +0100
Message-Id: <20240524182702.1317935-19-dave.stevenson@raspberrypi.com>
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

Now that all DMA clients are passing in CPU addresses, drop
the workaround that would accept those and not try mapping
them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06407691ef28..181f2c291109 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -405,17 +405,6 @@ static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_dma_chan_map *map = &c->map;
 
-	if ((dev_addr & 0xfe000000ULL) == 0x7e000000ULL) {
-		/*
-		 * Address is already in the 0x7e... peripherals range.
-		 * Assume this is an old client that hasn't been updated to
-		 * correctly pass a cpu phys_addr to the DMA subsystem.
-		 */
-		map->addr = dev_addr;
-
-		return 0;
-	}
-
 	if (dev_size != DMA_SLAVE_BUSWIDTH_4_BYTES)
 		return -EIO;
 
-- 
2.34.1

