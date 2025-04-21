Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C7A9570F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780910E498;
	Mon, 21 Apr 2025 20:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Koyoeu/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CB410E489
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 20:13:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5f63ac6ef0fso3913745a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745266400; x=1745871200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsbinM8pfIZhsw6KubZ4VNabJpTXJFIRYJ5pyYy9jJQ=;
 b=Koyoeu/4NMsaZX3fqxGvk41fYdj+o4FSqocSFstYhkRcH/QbbeNeomRer4oNRRK35V
 E0Sg/ygZJev0QFdCEx9jW6vejbUBQZugbDcgslT2LD/vRO58Iu7oTi55nMI9wp5g87G1
 zy6/oFhtBaAaEqIjAHxur1RQe9iTvV18fpwfwf63lhLZRBqVutKg2AKD0oJVPtd3oaSz
 /Q9T4s4zdqK2Iz6EWz18HwQWuxf2z/bW5FS0SM4cM3OhfrIpzhirUGpsg9irQEvKAfh/
 NlofqriIHt071TqBQD4bzx6Eyxe4qVWh+oObTAKHyaORKaFRW0h1D7VUsS/9jdvIE55H
 3jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745266400; x=1745871200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsbinM8pfIZhsw6KubZ4VNabJpTXJFIRYJ5pyYy9jJQ=;
 b=tD+G38RpyUcnMsoIdB8Ldud/LP2BfIZaJQaeBncaeRJhT0HdiZtuq0CcO7eq/YS+Hl
 BLrTu8GGvup9UyUXunf+Axos36a7W15WctWYj5CGw3x3MpE5N2TfrmVqGm6KHZSumTrR
 w/Rkj6o039x5fVDzc5ntdUdGw4swnV0V3LOQHG8n8UY/72lTpzgNEjTkgVsCXxiul9gr
 /NuqaIhMTDh0FbRx4IYRnBhAOgC/U1CMUBCtoNElcShKcU8zF0/QrquekQDORMhf6sVJ
 ZGz+yE9vZFiIZEAhR+bzgMcF/WaCqCEFIagQYU8ma6pbxwXTDKUty5d4Y/hvqALuuf/n
 lfkw==
X-Gm-Message-State: AOJu0YwHFGPdv8d6U9OZyuFnoefxZXWVbHAgsPtzg+IoBRv5K0KS60g2
 jSecdpWQRysIjMkD0h+RuK6FLShGbAFuuaygTLF8I27OeVHfDbyKo/+WEA==
X-Gm-Gg: ASbGncu0X9iU1gUlyE5+sOwnwMxImFG/H7gDn2dxbd2PAqi91khydSXSX8oaFOng0bY
 EVbyPDC3Gas8Nh6xkCpCFwj0l6XXmp8OSIEvPvA4xqEdOi4qhht1mxWNohL24cDASMhO3SVDsrR
 EJ7mzf63eVQKhjeWpg7mLw4kszgrF+1XzKMTz7H5Pyo4OcpHHQxHXVHSzUYzItOMnQ+l44ou5et
 RDZ2868eRMiudWPx/SQG/mPvtOtibmzqTMKY9hetSaXI2WUiRkFRM/VLyg4VqlAZgQuoFO68lnR
 agh9krTaZHPNRRtey/ONLdM5abJjK0YnWdR+cldreswj6jDlMqvkW8bXgagu8V6Sx+AHs3+1zUg
 +jvA8q3aFJBPFZ/4Aj68OaxrGCA3lq+IOEWSxz+/5GBDsYUNgR5pLgasqd+HE1690qw==
X-Google-Smtp-Source: AGHT+IHsZ/NuDK0IuqZyQaLl/+J8JeLQl3sL0LmN3d9W1xo3o8AVpB20Ji79CvJUYXWioTu42XY8LQ==
X-Received: by 2002:a05:6402:510c:b0:5ed:599a:3cbe with SMTP id
 4fb4d7f45d1cf-5f627cdbaf1mr11266349a12.4.1745266399987; 
 Mon, 21 Apr 2025 13:13:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:a503:5900::e63]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:13:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org, christianshewitt@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 2/2] drm/meson: use unsigned long long / Hz for
 frequency types
Date: Mon, 21 Apr 2025 22:13:00 +0200
Message-ID: <20250421201300.778955-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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

