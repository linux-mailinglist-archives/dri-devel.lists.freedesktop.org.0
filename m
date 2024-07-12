Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BA92FE52
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 18:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1374210E197;
	Fri, 12 Jul 2024 16:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dwwyLYEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4C10E197
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 16:17:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-36798e62aeeso1314072f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720801057; x=1721405857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lbJoy2m5aoNCDq8f3t+gfMSoffEHVypJP0uEKVRuHxA=;
 b=dwwyLYECGOPGudkfpyjqTsir44q37sdUDhOZxBvNY35fx575p6zJP5vkqkvTPO94Hp
 2YfrC6vJakXULVSnkzCx/paxqPM7w4fy4ShWEgFPdtMzyI5xxCKsjNABrHTk+T2p2snG
 W3QsFO0k43UZV8KhpxCIiIa/Nvc9Vccc7iKmgOqUHVDs/HVbuYACGdTKE5XABPFscDdc
 GFbmQN2f5xzEP9eycXAZ6xhMJBA1X454Rc+24WtanzbSVMV1aM08TVG9+lqmYnPeZoZ8
 3GhACt/1nJDcwVKz8RZEUHRbiMnTKCUazxmrMOrzCd25NdJOOWCBJUNBeKMiIHaGZFPm
 f7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720801057; x=1721405857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbJoy2m5aoNCDq8f3t+gfMSoffEHVypJP0uEKVRuHxA=;
 b=twM9u8ZscSkrslzuy/ul0s4WZunIUBLTOj0hX3cVtk4fL2ZkLEC7hM+g018dC0U0Mw
 rf3Gp+JghiTKhF17PZQ49QxagAJRhf+z98Dd5oHoFlTS+oFQOyilol6eE8wopGkT7sqG
 M1pjqGwb/OdwlOHDKOH/5jDl4n3X76PQB5B9rHEdGjlSexm/09l3ehMLyU75Tmw3AHxj
 ZNjl5UnZYRAFKv0gKLs3o8V12OGTu4Z1sgIedgJKoNel/o2j1MKZi6C9Nk/LJUO1tFjI
 eTnW3YscaSkDH7HENgPhrBVNHuOz6d0zMHRTH9iaU/iZ8/7MGhMhO0sZTGtKJQoMv4l4
 7FUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcn1C7QRlwi+GOnT3syOtqPPbXZ+gGP860Vnj/Qj2XxSSK0GrK18KyC76M9v6rI4txo2BKHWomnfov1432i6dSV2paqMlFwtyYkIz4m+x9
X-Gm-Message-State: AOJu0YyGPMPnm4LiY97EhNvLsY97ko9oLqgxkhTsxvM528yS/DhjNV48
 PrfZbpyBHW5+y93aIqdDe5DvG68BUhX7EhBjiAGnBMcKY1EfZ6Ly
X-Google-Smtp-Source: AGHT+IFWxN4rabKRUz5jKXIs3M8YQGe2GEQUzwOkpeAL4/186T7kLbwYdXf5FMtAiaktuiwnfpiNqA==
X-Received: by 2002:a05:6000:2c3:b0:367:f281:260e with SMTP id
 ffacd0b85a97d-367f2812acamr4537665f8f.3.1720801057085; 
 Fri, 12 Jul 2024 09:17:37 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa0650sm10568385f8f.69.2024.07.12.09.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:17:36 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Date: Fri, 12 Jul 2024 18:16:56 +0200
Message-ID: <20240712161656.7480-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building with Sparse enabled prints this warning for cpu_to_le16()
calls:

    warning: incorrect type in assignment (different base types)
        expected unsigned short [usertype]
        got restricted __le16 [usertype]

And this warning for le16_to_cpu() calls:

    warning: cast to restricted __le16

Add casts to fix both warnings.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 32 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 36046b12f296..053fa6ce41a9 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -77,10 +77,10 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 {
 	u16 *pixels = (u16 *)src_pixels;
 
-	out_pixel->a = le16_to_cpu(pixels[3]);
-	out_pixel->r = le16_to_cpu(pixels[2]);
-	out_pixel->g = le16_to_cpu(pixels[1]);
-	out_pixel->b = le16_to_cpu(pixels[0]);
+	out_pixel->a = le16_to_cpu((__force __le16)pixels[3]);
+	out_pixel->r = le16_to_cpu((__force __le16)pixels[2]);
+	out_pixel->g = le16_to_cpu((__force __le16)pixels[1]);
+	out_pixel->b = le16_to_cpu((__force __le16)pixels[0]);
 }
 
 static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
@@ -88,9 +88,9 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 	u16 *pixels = (u16 *)src_pixels;
 
 	out_pixel->a = (u16)0xffff;
-	out_pixel->r = le16_to_cpu(pixels[2]);
-	out_pixel->g = le16_to_cpu(pixels[1]);
-	out_pixel->b = le16_to_cpu(pixels[0]);
+	out_pixel->r = le16_to_cpu((__force __le16)pixels[2]);
+	out_pixel->g = le16_to_cpu((__force __le16)pixels[1]);
+	out_pixel->b = le16_to_cpu((__force __le16)pixels[0]);
 }
 
 static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
@@ -100,7 +100,7 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	u16 rgb_565 = le16_to_cpu(*pixels);
+	u16 rgb_565 = le16_to_cpu((__force __le16)*pixels);
 	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
 	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
 	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
@@ -180,10 +180,10 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
 {
 	u16 *pixels = (u16 *)dst_pixels;
 
-	pixels[3] = cpu_to_le16(in_pixel->a);
-	pixels[2] = cpu_to_le16(in_pixel->r);
-	pixels[1] = cpu_to_le16(in_pixel->g);
-	pixels[0] = cpu_to_le16(in_pixel->b);
+	pixels[3] = (__force u16)cpu_to_le16(in_pixel->a);
+	pixels[2] = (__force u16)cpu_to_le16(in_pixel->r);
+	pixels[1] = (__force u16)cpu_to_le16(in_pixel->g);
+	pixels[0] = (__force u16)cpu_to_le16(in_pixel->b);
 }
 
 static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
@@ -191,9 +191,9 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
 	u16 *pixels = (u16 *)dst_pixels;
 
 	pixels[3] = 0xffff;
-	pixels[2] = cpu_to_le16(in_pixel->r);
-	pixels[1] = cpu_to_le16(in_pixel->g);
-	pixels[0] = cpu_to_le16(in_pixel->b);
+	pixels[2] = (__force u16)cpu_to_le16(in_pixel->r);
+	pixels[1] = (__force u16)cpu_to_le16(in_pixel->g);
+	pixels[0] = (__force u16)cpu_to_le16(in_pixel->b);
 }
 
 static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
@@ -211,7 +211,7 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
 	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
 
-	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
+	*pixels = (__force u16)cpu_to_le16(r << 11 | g << 5 | b);
 }
 
 void vkms_writeback_row(struct vkms_writeback_job *wb,
-- 
2.45.2

