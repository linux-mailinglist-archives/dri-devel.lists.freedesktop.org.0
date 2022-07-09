Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9756CA32
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 16:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2010F684;
	Sat,  9 Jul 2022 14:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3E910F682
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:48:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1CDAA845E3;
 Sat,  9 Jul 2022 16:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657378120;
 bh=0zrQ6GD2zG3NCklZYU8acqqFAbaDs7HNGn9HLBmlFD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EvwVDcC1Q/NTwT4sOhNx0yQwjjQ0F9w5LUS9Ql7Ve+4IISougWPAooe2DOCdDH+CP
 POmMg4ZVkTHQd3sZI+sOxHJD1hZU2CFL+ubc4RrnhvBZ86e+3htPX969Z/vhiO87XF
 6X91JIg0wHtvqrZAMW/Kzzie7jCMExCKKpE31XYwEOWO+BiUOcudcUsUD0NEWv5Tfu
 VNQYIhWSv1kMrLNYMKX0zwZU8CqhWIO8OMDGFRbWLEpDCCjT29Y56ARW/qEwnv3ydj
 aCRQH47PdSxftYvbZwYULVnaMDZvkVDQSVj2gmxKSf38xA3JhZ0FLmf72wAQa+TXGn
 lwWqprmlPlo2A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/lcdif: switch to devm_drm_of_get_bridge
Date: Sat,  9 Jul 2022 16:48:26 +0200
Message-Id: <20220709144826.9278-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220709144826.9278-1-marex@denx.de>
References: <20220709144826.9278-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>, Liu Ying <victor.liu@nxp.com>,
 robert.foss@linaro.org, Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reported-by: Liu Ying <victor.liu@oss.nxp.com>
Tested-by: Martyn Welch <martyn.welch@collabora.com>
Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Martyn Welch <martyn.welch@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add RB from Liu
V3: Add TB from Martyn from V1
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 1370889c6d687..746a4261f3da2 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -42,23 +42,11 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct drm_device *drm = lcdif->drm;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
-					  &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
-	if (!bridge)
-		return -ENODEV;
+	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
 	if (ret)
-- 
2.35.1