Christian reports that 4K output using YUV420 encoding fails with the
following error:
  Fatal Error, invalid HDMI vclk freq 593406

Modetest shows the following:
  3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
  drm calculated value -------------------------------------^

This indicates that there's a (1kHz) mismatch between the clock
calculated by the drm framework and the meson driver.

Relevant function call stack:
(drm framework)
  -> meson_encoder_hdmi_atomic_enable()
    -> meson_encoder_hdmi_set_vclk()
      -> meson_vclk_setup()

The video clock requested by the drm framework is 593407kHz. This is
passed by meson_encoder_hdmi_atomic_enable() to
meson_encoder_hdmi_set_vclk() and the following formula is applied:
- the frequency is halved (which would be 296703.5kHz) and rounded down
  to the next full integer, which is 296703kHz
- TMDS clock is calculated (296703kHz * 10)
- video encoder clock is calculated - this needs to match a table from
  meson_vclk.c and so it doubles the previously halved value again
  (resulting in 593406kHz)
- meson_vclk_setup() can't find (either directly, or by deriving it from
  594000kHz * 1000 / 1001 and rounding to the closest integer value -
  which is 593407kHz as originally requested by the drm framework) a
  matching clock in it's internal table and errors out with "invalid
  HDMI vclk freq"

Fix the division precision by switching the whole meson driver to use
unsigned long long (64-bit) Hz values for clock frequencies instead of
unsigned int (32-bit) kHz to fix the rouding error.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 from Christian:
- fix compilation targeting 32-bit ARM
- change all clock frequencies from kHz to Hz (throughout the whole
  driver)


 drivers/gpu/drm/meson/meson_drv.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.h          |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
 5 files changed, 126 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..49ff9f1f16d3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -169,7 +169,7 @@ static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
 	/* S805X/S805Y HDMI PLL won't lock for HDMI PHY freq > 1,65GHz */
 	{
 		.limits = {
-			.max_hdmi_phy_freq = 1650000,
+			.max_hdmi_phy_freq = 1650000000,
 		},
 		.attrs = (const struct soc_device_attribute []) {
 			{ .soc_id = "GXL (S805*)", },
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3f9345c14f31..be4b0e4df6e1 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -37,7 +37,7 @@ struct meson_drm_match_data {
 };
 
 struct meson_drm_soc_limits {
-	unsigned int max_hdmi_phy_freq;
+	unsigned long long max_hdmi_phy_freq;
 };
 
 struct meson_drm {
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 6d1c9262a2cf..7752d8ac85f0 100644
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
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -107,7 +107,8 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
+	dev_dbg(priv->dev,
+		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
 		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
@@ -122,10 +123,11 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long clock = mode->clock * 1000;
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 	int vic = drm_match_cea_mode(mode);
 	enum drm_mode_status status;
 
@@ -144,12 +146,12 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 		if (status != MODE_OK)
 			return status;
 
-		return meson_vclk_dmt_supported_freq(priv, mode->clock);
+		return meson_vclk_dmt_supported_freq(priv, clock);
 	/* Check against supported VIC modes */
 	} else if (!meson_venc_hdmi_supported_vic(vic))
 		return MODE_BAD;
 
-	vclk_freq = mode->clock;
+	vclk_freq = clock;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (drm_mode_is_420_only(display_info, mode) ||
@@ -179,7 +181,8 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+	dev_dbg(priv->dev,
+		"%s: vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz\n",
 		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..3325580d885d 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -110,7 +110,10 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
-#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST(_freq * 1000, 1001)
+#define PIXEL_FREQ_1000_1001(_freq)	\
+	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
+#define PHY_FREQ_1000_1001(_freq)	\
+	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
 
 /* VID PLL Dividers */
 enum {
@@ -360,11 +363,11 @@ enum {
 };
 
 struct meson_vclk_params {
-	unsigned int pll_freq;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int pixel_freq;
+	unsigned long long pll_freq;
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long pixel_freq;
 	unsigned int pll_od1;
 	unsigned int pll_od2;
 	unsigned int pll_od3;
@@ -372,11 +375,11 @@ struct meson_vclk_params {
 	unsigned int vclk_div;
 } params[] = {
 	[MESON_VCLK_HDMI_ENCI_54000] = {
-		.pll_freq = 4320000,
-		.phy_freq = 270000,
-		.vclk_freq = 54000,
-		.venc_freq = 54000,
-		.pixel_freq = 54000,
+		.pll_freq = 4320000000,
+		.phy_freq = 270000000,
+		.vclk_freq = 54000000,
+		.venc_freq = 54000000,
+		.pixel_freq = 54000000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -384,11 +387,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_54000] = {
-		.pll_freq = 4320000,
-		.phy_freq = 270000,
-		.vclk_freq = 54000,
-		.venc_freq = 54000,
-		.pixel_freq = 27000,
+		.pll_freq = 4320000000,
+		.phy_freq = 270000000,
+		.vclk_freq = 54000000,
+		.venc_freq = 54000000,
+		.pixel_freq = 27000000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -396,11 +399,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_148500] = {
-		.pll_freq = 2970000,
-		.phy_freq = 742500,
-		.vclk_freq = 148500,
-		.venc_freq = 148500,
-		.pixel_freq = 74250,
+		.pll_freq = 2970000000,
+		.phy_freq = 742500000,
+		.vclk_freq = 148500000,
+		.venc_freq = 148500000,
+		.pixel_freq = 74250000,
 		.pll_od1 = 4,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -408,11 +411,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_74250] = {
-		.pll_freq = 2970000,
-		.phy_freq = 742500,
-		.vclk_freq = 74250,
-		.venc_freq = 74250,
-		.pixel_freq = 74250,
+		.pll_freq = 2970000000,
+		.phy_freq = 742500000,
+		.vclk_freq = 74250000,
+		.venc_freq = 74250000,
+		.pixel_freq = 74250000,
 		.pll_od1 = 2,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -420,11 +423,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_148500] = {
-		.pll_freq = 2970000,
-		.phy_freq = 1485000,
-		.vclk_freq = 148500,
-		.venc_freq = 148500,
-		.pixel_freq = 148500,
+		.pll_freq = 2970000000,
+		.phy_freq = 1485000000,
+		.vclk_freq = 148500000,
+		.venc_freq = 148500000,
+		.pixel_freq = 148500000,
 		.pll_od1 = 1,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -432,11 +435,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_297000] = {
-		.pll_freq = 5940000,
-		.phy_freq = 2970000,
-		.venc_freq = 297000,
-		.vclk_freq = 297000,
-		.pixel_freq = 297000,
+		.pll_freq = 5940000000,
+		.phy_freq = 2970000000,
+		.venc_freq = 297000000,
+		.vclk_freq = 297000000,
+		.pixel_freq = 297000000,
 		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -444,11 +447,11 @@ struct meson_vclk_params {
 		.vclk_div = 2,
 	},
 	[MESON_VCLK_HDMI_594000] = {
-		.pll_freq = 5940000,
-		.phy_freq = 5940000,
-		.venc_freq = 594000,
-		.vclk_freq = 594000,
-		.pixel_freq = 594000,
+		.pll_freq = 5940000000,
+		.phy_freq = 5940000000,
+		.venc_freq = 594000000,
+		.vclk_freq = 594000000,
+		.pixel_freq = 594000000,
 		.pll_od1 = 1,
 		.pll_od2 = 1,
 		.pll_od3 = 2,
@@ -456,11 +459,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_594000_YUV420] = {
-		.pll_freq = 5940000,
-		.phy_freq = 2970000,
-		.venc_freq = 594000,
-		.vclk_freq = 594000,
-		.pixel_freq = 297000,
+		.pll_freq = 5940000000,
+		.phy_freq = 2970000000,
+		.venc_freq = 594000000,
+		.vclk_freq = 594000000,
+		.pixel_freq = 297000000,
 		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -617,16 +620,16 @@ static void meson_hdmi_pll_set_params(struct meson_drm *priv, unsigned int m,
 				3 << 20, pll_od_to_reg(od3) << 20);
 }
 
-#define XTAL_FREQ 24000
+#define XTAL_FREQ (24 * 1000 * 1000)
 
 static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
-					 unsigned int pll_freq)
+					 unsigned long long pll_freq)
 {
 	/* The GXBB PLL has a /2 pre-multiplier */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
-		pll_freq /= 2;
+		pll_freq = DIV_ROUND_DOWN_ULL(pll_freq, 2);
 
-	return pll_freq / XTAL_FREQ;
+	return DIV_ROUND_DOWN_ULL(pll_freq, XTAL_FREQ);
 }
 
 #define HDMI_FRAC_MAX_GXBB	4096
@@ -635,12 +638,13 @@ static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
 
 static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 					    unsigned int m,
-					    unsigned int pll_freq)
+					    unsigned long long pll_freq)
 {
-	unsigned int parent_freq = XTAL_FREQ;
+	unsigned long long parent_freq = XTAL_FREQ;
 	unsigned int frac_max = HDMI_FRAC_MAX_GXL;
 	unsigned int frac_m;
 	unsigned int frac;
+	u32 remainder;
 
 	/* The GXBB PLL has a /2 pre-multiplier and a larger FRAC width */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
@@ -652,11 +656,11 @@ static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 		frac_max = HDMI_FRAC_MAX_G12A;
 
 	/* We can have a perfect match !*/
-	if (pll_freq / m == parent_freq &&
-	    pll_freq % m == 0)
+	if (div_u64_rem(pll_freq, m, &remainder) == parent_freq &&
+	    remainder == 0)
 		return 0;
 
-	frac = div_u64((u64)pll_freq * (u64)frac_max, parent_freq);
+	frac = mul_u64_u64_div_u64(pll_freq, frac_max, parent_freq);
 	frac_m = m * frac_max;
 	if (frac_m > frac)
 		return frac_max;
@@ -666,7 +670,7 @@ static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 }
 
 static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
-					   unsigned int m,
+					   unsigned long long m,
 					   unsigned int frac)
 {
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
@@ -694,7 +698,7 @@ static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
 }
 
 static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
-				       unsigned int freq,
+				       unsigned long long freq,
 				       unsigned int *m,
 				       unsigned int *frac,
 				       unsigned int *od)
@@ -706,7 +710,7 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 			continue;
 		*frac = meson_hdmi_pll_get_frac(priv, *m, freq * *od);
 
-		DRM_DEBUG_DRIVER("PLL params for %dkHz: m=%x frac=%x od=%d\n",
+		DRM_DEBUG_DRIVER("PLL params for %lluHz: m=%x frac=%x od=%d\n",
 				 freq, *m, *frac, *od);
 
 		if (meson_hdmi_pll_validate_params(priv, *m, *frac))
@@ -718,7 +722,7 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 
 /* pll_freq is the frequency after the OD dividers */
 enum drm_mode_status
-meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned int freq)
+meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned long long freq)
 {
 	unsigned int od, m, frac;
 
@@ -741,7 +745,7 @@ EXPORT_SYMBOL_GPL(meson_vclk_dmt_supported_freq);
 
 /* pll_freq is the frequency after the OD dividers */
 static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
-				       unsigned int pll_freq)
+				       unsigned long long pll_freq)
 {
 	unsigned int od, m, frac, od1, od2, od3;
 
@@ -756,7 +760,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 			od1 = od / od2;
 		}
 
-		DRM_DEBUG_DRIVER("PLL params for %dkHz: m=%x frac=%x od=%d/%d/%d\n",
+		DRM_DEBUG_DRIVER("PLL params for %lluHz: m=%x frac=%x od=%d/%d/%d\n",
 				 pll_freq, m, frac, od1, od2, od3);
 
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
@@ -764,17 +768,18 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		return;
 	}
 
-	DRM_ERROR("Fatal, unable to find parameters for PLL freq %d\n",
+	DRM_ERROR("Fatal, unable to find parameters for PLL freq %lluHz\n",
 		  pll_freq);
 }
 
 enum drm_mode_status
-meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
-			      unsigned int vclk_freq)
+meson_vclk_vic_supported_freq(struct meson_drm *priv,
+			      unsigned long long phy_freq,
+			      unsigned long long vclk_freq)
 {
 	int i;
 
-	DRM_DEBUG_DRIVER("phy_freq = %d vclk_freq = %d\n",
+	DRM_DEBUG_DRIVER("phy_freq = %lluHz vclk_freq = %lluHz\n",
 			 phy_freq, vclk_freq);
 
 	/* Check against soc revision/package limits */
@@ -785,19 +790,19 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d pixel_freq = %d alt = %d\n",
+		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].pixel_freq,
-				 FREQ_1000_1001(params[i].pixel_freq));
-		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
+				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/10)*10);
+				 PHY_FREQ_1000_1001(params[i].phy_freq));
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
-		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
+		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
+		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
 
