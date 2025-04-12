Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C132A86B3B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 08:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CF610E187;
	Sat, 12 Apr 2025 06:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDA2A10E187
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 06:13:14 +0000 (UTC)
X-CSE-ConnectionGUID: rnFd/sagQHef5cMiJ4U7hA==
X-CSE-MsgGUID: fvYR9hHRTs+i1kZVd/Wr5Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 12 Apr 2025 15:13:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.23])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC20A4001DA9;
 Sat, 12 Apr 2025 15:13:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] drm: renesas: rz-du: rzg2l_mipi_dsi: Update the comment in
 rzg2l_mipi_dsi_start_video()
Date: Sat, 12 Apr 2025 07:12:54 +0100
Message-ID: <20250412061258.5447-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

Add missing space in the comment in rzg2l_mipi_dsi_start_video().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This issue is noticed while backporting this driver to 6.1.y-cip [1].

[1] https://lore.kernel.org/all/20230905160737.167877-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Updated commit header path rcar-du->rz-du.
 * Collected tags
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 96c014449547..dc6ab012cdb6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi)
 	u32 status;
 	int ret;
 
-	/* Configuration for Blanking sequence and start video input*/
+	/* Configuration for Blanking sequence and start video input */
 	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
 		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
 	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
-- 
2.43.0

