Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB2912978
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2B810F205;
	Fri, 21 Jun 2024 15:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZSvo+n2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4A810F1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:45 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso277046366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983303; x=1719588103;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGLj3AsGmlydEy4YHf5JImYg2rKZhROHzRyN2A3SaRw=;
 b=ZSvo+n2vkxkiQjLBAwf//IPDZG2YJ3G8YMIafPNsKtK1LtjBnRyu/vjM/rilU2StBl
 BV06qHImhaS6fiX1JmkNHzV1zgyul0P7aBWZu+nEf3wHMXFsDLNpJbL54pbJMmQUTsRN
 JwRmbqbiecLCX6+q6mS3LU8suwIQKxA0Aqpk7C/mGASj2NCHkP/kVXM5O9LBh+7qTjAk
 7q96vyuEiHJrOzYoRDpdNE8pHhg8L9QjSGpsoQFwSzyHV+FPeLHe0OjP4alu+CiXLimg
 fdcWIFl/+k/aGpYrTWmnHw4zvnHJFPl91YiG7ZaGP/aX3ssTCki+rBGTbdoDhyWTGGMg
 u2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983303; x=1719588103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGLj3AsGmlydEy4YHf5JImYg2rKZhROHzRyN2A3SaRw=;
 b=tQyUjjdlFsPVi5aKWZcbLAJ8+PYQmcFpH4kOsS8GCG3Huzb7X2qktvzlO4xxRuOOAm
 BLX6zJj+uXJjHohQjno1gnENqhLa00vGmBfqn5uY1E8Q149ahSpNrO959B4thn21kycM
 Vunsk1ttC6jAASBloluRVOIlwJXc25vbey/RRcMxJkJcEkKOXLFJ6SbD0uiPS7192MQV
 w3x0VKEWOZxQ5A/fp/VUmpUypFcJ+8D4Qx24lSTYOF8kd+F8VTW04G02z5dspaiR0+le
 yltKFrtlfW9YD+qNMZHiroW1q05GWjaLytrdP62SWwDG2GwXdZ09+jTdM0LQEAs1X9eS
 u23g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6RNiOT7mI9a+NRFtBaDQ9e4PX3ALDcJ/tn8SpG+SzIxoGLuCBmYa8BbHS2lWjk7Hv6LjtH8bwVWjnNlCRnti3Y21MmfoLFhfw/WMOJTbg
X-Gm-Message-State: AOJu0YzhV18YaDQOIrlAzuXwAeUdg2HpqkeWSzX0WgxjJFIz8L76kgRG
 HYmK3TE2hqzKzofLy5FqmBTMt5J50kqen/+xDGzX2j/9/O7yfYgxOxdBUdW9wSX2coyVr0srUnZ
 J/c/wc2QB6Fbtll/gMCmu5rIOW6qQEy5U
X-Google-Smtp-Source: AGHT+IH1lvq/RbYWpy3fdhTX2QEbFbCzcTGLZN0uDNDcDmG+chb++VIJoSVg/j6R5E5O8rcj+2ekBATPOO5M
X-Received: by 2002:a17:906:bf45:b0:a6f:b428:30f9 with SMTP id
 a640c23a62f3a-a6fb4283151mr554701966b.50.1718983303705; 
 Fri, 21 Jun 2024 08:21:43 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf56ea35sm5263166b.248.2024.06.21.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:43 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 23/31] drm/vc4: hvs: Create hw_init function
Date: Fri, 21 Jun 2024 16:20:47 +0100
Message-Id: <20240621152055.4180873-24-dave.stevenson@raspberrypi.com>
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

Since the BCM2712 will feature a significantly different HVS, let's move
the hardware initialisation part of our bind function into a separate
function.

That way, it will be easier to extend in the future.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 155 ++++++++++++++++++----------------
 1 file changed, 83 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 922e5f73f5d9..bab15827fce0 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -852,79 +852,10 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 	return hvs;
 }
 
