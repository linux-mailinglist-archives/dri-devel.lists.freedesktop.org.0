Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA94A9C68C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9561B10E95B;
	Fri, 25 Apr 2025 11:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n77idFsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86C210E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:01:55 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76866124E;
 Fri, 25 Apr 2025 13:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578912;
 bh=cVhvhYY3vvINyoHV0xAvckjC2ZNuAXRTm+8BLF/s7zQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n77idFsKvxNmXu6f9RR6HBy7DoH9Up55q5/wACzkRnoSqSajGj5lG+5zRXAAWN0Cd
 1KNPtUAQN8VkfCd76rBtldbI9cmXs4SEVhPOjm0nLn8za+UMv7YloRKj4/gOdhv/K9
 G+c6Hb43UUSX3bpcwABapLjAzh720z254BSV4vy4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:24 +0300
Subject: [PATCH v5 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-4-c74263231630@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cVhvhYY3vvINyoHV0xAvckjC2ZNuAXRTm+8BLF/s7zQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uaukgIcgYiNdYQyfKwA6y6GZlPKLlYwMkGh
 0KfO1/O5g6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmgAKCRD6PaqMvJYe
 9Us7D/0TNtLMLAaVUrej0RrRfkzhzaB7OtoqKTSGXSo19Bogjg6eHlm/Msq/apelMYsbRmHLyXk
 KawcwLjqENR6puhi/xEsoyQR6E7N/sMN25ztZvk4c7OMV8QNdYpVK7zQ08LO/TsSQ7Rd3Sdaa6J
 +G84lzH85T24ysVpDNOmQTKB9u5MSi6HDcnV0vFsX1eFMcl+es2EFukaO72JLoFhLOTfCh7MvNJ
 gJrrTy7nxEMp/b1V3LpMxyP5KqrbAnMjdyKBSfXgZrnzv7L2icgMe/aXcdELuc8nPnMtQyTY6pm
 +1DgDsVu3/GgsXB3WXQ8JCF6LxIn6gz6jLtrv8lisCRdEtIT576Afwo59vFcyzvBUhHEmzIb8AP
 S1LAL1NEWd5vnU7IbEQOuMETC+uuSpLs5IcAdK9oKiGB4robAg7VuTb8eb5UkMtmbHaE3ixe0CY
 EyxWN/A+NI5fR7/nyVvk68XKiAiAtNETBimeBNPoa7JRsgvAyrhkPFBPWloYT9ivbxkxXSLgsr0
 eL9T2U4n/BF342XSJisF4lkBUYRBFsX6i5EiexLaYgGpOXJWXTdn1pdP1ee4r0ojOL0QQcoJUKX
 +ESaYeYxH7zVAdP4osZQh549oXi1DXTGui9pCCGygnaBZ43zG6dkzLmH6t24AwT2X9Nk7bekmBL
 Zqs9sVTruClxLTQ==
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
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 355aaf7b5e9e..e5f04f7ec164 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -353,6 +353,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 5af64a683dd7..fceb7a2dfeb4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -415,6 +415,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0

