Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0A530B1D
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 10:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20010F04E;
	Mon, 23 May 2022 08:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AA910F04E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 08:46:35 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id n10so27229570ejk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8KZ9e+aFywu8cob9B7lyv8cw/GG4lY7xYjZnUL2c5Po=;
 b=x6a0/a59LPzK/XbjLygNZX+iuxxHylNyyOs3r109raURIjnZdsiY/qUM3RzicmAgRL
 g0Nd5CRWwWwTy/qomFzYeX3g/CjTeg2mI7yEXg0HQhnb90sMlip0m/Ew6N+3nNvXE6gg
 9d6FbvhKtkLNXd2qpA354YSaJhzZ6YGKFn+L22TnIUZ23k2hlEo1EFe8LMk6lNiViNpp
 /X2reVm7Zce6S8CAWolYqpb/uizlg/dfwAU1vjiPCCPvPXlrV2wxK3PwFSC2tMnga59d
 ZwxJqzZutwdSpR1Ku3+rfFSeqBer6+OuTmQK+ZjCTgRJS/1k9W2ZQS7pp8ag13X7jC1m
 hyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8KZ9e+aFywu8cob9B7lyv8cw/GG4lY7xYjZnUL2c5Po=;
 b=mM3RGlzNirXJHG4sz+3u5Sr1r8XqMFk+fz6Qjd+aVbwAJDQGKsWI8RZ7lrPVBsO7bE
 wLdIGgY/oaW/r7hSC+VcOIXdR9tOmONRj4OZH0qa5lZSGYSUwzXU/NuEmh/l6xaQvXDX
 uWILqjImQPBCqPcsPHntp5YQ/TPSo0hWJrvtl7Ea+e0bxjezrrMSajW0YuN3LdwYJ+7D
 /WfH3znZEZAmAlQbT2pvNot11F+cwWVNyec2Ee+CGZtxPPI6DcSRv9PFWyyc6BpEDWLt
 5IltN8yc+vgvo+H1s0DFm1qGf/s+7q/+N1eNDK9f0xC98jj4tUGouWIyzFjfpfSXx58z
 +IJA==
X-Gm-Message-State: AOAM5306EY1Yhu8XHuus1DWJ5qOmIwgDROwl+xNld/ujqYEKldkOYkHO
 As4Yf11zfNxrAJeizKXcxrHA6w==
X-Google-Smtp-Source: ABdhPJwDRYBw80yFFSMqilCh6Rwe3b3/Gwjq4XKqz2jH2FgXaRVvRV2qPJPfLQhSkrW6CBKtFhnKdw==
X-Received: by 2002:a17:907:78cb:b0:6fe:9ca3:2a9b with SMTP id
 kv11-20020a17090778cb00b006fe9ca32a9bmr17175623ejc.727.1653295593558; 
 Mon, 23 May 2022 01:46:33 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19]) by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b006fee27d471csm905706ejf.150.2022.05.23.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:46:32 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 xji@analogixsemi.com, hsinyi@chromium.org, sam@ravnborg.org,
 tzimmermann@suse.de, maxime@cerno.tech, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
Date: Mon, 23 May 2022 10:46:14 +0200
Message-Id: <20220523084615.13510-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 01f46d9189c1..53a5da6c49dd 100644
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
@@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
 		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
 	}
 
-	if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
-		pdata->is_dpi = 1;
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
+		pdata->is_dpi = 0;
 
 	pdata->mipi_lanes = mipi_lanes;
 	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
-- 
2.34.1

