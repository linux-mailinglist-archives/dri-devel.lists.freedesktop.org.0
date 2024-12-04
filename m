Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E29E36A2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC1310ECA4;
	Wed,  4 Dec 2024 09:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sgkh/hbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0210ECA3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:36 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0FA9D04;
 Wed,  4 Dec 2024 10:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304667;
 bh=peMIGVKca9OHRX4eHaZ33k92czm9ZLEx61OIc/CzyAk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sgkh/hbo+1oQIdM7sK+v4w9DWkMvUlJOm5YfM2/JhuozEP90D+c9zQzVHpWvwGnkG
 wT73i/ojeSG7lJCVyMezvwOG5t0/K63AfKUpq05bjBV7BD7rEHAiIM+0170uLblAN4
 vDEPmRVrUxAxjLVu4eE3xXa9e7YTtWPv8Qv4GI30=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:02 +0200
Subject: [PATCH 02/10] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-2-0bf2c5147db1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=peMIGVKca9OHRX4eHaZ33k92czm9ZLEx61OIc/CzyAk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFxDMJy/fau9ZhZE6C1fmlBiltK0edBoJ3UU
 mM5THZMKxSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcQAKCRD6PaqMvJYe
 9eqsD/9nwEgBVcelDlJSTUQjZ+yFPXnwbDTC1zSiPTYqJSH6NMwyISuymVOOHH9ulimx5u5ITQ9
 6PtkqsFdw29eI84O5okM/Aq/I7Rwa8m05UAbInBIUANVMojgImxJH77ylHRft/F+X9X6+CWPd1i
 m+2Cf5ZCygODIC+5G/E+0ZZ6xKRy4do6+ikLcHYSL4OHWtNiJOsaCgWZn5/D2SpA6eKQvNbIIMp
 sv4eSg5Jgrwzu0814tEVy2sDIry675eTsQTWayxhvO/z2i8QQakZPmnrbO771avLCru0rEOi+ir
 VU9gh7ualCSu0yktTJwqBpVwqKbmCaaOzNHjQC+kQoPgkcnYBiK/3S3jOZAjE6Um4viGLpgMgYl
 nhWMA7N0ozdbpTjciO0Q8+52U5KG2sGc+GFgIu0klYkcYtVl1VFeA0GvfeWNv1jsQWcNp2DpGDN
 9T+JrV2s9Ba5Jc/BDuyudSvJp3nKgavTEm3bdKlI4XX1xvBBjmAL2Be9xLyYSuYwBjLjdn8vtT7
 43e4Tf4eCEn+vfSZwbUMYFT/Y0eCsem42NkeI2OV8GExervcGbwA5T/rX946ol8SD+Zt8r9ID48
 J1XwD9DexvMzQZypdjLwDsICiWbcQSmt8au/PRoC1bCg4Ci1foMRBgU0HYsXOiAXYmWuxERPzkr
 f0ORg1uKcan3L0A==
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

Add two new pixel formats:

DRM_FORMAT_XV15 ("XV15")
DRM_FORMAT_XV20 ("XV20")

The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
subsampled whereas XV20 is 2x1 subsampled.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e84c4ed6928c..adb2d44630ee 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -318,6 +318,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
+		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
+		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62..2a00adcfb1ff 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -304,6 +304,14 @@ extern "C" {
 #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
 #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
 
+/*
+ * 2 plane 10 bit per component YCrCb
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
+ */
+#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
+#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
+
 /*
  * 2 plane YCbCr
  * index 0 = Y plane, [7:0] Y

-- 
2.43.0

