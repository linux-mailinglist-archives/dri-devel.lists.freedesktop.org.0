Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F3599D4B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 16:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8B510ECC2;
	Fri, 19 Aug 2022 14:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116610EE66
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:09:12 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AFA0084B4D;
 Fri, 19 Aug 2022 16:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1660918150;
 bh=gRcG7EOFKKr9S5i+EJ1bsXooSJL+SWgj5wwAL4MsIHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iptFuZiSLUcx56sh4wjlaEh3pe/Iix5jmO8zXDX44CowMmZKj9jKTsB1wlcZbdw5E
 tK3zOS8MxBJhLoui9+kYq0hXZ+j68QWa7EOHN4fZCb+L/8NE9/7Fyx80/Q8uJq7GY7
 4zSz2Xjrl9esvSkCppGod2yfySFuqYTrPybGRZvrN/XW6UPCppllZ6SL4uptBnbjgK
 +/ymau884/TROHUpoHrFVPydkQrZ/omyldfGX0aM5337m+TlREBQQ1en0Feizuk/9k
 YfOcHUef6CGv8T8cGx099w8ZvDiMNCgiR7zApDJGupKiciWEn8zSwMuFJ3RGwcLtjh
 iTegL9Ko7bZzQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/lcdif: switch to devm_drm_of_get_bridge
Date: Fri, 19 Aug 2022 16:08:52 +0200
Message-Id: <20220819140852.255187-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220819140852.255187-1-marex@denx.de>
References: <20220819140852.255187-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
V4: Add AB from Sam from V2
V5: Rebase on current drm-misc-next
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 4f16947212b60..075002ed6fb09 100644
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

