Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471D461C7A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 18:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434966E321;
	Mon, 29 Nov 2021 17:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7736E332
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 17:08:51 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A78F42A5;
 Mon, 29 Nov 2021 18:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638205730;
 bh=e1y61Mgloav2WdMgYxa58Sf1c4wfZ5W8NCesGLzRmeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=a50gaqYsQ7CGeI3zThv3Y6H2CM4T6xRO1Zoz931+bKqe7ac4N7QcpDUVmbNidR5eV
 IrzNVlTzXncfvjzbOTe9jZ2QPwVvDgDPa8zLs+ft5FN677t3Q0jfL1vqX882snbeFH
 2NVc/D243yXhozVETZLeJ2ttvnhhbzGnVGAqf0/Q=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH] drm: rcar-du: Add DSI support to rcar_du_output_name
Date: Mon, 29 Nov 2021 17:08:45 +0000
Message-Id: <20211129170845.2269532-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI output names were not added when the DSI pipeline support was
introduced.

Add the correct labels for these outputs, and fix the sort order to
match 'enum rcar_du_output' while we are here.

Fixes: b291fdcf5114 ("drm: rcar-du: Add r8a779a0 device support")
Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5612a9e7a905..5a8131ef81d5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -544,10 +544,12 @@ const char *rcar_du_output_name(enum rcar_du_output output)
 	static const char * const names[] = {
 		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
 		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
-		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
-		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
+		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
+		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
 		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
 		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
+		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RCAR_DU_OUTPUT_TCON] = "TCON",
 	};
 
-- 
2.30.2

