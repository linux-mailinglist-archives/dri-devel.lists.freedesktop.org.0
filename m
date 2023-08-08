Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800547736E8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 04:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C375E10E391;
	Tue,  8 Aug 2023 02:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790B310E395
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 02:43:42 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686daaa5f1fso3528103b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 19:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691462622; x=1692067422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2RLLbvfI1Ef5R0ybJCdH8zplR5QISUkXktB1IOKLp8=;
 b=DBqCvcnSS+NSpNKiTtJ/Q+Pm8SxfJUvOotx7o5FZJn962SWMr3/5Dhhekl19OYSxod
 wBMs7iRuNfcC+BDC8tf4GauQeGkopYZs7MCklyDiPuFumb5c6gBI27LiyK6642pW7Ond
 EohDSeFuYdeOhC1JMZOHR+t3CkiB+feTE+Jls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691462622; x=1692067422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2RLLbvfI1Ef5R0ybJCdH8zplR5QISUkXktB1IOKLp8=;
 b=MIMNz8OBRU5Ko8544QMGGOkmvj34R2mBNz5mhc62xOVELBiBsLLtYijfhFn8zY93m1
 Oqk9twjsAC/oI7kV6jIVy1EiLz/5szf+lDzdiYoZ09DXuhGy0WCA+lIXGhq2oIMvIpTz
 S8NpjnJp2Xle31tnt8Yeh4FbCfBwcfpEW7oBi0HIOtZaIct28CaIV5hJhcllaKWvw02g
 gSKWLW78r04a2+N6hJLmdEiwFnzpRkky4SfDTC6Tlqtx+otL78OdQxSMZ4iREjIq9FKR
 29IL//kYBk6e8ynHDooK84GGCm3crE0OFFK2yI68LgWk6CZiYlcV/6Qe2OBRp1T9Cd1A
 7srg==
X-Gm-Message-State: AOJu0Ywspjoy7mFetcHMFPPt/CGQL7Vl/Aobe4Wj7xql0xX0XYXSfWlX
 C6bx9xxMcYIsWkomXas3uNt1Gw==
X-Google-Smtp-Source: AGHT+IG4sObAgsZWrBlk/z4MQYZhbEtd5czlN5Xd3UbAN0hY4eUG1s3EcPzVICx4wOLmVHH88Cc6rg==
X-Received: by 2002:a05:6a20:d402:b0:131:4808:d5a1 with SMTP id
 il2-20020a056a20d40200b001314808d5a1mr9091088pzb.28.1691462621477; 
 Mon, 07 Aug 2023 19:43:41 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 p23-20020aa78617000000b00662610cf7a8sm7063479pfn.172.2023.08.07.19.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:43:41 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: jshargo@chromium.org
Subject: [PATCH] Initial backport of vkms changes from 6.4,
 including jshargo and brpols configs changes
Date: Tue,  8 Aug 2023 02:42:34 +0000
Message-ID: <20230808024313.2220391-3-brpol@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 mripard@kernel.org, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WIP: Need to run all tast criticals and test the multidisplay tests that
are WIP.

BUG=b:283357160
TEST=Booted on a betty-arc-r device and ran autologin.py -a
Change-Id: I13cef8cf019744813f51cfffed3d7ccb987834e8

Change-Id: Iae7d788bc4725dfdca044204fa1af27a5a1ec5a8
---
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  74 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 719 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      |  98 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 227 ++++----
 drivers/gpu/drm/vkms/vkms_drv.h       | 191 +++++--
 drivers/gpu/drm/vkms/vkms_formats.c   | 298 +++++------
 drivers/gpu/drm/vkms/vkms_formats.h   |   4 +-
 drivers/gpu/drm/vkms/vkms_output.c    | 351 +++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     | 102 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  33 +-
 include/drm/drm_fixed.h               |   7 +
 12 files changed, 1638 insertions(+), 467 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..6b83907ad554 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 vkms-y := \
+	vkms_configfs.o \
 	vkms_drv.o \
 	vkms_plane.o \
 	vkms_output.o \
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8e53fa80742b..61061a277fca 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
@@ -22,7 +23,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @src_frame_info: source framebuffer's metadata
+ * @frame_info: Source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
  *
@@ -53,10 +54,30 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	}
 }
 
-static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
+static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 {
-	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
-		return true;
+	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
+		return drm_rect_height(&frame_info->rotated) - y - 1;
+
+	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+		return frame_info->rotated.x2 - y - 1;
+	case DRM_MODE_ROTATE_270:
+		return y + frame_info->rotated.x1;
+	default:
+		return y;
+	}
+}
+
+static bool check_limit(struct vkms_frame_info *frame_info, int pos)
+{
+	if (drm_rotation_90_or_270(frame_info->rotation)) {
+		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
+			return true;
+	} else {
+		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
+			return true;
+	}
 
 	return false;
 }
