Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DB8CE9B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F02B10F5BB;
	Fri, 24 May 2024 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BL989WJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f227.google.com (mail-lj1-f227.google.com
 [209.85.208.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13F10EC65
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:59 +0000 (UTC)
Received: by mail-lj1-f227.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso19978911fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575277; x=1717180077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5/0PmDw861toPHKUvcW29ls0QVOfTRw5AjJ+CnPD2s=;
 b=BL989WJ35UGU0xsEw61t/b5s5LmJAgKYwZPUIDDUd/15X9uMrytoAXPueIvqEKr5Mx
 if6SGHDvUIJCtfSOwdO1DwVDs7ZoJgEs+V/3MG6FukWOrosJkZFOjqmL4V5V5kcsg/5i
 Snsf962QiokIhNcIkrZhSFq6dRttMzp5f0V2Fm4SGB6ODHPZ44wULs1v+TR68Ak+qYnH
 t++BENIWpKDdI0J1w6v8VGbt5KtMZfK0H30WZ62aVnJ6GZEoG1wtAgSGARDM1hmDhyTx
 Eovq6S1BfNCuX8uezWm4nblD/POItTT9WFQ6OQyHA6JFe2uryagYtfKyQ3qolNwuXJBX
 cFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575277; x=1717180077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5/0PmDw861toPHKUvcW29ls0QVOfTRw5AjJ+CnPD2s=;
 b=X02er1/DUAd5yXkRGnLJCGZsbceaTeS4YR0RGHJpxGHtdGCfKZ8aJZJxBu4VgiWNpl
 SZGpTtpzKR8IsPUTMrrSMWg4MI+1/AdptRrVaIAtsmVSXiYjCw/oJJK/L5vtzNbZDWWT
 cDleuQvMMwSW6bo5VW5IXZMlionnYNcPG64bZn3NdzV/+RAulAnmWFSyvW7yQohY6t6l
 zC4IdTlUBflgDXlaseJ/SGWSUQ4TGV3fm3fLQdLXqbs2KO02ysghCxSZILyJBtYgxOQY
 3h5D7u0u6gbITpEjW/ZadjDOlWyJpNDw3BqzQtAPlvhdzKOqJZPtHEe8iu23NVGNkWHv
 sSxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7fS5adj7xGBUe9PyuJpGBNouexHEg/YJ21xIiD3HBC/vspsQTAbkL/Wh4SaKgguOI6PonLLRlomdJzgZD1E/lYW2O3F4yZ1cJSgrWjMy8
X-Gm-Message-State: AOJu0YwIVU0NQtLlyheek0plVES9wX+x5AEOFT4GYznCn2Cye7Uf38ko
 xaZLBtYfH7vTiTr2/A1XUvm9dL8wsaUYBe1UXQPuVH56IqE23WTcr7S3Yt/ysCwCaFvEpHlFytT
 yI5MpKKjC1ZpoJwIzftP/HvXldN9+Lelx
X-Google-Smtp-Source: AGHT+IEHAWM6BIO0Edq+CWHOn6Y+ZIrJttwNlxlncG6HGF/KksFdkfl8n2+vvBn5hfO9zRO5ovw/15yBiAgP
X-Received: by 2002:a05:651c:4d4:b0:2e9:61c7:cad3 with SMTP id
 38308e7fff4ca-2e961c7cceemr12892461fa.25.1716575276717; 
 Fri, 24 May 2024 11:27:56 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 38308e7fff4ca-2e95bcedd3dsm330901fa.19.2024.05.24.11.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:56 -0700 (PDT)
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
Subject: [PATCH 09/18] dmaengine: bcm2835: Add function to handle DMA mapping
Date: Fri, 24 May 2024 19:26:53 +0100
Message-Id: <20240524182702.1317935-10-dave.stevenson@raspberrypi.com>
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

The code handling DMA mapping is currently incorrect and
needs a sequence of fixups.
Move the mapping out into a separate function and structure
to allow for those fixes to be applied more cleanly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 46 ++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index aefaa1f01d7f..ef1d95bae84e 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -65,6 +65,10 @@ struct bcm2835_cb_entry {
 	dma_addr_t paddr;
 };
 
+struct bcm2835_dma_chan_map {
+	dma_addr_t addr;
+};
+
 struct bcm2835_chan {
 	struct virt_dma_chan vc;
 
@@ -74,6 +78,7 @@ struct bcm2835_chan {
 	int ch;
 	struct bcm2835_desc *desc;
 	struct dma_pool *cb_pool;
+	struct bcm2835_dma_chan_map map;
 
 	void __iomem *chan_base;
 	int irq_number;
@@ -268,6 +273,19 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
 	}
 
 	return false;
+};
+
+static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
+				      phys_addr_t dev_addr,
+				      size_t dev_size,
+				      enum dma_data_direction dev_dir)
+{
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	struct bcm2835_dma_chan_map *map = &c->map;
+
+	map->addr = dev_addr;
+
+	return 0;
 }
 
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
@@ -734,13 +752,19 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	}
 
 	if (direction == DMA_DEV_TO_MEM) {
-		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
+		if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
+					       c->cfg.src_addr_width,
+					       DMA_TO_DEVICE))
 			return NULL;
-		src = c->cfg.src_addr;
+
+		src = c->map.addr;
 	} else {
-		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
+		if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
+					       c->cfg.dst_addr_width,
+					       DMA_FROM_DEVICE))
 			return NULL;
-		dst = c->cfg.dst_addr;
+
+		dst = c->map.addr;
 	}
 
 	/* count frames in sg list */
@@ -795,14 +819,20 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      __func__, buf_len, period_len);
 
 	if (direction == DMA_DEV_TO_MEM) {
-		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
+		if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
+					       c->cfg.src_addr_width,
+					       DMA_TO_DEVICE))
 			return NULL;
-		src = c->cfg.src_addr;
+
+		src = c->map.addr;
 		dst = buf_addr;
 	} else {
-		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
+		if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
+					       c->cfg.dst_addr_width,
+					       DMA_FROM_DEVICE))
 			return NULL;
-		dst = c->cfg.dst_addr;
+
+		dst = c->map.addr;
 		src = buf_addr;
 	}
 
-- 
2.34.1

