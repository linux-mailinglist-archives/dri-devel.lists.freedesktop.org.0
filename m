Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E660A75994
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 12:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582310E0BF;
	Sun, 30 Mar 2025 10:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D66110E039
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:29:11 +0000 (UTC)
X-CSE-ConnectionGUID: X5IqqMAFSNi3CvRRKevGwQ==
X-CSE-MsgGUID: NGroiOWSQzun0ZRcDcTxjg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 30 Mar 2025 19:24:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 23FC040078A5;
 Sun, 30 Mar 2025 19:24:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] drm: renesas: rz-du: Drop bpp variable from struct
 rzg2l_du_format_info
Date: Sun, 30 Mar 2025 11:23:52 +0100
Message-ID: <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
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

Drop the unused variable bpp from struct rzg2l_du_format_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 ---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 90c6269ccd29..1a428ab3c424 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -38,19 +38,16 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 	{
 		.fourcc = DRM_FORMAT_XRGB8888,
 		.v4l2 = V4L2_PIX_FMT_XBGR32,
-		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ARGB8888,
 		.v4l2 = V4L2_PIX_FMT_ABGR32,
-		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGB888,
 		.v4l2 = V4L2_PIX_FMT_BGR24,
-		.bpp = 24,
 		.planes = 1,
 		.hsub = 1,
 	}
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
index 876e97cfbf45..e2c599f115c6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
@@ -23,7 +23,6 @@ struct sg_table;
 struct rzg2l_du_format_info {
 	u32 fourcc;
 	u32 v4l2;
-	unsigned int bpp;
 	unsigned int planes;
 	unsigned int hsub;
 };
-- 
2.43.0

