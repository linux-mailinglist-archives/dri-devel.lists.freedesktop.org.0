Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027256C5AC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 03:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783C10E095;
	Sat,  9 Jul 2022 01:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8511610E095
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 01:18:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D3D6F845D3;
 Sat,  9 Jul 2022 03:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657329479;
 bh=lmk82Oah7mQgcXIkRHLrWaugFWqFc+rIp+z1TvPhcS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ws1/l4ST8AnIju1QRGX/xB5JM6bUf3cZGNTQwi+czcR2YJfmFQfZ25kVKGeldsCKF
 s1wHoTKQLo2RZunmFkbhmWGQoak8Nzn85ezX59d5tyExtmyJbc5D684h6vup02rl7B
 Zx1qFcNpEc8J4si20FWeJJ5fDdpmlvl27edm5wY7tiitEVPhQP9SwnWB/s9zluNVfQ
 cZNtN++r8kJABvGXhgq+XeOfqoH3GOHC8aHM3dbPltNRkaSs+EUmgULQ5PrJCs0iRF
 uuOfMvf4Fsj8Hs6u7zfZOmgYNSBQz/P7h/InO2m+ifCqGT+gRe3LlXBmwdtA7qajnf
 RbGimADmJcUyg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/lcdif: switch to devm_drm_of_get_bridge
Date: Sat,  9 Jul 2022 03:17:46 +0200
Message-Id: <20220709011746.142296-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220709011746.142296-1-marex@denx.de>
References: <20220709011746.142296-1-marex@denx.de>
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

