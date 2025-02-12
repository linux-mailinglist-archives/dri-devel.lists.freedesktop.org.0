Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F245EA32943
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835EA10E8E2;
	Wed, 12 Feb 2025 14:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pTS+bPzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B221B10E8DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:53 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6A36195A;
 Wed, 12 Feb 2025 15:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372131;
 bh=bDFZpF846TRaGLUNMCsvrDnuqA1IyYJ0UMcEGvK70NI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pTS+bPzPvekp3SSMt/3PXnVkG5KPaAA2TBaIdiEBD51qn50oGKrhG3R1lEjlSP3SX
 UZ7+NXUyaBJlws0L+p6JuL6F6xJL/6f7WNeHOCCkcpVnTDdFB2GD7WwR0Umm3j2xfC
 l+d6i9weFxweUW5nkcM7cYEh5D68iXkkVS7G1g0A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:08 +0200
Subject: [PATCH v3 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-4-90d0fe106995@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bDFZpF846TRaGLUNMCsvrDnuqA1IyYJ0UMcEGvK70NI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLapJR8dbSjlDo39/S7HPLbMH+NK3wKLj0vmc
 0KCVDLaVcGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qQAKCRD6PaqMvJYe
 9b0ED/97NbOe7n+I9+K/BtfgS30c0wImbKKCFZJDoK3m+ug57HgG0A6cxmlUlR6A+OFJW4vGKQf
 DwSDUzsXxD3U2P3vxfR4xb8eKIBahbKfnv2e+TmD2eFOHrmW2fZis9xLwmS7SzU3xSPy7k5cP9H
 jqYsXl7BdK8zTc1sEKGSrOtBghzihTCcKyf8Cs+9d48oVKTovpNhVoLc+mlmH30TIrAlevw8gAZ
 k1yGJSQH+sLXCIz6vJgmJjO3vatOLTZC8NXxAQO8kDNLI+QksUSwwKvLDbO61SBLRfeIfD1mURH
 2iMHPvnBLZFQku2auop9zbhBABxLZfVGN0lVOfmFZTYwFkE7RDeTtRrsTZjbkI3JtclffKIewvU
 MOTS6TFStjtzkREFJpUlCEPwIj4AXjutKDEeGuAQBfdhzAzoynwp62y9rB9sOxzwYGaijB/RJnm
 DtbKGmQ/sYg5Sx3f8FWvXHui94ulNSFltwUP7BkqSFLlcfyZpAJVBs4sW1cpl63bIYvd0BKQ9QG
 3ccT2xYlowzni5jyva6EmJDdeqgqxh8tZ4fwNM//aDF0FQnYisaEUl5nQhLp4McS2dCDw2xiVZ+
 3dZrlWBazCl2zp+3FcmyjvQ18SdHRKzWr98iVYItp+BoIA1fwuecZXUA7wgRIsZpYGyvXAwJKLu
 R/MdV/wIq6342AA==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index c8c6dd8a8d4a..155482d9a409 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -355,6 +355,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
 		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,
+		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
+		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2778cea9c861..e87349d46325 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -408,6 +408,7 @@ extern "C" {
 /* Greyscale formats */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0

