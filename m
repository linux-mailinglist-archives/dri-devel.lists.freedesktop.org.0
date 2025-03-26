Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC8A71760
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55310E6CE;
	Wed, 26 Mar 2025 13:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TkMCLwph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427110E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:21 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A6EE10D4;
 Wed, 26 Mar 2025 14:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995293;
 bh=9MHTxZdH7A64p6rkGsMJ1pERN/pChugBsFtXfs/OL8w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TkMCLwphYF2TsBTzKA4WS43gF1mPqgX3fD93IFX6AaJzIjJ4a1p9vHqw/Vz3dWRxy
 JbaP68KLxa3k2Kco9f6jz6LMSbKXBW/txaY1E6x30BWJ6rmD90OJ10/qU15ppYW58P
 Wshjb0iJvVOpKtfJagcLmPOWpY8l70Avo3+Bs+BA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:47 +0200
Subject: [PATCH v4 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-4-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9MHTxZdH7A64p6rkGsMJ1pERN/pChugBsFtXfs/OL8w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//BdemlPRklQ6gnd/Q/5zTB5DnVlRkfQENq1
 3jF2adPkVqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wQAKCRD6PaqMvJYe
 9RHbD/0W5pG4aByofNdoxcApNE/W22S2TcyIDEHx0OB6JuQWt4RV5HfNgv5SsM0DWPgbEQ/qnSv
 rM9746U8NdeADgIIPhfzwgQEbaehU8mnNMBy6SCK0rHmWS9bFy4iBnn0OH02hiuvSJ30ILFuhPZ
 XEJoa+nC2zSLPgMwGhzUCu66dwPIxjbFJ7WwGaBgxn4kca5WRwko4WZMp6CdLDNshx9DLqtfsLY
 cmNok3UO1nxZfcIRPe4LSDcCOO2Bbe0p6xctBgokZQ+PIkKP/1bhTh48AY//hJTwvlCunXQcr7O
 FGdr1SP/HpD2jUApmpfm6Lw6XHcL+7dXlkMWbJuYkGaIazPIibIVjZDnnj4Xj1VpGvunERzj5UG
 QybSUL75aZ70FlwzNQYCfJ5+vPcJLYwRXj3GvHUwiaDordbCuh2bNxJZUiKTm1l51J6qrughUvF
 tthWvRNnOaRrqX2YAefKMFoc0VSUmb3f5aw+02o2lyYUrxe3AGx17YDrepm5Wxo7Mlz/STCL9AG
 v7e+Giwf6Fl3+5uX1BIm97lkqIQYQmIgn5jayO9mPkQcOLvwsPqPSFkedfL5yBaoGbs+xZfIPR5
 AGvt5VoXnUJXdCIJyTLNd70XWuq/QiimG87G90mrr+qFI3xCGgWFozpldGard6xcohxcJ36OdIz
 i2+d1/BDBIPojwQ==
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
index 751b8087b35f..f6316adbeb97 100644
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

