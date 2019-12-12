Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C811C8A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3326ECDC;
	Thu, 12 Dec 2019 08:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCC76EC2B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 02:26:43 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id q16so355288plr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7vJFLV5AGpFPFfMe9ZJk5htpwunensz3QNYFdEkqp1c=;
 b=Cs1PLduRzmvJpiC4ReD26i6gt72XHoIOf8ztfMTz5IIhK7KIVEOos1bGQeRAGdLqsd
 i+9Wh7KNNStas35I1eHS0FDfcFftXfZwM3s7njo3ZrOjOEwsNt7GPjMImCW97VW+0R5C
 IA4WRkNRhUMW7eTiBxjzpZ6ICj0gzMg1PF0AfzVmbxZ2riIgZInmR1TWm8k8BqUNUVND
 Zlz+knZf1SKQmZvRyFOd1oCWt7dBu05KUpGGHL2smm+jVP3qsHD0w8rLHeCxngtRsswp
 4R08jUzX3tDubTlbR9kcvWu3fPPRlf5brPRpW7QyIduXEFc3oAPlgEpVFw+l9oOxsjd5
 R6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7vJFLV5AGpFPFfMe9ZJk5htpwunensz3QNYFdEkqp1c=;
 b=twX0jCss6bRkMPaEiibu/unGfxXpcUf3C26Jz6Dhm4M2HrfZXQPWj0RoHvUn/+RrJC
 HQf/HsflO3V6tsExlmxJGA0b0WngzyRFwZsAb+0ktUOCnJxZqVKQXN7MlfFNOvJtqOlF
 DCsPMcbPCo4NTlAgWC3sEg5TBhno5wyEn2Y7m7ZmpagGYObVUEfKe9jgdtHCnjVbax2Q
 sx9swViyl73IeQoUndtrt+x3hOgbqgibpIeEFaLy8e0txksNF0woHc9fkh4JY2eLPlWV
 7wsROCDiddCr+r6tR+Ee0SbWCg7zqdvvP/E7RsTZLbbr0hUjodyXMGLWWB4qESYFkp4Z
 dxbg==
X-Gm-Message-State: APjAAAVj+2al0SPca20Xge3D3IRvMzsW8o4ybYH0wkaBmPwksaq8cJ5R
 NWtRkRbD2KJyrI8dg60thMq4jnSyjMU=
X-Google-Smtp-Source: APXvYqyIGVhoBif7n60b3MzRTxD83/b3g8/Tl0fSAP3xhfP8oQ2TlJbFKlka94kIsWBUU53mFiseXQ==
X-Received: by 2002:a17:902:fe09:: with SMTP id
 g9mr6617749plj.162.1576117602790; 
 Wed, 11 Dec 2019 18:26:42 -0800 (PST)
Received: from super-sugar.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id c1sm4509055pfa.51.2019.12.11.18.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 18:26:42 -0800 (PST)
From: Jerry Han <jerry.han.hq@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: boe-himax8279d: use drm_panel backlight support
Date: Thu, 12 Dec 2019 10:26:14 +0800
Message-Id: <20191212022614.14728-1-jerry.han.hq@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Jerry Han <jerry.han.hq@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the backlight support in drm_panel to simplify the driver

Signed-off-by: Jerry Han <jerry.han.hq@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 65ea6f673cdb..3a6ee2069158 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -6,7 +6,6 @@
  *
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -47,7 +46,6 @@ struct panel_info {
 	struct mipi_dsi_device *link;
 	const struct panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *pp33_gpio;
 	struct gpio_desc *pp18_gpio;
@@ -93,8 +91,6 @@ static int boe_panel_disable(struct drm_panel *panel)
 	if (!pinfo->enabled)
 		return 0;
 
-	backlight_disable(pinfo->backlight);
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0) {
 		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
@@ -218,13 +214,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	ret = backlight_enable(pinfo->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->drm->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	pinfo->enabled = true;
 
 	return 0;
@@ -899,9 +888,9 @@ static int panel_add(struct panel_info *pinfo)
 		return ret;
 	}
 
-	pinfo->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(pinfo->backlight))
-		return PTR_ERR(pinfo->backlight);
+	ret = drm_panel_of_backlight(&pinfo->base);
+	if (ret)
+		return ret;
 
 	drm_panel_init(&pinfo->base, dev, &panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
