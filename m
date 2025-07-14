Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6288B038A7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E6510E41B;
	Mon, 14 Jul 2025 08:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZsOD+Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8EF10E419
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:41 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5561ab55c4dso4275035e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480280; x=1753085080; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p263TqCClLXlOHu3dp7Z4XuoCZcYckTKI9E2PFULeZU=;
 b=YZsOD+RvPJr6dIrYkQjRPJ5q2OE/7RLvxfDgxyYM6BvLZSLweFxAKu1/K+WpOXR4FA
 bvldSdB7L3RGRxnUHC80E7HNfTqxKP3yQesOb4OQNFpUeazoVGDqzr8dXUbaXpeYNlRC
 AUqIkaYB68LrBbCkNPF247ZRPUVS8a3m1Gx6N1diYSN542+tTjSHBV1wwuNb64hkMkMG
 hBYwMEfSNBRR1KnW5OMKY4g7LPGB0SHSLW8rFuh0+z0tcNcno1EX6Lb+1uGd9LxLtToD
 iIeIaWJUi9Zl6N929WD/e5V00Ii8PgE9cHP9XEllmQYHkAYM0/t1foigcG594HGPgSru
 F1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480280; x=1753085080;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p263TqCClLXlOHu3dp7Z4XuoCZcYckTKI9E2PFULeZU=;
 b=b6WpG5PdC5tNf/N8ugfOeY7tkuMVj9GyrN/tRLC3Hp/mM/9BSoGiJpaSXfa0HrJk3n
 HeAShVC680QFzvQ6N36vZpmY678JB7Qkk/lEkrCTqgpZKf/5bBPqV6POwApOtBDU5YEl
 Zrh9r2klX8RytQlGExIusOrpE8Ugz6j6mPIfva7s9O7OBCoNRMuNq61Sq0aoPjezUrQl
 juy2pQYkUvLR/vYyYWVSAxhbN5qF5Hq8MFx84hm+26s8slVFH+o2G/se4+ueTHz1AfHS
 xVkBDCUNknHvWt7o3q8dg75UwdEGf/E/q7cM+1s5BrAKsFuhoy6IRNxqCrxU16nVpLl8
 zhog==
X-Gm-Message-State: AOJu0YwErkEXSRH+vL53ncePb4CeW1g2Xd/gJRpA6sTc6eyX8Wyysz+P
 xUXd0A41bLrvQInpDvmSq1MhyUcuub/duzObtIwyvoUx2GtLaUSCUQlo
X-Gm-Gg: ASbGncsMY35dmuckp1GSJfndYvU94g5UmrsuREaMTdgPBTdcs1d7trvVbHE6ISaodEP
 vlYsvo0h19f4PIRILRktXeE2p6BbRf3CLq+ghR0VcRT+IWFpI37nItyo+dRcroUobB6x6oeT0kC
 j8GwWLKN3Bjhj9AHCPWihSyCqb4c1kfn4Iwe5C3qRJIO5pSiIjNeFgF3mzWBEVJ3UXuuZdusDv7
 NPnH6R95GhAX5gzKxAwjSUm44JvYhF9ylA1Sa+ARRJh60EuUH5XB54KMjPbXI3iLzw7nw55Okp6
 2ge2VVc3VTJ7vhWHnz7CKAlkpUmhTz/ChxmFMpFvNgMt+Mytb+J/VaRtilL+gpaD3aybBy1djkG
 kwdn+T3dcGNeWk9Gk1xE+BvE+DdQIk3dgxS+TJOfjcECtpmslARtn7CiiBgHztFmn+54=
X-Google-Smtp-Source: AGHT+IE3ZGGk8mZi8PoK4ms4CTR4TyCRXk7fcOY1Cm8zIS7n5cos+N2F2WJeqZ5ykBVRsyCfAC7TLg==
X-Received: by 2002:a05:6512:1384:b0:553:a490:fee0 with SMTP id
 2adb3069b0e04-55a044d1e73mr3798544e87.10.1752480279357; 
 Mon, 14 Jul 2025 01:04:39 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 14 Jul 2025 10:04:03 +0200
Subject: [PATCH 5/5] drm/st7571-i2c: add support for 2bit grayscale for
 XRGB8888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-st7571-format-v1-5-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
