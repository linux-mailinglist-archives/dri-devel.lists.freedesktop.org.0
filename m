Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF5BB075F
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E46810E704;
	Wed,  1 Oct 2025 13:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F8DBBgGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472A110E6FB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:22:51 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E92AEB4;
 Wed,  1 Oct 2025 15:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759324881;
 bh=XGJBxdhjI+9Q04mXj9KfwzrAY693U8tf4w8o/DovsCE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F8DBBgGCH/D/ShxL6BefSA4B7q/HTFu3pgBq6zfq8EJseCTV5YWjxJM0tHfTVhbUz
 unqhYA7oHQoeac9/8t5uw73qExb/AwHJt2XHaKLh+ZU0N++DDfhkCTJ49D34KF4pTp
 3xbaahlJelSiBZZmsck+AYQSUAFIyfQMOadUznbY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:16 +0300
Subject: [PATCH v6 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-4-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XGJBxdhjI+9Q04mXj9KfwzrAY693U8tf4w8o/DovsCE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SshzdkJUDfXjyxn9ZTHd1tu5GDuV9WK9drgn
 vOrGLBCi2qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIQAKCRD6PaqMvJYe
 9QT2D/948DxIlZzibDFFxOjpG19jeXG1UTX/N/FYhWzru26N/rBPYVNbKTvfZjyMigtvDLAya9y
 O01/K/D3uXg14AEfLjHL/f6FpzZSUMzrc8eib4WGh6sFR4K5J3CLjzqdCiAHMfZSnNWNl5Bqvsu
 um6NKDPcVvS1673ECpyDIKLW5im4HJVoGfsW1A89HYCKIv7JDb72Odf0kKsA3lrUk3SZxaNAx6S
 BS/DEB7R2i194qT5NnyWQfZLdcywW/br0zQEbjnXJ8hCYtVZUVjiBVaMES60Sv5CNSt0MfQz1kL
 pGI0r8qKt/NY3A+3a2peGrStGf3WKuXxokfZUvUMVJrvaRqfEZfxt8jYjOuuHidd3+rtdVanpWU
 jSBRbiR/g8J9GpjDFYxjGfrxQI89zhHYq04H5OQobN683SVWUzHFIDlIeyL/shfw7Dc30u504IH
 sVMWer5ebtBPxCnGz57dLhRMt9Zn4SEKUH4w7C2K085BAxYlRMOBmd2DAIR0D5QRFKgG5cJCuMt
 NoJD/Ed/1gDwmkr2vMKdIVHDdCnZ3OklSco+aou6bl/74oXgYqKwfkQf7dy8/dEGNXiYLWjHkZE
 in1CX8qTI+gS6AJmmCKPfhhxICYXLSFegjwAPBSCz8GK4KqIeMSFGiuva0J6KRiQA0d7cIrkuze
 RuBlDr/EIr+iYog==
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

Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
packed, A - 10 (as in 0xA), 4 - 4 bytes.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index a39b9d7a5b62..0d222f6c1a30 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a08f900ea2c3..4754bb48e4c3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -469,6 +469,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0

