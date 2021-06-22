Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374173B1080
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 01:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BE66E2DC;
	Tue, 22 Jun 2021 23:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C036E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 23:20:31 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A9D8B63;
 Wed, 23 Jun 2021 01:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624404029;
 bh=BfW+VuiImixFtwo26YRsiUh4VPXeAT4jUVmUXsDVa0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ftEqxS2izD8zlEVLL2jwU3jjcHCnigJwdgu0MWzFrZyRmnXOYwdYpaIPURx0KEzw4
 l7EiLPNsYWo+APOV0tD6AxXPVJrfYZRN9R3KiWtiHilEk6ASDwFnwX5GAUCfqPWIF5
 kVrpH0xzjJj0wHXEa2IQePAyfIdz/XTYMyVk6HYo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] drm: rcar-du: Sort the DU outputs
Date: Wed, 23 Jun 2021 00:20:22 +0100
Message-Id: <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Sort the DU outputs alphabetically, with the exception of the final
entry which is there as a sentinal.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
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

