Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C100DB10F6F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA53E10E03A;
	Thu, 24 Jul 2025 16:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KZO5ZyHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89FA10E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:12:01 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a510432236so907646f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1753373520; x=1753978320;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sKE2Yth+IoZ8wREbSbWpM1Yc17BubACX60lHqBMyElY=;
 b=KZO5ZyHDXZISUws5GWSEGGvBhTJCZLGekJGhY7xiiDtCOrhZ1jvgGWxbAwB6vXwHPt
 I9HRdS00U4nKEj00k1wNGP1SO59iBP5P5jyqjdwTwvGqsBsd5tegLq+H01H1rGrPPU9m
 Orx+EYv+eKp0lDqMwcaPVThkacPTMSWCTb6NIPGHOSENSx37zAi1LQ8m8hu+Pmh7JdbU
 BB5OPxtc3FjztLJFpTDpdOBopY0PqBUkJv6JMEuRQZTOk0h9qvbPws8Pv9e83arzUuP5
 1QN1uRb7EjsRPPQ4NJbU1VcBSo6BvXs/EjSrB9kPcjU+jGluZjBSC8gg21+lRJWp0goo
 WvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753373520; x=1753978320;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKE2Yth+IoZ8wREbSbWpM1Yc17BubACX60lHqBMyElY=;
 b=iHtH2v3Wtc8XbkbxrzF3ocvGBM7eh3WTskl50xTarDfosD073MWjx+CNKw75yRByBD
 2lY9wX9bCmldsODZcJSj/TgKA40KhYUvU24FKdxaU2QRk6VzP1RMmbrrYkog/6gSrBAg
 H0vWEfzk1ZbdUGPX6PIepI7st4iVJ/yO0Xw9CTlRH7R/mi/RiFeUbLl3FiO/PqHiLbRb
 8rYEuC7l48KfLtjdNoimczb7QZJRtewt7Q/00yaLbpGj3298enUXCTVKQEpGjwz2Mwp1
 5mM5x9/7OHBADB/qGSNmtpBNlA19QkvOJJrSOvq6VwMPs3Jitngmbs/GD9wI/SkO1sfp
 /ebg==
X-Gm-Message-State: AOJu0Yyz2LZ+n6RRcdrq0ynbyUzkZF8UP6Co60A6eoxmVIisqwCDL9nT
 FdF1Won1GNbvpAJAlkwvWt187ESYG3UyC/46dtiJVcMCZ5Gf3e3sGyVdLlRwt8hLcFQ=
X-Gm-Gg: ASbGncuetLeQNAftIsIUQ8mmugEvAkSZ+7jfAiGM3cCiy+0NSy/jyOF2w4JNA1wmOPw
 4u30vS3sl2EqfH6O2cOcOWMQBjMmJafleaM/ht9l1iT+gXzJp+RATgtOf4x8O3q9tayJ+NHlrx0
 NDQ/NusM0bSxOgCohQyBF07/MIYkOq1Q1iT01z/f8hT5sLDL0r6/KRMNH8G6c0sUtiTONYGtlHO
 GNpldZCtqi0TBfEXZt14/3ok7bBLhK4PT+ZorIHZLaOtMsEjGhA3gzdt1kQ0ufSEdk+EmUTAhQq
 T9fC5Zlh92dRtYbMMmo6Qp3jY7bhYIv+J+opG+0svg7vVMDvpcfrQsEllwJuo53Qrau1wKRG7Jn
 91NdxCoaloH5MFw==
X-Google-Smtp-Source: AGHT+IFERQTwzNbDaULjFQ2kQzB2Vjvp40JoxsenWhZmq9Krh5Kw8UX1u5qAYA7gY7+JEEXIyqnFZA==
X-Received: by 2002:a5d:4383:0:b0:3b7:739d:b4bf with SMTP id
 ffacd0b85a97d-3b7739db587mr697633f8f.51.1753373519838; 
 Thu, 24 Jul 2025 09:11:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-45870532a4csm24968315e9.7.2025.07.24.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:11:59 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 24 Jul 2025 17:11:46 +0100
Subject: [PATCH] drm/vc4: plane: Add support for P01[026] and S01[026] formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-drm-vc4-extra-formats-v1-1-67fa80597fad@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIAEFbgmgC/x3MTQqAIBBA4avErBtI06KuEi3ExppFP4wRgnT3p
 OW3eC9DJGGKMFYZhB6OfB4Fqq7Ab+5YCXkpBt1o2/Ta4CI7Pt4gpVschlN2d0dUwbbUmUF5r6C
 0l1Dg9H+n+X0/Nj9Q6GcAAAA=
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Robert Mader <robert.mader@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

There are now formats defined for 2-plane YUV420 at 10, 12,
and 16 bit depth using the most significant bits of the 16bit
word (P010, P012, and P016), and 3-plane YUV420 at those
depths using the least significant bits of the 16 bit word
(S010, S012, and S016).

VC4_GEN_6 can support all those formats although only using
at most 10bits of resolution.
Add them as supported formats for all planes, but filtered
by hardware revision.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
We'd been asked if the S01x YUV formats could be supported on Pi5 as some
software codecs produce them.
The answer was yes, so this patch adds them and the P01x formats.
---
 drivers/gpu/drm/vc4/vc4_plane.c | 54 ++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 056d344c5411..3d1342751a80 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -36,6 +36,7 @@ static const struct hvs_format {
 	u32 pixel_order;
 	u32 pixel_order_hvs5;
 	bool hvs5_only;
+	bool hvs6_only;
 } hvs_formats[] = {
 	{
 		.drm = DRM_FORMAT_XRGB8888,
@@ -247,6 +248,42 @@ static const struct hvs_format {
 		.pixel_order = HVS_PIXEL_ORDER_BGRA,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_RGBA,
 	},
+	{
+		.drm = DRM_FORMAT_P010,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_P012,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_P016,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_S010,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_S012,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
+	{
+		.drm = DRM_FORMAT_S016,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.hvs6_only = true,
+	},
 };
 
 static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
@@ -2490,6 +2527,12 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+	case DRM_FORMAT_S010:
+	case DRM_FORMAT_S012:
+	case DRM_FORMAT_S016:
 	default:
 		return (modifier == DRM_FORMAT_MOD_LINEAR);
 	}
@@ -2524,10 +2567,13 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
-		if (!hvs_formats[i].hvs5_only || vc4->gen >= VC4_GEN_5) {
-			formats[num_formats] = hvs_formats[i].drm;
-			num_formats++;
-		}
+		if (hvs_formats[i].hvs5_only && vc4->gen < VC4_GEN_5)
+			continue;
+		if (hvs_formats[i].hvs6_only && vc4->gen < VC4_GEN_6_C)
+			continue;
+
+		formats[num_formats] = hvs_formats[i].drm;
+		num_formats++;
 	}
 
 	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 27158be19952..4536e3c0533b 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -1079,6 +1079,15 @@ enum hvs_pixel_format {
 	HVS_PIXEL_FORMAT_AYUV444_RGB = 15,
 	HVS_PIXEL_FORMAT_RGBA1010102 = 16,
 	HVS_PIXEL_FORMAT_YCBCR_10BIT = 17,
+	/* 10 bit YUV420 formats with data with various alignments */
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE = 24,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_3PLANE = 25,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_13_4_2PLANE = 26,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_13_4_3PLANE = 27,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_2PLANE = 28,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_3PLANE = 29,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_2PLANE = 30,
+	HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_3PLANE = 31,
 };
 
 /* Note: the LSB is the rightmost character shown.  Only valid for

---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20250724-drm-vc4-extra-formats-1f53e6491cc1

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

