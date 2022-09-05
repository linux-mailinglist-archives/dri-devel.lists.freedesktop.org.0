Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC75AD969
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AD10E4B8;
	Mon,  5 Sep 2022 19:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA34810E4B9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:55 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1278624b7c4so5042037fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+qiUrtGYnOI5edUdL9shgvJK75JvJoeBXe4g6mB0cww=;
 b=mRmPVQdkNwWi9P8mJxKLwsfyrzTrMTO+cBxDUxvuA59lgDyHbCjqWj1CQYnqM+cFGb
 jaZbdGtvc+N047nivLNCVddeHgqlxjASAY24LYAcMVkZKuy76iAemuz+ic0/JsafX8Q1
 8lYxlknigrLDhhrUym9H2sj894b+AvrivYxAraDDjvjnU5FSykzQTlU2hU9EZw9qqfY2
 kkEjWpfjYFTc4OTb0KpUZUaZuvAyo66n28DurIKC9g+3Lr8CvQXBYjOyPEWBrzzNUqFA
 /EW0/rFtwWnxETqufai1w41fgvOAQJlXe5f6lAXW3peLknIsy4UqJtjk9KQmIb76c+4x
 3+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+qiUrtGYnOI5edUdL9shgvJK75JvJoeBXe4g6mB0cww=;
 b=PODWzwUspFL6Wb99/wJd28XbhrIuHaVEEzyici4UDiCv84QaJGXF4RugMxBWAWpWJC
 u9LiKVgJoV/tS5BpLxA67Oy+HdXc180SWy9NcJzfbSv8Ct3Di9Ua8nu5uhP4c12aOOI1
 26R1t/IRnmXx4FGIERZ486h4RnXGpLWuCryPx+uLNnhkRnCYbzqlZM2kiTQ5xFpXdu0q
 XXfgnYMri+m7hKmTftWl6ELLHW5Zf44UryZ33VzlY9PEYgCYVDM4WI1Jk5W6UgeDZ0vf
 wVahdpMFdGgT6qwAHLN7xxeNGASIwcrsJz+b8hVRle+sq+TDST9/4F+7MnAtIs6wAy6c
 /Jfg==
X-Gm-Message-State: ACgBeo3s+FrLLw7j1W9yq08eE9Yl2jSYCRigN/h6MYQgmwGHGWSwgtuY
 TMyRQUbquQJ3jnT6N6s9nMY=
X-Google-Smtp-Source: AA6agR4IICBr5CQ5y9QtIdkgenXk5V+3vpMjeHvUU75GmEoRzX9PW0TBA4r1eKCu4/f6yaRiUtt03g==
X-Received: by 2002:a05:6870:5250:b0:127:4360:a00b with SMTP id
 o16-20020a056870525000b001274360a00bmr3973964oai.13.1662404935373; 
 Mon, 05 Sep 2022 12:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:55 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Mon,  5 Sep 2022 16:08:10 -0300
Message-Id: <20220905190811.25024-9-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will be useful to write tests that depends on these formats.

ARGB and XRGB follows the a similar implementation of the former formats.
Just adjusting for 16 bits per channel.

V3: Adapt the handlers to the new format introduced in patch 7 V3.
V5: Minor improvements
    Added le16_to_cpu/cpu_to_le16 to the 16 bits color read/writes.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 77 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 33803d3e30b7..b583da7fe0b1 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -78,6 +78,41 @@ static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 	}
 }
 
+static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
+				     const struct vkms_frame_info *frame_info,
+				     int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    stage_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
+		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
+		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
+		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
+		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
+	}
+}
+
+static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
+				     const struct vkms_frame_info *frame_info,
+				     int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    stage_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
+		out_pixels[x].a = (u16)0xffff;
+		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
+		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
+		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
+	}
+}
+
+
 /*
  * The following  functions take an line of argb_u16 pixels from the
  * src_buffer, convert them to a specific format, and store them in the
@@ -130,6 +165,40 @@ static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
 	}
 }
 
+static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
+				     const struct line_buffer *src_buffer, int y)
+{
+	int x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = cpu_to_le16(in_pixels[x].a);
+		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
+		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
+		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
+	}
+}
+
+static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
+				     const struct line_buffer *src_buffer, int y)
+{
+	int x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = 0xffff;
+		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
+		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
+		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
+	}
+}
+
 void *get_frame_to_line_function(u32 format)
 {
 	switch (format) {
@@ -137,6 +206,10 @@ void *get_frame_to_line_function(u32 format)
 		return &ARGB8888_to_argb_u16;
 	case DRM_FORMAT_XRGB8888:
 		return &XRGB8888_to_argb_u16;
+	case DRM_FORMAT_ARGB16161616:
+		return &ARGB16161616_to_argb_u16;
+	case DRM_FORMAT_XRGB16161616:
+		return &XRGB16161616_to_argb_u16;
 	default:
 		return NULL;
 	}
@@ -149,6 +222,10 @@ void *get_line_to_frame_function(u32 format)
 		return &argb_u16_to_ARGB8888;
 	case DRM_FORMAT_XRGB8888:
 		return &argb_u16_to_XRGB8888;
+	case DRM_FORMAT_ARGB16161616:
+		return &argb_u16_to_ARGB16161616;
+	case DRM_FORMAT_XRGB16161616:
+		return &argb_u16_to_XRGB16161616;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d5f3fbfc0f7c..f823fe315de6 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,11 +13,14 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616
 };
 
 static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static struct drm_plane_state *
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 0ce5e28d260d..16feea884646 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -16,6 +16,8 @@
 
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

