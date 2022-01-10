Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51535489E4E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0A10FF78;
	Mon, 10 Jan 2022 17:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9D610FF78
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:25:46 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id w7so12883090plp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ni86PHZD0FLhV231fzfITISDgi2okimLjkw7Y9X52b4=;
 b=GzlVq2OEaQm1j5ZmlUJCRj5Oy64wKTF75q5RMXza029QgIdatNaJFjfFqODiLZge/X
 WWtXjkTSGAZmpTE/jox+aQkQfqEcYacvwM0D18ZAPl407v0TGlhIj1+jT7leNQ7NQtBz
 7WWFEiYjcL+dE4tAm4DwPL4of9qXJDyVH/VOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ni86PHZD0FLhV231fzfITISDgi2okimLjkw7Y9X52b4=;
 b=XZFQy9NToZxD4mgNUjzeyVqJzORxL3n/gDECAwWDyUu6FyW69K0VRzuMHQr3+HOLlB
 fWKJ9gs//GEQflaUiz1McIhs3Y+Ca+YJM+OKduKIs4N5nn4si+D8AVGL3dttTdtA+9XB
 3kbAgd+9J+QnTNoHetE0DR2TCB/QBmE0k/iAB7UhTjtofBTmXYRD9xWbz198NsVbzkuT
 I1X7mMHA165REe8BenFonxiWLR5s9uenK/hmqXgAU+HRPxmp8uVYo8H/AxN88+CRbTPn
 R07/G6y2V8Cnr0Ulgx0j3jvWHxrZy5O2bmJZ0Q1C6NcqGzneP0SjrFMqX3LS95L/nn0V
 iFjQ==
X-Gm-Message-State: AOAM53211m5wUthtxrgQh5laKNpJB2uxBZ99aghu3BzHI9SoIbXPa7Bl
 k1GsbyS0YJKVSoZzf6pXEkBHTQ==
X-Google-Smtp-Source: ABdhPJyykPo1Z51C3m2c9PYZsTQRln2IwR3eK7L61CoajkKHKbKcV7r4UFLEnguBracqdwfJ0E9oZA==
X-Received: by 2002:a17:90b:34f:: with SMTP id
 fh15mr6504048pjb.122.1641835546154; 
 Mon, 10 Jan 2022 09:25:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:98b9:3ff7:5eda:a7cc])
 by smtp.gmail.com with ESMTPSA id q2sm7884350pfu.66.2022.01.10.09.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:25:45 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
Date: Mon, 10 Jan 2022 22:55:33 +0530
Message-Id: <20220110172533.66614-1-jagan@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panel_bridge pointer never used anywhere except the one it
looked up at nwl_dsi_bridge_attach.

Drop it from the nwl_dsi structure.

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- collect Guido r-b

Note: This is patch is part of switching of devm_drm_of_get_bridge 
serious however the child node support of devm_drm_of_get_bridge is
still under-review. So send it separatly as it not related to that
API switch.
https://patchwork.kernel.org/project/dri-devel/patch/20211210174819.2250178-1-jagan@amarulasolutions.com/

 drivers/gpu/drm/bridge/nwl-dsi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index fc3ad9fab867..9282e61dfbf0 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -65,7 +65,6 @@ struct nwl_dsi_transfer {
 struct nwl_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	struct phy *phy;
 	union phy_configure_opts phy_cfg;
@@ -924,13 +923,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 		if (IS_ERR(panel_bridge))
 			return PTR_ERR(panel_bridge);
 	}
-	dsi->panel_bridge = panel_bridge;
 
-	if (!dsi->panel_bridge)
+	if (!panel_bridge)
 		return -EPROBE_DEFER;
 
-	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
-				 flags);
+	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
 
 static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
-- 
2.25.1

