Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C80A08956
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490EE10EFF2;
	Fri, 10 Jan 2025 07:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hazxSPED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD8C10EFF2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:45:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so1290943f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736495110; x=1737099910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2jNHP4kZ+vx7B4mNnjwcHbIWUQy7cq2XYj5Zl2+8UJQ=;
 b=hazxSPEDkM8QBahWfScfMmu/AxP+yedIqFala5wTSnaFMrLfBLJexqOykyw3s8NuZf
 r0eQ1eNwL1Y6QF4RlVdEIOAPCOpqmbDOtCk7QzfYMewNsGWD17Z8JlY0/xbE6wF9f2CT
 jU8KOjxUL3vb0s3ggD0Dt0RjR4iJ6igoMePc+YgS0Bmd09nVytC/3mYzlmAvGPo7jU72
 aXnV/Efgc6//PDr7g9bK/GcYjUAbKAf45FbPSr74QUQf4LRahR0XpPJwjERoHUexWH6C
 rO8AELdB2AaODW8Y4nsKnACn8AQdbXQlfHbv3+lPR/3BpYTV2Z3LRh8h2X5MwLPay+cr
 Ld0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736495110; x=1737099910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jNHP4kZ+vx7B4mNnjwcHbIWUQy7cq2XYj5Zl2+8UJQ=;
 b=BZhfKB1oq8r0yFngnvZx9Tnx8YRCpipiHQyJiipLRjCrYaHeSChxODHmt5M6jSUkB3
 I2n6zK8d5ZZtAPHAAM2H6CRZhJPEdJgxPGYvXUjwLqCASFuDHV0iIc6g/DC3WnLFsD2a
 8xqs3iD3RlrKR9Jv6vsbM/ZmwqIM9Qre1YBygqa2LjbCAGg8gMQ3n8xYqMnnJUaLzbvT
 ZNgFVOG7HA29byKwiaJEtVwSR3tS/HqxuZXKOs48Y/4FkypdRctAF2DfsOIUoPc7uKK+
 tnY0uF18Gn6RvXoB0U95fzZsJhPrEn32G3DOBp3Oz2TC8KZQ2X+20lekwF1qJ4AEgILA
 sQzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEIgwhFrNigUVaGCKN17GKoI7ahOwEolIGyAm09qttU4Ky1FMZgDKuKGjal31vqNljn7+qxpv9gDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+UjE5bKTpyenWxNEAPJ+6Qig/6HWCUsua087bco3PJFXrbj4u
 X3JzaMNncHuSKzJqur1AzRo4UB46zo9BWgkk+SbOg7ClgyRkUjh+
X-Gm-Gg: ASbGncuSLR5ToHmI7GukjLqgY67519ST857+mvezxC4lm/+dhCSKtKkS3n67OJE56K6
 ZUXC5OdgXICXb0rtx4C0KoXk4F5qMqv+/L2S4jMYOhoI+9/bgd2pLeBBtdWhRH8gx/mBd7dYCms
 i6DAlIIWT/VwKTi4v34HGXIsMzmqJK2qMgKF7dxDyy7IPojduduPQzIXzFarlQCcBKdGokVBOhW
 lw5lyt4HUKCGoVc9nyixSYV6NQAU2aISTAQ/EJCVGurMW0rRGU1uUCYMqGPfg==
X-Google-Smtp-Source: AGHT+IEWgMeyWDOA+o/1zzBIG4lq5Hb3irgWYUor5mMfHYLLxUho1JaxY7qlzPernGP85Damom0BMw==
X-Received: by 2002:a5d:5f8f:0:b0:38a:2b39:679d with SMTP id
 ffacd0b85a97d-38a87313e2cmr8298382f8f.32.1736495109806; 
 Thu, 09 Jan 2025 23:45:09 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 23:45:09 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
Date: Fri, 10 Jan 2025 07:44:58 +0000
Message-Id: <20250110074458.3624094-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
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

Playing YUV420 @ 59.94 media causes HDMI output to lose sync
with a fatal error reported:

[   89.610280] Fatal Error, invalid HDMI vclk freq 593406

In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
593407 but YUV420 modes halve the value to 296703.5 and this
is stored as int which loses precision by rounding down to
296703. The rounded value is later doubled to 593406 and then
meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
and the error triggers during meson_vlkc_setup validation.

Fix precision in meson_encoder_hdmi_set_vclk by switching to
unsigned long long KHz values instead of int MHz. As values
for phy_freq are now more accurate we also need to handle an
additional match scenario in meson_vclk_setup.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
 drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..fa37cf975992 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 {
 	struct meson_drm *priv = encoder_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long vclk_freq;
+	unsigned long long phy_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	phy_freq = vclk_freq * 10;
 
 	if (!vic) {
-		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
-				 vclk_freq, vclk_freq, vclk_freq, false);
+		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
+				 vclk_freq / 1000ULL, vclk_freq / 1000ULL,
+				 vclk_freq / 1000ULL, false);
 		return;
 	}
 
@@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
-		phy_freq, vclk_freq, venc_freq, hdmi_freq,
-		priv->venc.hdmi_use_enci);
-
-	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
-			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
+			 vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
+			 priv->venc.hdmi_use_enci);
 }
 
 static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
@@ -122,10 +120,10 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long vclk_freq;
+	unsigned long long phy_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 	int vic = drm_match_cea_mode(mode);
 	enum drm_mode_status status;
 
@@ -149,7 +147,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	} else if (!meson_venc_hdmi_supported_vic(vic))
 		return MODE_BAD;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (drm_mode_is_420_only(display_info, mode) ||
@@ -179,10 +177,12 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
-		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
+	dev_dbg(priv->dev, "%s: phy=%lld vclk=%lld venc=%lld hdmi=%lld\n",
+		__func__, phy_freq / 1000ULL, vclk_freq / 1000ULL,
+		venc_freq / 1000ULL, hdmi_freq / 1000ULL);
 
-	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
+	return meson_vclk_vic_supported_freq(priv, phy_freq / 1000ULL,
+					     vclk_freq / 1000ULL);
 }
 
 static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..a2e93b500ed6 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -1070,7 +1070,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10 ||
+		   ((phy_freq/10)*10) == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1

