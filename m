Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14898CE9AA
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902910EA0E;
	Fri, 24 May 2024 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fg8AO9Ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f226.google.com (mail-lj1-f226.google.com
 [209.85.208.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ECD10EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:01 +0000 (UTC)
Received: by mail-lj1-f226.google.com with SMTP id
 38308e7fff4ca-2e95a60dfcdso14511201fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575279; x=1717180079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtSsjB9R4+UVIqScRuc1I4bk33cfKERDT5iPQWCGPm4=;
 b=fg8AO9LyLs466XCaJL/QaBW8FkaRfwqXBUKvBt2FhbVeaVuLbV/G3W81J6ukJf0sdB
 EvxPEfIIwLpUn2Bke8FPQ54SDHIKTpk/G5mMd+Ug6KLhDFybYilgx5M43EEGRQ+GGH8F
 UM9lZv7iDCj+sKykITOSzP2kKLCDUH/h2LJgpJ9W6q70OTg8mE2ABUn7W7h6N152Fzx9
 UUDaQEHqhoUJU7pXZ/CWah2l+8mlr3tdEXGO5EA11jU+Z9ifFXyWnKy5xVx/CAr9/p0I
 5wqxcaN36UAHFYyC7mQ9V6UWXfAdCWCYOxqdUyCGe0ZeE2D0Y58yWM/ImWp/mxqycqOu
 kGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575279; x=1717180079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtSsjB9R4+UVIqScRuc1I4bk33cfKERDT5iPQWCGPm4=;
 b=S8pSN3iSk1NqFvhPPhjrVCeQeAt/mevPlaQ7A4RGKs/01WUYgqqd5nLwDbTRaAIw3x
 r47kVmnn7FEvLKYoo0q6ZCirLkFL4hKvgWkNIEGyIat+iUWro159qbkdog0Rjfvolxrs
 LCvRvdGKbzBlupRBGTX/iwpU+S8aZTLC9uheaYPIyFrRgafjNgxoJae/D560nEnwugxs
 pIIRAh+Gc69tRVBjcoZ4D5y6VJyRfak49t7pwBonDKx3WbzzghIKv3if05KoFR9fVMwZ
 Sqv/c8Rt550KIJV6o8jjn/id2PSslpnkScGMnJx4cqwuGJi1GTyNcrB2W4YiV7duvYQf
 6Irw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEuf6oalVwqH+b6Jqnb/stq+isR9me4lTQvBiWLDkpyI5g4c/1P6vSRuwjqWUJkljcY7l3pC2oFCvXZVRF1f0UpuCA6fL0jArNJGiQxnmA
X-Gm-Message-State: AOJu0YzxNbL/BOe/kUFxLi//5V5jObOX64MrvSViZP4Iqp02HbhDPmAw
 9eqOWjXsuQWMERMPVoYvDILDhAOEghqZod2BX14DQ3EETEDaVh9X5UoTeyEDrthZ0WH/aLEDjoZ
 VcCf1mcTOX/7R0522OnFCgnmLxzWixtc2
X-Google-Smtp-Source: AGHT+IEUZDsi7SCR4IVByAOz4hmEEdc/AaRCJ/JoMT6C0FVxhy9anVd20JxEW5NHN8g2XEYbzyFyk0QQFB+O
X-Received: by 2002:a2e:9c8f:0:b0:2e6:f59e:226f with SMTP id
 38308e7fff4ca-2e95b0bce90mr19539971fa.5.1716575279453; 
 Fri, 24 May 2024 11:27:59 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 38308e7fff4ca-2e95be01800sm348091fa.53.2024.05.24.11.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:59 -0700 (PDT)
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
Subject: [PATCH 14/18] mmc: bcm2835: Use phys addresses for slave DMA config
Date: Fri, 24 May 2024 19:26:58 +0100
Message-Id: <20240524182702.1317935-15-dave.stevenson@raspberrypi.com>
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
 drivers/mmc/host/bcm2835.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 35d8fdea668b..746a60fac0f0 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -38,7 +38,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
@@ -1347,8 +1346,8 @@ static int bcm2835_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct clk *clk;
 	struct bcm2835_host *host;
+	struct resource *iomem;
 	struct mmc_host *mmc;
-	const __be32 *regaddr_p;
 	int ret;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -1361,23 +1360,13 @@ static int bcm2835_probe(struct platform_device *pdev)
 	host->pdev = pdev;
 	spin_lock_init(&host->lock);
 
-	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	host->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &iomem);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
 	}
 
-	/* Parse OF address directly to get the physical address for
-	 * DMA to our registers.
-	 */
-	regaddr_p = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!regaddr_p) {
-		dev_err(dev, "Can't get phys address\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	host->phys_addr = be32_to_cpup(regaddr_p);
+	host->phys_addr = iomem->start;
 
 	host->dma_chan = NULL;
 	host->dma_desc = NULL;
-- 
2.34.1

