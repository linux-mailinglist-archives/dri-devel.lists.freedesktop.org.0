Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885C45EB1E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9666EAC4;
	Fri, 26 Nov 2021 10:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BD96EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:15:24 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082271253;
 Fri, 26 Nov 2021 11:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637921723;
 bh=/NxkguvbJpSme2X46XXvrov0xFXe3nBtHvsHHSVlCss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pzzdZM+hekooz75iasjEsORioKOkxcFKn+cnUM0/LeFsdcLL+1vEv7atZ0R+MF5p7
 qf+lNFkA+1ZhnlpSAuUFmLYzA1jUsRtu2AN/xeK7QsBTgJ8peNLsGft4RkBsBDAzLo
 6/Zb9BqVBOKdwRDrAASuIXalJxDy+Jp8dCoFqcIo=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] drm: rcar-du: Select DRM_MIPI_DSI with DRM_RCAR_MIPI_DSI
Date: Fri, 26 Nov 2021 10:15:16 +0000
Message-Id: <20211126101518.938783-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RCAR_MIPI_DSI uses the DRM_MIPI_DSI interface.

Ensure that it is selected when the option is enabled.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 8cb94fe90639..8145c6d4cbc8 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -41,6 +41,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_MIPI_DSI
 	tristate "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	select DRM_MIPI_DSI
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
 
-- 
2.30.2

