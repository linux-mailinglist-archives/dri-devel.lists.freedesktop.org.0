Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B488CE978
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C883810EB19;
	Fri, 24 May 2024 18:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CdPhT4Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AD710EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:54 +0000 (UTC)
Received: by mail-wm1-f99.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so64599175e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575273; x=1717180073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MV7QZf2fhH+OEhBA38QGxT92fUaASU1Nxo1nxUSVd8=;
 b=CdPhT4ZbM5DMuzFOis1zxODSDNf7vUYM0vkFtE1srqNQaxYugtZGivb04my7Cgp9d5
 lh82ViJ7QeE8W85u7Z5fLU8hDtPnM61xjW18zC+yVAkxdG+Jnn192eyxj9jrJRhPbD5d
 Jjxe9mSBwKJ+4/qit22wLiK1PEnlySoEU1kdr4lQE3/UHARKgt+vfdOhuDko603fz7nG
 yZAGxtAjxb0BMzClbgtZZNuyzg+dtYe42+T1yaBeneIHQ0E9SQJzSboqHCzdchrCh/iF
 pwgy46qwi3LYAeCcUsdFB/iwheY4TJoOVCX4nbjJ1AcC0QpWZEzlhEg+uVyJbkHKEm39
 2r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575273; x=1717180073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MV7QZf2fhH+OEhBA38QGxT92fUaASU1Nxo1nxUSVd8=;
 b=Hno7YaTPvCgrFTkuLcb4O6BVFdQwnqgzCg+P5U74+RyzbjgqqvatIu0Km1901wN/6t
 TZqSyySbpx5b4Sal85bVYe6deoCGQtLQG6/GJEUG/VCbW13cOrH4F9QsG2/IFiWlWY27
 3PgKDiCET/IT/T0V3D2YJfX1tiNlP5hC47gIHXOb3Ku5V3/83deFRZHuNydDHhNFQBFC
 kpC/tHx7UkwAEX9nwbmtjC0CDxDcRU8RagbpZKyW2CXpwT/zlLyLsm2Z/QzECUaW0siE
 ZBSlb/GqWcMESu/Q7x6YagAhoigyoFTc6VTu6Uyw04BT6EGfIAvZrPZVdk1PYLOWD32S
 WW9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpyaKlMlQXlqMmGoyHOSiK7S2kqwr2S0nIaQfMwzGX0JN2F75ePYov0ulYEO9gxYnxDirNK7xvGIeOxtSquiOC0G1uXUun+lVdj5LCqmX
X-Gm-Message-State: AOJu0YxIwizEZ9PFukEluvbtP/9jJ8IlrXCJ8kASB2e6OKuZXiqjwzbE
 toRLrd8zIRq03KgKgRkh6rYDyYAI/5TAM+NoJO5lT6MLIoZnEAiAecDDZ+XUDA+QJrigLfDl0Dy
 +CPVfPQ65U4T4HPjuZMKSibQYZaFPXRzH
X-Google-Smtp-Source: AGHT+IHWZ0JTRBQwe/XochchvTJaAoc7r7/ijNNUJ35CDCjZA7ALjlPQSMAk7tENe+DW/f85sGYNAcbTrrfr
X-Received: by 2002:a05:600c:5799:b0:41b:f2ca:19cc with SMTP id
 5b1f17b1804b1-421089f93b7mr26088945e9.34.1716575272958; 
 Fri, 24 May 2024 11:27:52 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4210891c6edsm1217615e9.20.2024.05.24.11.27.52
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 03/18] ARM: dts: bcm283x: Update to use dma-channel-mask
Date: Fri, 24 May 2024 19:26:47 +0100
Message-Id: <20240524182702.1317935-4-dave.stevenson@raspberrypi.com>
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

Now the driver looks for the common dma-channel-mask property
rather than the vendor-specific brcm,dma-channel-mask, update
the dt files to follow suit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi        | 2 +-
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..d64bf098b697 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -103,7 +103,7 @@ dma: dma-controller@7e007000 {
 					  "dma9",
 					  "dma10";
 			#dma-cells = <1>;
-			brcm,dma-channel-mask = <0x07f5>;
+			dma-channel-mask = <0x07f5>;
 		};
 
 		pm: watchdog@7e100000 {
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 9261b67dbee1..3ba8db8eed0f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -46,7 +46,7 @@ dma: dma-controller@7e007000 {
 					  "dma14",
 					  "dma-shared-all";
 			#dma-cells = <1>;
-			brcm,dma-channel-mask = <0x7f35>;
+			dma-channel-mask = <0x7f35>;
 		};
 
 		intc: interrupt-controller@7e00b200 {
-- 
2.34.1

