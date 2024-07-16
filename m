Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53D932E3C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 18:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9B10E2F3;
	Tue, 16 Jul 2024 16:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jMxjARrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6642510E2F3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 16:17:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-427b9dcbb09so7989715e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721146675; x=1721751475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZeN1JKbn+6j0alFZ89rnlW6N1xknefS8N93zgRlvMA=;
 b=jMxjARrTjwVoQ0XRfCGx7zQPNwpnmNZLX//GEoToXHhsWJYHTIbIxotbZCEcGkiOdJ
 Hlj9RJYIvfaAhymaRJQDrHy3qslzWeIZ13ee1bIN08pYPDWQatY9YyPvrME6OlQJPcsr
 KIQJdZE5of+28A+ib7No8RSLXEa2jzbKUCOY1HpImtnfGHuU9b5IUejV+Srn3HdV/ctf
 jYLhsTYU0+bDgd4Ou9+CHmVHa4TF8wPoc+woVkYz9yKnW1lacE4noIf5GUM+9DG3oa9v
 y9ga546OSZVfC44iNbupqp6LG7L1YMo5ZB3y0X7EOfnsqcvD00Npaas1NIVVxfXJGnbF
 5Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721146675; x=1721751475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZeN1JKbn+6j0alFZ89rnlW6N1xknefS8N93zgRlvMA=;
 b=AfvSdtKq6p8gIAyvas0a42G7VGawNw8il2lFtTPuZ2RSWyKNej58szXTQid6YvnJft
 QM9RR0HX7J4uDvdBI1W2u62aM+VzLKJXrYobX6QpfRBXjk+gNSjyS3hlObEyBNMzJcZO
 NZfhC8C4QRZwD8rYbdYW6Qwq+ogrU+9iRd4PyntOkj73LQjfzQnLhqZ3yOIhdz+je7eN
 D8mFFDGSM/N6UM/R9Nhqv1HnL60QzkpCvsx//4/DZb0oYpj1N38NeW7hO4Vu0INEC20t
 omOgFq8QqUNQx+MVx8dETlp+ua8n99VqZEGDrFpZN1KW6y+FOSpKSFzbOfjBBzLFKCtb
 IbSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikEvQ7FmeE0hBzP92T7X8XN8pT98Tkb6q/8hfGJbnLRQR4gYQyGKkbnkSXN9a5dxHv/3dDJR1KhZmihg3J+nAXCdH6CPbf4416CH1rUV9
X-Gm-Message-State: AOJu0Yxs5XhpCKI678UWYaHVeixH08ej/PSKhd02UolceEdLRQ1KcFaO
 FocvK2y5YfcXphs5eTbOBDyGP+5mRvX9Djsc3DeQbSR06Id/fjZ0
X-Google-Smtp-Source: AGHT+IFJsyBz4QKVZoFptOjpM7uP5mZ4dQVmHAesj63IFhfw0ksphWWFLeYKa7hneCDC3CLTZqPyCA==
X-Received: by 2002:adf:e64d:0:b0:367:83ea:9a6c with SMTP id
 ffacd0b85a97d-368261029d5mr1959246f8f.24.1721146674423; 
 Tue, 16 Jul 2024 09:17:54 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccc9csm9457846f8f.57.2024.07.16.09.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 09:17:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Date: Tue, 16 Jul 2024 18:17:26 +0200
Message-ID: <20240716161725.41408-2-jose.exposito89@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/

 - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
   multiple casting.

v2 -> v3: https://lore.kernel.org/dri-devel/20240715151625.6968-2-jose.exposito89@gmail.com/

 - Thomas Zimmermann: Use cpu_to_le16() instead of casting 0xffff
 - Reviewed-by Thomas and Louis
---
 drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 36046b12f296..040b7f113a3b 100644
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
+	pixels[3] = cpu_to_le16(0xffff);
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

