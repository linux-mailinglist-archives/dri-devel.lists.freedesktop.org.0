Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6719B038A6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3A10E419;
	Mon, 14 Jul 2025 08:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZds6QvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4F10E419
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:40 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-55516abe02cso3942235e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480278; x=1753085078; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O6n/TwiMXWZ+ZdKfM/oDMUklaYFacBzQ7BUUpsRuWbs=;
 b=kZds6QvUOFI65P9Q7UXBNA+UNMIxbtlJMDnoRg776jVwy5OSxUjRnMJVLjs7EPLF91
 rGY2R6lgaQgjACG43jcgjez5mrUmg4dTZM5BOhuO9hwFvxZY+iLPSVVewmklmEGnKVC1
 ifOWPjVBbgHXrLnZ2z3hvriXjWgn6KbFHOjwnL01k73sNeBcz6zve06RwaBiDwSTt8TL
 plYBzpOxZE/kzWuVpIdiaB84kuMdqZq/QeN3Vxx4TSMdpPUWQcpgeCVuSFzavnYEz6Xy
 0+/1M/xKm7R00hwBeDVT4Lu3N1huJMPBTK5pqYVeaWYEAiZvbgMcQpV003TmoX+5Cogx
 SBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480278; x=1753085078;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6n/TwiMXWZ+ZdKfM/oDMUklaYFacBzQ7BUUpsRuWbs=;
 b=FLv9RpBovlhjJ26K2O+uM7uo4L2sRjY5SytZx/NvRb1YU63aUJYubry7PFLEg1GRte
 g9TPNXiqEuS0rv0CPx6v85IdC1bcELb2XjMbAckyBx9rieHpORex7TkX0p7zZnqE3FPT
 I9AOR9iN3aKaejioV9TO0jdfjMpkszIhi96yXrok0y7yXud80waHKfo/BOEgqw3IRNVF
 +J0D+kLM6yRJsWzCbYfn9iEqaRCye3PrNxLMzkBSCuc6QxrPQY3zUiBZxomVIElD0/W7
 weHmMryGBWLIjnOYfb/yyhSdJzFTfpIvuYujtXXdGmWCbKiiPoTsooBSDSMZJjMx8ilm
 EOqg==
X-Gm-Message-State: AOJu0YwFM+B9Rea2iZR0I4NHjc8ms4mb4w3zzbezaJN+ycPW98jGzqTw
 R6DkTb6qdO9jbIh9cpj6zYKtLdLmlwlL2ISXMNBS8phYaXs81OhCdZMS
X-Gm-Gg: ASbGncvd4ef8o7Od4tvoLE14byA/CN9etSfAURYE4Jk6agc9eZm0hlZMusqFnC9HdNV
 CP6kgBibJd106bz+ALf1xPiSXxTuBTUuuo2A1hx++S2X76SHTVQY8G3ekhPgD9aWBRp2HfpT8lI
 8uru14bxnEpcsVgkQEVeTEGOQq7/Ok53geNfMMMzbVRBUBAP6wjszTygq9MMi3kCcyW+il8mKqc
 NWqbQdQZIBLg+HvzNR0tN12E7DLUWAmtV7bQEjunx+rdhInwsL6Xf3U1u40iPVLIVLF3wxP1Jri
 bw6MUmi0RtX9dhdnHUeitak7QjirTDk/mpfT7EUDCgPtXNd7+P4Mentf+OMNiJYKBtu0NcB2ZZr
 HgX1BFjo2qk+qg48KPTgeiy7BUrVmsR8P///y7EOjo0ldtudG3ggJsGQh6o752cbpZx8=
X-Google-Smtp-Source: AGHT+IEBE9Cy/LCHX7ybxe5olrJJBgZsocOmqcWEkUaqPVygE09g2iOxi2b1SpZvEuhz9qq28SJV5g==
X-Received: by 2002:a05:6512:a82:b0:554:f82f:180e with SMTP id
 2adb3069b0e04-55900715435mr4867704e87.16.1752480277970; 
 Mon, 14 Jul 2025 01:04:37 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:37 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 14 Jul 2025 10:04:02 +0200
