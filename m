Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146D8CE987
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E096310F0BE;
	Fri, 24 May 2024 18:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ny3t9lcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A40B10ED95
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:02 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-420180b5922so41045195e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575281; x=1717180081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0fkVyk6q1d4tTjNi28+nVqK2ri87Lnbs7bXh9cTiug=;
 b=Ny3t9lcs1P0p+hYSQfKlbHJHrAWh5rFL3uj/Mt/JDbScZGQJEXtsX/qqiFIr6H0yS/
 ylPff6J0nWerHAnKuokRDmr4t3/aaei8jUZngWxo5l2nJNjbXHy/TzpiOyop0rkpl/QP
 gPVdiGcxxD7icatVTgAdKM2+PSKxBSWYxyFa2dOO3D9GQJilalBJUnBh7YEUFcrjKrrE
 tZ4paXaXhYVWPXj9sTXjXlIOetdq0EANLAWD5DFXYpgCC675k69GZfaQZPBf+aPDnbK4
 pyb/s4G5SGajmSwEfuV6sRQ0knAhgTXo+zEzA06mlr/y1KxUDVmHREqJqa/rZR/1TJ/c
 GNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575281; x=1717180081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0fkVyk6q1d4tTjNi28+nVqK2ri87Lnbs7bXh9cTiug=;
 b=hF+CdG0+Lgdnn8EfXA/jXtEgHL8sck4zmyYG2NoUsxVVVsRCebMXXrs0N+8GlDVLsv
 zgFbRgZsTfB5JWbZUq05lS0VKs/W6EA1TL5NXS0q3G1JqLCMNfbyZ+efW84nvilztwEm
 EHnEW39/PgxCSDLvA9umaM5FimCGhdOJYF6vzlcMMJC3LG3dlsmZApNx/RX6zGfzGRCf
 j7FAmWh3f25Gzal4QLQvQBuu/AR7I3xnJi4Gz+uhAPtMH2r5v3n3t+ozLJkKSD4za0oU
 4lLNvZ7jZNv93yaaw9tmT/J3mmDvSO9rMixqV8Zlcya5a1gqQDjw6D9xW+uDAgq18AXq
 sC3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJOpgmc9YsJgYfwvxM2BfNfL+zGnRnUXLqtE7z5qWCdptMCH0MG10L//4R+PW6A9j3yMiRnxlp4yrpriVWiHc2Yk0WtFTCIUMZmmqRHIrB
X-Gm-Message-State: AOJu0YzKb9k02kkI3E3ge92qZ36wxHnbxd3m3V0N8sUpEpWDU/RNeRNH
 PemQmEbZ9LauNRBuEuaqsSUuiu9Ev6y9LGKjgnaso479laBdK62nyKNHGf/ODlNaGyuHR9dRAtD
 JYM/EqGZvnTN8MOdOUqgsPYxHxtUWTu3w
X-Google-Smtp-Source: AGHT+IGBxnWkfl21ZWcAGGbY9pK5CCtvRZEInE2s9wbG2L53cMYgxcodxHXuIlPQ/f02qRVKa1ge9AFPlvFh
X-Received: by 2002:a05:600c:3152:b0:421:757:4d3e with SMTP id
 5b1f17b1804b1-42108a40f7emr33721035e9.16.1716575280608; 
 Fri, 24 May 2024 11:28:00 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-42100fb1394sm5457725e9.43.2024.05.24.11.28.00
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
Subject: [PATCH 16/18] drm/vc4: Use phys addresses for slave DMA config
Date: Fri, 24 May 2024 19:27:00 +0100
Message-Id: <20240524182702.1317935-17-dave.stevenson@raspberrypi.com>
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

Slave addresses for DMA are meant to be supplied as physical addresses
(contrary to what struct snd_dmaengine_dai_dma_data does).

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d30f8e8e8967..c2afd72bd96e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2696,7 +2696,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	struct platform_device *codec_pdev;
-	const __be32 *addr;
+	struct resource *iomem;
 	int index, len;
 	int ret;
 
@@ -2732,22 +2732,15 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 
 	/*
-	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
-	 * the bus address specified in the DT, because the physical address
-	 * (the one returned by platform_get_resource()) is not appropriate
-	 * for DMA transfers.
-	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
+	 * Get the physical address of VC4_HD_MAI_DATA.
 	 */
 	index = of_property_match_string(dev->of_node, "reg-names", "hd");
 	/* Before BCM2711, we don't have a named register range */
 	if (index < 0)
 		index = 1;
+	iomem = platform_get_resource(vc4_hdmi->pdev, IORESOURCE_MEM, index);
 
-	addr = of_get_address(dev->of_node, index, NULL, NULL);
-	if (!addr)
-		return -EINVAL;
-
-	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
+	vc4_hdmi->audio.dma_data.addr = iomem->start + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
 
-- 
2.34.1