@@ -805,8 +810,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 }
 EXPORT_SYMBOL_GPL(meson_vclk_vic_supported_freq);
 
-static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
-			   unsigned int od1, unsigned int od2, unsigned int od3,
+static void meson_vclk_set(struct meson_drm *priv,
+			   unsigned long long pll_base_freq, unsigned int od1,
+			   unsigned int od2, unsigned int od3,
 			   unsigned int vid_pll_div, unsigned int vclk_div,
 			   unsigned int hdmi_tx_div, unsigned int venc_div,
 			   bool hdmi_use_enci, bool vic_alternate_clock)
@@ -826,15 +832,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 		meson_hdmi_pll_generic_set(priv, pll_base_freq);
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x3d;
 			frac = vic_alternate_clock ? 0xd02 : 0xe00;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0x59 : 0x5a;
 			frac = vic_alternate_clock ? 0xe8f : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0xa05 : 0xc00;
 			break;
@@ -844,15 +850,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
 		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0x281 : 0x300;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0xb3 : 0xb4;
 			frac = vic_alternate_clock ? 0x347 : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x102 : 0x200;
 			break;
@@ -861,15 +867,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0x140b4 : 0x18000;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0xb3 : 0xb4;
 			frac = vic_alternate_clock ? 0x1a3ee : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x8148 : 0x10000;
 			break;
