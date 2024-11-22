Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236879D650D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 21:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7596A10EC86;
	Fri, 22 Nov 2024 20:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EWqIbuzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524C10EC86
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 20:59:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id
 41be03b00d2f7-7f43259d220so1984015a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 12:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732309183; x=1732913983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tAdY527GqF5ChDh40KFzpEb8zefoEymDwxWPv4d4B4Q=;
 b=EWqIbuzV64HNepIhfb/PpC1Pm09QQXz2Gafg1aeJgL5L4i/PC+rGaat8SIxRXtIq+V
 HG7cPmNmWi41G3ZBeA1g/x8Y338L+yoSN1NYiPpKcLdIXrzzi7WBx9tP19Xj/iDoE7Rb
 IqEgPtPOpIxahh9Av9iYV3o1bGDamDqMSCAa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732309183; x=1732913983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAdY527GqF5ChDh40KFzpEb8zefoEymDwxWPv4d4B4Q=;
 b=xFuTWK7HsX8yqkdKzR+RpbPpadAzD7eke/wYaeI6rZ7VObPJany8qiBKxKqAprYWG9
 wyFEKaGvwLNLz5W6ekHl3eJhpbrRxJbpqSubGBoL1/Qjhxd7o9PgFzu3u5aJ1HuQ2JkD
 /sOXPCpAKaYiTDZVopYi1atrPJZ9PTk7qw0ySwFXd4xXDwPFg2y24dmq0H8h/S3R9ALL
 CwlT2a4WWJ1FslErBfWvBp+LRYtPSlCQ6EdCH+0HAO1mTcFd9GV4yiKddyL4K6pRTO8u
 UwdxKmNKk0PSwSKvh7xYADQUJNYV5lDKLKmIuDoCwvH1jzOCNYIKviyO/ZBu8zUbDeOm
 ySMA==
X-Gm-Message-State: AOJu0YwLdvCEAhUDC0e0a+8lh4Dl4Gz7DoaLNUcS5SDKLuCZSkVDi3eA
 elyZdevYBwRBb5u/g9jDW9aiXG9KYkovPsjRtGqYdsjBfq0oKKNzmqh4QWq5Mxo8egNx9p5GamY
 0Z56I0Ndd0XJHqinCmFGLkwCeey+arJbsvvOelWGlglPdThXLw9MWHo4OEpsECwQxiAjJU2iiuL
 Jerhle6UPQKW+vB4/MWdx1I+KoRAZhcAgDNEObVcfxHzPa+5QCyf705mk=
X-Gm-Gg: ASbGnctTYLIcx5MOb4QpZS6ANeFcEjqwBqdTAPjsa1HxDBj9w/e1PpKKaMji8dTUD74
 AbCGTiRc76UjwTfUlNw1PaqldiUDpkGbc2e8hX3tnRKfJpS94ILDjmPUt632WmmZTZryrNUd1Qr
 sD5TFkLeDWJvGqtOxA4dy/3GOM5rZG7/wxHAgCW1GGnmgYD2jpnMr6Oouxp8rQfNpPCqHx+ttDW
 775XbtF7hBDdr+j3zgsXtWw+amT/Dt7IYp3271Ylz6DeLHXusEqe8OiAcbZTMMgKwIi72VJQmUv
 fQ+46+elniN2SRIcUAb5XgWvUw==
X-Google-Smtp-Source: AGHT+IEplh2sf7t9jR3r84bOakakwmEl1vx8ibBNnLSlgjxxWSC1ifEbQ2t/WZI3qtKuRGu+zOUOSA==
X-Received: by 2002:a05:6a21:999a:b0:1d9:1045:3ed5 with SMTP id
 adf61e73a8af0-1e09e3efcd2mr6431580637.11.1732309182482; 
 Fri, 22 Nov 2024 12:59:42 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de478847sm2066926b3a.48.2024.11.22.12.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 12:59:42 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH v2] drm/vmwgfx: Add Fake EDID
Date: Fri, 22 Nov 2024 14:59:33 -0600
Message-Id: <20241122205933.735972-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Most compositors are using a change in EDID as an indicator to
refresh their connector information on hotplug regardless of whether the
connector was previously connected. Originally the hotplug_mode_update
property, introduced in commit 4695b03970df
("qxl: add a connector property to denote hotplug should rescan modes."),
was supposed to provide a hint to userspace to always refresh
connector info on hotplug as virtual devices such as vmwgfx and QXL
changed the connector without disconnecting it first. This was done to
implement Autofit. Unfortunately hotplug_mode_update was not widely
adopted and compositors used other heuristics to determine whether to
refresh the connector info.

Currently a change in EDID is the one heuristic that seems to be universal.
No compositors currently implement hotplug_mode_update correctly or at all.
By implementing a fake EDID blob we can ensure that our EDID changes on
hotplug and therefore userspace will refresh the connector info so that
Autofit will work consistently. This is the approach that virtio takes.

