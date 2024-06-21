Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08791296F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07DC10F1FB;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UWVLzYC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f97.google.com (mail-lf1-f97.google.com
 [209.85.167.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55410F1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:45 +0000 (UTC)
Received: by mail-lf1-f97.google.com with SMTP id
 2adb3069b0e04-52cc14815c3so2258834e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983304; x=1719588104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kAJq4qACJOVIJfamZlTaAKKGGa9lEThOQv0X5bpQKU=;
 b=UWVLzYC0HWwoXV6ZGzFNZnuAP1ZrQ49aQeeWh5a4QGmm7oaPyNVsQPSeQbdDN0XzHo
 B2B4H4Me9RKuMr7fidJh0ZpXQfpEyjPxa9rPwt9gCPu1RBalF1Ww32bx/jI2wA5nDGiz
 1JROD0ATVHqtx4PVazAWohqXXxATqUXoXJqbxSnVvzwe0ffV/sgm6KAZMH6qNSlLcbAM
 owP66MVROSlJ249XZe4dZy8GZMDp6fWMHhPt0h9ikKQkNKaswpju03RPFjDBSeQef36z
 7e8k15jH6yUCWtkvSrC7zGMf8AO9W1nWw2hFBQvC2rHNPdW6JszORLMNCgKzndNKFs/A
 o6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983304; x=1719588104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kAJq4qACJOVIJfamZlTaAKKGGa9lEThOQv0X5bpQKU=;
 b=H/s26AukWWbYK5RZYO0L6Cx3GzwOxnxTh3Ns5PgC9J/GEYFr47lghvZVm6Pn3Zeyzg
 rMqDrPDOJDZkYg+NJ7hDOm0gZWbi7z7zRrvMNMjT7y9f9u+0LIKaSHJprN189p3ylfWs
 lblA+J6gilZmEeCPvmEYBIvym5op3QICjZQV4o4ZjiwcoFDgGzPAl3rQSZ9ZnVMJeYJN
 EUUXBQUcxPx/1BlXp5dIezfKU9qNaiGo4T1ozjpcok2yfbiVs1nvaGBDo5cjikz9N+zJ
 d/Cd+Isb93VC71guCgFSpgK86fMbz/BA2U+mEIlLg3siPRQ1byKgpmSEANa7YrgvdLEZ
 p9Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsJ6SBYpDnMOYUNqhppKqchycTlbP4mKlu1yYA3ZTPTRxqn8PrS+3xxzwAoOdtxvxkA4KasyAvoP5jBSe5OfN4DtGn4J2rTOBujasFphYS
X-Gm-Message-State: AOJu0YxseV2Zf1pVIVcLJjd47qKcTXStEvwb8sN37+JaK4KmYYfolOUq
 tcew+uT+xOTvts+hjZEeO73qxtEYBMP0XcN4NbU2LwIHEj4GdFQygrlDWVHRQwyqYPD3BHKFYoY
 duUnifBXAKJsDn3jA0i5RFtNbYbAbmht9
X-Google-Smtp-Source: AGHT+IHhVTMyVyuYoCPTKPDMoauWlcQGR+GFymaYcUaS+7LsBbNJ1aKI61ZYD4bmFYLj26A5vA/3XjHiVLoX
X-Received: by 2002:ac2:523a:0:b0:52b:c23f:9451 with SMTP id
 2adb3069b0e04-52ccaa373damr4484365e87.38.1718983304124; 
 Fri, 21 Jun 2024 08:21:44 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d0c395asm4858635e9.28.2024.06.21.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:44 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 24/31] drm/vc4: hvs: Create cob_init function
Date: Fri, 21 Jun 2024 16:20:48 +0100
Message-Id: <20240621152055.4180873-25-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

Just like the HVS itself, the COB parameters will be fairly different in
the BCM2712.

Let's move the COB parameters computation and its initialisation to a
separate function that will be easier to extend in the future.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 128 ++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index bab15827fce0..bd9ae25dbdcf 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -940,6 +940,77 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 	return 0;
 }
 
+static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+	u32 reg, top;
+
+	/*
+	 * Recompute Composite Output Buffer (COB) allocations for the
+	 * displays
+	 */
+	switch (vc4->gen) {
+	case VC4_GEN_4:
+		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
+		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
+		 * TXP composing RGBA to memory), whilst the remainder are only
+		 * 24bpp RGB.
+		 *
+		 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
+		 * channel 0.
+		 */
+		#define VC4_COB_SIZE		20736
+		#define VC4_COB_LINE_WIDTH	2048
+		#define VC4_COB_NUM_LINES	3
+		reg = 0;
+		top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		reg = top;
+		top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		reg = top;
+		top = VC4_COB_SIZE;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+		break;
+
+	case VC4_GEN_5:
+		/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
+		 * The bottom 4096 pixels are full RGBA (intended for the TXP
+		 * composing RGBA to memory), whilst the remainder are only
+		 * RGB. Addressing is always pixel wide.
+		 *
+		 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
+		 * lines. to channel 0.
+		 */
+		#define VC5_COB_SIZE		44416
+		#define VC5_COB_LINE_WIDTH	4096
+		#define VC5_COB_NUM_LINES	3
+		reg = 0;
+		top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		top += 16;
+		reg = top;
+		top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		top += 16;
+		reg = top;
+		top = VC5_COB_SIZE;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -947,7 +1018,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = NULL;
 	int ret;
-	u32 reg, top;
 
 	hvs = __vc4_hvs_alloc(vc4, NULL);
 	if (IS_ERR(hvs))
@@ -1017,59 +1087,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	/* Recompute Composite Output Buffer (COB) allocations for the displays
-	 */
-	if (vc4->gen == VC4_GEN_4) {
-		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
-		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
-		 * TXP composing RGBA to memory), whilst the remainder are only
-		 * 24bpp RGB.
-		 *
-		 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
-		 * channel 0.
-		 */
-		#define VC4_COB_SIZE		20736
-		#define VC4_COB_LINE_WIDTH	2048
-		#define VC4_COB_NUM_LINES	3
-		reg = 0;
-		top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE2, reg);
-		reg = top;
-		top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE1, reg);
-		reg = top;
-		top = VC4_COB_SIZE;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE0, reg);
-	} else {
-		/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
-		 * The bottom 4096 pixels are full RGBA (intended for the TXP
-		 * composing RGBA to memory), whilst the remainder are only
-		 * RGB. Addressing is always pixel wide.
-		 *
-		 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
-		 * lines. to channel 0.
-		 */
-		#define VC5_COB_SIZE		44416
-		#define VC5_COB_LINE_WIDTH	4096
-		#define VC5_COB_NUM_LINES	3
-		reg = 0;
-		top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE2, reg);
-		top += 16;
-		reg = top;
-		top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE1, reg);
-		top += 16;
-		reg = top;
-		top = VC5_COB_SIZE;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE0, reg);
-	}
+	ret = vc4_hvs_cob_init(hvs);
+	if (ret)
+		return ret;
 
 	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
 			       vc4_hvs_irq_handler, 0, "vc4 hvs", drm);
-- 
2.34.1

