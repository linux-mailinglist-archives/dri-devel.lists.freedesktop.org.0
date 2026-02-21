Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI9kNlZbmWkCTAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C616C59C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8843310E16C;
	Sat, 21 Feb 2026 07:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbxGG5+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2D10E16C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 07:14:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso30290405ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 23:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771658068; x=1772262868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKE3IFB+wicfYDcwffAaecPkvUgml/b3Mzv5tG2Eo94=;
 b=gbxGG5+kXMXRsAgZ4AS6VkD+Q1V+6003N8uuf/UA5KSyypIFZCiXAKjryvzLnMIQsz
 MOdV9EZdgeyKD+O58HPCoGoyOi2xMJPxJiQZhQdL3mANajeaH9OQt9Ja2UhsaGPJly//
 jGKm374J6v1Skw25fNEQ+FGEkbsA8yYKT6aRQjawKvl92u7gbE7zj6n+f4byhU9HaV5q
 ANT/OEe5CayQvBsxeRjkuNr9Ke64UcxjjyHhH1rSlq0OroLjEEUPldmzHIxLlgyGv7da
 8+mmZQI46nOWzWvm0GIdJJZanjE4jse8aT67xEx++sHA0nLKWBeYYWnbGfK8k0Mg9s0/
 mUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771658068; x=1772262868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QKE3IFB+wicfYDcwffAaecPkvUgml/b3Mzv5tG2Eo94=;
 b=P/MVJhKLwlzWDE2IlhWEg775Ng2iapfh9rVI1KjdqgCa48JsocuYHVqfhLJtcECotY
 fu4oYjsOdTsmYvizELRSEAHEexdWcoSC55OLm+ApPMeFHdoSBdpu5ivNb+BtBT5JqQHY
 4l2194vij60a54j3XVQZ6ad2M+mZwSWnb8PNFUgLwE93AMuJoFl42s8jMWFxfgM3Rbuo
 Un1Ysx21a0WeQYMypmh+ucdYO/tKSzplGUvtX+X0OSGFpfuUrvQArq/RJD6OfgDWzUlx
 sQqpDAQhdp554KxVKy7quqsSv0ZtCAsPyG8T5UpsAZZQNQlxGk19hMp5pZikjRFUj1Eh
 S8NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOtazN2lLFBFV3CVuiXNpTQYexapCbgivW1grHZIuEDNrD5/hqRD+V8DBulMY+rq6OnAytsS+IosE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYafJGr2Qz5ARA2n8a3krOAiQWQCbQqx3DNJKirzmTNzfXfrEp
 KhmiuVBplo7lTnXCmC3d8gdaYSzFPLW1lxzS/lEA67ZhpHAic9QDyfon
X-Gm-Gg: AZuq6aKSBHHMJS1oQY1GWt20LuKK4Fp68Zh7MscSrein8OmlWM03DqEvStZVVnXDyWI
 tT7YqcyyKASf2jCMdQaw2I5q2eRtY9i+QRYNt7GnhaDQEN0Vwy2/63xsznEDyb5qs4imVDYOHZB
 yCelATyoBAjIJOM5BbnyD6dhgZ5yffrp3p6+4piU9aQF09iDPf4KWPB9KBHB1oCl0Iuqb/7TqIb
 wx7xV07WIABa46NguF2ECa1GlPSpVgVgn5msjSh/fc8E/tBZjYN2QuJEe2/5zkdFvDP0ML1j9mN
 3W4AJvt+S1o51JnQlkn4Kyq6tyOA1//uBXgvESxwQpw4ckNDpc49Z6z8tzGQv7icVxNdY/+BK75
 y4xClSQy0cQJRfbCCeWSxSSLwbSflTcaZOSE45x6gCrrFF78VnHub2QQBLMj0kQHk8fcIZwf1VO
 HkzXfAyzgP3DgUgYBzdxl/yzRj9FmLfUjzWCpfeoDSog==