This also removes the need to add hotplug_mode_update support for all
compositors as traditionally this niche feature has fallen on
virtualized driver developers to implement.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
v2:
 - Use drm_edid_read_custom and struct drm_edid
 - Use DRM_EDID defines where possible
 - Add edid property to Legacy DU and Screen Object DU
 - memset the detailed timings since we no longer control the allocation


 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 192 +++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +-
 4 files changed, 195 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 5a1192496d49..64135cd2302e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2662,6 +2662,189 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+/*
+ * Average pixels per millimeter and centimeter for a circa 2020 display
+ */
+#define VMW_FAKE_PPMM 4
+#define VMW_FAKE_PPCM 40
+
+static void vmw_mode_to_timing(const struct drm_display_mode *mode,
+			       struct detailed_timing *timing)
+{
+	struct detailed_pixel_timing *dpt = &timing->data.pixel_data;
+
+	const u8 hblank = (mode->htotal - mode->hdisplay);
+	const u8 hfront = (mode->hsync_start - mode->hdisplay);
+	const u8 hsync  = (mode->hsync_end - mode->hsync_start);
+
+	const u8 vblank = (mode->vtotal - mode->vdisplay);
+	const u8 vfront = (mode->vsync_start - mode->vdisplay);
+	const u8 vsync  = (mode->vsync_end - mode->vsync_start);
+
+	const unsigned int wmm = mode->hdisplay / VMW_FAKE_PPMM;
+	const unsigned int hmm = mode->vdisplay / VMW_FAKE_PPMM;
+
+	timing->pixel_clock = mode->clock / 10;
+	memset(dpt, 0, sizeof(*dpt));
+
+	// horizontal
+	dpt->hactive_lo = mode->hdisplay & 0xFF;
+	dpt->hblank_lo = hblank & 0xFF;
+
+	dpt->hactive_hblank_hi |= (mode->hdisplay >> 4) & 0xF0;
+	dpt->hactive_hblank_hi |= (hblank >> 8) & 0x0F;
+
+	dpt->hsync_offset_lo      = hfront & 0xFF;
+	dpt->hsync_pulse_width_lo =  hsync & 0xFF;
+
+	dpt->hsync_vsync_offset_pulse_width_hi |= (hfront >> 2) & 0xC0;
+	dpt->hsync_vsync_offset_pulse_width_hi |= (hsync  >> 4) & 0x30;
+
+	// vertical
+	dpt->vactive_lo = mode->vdisplay & 0xFF;
+	dpt->vactive_vblank_hi |= (mode->vdisplay >> 4) & 0xF0;
+
+	dpt->vblank_lo = vblank & 0xFF;
+	dpt->vactive_vblank_hi |= (vblank >> 8) & 0x0F;
+
+	dpt->vsync_offset_pulse_width_lo |= (vfront & 0x0F) << 4;
+	dpt->vsync_offset_pulse_width_lo |= (vsync  & 0x0F) << 0;
+
+	dpt->hsync_vsync_offset_pulse_width_hi |= (vfront >> 4) & 0x0C;
+	dpt->hsync_vsync_offset_pulse_width_hi |= (vsync  >> 8) & 0x03;
+
+	// physical sizes
+	dpt->width_mm_lo  = wmm & 0xFF;
+	dpt->height_mm_lo = hmm & 0xFF;
+	dpt->width_height_mm_hi |= (wmm >> 4) & 0xF0;
+	dpt->width_height_mm_hi |= (hmm >> 8) & 0x0F;
+
+	dpt->hborder = 0;
+	dpt->vborder = 0;
+	dpt->misc |= 0x18;
+	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0x2 : 0;
+	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0x4 : 0;
+}
+
+/* Our encoded Plug & Play ID
+ * See: https://uefi.org/PNP_ACPI_Registry and https://uefi.org/PNP_ID_List
+ */
+static inline __be16 vmw_pnp_id(void)
+{
+	return cpu_to_be16((('V' - '@') << 10) |
+			   (('M' - '@') <<  5) |
+			   (('W' - '@') <<  0));
+}
+
+// For use with drm_edid_read_custom
+struct vmw_edid_read_custom_ctx {
+	struct drm_display_mode *pref_mode;
+	unsigned int unit; // display unit id
+};
+
+/*
+ * Fills in the fake EDID using the preferred mode.
+ * The signature must match the drm_edid_read_custom callback.
+ * Only supports the EDID base block. No extensions.
+ * See 'Vesa Enhanced EDID Standard Release A Revision 2' and
+ * 'VESA DMT Standard Version 1.0 Revision 13'.
+ */
+static
+int vmw_fill_fake_edid(void *context, u8 *buf, unsigned int block, size_t len)
+{
+	int checksum = 0;
+	struct edid *e = (struct edid *)buf;
+	const struct vmw_edid_read_custom_ctx *ctx = context;
+
+	if (block != 0)
+		return -ENOENT;
+	if (len != EDID_LENGTH)
+		return -EINVAL;
+
+	e->header[0] = 0;
+	memset(e->header + 1, 0xFF, 6);
+	e->header[7] = 0;
+
+	e->product_id.manufacturer_name = vmw_pnp_id();
+	e->mfg_year = 32; // 2022
+	e->mfg_week = 32;
+
+	e->prod_code[0] = 'V';
+	e->prod_code[1] = 'M';
+	e->serial = 0xABC0 | ctx->unit;
+
+	e->version = 1;
+	e->revision = 4;
+
+	e->input = DRM_EDID_INPUT_DIGITAL | DRM_EDID_DIGITAL_DEPTH_8;
+	e->width_cm = DIV_ROUND_CLOSEST(ctx->pref_mode->hdisplay, VMW_FAKE_PPCM);
+	e->height_cm = DIV_ROUND_CLOSEST(ctx->pref_mode->vdisplay, VMW_FAKE_PPCM);
+	e->gamma = 120; // 2.20
+	e->features = DRM_EDID_FEATURE_STANDARD_COLOR |
+			DRM_EDID_FEATURE_PREFERRED_TIMING |
+			DRM_EDID_FEATURE_RGB |
+			DRM_EDID_FEATURE_PM_ACTIVE_OFF;
+
+	// Standard sRGB color space
+	e->red_green_lo = 0xEE;
+	e->blue_white_lo = 0x91;
+	e->red_x = 0xA3;
+	e->red_y = 0x54;
+	e->green_x = 0x4C;
+	e->green_y = 0x99;
+	e->blue_x  = 0x26;
+	e->blue_y  = 0x0F;
+	e->white_x = 0x50;
+	e->white_y = 0x54;
+
+	e->established_timings.t1 = 0x21;
+	e->established_timings.t2 = 0x08;
+
+	e->standard_timings[0].hsize = 0x81;
+	e->standard_timings[0].vfreq_aspect =  0xC0; // 720p60
+
+	e->standard_timings[1].hsize = 0xD1;
+	e->standard_timings[1].vfreq_aspect =  0xC0; // 1080p60
+
+	e->standard_timings[2].hsize = 0x81;
+	e->standard_timings[2].vfreq_aspect =  0x80; // 1280x1024@60
+
+	e->standard_timings[3].hsize = 0xD1;
+	e->standard_timings[3].vfreq_aspect =  0x40; // 1920x1440@60
+
+	e->standard_timings[4].hsize = 0xE1;
+	e->standard_timings[4].vfreq_aspect =  0xC0; // 2048x1152@60
+
+	e->standard_timings[5].hsize = 0xA9;
+	e->standard_timings[5].vfreq_aspect =  0x40; // 1600x1200@60
+
+	e->standard_timings[6].hsize = 0xB3;
+	e->standard_timings[6].vfreq_aspect =  0x00; // 2048x1152@60
+
+	e->standard_timings[7].hsize = 0x95;
+	e->standard_timings[7].vfreq_aspect =  0x00; // 1440x900@60
+
+	// This is the preferred/native mode
+	vmw_mode_to_timing(ctx->pref_mode, &e->detailed_timings[0]);
+
+	memset(&e->detailed_timings[1], 0, 3 * sizeof(struct detailed_timing));
+
+	e->detailed_timings[1].data.other_data.type = EDID_DETAIL_MONITOR_NAME;
+	memcpy(e->detailed_timings[1].data.other_data.data.str.str,
+	       "VMware Screen", 13);
+
+	e->detailed_timings[2].data.other_data.type = 0x10;
+	e->detailed_timings[3].data.other_data.type = 0x10;
+
+	e->extensions = 0;
+
+	for (int i = 0; i < sizeof(struct edid) - 1; i++)
+		checksum += ((u8 *)e)[i];
+
+	e->checksum = 0x100 - checksum;
+	return 0;
+}
+
 /*
  * Common modes not present in the VESA DMT standard or assigned a VIC.
  */