@@ -69,11 +90,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 /**
- * @wb_frame_info: The writeback frame buffer metadata
+ * blend - blend the pixels from all planes and compute crc
+ * @wb: The writeback frame buffer metadata
  * @crtc_state: The crtc state
  * @crc32: The crc output of the final frame
  * @output_buffer: A buffer of a row that will receive the result of the blend(s)
  * @stage_buffer: The line with the pixels from plane being blend to the output
+ * @row_size: The size, in bytes, of a single row
  *
  * This function blends the pixels (Using the `pre_mul_alpha_blend`)
  * from all planes, calculates the crc32 of the output from the former step,
@@ -86,6 +109,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
+	int y_pos;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -96,10 +120,12 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			if (!check_y_limit(plane[i]->frame_info, y))
+			y_pos = get_y_pos(plane[i]->frame_info, y);
+
+			if (!check_limit(plane[i]->frame_info, y_pos))
 				continue;
 
-			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
+			vkms_compose_row(stage_buffer, plane[i], y_pos);
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
@@ -107,7 +133,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
+			vkms_writeback_row(wb, output_buffer, y_pos);
 	}
 }
 
@@ -118,10 +144,10 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	u32 n_active_planes = crtc_state->num_active_planes;
 
 	for (size_t i = 0; i < n_active_planes; i++)
-		if (!planes[i]->plane_read)
+		if (!planes[i]->pixel_read)
 			return -1;
 
-	if (active_wb && !active_wb->wb_write)
+	if (active_wb && !active_wb->pixel_write)
 		return -1;
 
 	return 0;
@@ -204,13 +230,13 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	int ret;
 
-	spin_lock_irq(&out->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	frame_start = crtc_state->frame_start;
 	frame_end = crtc_state->frame_end;
 	crc_pending = crtc_state->crc_pending;
@@ -218,7 +244,7 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_start = 0;
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -236,10 +262,10 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
+		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
+		spin_lock_irq(&vkms_crtc->composer_lock);
 		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
+		spin_unlock_irq(&vkms_crtc->composer_lock);
 	}
 
 	/*
@@ -289,25 +315,25 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
 {
 	bool old_enabled;
 
 	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+		drm_crtc_vblank_get(&vkms_crtc->base);
 
-	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+	spin_lock_irq(&vkms_crtc->lock);
+	old_enabled = vkms_crtc->composer_enabled;
+	vkms_crtc->composer_enabled = enabled;
+	spin_unlock_irq(&vkms_crtc->lock);
 
 	if (old_enabled)
-		drm_crtc_vblank_put(&out->crtc);
+		drm_crtc_vblank_put(&vkms_crtc->base);
 }
 
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *out = drm_crtc_to_vkms_crtc(crtc);
 	bool enabled = false;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 000000000000..a1ac7716ba1a
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,719 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "drm/drm_probe_helper.h"
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "vkms_drv.h"
+
+/**
+ * DOC: ConfigFS Support for VKMS
+ *
+ * VKMS is instrumented with support for configuration via :doc:`ConfigFS
+ * <../filesystems/configfs>`.
+ *
+ * With VKMS installed, you can mount ConfigFS at ``/config/`` like so::
+ *
+ *   mkdir -p /config/
+ *   sudo mount -t configfs none /config
+ *
+ * This allows you to configure multiple virtual devices in addition to an
+ * immutable "default" device created by the driver at initialization time. Note
+ * that the default device is immutable because we cannot pre-populate ConfigFS
+ * directories with normal files.
+ *
+ * To set up a new device, create a new directory under the VKMS configfs
+ * directory::
+ *
+ *   mkdir /config/vkms/test
+ *
+ * With your device created you'll find an new directory ready to be
+ * configured::
+ *
+ *   /config
+ *   `-- vkms
+ *       |-- default
+ *       |   `-- enabled
+ *       `-- test
+ *           |-- connectors
+ *                `-- connected
+ *           |-- crtcs
+ *           |-- encoders
+ *           |-- planes
+ *           `-- enabled
+ *
+ * Each directory you add within the connectors, crtcs, encoders, and planes
+ * directories will let you configure a new object of that type. Adding new
+ * objects will automatically create a set of default files and folders you can
+ * use to configure that object.
+ *
+ * For instance, we can set up a two-output device like so::
+ *
+ *   DRM_PLANE_TYPE_PRIMARY=1
+ *   DRM_PLANE_TYPE_CURSOR=2
+ *   DRM_PLANE_TYPE_OVERLAY=0
+ *
+ *   mkdir /config/vkms/test/planes/primary
+ *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
+ *
+ *   mkdir /config/vkms/test/planes/other_primary
+ *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
+ *
+ *   mkdir /config/vkms/test/planes/cursor
+ *   echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
+ *
+ *   mkdir /config/vkms/test/planes/overlay
+ *   echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
+ *
+ *   mkdir /config/vkms/test/crtcs/crtc
+ *   mkdir /config/vkms/test/crtcs/crtc_other
+ *   mkdir /config/vkms/test/encoders/encoder
+ *   mkdir /config/vkms/test/connectors/connector
+ *
+ * You can see that specific attributes, such as ``.../<plane>/type``, can be
+ * configured by writing into them. Associating objects together can be done via
+ * symlinks::
+ *
+ *   ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
+ *
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
+ *
+ *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
+ *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
+ *
+ * Finally, to enable your configured device, just write 1 to the ``enabled``
+ * file::
+ *
+ *   echo 1 > /config/vkms/test/enabled
+ *
+ * By default no display is "connected" so to connect a connector you'll also
+ * have to write 1 to a connectors "connected" attribute::
+ *
+ *   echo 1 > /config/vkms/test/connectors/connector/connected
+ *
+ * One can verify that this is worked using the `modetest` utility or the
+ * equivalent for your platform.
+ *
+ * When you're done with the virtual device, you can clean up the device like
+ * so::
+ *
+ *   echo 0 > /config/vkms/test/enabled
+ *
+ *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
+ *   rm /config/vkms/test/encoders/encoder/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/primary/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/cursor/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc
+ *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc_other
+ *   rm /config/vkms/test/planes/other_primary/possible_crtcs/crtc_other
+ *
+ *   rmdir /config/vkms/test/planes/primary
+ *   rmdir /config/vkms/test/planes/other_primary
+ *   rmdir /config/vkms/test/planes/cursor
+ *   rmdir /config/vkms/test/planes/overlay
+ *   rmdir /config/vkms/test/crtcs/crtc
+ *   rmdir /config/vkms/test/crtcs/crtc_other
+ *   rmdir /config/vkms/test/encoders/encoder
+ *   rmdir /config/vkms/test/connectors/connector
+ *
+ *   rmdir /config/vkms/test
+ */
+
+/*
+ * Common helpers (i.e. common sub-groups)
+ */
+
+/* Possible CRTCs, e.g. /config/vkms/device/<object>/possible_crtcs/<symlink> */
+
+static struct config_item_type crtc_type;
+
+static int possible_crtcs_allow_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_crtc *crtc;
+
+	if (target->ci_type != &crtc_type) {
+		DRM_ERROR("Unable to link non-CRTCs.\n");
+		return -EINVAL;
+	}
+
+	crtc = item_to_config_crtc(target);
+
+	if (links->linked_object_bitmap & BIT(crtc->crtc_config_idx)) {
+		DRM_ERROR(
+			"Tried to add two symlinks to the same CRTC from the same object\n");
+		return -EINVAL;
+	}
+
+	links->linked_object_bitmap |= BIT(crtc->crtc_config_idx);
+
+	return 0;
+}
+
+static void possible_crtcs_drop_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_crtc *crtc = item_to_config_crtc(target);
+
+	links->linked_object_bitmap &= ~BIT(crtc->crtc_config_idx);
+}
+
+static struct configfs_item_operations possible_crtcs_item_ops = {
+	.allow_link = &possible_crtcs_allow_link,
+	.drop_link = &possible_crtcs_drop_link,
+};
+
+static struct config_item_type possible_crtcs_group_type = {
+	.ct_item_ops = &possible_crtcs_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static void add_possible_crtcs(struct config_group *parent,
+			       struct config_group *possible_crtcs)
+{
+	config_group_init_type_name(possible_crtcs, "possible_crtcs",
+				    &possible_crtcs_group_type);
+	configfs_add_default_group(possible_crtcs, parent);
+}
+
+/* Possible encoders, e.g. /config/vkms/device/connector/possible_encoders/<symlink> */
+
+static struct config_item_type encoder_type;
+
+static int possible_encoders_allow_link(struct config_item *src,
+					struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_encoder *encoder;
+
+	if (target->ci_type != &encoder_type) {
+		DRM_ERROR("Unable to link non-encoders.\n");
+		return -EINVAL;
+	}
+
+	encoder = item_to_config_encoder(target);
+
+	if (links->linked_object_bitmap & BIT(encoder->encoder_config_idx)) {
+		DRM_ERROR(
+			"Tried to add two symlinks to the same encoder from the same object\n");
+		return -EINVAL;
+	}
+
+	links->linked_object_bitmap |= BIT(encoder->encoder_config_idx);
+
+	return 0;
+}
+
+static void possible_encoders_drop_link(struct config_item *src,
+					struct config_item *target)
+{
+	struct vkms_config_links *links = item_to_config_links(src);
+	struct vkms_config_encoder *encoder = item_to_config_encoder(target);
+
+	links->linked_object_bitmap &= ~BIT(encoder->encoder_config_idx);
+}
+
+static struct configfs_item_operations possible_encoders_item_ops = {
+	.allow_link = &possible_encoders_allow_link,
+	.drop_link = &possible_encoders_drop_link,
+};
+
+static struct config_item_type possible_encoders_group_type = {
+	.ct_item_ops = &possible_encoders_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static void add_possible_encoders(struct config_group *parent,
+				  struct config_group *possible_encoders)
+{
+	config_group_init_type_name(possible_encoders, "possible_encoders",
+				    &possible_encoders_group_type);
+	configfs_add_default_group(possible_encoders, parent);
+}
+
+/*
+ * Individual objects (connectors, crtcs, encoders, planes):
+ */
+
+/*  Connector item, e.g. /config/vkms/device/connectors/ID */
+
+static ssize_t connector_connected_show(struct config_item *item, char *buf)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	struct vkms_configfs *configfs = connector_item_to_configfs(item);
+	bool connected = false;
+
+	mutex_lock(&configfs->lock);
+	connected = connector->connected;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d\n", connected);
+}
+
+static ssize_t connector_connected_store(struct config_item *item,
+					 const char *buf, size_t len)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	struct vkms_configfs *configfs = connector_item_to_configfs(item);
+	int val, ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+	connector->connected = val;
+	if (!connector->connector) {
+		pr_info("VKMS Device %s is not yet enabled, connector will be enabled on start",
+			configfs->device_group.cg_item.ci_name);
+	}
+	mutex_unlock(&configfs->lock);
+
+	if (connector->connector)
+		drm_kms_helper_hotplug_event(connector->connector->dev);
+
+	return len;
+}
+
+CONFIGFS_ATTR(connector_, connected);
+
+static struct configfs_attribute *connector_attrs[] = {
+	&connector_attr_connected,
+	NULL,
+};
+
+static struct config_item_type connector_type = {
+	.ct_attrs = connector_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Crtc item, e.g. /config/vkms/device/crtcs/ID */
+
+static struct config_item_type crtc_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Encoder item, e.g. /config/vkms/device/encoder/ID */
+
+static struct config_item_type encoder_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/*  Plane item, e.g. /config/vkms/device/planes/ID */
+
+static ssize_t plane_type_show(struct config_item *item, char *buf)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	struct vkms_configfs *configfs = plane_item_to_configfs(item);
+	enum drm_plane_type plane_type;
+
+	mutex_lock(&configfs->lock);
+	plane_type = plane->type;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%u\n", plane_type);
+}
+
+static ssize_t plane_type_store(struct config_item *item, const char *buf,
+				size_t len)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	struct vkms_configfs *configfs = plane_item_to_configfs(item);
+	int val, ret;
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != DRM_PLANE_TYPE_PRIMARY && val != DRM_PLANE_TYPE_CURSOR &&
+	    val != DRM_PLANE_TYPE_OVERLAY)
+		return -EINVAL;
+
+	mutex_lock(&configfs->lock);
+	plane->type = val;
+	mutex_unlock(&configfs->lock);
+
+	return len;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
+static struct config_item_type plane_type = {
+	.ct_attrs = plane_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+/*
+ * Directory groups, e.g. /config/vkms/device/{planes, crtcs, ...}
+ */
+
+/* Connectors group: /config/vkms/device/connectors/ */
+
+static struct config_group *connectors_group_make(struct config_group *group,
+						  const char *name)
+{
+	struct vkms_config_connector *connector =
+		kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&connector->config_group, name,
+				    &connector_type);
+	add_possible_encoders(&connector->config_group,
+			      &connector->possible_encoders.group);
+	connector->connected = false;
+
+	return &connector->config_group;
+}
+
+static void connectors_group_drop(struct config_group *group,
+				  struct config_item *item)
+{
+	struct vkms_config_connector *connector =
+		item_to_config_connector(item);
+	kfree(connector);
+}
+
+static struct configfs_group_operations connectors_group_ops = {
+	.make_group = &connectors_group_make,
+	.drop_item = &connectors_group_drop,
+};
+
+static struct config_item_type connectors_group_type = {
+	.ct_group_ops = &connectors_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* CRTCs group: /config/vkms/device/crtcs/ */
+
+static struct config_group *crtcs_group_make(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs *configfs =
+		container_of(group, struct vkms_configfs, crtcs_group);
+	unsigned long next_idx;
+	struct vkms_config_crtc *crtc;
+
+	mutex_lock(&configfs->lock);
+
+	next_idx = find_first_zero_bit(&configfs->allocated_crtcs,
+				       VKMS_MAX_OUTPUT_OBJECTS);
+
+	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
+		DRM_ERROR("Unable to allocate another CRTC.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+	if (!crtc) {
+		DRM_ERROR("Unable to allocate CRTC.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&crtc->config_group, name, &crtc_type);
+	crtc->crtc_config_idx = next_idx;
+
+	set_bit(next_idx, &configfs->allocated_crtcs);
+
+	mutex_unlock(&configfs->lock);
+
+	return &crtc->config_group;
+}
+
+static void crtcs_group_drop(struct config_group *group,
+			     struct config_item *item)
+{
+	struct vkms_config_crtc *crtc = item_to_config_crtc(item);
+	kfree(crtc);
+}
+
+static struct configfs_group_operations crtcs_group_ops = {
+	.make_group = &crtcs_group_make,
+	.drop_item = &crtcs_group_drop,
+};
+
+static struct config_item_type crtcs_group_type = {
+	.ct_group_ops = &crtcs_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Encoders group: /config/vkms/device/encoders/ */
+
+static struct config_group *encoders_group_make(struct config_group *group,
+						const char *name)
+{
+	struct vkms_configfs *configfs =
+		container_of(group, struct vkms_configfs, encoders_group);
+	unsigned long next_idx;
+	struct vkms_config_encoder *encoder;
+
+	mutex_lock(&configfs->lock);
+
+	next_idx = find_first_zero_bit(&configfs->allocated_encoders,
+				       VKMS_MAX_OUTPUT_OBJECTS);
+
+	if (next_idx == VKMS_MAX_OUTPUT_OBJECTS) {
+		DRM_ERROR("Unable to allocate another encoder.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Unable to allocate encoder.\n");
+		mutex_unlock(&configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&encoder->config_group, name,
+				    &encoder_type);
+	add_possible_crtcs(&encoder->config_group,
+			   &encoder->possible_crtcs.group);
+	encoder->encoder_config_idx = next_idx;
+	set_bit(next_idx, &configfs->allocated_encoders);
+
+	mutex_unlock(&configfs->lock);
+
+	return &encoder->config_group;
+}
+
+static void encoders_group_drop(struct config_group *group,
+				struct config_item *item)
+{
+	struct vkms_config_encoder *encoder = item_to_config_encoder(item);
+	kfree(encoder);
+}
+
+static struct configfs_group_operations encoders_group_ops = {
+	.make_group = &encoders_group_make,
+	.drop_item = &encoders_group_drop,
+};
+
+static struct config_item_type encoders_group_type = {
+	.ct_group_ops = &encoders_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Planes group: /config/vkms/device/planes/ */
+
+static struct config_group *make_plane_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_config_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&plane->config_group, name, &plane_type);
+	add_possible_crtcs(&plane->config_group, &plane->possible_crtcs.group);
+
+	return &plane->config_group;
+}
+
+static void drop_plane_group(struct config_group *group,
+			     struct config_item *item)
+{
+	struct vkms_config_plane *plane = item_to_config_plane(item);
+	kfree(plane);
+}
+
+static struct configfs_group_operations plane_group_ops = {
+	.make_group = &make_plane_group,
+	.drop_item = &drop_plane_group,
+};
+
+static struct config_item_type planes_group_type = {
+	.ct_group_ops = &plane_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+/* Root directory group, e.g. /config/vkms/device */
+
+static ssize_t device_enabled_show(struct config_item *item, char *buf)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	bool is_enabled;
+
+	mutex_lock(&configfs->lock);
+	is_enabled = configfs->vkms_device != NULL;
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d\n", is_enabled);
+}
+
+static ssize_t device_enabled_store(struct config_item *item, const char *buf,
+				    size_t len)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	struct vkms_device *device;
+	int enabled, ret;
+
+	ret = kstrtoint(buf, 0, &enabled);
+	if (ret)
+		return ret;
+
+	if (enabled == 0) {
+		mutex_lock(&configfs->lock);
+		if (configfs->vkms_device) {
+			vkms_remove_device(configfs->vkms_device);
+			configfs->vkms_device = NULL;
+		}
+		mutex_unlock(&configfs->lock);
+
+		return len;
+	}
+
+	if (enabled == 1) {
+		mutex_lock(&configfs->lock);
+		if (!configfs->vkms_device) {
+			device = vkms_add_device(configfs);
+			if (IS_ERR(device)) {
+				mutex_unlock(&configfs->lock);
+				return -PTR_ERR(device);
+			}
+
+			configfs->vkms_device = device;
+		}
+		mutex_unlock(&configfs->lock);
+
+		return len;
+	}
+
+	return -EINVAL;
+}
+
+CONFIGFS_ATTR(device_, enabled);
+
+static ssize_t device_id_show(struct config_item *item, char *buf)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+	int id = -1;
+
+	mutex_lock(&configfs->lock);
+	if (configfs->vkms_device) {
+		id = configfs->vkms_device->platform->id;
+	}
+	mutex_unlock(&configfs->lock);
+
+	return sprintf(buf, "%d\n", id);
+}
+
+CONFIGFS_ATTR_RO(device_, id);
+
+static struct configfs_attribute *device_group_attrs[] = {
+	&device_attr_id,
+	&device_attr_enabled,
+	NULL,
+};
+
+static struct config_item_type device_group_type = {
+	.ct_attrs = device_group_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static void vkms_configfs_setup_default_groups(struct vkms_configfs *configfs,
+					       const char *name)
+{
+	config_group_init_type_name(&configfs->device_group, name,
+				    &device_group_type);
+
+	config_group_init_type_name(&configfs->connectors_group, "connectors",
+				    &connectors_group_type);
+	configfs_add_default_group(&configfs->connectors_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
+				    &crtcs_group_type);
+	configfs_add_default_group(&configfs->crtcs_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->encoders_group, "encoders",
+				    &encoders_group_type);
+	configfs_add_default_group(&configfs->encoders_group,
+				   &configfs->device_group);
+
+	config_group_init_type_name(&configfs->planes_group, "planes",
+				    &planes_group_type);
+	configfs_add_default_group(&configfs->planes_group,
+				   &configfs->device_group);
+}
+
+/* Root directory group and subsystem, e.g. /config/vkms/ */
+
+static struct config_group *make_root_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_configfs *configfs = kzalloc(sizeof(*configfs), GFP_KERNEL);
+
+	if (!configfs)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_configfs_setup_default_groups(configfs, name);
+	mutex_init(&configfs->lock);
+
+	return &configfs->device_group;
+}
+
+static void drop_root_group(struct config_group *group,
+			    struct config_item *item)
+{
+	struct vkms_configfs *configfs = item_to_configfs(item);
+
+	mutex_lock(&configfs->lock);
+	if (configfs->vkms_device)
+		vkms_remove_device(configfs->vkms_device);
+	mutex_unlock(&configfs->lock);
+
+	kfree(configfs);
+}
+
+static struct configfs_group_operations root_group_ops = {
+	.make_group = &make_root_group,
+	.drop_item = &drop_root_group,
+};
+
+static struct config_item_type vkms_type = {
+	.ct_group_ops = &root_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &vkms_type,
+		},
+	},
+  .su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_init_configfs(void)
+{
+	config_group_init(&vkms_subsys.su_group);
+	return configfs_register_subsystem(&vkms_subsys);
+}
+
+void vkms_unregister_configfs(void)
+{
+	configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..5ebb5264f6ef 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -11,35 +11,34 @@
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
-						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_crtc *vkms_crtc = timer_to_vkms_crtc(timer);
+	struct drm_crtc *crtc = &vkms_crtc->base;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
 	bool ret, fence_cookie;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
+	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
+					  vkms_crtc->period_ns);
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
+	spin_lock(&vkms_crtc->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
-	state = output->composer_state;
-	spin_unlock(&output->lock);
+	state = vkms_crtc->composer_state;
+	spin_unlock(&vkms_crtc->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && vkms_crtc->composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
 		 * has read the data
 		 */
-		spin_lock(&output->composer_lock);
+		spin_lock(&vkms_crtc->composer_lock);
 		if (!state->crc_pending)
 			state->frame_start = frame;
 		else
@@ -47,9 +46,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 					 state->frame_start, frame);
 		state->frame_end = frame;
 		state->crc_pending = true;
-		spin_unlock(&output->composer_lock);
+		spin_unlock(&vkms_crtc->composer_lock);
 
-		ret = queue_work(output->composer_workq, &state->composer_work);
+		ret = queue_work(vkms_crtc->composer_workq,
+				 &state->composer_work);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
@@ -62,25 +62,27 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function = &vkms_vblank_simulate;
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC,
+		     HRTIMER_MODE_REL);
+	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
+	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns,
+		      HRTIMER_MODE_REL);
 
 	return 0;
 }
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
@@ -88,9 +90,8 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      bool in_vblank_irq)
 {
 	struct drm_device *dev = crtc->dev;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	unsigned int pipe = crtc->index;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -98,7 +99,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -110,7 +111,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -161,7 +162,6 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.set_config             = drm_atomic_helper_set_config,
-	.destroy                = drm_crtc_cleanup,
 	.page_flip              = drm_atomic_helper_page_flip,
 	.reset                  = vkms_atomic_crtc_reset,
 	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
@@ -237,18 +237,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	spin_lock_irq(&vkms_output->lock);
+	spin_lock_irq(&vkms_crtc->lock);
 }
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -263,9 +263,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -276,27 +276,41 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor, const char *name)
 {
-	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_crtc *vkms_crtc;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					&vkms_crtc_funcs, NULL);
+	if (vkmsdev->output.num_crtcs >= VKMS_MAX_OUTPUT_OBJECTS) {
+		return ERR_PTR(-ENOMEM);
+	}
+	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
+
+	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
+					 &vkms_crtc_funcs, name);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
-		return ret;
+		goto out_error;
 	}
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
+	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
 