-static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	struct vc4_hvs *hvs = NULL;
-	int ret;
-	u32 dispctrl;
-	u32 reg, top;
-
-	hvs = __vc4_hvs_alloc(vc4, NULL);
-	if (IS_ERR(hvs))
-		return PTR_ERR(hvs);
-
-	hvs->regs = vc4_ioremap_regs(pdev, 0);
-	if (IS_ERR(hvs->regs))
-		return PTR_ERR(hvs->regs);
-
-	hvs->regset.base = hvs->regs;
-	hvs->regset.regs = hvs_regs;
-	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
-
-	if (vc4->gen == VC4_GEN_5) {
-		struct rpi_firmware *firmware;
-		struct device_node *node;
-		unsigned int max_rate;
-
-		node = rpi_firmware_find_node();
-		if (!node)
-			return -EINVAL;
-
-		firmware = rpi_firmware_get(node);
-		of_node_put(node);
-		if (!firmware)
-			return -EPROBE_DEFER;
-
-		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(hvs->core_clk)) {
-			dev_err(&pdev->dev, "Couldn't get core clock\n");
-			return PTR_ERR(hvs->core_clk);
-		}
-
-		max_rate = rpi_firmware_clk_get_max_rate(firmware,
-							 RPI_FIRMWARE_CORE_CLK_ID);
-		rpi_firmware_put(firmware);
-		if (max_rate >= 550000000)
-			hvs->vc5_hdmi_enable_hdmi_20 = true;
-
-		if (max_rate >= 600000000)
-			hvs->vc5_hdmi_enable_4096by2160 = true;
-
-		hvs->max_core_rate = max_rate;
-
-		ret = clk_prepare_enable(hvs->core_clk);
-		if (ret) {
-			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
-			return ret;
-		}
-	}
-
-	if (vc4->gen == VC4_GEN_4)
-		hvs->dlist = hvs->regs + SCALER_DLIST_START;
-	else
-		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
-
-	/* Upload filter kernels.  We only have the one for now, so we
-	 * keep it around for the lifetime of the driver.
-	 */
-	ret = vc4_hvs_upload_linear_kernel(hvs,
-					   &hvs->mitchell_netravali_filter,
-					   mitchell_netravali_1_3_1_3_kernel);
-	if (ret)
-		return ret;
+	struct vc4_dev *vc4 = hvs->vc4;
+	u32 dispctrl, reg;
 
 	reg = HVS_READ(SCALER_DISPECTRL);
 	reg &= ~SCALER_DISPECTRL_DSP2_MUX_MASK;
@@ -1006,6 +937,86 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
+	return 0;
+}
+
+static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = NULL;
+	int ret;
+	u32 reg, top;
+
+	hvs = __vc4_hvs_alloc(vc4, NULL);
+	if (IS_ERR(hvs))
+		return PTR_ERR(hvs);
+
+	hvs->regs = vc4_ioremap_regs(pdev, 0);
+	if (IS_ERR(hvs->regs))
+		return PTR_ERR(hvs->regs);
+
+	hvs->regset.base = hvs->regs;
+	hvs->regset.regs = hvs_regs;
+	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
+
+	if (vc4->gen == VC4_GEN_5) {
+		struct rpi_firmware *firmware;
+		struct device_node *node;
+		unsigned int max_rate;
+
+		node = rpi_firmware_find_node();
+		if (!node)
+			return -EINVAL;
+
+		firmware = rpi_firmware_get(node);
+		of_node_put(node);
+		if (!firmware)
+			return -EPROBE_DEFER;
+
+		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(hvs->core_clk)) {
+			dev_err(&pdev->dev, "Couldn't get core clock\n");
+			return PTR_ERR(hvs->core_clk);
+		}
+
+		max_rate = rpi_firmware_clk_get_max_rate(firmware,
+							 RPI_FIRMWARE_CORE_CLK_ID);
+		rpi_firmware_put(firmware);
+		if (max_rate >= 550000000)
+			hvs->vc5_hdmi_enable_hdmi_20 = true;
+
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
+		hvs->max_core_rate = max_rate;
+
+		ret = clk_prepare_enable(hvs->core_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
+			return ret;
+		}
+	}
+
+	if (vc4->gen == VC4_GEN_4)
+		hvs->dlist = hvs->regs + SCALER_DLIST_START;
+	else
+		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
+
+	/* Upload filter kernels.  We only have the one for now, so we
+	 * keep it around for the lifetime of the driver.
+	 */
+	ret = vc4_hvs_upload_linear_kernel(hvs,
+					   &hvs->mitchell_netravali_filter,
+					   mitchell_netravali_1_3_1_3_kernel);
+	if (ret)
+		return ret;
+
+	ret = vc4_hvs_hw_init(hvs);
+	if (ret)
+		return ret;
+
 	/* Recompute Composite Output Buffer (COB) allocations for the displays
 	 */
 	if (vc4->gen == VC4_GEN_4) {
-- 
2.34.1