@@ -2685,6 +2868,8 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct drm_display_mode *mode = NULL;
+	const  struct drm_edid *fake_edid;
+	struct vmw_edid_read_custom_ctx ctx;
 	u32 max_width;
 	u32 max_height;
 	u32 num_modes = 0;
@@ -2700,6 +2885,13 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 	num_modes++;
 	drm_dbg_kms(dev, "preferred mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
+	// update EDID
+	ctx.pref_mode = mode;
+	ctx.unit = du->unit;
+	fake_edid = drm_edid_read_custom(connector, vmw_fill_fake_edid, &ctx);
+	drm_edid_connector_update(connector, fake_edid);
+	drm_edid_free(fake_edid);
+
 	/* Probe connector for all modes not exceeding our geom limits */
 	max_width  = dev_priv->texture_max_width;
 	max_height = dev_priv->texture_max_height;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 39949e0a493f..e6496e372993 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -516,6 +516,7 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+	drm_connector_attach_edid_property(connector);
 	if (dev_priv->implicit_placement_property)
 		drm_object_attach_property
 			(&connector->base,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 0f4bfd98480a..50c3d0ca4767 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -905,7 +905,7 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
-
+	drm_connector_attach_edid_property(connector);
 	vmw_du_init(&sou->base);
 
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 82d18b88f4a7..f7b2dbe4ef5b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1630,7 +1630,7 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
-
+	drm_connector_attach_edid_property(connector);
 	vmw_du_init(&stdu->base);
 
 	return 0;
-- 
2.34.1

