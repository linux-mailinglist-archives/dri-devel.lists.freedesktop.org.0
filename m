Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C7C54A306
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEDF10FD17;
	Tue, 14 Jun 2022 00:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89A10FD17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:03:04 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bl34so9742271oib.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yJYhIXlg4BgvZplhBTbCGJupYw6aUpEpn1un9Y8ECIE=;
 b=pK54s2SGNcoSyWD/w74tFiBMxltffYNE3Obb8qzqjFeq6EUbVGqgAabao1i4J/HNiv
 x90eD/aVzchXY8qdMOtEBGrdqZmJty8XPUZZ+U1BCDXRChoXELly05Y8bP1LO+FYSnhD
 +UPbbblWWWD442QLf1kVQRManm5Qc7djBsaA/iSea6W142QJDPZHMFMr4fUXWxWFnAqj
 jpiY00TTCgtQx+3dfnGcyPBczZ5Bx7RJLTNb46CCKHbNgxk2ANJbVm1EhHXaGcXzYwpQ
 ph60IJfYE1vWL0np8wD9dQzus7eZC8MHMrRHsf7jThjvlh1Kn5M5bsJQB5OZkv9UM209
 oGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJYhIXlg4BgvZplhBTbCGJupYw6aUpEpn1un9Y8ECIE=;
 b=Ek0g64kAnQwY7zjlgn8Lm4TE1tC/5iLeznVG9eKFvL3HP4Ix6Pb0NYnB5Xtn9IcX2L
 VDXzshy83lYeOO656oe+uLQyoVnhtnpSYOgL86snamwHXetUWPY/SAROBRvvYW0fAoQB
 rHzVjIzFy64w/rpg7MrXLvcPAsgkdK7TEDU+vnl+23Dl9th2NYJ7fUVUGAOVafVMAcWA
 fW1RYiXkoAWZQHv1M4r6A0dQxjjpmKWUS+szQsWmq1GbmdfNFhn1g0TBkuqPs279jvyR
 cPc6Ebxgim5wnjSFmBoRcKGqmoEhjAH4LEFl3RB+RnlvmOQSgYggjp5n2zbBBvCXHC11
 mH/Q==
X-Gm-Message-State: AOAM530nykPckvqWFWLvZXDpQqHCA1i2/2Y0ybwG8WkssZUjCT7kgqWR
 GOYRd2bpx3INVbkga7GdvuU=
X-Google-Smtp-Source: ABdhPJxfoGESBE/vflALEGGE4qQ2MsUq5qxeHaW+mDwR55oHvK+XooGIBSTp3EVr+dDl3CT6TUJyRA==
X-Received: by 2002:aca:6702:0:b0:32e:fec8:b682 with SMTP id
 z2-20020aca6702000000b0032efec8b682mr702147oix.271.1655164982323; 
 Mon, 13 Jun 2022 17:03:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:03:02 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 9/9] drm: vkms: Add support to the RGB565 format
Date: Mon, 13 Jun 2022 21:02:26 -0300
Message-Id: <20220614000226.93297-10-igormtorrente@gmail.com>
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

This commit also adds new helper macros to deal with fixed-point
arithmetic.

It was done to improve the precision of the conversion to ARGB16161616
since the "conversion ratio" is not an integer.

V3: Adapt the handlers to the new format introduced in patch 7 V3.
V5: Minor improvements
V6: Minor improvements (Pekka Paalanen)

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 587e0e078d82..b646292addec 100644
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
+#define SHIFT 15
+
+#define INT_TO_FIXED(a) ((a) << SHIFT)
+#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
+#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
+/* This macro converts a fixed point number to int, and round half up it */
+#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
+#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
+#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)))
+
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
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
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			       stage_buffer->n_pixels);
+
+	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
+		u16 rgb_565 = le16_to_cpu(*src_pixels);
+		s32 fp_r = INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
+		s32 fp_g = INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
+		s32 fp_b = INT_TO_FIXED(rgb_565 & 0x1f);
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
@@ -197,6 +238,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
 	}
 }
 
+static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
+			       const struct line_buffer *src_buffer, int y)
+{
+	int x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
+			    src_buffer->n_pixels);
+
+	s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
+	s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
+		s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
+		s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
+		s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
+
+		u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
+		u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
+		u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
+
+		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
+	}
+}
+
 frame_to_line_func get_frame_to_line_function(u32 format)
 {
 	switch (format) {
@@ -208,6 +274,8 @@ frame_to_line_func get_frame_to_line_function(u32 format)
 		return &ARGB16161616_to_argb_u16;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_to_argb_u16;
+	case DRM_FORMAT_RGB565:
+		return &RGB565_to_argb_u16;
 	default:
 		return NULL;
 	}
@@ -224,6 +292,8 @@ line_to_frame_func get_line_to_frame_function(u32 format)
 		return &argb_u16_to_ARGB16161616;
 	case DRM_FORMAT_XRGB16161616:
 		return &argb_u16_to_XRGB16161616;
+	case DRM_FORMAT_RGB565:
+		return &argb_u16_to_RGB565;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0e33e3471d40..53646ccf141b 100644
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
index c417f94be2a2..c6e4f3d7aa0d 100644
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

