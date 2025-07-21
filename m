Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763AB0C18A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C9B10E4D5;
	Mon, 21 Jul 2025 10:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MVBz7JJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D710E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5562838ce68so4064751e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094658; x=1753699458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RB5lNaovChCD8tOuVlmGSmp/T+ZYteObQVStiP2KQcA=;
 b=MVBz7JJ7KlQiY2ai9LjWmz9P3ZXALN5JMQiSgJcRfe7rWs3qRCCOA8ly/xHCP8eP1D
 9fvqNwIJwLh/5kA5n8CJn661jumhDh0AP/2FUoqPblU/yYVJ0aUyHaVXQyKmDJiobcQ4
 EZKZ5WKTxgRBYPatJmCTUD/+85CnZd4iqoO4T9kSMb+1qMoaK2wT2SV3NrJj12Gvou4P
 YRAxAfnCiQ0gVbRhrxslun7DKJZNvmngpF6pIGnicEzFXjgyVUTS+7mO37gDB4gI4PDh
 /aOptC0rwsZIIOX8hsWyodal/0EOV6qKkwFyXs6NXBbkSGpNOnq+gvE5WATcPelG1gQp
 EODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094658; x=1753699458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RB5lNaovChCD8tOuVlmGSmp/T+ZYteObQVStiP2KQcA=;
 b=GuZcrwzGpQbZhtXV2nz9qbiReI0rjjFn2v2R/64w0J4NIC4zFZtQuWvV6gXOWzQULq
 SxfMuH+XZvgP9Oq/gKE590vpWnhFptRcyuWRedgbTJnGCxCvrzmUF+3NrTh3bmT8uIYV
 k25Sbjo9GAsSC5hbV/q8eR/pRR1FD+kW3Vrhp3a7+mH8KRPzkNoPVT/jy3ph4S5uGCO9
 nJ40GAn94wrrH8W17Kbcbz7Q3M+fLHi5YQyGeQomNjo3Mdvyvy8xm5i59RfJbIm+jE9q
 pmOrKN2RJaRnuUg9gUtyL9aLejSxuNE5pS1+AIgUG5B/E5RZFwDLV1E0Oa4cD64ar4tl
 0xsA==
X-Gm-Message-State: AOJu0YxkpfMF3c7Kq5dXpg9i7k75FL54lGjI23K0+Br5SITylknB2/hE
 fsHv2IHbJqR3O+qqNYeXQpwq/Rvl6NtKqdj2JaQktr5cseAGLyMXHRej
X-Gm-Gg: ASbGnctoCLbiPjl0tHdZ8zsXyi2zy0LowqpWQZLA6TjvDeG1Ad3TqbyZA4I/CNwNnsG
 wul1E2/cgs8fqKiSAgLZ3flcKRVZwlbs48pKnXeykxFUBuyVOFoPZlrZywtJCwee0srzV1xtx9O
 iyHHclyj82eQld87kxk8sMrKaz7BIb9MNgV4dfcF/Mp8lAgh9uxMDvb41mgezzfr3dGgjXeM/XB
 DdWfqLiNZQZb8jl94Raa/jb4w+soETpBDFGHpBWYvLKpxQHaSZehare64is4a/xwR7JOrKC5uCL
 L7V4KHoiYWgxLLGQ6ZOoRSx08KPnbler+7dFkKJ0QgorI8CL2VltqT0LCuaWNsJIBuY8dV+q2Oj
 aKmJ12f36P+jqmngnvrwyJXFuQi7eLAwtiYjiPDQYqWszHWN+s4pEDKn+TBAZXDvwtf0=
X-Google-Smtp-Source: AGHT+IHGsOjqFEHcEedZtuyZb6FZVdOlC4x4WmTDRlK+Kfy/7WqcMJrzVPtzqLQcqUNw+Lsn6He+rQ==
X-Received: by 2002:a05:6512:15a7:b0:556:c4f1:c7c8 with SMTP id
 2adb3069b0e04-55a23edf989mr6883902e87.3.1753094657570; 
 Mon, 21 Jul 2025 03:44:17 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:16 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:35 +0200
