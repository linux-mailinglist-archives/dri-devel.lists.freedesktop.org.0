Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97191295F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A810F1F3;
	Fri, 21 Jun 2024 15:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IkV5V2LK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AB410F1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:35 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso261924966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983294; x=1719588094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUizpNAqfKCXgsL/yLP720xpwUzku0SPhWjvjbMdVWM=;
 b=IkV5V2LKiS1sInTwGfWLDqiphEBG+4CkCKquaF6rZwvJ67wjuGWjrPqOazXcJqEb2Y
 oUZSTgW3BDABnrk4Nu6j5tZAcWQxqh2yrIbOtX+WEYnPxxQxJMSk0i2WzBiBnhBmHPBQ
 mT5XdM5zg9Kf0p/0loPZSHUSAYlO80/0tL43fqRa+LBa30REUch168pmkniwaWAkDDgB
 NeRJvOTc5d3mz35shHD/UvYT99+hjEJTfPYZ7WdkOoPPVgicoW9k2PncjulQzyYJE+PZ
 8QoTkMmDGpKtkeQxnnmX5gyUzjkuxoIG03O4rfegvTICkDBNdB49x6LJt17ILyHdwCYT
 jVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983294; x=1719588094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUizpNAqfKCXgsL/yLP720xpwUzku0SPhWjvjbMdVWM=;
 b=vlYa24gbclOrdabfIFusaeHxGlMXMhwjLIW66vXsQK2c0LBkxNGX5v+98fm3iyzzOy
 FO1+bL2VX0F+NkLT3JbDRdL4S4ShHl5R1o6UXg6Olse2/c1977RLYC1rXPAic23HZk/v
 SpGS/VgQ8W82c4KQGl6g+IQ9ZbEBKVqtP/2FjqNTKWZbXv/SrVmoS/E2ySlQzhs397vg
 Qy1NaEa9LzerqVZT1kJn1k4bAC46Kz7Rp7cWtQTEsDo7/3zVYMml6hjIh3TXqqr2htQA
 i9fb2ORUyKDR9FSLXyzKylU+ZKJB4Ws946DlaaRPQAMj03NzWWTuEvTbbpae45wIRNzj
 GXjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/vyz2bnQe60ErbXaiE/Ym6zp0t70eOITe9NES7tHkk4+Kun3Cm1W5G22yj9lx+p8CCgCBXEv6A/TPuMRYOJxBlTUAa01Plr6NrQCioaZ5
X-Gm-Message-State: AOJu0YyHQa0iPzWk2Nzz0nIGU/QWuw4v/FCxui+HaFaPl7tVx3Mc9O84
 XtSAsf95X/HUPpfDEe254HzSylAOH+LH5NIPFje6vlZ6HiDK4ey0N4Dec0XTnbxTnVnzzxA9SbB
 kz+mcQa8uiclBay5DvdA6TQZMExZwK1mv
X-Google-Smtp-Source: AGHT+IFHAU68OUJeWhAM9mfv1mqxFtbRMCfvPFJSsW9P5FKeSUY52pRf078FJNuPHKlisfP22HYySSaIf3ya
X-Received: by 2002:a17:907:175e:b0:a6f:80ff:4050 with SMTP id
 a640c23a62f3a-a6fab62f501mr522888866b.25.1718983293428; 
 Fri, 21 Jun 2024 08:21:33 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5492bcsm5705966b.141.2024.06.21.08.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:33 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/31] drm/vc4: plane: Add support for YUV444 formats
Date: Fri, 21 Jun 2024 16:20:29 +0100
Message-Id: <20240621152055.4180873-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

