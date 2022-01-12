Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF948CA2B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C2D10E724;
	Wed, 12 Jan 2022 17:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EBD910E724
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:46:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106824710"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D29CB4005E1F;
 Thu, 13 Jan 2022 02:46:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Date: Wed, 12 Jan 2022 17:45:54 +0000
Message-Id: <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase buff size for compatible variable to avoid stack corruption
with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
more than the current allocated size.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
index afef69669bb4..84e73f8df686 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
 	struct device_node *lvds_node;
 	struct device_node *soc_node;
 	struct device_node *du_node;
-	char compatible[22];
+	char compatible[24];
 	const char *soc_name;
 	unsigned int i;
 	int ret;
-- 
2.17.1

