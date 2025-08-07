Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E862B1D906
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0F310E849;
	Thu,  7 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OURQaiKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD6810E849
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 13:28:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so5441095e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1754573293; x=1755178093;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t+JAEqxyJMDbPnLThYT5ZD9ubwa0FCXjgitIbfJ5t0A=;
 b=OURQaiKuuGca9oiXXnoMiZ95deV1mMcv17EJozdABHSxEVO8PTRmA5VOUEZXhuY9H8
 QQsIjSMo8rlPxHKBuw5QzlRbz0QJLpLw7r6l8KMiHJd6ObtWv+xRkjtiBnAaSqvcbyMS
 lJb09uYViyS67kpZ4z/evO7P6l4sI0A29NRJDV0WNM0SVMi8GmBbw+w7v3MscsY07RcA
 rqHT5suvJ6BuczU5aGZQ48omAIJwB0niP6yzf2LPx2Qu+/RuwmT+jrn4tPCUJi9e6et8
 bs14jQsyBFbdSCHqIBvG+zpJOPhKvRhYHnqPRocjuUgbZsdE7KHY1mjgKyyQTKFbn1tn
 Twxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754573293; x=1755178093;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+JAEqxyJMDbPnLThYT5ZD9ubwa0FCXjgitIbfJ5t0A=;
 b=MoVZR5oa9DQ6hih9bSeQI8P1XnyGVK7mP/VphHgLl1RxfBtgUPDp4N4+kVBBUdjL66
 KLa3iWwKyA18U75JxNLi5oktjJIEg79N8G7zh+MK7iqtcs5rUOo7Ihbf3TlyQsS1Qd1E
 Y5Y18aP4XS4MTBmyWdBwc7PPtT4b83hv+9rwYDAWxjuZ+i65YeRpA6WUjgfMf+pWnFkN
 nDktOsE2DKIP8BkZnsOuMNXEdzwzRhJXNoKqpwHo65Tre7NglL6465b54xtTbA+gvZKP
 l3yUO7N9JrOQwngBLNPn/YVujfaD6Deu0vovTgUEAmbycKGJh2aEWrKfDtZMb7T4BBmN
 Y+VA==
X-Gm-Message-State: AOJu0YzIpToALvCtXiEyuIAOXAlbpHKshz3QhXu5CdzVI2G4/zmfpHmz
 RWdZt16qWJFNR6Vk8betp78A61ocs2axnDY8F14NDH2Xi6wOwj1fQhL0bfFQgE/yBhY=
X-Gm-Gg: ASbGnctUpXWF4qqgQTWdt7CUkHsZ6cdJr2BCXa+HOF/UFhDokwX1he9EYF7/KlSbWNI
 2TqLm8Cl0dpBF7VG26J5b//4FDyi5GN00efOlJaFBe+AE83hn4cRrU0kORDO9KzBoaqeSgAcG5K
 C1rMB5niquz5XxX3G7At8YLqMdm9KhEIlEsa9aH+URkzcEB8xNf9uYhQ9ekoPv8xD4lDQtrYKOc
 Rl/OCEk4tKMbfiqocrKbqmM8a30JtYazU8zHGky6HbwLYckSqS0Qndat1CWlJZ5DNluaeSMldty
 /VqCcewVuBLkaDWQymIgAlaaFazdhXSDBIbRZDbG6EHz6EiJ8rm6WGcYuGRVhjey3AjFUj2t3rA
 FXM8HrpzWoAxknw==
X-Google-Smtp-Source: AGHT+IHF2yCsPiDOgtV17k04sYTYWqc2mssf/r9Br2mZfug3d53GNJS3UMhcMXxRDhXsMKr+AUlNKw==
X-Received: by 2002:a05:600c:6610:b0:450:6b55:cf91 with SMTP id
 5b1f17b1804b1-459e70797ddmr56870985e9.6.1754573292628; 
 Thu, 07 Aug 2025 06:28:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459e6dcdbbbsm38337875e9.7.2025.08.07.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 06:28:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 07 Aug 2025 14:28:02 +0100
Subject: [PATCH v2 2/2] drm/vc4: plane: Add support for P01[026] and
 S01[026] formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-drm-vc4-extra-formats-v2-2-fadc93844551@raspberrypi.com>
References: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
In-Reply-To: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
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
 drivers/gpu/drm/vc4/vc4_plane.c | 42 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 3bdd9466a7b0..5fc26f705425 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -247,6 +247,42 @@ static const struct hvs_format {
 		.pixel_order = HVS_PIXEL_ORDER_BGRA,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_RGBA,
 	},
+	{
+		.drm = DRM_FORMAT_P010,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
+	{
+		.drm = DRM_FORMAT_P012,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
+	{
+		.drm = DRM_FORMAT_P016,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
+	{
+		.drm = DRM_FORMAT_S010,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
+	{
+		.drm = DRM_FORMAT_S012,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
+	{
+		.drm = DRM_FORMAT_S016,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_3PLANE,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+		.min_gen = VC4_GEN_6_C,
+	},
 };
 
 static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
@@ -2490,6 +2526,12 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
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

-- 
2.34.1