Subject: [PATCH 4/5] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-st7571-format-v1-4-a27e5112baff@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10226;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ooFuzc1HYLH/b7G70oju18p8HTIYAY5mUG8vjFp+a4E=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLoF0ZTa/9a0Qdm2qtUpwNofhWVkNVOPnD9ne
 Q5kubcTwyuJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS6BQAKCRCIgE5vWV1S
 Mr1lEACqCwR6AEgqV8hZXgC3lhcGfGGsjZCWqN/PYINIXepXrFQgripCiZM4yiTtVj4kvcwr4di
 vshmO8yqdv03J1uf+Hd4XVGBSyh3XKfXjnpGA4MAU7sVpQgDiZUsJAsDkfo8LUW2wV0xEXGk889
 jRCf9OhWivNIMXsIda4HRqEBCyDN06vRjP15CQnCJ13YE2iDAkGmU9IQ59TWEo+i45LWIMqT8jw
 vsyrLGjjfqKxAwmDGBvoMJ3NW8LMTt2Uw9WrE3XLAPWn8D4bD1vF3mMcZnU3ZwazfAHLsQyG0H8
 iE1yWTrMhmlECoQT9RdkNylPM24i5sqSnN9nEEwdAwK0aSaulc6h0eRrlZE5W7AgbQ2u6FuGYav
 ae2xjatJMsWPoYdZ1kGc4RPYTE6pPJecpSjVIpXLZTOi3LiC6upSNUNgldSzOWYh/eeipfMGttY
 fkCv3AVtKkoEDvMjlNgG+2rOPUFnYLnAb9O2Wl2HBCKo15r3YfOd00wwVB8XLITk5pUEFbStxhF
 f1d+lDwKUQ4gN2naASe3AKQ4bHyQi8iJhkfIF2tLdhAVTbj8miuLObmFwO6mYlloYvYFIzu7MCU
 6loezOb/47UtkPfCIsvJ6nEwMS7F9a2xbKd04gOYPl2/tdBU5vLy0PCwOMzSSXhfyUqaMFR6ub8
 QoHxFM90ZqlNIgw==
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

drm_fb_xrgb8888_to_gray2() works like and share much code with
drm_fb_xrgb8888_to_mono(), but converts XRGB8888 to
2bit grayscale instead.

It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
intermediate step before converting to gray2.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c | 148 ++++++++++++++++++++++++++----------
 include/drm/drm_format_helper.h     |   4 +
 2 files changed, 110 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8f3daf38ca639d3d39742c2c9fa0c54a3a9297a5..2f2171b3df609263cc9ce6809bf6144028c25380 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1253,6 +1253,25 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 }
 EXPORT_SYMBOL(drm_fb_blit);
 
+static void drm_fb_gray8_to_gray2_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u8 *dbuf8 = dbuf;
+	const u8 *sbuf8 = sbuf;
+	u8 px;
+
+	while (pixels) {
+		unsigned int i, bits = min(pixels, 4U);
+		u8 byte = 0;
+
+		for (i = 0; i < bits; i++, pixels--) {
+			byte >>= 2;
+			px = (*sbuf8++ * 3 + 127) / 255;
+			byte |= (px &= 0x03) << 6;
+		}
+		*dbuf8++ = byte;
+	}
+}
+
 static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u8 *dbuf8 = dbuf;
@@ -1270,40 +1289,11 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
 	}
 }
 
