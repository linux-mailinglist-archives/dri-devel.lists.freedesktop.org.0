Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC27677F0B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C76D10E4BB;
	Mon, 23 Jan 2023 15:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A410E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:13:42 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so15544738pjg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cD1qAiqhfd1q1+yXxcnzmuelB54aAtoGJRwcpOhnRjA=;
 b=Y9rWx+WXq1qAX/ArzBiXIUhyfMnCHXDxcO7ot7UzGnsPIDOdGxmc/Z+COV1bU++iIv
 86N2rYuZx4/QE6h+tMDg8esBTYRgVr39odhbGrPc4hg5DYuW8N3zWVAvUYrqioN/umJS
 afFF811AfM8YTCAwfGgtNJJbN0yhOQukp3WFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cD1qAiqhfd1q1+yXxcnzmuelB54aAtoGJRwcpOhnRjA=;
 b=DbyjxfzfgLg6mphIMtAYKvd+TdCgD8bGYVVshrEhTTq8TezGLR1nwDr2qeZ5a36RWP
 RuEml83Lu+x9xY0+0fCtr1XHulh+C2GrhqtxqnhgWLExkgMjUvqlpgZSiqVCqTsMuArH
 JLnoxQM/GSpS+kNBbtojIaSW4v6y1J8HjCi5NY8rjTI1OaBs1TfPmGL95jBgL8CQGtkq
 pvfiKScLpamiEOaOpOn6I/3Bv160Zo2o7PFnh1NuhtY+UzZ6ccH09lQ352XnBbS6p3qu
 D+vLTAS7JsGg1XyEKPSyiZOwaC4HSUucGoWjAYDn+FNVIa+is4v3JxASUBtlx51fQipy
 Fswg==
X-Gm-Message-State: AFqh2kp8lkBv9euzciNHI/aKlSRS9SMz5C8DMO/D26p+0YGFDOQ3DFCN
 NQLkTx6J9mD9NX/Eh7WTAfuOHCIjUj7SG0iZgkA=
X-Google-Smtp-Source: AMrXdXsdTQhVM+xle4TpxW5nEZqRgPKRqp/L1BsIVF+zMqosAydzOF8MeKAK+Z/XO13wcKPF8w3Oag==
X-Received: by 2002:a17:902:eccf:b0:194:dd88:ea13 with SMTP id
 a15-20020a170902eccf00b00194dd88ea13mr18887694plh.55.1674486822037; 
 Mon, 23 Jan 2023 07:13:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:41 -0800 (PST)
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
Subject: [RESEND PATCH v11 10/18] drm: exynos: dsi: Add input_bus_flags
Date: Mon, 23 Jan 2023 20:42:04 +0530
Message-Id: <20230123151212.269082-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

So, add additional bus flags DE_LOW setting via input_bus_flags
for i.MX8M Mini/Nano platforms.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect RB from Frieder
Changes for v10, v9:
- none
Changes for v8:
- add DE_LOW for i.MX8M Mini/Nano platforms.
Changes for v7, v6:
- none
Changes for v5:
- rebased based on updated bridge changes
Changes for v4 - v1:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d8958838ab7b..5518d92c8455 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1691,6 +1691,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1777,6 +1781,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->bridge.pre_enable_prev_first = true;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &dsim_bridge_timings_de_low;
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
-- 
2.25.1

