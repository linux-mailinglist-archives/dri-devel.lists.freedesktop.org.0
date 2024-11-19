Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F729D2E37
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 19:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A40810E367;
	Tue, 19 Nov 2024 18:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30A3B10E367
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 18:44:56 +0000 (UTC)
X-CSE-ConnectionGUID: 6U02yTBZRBSoY7sIm405dg==
X-CSE-MsgGUID: yxohofwSQtijYVefabaheA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; d="scan'208";a="229318287"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 20 Nov 2024 03:44:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B3D3F400752D;
 Wed, 20 Nov 2024 03:44:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Hien Huynh <hien.huynh.px@renesas.com>, stable@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
Subject: [PATCH v6 3/3] drm: adv7511: Drop dsi single lane support
Date: Tue, 19 Nov 2024 18:44:16 +0000
Message-ID: <20241119184420.138785-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
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

As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
unsupported 1-lane.

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
[2] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533.pdf

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v6:
 - Added Rb tag from Adam.
Changes in v5:
 - No change.
Changes in v4:
 - Added link to ADV7533 data sheet.
 - Collected tags
Changes in v3:
 - Updated commit header and description
 - Updated fixes tag
 - Dropped single lane support
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 5f195e91b3e6..122ad91e8a32 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -172,7 +172,7 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
-	if (num_lanes < 1 || num_lanes > 4)
+	if (num_lanes < 2 || num_lanes > 4)
 		return -EINVAL;
 
 	adv->num_dsi_lanes = num_lanes;
-- 
2.43.0