-/**
- * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
- * @dst: Array of monochrome destination buffers (0=black, 1=white)
- * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
- *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of XRGB8888 source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
- * @state: Transform and conversion state
- *
- * This function copies parts of a framebuffer to display memory and converts the
- * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
- * least as many entries as there are planes in @fb's format. Each entry stores the
- * value for the format's respective color plane at the same index.
- *
- * This function does not apply clipping on @dst (i.e. the destination is at the
- * top-left corner). The first pixel (upper left corner of the clip rectangle) will
- * be converted and copied to the first bit (LSB) in the first byte of the monochrome
- * destination buffer. If the caller requires that the first pixel in a byte must
- * be located at an x-coordinate that is a multiple of 8, then the caller must take
- * care itself of supplying a suitable clip rectangle.
- *
- * DRM doesn't have native monochrome support. Drivers can use this function for
- * monochrome devices that don't support XRGB8888 natively. Such drivers can
- * announce the commonly supported XR24 format to userspace and use this function
- * to convert to the native format.
- *
- * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
- * then the result is converted from grayscale to monochrome.
- */
-void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
-			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+static void drm_fb_xrgb8888_to_gray(u8 *dst, const unsigned int *dst_pitch,
+			     u8 *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state,
+			     u8 bpp,
+			     void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
@@ -1313,11 +1303,10 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
 	struct drm_device *dev = fb->dev;
-	void *vaddr = src[0].vaddr;
 	unsigned int dst_pitch_0;
 	unsigned int y;
-	u8 *mono = dst[0].vaddr, *gray8;
 	u32 *src32;
+	u8 *gray8;
 
 	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
 		return;
@@ -1330,7 +1319,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	 * The mono destination buffer contains 1 bit per pixel
 	 */
 	if (!dst_pitch_0)
-		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8);
+		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8 / bpp);
 
 	/*
 	 * The dma memory is write-combined so reads are uncached.
@@ -1349,13 +1338,88 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 
 	gray8 = (u8 *)src32 + len_src32;
 
-	vaddr += clip_offset(clip, fb->pitches[0], cpp);
+	src += clip_offset(clip, fb->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
-		src32 = memcpy(src32, vaddr, len_src32);
+		src32 = memcpy(src32, src, len_src32);
 		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
-		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
-		vaddr += fb->pitches[0];
-		mono += dst_pitch_0;
+		xfrm_line(dst, gray8, linepixels);
+		src += fb->pitches[0];
+		dst += dst_pitch_0;
 	}
 }
+
+/**
+ * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
+ * @dst: Array of monochrome destination buffers (0=black, 1=white)
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffers
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * DRM doesn't have native monochrome support. Drivers can use this function for
+ * monochrome devices that don't support XRGB8888 natively. Such drivers can
+ * announce the commonly supported XR24 format to userspace and use this function
+ * to convert to the native format.
+ *
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner). The first pixel (upper left corner of the clip rectangle) will
+ * be converted and copied to the first bit (LSB) in the first byte of the monochrome
+ * destination buffer. If the caller requires that the first pixel in a byte must
+ * be located at an x-coordinate that is a multiple of 8, then the caller must take
+ * care itself of supplying a suitable clip rectangle.
+ *
+ *
+ * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
+ * then the result is converted from grayscale to monochrome.
+ */
+
+
+void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	drm_fb_xrgb8888_to_gray(dst[0].vaddr, dst_pitch, src[0].vaddr, fb, clip, state,
+				1, drm_fb_gray8_to_mono_line);
+}
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
+
+/**
+ * drm_fb_xrgb8888_to_gray2 - Convert XRGB8888 to gray2
+ * @dst: Array of gray2 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffers
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * DRM doesn't have native gray2 support. Drivers can use this function for
+ * gray2 devices that don't support XRGB8888 natively. Such drivers can
+ * announce the commonly supported XR24 format to userspace and use this function
+ * to convert to the native format.
+ *
+ * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
+ * then the result is converted from grayscale to gray2.
+ */
+void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
+			      const struct iosys_map *src, const struct drm_framebuffer *fb,
+			      const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	drm_fb_xrgb8888_to_gray(dst[0].vaddr, dst_pitch, src[0].vaddr, fb, clip, state,
+				2, drm_fb_gray8_to_gray2_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 562bc383ece4e90d96aa92b47b4f69609f825a6e..8488befafb7e0e0311f87bd2fef5011bab45065b 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -136,4 +136,8 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip, struct drm_format_conv_state *state);
 
+void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */

-- 
2.49.0

