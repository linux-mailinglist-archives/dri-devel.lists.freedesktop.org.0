Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473653FE5A3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 01:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584E6E3F2;
	Wed,  1 Sep 2021 23:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262F56E3EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 23:49:13 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B87C1516;
 Thu,  2 Sep 2021 01:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630540151;
 bh=7X4qZVyk2k7iUjP1MSpsD7QXZUHFl6neQV8CbcJNCeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D3uQGGVrQHs7OUopz27O+Rz6y4z6KhBGHBTv4JLGOqlLxmJ28EK1fXkObz4Dpi40s
 zk5EmuvV90qc5maIVExKr1Mfw1Y7xr31ml5Yez0VIyOCZnmlk2jrIc2aOFD5O3SD5i
 Tq0KmDUgTY7jLRxjhOW+s7a4QJ3Nz1L+4dIsCRMw=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] drm: rcar-du: Sort the DU outputs
Date: Thu,  2 Sep 2021 00:49:03 +0100
Message-Id: <20210901234907.1608896-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Sort the DU outputs alphabetically, with the exception of the final
entry which is there as a sentinal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 - Collect tag

 drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..440e6b4fbb58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -96,10 +96,10 @@ struct rcar_du_crtc_state {
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
 	RCAR_DU_OUTPUT_DPAD1,
-	RCAR_DU_OUTPUT_LVDS0,
-	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_HDMI0,
 	RCAR_DU_OUTPUT_HDMI1,
+	RCAR_DU_OUTPUT_LVDS0,
+	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_TCON,
 	RCAR_DU_OUTPUT_MAX,
 };
-- 
2.30.2

