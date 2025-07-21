Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2625B0C18D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07910E4DA;
	Mon, 21 Jul 2025 10:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="keB2tT+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB07D10E4D1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-553e5df44f8so3683134e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094659; x=1753699459; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cEVQJX/SYaok2ELlEAnWGTHXSwBKm7K9AhgOU6uSUA4=;
 b=keB2tT+6kzHx9sKi1oycl1o0utHrMrZcr7rHAn8vor0sLpLii9ZMiQA2lzAGS8XKcl
 xNkTstoDt5fqkSEybJVypJIXq6TlLq0k7HVPjBmB3ALNsj9wEVgGHb6F3XONvJFPQagh
 4XZ5hFF484djGM5LVnvmHLnlHlnjhkndTWYGmlGGR81IhFVZRFpVgOJenDpEPSF8Av8y
 VPcXIAcEEz1TBrrFBHAHSlDSU/6xJ0j0TfB1ISTR61b2g3ZddcbtnCEgEOlT/ETSazUA
 QYP6Ah0ZNb3KAAqqNisKJGt6/kyJNT4b1AntoVKGtrzJvM55z/LQqalq5uk/lnHC1tAB
 rGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094659; x=1753699459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEVQJX/SYaok2ELlEAnWGTHXSwBKm7K9AhgOU6uSUA4=;
 b=Hw6hx5MANU9tQ13p48m4DtKbrQ0iL18t1xHzRc2veU13GovijSNDgtGLQpIbp8QQLz
 5uhCOMBJiECz5ujC1z4LiCxmbCc5R0bkZy5f4S0rmnUTrfdPWO9oonkHttG6ZQwmSYO4
 8kXYg2DKUzQg0L3F+p/gf8idLKNCdQ6wlVgYHbF02gyZCqdyYLut0gU4AxzodwKDNj2u
 ztKhQWK7jFY7XX+59sSYTNxp7No8ffVJ7gQZrT+FGfZO9N01h41gCnRL9klZos0EAO7l
 sr14Gx/eCZexbDcr+768o+5VVDvkKbkNKebp69OE1PyIsL4kWVjuwBXwDkTuTgwjzYjb
 MHfA==
X-Gm-Message-State: AOJu0YzYfk2WF2Z7Burw0EfKfb1i5mztmnTWcuo+m1am5gQCJ8pVZ8oq
 js6IIi/HlHBOTIFtPj6H+t9sV472h8Z30PDKlx3xyi5ePiAqL179NMc/
X-Gm-Gg: ASbGncvmkdM/urU8nNKJ+xECPAnkxS4NLE7jM33t1wwLA3vFE7caO+HMvg235Ep7RhF
 G8D2VVtY9cdllUrvjRzTqJTGm2ctX+wuMo0kSpzhq2A9h31vFFTF9wvfZo8qIDkfo6eQY/iBRPE
 meHFQHHYwp7fd2+awtMoUKCcbvfkpJIA93O/Cq3Jb1cR4ySScYdlmt8ZGlHxgWcoU7MCWg/Ld1W
 ccHYvJvpRPx6sFYP8j2GWFI9mhwdFU81LgATZAyBxfoL6zcw4hIgOThw5EsUMdQX/AUK84nxLcw
 hBM86FpAs5R0XPWNyhpwaZicoZoXt6YDfO1qP9ucyoFGDa41uyVZuhOh/Au8nOF6Taze7U6hpAa
 Rlsm2IQDuNo5XBG899atqNISpgwJ3+43K2NSicITIckmk3rj2KDFild3UqGfv1qBsuv4=
X-Google-Smtp-Source: AGHT+IHXrE/b7Rgb/FIQPijG5gK8yp/2SErYc3pBimq59GRkoNvzydms1sqxH8TRJFa3u4jKeHLB9Q==
X-Received: by 2002:a05:6512:4002:b0:551:f0ce:80e3 with SMTP id
 2adb3069b0e04-55a23f2d1e1mr5119301e87.25.1753094658913; 
 Mon, 21 Jul 2025 03:44:18 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:18 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:36 +0200
Subject: [PATCH v2 6/6] drm/st7571-i2c: add support for 2bit grayscale for
 XRGB8888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-6-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
In-Reply-To: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3639;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ja2G1eJ+TGuBldLn7eDuIWTNyT69bULS5f7eLL4mV1U=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnyibw5+htt8L/mz/Z6LY19g2cML7+of3ndE
 OqD2okki9yJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z8gAKCRCIgE5vWV1S
 MoaXD/9EaTHWfHlZ+G1qRPSwOSFiQsBlb/EiAKzsJwKXxKbakXiCIXx9td6UhhxPUR/IyJuvVn/
 mHP3Goy+tleR+6GD5woJb/5ZhNT1i7ixI918yfPeDF96GbX3EPp8/8Fqn/cbvvOMxAqBt/Y47Zu
 9KffqVAa0Jkw3q9+yse1eX+9aaO0PjzAr8Sdsf4xbggmoRMU4kKNN0mgo6jqy25XP1Mi6beXDHf
 HzToFKyAcESqeLuN8d4OG/ELhs62cLRYpL5A5C2NdIU4kHH0RCjGhDFyQgTLE5WaUzV07rFz9Sx
 VVRzRyG8FIpc1N2p5r60+FJNTJuDL08znCG1187KgPiL2fk8g6DdijmeapZlviN3FZtE2wDNklC
 PHfs3DeZfD9YGgn9OsbvQoC3taMhet8qvpBIHTxMNM15sH2hkjlTwt2IKGLy+SqOK26d9oSJ11R
 V7Xl4yIEiRi88m4ZXo4UJR+n0PdfUAOmvzLNpkwQ1NEK5UUDUHqO+gT07DuQRUp3YkBAQYoF+XH
 qm3I5q7S0RM23k+oAsFTw2kllk2tLXJ+T4+UydTIIaL9F1VcWdmZnVlh/vF/+qBN1T+EeOF3818
 9uF0ru6G7rAw+XGorLS5VnqeGI+6Q60cKFfXp7dcXenUypYI40xLMDhQ1KV2k+AWk59BJYFpB4e
 DgdrnByYHPxK3NQ==
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 9f2de057ce9d990fdd77e395a6c32ba1e2f36137..6c5935c37a2abf99116f8c2f67eec25bad90c8a8 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -219,10 +219,11 @@ static int st7571_send_command_list(struct st7571_device *st7571,
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
@@ -237,7 +238,7 @@ static inline u8 st7571_transform_xy(const char *p, int x, int y)
 
 	for (int i = 0; i < 8; i++) {
 		int row_idx = y + i;
-		u8 byte = p[row_idx * 16 + x];
+		u8 byte = p[row_idx * row_len + x];
 		u8 bit = (byte >> xrest) & 1;
 
 		result |= (bit << i);
@@ -304,11 +305,11 @@ static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
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
@@ -334,7 +335,7 @@ static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, struct d
 
 	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
 		for (int x = rect->x1; x < rect->x2; x++)
-			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
+			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 1);
 
 		st7571_set_position(st7571, rect->x1, y);
 
@@ -359,14 +360,13 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
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
@@ -374,7 +374,7 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
 
 	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
 		for (int x = x1; x < x2; x++)
-			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
+			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 2);
 
 		st7571_set_position(st7571, rect->x1, y);
 
@@ -395,7 +395,7 @@ static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct dr
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

