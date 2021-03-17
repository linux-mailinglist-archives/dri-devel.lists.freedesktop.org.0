Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312933F412
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29506E5C3;
	Wed, 17 Mar 2021 15:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA286E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id A62E4580A4F;
 Wed, 17 Mar 2021 11:43:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=DyU1IHfahZjmv
 B8T2vyvPQQjQUQxjZM0B+e2lMIwCok=; b=bL9jjq291IgXZcDaZPnjAzWt0bYsj
 868yI5bl7aFCg/Kd8li2o23VtkC8M/aGpDSld9/QAO65dZMogc8YCBNDFl15JFmB
 ieT3E8Djih5wimu37KbUfKQOet/eLf1eJFKxFX86IqzH76zwEmM9LuGQDfvVX0pa
 35e8P5YocjvpkfLiM5SPO/nkAqyrjUQ8XODDO1m0+FBF2BXPoypIL74176qQGVZs
 il9eLxypZ2sZV9s3vlACezW3GBvd1mnoV35gVhADuNSLLaqhgZxeF2WLrVjsjoHT
 wTk/s/I5pTvVr2Xe9LoTjiEIcMVCj9Jpc8jwvlboKZlDtVPk0viGD6Mbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=DyU1IHfahZjmvB8T2vyvPQQjQUQxjZM0B+e2lMIwCok=; b=FgmcRg/z
 eyqLP2qI/VGFYwM3MbGDb/AsNrkQNpqibrtLPSWhnMoOSg39zy2yTIvDPxcowd2y
 9mtXYxjwbQoaFlYohPfvwTJM3RjBPsybcat89/G1lu+5oXEXZ6MpTEtsOQ9uIO/M
 G6FeGmlRSloYlhiGHdwlRwYFGzE+G/DzXVyGGMy4lxT/ub1A6Jr0+sO4ADC2fOdh
 jyt7HJsFoDqki+ksSo4pYhXRpfsWD3RGM5xJ0K+G+ohlV99w0ZCCQ+usIoFrkXIR
 3sfOMjdeF5sm8pIKnlRqqzOeoBAzn0C6PDI+AFk312KHIIRYv1rtKiAm3vs/sZ/H
 0AA1J7Q1U6MIpw==
X-ME-Sender: <xms:vCNSYDSYSmUxgo2EXhWO5J5Q-wpX3ZdYVDZNKUkZ1kyGZIL3MCfYgA>
 <xme:vCNSYLxGoPCWltUYw-uE8aNv1lN8u1iUX2wbR-0x6JhGPmTCRq_PDX1--wwed3oiM
 VsYNpLEMNxKNIlTkc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vCNSYN0TBR_6yBkMetzeOFpsSQ2Y5y8LgZqC2EU-AnjgOPHMjj05iA>
 <xmx:vCNSYB4R3pMep7ZjCl2qP1Nt6HMffdNn-2aeC92pJOzn7jSURmxqUQ>
 <xmx:vCNSYIVz1_EXssO7r3Fa7-9LadpQaQq2_9BrNs0jL5v3Ndzg8QYC6A>
 <xmx:vyNSYALmnYaHaQ9W-p4udBz0fA7cfc59OCVeQwIn0oCMQiw7Zh40tg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC8BB24005E;
 Wed, 17 Mar 2021 11:43:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 01/18] drm: Introduce new HDMI helpers
Date: Wed, 17 Mar 2021 16:43:35 +0100
Message-Id: <20210317154352.732095-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new bridge rework to support the input and output formats introduced
some boilerplate code that will need to be shared across drivers.

Since dw-hdmi is the only driver so far, let's introduce those helpers
based on that code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/Makefile   |   2 +-
 drivers/gpu/drm/drm_hdmi.c | 170 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_hdmi.h     |  24 ++++++
 3 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_hdmi.c
 create mode 100644 include/drm/drm_hdmi.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5eb5bf7c16e3..1b77bd64a37e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -17,7 +17,7 @@ drm-y       :=	drm_auth.o drm_cache.o \
 		drm_plane.o drm_color_mgmt.o drm_print.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
-		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
+		drm_client_modeset.o drm_atomic_uapi.o drm_hdmi.o drm_hdcp.o \
 		drm_managed.o drm_vblank_work.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_bufs.o drm_context.o drm_dma.o drm_legacy_misc.o drm_lock.o \
