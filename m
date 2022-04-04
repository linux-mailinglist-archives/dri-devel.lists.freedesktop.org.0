Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9594F1A33
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611CC10E50C;
	Mon,  4 Apr 2022 20:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B374210E50C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:46:01 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id c4so8844058qtx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=chS5uaKi0AoTHO6TeqFOYP539iz3wPCRI1843wxnLG8=;
 b=SQbiiDqeadO+MCv59fkkU4EdPMyZ92+G5TgOfTv8VCD4mRyDwJ7OmbLahvEQe2wXcg
 OAUOfYVw35zwPIL5pk5RKLo4aMn0HL9wGDkJLrUJjxuv6m10FVB7RlVUzjhaZojOL7cQ
 +ArJpK8mlH8nnLMV8uCDQVBoPoLVRK3BwBkzhQAwdy19vr9FzCBKpYoL3CFXbxb8m3+O
 XZCO0JYfbWfpWMdoAmpmXCdrnC7QAN+XI2bcYHkM6Gj33tLwXldnhxhX5X45Z+izA9/Z
 NRXMe0kw+2wqI+5GOmeON7x74b5PqDVt/+4asB1j1wlidGoYDHX04R129YmvOposB3FO
 qZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=chS5uaKi0AoTHO6TeqFOYP539iz3wPCRI1843wxnLG8=;
 b=Kt+jBbgEtTv3L5ORO6AwH+JXJC/NgZglJpRvrqoGIjOh2/F4tAji3cbQ0CWWmRzC9Q
 VRLkLFEBcxMek6Kh6f2IDyw7JtyB9OViHQfl6gNq8CC9itlgVq6YlDgAcZc+fSjWOJRV
 Puc56knhbWurfP4fPIB4YimeGL0aMrTkqQ+psNJPWssZtX5I22t+zw80RCn6vyXuah4i
 CqDLTI1Nlhy9ydjAlJ4u+6SO1uKmhBjnSk97Hs279mibd2GuHySJNM2NFw6cRi8tVRUs
 sPW9Q+WGSNcP7vKpS7YMpOXFGZWEcl6O9T8Z5L7PHH9C0g4IxxDiQAlwbuOfn1oZrUbF
 sw3Q==
X-Gm-Message-State: AOAM530vDjq6sBAnu6VjSV5fj7udBzwjFI2axDNedL+2eDaTCfZzqRiW
 47Q7EVHD7sknADjsXJJRxeU=
X-Google-Smtp-Source: ABdhPJwqWjEK2PnPmscPHisMIphnozJD4iWV6N+gk5a9bfLMIwetqJEQ+PTyT7P2ZyE1HkkO9g70ew==
X-Received: by 2002:a05:622a:254:b0:2e1:ca15:3cbe with SMTP id
 c20-20020a05622a025400b002e1ca153cbemr160318qtx.650.1649105160847; 
 Mon, 04 Apr 2022 13:46:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:46:00 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Mon,  4 Apr 2022 17:45:14 -0300
Message-Id: <20220404204515.42144-9-igormtorrente@gmail.com>
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
index 931a61405d6a..8d913fa7dbde 100644
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
+	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			       stage_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
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
+	int x, x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			       stage_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
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
@@ -130,12 +165,50 @@ static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
 	}
 }
 
+static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
+				     const struct line_buffer *src_buffer, int y)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
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
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = (u8)0xffff;
+		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
+		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
+		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
+	}
+}
+
 plane_format_transform_func get_plane_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
 		return &ARGB8888_to_argb_u16;
 	else if (format == DRM_FORMAT_XRGB8888)
 		return &XRGB8888_to_argb_u16;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &ARGB16161616_to_argb_u16;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &XRGB16161616_to_argb_u16;
 	else
 		return NULL;
 }
@@ -146,6 +219,10 @@ wb_format_transform_func get_wb_fmt_transform_function(u32 format)
 		return &argb_u16_to_ARGB8888;
 	else if (format == DRM_FORMAT_XRGB8888)
 		return &argb_u16_to_XRGB8888;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &argb_u16_to_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &argb_u16_to_XRGB16161616;
 	else
 		return NULL;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 798243837fd0..60054a85204a 100644
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
index 97f71e784bbf..cb63a5da9af1 100644
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

