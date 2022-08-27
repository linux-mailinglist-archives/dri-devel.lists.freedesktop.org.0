Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB45A332F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 02:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD7310E5AC;
	Sat, 27 Aug 2022 00:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10910E5AC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 00:42:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E9A9120A;
 Sat, 27 Aug 2022 02:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661560948;
 bh=RleVrAR/2zyTBHESYFKnzNMjWNWTLl5Da+yoZ69dWCE=;
 h=From:To:Cc:Subject:Date:From;
 b=NDbrtX6bPVpN1mFv5R//RfpzqPSUypr9sDKB1Kq5Ys81Nvss2WHqZc8+CzmSTxVUb
 PVOrhBn4bdQlrVvHje4aTByDP9ndKrSe/edLA0u4Lfc5i/Stcr1j5/KdgMRKFPetq5
 mRLBbKObDah0TgOfSsPz9azEdDNzYWMCSAmmMe3M=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Drop leftovers variables from Makefile
Date: Sat, 27 Aug 2022 03:42:20 +0300
Message-Id: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
compatibility") has removed device tree overlay sources used for
backward compatibility with old bindings, but forgot to remove related
variables from the Makefile. Fix it.

Fixes: 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward compatibility")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index e7275b5e7ec8..6f132325c8b7 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -14,10 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
-
-# 'remote-endpoint' is fixed up at run-time
-DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint

base-commit: 2c2d7a67defa198a8b8148dbaddc9e5554efebc8
-- 
Regards,

Laurent Pinchart

