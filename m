Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A815314E955
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD726FA97;
	Fri, 31 Jan 2020 08:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456E36E593;
 Thu, 30 Jan 2020 08:32:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s10so2772281wmh.3;
 Thu, 30 Jan 2020 00:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32jvXD3cPexjv7JnSZTYWkfatpOgTafU8/6QQULQx+A=;
 b=XBTKrOZ3+lsyQ0B9uHU5EQoZWWT0yGbb63eZQVB44AjWECJleM0IeLRkv6333At0Pc
 FILjFOewaZ3lK3MGhVUItG1nwO/MxMj3AWa62bCJbZqziF6tfQpVfcK2fiw1pqJW5E4j
 Bsmp4jjcLqaY51OaCdfFz2DVozQ+cNO9FWhtjaK0cqWjYzOA3z35c7e0FO9dVK/Uv/ii
 dKQYjCBQ36MwJ9b3VQvtAwJkKXhxLfS0q+ChuYwcfOPCqi3ZIVPAiBfNyvrZUKDbFT7U
 nd1mb+sLT/1nMf+lDgQavLqFu0qGW5oWPwo72//BFUDV/t2h1JHdHhfoBT5YCK8vjPzJ
 lz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32jvXD3cPexjv7JnSZTYWkfatpOgTafU8/6QQULQx+A=;
 b=TT4xHlLmpwqlSx3YLUHQ4AHYYOL2ejrZM1GfQPVI7obemC1aw8qmtYNyLCZwDmvy7u
 R4lgRsgN+0U4D15nzBX27YDJQJK8twPh2yZZOvutfoPlCyDApyjEEU1PnpjkePzUh8Ud
 uLGoVll24vBVa6HMRqxijZz5ApDoqLrZBaW8MuwXKDPKfb52+gYFfs64LWSYMMjwCaY4
 7ykHFBjHa9qozV1do3A3Xju67II++TjXWGMw/szviVqREb/9A42PzYmIYuX+0ZskkHJP
 VJoPo0399tHCol1wZLEc+3n0VDrft4d77DBabICR9wJX3FKaPUAcDri7YsbWd0wbkIUd
 D5nQ==
X-Gm-Message-State: APjAAAWVVp29Bscc7qLM5N7sg10lRTZfLa68C8SRAkLpJY0o/4qTMKyk
 uUReuX8UD821s82BAZdNZLfy0kjNcFU=
X-Google-Smtp-Source: APXvYqy76PILK+QlY/12K5ud4j7hkeusVbojfkgjJDVTfPNkkqEZ1YCTe066CTqwxeor/JXQjSu02A==
X-Received: by 2002:a05:600c:2944:: with SMTP id
 n4mr4103781wmd.22.1580373158828; 
 Thu, 30 Jan 2020 00:32:38 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:38 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 01/12] drm/i915/vlv_dsi_pll: conversion to struct drm_device
 logging macros.
