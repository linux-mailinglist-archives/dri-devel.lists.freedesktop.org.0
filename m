Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC638CE986
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319810ED95;
	Fri, 24 May 2024 18:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tNWpll3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F7A10F13C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:01 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so6627735e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575280; x=1717180080;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGCf1ir0ewKxnfYL+8Y6zr0drR+R4O1jhqT1oluTBL8=;
 b=tNWpll3rRBPY+yTxIwCKKbqR2tK6L4GTYyW8lyTtTiT9b6ixobU3e8ba0cGqqLg5RJ
 +rbuLIl2Hnpn1gkRqDvqwGI4sSXiwPFxecZX4K2vnvyHgDio5urbYyP/2+res1VrF4CA
 hC2rRa0jzKlN4p4T3AiwdP/ZurcDTq31sh7r9ZT9bsK9BMiFytdrYjvT77+NAUpwBeBG
 NHsmQxCpgrAd3rCK0SkmXby74oLuCObc+Vh7tp/5FDpI+J+M0ozwtvRmbIn2DDFUXzaC
 7whLKJv6Ic4dAo+3On7U5/ugFjzp84gRpvWZqdlMOvlaQM5TKaL1lxmEWEwqB+x54gd/
 BJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575280; x=1717180080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGCf1ir0ewKxnfYL+8Y6zr0drR+R4O1jhqT1oluTBL8=;
 b=aQLJXkvM8MxcTZRn11NY2t3Vd8k8ACSmISseCUqPWB9A5l8ju4It5t4wlRHt2VTRBR
 Lxqq9nG8SMVkoCnDY9l7s1y44bIEoq0wJERCqdK5YVZAgEErxGF3FZmHdkAIsKsh3GdV
 VJfI9GteJh4VFnDwo8iCRI1ARcxJUUsVXr6vDZGU9s2asaUCZWqwbD9ezgEI7hqc1xaw
 aZkwehIvOcgTsmT7Cl+YszqckkkESizkqjkL/1el5ddQpC+ipS60wvMfCOJtsQai704y
 RqiIJzwPiWAkN1ces7/I6hjx+gMrNWXDJ/ZILPqTA0reZ2AjutQbNVDaBlSZjxvc1cqY
 vEmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7HpzfXacNuNMCO7wD+2YIAPTlHkB47Qe0CO7nBH9RhJrZDVM3sd6cD6a9tIBPyROy4XCCZrE4vA3a2lGaa1JJSjVMdkH5dVtDjwKvNaAu
X-Gm-Message-State: AOJu0Yw1nvlzabp0wM1h3lea5yRmmwkZRGpTWdo9zKQ4154OZFQJ2/Xm
 Cl8hs3vMo1wNtxmDUOA2IOyRtaTzSIKo11CE8Nrrix9Rwb2+O9eev/n1Ey5kx3DpcMb0aZfNhy3
 QPjeGV3F9xHBWnySjdQIVNdmBorXkNHmM
X-Google-Smtp-Source: AGHT+IHAQFzXjWnTl+TwMEnEF3wypw9s7LeiM71e7MxN0zWKYR44rUnrOPV4U43jDFBiNTbbJuux8HJQ65dC
X-Received: by 2002:a05:600c:1381:b0:41f:b0e7:f299 with SMTP id
 5b1f17b1804b1-42108a59292mr20514315e9.9.1716575280074; 
 Fri, 24 May 2024 11:28:00 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-42100fa9eb7sm5393305e9.34.2024.05.24.11.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:28:00 -0700 (PDT)
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
Subject: [PATCH 15/18] spi: bcm2835: Use phys addresses for slave DMA config
Date: Fri, 24 May 2024 19:26:59 +0100
Message-Id: <20240524182702.1317935-16-dave.stevenson@raspberrypi.com>
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
 drivers/spi/spi-bcm2835.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index e1b9b1235787..e8242e0c4246 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -119,6 +119,7 @@ MODULE_PARM_DESC(polling_limit_us,
  */
 struct bcm2835_spi {
 	void __iomem *regs;
+	phys_addr_t phys_addr;
 	struct clk *clk;
 	struct gpio_desc *cs_gpio;
 	unsigned long clk_hz;
@@ -891,19 +892,8 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 			    struct bcm2835_spi *bs)
 {
 	struct dma_slave_config slave_config;
-	const __be32 *addr;
-	dma_addr_t dma_reg_base;
 	int ret;
 
-	/* base address in dma-space */
-	addr = of_get_address(ctlr->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(dev, "could not get DMA-register address - not using dma mode\n");
-		/* Fall back to interrupt mode */
-		return 0;
-	}
-	dma_reg_base = be32_to_cpup(addr);
-
 	/* get tx/rx dma */
 	ctlr->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(ctlr->dma_tx)) {
@@ -925,7 +915,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * or, in case of an RX-only transfer, cyclically copies from the zero
 	 * page to the FIFO using a preallocated, reusable descriptor.
 	 */
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.dst_addr = bs->phys_addr + BCM2835_SPI_FIFO;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_tx, &slave_config);
@@ -964,9 +954,9 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * RX FIFO or, in case of a TX-only transfer, cyclically writes a
 	 * precalculated value to the CS register to clear the RX FIFO.
 	 */
-	slave_config.src_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.src_addr = bs->phys_addr + BCM2835_SPI_FIFO;
 	slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_CS);
+	slave_config.dst_addr = bs->phys_addr + BCM2835_SPI_CS;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_rx, &slave_config);
@@ -1336,6 +1326,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct bcm2835_spi *bs;
+	struct resource *iomem;
 	int err;
 
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
@@ -1359,10 +1350,12 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 	bs = spi_controller_get_devdata(ctlr);
 	bs->ctlr = ctlr;
 
-	bs->regs = devm_platform_ioremap_resource(pdev, 0);
+	bs->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &iomem);
 	if (IS_ERR(bs->regs))
 		return PTR_ERR(bs->regs);
 
+	bs->phys_addr = iomem->start;
+
 	bs->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(bs->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(bs->clk),
-- 
2.34.1

