Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181929E36A4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788A10ECA7;
	Wed,  4 Dec 2024 09:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rWV7ej8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3B10ECA3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:37 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACA63DEE;
 Wed,  4 Dec 2024 10:31:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304668;
 bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rWV7ej8LRxgfU4fQzjfjsnnXR2NMCQ54lY7nGsqN4c1hphabbMwOTSNt/FcdmV/0w
 OGS7INU9dIdLxQ+/Uz8sIQ3qllY7Z1p7lGQptlCdAUX8aRA4xIl+QuOi5PR9BXtkRt
 pKOfE0Tc2KGd4oVygcwpv/3nHuY6CpTAagzQ/jMA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:03 +0200
Subject: [PATCH 03/10] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-3-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFx5mhGi5W/bP9q7RWzGo74Wt3wQPeJI3sXs
 pd+jiz3RpWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcQAKCRD6PaqMvJYe
 9Ug4D/9/xafVOLqBEJNEOZO++iwGGQbir+uOuNgAOupEdeGsu/bOQE1jhMkTIb5n3TIX52m7iJR
 +Pas60kZO0b06oJYChe9UfseN9KRYxxsvBZQB+gsCVOqcsjkzA4Pfidcs03dALo0UQo7DoUQuGP
 hBZmoPE/EqK9ksBOou5G83MaL7WtmvBO7Fxt1u7FAxax7G/BeC6N4c5dF/agavqy5dEKyIkiCQc
 NYofRWTmN1JSQt7fqa8G/KkDVPujWas60MEMQQTsaP2CYwLUEg4vX+AIMTcnPvNNp+KkwFAzzlP
 D5ijZlcZzyNscMEAj0owMRgVyu8beiCCuQOeu0md7MdUYdKxsBkJ4xRsAbC2Zh2+Y+NGvK/ow+I
 M9PiEG1Zi97S5VXxim9vovlSCCFCVOrYk9L2bbfW9rHNqzIbprzSDOe1w+zuWqKxVyO7NG6eU9p
 p+FnWlfDbpx4tn4vbaaDB0Tax3uGpHu7ypNAFcZeYPJ/DoSHjdz1D9iFgbHz3o3mPt0BfIRd4CH
 BwziywRHllqoGwlLgqTTFUC7rMbODDyoIS0RO/T+Vel39EFnNbdX1lKvjFscUh2n872UFTONB8j
 bsf0opYv86Zq7ieo1ZLZfjoZk7zWtik/O+DVG9ovdNzuD9qdcPzFhNFSmM+nGa2d9UD5b43UEt+
 Td6hcK6BXfAKE+w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add greyscale Y8 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index adb2d44630ee..d721d9fdbe98 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -239,6 +239,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2a00adcfb1ff..f79ee3b93f09 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -405,6 +405,9 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/* Greyscale formats */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0