diff --git a/drivers/gpu/drm/drm_hdmi.c b/drivers/gpu/drm/drm_hdmi.c
new file mode 100644
index 000000000000..3834d5dd6d88
--- /dev/null
+++ b/drivers/gpu/drm/drm_hdmi.c
@@ -0,0 +1,170 @@
+#include <linux/errno.h>
+#include <linux/hdmi.h>
+#include <linux/media-bus-format.h>
+#include <linux/types.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_hdmi.h>
+
+/**
+ * drm_hdmi_bus_fmt_is_rgb() - Is the media bus format an RGB format?
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Checks if the media bus format is an RGB one
+ *
+ * RETURNS:
+ * True if the format is an RGB one, false otherwise
+ */
+bool drm_hdmi_bus_fmt_is_rgb(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_rgb);
+
+/**
+ * drm_hdmi_bus_fmt_is_yuv444() - Is the media bus format an YUV444 format?
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Checks if the media bus format is an YUV444 one
+ *
+ * RETURNS:
+ * True if the format is an YUV444 one, false otherwise
+ */
+bool drm_hdmi_bus_fmt_is_yuv444(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv444);
+
+/**
+ * drm_hdmi_bus_fmt_is_yuv422() - Is the media bus format an YUV422 format?
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Checks if the media bus format is an YUV422 one
+ *
+ * RETURNS:
+ * True if the format is an YUV422 one, false otherwise
+ */
+bool drm_hdmi_bus_fmt_is_yuv422(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+		return true;
+
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv422);
+
+/**
+ * drm_hdmi_bus_fmt_is_yuv420() - Is the media bus format an YUV420 format?
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Checks if the media bus format is an YUV420 one
+ *
+ * RETURNS:
+ * True if the format is an YUV420 one, false otherwise
+ */
+bool drm_hdmi_bus_fmt_is_yuv420(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return true;
+
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv420);
+
+/**
+ * drm_hdmi_bus_fmt_color_depth() - Returns the color depth in bits
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Computes the number of bits per color for a given media bus format
+ *
+ * RETURNS:
+ * The number of bits per color
+ */
+int drm_hdmi_bus_fmt_color_depth(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		return 8;
+
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return 10;
+
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+		return 12;
+
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return 16;
+
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(drm_hdmi_bus_fmt_color_depth);
+
+/**
+ * drm_hdmi_bus_fmt_color_depth() - Returns the color depth in bits
+ * @bus_format: MEDIA_BUS_FMT* to test
+ *
+ * Computes the number of bits per color for a given media bus format
+ *
+ * RETURNS:
+ * The number of bits per color
+ */
+int drm_hdmi_avi_infoframe_output_colorspace(struct hdmi_avi_infoframe *frame,
+					     struct drm_bus_cfg *out_bus_cfg)
+{
+	if (drm_hdmi_bus_fmt_is_yuv444(out_bus_cfg->format))
+		frame->colorspace = HDMI_COLORSPACE_YUV444;
+	else if (drm_hdmi_bus_fmt_is_yuv422(out_bus_cfg->format))
+		frame->colorspace = HDMI_COLORSPACE_YUV422;
+	else if (drm_hdmi_bus_fmt_is_yuv420(out_bus_cfg->format))
+		frame->colorspace = HDMI_COLORSPACE_YUV420;
+	else if (drm_hdmi_bus_fmt_is_rgb(out_bus_cfg->format))
+		frame->colorspace = HDMI_COLORSPACE_RGB;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_output_colorspace);
diff --git a/include/drm/drm_hdmi.h b/include/drm/drm_hdmi.h
new file mode 100644
index 000000000000..8cd281699ea0
--- /dev/null
+++ b/include/drm/drm_hdmi.h
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2013-2015 Mentor Graphics Inc.
+ * Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2010, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+ */
+
+#ifndef __DRM_HDMI_H_
+#define __DRM_HDMI_H_
+
+#include <linux/types.h>
+
+struct drm_bus_cfg;
+struct hdmi_avi_infoframe;
+
+bool drm_hdmi_bus_fmt_is_rgb(u32 bus_format);
+bool drm_hdmi_bus_fmt_is_yuv444(u32 bus_format);
+bool drm_hdmi_bus_fmt_is_yuv422(u32 bus_format);
+bool drm_hdmi_bus_fmt_is_yuv420(u32 bus_format);
+int drm_hdmi_bus_fmt_color_depth(u32 bus_format);
+int drm_hdmi_avi_infoframe_output_colorspace(struct hdmi_avi_infoframe *frame,
+					     struct drm_bus_cfg *out_bus_cfg);
+
+#endif // __DRM_HDMI_H_
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