-	spin_lock_init(&vkms_out->lock);
-	spin_lock_init(&vkms_out->composer_lock);
+	spin_lock_init(&vkms_crtc->lock);
+	spin_lock_init(&vkms_crtc->composer_lock);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
-	if (!vkms_out->composer_workq)
-		return -ENOMEM;
+	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	if (!vkms_crtc->composer_workq) {
+		ret = -ENOMEM;
+		goto out_error;
+	}
+
+	return vkms_crtc;
 
-	return ret;
+out_error:
+	memset(vkms_crtc, 0, sizeof(*vkms_crtc));
+	vkmsdev->output.num_crtcs -= 1;
+	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 69346906ec81..7e1ec7d89dcb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -9,10 +9,15 @@
  * the GPU in DRM API tests.
  */
 
+#include <linux/configfs.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -37,19 +42,26 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static struct vkms_config *default_config;
+static bool enable_default_device = true;
+module_param_named(enable_default_device, enable_default_device, bool, 0444);
+MODULE_PARM_DESC(enable_default_device,
+		 "Enable/Disable creating the default device");
 
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
-MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
+MODULE_PARM_DESC(enable_cursor,
+		 "Enable/Disable cursor support for the default device");
 
 static bool enable_writeback = true;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
-MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
+MODULE_PARM_DESC(
+	enable_writeback,
+	"Enable/Disable writeback connector support for the default device");
 
 static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
-MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
+MODULE_PARM_DESC(enable_overlay,
+		 "Enable/Disable overlay support for the default device");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
@@ -57,8 +69,8 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
 
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
+	for (int i = 0; i < vkms->output.num_crtcs; i++)
+		destroy_workqueue(vkms->output.crtcs[i].composer_workq);
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -90,37 +102,12 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
-{
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
-
-	return 0;
-}
-
-static const struct drm_info_list vkms_config_debugfs_list[] = {
-	{ "vkms_config", vkms_config_show, 0 },
-};
-
-static void vkms_config_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(vkms_config_debugfs_list, ARRAY_SIZE(vkms_config_debugfs_list),
-				 minor->debugfs_root, minor);
-}
-
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
-	.debugfs_init           = vkms_config_debugfs_init,
-
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
 	.date			= DRIVER_DATE,
@@ -141,8 +128,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
@@ -156,114 +147,176 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkmsdev->configfs ? vkms_output_init(vkmsdev) :
+				   vkms_output_init_default(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+static int vkms_platform_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct vkms_device_setup *vkms_device_setup = pdev->dev.platform_data;
 	struct vkms_device *vkms_device;
+	void *grp;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
+	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!grp) {
+		DRM_ERROR("Could not open devres group\n");
+		return -ENOMEM;
 	}
 
 	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
-		goto out_devres;
+		goto out_release_group;
 	}
+
 	vkms_device->platform = pdev;
-	vkms_device->config = config;
-	config->dev = vkms_device;
+	vkms_device->config.cursor = enable_cursor;
+	vkms_device->config.writeback = enable_writeback;
+	vkms_device->config.overlay = enable_overlay;
+	vkms_device->configfs = vkms_device_setup->configfs;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
-
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_devres;
+		goto out_release_group;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = vkms_modeset_init(vkms_device);
 	if (ret) {
-		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+		DRM_ERROR("Unable to initialize modesetting\n");
+		goto out_release_group;
 	}
 
-	ret = vkms_modeset_init(vkms_device);
-	if (ret)
-		goto out_devres;
+	ret = drm_vblank_init(&vkms_device->drm, vkms_device->output.num_crtcs);
+	if (ret) {
+		DRM_ERROR("Failed to vblank\n");
+		goto out_release_group;
+	}
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
-	if (ret)
-		goto out_devres;
+	if (ret) {
+		DRM_ERROR("Unable to register device with id %d\n", pdev->id);
+		goto out_release_group;
+	}
 
 	drm_fbdev_generic_setup(&vkms_device->drm, 0);
+	platform_set_drvdata(pdev, vkms_device);
+	devres_close_group(&pdev->dev, grp);
 
 	return 0;
 
-out_devres:
-	devres_release_group(&pdev->dev, NULL);
-out_unregister:
-	platform_device_unregister(pdev);
+out_release_group:
+	devres_release_group(&pdev->dev, grp);
 	return ret;
 }
 
