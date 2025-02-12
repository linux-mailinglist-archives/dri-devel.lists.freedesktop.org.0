Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCBA32940
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6210E8DF;
	Wed, 12 Feb 2025 14:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PRHSASfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5F10E8DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:51 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F412410D4;
 Wed, 12 Feb 2025 15:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372129;
 bh=pQtpMsNDf/KWDM2LySzZe+WQC9Gn00gqkTHNhMz3kYU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PRHSASfTSr0FFBJLiV53TIPvZX0853lAbxaCD7Bcu0M/QPandO99AD7wA3Y6e/CGO
 BeXMq4RPZck64+kd8rFrLMhvcq4CejqQDGDFw1r2X1Od9QTdtcHkffECXjrXXWNmkp
 XXWi6EGcaLg7lzPZfY6j2Lz4aBwTseA6EY5E9NFM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:06 +0200
Subject: [PATCH v3 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-2-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=pQtpMsNDf/KWDM2LySzZe+WQC9Gn00gqkTHNhMz3kYU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLao20jpVy27pXKBCJNrn7glxB/u63LNEZNry
 hz0zKHJ9N+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qAAKCRD6PaqMvJYe
 9dlZEACrHsMLI3wPfgn0WL1G2cyLY87pNHZewzwHoZrgR2DdlIRIVadahiipKRDhTto0OovQh1q
 xrEZtGmuh+4GvZaq2uAHC29pXszuF6rl2XvXQMGkxA/x7rfP6AoZjRDsAv1HgBHDv3i4AFTrQ+U
 8DUXygIyZpQUofBY8W1WXjR9Dtxx/Rb8j3SBPsFKVh1ZTCmO9UgQ/ey0eQwGyK2TKu+dhVRmXgb
 AA0HrENPEb2mOt1e2ifsMmA8layVBKh/sxeh3rDgTB/tiB5nAbO7Ilf/DBoxfpPGHktx29lizHB
 ny70zzwp7jC2+8309BKSRSmGHxGklV3IAjxAsCdeFJ/c3uxY5ibkywJgp+Oduy05rREXyrB7x4L
 xUxhVEpF2gFURNt22vUP/WYXpPzo9hhftcL9IkiBQ7oh9RxsCATTzLilVqpH/mkM7tp9bwJ+yrv
 ZBMVk3JT0/gThKloy0Nv05VjAm31NlrDT9VbST6TTsSS8peasvnB2IOIETz0Am86hsJtNn+vCOw
 7IIkMvWWwSpyWc5fgqhfdUlFVlqepOJEc4d6g/xPS0aFwRKjo8CjcOcUCMeQTIvC2dBlY1iY1f/
 n4ZAeOQJ2OptWP+iLUWYUAc19sRmpPGW535XPrPk2APTSw3tYLnoO5gQ8nIYZR8jLcZpAJATVuX
 dTEBglEbeNbdDVg==
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
index 1e9afbf6ef99..bb0a2294573b 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
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
index e41a3cec6a9e..ead756a71825 100644
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

