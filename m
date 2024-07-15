Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593493176B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAF08914B;
	Mon, 15 Jul 2024 15:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DyzwwoEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139638914B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:16:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso30391405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721056616; x=1721661416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b1CAVNEyp708piBojRejIUPpryPK1bcTc+oCowoUiFI=;
 b=DyzwwoEIDdV3nGjGu8vJN2742hzq3W9wODPbWxqBZN2pveW6lFyoHk+Osq6260Gq0y
 pEGvZSxbAJQBtMzcm0QsKsYPjBzgqSE9lUY0VW6BAlXah4Xflp/E+nipXcTxrSSg7XzK
 ZNfbfgeqERzKYUmDrkw+5E+da+tfbKsKL21Qb1Zcj3yYCymAJ6GO0UO5sRS6KOF15E7o
 Ca2HI9YXD1azJgVTht8Yx38xCD+XhkhGlnIisX3OhPnpquiHlF6Ialoc7nMmBPZtcZN6
 3c5jHu2FuxQnOMsm1bJKcgdaLxaf9hZ+E0EvUacH2xw+VlKSmI9p4VoyOmUY4bLrdeYA
 GcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721056616; x=1721661416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1CAVNEyp708piBojRejIUPpryPK1bcTc+oCowoUiFI=;
 b=mBT4BP/v+RzMAbVq6A+wSjcOmIlXU/4u7o4ZPSkG8DKEkp+AZcQK7fGgTjeIM5Q/8Z
 E074+m71EARugfOK3iNO0nwyA//kNpkzgEohcWp55bZHQNMwSf5slmNRXNiIyMvA7xJR
 woRxVtZbbXMa49fz1R+yWEHThZwRFPvjGsuS/tQr9sQZCsO4ntriuuHTZZ//0v9VkwN6
 FOjk41xZ+JWnJx9unXxlRCXFmpz+DT00XkLSrdHcYJw7/kC94ah0OWOVEF1K3M5lg740
 4njXpxU+dHwLCMHzFCxV2JaNFDZIS57nYXz+TdfgNh2azjBEeArLhAvrPldbl91Fz8Xh
 HP0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvdgAa/lkS49IG0brvdKCbW1I2JIjf3s6IxlSMI0ElhANLDlPEtfyEhkaZIa8pX+vZxMJej1kYDP/rkwapIC1sTqcVY4I/WHXdA7san2jQ
X-Gm-Message-State: AOJu0YzDKv9Zi2zI1GO/XIv2kPG3Knqyz8CF+s2bBiOiMSiTHur/5U77
 Y8WuzzwK7Q1KPyYT6ziL3r9DDcLumuIo9qOl5Elwfi2rOJEXfIuY
X-Google-Smtp-Source: AGHT+IE6oyJsVTFtqaV2gPzN+u1hsmchNLkDokd4ODWbDPstYtty4GVvCL/XAkJKsqO+gZ8MF3CXbg==
X-Received: by 2002:a05:600c:5129:b0:426:62c5:473e with SMTP id
 5b1f17b1804b1-426707f7db0mr128603205e9.26.1721056616120; 
 Mon, 15 Jul 2024 08:16:56 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc42esm125799335e9.32.2024.07.15.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:16:55 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Date: Mon, 15 Jul 2024 17:16:26 +0200
Message-ID: <20240715151625.6968-2-jose.exposito89@gmail.com>
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

Declare the target buffer as __le16 to fix both warnings.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/

 - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
   multiple casting.
---
 drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 36046b12f296..1ff535222bd4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -75,7 +75,7 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
 
 static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	__le16 *pixels = (__force __le16 *)src_pixels;
 
 	out_pixel->a = le16_to_cpu(pixels[3]);
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -85,7 +85,7 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 
 static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	__le16 *pixels = (__force __le16 *)src_pixels;
 
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -95,7 +95,7 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 
 static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	__le16 *pixels = (__force __le16 *)src_pixels;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
@@ -178,7 +178,7 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
 
 static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	u16 *pixels = (u16 *)dst_pixels;
+	__le16 *pixels = (__force __le16 *)dst_pixels;
 
 	pixels[3] = cpu_to_le16(in_pixel->a);
 	pixels[2] = cpu_to_le16(in_pixel->r);
@@ -188,9 +188,9 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
 
 static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	u16 *pixels = (u16 *)dst_pixels;
+	__le16 *pixels = (__force __le16 *)dst_pixels;
 
-	pixels[3] = 0xffff;
+	pixels[3] = (__force __le16)0xffff;
 	pixels[2] = cpu_to_le16(in_pixel->r);
 	pixels[1] = cpu_to_le16(in_pixel->g);
 	pixels[0] = cpu_to_le16(in_pixel->b);
@@ -198,7 +198,7 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
 
 static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	u16 *pixels = (u16 *)dst_pixels;
+	__le16 *pixels = (__force __le16 *)dst_pixels;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
-- 
2.45.2