-static int __init vkms_init(void)
+static int vkms_platform_remove(struct platform_device *pdev)
 {
-	int ret;
-	struct vkms_config *config;
+	struct vkms_device *vkms_device;
 
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
+	vkms_device = platform_get_drvdata(pdev);
+	if (!vkms_device)
+		return 0;
 
-	default_config = config;
+	drm_dev_unregister(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
+	return 0;
+}
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
+static struct platform_driver vkms_platform_driver = {
+	.probe = vkms_platform_probe,
+	.remove = vkms_platform_remove,
+	.driver.name = DRIVER_NAME,
+};
 
-	ret = vkms_create(config);
-	if (ret)
-		kfree(config);
+struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
+{
+	struct device *dev = NULL;
+	struct platform_device *pdev;
+	int max_id = 1;
+	struct vkms_device_setup vkms_device_setup = {
+		.configfs = configfs,
+	};
+
+	while ((dev = platform_find_device_by_driver(
+			dev, &vkms_platform_driver.driver))) {
+		pdev = to_platform_device(dev);
+		max_id = max(max_id, pdev->id);
+		put_device(dev);
+	}
 
-	return ret;
+	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
+					     &vkms_device_setup,
+					     sizeof(vkms_device_setup));
+	if (IS_ERR(pdev)) {
+		DRM_ERROR("Unable to register vkms device'\n");
+		return ERR_PTR(PTR_ERR(pdev));
+	}
+
+	return platform_get_drvdata(pdev);
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_remove_device(struct vkms_device *vkms_device)
 {
-	struct platform_device *pdev;
+	platform_device_unregister(vkms_device->platform);
+}
+
+static int __init vkms_init(void)
+{
+	int ret;
+	struct platform_device *default_pdev = NULL;
 
-	if (!config->dev) {
-		DRM_INFO("vkms_device is NULL.\n");
-		return;
+	ret = platform_driver_register(&vkms_platform_driver);
+	if (ret) {
+		DRM_ERROR("Unable to register platform driver\n");
+		return ret;
 	}
 
-	pdev = config->dev->platform;
+	if (enable_default_device) {
+		struct vkms_device_setup vkms_device_setup = {
+			.configfs = NULL,
+		};
+
+		default_pdev = platform_device_register_data(
+			NULL, DRIVER_NAME, 0, &vkms_device_setup,
+			sizeof(vkms_device_setup));
+		if (IS_ERR(default_pdev)) {
+			DRM_ERROR("Unable to register default vkms device\n");
+			platform_driver_unregister(&vkms_platform_driver);
+			return PTR_ERR(default_pdev);
+		}
+	}
 
-	drm_dev_unregister(&config->dev->drm);
-	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	ret = vkms_init_configfs();
+	if (ret) {
+		DRM_ERROR("Unable to initialize configfs\n");
+		if (default_pdev)
+			platform_device_unregister(default_pdev);
+
+		platform_driver_unregister(&vkms_platform_driver);
+	}
 
-	config->dev = NULL;
+	return 0;
 }
 
 static void __exit vkms_exit(void)
 {
-	if (default_config->dev)
-		vkms_destroy(default_config);
+	struct device *dev;
+
+	vkms_unregister_configfs();
+
+	while ((dev = platform_find_device_by_driver(
+			NULL, &vkms_platform_driver.driver))) {
+		// platform_find_device_by_driver increments the refcount. Drop
+		// it so we don't leak memory.
+		put_device(dev);
+		platform_device_unregister(to_platform_device(dev));
+	}
 
-	kfree(default_config);
+	platform_driver_unregister(&vkms_platform_driver);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0a67b8073f7e..7b9b189511c2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -3,6 +3,8 @@
 #ifndef _VKMS_DRV_H_
 #define _VKMS_DRV_H_
 
+#include "drm/drm_connector.h"
+#include <linux/configfs.h>
 #include <linux/hrtimer.h>
 
 #include <drm/drm.h>
@@ -10,10 +12,11 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_writeback.h>
 
-#define XRES_MIN    20
-#define YRES_MIN    20
+#define XRES_MIN    10
+#define YRES_MIN    10
 
 #define XRES_DEF  1024
 #define YRES_DEF   768
@@ -23,10 +26,15 @@
 
 #define NUM_OVERLAY_PLANES 8
 
+#define VKMS_MAX_OUTPUT_OBJECTS 16
+#define VKMS_MAX_PLANES (3 * VKMS_MAX_OUTPUT_OBJECTS)
+
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
+	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	unsigned int rotation;
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
@@ -44,8 +52,7 @@ struct line_buffer {
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
-	void (*wb_write)(struct vkms_frame_info *frame_info,
-			 const struct line_buffer *buffer, int y);
+	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
 };
 
 /**
@@ -56,14 +63,32 @@ struct vkms_writeback_job {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	void (*plane_read)(struct line_buffer *buffer,
-			   const struct vkms_frame_info *frame_info, int y);
+	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
 };
 
 struct vkms_plane {
 	struct drm_plane base;
 };
 
+struct vkms_crtc {
+	struct drm_crtc base;
+
+	struct drm_writeback_connector wb_connector;
+	struct hrtimer vblank_hrtimer;
+	ktime_t period_ns;
+	struct drm_pending_vblank_event *event;
+	/* ordered wq for composer_work */
+	struct workqueue_struct *composer_workq;
+	/* protects concurrent access to composer */
+	spinlock_t lock;
+
+	/* protected by @lock */
+	bool composer_enabled;
+	struct vkms_crtc_state *composer_state;
+
+	spinlock_t composer_lock;
+};
+
 /**
  * vkms_crtc_state - Driver specific CRTC state
  * @base: base CRTC state
@@ -88,62 +113,145 @@ struct vkms_crtc_state {
 };
 
 struct vkms_output {
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-	struct drm_writeback_connector wb_connector;
-	struct hrtimer vblank_hrtimer;
-	ktime_t period_ns;
-	struct drm_pending_vblank_event *event;
-	/* ordered wq for composer_work */
-	struct workqueue_struct *composer_workq;
-	/* protects concurrent access to composer */
-	spinlock_t lock;
-
-	/* protected by @lock */
-	bool composer_enabled;
-	struct vkms_crtc_state *composer_state;
-
-	spinlock_t composer_lock;
+	int num_crtcs;
+	struct vkms_crtc crtcs[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_encoders;
+	struct drm_encoder encoders[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_connectors;
+	struct drm_connector connectors[VKMS_MAX_OUTPUT_OBJECTS];
+	int num_planes;
+	struct vkms_plane planes[VKMS_MAX_PLANES];
 };
 
-struct vkms_device;
-
 struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
-	/* only set when instantiated */
-	struct vkms_device *dev;
+};
+
+struct vkms_config_links {
+	struct config_group group;
+	unsigned long linked_object_bitmap;
+};
+
+struct vkms_config_connector {
+	struct config_group config_group;
+	struct drm_connector *connector;
+	struct vkms_config_links possible_encoders;
+	bool connected;
+};
+
+struct vkms_config_crtc {
+	struct config_group config_group;
+	unsigned long crtc_config_idx;
+};
+
+struct vkms_config_encoder {
+	struct config_group config_group;
+	struct vkms_config_links possible_crtcs;
+	unsigned long encoder_config_idx;
+};
+
+struct vkms_config_plane {
+	struct vkms_configfs *configfs;
+	struct config_group config_group;
+	struct vkms_config_links possible_crtcs;
+	enum drm_plane_type type;
+};
+
+struct vkms_configfs {
+	/* Directory group containing connector configs, e.g. /config/vkms/device/ */
+	struct config_group device_group;
+	/* Directory group containing connector configs, e.g. /config/vkms/device/connectors/ */
+	struct config_group connectors_group;
+	/* Directory group containing CRTC configs, e.g. /config/vkms/device/crtcs/ */
+	struct config_group crtcs_group;
+	/* Directory group containing encoder configs, e.g. /config/vkms/device/encoders/ */
+	struct config_group encoders_group;
+	/* Directory group containing plane configs, e.g. /config/vkms/device/planes/ */
+	struct config_group planes_group;
+
+	unsigned long allocated_crtcs;
+	unsigned long allocated_encoders;
+
+	struct mutex lock;
+
+	/* The platform device if this is registered, otherwise NULL */
+	struct vkms_device *vkms_device;
+};
+
+struct vkms_device_setup {
+	// Is NULL in the case of the default card.
+	struct vkms_configfs *configfs;
 };
 
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
+	// Is NULL in the case of the default card.
+	struct vkms_configfs *configfs;
 	struct vkms_output output;
-	const struct vkms_config *config;
+	struct vkms_config config;
 };
 
-#define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
+#define drm_crtc_to_vkms_crtc(crtc) container_of(crtc, struct vkms_crtc, base)
 
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
+#define timer_to_vkms_crtc(timer) \
+	container_of(timer, struct vkms_crtc, vblank_hrtimer)
+
 #define to_vkms_crtc_state(target)\
 	container_of(target, struct vkms_crtc_state, base)
 
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+#define item_to_configfs(item) \
+	container_of(to_config_group(item), struct vkms_configfs, device_group)
+
+#define connector_item_to_configfs(item)                                     \
+	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
+		     connectors_group)
+
+#define item_to_config_connector(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_connector, \
+		     config_group)
+
+#define item_to_config_crtc(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_crtc, \
+		     config_group)
+
+#define item_to_config_encoder(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_encoder, \
+		     config_group)
+
+#define item_to_config_plane(item)                                    \
+	container_of(to_config_group(item), struct vkms_config_plane, \
+		     config_group)
+
+#define item_to_config_links(item) \
+	container_of(to_config_group(item), struct vkms_config_links, group)
+
+#define plane_item_to_configfs(item)                                         \
+	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
+		     planes_group)
+
+/* Devices */
+struct vkms_device *vkms_add_device(struct vkms_configfs *configfs);
+void vkms_remove_device(struct vkms_device *vkms_device);
+
 /* CRTC */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor, const char *name);
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index);
+int vkms_output_init(struct vkms_device *vkmsdev);
+int vkms_output_init_default(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index);
+				   enum drm_plane_type type);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
@@ -154,9 +262,20 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
+void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
+void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_crtc *vkms_crtc);
+
+/* ConfigFS Support */
+int vkms_init_configfs(void);
+void vkms_unregister_configfs(void);
+
+/* Connector hotplugging */
+enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						bool force);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d4950688b3f1..36046b12f296 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -2,6 +2,8 @@
 
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+
+#include <drm/drm_blend.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
@@ -37,104 +39,106 @@ static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
 static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
 {
 	int x_src = frame_info->src.x1 >> 16;
-	int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
+	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
 
 	return packed_pixels_addr(frame_info, x_src, y_src);
 }
 
