Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46BAE60D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7789D10E563;
	Tue, 24 Jun 2025 09:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="PW1tjfWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D2210E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750757095; x=1782293095;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7gZBvYYRlxzSRc55o32/rEUnTQMYgXtfaWD8NxSkwHE=;
 b=PW1tjfWnuSNDXIp5qWUPeVGmELZkAMA9mf7vAtJNI+UfOcbquwCCSTwd
 p+DzUv+rLWFQBpoXJUVFOPPyeo8MfAkJJuHf6vuDvitr5ch4jjOxCYHJX
 WDyleDfUpDC+51nWuR/xdSjRFuGHZQuOVMKXKNlE3gUe0foKWmSwz+BMt
 S3weXJG3Ycy8QTxCDScIkZxvHTudPtrSBfJy2DysAmwGXvAThKR134zqG
 k+OzrW8WNuScoW9TiwNJ57+XDL3U9OOnTVK53pM5JnKFuVpOGV9qh4cTb
 xqrVDSVPdIQgFJCVu/6Gvf7NTfThi5tlhf0JD8IBcls6353M7AlApZE29 Q==;
X-CSE-ConnectionGUID: kAMBk0q5SXCuhoUD0ewa8g==
X-CSE-MsgGUID: Mj7RMdJNSLifHtOGFeQWnQ==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="42674600"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 02:24:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:29 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:23 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 24 Jun 2025 14:54:14 +0530
Subject: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
In-Reply-To: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=1327;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=7gZBvYYRlxzSRc55o32/rEUnTQMYgXtfaWD8NxSkwHE=;
 b=pP/KBQEgvhoGIWTSENdNu1+s9SK7oVhKMbWoKEl68GUKYKy9UlSKnn2vNY9N2zxLWBoJZ7YcF
 mzHnGVSjV1dDQsBMKo8f5FXbmPJy5vrmZzr7Ul99GVYOgtrZjWf6f+B
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
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

Drop the drm_panel field of the mchp_lvds struct as it is unused.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 9f4ff82bc6b4..42751124b868 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -23,7 +23,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -56,7 +55,6 @@ struct mchp_lvds {
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *pclk;
-	struct drm_panel *panel;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 };
@@ -179,13 +177,8 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 			"can't find port point, please init lvds panel port!\n");
 		return -ENODEV;
 	}
-
-	lvds->panel = of_drm_find_panel(port);
 	of_node_put(port);
 
-	if (IS_ERR(lvds->panel))
-		return -EPROBE_DEFER;
-
 	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 
 	if (IS_ERR(lvds->panel_bridge))

-- 
2.43.0