X-Received: by 2002:a17:903:246:b0:2aa:d39c:d68 with SMTP id
 d9443c01a7336-2ad744ec56fmr21821575ad.29.1771658067641; 
 Fri, 20 Feb 2026 23:14:27 -0800 (PST)
Received: from debian.ari ([152.58.178.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e2a7sm12657355ad.46.2026.02.20.23.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 23:14:27 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: sebastian.reichel@collabora.com, gerald.loacker@wolfvision.net,
 michael.riesch@collabora.com, miquel.raynal@bootlin.com, wens@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, architanant5@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 3/3] drm/panel: sitronix-st7789v: add standalone
 tinydrm support
Date: Sat, 21 Feb 2026 12:43:51 +0530
Message-Id: <20260221071351.22772-4-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260221071351.22772-1-architanant5@gmail.com>
References: <20260221071351.22772-1-architanant5@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3D2C616C59C
X-Rspamd-Action: no action

The current panel-sitronix-st7789v driver functions only as a DRM
panel, requiring an external display controller to operate. However,
the majority of ST7789V displays in the hobbyist ecosystem are used as
standalone screens connected via 8-bit SPI.

Building on the mipi_dbi conversion in the previous patches, this commit
introduces drm_simple_display_pipe support. This allows the driver to
register as a full-featured DRM device (tinydrm) when a master display
controller is not present, effectively providing a modern replacement
for the legacy staging fbtft driver.

Additionally, this patch ports support for the HannStar HSD20-IPS panel
from the staging driver. This is implemented via a new 'is_ips' flag in
the panel info structure, which selects the optimized PORCTRL and GCTRL
settings required by that specific glass panel.

This hybrid architecture ensures the driver is suitable for both
high-performance SoC RGB interfaces and simple SPI-based embedded
systems.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 153 +++++++++++++++---
 1 file changed, 127 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index b77e616f2994..a07568edc701 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -12,9 +12,14 @@
 #include <video/mipi_display.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_modes.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
 #define ST7789V_RAMCTRL_CMD		0xb0
@@ -107,7 +112,8 @@
 
 #define ST7789V_TEST(val, func)			\
 	do {					\
-		if ((val = (func)))		\
+		val = (func);		\
+		if (val)		\
 			return val;		\
 	} while (0)
 
@@ -120,13 +126,14 @@ struct st7789_panel_info {
 	u32 bus_flags;
 	bool invert_mode;
 	bool partial_mode;
+	bool is_ips;
 	u16 partial_start;
 	u16 partial_end;
 };
 
 struct st7789v {
 	struct drm_panel panel;
-	struct mipi_dbi dbi;
+	struct mipi_dbi_dev dbidev;
 	const struct st7789_panel_info *info;
 	struct spi_device *spi;
 	struct regulator *power;
@@ -154,7 +161,7 @@ static int st7789v_check_id(struct drm_panel *panel)
 	if (ctx->spi->mode & SPI_NO_RX)
 		return 0;
 
-	ret = mipi_dbi_command_stackbuf(&ctx->dbi, MIPI_DCS_GET_DISPLAY_ID,
+	ret = mipi_dbi_command_stackbuf(&ctx->dbidev.dbi, MIPI_DCS_GET_DISPLAY_ID,
 					ids, sizeof(ids));
 	if (ret)
 		return ret;
@@ -237,6 +244,14 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
+/*
+ * The HSD20_IPS panel is used in SPI mode via the staging driver.
+ * Timings are handled internally by the controller configuration.
+ */
+static const struct drm_display_mode hsd20_ips_mode = {
+	DRM_SIMPLE_MODE(240, 320, 31, 41),
+};
+
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
@@ -272,6 +287,14 @@ static const struct st7789_panel_info jt240mhqs_hwt_ek_e3_panel = {
 	.partial_end = 318,
 };
 
+static const struct st7789_panel_info hsd20_ips_panel = {
+	.mode = &hsd20_ips_mode,
+	.invert_mode = true,
+	.is_ips = true,
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -317,7 +340,7 @@ static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
-	struct mipi_dbi *dbi = &ctx->dbi;
+	struct mipi_dbi *dbi = &ctx->dbidev.dbi;
 	u8 mode, pixel_fmt, polarity;
 	int ret;
 
@@ -355,7 +378,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	mipi_dbi_hw_reset(&ctx->dbi);
+	mipi_dbi_hw_reset(&ctx->dbidev.dbi);
 
 	/*
 	 * Avoid failing if the IDs are invalid in case the Rx bus width
@@ -372,15 +395,24 @@ static int st7789v_prepare(struct drm_panel *panel)
 
 	ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0));
 	ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, pixel_fmt));
-	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PORCTRL_CMD, 0xc, 0xc, 0,
-					   ST7789V_PORCTRL_IDLE_BP(3) |
-					   ST7789V_PORCTRL_IDLE_FP(3),
-					   ST7789V_PORCTRL_PARTIAL_BP(3) |
-					   ST7789V_PORCTRL_PARTIAL_FP(3)));
-
-	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_GCTRL_CMD,
-					   ST7789V_GCTRL_VGLS(5) |
-					   ST7789V_GCTRL_VGHS(3)));
+
+	if (ctx->info->is_ips) {
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PORCTRL_CMD,
+						0x05, 0x05, 0x00, 0x33, 0x33));
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_GCTRL_CMD,
+						0x75));
+	} else {
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_PORCTRL_CMD, 0xc, 0xc, 0,
+						ST7789V_PORCTRL_IDLE_BP(3) |
+						ST7789V_PORCTRL_IDLE_FP(3),
+						ST7789V_PORCTRL_PARTIAL_BP(3) |
+						ST7789V_PORCTRL_PARTIAL_FP(3)));
+
+		ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_GCTRL_CMD,
+						ST7789V_GCTRL_VGLS(5) |
+						ST7789V_GCTRL_VGHS(3)));
+	}
+
 	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_VCOMS_CMD, 0x2b));
 
 	ST7789V_TEST(ret, mipi_dbi_command(dbi, ST7789V_LCMCTRL_CMD,
@@ -436,11 +468,10 @@ static int st7789v_prepare(struct drm_panel *panel)
 					   ST7789V_NVGAMCTRL_VN61(0x1b),
 					   ST7789V_NVGAMCTRL_VN62(0x28)));
 
-	if (ctx->info->invert_mode) {
+	if (ctx->info->invert_mode)
 		ST7789V_TEST(ret, mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE));
-	} else {
+	else
 		ST7789V_TEST(ret, mipi_dbi_command(dbi,	MIPI_DCS_EXIT_INVERT_MODE));
-	}
 
 	if (ctx->info->partial_mode) {
 		u8 area_data[4] = {
@@ -484,7 +515,7 @@ static int st7789v_enable(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
 
-	return mipi_dbi_command(&ctx->dbi, MIPI_DCS_SET_DISPLAY_ON);
+	return mipi_dbi_command(&ctx->dbidev.dbi, MIPI_DCS_SET_DISPLAY_ON);
 }
 
 static int st7789v_disable(struct drm_panel *panel)
@@ -492,7 +523,7 @@ static int st7789v_disable(struct drm_panel *panel)
 	struct st7789v *ctx = panel_to_st7789v(panel);
 	int ret;
 
-	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbi, MIPI_DCS_SET_DISPLAY_OFF));
+	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbidev.dbi, MIPI_DCS_SET_DISPLAY_OFF));
 
 	return 0;
 }
@@ -502,7 +533,7 @@ static int st7789v_unprepare(struct drm_panel *panel)
 	struct st7789v *ctx = panel_to_st7789v(panel);
 	int ret;
 
-	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbi, MIPI_DCS_ENTER_SLEEP_MODE));
+	ST7789V_TEST(ret, mipi_dbi_command(&ctx->dbidev.dbi, MIPI_DCS_ENTER_SLEEP_MODE));
 
 	regulator_disable(ctx->power);
 
@@ -518,6 +549,52 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 	.unprepare = st7789v_unprepare,
 };
 
+static void st7789v_pipe_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *crtc_state,
+				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct st7789v *ctx = container_of(dbidev, struct st7789v, dbidev);
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	ret = st7789v_prepare(&ctx->panel);
+	if (ret)
+		goto out;
+
+	ret = st7789v_enable(&ctx->panel);
+	if (ret)
+		goto out_unprepare;
+
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+	goto out;
+
+out_unprepare:
+	st7789v_unprepare(&ctx->panel);
+out:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7789v_pipe_funcs = {
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7789v_pipe_enable),
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7789v_fops);
+
+static const struct drm_driver st7789v_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops = &st7789v_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+	.debugfs_init = mipi_dbi_debugfs_init,
+	.name = "st7789v",
+	.desc = "Sitronix ST7789V",
+	.major = 1,
+	.minor = 0,
+};
+
 static int st7789v_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -525,10 +602,11 @@ static int st7789v_probe(struct spi_device *spi)
 	struct gpio_desc *dc;
 	int ret;
 
-	ctx = devm_drm_panel_alloc(dev, struct st7789v, panel,
-				   &st7789v_drm_funcs, DRM_MODE_CONNECTOR_DPI);
+	ctx = devm_drm_dev_alloc(dev, &st7789v_drm_driver, struct st7789v,
+				dbidev.drm);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
+	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs, DRM_MODE_CONNECTOR_DPI);
 
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
@@ -540,8 +618,8 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulator\n");
 
-	ctx->dbi.reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	ret = PTR_ERR_OR_ZERO(ctx->dbi.reset);
+	ctx->dbidev.dbi.reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(ctx->dbidev.dbi.reset);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get reset line\n");
 
@@ -558,12 +636,31 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(&spi->dev, ret, "Failed to get orientation\n");
 
-	ret = mipi_dbi_spi_init(spi, &ctx->dbi, dc);
+	ret = mipi_dbi_spi_init(spi, &ctx->dbidev.dbi, dc);
 	if (ret)
 		return dev_err_probe(&spi->dev, ret, "Failed to init MIPI DBI\n");
 
 	drm_panel_add(&ctx->panel);
 
+	ctx->dbidev.dbi.invert_reset = true;
+
+	ret = mipi_dbi_dev_init(&ctx->dbidev, &st7789v_pipe_funcs, ctx->info->mode,
+				ctx->orientation);
+	if (ret) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	drm_mode_config_reset(&ctx->dbidev.drm);
+
+	ret = drm_dev_register(&ctx->dbidev.drm, 0);
+
+	if (ret) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+	drm_client_setup(&ctx->dbidev.drm, NULL);
+
 	return 0;
 }
 
@@ -571,6 +668,8 @@ static void st7789v_remove(struct spi_device *spi)
 {
 	struct st7789v *ctx = spi_get_drvdata(spi);
 
+	drm_dev_unplug(&ctx->dbidev.drm);
+	drm_atomic_helper_shutdown(&ctx->dbidev.drm);
 	drm_panel_remove(&ctx->panel);
 }
 
@@ -579,6 +678,7 @@ static const struct spi_device_id st7789v_spi_id[] = {
 	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
 	{ "et028013dma", (unsigned long) &et028013dma_panel },
 	{ "jt240mhqs-hwt-ek-e3", (unsigned long) &jt240mhqs_hwt_ek_e3_panel },
+	{ "hsd20-ips", (unsigned long) &hsd20_ips_panel},
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
@@ -589,6 +689,7 @@ static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "edt,et028013dma", .data = &et028013dma_panel },
 	{ .compatible = "jasonic,jt240mhqs-hwt-ek-e3",
 	  .data = &jt240mhqs_hwt_ek_e3_panel },
+	{ .compatible = "hannstar,hsd20-ips", .data = &hsd20_ips_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
-- 
2.39.5