-static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
-				 const struct vkms_frame_info *frame_info, int y)
+static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		/*
-		 * The 257 is the "conversion ratio". This number is obtained by the
-		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
-		 * the best color value in a pixel format with more possibilities.
-		 * A similar idea applies to others RGB color conversions.
-		 */
-		out_pixels[x].a = (u16)src_pixels[3] * 257;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
-	}
+	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
+		return limit - x - 1;
+	return x;
 }
 
-static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
-				 const struct vkms_frame_info *frame_info, int y)
+static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
-	}
+	/*
+	 * The 257 is the "conversion ratio". This number is obtained by the
+	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
+	 * the best color value in a pixel format with more possibilities.
+	 * A similar idea applies to others RGB color conversions.
+	 */
+	out_pixel->a = (u16)src_pixels[3] * 257;
+	out_pixel->r = (u16)src_pixels[2] * 257;
+	out_pixel->g = (u16)src_pixels[1] * 257;
+	out_pixel->b = (u16)src_pixels[0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
-				     const struct vkms_frame_info *frame_info,
-				     int y)
+static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
-	}
+	out_pixel->a = (u16)0xffff;
+	out_pixel->r = (u16)src_pixels[2] * 257;
+	out_pixel->g = (u16)src_pixels[1] * 257;
+	out_pixel->b = (u16)src_pixels[0] * 257;
 }
 
-static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
-				     const struct vkms_frame_info *frame_info,
-				     int y)
+static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
-	}
+	u16 *pixels = (u16 *)src_pixels;
+
+	out_pixel->a = le16_to_cpu(pixels[3]);
+	out_pixel->r = le16_to_cpu(pixels[2]);
+	out_pixel->g = le16_to_cpu(pixels[1]);
+	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
-			       const struct vkms_frame_info *frame_info, int y)
+static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			       stage_buffer->n_pixels);
+	u16 *pixels = (u16 *)src_pixels;
+
+	out_pixel->a = (u16)0xffff;
+	out_pixel->r = le16_to_cpu(pixels[2]);
+	out_pixel->g = le16_to_cpu(pixels[1]);
+	out_pixel->b = le16_to_cpu(pixels[0]);
+}
+
+static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+{
+	u16 *pixels = (u16 *)src_pixels;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
-		u16 rgb_565 = le16_to_cpu(*src_pixels);
-		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
-		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
-		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
+	u16 rgb_565 = le16_to_cpu(*pixels);
+	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
+	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
+	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
+
+	out_pixel->a = (u16)0xffff;
+	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+}
+
+/**
+ * vkms_compose_row - compose a single row of a plane
+ * @stage_buffer: output line with the composed pixels
+ * @plane: state of the plane that is being composed
+ * @y: y coordinate of the row
+ *
+ * This function composes a single row of a plane. It gets the source pixels
+ * through the y coordinate (see get_packed_src_addr()) and goes linearly
+ * through the source pixel, reading the pixels and converting it to
+ * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
+ * the source pixels are not traversed linearly. The source pixels are queried
+ * on each iteration in order to traverse the pixels vertically.
+ */
+void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	struct vkms_frame_info *frame_info = plane->frame_info;
+	u8 *src_pixels = get_packed_src_addr(frame_info, y);
+	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+
+	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
+		int x_pos = get_x_position(frame_info, limit, x);
+
+		if (drm_rotation_90_or_270(frame_info->rotation))
+			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
+				+ frame_info->cpp * y;
 
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
-		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
-		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
+		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
 	}
 }
 
@@ -146,110 +150,84 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
  * They are used in the `compose_active_planes` to convert and store a line
  * from the src_buffer to the writeback buffer.
  */
-static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
-				 const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		/*
-		 * This sequence below is important because the format's byte order is
-		 * in little-endian. In the case of the ARGB8888 the memory is
-		 * organized this way:
-		 *
-		 * | Addr     | = blue channel
-		 * | Addr + 1 | = green channel
-		 * | Addr + 2 | = Red channel
-		 * | Addr + 3 | = Alpha channel
-		 */
-		dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
-		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
-		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
-		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
-	}
+	/*
+	 * This sequence below is important because the format's byte order is
+	 * in little-endian. In the case of the ARGB8888 the memory is
+	 * organized this way:
+	 *
+	 * | Addr     | = blue channel
+	 * | Addr + 1 | = green channel
+	 * | Addr + 2 | = Red channel
+	 * | Addr + 3 | = Alpha channel
+	 */
+	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
+	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
-				 const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = 0xff;
-		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
-		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
-		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
-	}
+	dst_pixels[3] = 0xff;
+	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
-				     const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = cpu_to_le16(in_pixels[x].a);
-		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
-		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
-		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
-	}
+	u16 *pixels = (u16 *)dst_pixels;
+
+	pixels[3] = cpu_to_le16(in_pixel->a);
+	pixels[2] = cpu_to_le16(in_pixel->r);
+	pixels[1] = cpu_to_le16(in_pixel->g);
+	pixels[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
-				     const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = 0xffff;
-		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
-		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
-		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
-	}
+	u16 *pixels = (u16 *)dst_pixels;
+
+	pixels[3] = 0xffff;
+	pixels[2] = cpu_to_le16(in_pixel->r);
+	pixels[1] = cpu_to_le16(in_pixel->g);
+	pixels[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
-			       const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
+	u16 *pixels = (u16 *)dst_pixels;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
-		s64 fp_r = drm_int2fixp(in_pixels[x].r);
-		s64 fp_g = drm_int2fixp(in_pixels[x].g);
-		s64 fp_b = drm_int2fixp(in_pixels[x].b);
+	s64 fp_r = drm_int2fixp(in_pixel->r);
+	s64 fp_g = drm_int2fixp(in_pixel->g);
+	s64 fp_b = drm_int2fixp(in_pixel->b);
 
-		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
-		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
-		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
+	u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
+	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
+	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
 
-		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
-	}
+	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
+}
+
+void vkms_writeback_row(struct vkms_writeback_job *wb,
+			const struct line_buffer *src_buffer, int y)
+{
+	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
+	int x_dst = frame_info->dst.x1;
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->cpp)
+		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
-void *get_frame_to_line_function(u32 format)
+void *get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
@@ -267,7 +245,7 @@ void *get_frame_to_line_function(u32 format)
 	}
 }
 
