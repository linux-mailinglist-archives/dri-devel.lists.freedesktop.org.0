Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86203C8B3A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AF110E6CA;
	Wed, 26 Nov 2025 17:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iMjBJp2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050410E6CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 031FF1A1D87;
 Wed, 26 Nov 2025 17:37:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1A6C60721;
 Wed, 26 Nov 2025 17:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0593D102F2343; Wed, 26 Nov 2025 18:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OWe7Xk1y8e6IQtzqXJ/sIyFn6NDrsN9OVkWkS3zi9BY=;
 b=iMjBJp2ZTjN8XNJpZAcX4/KmnqteG8zd7pfojCk8xUTuZGeKsEe3sjTyVUGu6zzt1VVQIK
 RRyPRAVaRuQNRXICVoi2e5ulJFv33n0dWIz4g86yBDewJDTiA2kpGxykwL75ohr/WDry0D
 DGyyEXsH3VjiyJCk8TpBKmHx3Jv3P0FUDjKaxFr7WhsADQXToXzDF6AM1wMaJbNmYIYvzo
 jYHqOE7byJLnTDj2rjWWoA2GpHyS0FQfZQm9MrRzWfUq5gL5O/r+JzQ/YI6doZ9UmNiwxw
 sdVW6Ev/N7tRrQDhW+YumoQJwFque+z5D1LttwLMrner8kpCNVLV6CcEeLfNxA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:51 +0100
Subject: [PATCH 09/21] drm/tilcdc: Remove tilcdc_panel_info structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-9-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

Remove the tilcdc_panel_info structure and its associated helper
function as the structure contains only redundant or unused parameters.

Most panel configuration parameters in tilcdc_panel_info are either:
- Already represented by existing DRM mode flags (invert_pxl_clk,
  sync_edge via DRM_BUS_FLAG_*), or
- Set to identical values across all instances (panel_info_default),
  making them effectively constants

The removed fifo_th field is already handled by priv->fifo_th when set.
Other removed fields (tft_alt_mode, raster_order) were always set to 0
in the only instance (panel_info_default) and thus had no effect.

This simplifies the code by eliminating unnecessary abstraction while
preserving all functional behavior.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 29 +++-------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      | 42 --------------------------------
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 14 -----------
 3 files changed, 3 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index a244051ab5163..3955b3b99befe 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -31,7 +31,6 @@ struct tilcdc_crtc {
 	struct drm_crtc base;
 
 	struct drm_plane primary;
-	const struct tilcdc_panel_info *info;
 	struct drm_pending_vblank_event *event;
 	struct mutex enable_lock;
 	bool enabled;
@@ -272,14 +271,10 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	const struct tilcdc_panel_info *info = tilcdc_crtc->info;
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
 
-	if (WARN_ON(!info))
-		return;
-
 	if (WARN_ON(!fb))
 		return;
 
@@ -287,12 +282,11 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
 	/* Use 16 bit DMA burst size by default */
 	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
+
 	if (priv->fifo_th) {
 		int fifo_th_val = const_ilog2(priv->fifo_th) - 3;
 
 		reg |= (fifo_th_val << 8);
-	} else {
-		reg |= (info->fifo_th << 8);
 	}
 	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
 
@@ -360,8 +354,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 		  LCDC_V2_TFT_24BPP_MODE | LCDC_V2_TFT_24BPP_UNPACK |
 		  0x000ff000 /* Palette Loading Delay bits */);
 	reg |= LCDC_TFT_MODE; /* no monochrome/passive support */
-	if (info->tft_alt_mode)
-		reg |= LCDC_TFT_ALT_ENABLE;
 	if (priv->rev == 2) {
 		switch (fb->format->format) {
 		case DRM_FORMAT_BGR565:
@@ -384,16 +376,13 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg |= 128 << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
-	if (info->invert_pxl_clk ||
-	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-
+	if (mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 
 	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-	if (info->sync_edge ||
-	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
+	if (mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
@@ -408,11 +397,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_VSYNC);
 
-	if (info->raster_order)
-		tilcdc_set(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-	else
-		tilcdc_clear(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-
 	tilcdc_crtc_set_clk(crtc);
 
 	tilcdc_crtc_load_palette(crtc);
@@ -839,13 +823,6 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 	.atomic_flush	= tilcdc_crtc_atomic_flush,
 };
 
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	tilcdc_crtc->info = info;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index c23b593dc61f6..181b9d7a515b6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -114,53 +114,11 @@ void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
 		const struct tilcdc_module_ops *funcs);
 void tilcdc_module_cleanup(struct tilcdc_module *mod);
 
-/* Panel config that needs to be set in the crtc, but is not coming from
- * the mode timings.  The display module is expected to call
- * tilcdc_crtc_set_panel_info() to set this during modeset.
- */
-struct tilcdc_panel_info {
-
-	/* AC Bias Pin Frequency */
-	uint32_t ac_bias;
-
-	/* AC Bias Pin Transitions per Interrupt */
-	uint32_t ac_bias_intrpt;
-
-	/* DMA burst size */
-	uint32_t dma_burst_sz;
-
-	/* Bits per pixel */
-	uint32_t bpp;
-
-	/* FIFO DMA Request Delay */
-	uint32_t fdd;
-
-	/* TFT Alternative Signal Mapping (Only for active) */
-	bool tft_alt_mode;
-
-	/* Invert pixel clock */
-	bool invert_pxl_clk;
-
-	/* Horizontal and Vertical Sync Edge: 0=rising 1=falling */
-	uint32_t sync_edge;
-
-	/* Horizontal and Vertical Sync: Control: 0=ignore */
-	uint32_t sync_ctrl;
-
-	/* Raster Data Order Select: 1=Most-to-least 0=Least-to-most */
-	uint32_t raster_order;
-
-	/* DMA FIFO threshold */
-	uint32_t fifo_th;
-};
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 2970c41d9c3eb..81c90c2754c6c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -14,18 +14,6 @@
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
 
-static const struct tilcdc_panel_info panel_info_default = {
-		.ac_bias                = 255,
-		.ac_bias_intrpt         = 0,
-		.dma_burst_sz           = 16,
-		.bpp                    = 16,
-		.fdd                    = 0x80,
-		.tft_alt_mode           = 0,
-		.sync_edge              = 0,
-		.sync_ctrl              = 1,
-		.raster_order           = 0,
-};
-
 static
 struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 						    struct drm_encoder *encoder)
@@ -55,8 +43,6 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
-	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_default);
-
 	priv->external_connector =
 		tilcdc_encoder_find_connector(ddev, priv->external_encoder);
 	if (!priv->external_connector)

-- 
2.43.0

