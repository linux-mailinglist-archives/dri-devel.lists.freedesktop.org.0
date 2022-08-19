Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879C59A545
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D106F10ED8E;
	Fri, 19 Aug 2022 18:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C53710E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:42 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id e3so2093220uax.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=H9jvaz+TKhTQQ94jOPEMuxEBJ78Jbnz5dqMWHsk+m9k=;
 b=pD6+XKD/yBoAvQXNMBRtJS8XV3o0PgNvR1UhxDtXTJ2MkmTm9vTYlv3P4rfJOtgpxo
 GeU3Mgecz9DJuG5Az5hihBCKf/2aurnPqpbZcSNQUEtAdCpDLK0iPh5QnaSvlxC0buka
 V7LqsXu/h+eLOVrmvqzwGXtKkGQUR5SoEJW2UcboFby1qTZxD+YsriAJfi77Qrl6Qz6U
 I8lp/Sg35nKj0rtcL9hjeWJwPRjwzoG51ZNCuWYEZ5DoALzoACRNI/qCXoBsX572ismL
 NsCTQe5sU9GLlau4Sa7za9qQHxGtDnS0NSmwYccO3BQj5ecH5Ad85rNZCVycFsqGpHSj
 cVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=H9jvaz+TKhTQQ94jOPEMuxEBJ78Jbnz5dqMWHsk+m9k=;
 b=dqvtPRMOzqGMGfDb7UvSZgqZb27WrPOuI2/ffMS11wAewzfuBA5JSG0F2r6Ks5/Noj
 CC+B9/PySVeoboYuCyEJPf43wTWHslwaeXAUZTzQuB27jpSUBm6ywY3oSyrFCfuzZE+E
 jIzP313arDyXubYiu7I5S6sd2I57H7jxVOCUiMXYvcnWW+t9jSzITI5BsIw5qIoeNWvC
 WTJHQSIGHazJu4WwBm4PGYu1GVQ5qH1NUnnKRt0AV/CL9MRxOg+nVeTBBoPmKPx/IEQF
 4jRWqcNcK3JTtq6cQtLO44n5Vrs5M8/bc4sCSrIGjOCfZvbcJ4mWLtSS8aca+aOxwvfW
 lAEw==
X-Gm-Message-State: ACgBeo1coqbWT1LQt4UuypHknNS6v8hXUAmZAycBGQDgwT+RRWHmC/HQ
 mY1b2mXS0WUTQorYOj6dhbk=
X-Google-Smtp-Source: AA6agR4Mp+GTWO50rHhvTwqhEdrT4JPvf68rgi5XTLsMGNjuRi8bsycm33ePV2aik5yH1xfkotzwbw==
X-Received: by 2002:a9f:37c8:0:b0:390:c1c0:70ea with SMTP id
 q66-20020a9f37c8000000b00390c1c070eamr3304927uaq.53.1660933482544; 
 Fri, 19 Aug 2022 11:24:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:42 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Fri, 19 Aug 2022 15:24:10 -0300
Message-Id: <20220819182411.20246-9-igormtorrente@gmail.com>
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