-void *get_line_to_frame_function(u32 format)
+void *get_pixel_write_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 43b7c1979018..cf59c2ed8e9a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -5,8 +5,8 @@
 
 #include "vkms_drv.h"
 
-void *get_frame_to_line_function(u32 format);
+void *get_pixel_conversion_function(u32 format);
 
-void *get_line_to_frame_function(u32 format);
+void *get_pixel_write_function(u32 format);
 
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 991857125bb4..28a50d2149f5 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,24 +1,73 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include "vkms_drv.h"
+#include <drm/drm_print.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <linux/printk.h>
 
-static void vkms_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
+#include "vkms_drv.h"
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vkms_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct vkms_config_connector *
+find_config_for_connector(struct drm_connector *connector)
+{
+	struct vkms_device *vkms = drm_device_to_vkms_device(connector->dev);
+	struct vkms_configfs *configfs = vkms->configfs;
+	struct config_item *item;
+
+	if (!configfs) {
+		pr_info("Default connector has no configfs entry");
+		return NULL;
+	}
+
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		if (config_connector->connector == connector)
+			return config_connector;
+	}
+
+	pr_warn("Could not find config to match connector %s, but configfs was initialized",
+		connector->name);
+
+	return NULL;
+}
+
+enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						bool force)
+{
+	enum drm_connector_status status = connector_status_connected;
+	const struct vkms_config_connector *config_connector =
+		find_config_for_connector(connector);
+
+	if (!config_connector)
+		return connector_status_connected;
+
+	if (!config_connector->connected)
+		status = connector_status_disconnected;
+
+	return status;
+}
+
+static const struct drm_encoder_funcs vkms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -30,82 +79,120 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
-	.get_modes    = vkms_conn_get_modes,
+	.get_modes = vkms_conn_get_modes,
 };
 
-static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
-				  struct drm_crtc *crtc)
+static struct drm_connector *
+vkms_connector_init(struct vkms_device *vkms_device)
 {
-	struct vkms_plane *overlay;
+	struct drm_connector *connector;
+	int ret;
+
+	if (vkms_device->output.num_connectors >= VKMS_MAX_OUTPUT_OBJECTS)
+		return ERR_PTR(-ENOMEM);
 
-	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
-	if (IS_ERR(overlay))
-		return PTR_ERR(overlay);
+	connector = &vkms_device->output
+			     .connectors[vkms_device->output.num_connectors++];
+	ret = drm_connector_init(&vkms_device->drm, connector,
+				 &vkms_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret) {
+		memset(connector, 0, sizeof(*connector));
+		vkms_device->output.num_connectors -= 1;
+		return ERR_PTR(ret);
+	}
 
-	if (!overlay->base.possible_crtcs)
-		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	return 0;
+	return connector;
 }
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index)
+static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	if (vkms_device->output.num_encoders >= VKMS_MAX_OUTPUT_OBJECTS)
+		return ERR_PTR(-ENOMEM);
+
+	encoder = &vkms_device->output
+			   .encoders[vkms_device->output.num_encoders++];
+	ret = drm_encoder_init(&vkms_device->drm, encoder, &vkms_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		memset(encoder, 0, sizeof(*encoder));
+		vkms_device->output.num_encoders -= 1;
+		return ERR_PTR(ret);
+	}
+	return encoder;
+}
+
+int vkms_output_init_default(struct vkms_device *vkmsdev)
 {
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
-	struct drm_encoder *encoder = &output->encoder;
-	struct drm_crtc *crtc = &output->crtc;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct vkms_crtc *vkms_crtc;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
 	unsigned int n;
 
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
+	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	if (vkmsdev->config->overlay) {
+	if (vkmsdev->config.overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-			if (ret)
-				return ret;
+			struct vkms_plane *overlay = vkms_plane_init(
+				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
+			if (IS_ERR(overlay)) {
+				return PTR_ERR(overlay);
+			}
 		}
 	}
 
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
-		if (IS_ERR(cursor))
+	if (vkmsdev->config.cursor) {
+		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
+		if (IS_ERR(cursor)) {
 			return PTR_ERR(cursor);
+		}
 	}
 
-	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
-	if (ret)
-		return ret;
+	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
+				   cursor ? &cursor->base : NULL,
+				   "crtc-default");
+	if (IS_ERR(vkms_crtc)) {
+		DRM_ERROR("Failed to init crtc\n");
+		return PTR_ERR(vkms_crtc);
+	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret) {
-		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
+		vkmsdev->output.planes[i].base.possible_crtcs |=
+			drm_crtc_mask(&vkms_crtc->base);
 	}
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+	connector = vkms_connector_init(vkmsdev);
+	if (IS_ERR(connector)) {
+		DRM_ERROR("Failed to init connector\n");
+		return PTR_ERR(connector);
+	}
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
-	if (ret) {
+	encoder = vkms_encoder_init(vkmsdev);
+	if (IS_ERR(encoder)) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
+		return PTR_ERR(encoder);
 	}
-	encoder->possible_crtcs = 1;
+	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
-	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
+	if (vkmsdev->config.writeback) {
+		writeback = vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
 	}
@@ -113,15 +200,175 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	drm_mode_config_reset(dev);
 
 	return 0;
+}
+
+static bool is_object_linked(struct vkms_config_links *links, unsigned long idx)
+{
+	return links->linked_object_bitmap & (1 << idx);
+}
+
+int vkms_output_init(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_configfs *configfs = vkmsdev->configfs;
+	struct vkms_output *output = &vkmsdev->output;
+	struct plane_map {
+		struct vkms_config_plane *config_plane;
+		struct vkms_plane *plane;
+	} plane_map[VKMS_MAX_PLANES] = { 0 };
+	struct encoder_map {
+		struct vkms_config_encoder *config_encoder;
+		struct drm_encoder *encoder;
+	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
+	struct config_item *item;
+	int map_idx = 0;
+
+	list_for_each_entry(item, &configfs->planes_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_plane *config_plane =
+			item_to_config_plane(item);
+		struct vkms_plane *plane =
+			vkms_plane_init(vkmsdev, config_plane->type);
+
+		if (IS_ERR(plane)) {
+			DRM_ERROR("Unable to init plane from config: %s",
+				  item->ci_name);
+			return PTR_ERR(plane);
+		}
+
+		plane_map[map_idx].config_plane = config_plane;
+		plane_map[map_idx].plane = plane;
+		map_idx += 1;
+	}
+
+	map_idx = 0;
+	list_for_each_entry(item, &configfs->encoders_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_encoder *config_encoder =
+			item_to_config_encoder(item);
+		struct drm_encoder *encoder = vkms_encoder_init(vkmsdev);
+
+		if (IS_ERR(encoder)) {
+			DRM_ERROR("Failed to init config encoder: %s",
+				  item->ci_name);
+			return PTR_ERR(encoder);
+		}
+		encoder_map[map_idx].config_encoder = config_encoder;
+		encoder_map[map_idx].encoder = encoder;
+		map_idx += 1;
+	}
+
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		struct drm_connector *connector = vkms_connector_init(vkmsdev);
+		if (IS_ERR(connector)) {
+			DRM_ERROR("Failed to init connector from config: %s",
+				  item->ci_name);
+			return PTR_ERR(connector);
+		}
+		config_connector->connector = connector;
+
+		for (int j = 0; j < output->num_connectors; j++) {
+			struct encoder_map *encoder = &encoder_map[j];
 
-err_attach:
-	drm_encoder_cleanup(encoder);
+			if (is_object_linked(
+				    &config_connector->possible_encoders,
+				    encoder->config_encoder
+					    ->encoder_config_idx)) {
+				drm_connector_attach_encoder(connector,
+							     encoder->encoder);
+			}
+		}
+	}
+
+	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_crtc *config_crtc =
+			item_to_config_crtc(item);
+		struct vkms_crtc *vkms_crtc;
+		struct drm_plane *primary = NULL, *cursor = NULL;
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
+			struct drm_plane *plane = &plane_entry->plane->base;
+
+			if (!is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				continue;
+			}
+
+			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+				if (primary) {
+					DRM_WARN(
+						"Too many primary planes found for crtc %s.",
+						item->ci_name);
+					return EINVAL;
+				}
+				primary = plane;
+			} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+				if (cursor) {
+					DRM_WARN(
+						"Too many cursor planes found for crtc %s.",
+						item->ci_name);
+					return EINVAL;
+				}
+				cursor = plane;
+			}
+		}
+
+		if (!primary) {
+			DRM_WARN("No primary plane configured for crtc %s",
+				 item->ci_name);
+			return EINVAL;
+		}
 