Date: Thu, 30 Jan 2020 11:32:18 +0300
Message-Id: <20200130083229.12889-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the printk based logging macros to the new struct drm_device
based logging macros in i915/display/vlv_dsi_pll.c using the following
coccinelle script that matches based on the existence of a drm_i915_private
device:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c | 47 ++++++++++++----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
index 8a68a86e2dc8..d0a514301575 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
@@ -64,7 +64,7 @@ static int dsi_calc_mnp(struct drm_i915_private *dev_priv,
 
 	/* target_dsi_clk is expected in kHz */
 	if (target_dsi_clk < 300000 || target_dsi_clk > 1150000) {
-		DRM_ERROR("DSI CLK Out of Range\n");
+		drm_err(&dev_priv->drm, "DSI CLK Out of Range\n");
 		return -ECHRNG;
 	}
 
@@ -126,7 +126,7 @@ int vlv_dsi_pll_compute(struct intel_encoder *encoder,
 
 	ret = dsi_calc_mnp(dev_priv, config, dsi_clk);
 	if (ret) {
-		DRM_DEBUG_KMS("dsi_calc_mnp failed\n");
+		drm_dbg_kms(&dev_priv->drm, "dsi_calc_mnp failed\n");
 		return ret;
 	}
 
@@ -138,8 +138,8 @@ int vlv_dsi_pll_compute(struct intel_encoder *encoder,
 
 	config->dsi_pll.ctrl |= DSI_PLL_VCO_EN;
 
-	DRM_DEBUG_KMS("dsi pll div %08x, ctrl %08x\n",
-		      config->dsi_pll.div, config->dsi_pll.ctrl);
+	drm_dbg_kms(&dev_priv->drm, "dsi pll div %08x, ctrl %08x\n",
+		    config->dsi_pll.div, config->dsi_pll.ctrl);
 
 	return 0;
 }
@@ -149,7 +149,7 @@ void vlv_dsi_pll_enable(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	vlv_cck_get(dev_priv);
 
@@ -169,12 +169,12 @@ void vlv_dsi_pll_enable(struct intel_encoder *encoder,
 						DSI_PLL_LOCK, 20)) {
 
 		vlv_cck_put(dev_priv);
-		DRM_ERROR("DSI PLL lock failed\n");
+		drm_err(&dev_priv->drm, "DSI PLL lock failed\n");
 		return;
 	}
 	vlv_cck_put(dev_priv);
 
-	DRM_DEBUG_KMS("DSI PLL locked\n");
+	drm_dbg_kms(&dev_priv->drm, "DSI PLL locked\n");
 }
 
 void vlv_dsi_pll_disable(struct intel_encoder *encoder)
@@ -182,7 +182,7 @@ void vlv_dsi_pll_disable(struct intel_encoder *encoder)
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	u32 tmp;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	vlv_cck_get(dev_priv);
 
@@ -218,12 +218,14 @@ bool bxt_dsi_pll_is_enabled(struct drm_i915_private *dev_priv)
 	val = intel_de_read(dev_priv, BXT_DSI_PLL_CTL);
 	if (IS_GEMINILAKE(dev_priv)) {
 		if (!(val & BXT_DSIA_16X_MASK)) {
-			DRM_DEBUG_DRIVER("Invalid PLL divider (%08x)\n", val);
+			drm_dbg(&dev_priv->drm,
+				"Invalid PLL divider (%08x)\n", val);
 			enabled = false;
 		}
 	} else {
 		if (!(val & BXT_DSIA_16X_MASK) || !(val & BXT_DSIC_16X_MASK)) {
-			DRM_DEBUG_DRIVER("Invalid PLL divider (%08x)\n", val);
+			drm_dbg(&dev_priv->drm,
+				"Invalid PLL divider (%08x)\n", val);
 			enabled = false;
 		}
 	}
@@ -236,7 +238,7 @@ void bxt_dsi_pll_disable(struct intel_encoder *encoder)
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	u32 val;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	val = intel_de_read(dev_priv, BXT_DSI_PLL_ENABLE);
 	val &= ~BXT_DSI_PLL_DO_ENABLE;
@@ -248,7 +250,8 @@ void bxt_dsi_pll_disable(struct intel_encoder *encoder)
 	 */
 	if (intel_de_wait_for_clear(dev_priv, BXT_DSI_PLL_ENABLE,
 				    BXT_DSI_PLL_LOCKED, 1))
-		DRM_ERROR("Timeout waiting for PLL lock deassertion\n");
+		drm_err(&dev_priv->drm,
+			"Timeout waiting for PLL lock deassertion\n");
 }
 
 u32 vlv_dsi_get_pclk(struct intel_encoder *encoder,
@@ -263,7 +266,7 @@ u32 vlv_dsi_get_pclk(struct intel_encoder *encoder,
 	int refclk = IS_CHERRYVIEW(dev_priv) ? 100000 : 25000;
 	int i;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	vlv_cck_get(dev_priv);
 	pll_ctl = vlv_cck_read(dev_priv, CCK_REG_DSI_PLL_CONTROL);
@@ -292,7 +295,7 @@ u32 vlv_dsi_get_pclk(struct intel_encoder *encoder,
 	p--;
 
 	if (!p) {
-		DRM_ERROR("wrong P1 divisor\n");
+		drm_err(&dev_priv->drm, "wrong P1 divisor\n");
 		return 0;
 	}
 
@@ -302,7 +305,7 @@ u32 vlv_dsi_get_pclk(struct intel_encoder *encoder,
 	}
 
 	if (i == ARRAY_SIZE(lfsr_converts)) {
-		DRM_ERROR("wrong m_seed programmed\n");
+		drm_err(&dev_priv->drm, "wrong m_seed programmed\n");
 		return 0;
 	}
 
@@ -333,7 +336,7 @@ u32 bxt_dsi_get_pclk(struct intel_encoder *encoder,
 
 	pclk = DIV_ROUND_CLOSEST(dsi_clk * intel_dsi->lane_count, bpp);
 
-	DRM_DEBUG_DRIVER("Calculated pclk=%u\n", pclk);
+	drm_dbg(&dev_priv->drm, "Calculated pclk=%u\n", pclk);
 	return pclk;
 }
 
@@ -479,10 +482,11 @@ int bxt_dsi_pll_compute(struct intel_encoder *encoder,
 	}
 
 	if (dsi_ratio < dsi_ratio_min || dsi_ratio > dsi_ratio_max) {
-		DRM_ERROR("Cant get a suitable ratio from DSI PLL ratios\n");
+		drm_err(&dev_priv->drm,
+			"Cant get a suitable ratio from DSI PLL ratios\n");
 		return -ECHRNG;
 	} else
-		DRM_DEBUG_KMS("DSI PLL calculation is Done!!\n");
+		drm_dbg_kms(&dev_priv->drm, "DSI PLL calculation is Done!!\n");
 
 	/*
 	 * Program DSI ratio and Select MIPIC and MIPIA PLL output as 8x
@@ -508,7 +512,7 @@ void bxt_dsi_pll_enable(struct intel_encoder *encoder,
 	enum port port;
 	u32 val;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	/* Configure PLL vales */
 	intel_de_write(dev_priv, BXT_DSI_PLL_CTL, config->dsi_pll.ctrl);
@@ -530,11 +534,12 @@ void bxt_dsi_pll_enable(struct intel_encoder *encoder,
 	/* Timeout and fail if PLL not locked */
 	if (intel_de_wait_for_set(dev_priv, BXT_DSI_PLL_ENABLE,
 				  BXT_DSI_PLL_LOCKED, 1)) {
-		DRM_ERROR("Timed out waiting for DSI PLL to lock\n");
+		drm_err(&dev_priv->drm,
+			"Timed out waiting for DSI PLL to lock\n");
 		return;
 	}
 
-	DRM_DEBUG_KMS("DSI PLL locked\n");
+	drm_dbg_kms(&dev_priv->drm, "DSI PLL locked\n");
 }
 
 void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