@@ -1025,14 +1031,14 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 }
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int phy_freq, unsigned int vclk_freq,
-		      unsigned int venc_freq, unsigned int dac_freq,
+		      unsigned long long phy_freq, unsigned long long vclk_freq,
+		      unsigned long long venc_freq, unsigned long long dac_freq,
 		      bool hdmi_use_enci)
 {
 	bool vic_alternate_clock = false;
-	unsigned int freq;
-	unsigned int hdmi_tx_div;
-	unsigned int venc_div;
+	unsigned long long freq;
+	unsigned long long hdmi_tx_div;
+	unsigned long long venc_div;
 
 	if (target == MESON_VCLK_TARGET_CVBS) {
 		meson_venci_cvbs_clock_config(priv);
@@ -1052,27 +1058,27 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		return;
 	}
 
-	hdmi_tx_div = vclk_freq / dac_freq;
+	hdmi_tx_div = DIV_ROUND_DOWN_ULL(vclk_freq, dac_freq);
 
 	if (hdmi_tx_div == 0) {
-		pr_err("Fatal Error, invalid HDMI-TX freq %d\n",
+		pr_err("Fatal Error, invalid HDMI-TX freq %lluHz\n",
 		       dac_freq);
 		return;
 	}
 
-	venc_div = vclk_freq / venc_freq;
+	venc_div = DIV_ROUND_DOWN_ULL(vclk_freq, venc_freq);
 
 	if (venc_div == 0) {
-		pr_err("Fatal Error, invalid HDMI venc freq %d\n",
+		pr_err("Fatal Error, invalid HDMI venc freq %lluHz\n",
 		       venc_freq);
 		return;
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
 		    (vclk_freq == params[freq].vclk_freq ||
-		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
+		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
@@ -1098,7 +1104,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	if (!params[freq].pixel_freq) {
-		pr_err("Fatal Error, invalid HDMI vclk freq %d\n", vclk_freq);
+		pr_err("Fatal Error, invalid HDMI vclk freq %lluHz\n",
+		       vclk_freq);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..7ac55744e574 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -20,17 +20,18 @@ enum {
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-#define MESON_VCLK_CVBS			27000
+#define MESON_VCLK_CVBS			(27 * 1000 * 1000)
 
 enum drm_mode_status
-meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned int freq);
+meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned long long freq);
 enum drm_mode_status
-meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
-			      unsigned int vclk_freq);
+meson_vclk_vic_supported_freq(struct meson_drm *priv,
+			      unsigned long long phy_freq,
+			      unsigned long long vclk_freq);
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int phy_freq, unsigned int vclk_freq,
-		      unsigned int venc_freq, unsigned int dac_freq,
+		      unsigned long long phy_freq, unsigned long long vclk_freq,
+		      unsigned long long venc_freq, unsigned long long dac_freq,
 		      bool hdmi_use_enci);
 
 #endif /* __MESON_VCLK_H */
-- 
2.49.0

