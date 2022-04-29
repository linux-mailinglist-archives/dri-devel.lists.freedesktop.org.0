Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F55144E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AAB10F983;
	Fri, 29 Apr 2022 08:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BD210F664
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:56:07 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id o69so5210657pjo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtAatQi32uY0Mr/+NfdPdeyNea4utijeqFZuOoc4TBU=;
 b=SB8PJZQGthQSOKjBGLbQaA0ZU+9z1XiRPZf9se57/FRD69lZ0Yx8lcY+B1hzpM738k
 TSMlXOs9+snFx1090KsqS3rdp04YHs9K4zUYFdivfkYbhs/posTE+zXT8LnoPMUuL4Dk
 XHYbWDw/NvicWwTaVHptZZNrIiIEvA7GqKR1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtAatQi32uY0Mr/+NfdPdeyNea4utijeqFZuOoc4TBU=;
 b=tA34jVLLz7+ypMkF8uTxVyyX/l92UkbBxQnRbfXvDrXZlyj/El0Rjg2QZAhEa3/1E/
 LFAXRcmmnQ+ho3eCD/9o3iHEHhxcg59jkw2lyLai3/11DQdD4H/U1JCRR/eMkEzCJf1a
 GrmiLPhi3b+TwOgwvXA0/mg1NGTg4OccdgqJ1OebE4qRfmjQiJDG9y1rR3KwTTPSfxWQ
 laT3jrnLn3bardT8bX7IqdhiB9u9sM9cHFT4+h6+VRJEiNJAmXWYjyhFFhFAMTW2kcGp
 7Wk4esFocdJrGQjKQ0PvnGmJalND19sqqtOH6Ea6l9tFF6uqktTbwS7wyini2CbC1S2w
 qxwQ==
X-Gm-Message-State: AOAM532ps71zW4vTTBiWtAQH9WxtfdFOk5yGlhmPHRjE4WeqpdKeDlsI
 cCJDp0YSmCdKoW+AI6ZTCrzk1A==
X-Google-Smtp-Source: ABdhPJwpMI0MAaL9l9KpZUw3BorEMtFqLIEh84Z9rHH7n1qNoAod8BG4nWO870Q1VedsWNsaSnYzMQ==
X-Received: by 2002:a17:90b:38ce:b0:1da:49fe:d04d with SMTP id
 nn14-20020a17090b38ce00b001da49fed04dmr2706556pjb.51.1651222566931; 
 Fri, 29 Apr 2022 01:56:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:b5c3:f85c:afa7:cae9])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a17090a4e8200b001d26f134e43sm9247781pjh.51.2022.04.29.01.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:56:06 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] Revert "drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge"
Date: Fri, 29 Apr 2022 14:23:58 +0530
Message-Id: <20220429085358.1699141-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429085358.1699141-1-jagan@amarulasolutions.com>
References: <20220429085358.1699141-1-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jagan Teki <jagan@edgeble.ai>

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

