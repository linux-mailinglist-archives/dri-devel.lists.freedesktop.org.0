Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3133A9C68B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475D10E956;
	Fri, 25 Apr 2025 11:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sQpoljTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C91610E949
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:01:55 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F840122C;
 Fri, 25 Apr 2025 13:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578911;
 bh=EGI6BGgu33HLUgez6XpzwSzAqHtDitZlTeLln5r3dbo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sQpoljTCaDHGcbsKnLHZBx6viAshuo60gli4I+AoZjEd7BAdtmyYUKi72p9H4ulbT
 ZmSJwjgXpVV2udRFbFukMQpvlozHvAsQSRmAcnzZZIaUHAMh/iKV9za1fhy8sxywLn
 AkT40V2BZ+Hoj7acmePEx2aahPcaXmyTr/OqShoI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:23 +0300
Subject: [PATCH v5 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-3-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=EGI6BGgu33HLUgez6XpzwSzAqHtDitZlTeLln5r3dbo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ua1Zgjvka2qWU83Sb+eFNC9QUB6WOn8nOqr
 8W3iL91sv6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmgAKCRD6PaqMvJYe
 9QELD/0XEzBNVoD/S+Ae34IwEmSHG6liFsg4YMcVXJM7uBPnAnlrwCBJPRsq77o7xEG1AXJehWb
 6TqZ2rlxUkDETuPR4sQbOqRhcqkoj0j95mlP4dNyQfpLCoSyojUfkEhuUel5aVbOZNJ/xTYurKw
 JZbzuY15RJkwhQaSNc8Mx3Gk909KlRSeXumo9/MBo2ixr8QrG8yB3KCvq887MH/s1vEm6x82IKI
 8XF7C9Ls75QU4apJf+DwK6fFEN0eAdwiHdiO1JiELGlaR7NxIrhmfwmTzLm0ez2ymVxezdT6mp/
 c5BisfOT50QKnAfRQMiTN3ThCPph02jSg4pBdGubzcMLKCVIcjZeN6j+Xu8kHBfW+byYXN4QCgU
 QliimIv4nYF2yL8oX6i8K83U1DcmmJLf+G8QWVr0GNRisnQpT0NqpL7Mwd7ckrxAK6msuHRu1B/
 Emc8vwmmrCU0sXJQR1n2W2HFWeaQLppFpi69d5OhZlvte4xr11WpI3n30zcUs7qTCG1mF2q0fmg
 BuBVVV9c6RWFK7cXK4uiP+xIuIDUit8Oimkn/uBzZ08HpDohq3WztKGYnBU98tObkK1N+RgQtzp
 DjArVpkK/z4gF0e/2pntM6INoqVr8mIBiRAEdOUagN0OW2dZHDnr/yzkJYig7GjBwyB3MKZl6g1
 gfpibp69L7JCzDQ==
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  1 +
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e101d1b99aeb..355aaf7b5e9e 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -267,6 +267,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 1247b814bd66..5af64a683dd7 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -405,6 +405,16 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * Y-only (greyscale) formats
+ *
+ * The Y-only formats are handled similarly to the YCbCr formats in the display
+ * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
+ * also means that COLOR_RANGE property applies to the Y-only formats.
+ *
+ */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0