Subject: [PATCH v2 5/6] drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-5-159f4134098c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5865;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=I4G+JbRsrDS4oV8BaxIOe0VI1PnFurXtnr3+a5PfHc8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhntAIhYW7Ru64HRSQ9tF2adBEFc8r1kE6pGt
 347ncirUmOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z7QAKCRCIgE5vWV1S
 MkqAD/42Gtw753U89r020ZUpRSb79kQummDbxmfUUJvvn90m+3IqG1mqI8H5gupczDBp20+nQ27
 1oJUtqwIXXwY3b+MtgILXzRqLdbQ7oVqNe1OhCg9EDANnawA2iXMY/mWg9cgRNfId9KTpHj230k
 L9QvUTsePwfAjdDEPwDZB3DcwUnsDwf+Mynq8e2YOHEH84Qe9iec45JDjsUEQReSJFI/6f2JKeo
 5CEZgM0XuNSPFLalICab0r/v+EcA4ieOqdOPiGxdSv/iCNJIcb7NiYQhtkkh7313J3FbCyUGeD9
 li1pZ2une7hHLaJqyojwV0GpmrXAsbbigEW89IPZBWRrTiluhaI97NZwncr0Azeqo3LFaZZ15jJ
 BduqfJpR94GZH10fjIHdkO36CrU4AUylpmyc+w3qiqdDGU2EprLB2OnJ7svooEeoFMkDpPiwWj5
 wp2lrMZ8lu7NGTqzoADpjftq0wU1TxF88rXqDXQUEmozquylftG0pCApr51Xm1OAL3GVWgz5F8x
 wOaZsWp64k5D8tjapjh6rS9wfdOqgdKdfBO8gR0QVY1BHypYETHgRxGV9Rrl3qG7/gzV7UIKibX
 NFZVmIIF5pqxO9yy/6QaeXutdSEMjUF8iJ39EQNljRqUBdg6nvH4edqFPfgXBq3WJ+GyuF0UA9R
 fSNiPPs/c+bgF3w==
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

Convert XRGB8888 to 2bit grayscale.

It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
intermediate step before converting to gray2.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c | 108 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |   4 ++
 2 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8f3daf38ca639d3d39742c2c9fa0c54a3a9297a5..bfeaa4db6929859ea029192a868e6d42741b31f2 100644
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
@@ -1359,3 +1378,92 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	}
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
+
+/**
+ * drm_fb_xrgb8888_to_gray2 - Convert XRGB8888 to gray2
+ * @dst: Array of gray2 destination buffer
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
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner). The first pixel (upper left corner of the clip rectangle) will
+ * be converted and copied to the two first bits (LSB) in the first byte of the gray2
+ * destination buffer. If the caller requires that the first pixel in a byte must
+ * be located at an x-coordinate that is a multiple of 8, then the caller must take
+ * care itself of supplying a suitable clip rectangle.
+ *
+ * DRM doesn't have native gray2 support. Drivers can use this function for
+ * gray2 devices that don't support XRGB8888 natively. Such drivers can
+ * announce the commonly supported XR24 format to userspace and use this function
+ * to convert to the native format.
+ *
+ */
+void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+	unsigned int linepixels = drm_rect_width(clip);
+	unsigned int lines = drm_rect_height(clip);
+	unsigned int cpp = fb->format->cpp[0];
+	unsigned int len_src32 = linepixels * cpp;
+	struct drm_device *dev = fb->dev;
+	void *vaddr = src[0].vaddr;
+	unsigned int dst_pitch_0;
+	unsigned int y;
+	u8 *gray2 = dst[0].vaddr, *gray8;
+	u32 *src32;
+
+	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
+		return;
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+	dst_pitch_0 = dst_pitch[0];
+
+	/*
+	 * The gray2 destination buffer contains 2 bit per pixel
+	 */
+	if (!dst_pitch_0)
+		dst_pitch_0 = DIV_ROUND_UP(linepixels, 4);
+
+	/*
+	 * The dma memory is write-combined so reads are uncached.
+	 * Speed up by fetching one line at a time.
+	 *
+	 * Also, format conversion from XR24 to gray2 are done
+	 * line-by-line but are converted to 8-bit grayscale as an
+	 * intermediate step.
+	 *
+	 * Allocate a buffer to be used for both copying from the cma
+	 * memory and to store the intermediate grayscale line pixels.
+	 */
+	src32 = drm_format_conv_state_reserve(state, len_src32 + linepixels, GFP_KERNEL);
+	if (!src32)
+		return;
+
+	gray8 = (u8 *)src32 + len_src32;
+
+	vaddr += clip_offset(clip, fb->pitches[0], cpp);
+	for (y = 0; y < lines; y++) {
+		src32 = memcpy(src32, vaddr, len_src32);
+		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
+		drm_fb_gray8_to_gray2_line(gray2, gray8, linepixels);
+		vaddr += fb->pitches[0];
+		gray2 += dst_pitch_0;
+	}
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
+
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