-err_encoder:
-	drm_connector_cleanup(connector);
+		vkms_crtc =
+			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
+		if (IS_ERR(vkms_crtc)) {
+			DRM_WARN("Unable to init crtc from config: %s",
+				 item->ci_name);
+			return PTR_ERR(vkms_crtc);
+		}
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
 
-err_connector:
-	drm_crtc_cleanup(crtc);
+			if (!plane_entry->plane)
+				break;
 
-	return ret;
+			if (is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				plane_entry->plane->base.possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		for (int j = 0; j < output->num_encoders; j++) {
+			struct encoder_map *encoder_entry = &encoder_map[j];
+
+			if (is_object_linked(&encoder_entry->config_encoder
+						      ->possible_crtcs,
+					     config_crtc->crtc_config_idx)) {
+				encoder_entry->encoder->possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		if (vkmsdev->config.writeback) {
+			int ret = vkms_enable_writeback_connector(vkmsdev,
+								  vkms_crtc);
+			if (ret)
+				DRM_WARN(
+					"Failed to init writeback connector for config crtc: %s. Error code %d",
+					item->ci_name, ret);
+		}
+	}
+
+	drm_mode_config_reset(dev);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index b3f8a115cc23..f69621822c1b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -4,20 +4,17 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
 static const u32 vkms_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_RGB565
-};
-
-static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
@@ -70,6 +67,20 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	kfree(vkms_state);
 }
 
+static void vkms_plane_destroy(struct drm_plane *plane)
+{
+	struct vkms_plane *vkms_plane =
+		container_of(plane, struct vkms_plane, base);
+
+	if (plane->state) {
+		vkms_plane_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	drm_plane_cleanup(plane);
+	memset(vkms_plane, 0, sizeof(struct vkms_plane));
+}
+
 static void vkms_plane_reset(struct drm_plane *plane)
 {
 	struct vkms_plane_state *vkms_state;
@@ -89,11 +100,12 @@ static void vkms_plane_reset(struct drm_plane *plane)
 }
 
 static const struct drm_plane_funcs vkms_plane_funcs = {
-	.update_plane		= drm_atomic_helper_update_plane,
-	.disable_plane		= drm_atomic_helper_disable_plane,
-	.reset			= vkms_plane_reset,
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = vkms_plane_destroy,
+	.reset = vkms_plane_reset,
 	.atomic_duplicate_state = vkms_plane_duplicate_state,
-	.atomic_destroy_state	= vkms_plane_destroy_state,
+	.atomic_destroy_state = vkms_plane_destroy_state,
 };
 
 static void vkms_plane_atomic_update(struct drm_plane *plane,
@@ -117,13 +129,23 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
+	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
+	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
+						     DRM_MODE_ROTATE_90 |
+						     DRM_MODE_ROTATE_270 |
+						     DRM_MODE_REFLECT_X |
+						     DRM_MODE_REFLECT_Y);
+
+	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
+			drm_rect_height(&frame_info->rotated), frame_info->rotation);
+
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
-	vkms_plane_state->plane_read = get_frame_to_line_function(fmt);
+	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,
@@ -132,7 +154,6 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc_state *crtc_state;
-	bool can_position = false;
 	int ret;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
@@ -143,20 +164,13 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		can_position = true;
-
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
-						  can_position, true);
+						  true, true);
 	if (ret != 0)
 		return ret;
 
-	/* for now primary plane must be visible and full screen */
-	if (!new_plane_state->visible && !can_position)
-		return -EINVAL;
-
 	return 0;
 }
 
@@ -193,7 +207,7 @@ static void vkms_cleanup_fb(struct drm_plane *plane,
 	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
 }
 
-static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
+static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 	.atomic_update		= vkms_plane_atomic_update,
 	.atomic_check		= vkms_plane_atomic_check,
 	.prepare_fb		= vkms_prepare_fb,
@@ -201,41 +215,27 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index)
+				   enum drm_plane_type type)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	const struct drm_plane_helper_funcs *funcs;
+	struct vkms_output *output = &vkmsdev->output;
 	struct vkms_plane *plane;
-	const u32 *formats;
-	int nformats;
-
-	switch (type) {
-	case DRM_PLANE_TYPE_PRIMARY:
-		formats = vkms_formats;
-		nformats = ARRAY_SIZE(vkms_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	case DRM_PLANE_TYPE_CURSOR:
-	case DRM_PLANE_TYPE_OVERLAY:
-		formats = vkms_plane_formats;
-		nformats = ARRAY_SIZE(vkms_plane_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	default:
-		formats = vkms_formats;
-		nformats = ARRAY_SIZE(vkms_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	}
+	int ret;
+
+	if (output->num_planes >= VKMS_MAX_PLANES)
+		return ERR_PTR(-ENOMEM);
+
+	plane = &output->planes[output->num_planes++];
+	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
+				       vkms_formats, ARRAY_SIZE(vkms_formats),
+				       NULL, type, NULL);
+	if (ret)
+		return ERR_PTR(ret);
 
-	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
-					   &vkms_plane_funcs,
-					   formats, nformats,
-					   NULL, type, NULL);
-	if (IS_ERR(plane))
-		return plane;
+	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_helper_add(&plane->base, funcs);
+	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
 	return plane;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 84a51cd281b9..47449979c564 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/iosys-map.h>
+#include <linux/kernel.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
@@ -15,6 +16,7 @@
 #include "vkms_formats.h"
 
 static const u32 vkms_wb_formats[] = {
+	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
@@ -101,7 +103,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_crtc *vkms_crtc =
+		container_of(connector, struct vkms_crtc, wb_connector);
 
 	if (!job->fb)
 		return;
@@ -110,8 +113,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_set_composer(vkms_crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -120,11 +122,11 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct vkms_crtc *vkms_crtc =
+		drm_crtc_to_vkms_crtc(connector_state->crtc);
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
 	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
@@ -135,20 +137,24 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(vkms_crtc, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
+	crtc_state->wb_pending = true;
+	spin_unlock_irq(&vkms_crtc->composer_lock);
+
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
 	wb_frame_info->cpp = fb->format->cpp[0];
+
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
-	active_wb->wb_write = get_line_to_frame_function(wb_format);
+	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
 	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }
@@ -160,9 +166,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_commit = vkms_wb_atomic_commit,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_crtc *vkms_crtc)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 553210c02ee0..6ea339d5de08 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -25,6 +25,7 @@
 #ifndef DRM_FIXED_H
 #define DRM_FIXED_H
 
+#include <linux/kernel.h>
 #include <linux/math64.h>
 
 typedef union dfixed {
@@ -70,6 +71,7 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 }
 
 #define DRM_FIXED_POINT		32
+#define DRM_FIXED_POINT_HALF	16
 #define DRM_FIXED_ONE		(1ULL << DRM_FIXED_POINT)
 #define DRM_FIXED_DECIMAL_MASK	(DRM_FIXED_ONE - 1)
 #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
@@ -86,6 +88,11 @@ static inline int drm_fixp2int(s64 a)
 	return ((s64)a) >> DRM_FIXED_POINT;
 }
 
+static inline int drm_fixp2int_round(s64 a)
+{
+	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
+}
+
 static inline int drm_fixp2int_ceil(s64 a)
 {
 	if (a > 0)
-- 
2.41.0.640.ga95def55d0-goog

