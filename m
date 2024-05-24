Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E458CE9AB
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E192C10F58B;
	Fri, 24 May 2024 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HswgHvx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E90210F0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:28:00 +0000 (UTC)
Received: by mail-wr1-f98.google.com with SMTP id
 ffacd0b85a97d-351da5838fcso7218240f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575278; x=1717180078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/tSxq6GA4AT2Mm+nWQe3L0M6c7/C4J7O/BV4BAy6ic=;
 b=HswgHvx2j+DruYa4SYyL6u3gyH5gjr/Mf8GNtLMcGxQCxBZ9MfOhPucy2UDwv+doYB
 rUbTyHIt3eTGVGkk7QBK9Xy3/6zqWdb3YgkoiLcwzofrrO6R3r1Y4MYbwdDKSKpKFAx0
 RVVYRjUI1PGE0Cmu0dic4pCP34emqnG5O7Aj5Zvv+Denw36aLuohpH2qitHItZZ5ZHTT
 puiZMLeoUQfJvi6sefzCtPyA6STYt/iu5sXFoYPL3jJijb6hci2u63na7BItAKEdodWe
 zDyGSAtd05s0fyjMe6gDYt20ZZr3zDoUN9PpuKurrs0IBceumqUuoz62z0Xi5TmajuZF
 ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575278; x=1717180078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/tSxq6GA4AT2Mm+nWQe3L0M6c7/C4J7O/BV4BAy6ic=;
 b=nYSXgsU2Z6URyXvCOCkNj7cVkOIrk54IITIda0/ZDYiTC1x6c6FVe4o/nXeFkSZ0gf
 Q1NjzEvxM7I5rxnzbj0a5A0efNT1VyXclbclLEkc70k8eBJPn94ZJpX7tv/gtvmjivGp
 W7q7q6o5DUPb91CRxUr1ll61qQafsLZJq9ytFkygjbZmEMouQIj/RUDYpEOyrkAd++Q9
 qZugqaKTObAZeVGtFuehtPmwJ6PX05Diz+EDmSwnBJ6yqgaH2ZVcODpa/kv+RIwa+siP
 ShtoeVWogXszTj6sSCrnw9eLs/5kleiUBYTBeEXrz3EOsdVQS7v9yZW0NkKV8fIan/NO
 9/Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNeTVXmiQ5WRsNR/1xZ134/L9zf7wqJOudWkqpUE4PIMDAO9kpmAKtdq6WY0SbtyDSgXhbt75a1mMkpHEIGjo9pw/9mEhGI79/aa1viuX
X-Gm-Message-State: AOJu0YwyKYUx5nw2xg0yP0abIWGQvnaBqCmpAh4H3lL0nPu6IbcrSKAi
 76966t5xQ6X/v+7Qzcgw5ZWjqHKzIbnmXgYIozJCvZ3sNwx2brqqZgKwlaoImUoIfbbcSYTMSIs
 aE0j2AfJkpryBxYMXO3iKdV7Ekh78jw9t
X-Google-Smtp-Source: AGHT+IGz+W6dkdCIXw0ZDp1B/MgrtzNbyRrO8ywWOE/qPAQsbvGxItyKlknvWBy72WuD1SEAMZ/Y6JavBjaB
X-Received: by 2002:a05:6000:4597:b0:354:e775:19fd with SMTP id
 ffacd0b85a97d-355221819d2mr1987214f8f.26.1716575278649; 
 Fri, 24 May 2024 11:27:58 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3557a1c67f0sm61533f8f.70.2024.05.24.11.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:58 -0700 (PDT)
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
Subject: [PATCH 13/18] arm: dt: Add dma-ranges to the bcm283x platforms
Date: Fri, 24 May 2024 19:26:57 +0100
Message-Id: <20240524182702.1317935-14-dave.stevenson@raspberrypi.com>
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

In order to use the dma_map_resource for mappings, add the
dma-ranges to the relevant DT files.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 12 ++++++++++--
 arch/arm/boot/dts/broadcom/bcm2835.dtsi |  3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi |  3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi |  3 ++-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index d64bf098b697..d6f32d32b456 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -42,7 +42,8 @@ soc {
 			 <0x7c000000  0x0 0xfc000000  0x02000000>,
 			 <0x40000000  0x0 0xff800000  0x00800000>;
 		/* Emulate a contiguous 30-bit address range for DMA */
-		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
+		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>,
+			     <0x7c000000  0x0 0xfc000000  0x03800000>;
 
 		/*
 		 * This node is the provider for the enable-method for
@@ -550,7 +551,14 @@ scb {
 		#size-cells = <1>;
 
 		ranges = <0x0 0x7c000000  0x0 0xfc000000  0x03800000>,
-			 <0x6 0x00000000  0x6 0x00000000  0x40000000>;
+			 <0x0 0x40000000  0x0 0xff800000  0x00800000>,
+			 <0x6 0x00000000  0x6 0x00000000  0x40000000>,
+			 <0x0 0x00000000  0x0 0x00000000  0xfc000000>;
+		dma-ranges = <0x4 0x7c000000  0x0 0xfc000000  0x03800000>,
+			     <0x0 0x00000000  0x0 0x00000000  0x80000000>,
+			     <0x0 0x80000000  0x0 0x80000000  0x80000000>,
+			     <0x1 0x00000000  0x1 0x00000000  0x80000000>,
+			     <0x1 0x80000000  0x1 0x80000000  0x80000000>;
 
 		pcie0: pcie@7d500000 {
 			compatible = "brcm,bcm2711-pcie";
diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..480e12fd8a17 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x80000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index 84c08b46519d..d034d6a8caad 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: local_intc@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.34.1

