Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22559A547
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6895F10E7B0;
	Fri, 19 Aug 2022 18:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EDC10E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:46 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id g17so1554073vkk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WzTXFGA7cwNW4vLyXowE+XNxKOUzSn74DvrhwHnY40g=;
 b=kMr8OfObUTKEzMo1mw4Z5uOtavulOQ9aBrHVqljUmYxCNGXtaKe50glaNowQpEzg10
 6Ce0Vz93qM3CcOUhvm6bZyG2FidncHQ3NeSA2x6T6TM3nRfeK9MLBF0ZCQd/wY84Lx9Z
 FlHFrBXIB2sm+HDX5ujoNeLlufX60EVhyfYBVs5cqGj+ZYp66hLupijlRSgw9VwI3qAi
 rMReiDKfGB1Rwt69dUMD+/oNsfo7wIo3Y1JDEMs6e2eyhjI2Ox4kYkLljti3vwVjCsVm
 Tc6LgCEpt33OxCkxxrRHsAjH5v8OnDdbj+Ccysd+c6mOA2YQr07/uTBG7awcGLnewYEE
 sJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WzTXFGA7cwNW4vLyXowE+XNxKOUzSn74DvrhwHnY40g=;
 b=75Z96CZ9LMFTl8xNNvil8rkZGPnJNscd3480kUTsateHxdt0PE1IELMuzJZ20MQdl5
 2vhruhEk4I08RtYDDmtjxsCfDcWNVrR8DZOFR1oLLlwdJkPXC8wulScYTiXjZoNzpYCD
 1J18a9ES9XIxCFhbnuLMDh+WEy4GpoagEZ8G/gUhsVFpiLdHAU/sIqHnct6DN/eq2+pg
 UHFPgQVwQZs8jdWda/kBH9JmnhJYc1X3uH0Vm0BkIhhdzrDXb3kpjaO3eCeqvept0UDc
 QjIrfSyedwViDwmnfAtoA4f1dz3/3/Q4zbnrjuyytwtiQdFJnq2VtFwiPFEscOgElRax
 YpEA==
X-Gm-Message-State: ACgBeo3YPIBmawIzf5MU2Zp6aBMxapyt7eYI4Xf76FLAYxQFlv/rWdqP
 8X0ZS6kaMvTDAMOqeij5e94=
X-Google-Smtp-Source: AA6agR4CS6+dWLw1A4Hnqh+RX98Y0Sxj4WHcIj9VhfmTSedSg24jFf5NfaCAsrgU5yhbFSRVYKzLAw==
X-Received: by 2002:a1f:ab0d:0:b0:376:b4aa:f05f with SMTP id
 u13-20020a1fab0d000000b00376b4aaf05fmr3528877vke.25.1660933485345; 
 Fri, 19 Aug 2022 11:24:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:45 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 9/9] drm: vkms: Add support to the RGB565 format
Date: Fri, 19 Aug 2022 15:24:11 -0300
Message-Id: <20220819182411.20246-10-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819182411.20246-1-igormtorrente@gmail.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
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
index 8b651ffcc743..3f6a3cdb81e5 100644
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
@@ -199,6 +240,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
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
@@ -210,6 +276,8 @@ frame_to_line_func get_frame_to_line_function(u32 format)
 		return &ARGB16161616_to_argb_u16;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_to_argb_u16;
+	case DRM_FORMAT_RGB565:
+		return &RGB565_to_argb_u16;
 	default:
 		return NULL;
 	}
@@ -226,6 +294,8 @@ line_to_frame_func get_line_to_frame_function(u32 format)
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

