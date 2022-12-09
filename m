Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F76648580
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13E10E54F;
	Fri,  9 Dec 2022 15:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696A110E54F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:28:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 4so5262071pli.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m44vPnqg/tFp5+4q15ZzrAAsZWANQlxSVTxmtXu3/9A=;
 b=EUVyUp9GaIYxpqTpKsJZA/dslfBr1LQitUAbqIQCAmaGpjJ+uCb3d+CQOig4xPRcPc
 aFC+TX0zNZGmuptvTlgK64AboxxKY5AGoJiETrXiBwSjqibNuz4epAy6S9ePy8OL6lS8
 Ojj5+y2GeN5ihsePK5GcNwaRNUE+BrBo9UPmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m44vPnqg/tFp5+4q15ZzrAAsZWANQlxSVTxmtXu3/9A=;
 b=sjtP6t3Lh969/SiPaS7XiLLcyysN1UGdBIUmxNVRtHYs84SCnn1Z6Z74PskaeTapUG
 AZYIsRBTkeCdZqsc+UaV63VuBhkpZBi9d6fOLStji2kAijfDc+JqTjIkSU48Ws8RrDpH
 qG5jWUGr2AdPpQ7UJ3zIOYptzsTIJ/aYgH+8itxJg3ZNEUqSWRdWzxk5ieXoRJpWH6Y+
 zTno7l7+zHp5NOtlbBQ1lfCJ6Ymb5LO1a+4rNnwhVMUNOQVQl0ofBl41SNVId0hKAYYp
 AzbTj7NcZKfAzsSeLzW8sK4QSZ0D0eJ3HDOUR5JhuPV+Sen2AOkNBAYZf8BFFMPQSJzj
 LtWA==
X-Gm-Message-State: ANoB5pmfj9w1RkFAbYbF/7pt+yNSHkLBvxYw7W/uSGwJpsMuX75hr6hG
 ipMJdPAugEsxWi291GfiZ4hhrw==
X-Google-Smtp-Source: AA0mqf6dQt+VkYj1h/ciPSlfHKO+5DZj9mgOoawK+JvVkI95FUXfGcdlpDfODYugKo8sr8nE2IExCw==
X-Received: by 2002:a17:902:e892:b0:188:f0da:c25c with SMTP id
 w18-20020a170902e89200b00188f0dac25cmr9238571plg.14.1670599708957; 
 Fri, 09 Dec 2022 07:28:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:28:28 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 14/18] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Fri,  9 Dec 2022 20:53:39 +0530
Message-Id: <20221209152343.180139-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
active low (DE_LOW). This makes the valid data transfer on each
horizontal line.

So, add additional bus flags DE_LOW setting via input_bus_flags for
i.MX8M Mini/Nano platforms.

v9:
* none

v8:
* add DE_LOW for i.MX8M Mini/Nano platforms.

v7, v6:
* none

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ef0d802d25bf..4de1294f29b3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1654,6 +1654,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1736,6 +1740,10 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_low;
+
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
 		ret = dsi->plat_data->host_ops->register_host(dsi);
 
-- 
2.25.1

