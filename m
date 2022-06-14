Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54E54A305
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0B110FD1A;
	Tue, 14 Jun 2022 00:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595410FD17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:03:00 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s124so9766397oia.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9jvaz+TKhTQQ94jOPEMuxEBJ78Jbnz5dqMWHsk+m9k=;
 b=ImnqCiba5X1AT2qo6Gd4aKvmnbdLHL0Cen4rkYU6mmTlz9J/1yqh3kosCf0pwanD34
 whoHo+DOkjm7aFxiEoYx2xSMwCdJYREWM3R4oz88kIpCz4GnYtYGD86ZpmhCl1gOQRJc
 FFgFfPoJCShpOaA7DrmvTdYJYfwFlLtjRWB0tMbgvwKV2UUTa0hPXtQWE7mFoGBEA6JD
 F17Xo4yCFetiiKKJJAfDQBlUj0Zr85da0tchvVqc2GSrmv09BIVTwa8aV504HYtn/TO8
 0GIcAOBZseufrByMZCrZzIivtjGK+9Zo9BkB3Gpm4gnUb9w2N4QuaNAFLMJzJuaELrim
 cxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9jvaz+TKhTQQ94jOPEMuxEBJ78Jbnz5dqMWHsk+m9k=;
 b=j7WMWu8I/kTN4nDxnoElEpSmAJDRyv68DNDBjZsuusroPLzx0r33jzthlAZVxVRt6Y
 64mMfYy4G94odNS3T4oSJpsME8cIn+LXRjKmPvcXcLPRFuFWU8DoK3EmS5U4X5PdiPG8
 Bc5y/BdrefcXijch5BkBeu//zpqRKOrIC0sod2YuZKqfsA+ri4X3HWv8zRLIM6RRtgvF
 kQ+2nWnBJFFQawmlMlXULRrEBLMRqzZdg3WdMoM7/j2cK5rk+kYSdrnWeYrJVQnrY/ef
 PY7Er1JIUOVIaff8R17jWD/7TcdMs4hZjgf3GFoZ5WbNzIMla3OUMtd6FNBBZFLGVYB8
 b5fg==
X-Gm-Message-State: AOAM532A0QSC58ww2tRR5VTIQz9YvDh8efFCe3Cajdxn41ES7/BWEltP
 xnv1JMM75uglKB+rVREGdDw=
X-Google-Smtp-Source: ABdhPJy8OHVItRKn0eX0CSPeS8eVKi9GXLKA+WfyhWw8Jn/CAs7nhqm3+IHcMRdE4wxpYVzZRYTDPg==
X-Received: by 2002:a05:6808:1387:b0:32b:1e76:e60 with SMTP id
 c7-20020a056808138700b0032b1e760e60mr731899oiw.172.1655164979176; 
 Mon, 13 Jun 2022 17:02:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:59 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Mon, 13 Jun 2022 21:02:25 -0300
Message-Id: <20220614000226.93297-9-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614000226.93297-1-igormtorrente@gmail.com>
References: <20220614000226.93297-1-igormtorrente@gmail.com>
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

This will be useful to write tests that depends on these formats.

ARGB and XRGB follows the a similar implementation of the former formats.
Just adjusting for 16 bits per channel.

V3: Adapt the handlers to the new format introduced in patch 7 V3.
V5: Minor improvements
    Added le16_to_cpu/cpu_to_le16 to the 16 bits color read/writes.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 77 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index ca4bfcac686b..8b651ffcc743 100644
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
 frame_to_line_func get_frame_to_line_function(u32 format)
 {
 	switch (format) {
@@ -137,6 +206,10 @@ frame_to_line_func get_frame_to_line_function(u32 format)
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
@@ -149,6 +222,10 @@ line_to_frame_func get_line_to_frame_function(u32 format)
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
index 7a479a714565..0e33e3471d40 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,11 +14,14 @@
 
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
index 974db5defce4..c417f94be2a2 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -15,6 +15,8 @@
 
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

