Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F93BAC80
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60089996;
	Sun,  4 Jul 2021 09:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3489996
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:34:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id a14so8242205pls.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soEhStCCu76Mb6wAleqjQlaEag+tEU+KXAoLOzeCffA=;
 b=Oq0ZepxEGhElsw3VOZ1nZDNdnDaHl+aygjwgqlB3d7+Wt0tk7B0AaCkvAoZOKgsuTG
 y6e8kjG130m+hw5sft42HGldxxfrz504fX21cbNiwK+zuQxOsl4j6uZMDpfBRzgf9Rkw
 3tNPApVqTSBLq12ZPVZWpqUPFfY8nQBbGZ6bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soEhStCCu76Mb6wAleqjQlaEag+tEU+KXAoLOzeCffA=;
 b=FkES29UUHWTlqV6W4QElb0NX7kfdyoIpWknYyV/Xsg5EJjEoYpstKvKyhX5xhsGm7W
 9zUnd+vetYEDL+2WOXg84rxH5ne8cCP98rVMzAQ8b3zaw/Cvn8eowa/R3O5DLvDfzv+g
 BAv+VKrRd8GjCtZRc9f0IWPeZBNmnXmQ1BKHErS0vcoWzc2GKHbWO78low+TQEOPjiEO
 AS14oWO1nNgDg+9VRTHYk3c3QPMsf/13PqiJWcpoDRgewY7yy+MuFFYyOkn4OWNVcVmG
 bh2quAJvyUGBR3+EFACew8KJXrMPeeVxvD5k9EyMJ0q9Vy33Cyl190qwlS8tSkk8xxeo
 Y8BA==
X-Gm-Message-State: AOAM531ksF8W7Om0lv1cwM4vGqwjAOfz+pZP5qfkejrF2jfb8W3hw4jq
 TZNeWY4eqimOFzW/nV3G6OCG1Q==
X-Google-Smtp-Source: ABdhPJzwFiWMedGcet8AjbR1l5eZ8xskT0RmC//PX0hniuO5xocK7QTS57mpaJsqtSGq3jXNJh68Pg==
X-Received: by 2002:a17:90b:4c4b:: with SMTP id
 np11mr8824819pjb.125.1625391284155; 
 Sun, 04 Jul 2021 02:34:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id n23sm9278129pff.93.2021.07.04.02.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:34:43 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm: bridge: nwl-dsi: Drop unused nwl_dsi_plat_clk_config
Date: Sun,  4 Jul 2021 15:04:33 +0530
Message-Id: <20210704093433.27717-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nwl_dsi_plat_clk_config structure added in below commit but not
used anywhere in the driver.

commit <44cfc6233447c> ("drm/bridge: Add NWL MIPI DSI host controller
support")

Drop it.

Cc: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 873995f0a741..d7986067eefe 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -48,12 +48,6 @@ enum transfer_direction {
 #define NWL_DSI_ENDPOINT_LCDIF 0
 #define NWL_DSI_ENDPOINT_DCSS 1
 
-struct nwl_dsi_plat_clk_config {
-	const char *id;
-	struct clk *clk;
-	bool present;
-};
-
 struct nwl_dsi_transfer {
 	const struct mipi_dsi_msg *msg;
 	struct mipi_dsi_packet packet;
-- 
2.25.1

