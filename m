Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F05144F8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152C10FA34;
	Fri, 29 Apr 2022 09:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C75D10FA34
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:59:59 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 15so6056380pgf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vcraC2J+UP1DcJHUxnLq3joY2y3hu2SHI5P7oFcS2g=;
 b=iDKI4/YNtZz1MpApXDWP8KXQpaYQudRGj4IOKE5VHRn1ckCHw86KkYhVhYq2sNQaxz
 w45tCPnaypHa+FOfyouuR4BD+gwxRr7edDsUbDBfXsX9f6vw7fXwoTMs8D8hLioPJyrh
 Df3X/lfAysAzwF3zijIMVIA6K+GKt/bZw3ibk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vcraC2J+UP1DcJHUxnLq3joY2y3hu2SHI5P7oFcS2g=;
 b=E9X/98ZbcX0MVxrE1pIs6RIKzn0a0XQPrFsf8RBSH0deJttwf0QoQF46AqyuHvMujE
 8MsNwUa3x43zKoa4M2InX7sAnAbcEwJhEto6szMwiIoPmw56kJpI7LMnWQeKGJzCuU9D
 VvQxl/rqnlwYcR8s04sAnLGLegZo0btd0u0H1/LIsgX+yZ3giXKrjX9zKNqntJj330Uw
 nNXsPQc6VAueTilRX/WTksSDMJ8WLXp32UQBZlM/kX5Fiddwlpgqv12aWAvI1AceBdIn
 wCbsCkwIVamIeXW83lSgiobvk2UUFJS+qoA+zCZS8Z9xhPgrAPhcMgyElNd8YJBuBAte
 j6rw==
X-Gm-Message-State: AOAM530bIjayuJe1HnHvavJ4HcTz/jB/0fIuFKBx1V2RbtwQTpBv9NMf
 UqW8EmGV2vqgBVom4FznUsyLyuT7i6ee9w==
X-Google-Smtp-Source: ABdhPJwg8KdJ50UGLTPsmKGau1HbSVaLnb5CU7RVB1vvD9/GAaQsZY3a10942zJs0efSbp8otau/fA==
X-Received: by 2002:aa7:9085:0:b0:50d:35ae:271 with SMTP id
 i5-20020aa79085000000b0050d35ae0271mr27804043pfa.42.1651222798929; 
 Fri, 29 Apr 2022 01:59:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:b5c3:f85c:afa7:cae9])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm2453085pfi.42.2022.04.29.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:59:58 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RESEND 2/2] Revert "drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge"
Date: Fri, 29 Apr 2022 14:29:47 +0530
Message-Id: <20220429085947.1699963-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429085947.1699963-1-jagan@amarulasolutions.com>
References: <20220429085947.1699963-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit <3d7039e1e649> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge")
switched to devm_drm_of_get_bridge for looking up if child node has panel
or bridge.

However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
has panel or bridge") has reverted panel or bridge child node lookup
from devm_drm_of_get_bridge as it breaks the non-trivial cases the
first child node might not be a panel or bridge.

So, revert this commit to switch the previous behavior of looking up
child panel or bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Notes:
 RESEND is to fix author e-mail.

 drivers/gpu/drm/mcde/mcde_dsi.c | 44 ++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 083a4728654d..5651734ce977 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -19,6 +19,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -38,6 +39,7 @@ struct mcde_dsi {
 	struct device *dev;
 	struct mcde *mcde;
 	struct drm_bridge bridge;
+	struct drm_panel *panel;
 	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
@@ -1071,7 +1073,9 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct drm_bridge *bridge;
+	struct device_node *child;
+	struct drm_panel *panel = NULL;
+	struct drm_bridge *bridge = NULL;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1096,10 +1100,37 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(d->lp_clk);
 	}
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
-	if (IS_ERR(bridge)) {
-		dev_err(dev, "error to get bridge\n");
-		return PTR_ERR(bridge);
+	/* Look for a panel as a child to this node */
+	for_each_available_child_of_node(dev->of_node, child) {
+		panel = of_drm_find_panel(child);
+		if (IS_ERR(panel)) {
+			dev_err(dev, "failed to find panel try bridge (%ld)\n",
+				PTR_ERR(panel));
+			panel = NULL;
+
+			bridge = of_drm_find_bridge(child);
+			if (!bridge) {
+				dev_err(dev, "failed to find bridge\n");
+				return -EINVAL;
+			}
+		}
+	}
+	if (panel) {
+		bridge = drm_panel_bridge_add_typed(panel,
+						    DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge)) {
+			dev_err(dev, "error adding panel bridge\n");
+			return PTR_ERR(bridge);
+		}
+		dev_info(dev, "connected to panel\n");
+		d->panel = panel;
+	} else if (bridge) {
+		/* TODO: AV8100 HDMI encoder goes here for example */
+		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
+		return -ENODEV;
+	} else {
+		dev_err(dev, "no panel or bridge\n");
+		return -ENODEV;
 	}
 
 	d->bridge_out = bridge;
@@ -1122,7 +1153,8 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
-	drm_bridge_remove(d->bridge_out);
+	if (d->panel)
+		drm_panel_bridge_remove(d->bridge_out);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }
-- 
2.25.1