In-Reply-To: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3579;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=lEahKLLZv0LLgcdxOGD69aUK2W4QHfqMPLiGWzoEYP0=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLoKlMDoV62CdpZv99GtIylRkXaQLIgIy6fzV
 /c8d65lA0CJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS6CgAKCRCIgE5vWV1S
 MhgJD/46rCLbofHMykyf7wYDHr1TeW7OTQOPfm4/xt0V5SR16spFYk9WNtfROaJOvNKjD22h14J
 8l8hAIBl9TyUgpPB1RgyQt6E6KcIWLb3crFcefFMorm5BK+kfuNOl+fUDmaU0H7vzEArNP/jF6a
 UGZL0lq/KAEZFHnepTZ5gx/oDWkLftwDA4N84po1d7zo1jWewiDsrooiwIkYPzdrep04nYGy9JB
 X1ZE+iVHzJX9q2aoUTAfq6FmgNCJsEhlrlx/R0eVQjgTyOW1DtP2ZxpXKaGc5wXTcNtZHrdIRTy
 7vIl3LMqXbu4KpNBqkmZcCqSl/JbykhneDMeId8clmcdzsajmfJ960T36E6XU4CBUJrEe1FZ4cf
 MPBAH5M12rWvpqVntdnQH+EBg36hsvQ6hsG0BpK0twJ936RBSv+LMs8VV0Vv7Zl4EKPH4H+HIdC
 gmKnqNcqPha7EtYe+26O7P0FYqipFVd5ZFaEkeYDuSBwHWIl+0IRiQiEcbjt6GxMMqycs2Eo9pn
 T9CmDtOQjyN8uIMjtK2+CebhgSoMFnEqEJElDIEhurPahT/GsRPnMsvwz3WsNAMY6JSj+fa/hhx
 nxexDgw6d1G8G5d8m8Yuo9AzFLA0RbWcaewPi1RvZdA2BdqbStpDfdLXLDZI/8CfL8+5zz/GVdL
 p0wjLz3aZ5HqxCw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Add support for 2bit grayscale and use it for XRGB8888 when grayscale is
supported.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 6a5d719f8b0044ec700ff119972b580c904ffb27..2af800a4c5e4960f3dfcebfeda4554b56015915f 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -215,10 +215,11 @@ static int st7571_send_command_list(struct st7571_device *st7571,
 	return ret;
 }
 
-static inline u8 st7571_transform_xy(const char *p, int x, int y)
+static inline u8 st7571_transform_xy(const char *p, int x, int y, u8 bpp)
 {
 	int xrest = x % 8;
 	u8 result = 0;
+	u8 row_len = 16 * bpp;
 
 	/*
 	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
@@ -233,7 +234,7 @@ static inline u8 st7571_transform_xy(const char *p, int x, int y)
 
 	for (int i = 0; i < 8; i++) {
 		int row_idx = y + i;
-		u8 byte = p[row_idx * 16 + x];
+		u8 byte = p[row_idx * row_len + x];
 		u8 bit = (byte >> xrest) & 1;
 
 		result |= (bit << i);
@@ -300,11 +301,11 @@ static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
 	struct iosys_map dst;
 
 	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB8888: /* Only support XRGB8888 in monochrome mode */
-		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	case DRM_FORMAT_XRGB8888:
+		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 4);
 		iosys_map_set_vaddr(&dst, st7571->hwbuf);
 
-		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+		drm_fb_xrgb8888_to_gray2(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 		break;
 
 	case DRM_FORMAT_R1:
@@ -330,7 +331,7 @@ static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, struct d
 
 	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
 		for (int x = rect->x1; x < rect->x2; x++)
-			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
+			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 1);
 
 		st7571_set_position(st7571, rect->x1, y);
 
@@ -355,14 +356,13 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
 	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
 
 	switch (format) {
-	case DRM_FORMAT_XRGB8888:
-		/* Threated as monochrome (R1) */
-		fallthrough;
 	case DRM_FORMAT_R1:
-		x1 = rect->x1;
-		x2 = rect->x2;
+		x1 = rect->x1 * 1;
+		x2 = rect->x2 * 1;
 		break;
 	case DRM_FORMAT_R2:
+		fallthrough;
+	case DRM_FORMAT_XRGB8888:
 		x1 = rect->x1 * 2;
 		x2 = rect->x2 * 2;
 		break;
@@ -370,7 +370,7 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
 
 	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
 		for (int x = x1; x < x2; x++)
-			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
+			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 2);
 
 		st7571_set_position(st7571, rect->x1, y);
 
@@ -391,7 +391,7 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
 			 * For monochrome formats, write the same value twice to get
 			 * either a black or white pixel.
 			 */
-			if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
+			if (format == DRM_FORMAT_R1)
 				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
 		}
 	}

-- 
2.49.0

