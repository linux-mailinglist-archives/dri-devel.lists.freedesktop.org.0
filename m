Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07323910A61
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7B10EA99;
	Thu, 20 Jun 2024 15:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LGdK4NWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com
 [209.85.218.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792510EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:43 +0000 (UTC)
Received: by mail-ej1-f100.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso112857066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898401; x=1719503201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HasaC/0G/3uLI5emduahJoqcP3q+0fLWQRsxww8xIH0=;
 b=LGdK4NWuLLEWlrJ2LgBD9At59DCsx9mjYxFav0BfdE47GcjG6XSVPMpshuDpFA5J2D
 +v6M79BWDCxH4fzaVjaMM3aPHYyxNvqdWe/loLbKLu228BU7b5q6uGu4xWl/G2xEPUkp
 gj9PW8PAUqi6Ju6MgdF7r+Gs8D/L+TlbayxtswMgEcq4LRSARGsulgm9M+6BK3OujTbd
 0l0jvgQlADOpUPZFRzytWc+gOTiMUqn9uchWTkRBJifi0aWPIB/B2+JJebIJIlPGGykn
 tw6cnK++q7ucIApLSYLUQewpQlJkBOeU1wktuphN0LnVA+UJlnruPiXaw551Oz2UFSK3
 zhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898401; x=1719503201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HasaC/0G/3uLI5emduahJoqcP3q+0fLWQRsxww8xIH0=;
 b=bUaJ1YY1ElzuVkFvPICG8IBgz8EpH6blw3kupMFCf58P7naBUQfiLW15c6zJUFB0Kf
 kKgXBlZULzGLF6ANM7yLF2HNGXjdkURQDMTj5EuZUYk2NXvIddds2Y0P4iyj04iWd+YQ
 PpnzHjD9o9OOOPmco5s3U0lEltwvBbUluiFX5tGP0/Vad5hQFVUezhMAYLV9f//Yw0PE
 VuCrhGaLxsm3WBgvNf6WqdnSHrkedQATogQQnKliNTaEL0NND9HpF41Y1/aKyZeTWnDH
 YdfbvphUAbIohZ0TmiDehvBaXok3618jhUmiiKAl9LBbmWLTMPQQ/oMyHizMaomGCxFY
 K6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNaZHH/NEN1AaP0PEW1CwsOzwOK74wUgKhkXmF5DzZVWbk+OFLrBZBgKuUdGgtezyeN49NVNXaQrTh0daoGBq2cCBoBlEBWeWAtNTt1yFM
X-Gm-Message-State: AOJu0YxlfCgfqaKKSbdfUnc4+4Ymquh/j93skYv36iV5vyzBwpTdn2O6
 0tYcUFZK+ohoLVM/ZjIjvdXjXKLb0HFm241mNGwmvuAzZ838mFwa5lppSCSuAwvN/XqDsJPhL82
 2+VpxyUv3eNEMX13nQ0jnmC9FJsG3I9Kp
X-Google-Smtp-Source: AGHT+IEGssnQmawfTua+rldGeHELCFpg0mL5gQcBBTj1NRN+fhrrkrZijukLDUIKtpE/+lHU2DXL3W4q0oh6
X-Received: by 2002:a17:907:c001:b0:a6f:b08b:86ca with SMTP id
 a640c23a62f3a-a6fb08b8d77mr305826866b.75.1718898401405; 
 Thu, 20 Jun 2024 08:46:41 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56f20ab0sm29242166b.272.2024.06.20.08.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:41 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH 05/31] drm/vc4_plane: Add support for YUV444 formats
Date: Thu, 20 Jun 2024 16:46:06 +0100
Message-Id: <20240620154632.4125308-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Support displaying DRM_FORMAT_YUV444 and DRM_FORMAT_YVU444 formats.
Tested with kmstest and kodi. e.g.

kmstest -r 1920x1080@60 -f 400x300-YU24

Note: without the shift of width, only half the chroma is fetched,
resulting in correct left half of image and corrupt colours on right half.

The increase in width shouldn't affect fetching of Y data,
as the hardware will clamp at dest width.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b8c68d4688c8..978433554f3d 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -109,6 +109,18 @@ static const struct hvs_format {
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
 	},
+	{
+		.drm = DRM_FORMAT_YUV444,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_3PLANE,
+		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
+	},
+	{
+		.drm = DRM_FORMAT_YVU444,
+		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_3PLANE,
+		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
+	},
 	{
 		.drm = DRM_FORMAT_YUV420,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_3PLANE,
@@ -1117,6 +1129,12 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	    vc4_state->src_y + vc4_state->src_h[0] < (state->fb->height << 16))
 		height++;
 
+	/* For YUV444 the hardware wants double the width, otherwise it doesn't
+	 * fetch full width of chroma
+	 */
+	if (format->drm == DRM_FORMAT_YUV444 || format->drm == DRM_FORMAT_YVU444)
+		width <<= 1;
+
 	/* Don't waste cycles mixing with plane alpha if the set alpha
 	 * is opaque or there is no per-pixel alpha information.
 	 * In any case we use the alpha property value as the fixed alpha.
-- 
2.34.1

