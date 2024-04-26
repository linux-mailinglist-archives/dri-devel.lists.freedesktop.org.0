Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB38B3C55
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397510F14E;
	Fri, 26 Apr 2024 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C7eHo1XY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D910E139
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:03:20 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so25973631fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714147398; x=1714752198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlYVJCYtRxxPVBcJn9HswhGBQFKRvWfDNGI/lisBMlg=;
 b=C7eHo1XYn8GdRK7DLnJWHa4gn+37WU8z/5u0pV0HZO9kISvFIPkNHrdxjlc607lrzn
 L8W24mFNAgIA8P2PyKAMr7JJfsFHKGnGP4NErcJfzl74tERMOvncP71WOLOar9rP1Jup
 6x4vnaasFJVLaEKAFCvQmHLZmaVFG52bVFT42R1ADFFXtQYu8GHke9En3zMavR0Q7kSP
 0d39g1VhCuHDFr4JTQomwXRIZ+sgCsaedPFVcB+8Pt0lEXlD8VuXqJokEyxVn+xv+Pgx
 dfReFlmtMovvWP1h/mXhePKEROHOHif35F10g+4E/QIIEg7S9SVdbr0kzYBVFW6BC2Wq
 HJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714147398; x=1714752198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LlYVJCYtRxxPVBcJn9HswhGBQFKRvWfDNGI/lisBMlg=;
 b=uuQh6lhyp+DNOsZngRHK27z3tWUSPtcnVdVL8iBIbIpi8z8tYAIhTm3gSyc+AXdDQJ
 UgtKmFK9dx9ocA3gJGi7xehE9MiuD4vhaN61jkicXnjcNtNCLH+7jfmt/5rY7rCESy5d
 Fo60jx/IPcPomsrQWrKRjYDJh7UlGNvqgqimB1JMVOxXfx9DWPpBMRjgtWZZy7ApUi/A
 7eQKnoJjRbNHLtROlzxzJ2ztzSCIs16J3CaltYMXuvP5cuW+GAk2Qp0sujtOubFCNRxk
 Ci4bU3q/LRMXODgoX0ZkipJ6YyWSbkeE6k9yv4azm+vWTdLwByjFmC/HWytBZryFVF6A
 vuQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRp1DTFb3Np9jjzr/nZZ+/OirRHeg/XzAgMsVF6VyXLOLo//RjVGJUgHLXPJB4pCXMwejhnbcvfS1/FJt2Z5+xvINvsearHLe3dcjToPU6
X-Gm-Message-State: AOJu0YyeUal34gHyyx3PRUQTvz8y5bKra8bxHr75+PChZeXQUAp91Cfc
 lw33B0gNSr+QZ4xjSSOXLJR2aYqC7XUm+JyJbPfoAxgvyf3IEdj/tAJ2hzwf3CE=
X-Google-Smtp-Source: AGHT+IFW14tBfWL7cXos/nSxllpRy5uvA9d7tTy4bPugq4GLaF2Jd9gqDVK0xzBYq2SjTQFT1PuVCA==
X-Received: by 2002:a05:651c:1a26:b0:2df:7009:63e3 with SMTP id
 by38-20020a05651c1a2600b002df700963e3mr1496141ljb.29.1714147398483; 
 Fri, 26 Apr 2024 09:03:18 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0041bab13cd74sm1271408wms.17.2024.04.26.09.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 09:03:18 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/meson: dw-hdmi: power up phy on device init
Date: Fri, 26 Apr 2024 18:02:53 +0200
Message-ID: <20240426160256.3089978-2-jbrunet@baylibre.com>
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

The phy is not in a useful state right after init. It will become useful,
including for auxiliary function such as CEC or ARC, after the first mode
is set. This is a problem on systems where the display is using another
interface like DSI or CVBS.

This change refactor the init and mode change callback to power up the PHY
on init and leave only what is necessary for mode changes in the related
function. This is enough to fix CEC operation when HDMI display is not
enabled.

Fixes: 3f68be7d8e96 ("drm/meson: Add support for HDMI encoder and DW-HDMI bridge + PHY")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 51 +++++++++------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5a9538bc0e26..a83d93078537 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -384,26 +384,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	    dw_hdmi_bus_fmt_is_420(hdmi))
 		mode_is_420 = true;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
-	/* Bring out of reset */
-	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_SW_RESET,  0);
-
-	/* Enable internal pixclk, tmds_clk, spdif_clk, i2s_clk, cecclk */
-	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
-			       0x3, 0x3);
-
-	/* Enable cec_clk and hdcp22_tmdsclk_en */
-	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
-			       0x3 << 4, 0x3 << 4);
-
-	/* Enable normal output to PHY */
-	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
-
 	/* TMDS pattern setup */
 	if (mode->clock > 340000 && !mode_is_420) {
 		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
@@ -425,20 +405,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	/* Setup PHY parameters */
 	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
 
-	/* Setup PHY */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-			   0xffff << 16, 0x0390 << 16);
-
-	/* BIT_INVERT */
-	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), 0);
-	else
-		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
-				   BIT(17), BIT(17));
-
 	/* Disable clock, fifo, fifo_wr */
 	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
 
@@ -656,6 +622,23 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
 				       HDMITX_TOP_CLK_CNTL, 0xff);
 
+	/* Enable normal output to PHY */
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
+
+	/* Setup PHY */
+	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
+			   0xffff << 16, 0x0390 << 16);
+
+	/* BIT_INVERT */
+	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
+	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
+	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
+		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
+				   BIT(17), 0);
+	else
+		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
+				   BIT(17), BIT(17));
+
 	/* Enable HDMI-TX Interrupt */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
 				       HDMITX_TOP_INTR_CORE);
-- 
2.43.0

