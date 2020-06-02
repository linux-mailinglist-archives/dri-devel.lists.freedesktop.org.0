Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64171EC0C2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 19:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FF76E1ED;
	Tue,  2 Jun 2020 17:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192D6E1ED
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 17:13:02 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DFD52A4;
 Tue,  2 Jun 2020 19:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591117979;
 bh=wWbwuNkeCRH8VkVD9OcCmoJ6Pe7GfyNuPXvplLYqveM=;
 h=From:To:Cc:Subject:Date:From;
 b=HPfKmIIXNVjAdUxh+LlVpQs5UFXimcfHl4apkqUFuAIDiQXhlrnzjO5CtjOLr6OvB
 PuYKOjRECgtTWaaSe+jZuxP/wEP2ZDJdk8R6KRSeksT5Cv0hQ3HADqmNs6fV9EKLF7
 oY5TLsHBdN3sbXCuzRRLvZd0zS/URkpVNlixBJwU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Set connector type for DSI panels
Date: Tue,  2 Jun 2020 20:12:40 +0300
Message-Id: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the DSI panels set the connector_type in their panel_desc
descriptor. As they are all guaranteed to be DSI panels, that's an easy
fix, set the connector type to DRM_MODE_CONNECTOR_DSI.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd1552132..b86b52bfece7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4082,6 +4082,7 @@ static const struct panel_desc_dsi auo_b080uan01 = {
 			.width = 108,
 			.height = 272,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
 	.format = MIPI_DSI_FMT_RGB888,
@@ -4110,6 +4111,7 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 			.width = 107,
 			.height = 172,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO |
 		 MIPI_DSI_MODE_VIDEO_BURST |
@@ -4140,6 +4142,7 @@ static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
 			.width = 94,
 			.height = 151,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
 	.format = MIPI_DSI_FMT_RGB888,
@@ -4168,6 +4171,7 @@ static const struct panel_desc_dsi lg_lh500wx1_sd03 = {
 			.width = 62,
 			.height = 110,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO,
 	.format = MIPI_DSI_FMT_RGB888,
@@ -4196,6 +4200,7 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
 			.width = 217,
 			.height = 136,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		 MIPI_DSI_CLOCK_NON_CONTINUOUS,
@@ -4225,6 +4230,7 @@ static const struct panel_desc_dsi lg_acx467akm_7 = {
 			.width = 62,
 			.height = 110,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = 0,
 	.format = MIPI_DSI_FMT_RGB888,
@@ -4254,6 +4260,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
 			.width = 217,
 			.height = 136,
 		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
 	},
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
