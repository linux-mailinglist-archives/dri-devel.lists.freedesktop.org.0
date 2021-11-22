Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EE4595C3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973D689D64;
	Mon, 22 Nov 2021 19:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C1D89D58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:37 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id ay21so38850020uab.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6oRMdQdTTLRMg12EM+5r4h4w3Qz4g9vnYiSKn8PWiM=;
 b=b3VCpm8zc92emK6yRT5Ne0Y6bOHU0HJp32kXTjXu3/C1CuCpcLE9W7TZ6RuzN1Q0/V
 WeJmt/ugB4iQIV9vMW/fJgvTMNqrNsp13d1BJsHJilE3mScAFQllzyEiLY0xNvJrWUzx
 qVdx/jVu5dd2zVChVJ9gvWIl8nnFOdIHt3Ap+MJLxfReLCbYYrbZb7mywMI8NKWTElce
 vcbbDGwIOq6lFPa/eoqsIvAg5SlYRIXXWnSiwRgQq+e0ANCETE9CGEGf94Jh6F5ID6pj
 g1p2wkQ53R9LlSeZ/7ka83jdagjtYEwtPT/pT9QZOX/h3f4G+cb0ItzFwnnupjYVLesb
 PyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6oRMdQdTTLRMg12EM+5r4h4w3Qz4g9vnYiSKn8PWiM=;
 b=AdD4mp9M3b9e8KGNd0CRuCDIYrOEEvBF5NR/2ZoIh03etBmqIU5OvUegswopVIz7Kt
 if4ZJYR0IkQAe22ivo61jg+xG5AlyjIWcuap/TMgm2KDrV23AO3xVtbWQCoI8lr43t25
 3pKEuMirYlT3YGCmRbUyEI9F97CfVejbSddxwwWsjYc8v4Pme7H4TxWYa3Lb9cG6GbQA
 jnkAdRl37U3/Nj4helPHM4f3DUDIOM1wLAAXzpaj0d1scno5Ey/7wJnhegYo2csW8iFv
 y9tdI4XyNyBoKVMaIPbOtSx/VLdkoTIZHvaTqkD74S61oxcL4iBy7XAOIvX3eTKaPFC2
 wvxg==
X-Gm-Message-State: AOAM532aXnOMIyroEEZk2zDYeTcbPU9l9hQheskAphSshAH/i/l2ASi7
 9k1IcKxqjFDbDk7P6F/dM/Y=
X-Google-Smtp-Source: ABdhPJx/8i0EMm1TcWmHxFh1CGyixTxK/Rw+u5xClTy9cQZC93RlnXXREb9dYi2UAKCaQQz+6sGjGg==
X-Received: by 2002:a67:bc16:: with SMTP id t22mr123652151vsn.10.1637610276838; 
 Mon, 22 Nov 2021 11:44:36 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:36 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Mon, 22 Nov 2021 16:43:59 -0300
Message-Id: <20211122194400.30836-9-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will be useful to write tests that depends on these formats.

ARGB and XRGB follows the a similar implementation of the former formats.
Just adjusting for 16 bits per channel.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V3: Adapt the handlers to the new format introduced in patch 7 V3.
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 67 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   | 12 +++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 0d1838d1b835..661da39d1276 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,10 @@ format_transform_func get_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
 		return &ARGB8888_to_ARGB16161616;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &get_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &XRGB16161616_to_ARGB16161616;
 	else
 		return &XRGB8888_to_ARGB16161616;
 }
@@ -15,6 +19,10 @@ format_transform_func get_wb_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
 		return &convert_to_ARGB8888;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &convert_to_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &convert_to_XRGB16161616;
 	else
 		return &convert_to_XRGB8888;
 }
@@ -89,6 +97,35 @@ void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 	}
 }
 
+void get_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+		      struct line_buffer *stage_buffer)
+{
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		stage_buffer[x].a = src_pixels[3];
+		stage_buffer[x].r = src_pixels[2];
+		stage_buffer[x].g = src_pixels[1];
+		stage_buffer[x].b = src_pixels[0];
+	}
+}
+
+void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+				  struct line_buffer *stage_buffer)
+{
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		stage_buffer[x].a = (u16)0xffff;
+		stage_buffer[x].r = src_pixels[2];
+		stage_buffer[x].g = src_pixels[1];
+		stage_buffer[x].b = src_pixels[0];
+	}
+}
+
+
 /*
  * The following  functions take an line of ARGB16161616 pixels from the
  * src_buffer, convert them to a specific format, and store them in the
@@ -136,3 +173,33 @@ void convert_to_XRGB8888(struct vkms_frame_info *frame_info,
 		dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
 	}
 }
+
+void convert_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = src_buffer[x].a;
+		dst_pixels[2] = src_buffer[x].r;
+		dst_pixels[1] = src_buffer[x].g;
+		dst_pixels[0] = src_buffer[x].b;
+	}
+}
+
+void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = src_buffer[x].a;
+		dst_pixels[2] = src_buffer[x].r;
+		dst_pixels[1] = src_buffer[x].g;
+		dst_pixels[0] = src_buffer[x].b;
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 817e8b2124ae..22358f3a33ab 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -15,12 +15,24 @@ void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 			      struct line_buffer *stage_buffer);
 
+void get_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+		      struct line_buffer *stage_buffer);
+
+void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+				  struct line_buffer *stage_buffer);
+
 void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
 			 struct line_buffer *src_buffer);
 
 void convert_to_XRGB8888(struct vkms_frame_info *frame_info, int y,
 			 struct line_buffer *src_buffer);
 
+void convert_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer);
+
+void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer);
+
 typedef void (*format_transform_func)(struct vkms_frame_info *frame_info, int y,
 				      struct line_buffer *buffer);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 28752af0118c..1d70c9e8f109 100644
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
index ad4bb1fb37ca..393d3fc7966f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -14,6 +14,8 @@
 
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

