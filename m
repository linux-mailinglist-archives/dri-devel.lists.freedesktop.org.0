Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E814F1A34
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915B510E4F5;
	Mon,  4 Apr 2022 20:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4210E4F5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:46:04 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id r127so8708619qke.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/q4tJuWe4Rao8iLcsu8RrWKl1kjLSs/sDWmRRo4HVx8=;
 b=mG/wxO5HGBZm0oPAHUzMqijZF+wsDSDnHtTX5krnLcrBnLR/yb634ksppqYjiMAnaW
 tvj3y+X5f++aLfAbcMjd+f11c/LWvWj3g5U8t7cYK5XlsI9RGadi7UWBA6cK/B6c4l75
 4JxIUiqev4Qhjudkq16oTOaUHDmcSKRvuvYv+LZKVCmQ668hA1eJIfhO+VxjDnOyUv9U
 TcZJqHvC0q4/0uayUo+uZon3XGo/cFJAGOdL8yfbNUn59KISLSIsKU2qIP6xv6x2YYIU
 hk+KeC9rbCSCty3xQm0XH2HEJmH1j2vF5IRiGeh0PffkDBnCGuYhVW3W32DPQPEM+MP5
 Q/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/q4tJuWe4Rao8iLcsu8RrWKl1kjLSs/sDWmRRo4HVx8=;
 b=4+6QGlItV2P2u+iUbUUITGt9zMFd0Y3PsBCI9tSENCgUupbLom/8S/VDb41xDoVojj
 YMeVCV897CiqErKYts89d3wn/nONrtVYm7jTFuJWdTXyHNWItSP39SiO9ynFEgVlYluM
 irK24ZxyjQdcGYTWAHCWbCnak96i3rigZUI/+kcn4GiYy11H+XDaTPsI4DZAwqaioVCw
 x2wr1oVYJTtfDHCT64s2YukTBOUGdhwbfrYY+nSEq7gYJ4HYlduDjMLt9hrWf/kW7BAx
 xyClRlIn5wF/e8tdn1esFwh8OgL/hbB958GSjOEQCZyp+tuALWlnr2wUNcyKxhdfH+95
 5R2g==
X-Gm-Message-State: AOAM533RHh4dPN7jdWLh1HVE/Ed4iXQHeuLd5ZUKQWv/id7fSxTR6W87
 s3ZiJYXJ6+Yddumnj8fSRL4=
X-Google-Smtp-Source: ABdhPJxmOt4z41WEAqCW0Bzadq/9MRGVrYZVAC49ft6umxaDOHoSA8zEtRwImCbfCLJioHiW113DDg==
X-Received: by 2002:a37:9a94:0:b0:67b:1ee6:a003 with SMTP id
 c142-20020a379a94000000b0067b1ee6a003mr68620qke.610.1649105163515; 
 Mon, 04 Apr 2022 13:46:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:46:03 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Date: Mon,  4 Apr 2022 17:45:15 -0300
Message-Id: <20220404204515.42144-10-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds this common format to vkms.

This commit also adds new helper macros to deal with fixed-point
arithmetic.

It was done to improve the precision of the conversion to ARGB16161616
since the "conversion ratio" is not an integer.

V3: Adapt the handlers to the new format introduced in patch 7 V3.
V5: Minor improvements

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 8d913fa7dbde..4af8b295f31e 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -5,6 +5,23 @@
 
 #include "vkms_formats.h"
 
+/* The following macros help doing fixed point arithmetic. */
+/*
+ * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractional
+ * parts respectively.
+ *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
+ * 31                                          0
+ */
+#define FIXED_SCALE 15
+
+#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
+#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
+#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b)))
+/* This macro converts a fixed point number to int, and round half up it */
+#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FIXED_SCALE)
+/* Convert divisor and dividend to Fixed-Point and performs the division */
+#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
+
 static int pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
 	return frame_info->offset + (y * frame_info->pitch)
@@ -112,6 +129,30 @@ static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 	}
 }
 
+static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
+			       const struct vkms_frame_info *frame_info, int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			       stage_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, src_pixels++) {
+		u16 rgb_565 = le16_to_cpu(*src_pixels);
+		int fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
+		int fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
+		int fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
+
+		int fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+		int fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+		out_pixels[x].a = (u16)0xffff;
+		out_pixels[x].r = FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
+		out_pixels[x].g = FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
+		out_pixels[x].b = FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
+	}
+}
+
 
 /*
  * The following  functions take an line of argb_u16 pixels from the
@@ -199,6 +240,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
 	}
 }
 
+static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
+			       const struct line_buffer *src_buffer, int y)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, dst_pixels++) {
+		int fp_r = INT_TO_FIXED(in_pixels[x].r);
+		int fp_g = INT_TO_FIXED(in_pixels[x].g);
+		int fp_b = INT_TO_FIXED(in_pixels[x].b);
+
+		int fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+		int fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
+		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
+		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
+
+		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
+	}
+}
+
 plane_format_transform_func get_plane_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
@@ -209,6 +275,8 @@ plane_format_transform_func get_plane_fmt_transform_function(u32 format)
 		return &ARGB16161616_to_argb_u16;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &XRGB16161616_to_argb_u16;
+	else if (format == DRM_FORMAT_RGB565)
+		return &RGB565_to_argb_u16;
 	else
 		return NULL;
 }
@@ -223,6 +291,8 @@ wb_format_transform_func get_wb_fmt_transform_function(u32 format)
 		return &argb_u16_to_ARGB16161616;
 	else if (format == DRM_FORMAT_XRGB16161616)
 		return &argb_u16_to_XRGB16161616;
+	else if (format == DRM_FORMAT_RGB565)
+		return &argb_u16_to_RGB565;
 	else
 		return NULL;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 60054a85204a..94a8e412886f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,14 +14,16 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XRGB16161616
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_ARGB16161616
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static struct drm_plane_state *
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index cb63a5da9af1..98da7bee0f4b 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -16,7 +16,8 @@
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_ARGB16161616
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_RGB565
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

