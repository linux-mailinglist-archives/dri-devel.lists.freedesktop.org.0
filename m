Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BC8CE989
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0110F280;
	Fri, 24 May 2024 18:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BQA4ceN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D510EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:54 +0000 (UTC)
Received: by mail-wm1-f98.google.com with SMTP id
 5b1f17b1804b1-4202cea9a2fso33252925e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575272; x=1717180072;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmjLsXIH2Amncxc11ehW4fWxMk13TiDZ+O44YXe6Wgk=;
 b=BQA4ceN9EV+yh0jW68pFICPVUSLA964CcWcEb+lakOvo61hgO0XIaoY0DkZpfFW1nc
 pR0APpTXFm2cLROXhKTOx+eMWFZLT2T/lczqYG/mKV61qna6yN4203ytGYtw5y3BZVhX
 ZZoEkAaAPsbQm1BTKGHBJHCxasYTyaVvTpvBOX06VOmREqI6hI2ILTPzKM3jZZb5x4Qj
 EuADtA4CWDkSVGnEYiCGxCzHkbH1+2DvrGn75aT7oJvvJxCuwVxe3ij+RDaEyVFv90eU
 YEzgtloNPYHn42wVp8sXLxT3/S7E5VEV3KNgJKMij0HyVrVTe3MfSaJKUKC+ZZDR2AHO
 WOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575272; x=1717180072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmjLsXIH2Amncxc11ehW4fWxMk13TiDZ+O44YXe6Wgk=;
 b=e8wStCO7leWAkPedSkT6WcFZGvitT1Ot4mZs8u8rRsrwvotXofluQGPoNdKQ6Yyhcj
 cOaP7vcJ1AbK4PdKFK+wfaqAvFgTf6aVlcw6MhJfslWDI+hraeiDSpBDWz0dK1w+q59K
 Ode56FDNhODHiTeEbhAI1NT49GmvLzW2b+zsk6CdWJBLTcpVTgat1ZYKC7kNQFhC8XpG
 M46j3HRIFepchPR8v3IjFWOzcSQqiU6gt17Z2q/9nwOPi28zk17MjwJ4H7Q4a23FqOWc
 DHmK7NrRCjndNv+FWSTNo1gg/B+H/dGxW7vxbmtwv3Sif+jNbmhldyVNN8ldbtU6rLTv
 jR1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbtsPruE4ylLm3wEPegVV+4GcIviimrJBmdIg0pXzqWU64sS5O7wHAj4fJjVjYzuRNpVtg1Yi8z6ZeAiRE7GMD3hFn9nsIA+tBxHD4RfIe
X-Gm-Message-State: AOJu0YxSpeV67uMzLkcBVUz8wVwWwyAqj9nVJ+wzhty7iGPyJ8DsLROf
 E1Ze5uIRaGFXndOQERC/4JrVirgLOKvXhXM9BY952mBVHjVH2ia6+zohLgmgDW90+kH7Gh98LSS
 PtGWweaoG8XRr35Y1fYuztdMELH0XYJN3
X-Google-Smtp-Source: AGHT+IGfOa5XBgeYIs/cH5TAMCHbRBfIruDizHffdZ+UPyoZ3jK796PR+KziATsAgtd+BnPEgr+Se5nRlYpt
X-Received: by 2002:a05:600c:3114:b0:420:2cbe:7ee8 with SMTP id
 5b1f17b1804b1-421089f1394mr28435685e9.6.1716575272442; 
 Fri, 24 May 2024 11:27:52 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3557a1cd354sm56646f8f.101.2024.05.24.11.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:52 -0700 (PDT)
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
Subject: [PATCH 02/18] dmaengine: bcm2835: Support common dma-channel-mask
Date: Fri, 24 May 2024 19:26:46 +0100
Message-Id: <20240524182702.1317935-3-dave.stevenson@raspberrypi.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 9d74fe97452e..528c4593b45a 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -941,12 +941,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-			"brcm,dma-channel-mask",
-			&chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev, "brcm,dma-channel-mask deprecated - please update DT\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.34.1

