Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F955311CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E3F10F634;
	Mon, 23 May 2022 16:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16810F634
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:15:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n10so29871707ejk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tGFnUfATheJcgd6cmDQVYlu9gLXYWRlr8k9P4s/DGYQ=;
 b=IKmHlc9/5WgvRfW91RixgfNPoqkOopUkLPRDZC6vJFj6T8bRRMmUi83qO2Tal4kN8j
 lDryajBcl60SVsBNNyNhxreZojGw9vRQykC4IU/uZ9D3SUu5xtRDao+JxQJ6TWl+4jPt
 aeejXEYDstEVn2kDjbPhtOd/jlcUWAfQN1TooyyiC9pXAB58biywh7WDVneKyXdzvVFP
 rubJY+qyrF7bjbLXQleiO4LphrbkiecCrhNhT9Dhx7tLPQuwTjCWT8yIuB7NSd03iARA
 nS1ohli+xGxpE4P1OyGe2eQwohkRF3rF3NAV0UqOez+IawIUAl6PFkkSOgqLhm3fasDj
 hvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tGFnUfATheJcgd6cmDQVYlu9gLXYWRlr8k9P4s/DGYQ=;
 b=cu+KmaxNkkraVHEVrsZ9CM9VmwftGDTsm5I+QOXXUrMm3Rp8dFDQCQgHF6+ANY5puK
 uwyK49jDAn88LMjS2OO0nQeyKoUml5tPj8vYn43aNqkutjMMNV2raOHhq4D6FGngQ0WW
 qhDW7ZQZFyscAxXrOvciwoh7bP4uTAQGK/ldHe0unsZOcFOeyeuTwD3QXDu0m8kKISw/
 oDSCmIe6xpU38ZgkhZm0JRfCF+Rbc7+6BvuL5Ai7bivMB5KYwrxfa/e5FGV1l6fhmbeJ
 wT5zHY593qE5UPVkF1l/xLfNk9zBHw8gPBTylk4VkSDcU9KzzDDDIlfLWrjdT543+yQa
 rqVg==
X-Gm-Message-State: AOAM531vQfGbMUdtMz/641oZZLokzlmpfLQtsZr41FXDl53olFU1+YKq
 i0RRFI1FchcdZjEGl1cONoBo0A==
X-Google-Smtp-Source: ABdhPJxKHQ4KaT+LrQ1BMBe4p/nRE/TYR99LwxI7ls1LX1ia2lhZ2Nz6mIM6eBSkHUl/ZyncTSHaTw==
X-Received: by 2002:a17:907:6d93:b0:6fe:cf1c:cdab with SMTP id
 sb19-20020a1709076d9300b006fecf1ccdabmr6745653ejc.609.1653322526576; 
 Mon, 23 May 2022 09:15:26 -0700 (PDT)
Received: from prec5560.lan ([2001:bf7:830:a7fa:f33e:a35d:7618:8a44])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b006feed212f50sm950591ejc.184.2022.05.23.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 09:15:25 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 xji@analogixsemi.com, hsinyi@chromium.org, sam@ravnborg.org,
 maxime@cerno.tech, tzimmermann@suse.de, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
Date: Mon, 23 May 2022 18:15:19 +0200
Message-Id: <20220523161520.354687-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.

This patch depends on the patches just aplied to the media tree, and will
not build without them, which leaves drm-misc-next in a broken state.
Let's revert the two latter patches until rc1 has been branched,
and rc1 has been backmerged into drm-misc-next.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0fab2aa47c67..e92eb4a40745 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
 
 	anx7625_get_swing_setting(dev, pdata);
 
-	pdata->is_dpi = 0; /* default dsi mode */
+	pdata->is_dpi = 1; /* default dpi mode */
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
 		return -ENODEV;
 	}
 
-	bus_type = 0;
+	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
 	mipi_lanes = MAX_LANES_SUPPORT;
 	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
 	if (ep0) {
@@ -1641,8 +1641,8 @@ static int anx7625_parse_dt(struct device *dev,
 		of_node_put(ep0);
 	}
 
-	if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
-		pdata->is_dpi = 1;
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
+		pdata->is_dpi = 0;
 
 	pdata->mipi_lanes = mipi_lanes;
 	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
-- 
2.34.1

