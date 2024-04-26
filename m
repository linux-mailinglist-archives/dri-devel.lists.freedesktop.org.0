Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D68B3C54
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811F010F150;
	Fri, 26 Apr 2024 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HbPKuAtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E78C10E139
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:03:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41a1d88723bso15938965e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714147399; x=1714752199;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwWBLD0qVTKGOAoQ6eE14pnlmcdWHx3m3KgGPqRsyL0=;
 b=HbPKuAtBMFX1Oj9k/Zd4mM+2c7yiT0vqn/BvzQo2o4DI8vvicLHyhv5c9OAVeoTnD3
 9AUo205nHHb3DPllDiDueE6LN8VedoGdInHh40YDSLHp+AseHbJtSjZmctgNRTBS7dO/
 mpPiOz6pi9gyqvh8ea7z+PRjW78EN7SMPlNkeNWD17N6yh3HXKfOd+isM/4MnGc0APta
 jgMdMfMd8qufBB1psrxiS5PS7cRgtKC5cbVgKPRs0d3QwqqKvmtSSz9m5WrllshoNWYY
 NGLoFdGjK7PTuSZKEdCZ4QZqYEHzIeEYnMxNFyPyl80xx/1Kdx2xRT+kk6vXohCphXdU
 sCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714147399; x=1714752199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwWBLD0qVTKGOAoQ6eE14pnlmcdWHx3m3KgGPqRsyL0=;
 b=scs4fqpeBbuseOE+2DzulfC6qquoxP7QjcUd/bGXBpkObaI/ZKmQOIWD6LSnc+eHaB
 ZxqJtFPun6ZutChtkn0EwzaGWxdpFLj1vuaeoyYop/az7b6qy5KQlhvPZ/rXOfSZ2Zvw
 kujKtfP8R/qRrKN3nPQO7EIsC9EhqhJEKLQ28FDRzeHppDEE7leDL1H6oMKaIWaAkpnN
 F68HTxo1dHyvXMgya6WwR97VheQYvNUjshIbgNRxtt8MORLIfYMRv8gueLfxaunVmg+0
 +ePlWjDNFa9D9uiuR0Sz9GtIZ4tmDWRwnAEVKZxAsxg+ekHxNKFwP2GYKFvh6Ptb/lrZ
 rDug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIjGXPMv+z1PxX5UYekPSWWa08QgHTEnA0rMPSiGwptV5q7NDdbwebyNYm0Zv/pNB3Dmg2ims/zf6/KbfBRzn3x6ePJVGAJFHwoC4ourPU
X-Gm-Message-State: AOJu0YxeS3QfgMYVXR5UhnQRarNePnO5217jgSsK7vRvcwi2ieTGBLDo
 a/h/uG3tZxTSJIL3E3oliTSfFCqIp67f7IeQ+A7OVN67IPZcH0rUYBAAhj5B6MY=
X-Google-Smtp-Source: AGHT+IHkz1L3NwwxZXGlD2vu7++NI5Hhk5UYu+PbPcgI+aC0ZN9bQl9YHJFAVv+F4MLdLuQUjRV3jw==
X-Received: by 2002:a05:600c:1913:b0:41b:ab72:3f4d with SMTP id
 j19-20020a05600c191300b0041bab723f4dmr749759wmq.1.1714147399382; 
 Fri, 26 Apr 2024 09:03:19 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0041bab13cd74sm1271408wms.17.2024.04.26.09.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 09:03:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/meson: dw-hdmi: add bandgap setting for g12
Date: Fri, 26 Apr 2024 18:02:54 +0200
Message-ID: <20240426160256.3089978-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426160256.3089978-1-jbrunet@baylibre.com>
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

When no mode is set, the utility pin appears to be grounded. No signal
is getting through.

This is problematic because ARC and eARC use this line and may do so even
if no display mode is set.

This change enable the bandgap setting on g12 chip, which fix the problem
with the utility pin. This is done by restoring init values on PHY init and
disable.

Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++-----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index a83d93078537..5565f7777529 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -106,6 +106,8 @@
 #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
+#define  PHY_CNTL1_INIT		0x03900000
+#define  PHY_INVERT		BIT(17)
 #define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
 #define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
 #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
@@ -130,6 +132,8 @@ struct meson_dw_hdmi_data {
 				    unsigned int addr);
 	void		(*dwc_write)(struct meson_dw_hdmi *dw_hdmi,
 				     unsigned int addr, unsigned int data);
+	u32 cntl0_init;
+	u32 cntl1_init;
 };
 
 struct meson_dw_hdmi {
@@ -458,7 +462,9 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
+	/* Fallback to init mode */
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
 }
 
 static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
@@ -576,11 +582,22 @@ static const struct regmap_config meson_dw_hdmi_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct meson_dw_hdmi_data meson_dw_hdmi_gx_data = {
+static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
 	.top_read = dw_hdmi_top_read,
 	.top_write = dw_hdmi_top_write,
 	.dwc_read = dw_hdmi_dwc_read,
 	.dwc_write = dw_hdmi_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
+};
+
+static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
+	.top_read = dw_hdmi_top_read,
+	.top_write = dw_hdmi_top_write,
+	.dwc_read = dw_hdmi_dwc_read,
+	.dwc_write = dw_hdmi_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT,
 };
 
 static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
@@ -588,6 +605,8 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.top_write = dw_hdmi_g12a_top_write,
 	.dwc_read = dw_hdmi_g12a_dwc_read,
 	.dwc_write = dw_hdmi_g12a_dwc_write,
+	.cntl0_init = 0x000b4242, /* Bandgap */
+	.cntl1_init = PHY_CNTL1_INIT,
 };
 
 static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
@@ -626,18 +645,8 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
 	/* Setup PHY */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-			   0xffff << 16, 0x0390 << 16);
-
-	/* BIT_INVERT */
-	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), 0);
-	else
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), BIT(17));
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
 
 	/* Enable HDMI-TX Interrupt */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
@@ -848,11 +857,11 @@ static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
 
 static const struct of_device_id meson_dw_hdmi_of_table[] = {
 	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxbb_data },
 	{ .compatible = "amlogic,meson-gxl-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
-	  .data = &meson_dw_hdmi_gx_data },
+	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
 	  .data = &meson_dw_hdmi_g12a_data },
 	{ }
-- 
2.43.0

