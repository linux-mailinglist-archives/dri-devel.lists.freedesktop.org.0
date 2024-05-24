Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F229D8CE97D
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5110EC30;
	Fri, 24 May 2024 18:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mlcg8+Ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5F10EC65
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:55 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-421087b6f3fso11219315e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575273; x=1717180073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKd9X1LOVt1ChaX4vRXT/Yfb21vDTf36hviq/MF6+cg=;
 b=mlcg8+CtOMNRM9v2/yOLXEuI106ef1zkf9C0/WGwCzTzJsw2nkRDrKtQ7PdlueXMpJ
 aAoA6O25h9BjRIi1HmdbR67tDUReW9dMNYpHIRL9QzXWIYumLhJhgKgVSEs7JB920efI
 ISZ91KcSuzNu+1wNjssI6rIr6XN0EjlbxXcDyYS4RfzZJM7nyvu6g9Gr8OGUqOoXZ4S7
 72SiEGU1llL0KTJnFCdjKBPc/QVUuJfylvHpFCfv8PNAxpd+ov1kchJ/quOyRH/oZUr4
 1irBhW03iRgDI4dHKkF8dQQ2Zf8zTlNeWvcryN59zOWV0Ks2CW7sfPiyoQXaZQgBbd+Z
 O5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575273; x=1717180073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKd9X1LOVt1ChaX4vRXT/Yfb21vDTf36hviq/MF6+cg=;
 b=CdW0kNpD8So2OaTkGOzSVsxu+WQT/8r4iJKWysBno6OgE5R4rm/G3Mob7w6jV7UQZs
 GIdpgl7i9tsac4irsR+FXlqTfwldXzjpvp7IWrx5EXkI9Aqm9rMDfkxIf5UpGs0/Zj7x
 Xjhvmqn+iOQyzN0iUJ/GFZ3uQtPHzU558hAjSuDg+xPHIrAgUdzdReZSujeb77hbHyat
 7u9so7UDJtBqmTVjwcnWHKp+FcTsnJUMJyJ2AX0oLZdmWijddG9mlHePWjUUOEP+4kVP
 9JgqK52twSZf1U1D/9uwsg3c4TcorXL06SQzWftcEdemxKGe5MjxXLQzdzW7gT4Scp0z
 1Q7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJdL59s3L1QNvPS91eAOa/piZebaEoGzgyc37V7gYeBQ6n2dGJis46moGV/KiByZMn5cAL61lILvldlwagR5my/R1uKdBeKe+aNNjKsx9M
X-Gm-Message-State: AOJu0YzLcRu0+E0Q/hv0jyHybbT7CaONQkqdi2XULmq/m28Y22nW1rBJ
 zoztYIyBgiXc01C0KYdfIXoLXX4xFDDsJ8V7jtkbuw7mP6oFut/Bc+WzmhW+KXE4qSI2O4uYKoK
 iksxfZdPAoDmEyQilCo+eCFqLoFzARauU
X-Google-Smtp-Source: AGHT+IE1vodFu4VYv4ismPyHD4+ricu2iZqmWOTNKtTorabHI/piuhSxGYfbWmThDOKYJ4k1kIH/5D1hvWp9
X-Received: by 2002:a7b:c305:0:b0:41c:2313:d966 with SMTP id
 5b1f17b1804b1-421089d3943mr28029795e9.1.1716575273524; 
 Fri, 24 May 2024 11:27:53 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-42100fb4c8fsm5347505e9.49.2024.05.24.11.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:53 -0700 (PDT)
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
 Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 04/18] dmaengine: bcm2835: move CB info generation into
 separate function
Date: Fri, 24 May 2024 19:26:48 +0100
Message-Id: <20240524182702.1317935-5-dave.stevenson@raspberrypi.com>
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

From: Stefan Wahren <stefan.wahren@i2se.com>

Actually the generation of the Control Block info follows some simple
rules. So handle this with a separate function to avoid open coding
for every DMA operation. Another advantage is that we can easier
introduce other platforms with different info bits.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 50 +++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 528c4593b45a..7cef7ff89575 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -201,6 +201,34 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
+				       enum dma_transfer_direction direction,
+				       bool zero_page)
+{
+	u32 result;
+
+	if (direction == DMA_MEM_TO_MEM)
+		return BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+
+	result = BCM2835_DMA_WAIT_RESP;
+
+	/* Setup DREQ channel */
+	if (c->dreq != 0)
+		result |= BCM2835_DMA_PER_MAP(c->dreq);
+
+	if (direction == DMA_DEV_TO_MEM) {
+		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
+	} else {
+		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
+
+		/* non-lite channels can write zeroes w/o accessing memory */
+		if (zero_page && !c->is_lite_channel)
+			result |= BCM2835_DMA_S_IGNORE;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -615,7 +643,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
 	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -646,7 +674,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -656,19 +684,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
 	/* count frames in sg list */
@@ -698,7 +721,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = BCM2835_DMA_WAIT_RESP;
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
+					       buf_addr == od->zero_page);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -729,26 +753,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
 			      __func__, buf_len, period_len);
 
-	/* Setup DREQ channel */
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
 		dst = buf_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
 		src = buf_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
-
-		/* non-lite channels can write zeroes w/o accessing memory */
-		if (buf_addr == od->zero_page && !c->is_lite_channel)
-			info |= BCM2835_DMA_S_IGNORE;
 	}
 
 	/* calculate number of frames */
-- 
2.34.1

