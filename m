Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB21A21F05
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6795510E0E3;
	Wed, 29 Jan 2025 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d7Ky8pn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237C10E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:23:00 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-46b1d40abbdso63826581cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 06:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738160579; x=1738765379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m3Vr7rDCdLY3fWFeEGwlf0aZurussB/pry1dFRJSq3g=;
 b=d7Ky8pn0xr+7KdyTH9gsbCn1bVsxt4cOdn89O/Vw6MZodzEYY8tWJTE550kbfPO+jz
 sIksxeb1HClob1KlGKnAb7h/xDXHpVPK6UVdNZt7jKtLQqdEhCcP6ks1vukJ/dHhUiO6
 MBqz8l/znpmssP+Gbl+aUycLSr5y4wKFO6TKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738160579; x=1738765379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3Vr7rDCdLY3fWFeEGwlf0aZurussB/pry1dFRJSq3g=;
 b=dNQVRHZB4E4FaZuDuDVtSNdv4xdNgMveRV3oE/CBJk8lqpl7z+ZQ037ynvhf3nMnf+
 /g00vCFYlqHnow0APxZJFdf7K3kT89Bucn7zmLrZ2CiTE07cAnZfWl+ppUGfsVbu4rwX
 KF3Y+SEpW1f3Vu05qlgaIe2nU7b4h4rmFN4H9Brs6lVUNftt824W+jdm6lZVh7ei5CW9
 0ZpJ//BFx2/U8DpIXobmi1Az6d7xHj6oU7VKH1oon+QFZvqzFxal1joFK3EEVxCBv+L2
 a+MeQhf+T65rfwhmCREHTfx0sBimoSWg71kQOF2EuvOzv6Fdalkdo9eKmV/Ir96u8F0Z
 gv3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQx3SoILWjnwvkDQbpUpU4V2mWLV0gT8iEvReh+agrQ/H6Y3dYIar+BVXvV4vpDg1BJov7UXpU8eY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/SEI6GYORYdmzfrAbUIe1/CMPWzf8rxVahNm+DBhtCv861zZE
 HbMdy5l3rA4qIMKCNvtxvmEPcUutq6qFWrF/qQpxs+/zkcKclqod6tsMScMmug==
X-Gm-Gg: ASbGncsihr2jx56WXjFjSKY8Sk7He32qBL3b1e1wXek0C/rEq1U79vvBSh9JeB94QRm
 gMMOH/HcFZ6yV5zLQ2IQt6p2xGmLDD47iQhmjOTROCRj89bBEOoaXNVnDENdddinH42K7BsanGJ
 Du0mTQPlBVGGA8o9zpvvSbUwdVPYHDlZy7JTRE0Br1fbJdKLNEg7/i9V7xdCNv9PNnmP4SpRQ4d
 jF3UjRAgLF6vohz89+GKYy+YcS1Fq4xNt5em0CIwtnD2jPv4ZqoOdtgINyNRRhbbd6j5r+v4oE6
 bctCIfNYq1cQ3Xei62HmI5iiJkdVudIFs5qiYMcxr5uvR75YgTnkCbKjIy4Pa0eapw==
X-Google-Smtp-Source: AGHT+IEzzNGoAQ+MCMyI9cApD6caAlYD6BvCXp3pfu/kjewZwnnoDTvJsGUXFi4yVlnscy0LANg/8g==
X-Received: by 2002:ad4:5c4e:0:b0:6d8:a76d:b66c with SMTP id
 6a1803df08f44-6e243c949d8mr46528436d6.30.1738160579164; 
 Wed, 29 Jan 2025 06:22:59 -0800 (PST)
Received: from pazz.c.googlers.com.com
 (34.178.186.35.bc.googleusercontent.com. [35.186.178.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2057a8fc9sm55590426d6.76.2025.01.29.06.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:22:58 -0800 (PST)
From: Paz Zcharya <pazz@chromium.org>
X-Google-Original-From: Paz Zcharya <pazz@google.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@google.com>,
 Melissa Wen <melissa.srw@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Drew Davenport <ddavenport@google.com>, linux-kernel@vger.kernel.org,
 Paz Zcharya <pazz@google.com>, Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v2] drm/vkms: Add support for ABGR8888 pixel format
Date: Wed, 29 Jan 2025 14:20:58 +0000
Message-ID: <20250129142238.562999-1-pazz@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paz Zcharya <pazz@chromium.org>

Add support for pixel format ABGR8888, which is the default format
on Android devices. This will allow us to use VKMS as the default
display driver in Android Emulator (Cuttlefish) and increase VKMS
adoption.

Signed-off-by: Paz Zcharya <pazz@chromium.org>

---

Changes in v2:
- Rebased on top of tip of tree. No functional changes.

 drivers/gpu/drm/vkms/vkms_formats.c   | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 39b1d7c97d45..30a64ecca87c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -253,6 +253,26 @@ static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start
 	}
 }
 
+static void ABGR8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
+			       enum pixel_read_direction direction, int count,
+			       struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u8 *px = (u8 *)src_pixels;
+		/* Switch blue and red pixels. */
+		*out_pixel = argb_u16_from_u8888(px[3], px[0], px[1], px[2]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
 static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
 				   int y_start, enum pixel_read_direction direction, int count,
 				   struct pixel_argb_u16 out_pixel[])
@@ -344,6 +364,14 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_
 	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
+static void argb_u16_to_ABGR8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	out_pixel[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
+	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
+	out_pixel[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+}
+
 static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	__le16 *pixel = (__le16 *)out_pixel;
@@ -420,6 +448,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &ARGB8888_read_line;
 	case DRM_FORMAT_XRGB8888:
 		return &XRGB8888_read_line;
+	case DRM_FORMAT_ABGR8888:
+		return &ABGR8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
@@ -453,6 +483,8 @@ pixel_write_t get_pixel_write_function(u32 format)
 		return &argb_u16_to_ARGB8888;
 	case DRM_FORMAT_XRGB8888:
 		return &argb_u16_to_XRGB8888;
+	case DRM_FORMAT_ABGR8888:
+		return &argb_u16_to_ABGR8888;
 	case DRM_FORMAT_ARGB16161616:
 		return &argb_u16_to_ARGB16161616;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e2fce471870f..e34f8c7f83c3 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -15,6 +15,7 @@
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index e9b5c74d7c58..fe163271d5b5 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -17,6 +17,7 @@
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565
-- 
2.48.1.262.g85cc9f2d1e-goog

