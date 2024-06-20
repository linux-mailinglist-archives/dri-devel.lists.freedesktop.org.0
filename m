Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A3B910A88
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38710EAB8;
	Thu, 20 Jun 2024 15:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GIxYXVyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272A210EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:13 +0000 (UTC)
Received: by mail-wm1-f99.google.com with SMTP id
 5b1f17b1804b1-42121d27861so10626855e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898431; x=1719503231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7urb17iy0Oa1QIy7z8g2YF2+t4Is90IdqFJjMBXqckw=;
 b=GIxYXVyok7x39brmzlGpFswYqFhIsQ3C9H2P+yjt9ZkrG+CNNMiUz50lr8LuVXXVR8
 qSBf51A4YWbHayR0sZNHtSBRxs+zkKrq710RJLmtgXIgVZdQ1EshL3VFpVcTvH1I+PNy
 Al3vh7dhDmYyjFDNV8sTWPmYyFlBAWzCY1IPXqlMKcKraudU9eCes0XFBOSt+uMMO/J0
 Byb/Ahx9yRBf5nYeMjjU3qjvr7xSvZe+mNLz7hAHlrqPfBJt2J5BSVsBp8ldCzmOJYaQ
 FRud+s8GB5/UBDPIFRhzloHdU/9hVdcHNY/LQStztBevnN3i7ycIocBqYbWu5hI1/Ti8
 z4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898431; x=1719503231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7urb17iy0Oa1QIy7z8g2YF2+t4Is90IdqFJjMBXqckw=;
 b=KtkY8hWBBIJQUkxV6lHSH+dxW/jdUlcXsUu9bY8BVdpLEhjbrdONV+a/e4CziHms3e
 IAZbbsP+T4GXX59YIoSTqUXlFLkMyHLtunfO9qYu6OrMJcCp4SUCMsXK+/RTa048Cg2s
 jsglfuWWN8P4c8XbH1up9JA6xR9U6+4ycmwV5ciTUyWv7d84wP9sRCEs5IxqaDbPCz/V
 MQwhVzbhuQswnlcTRwjC/Vr3bGutg0eACfFN/bASrPnFcM4BV63zxr6m9nUiIMqFtrg7
 C5PZtDyuBCScKxLrl2sP1kN4RIFf4Abwqx+Kzk+LmISFVGF93cNqvxSwQF+xT3JlZg51
 9B0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2snvBWC28AF6u+qiVP7EmFexvPj0j1o7XVbvDiK0FZRNgEzhqhMjxbM0Hm+RRhYfSaGVaxGaUJxb99yNW3gyhJskIQtC054mV6g1jngHj
X-Gm-Message-State: AOJu0Ywp86/IMSKSFXzmetVtzAhQYBbEHDQd/fxSNxg5tKOYfb6crwpp
 w+yN/V/SawvpF+2ulJRT07hcfNiVJQpMkxohWRS2WJvuCMz+0o6/pI2rxZS4IPoyVeUbada9G29
 CfVmrcbMeEAd0/eA8Y7ZRWC3xAj2jN/U/
X-Google-Smtp-Source: AGHT+IFba/60VscSC0yytJpABpzs1R/VPgpMBgS2wngpqqCc5j9vgFwVo0CpLl1z0ItN6Vb1Bq5A5JhsA2Ob
X-Received: by 2002:a05:600c:4f16:b0:418:c2af:ab83 with SMTP id
 5b1f17b1804b1-4247529a9b6mr45706585e9.36.1718898431661; 
 Thu, 20 Jun 2024 08:47:11 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d208dc3sm3211975e9.40.2024.06.20.08.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:11 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 24/31] drm/vc4: hvs: Create hw_init function
Date: Thu, 20 Jun 2024 16:46:25 +0100
Message-Id: <20240620154632.4125308-25-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

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

