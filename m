Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C69D1D7BE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93BF10E5EA;
	Wed, 14 Jan 2026 09:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="b9B6otzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42010E5E0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:23:06 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-81f4e36512aso2993275b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768382585; x=1768987385;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
 b=b9B6otzMdBAbFIrn//ks03LtbYJApbZukhcc2cFMjPBYzItraWlbIYVBn8TnKJU/vh
 lkNgVRZD6H4ZMJlbn8d3DO1hANWCV8EjO13rMpfzJHARg8y20EHs5rJ4H1l4L3q6yOiG
 7QjY3Uzq/VSwU3r9Zc9KluQ+ChalSDaDh/r5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768382585; x=1768987385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
 b=WnV3KFxR582wByB2gRdR0R0/sPLEx6k0gZbZU9L92shPqVp9TLoh8eMDEcHLlhvYyM
 C+SuIa40CvzzvvHlc4AzFqUldqMmEtkkrfYYTBwgdzLEgsdnho+4pECf4lAMtGd0S/7Y
 pl485pKM3mm1jeRfgoTYlfLV50uBM4UUHziJSyGwkc1pPJr9NpIjzLUveWGA3JylgHmS
 SJzXkxkZk3FzEwc841NWRd4fEBtNmOGHU0cPMT6etWw2RQGN1IYcjVCmDLm6moT0nktp
 v4XKoo6uZRoob6ugcVpKzlyGyR8/4BqerZOJc7bS2W5d01p0eCEMo6fx48KLdkJ+tJMn
 zcUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDzA4rxOSaBUDazVSbfuYNkwbXY2FlAv87gM8bUWjcVOgzK7aaaT56V5K4K76NI+0g8mttMT+tHTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlZ4QhzedTaHUJRsQhfHyNj9Iq6QmY+97AKZQ8noHCorVrGnes
 Gs7vDd0gv6xfmNvpzb0kSsRkpAymzkxA1tvHpdAcQgznAZ6o6RfSCvC/23PQtpCSFA==
X-Gm-Gg: AY/fxX5fw2IKAXcIAAbOe29BxXcREWVi/iD/T563x/EeJWkeWZ0L80YdeXIBGHeroVG
 k7eSVnoTtpZ+iaPKPca14jwtUEuH79pYoP3aouEXWagWr5k4Bw9b++sl31pMCskBoeepxXoJzgJ
 p9LDkkR90+5ziYIav6L+EP9lK/jS1T3DTJcCAKPt85CCsrq1jyJ2Y1T/RlU2r/dtspTmWuTLwqh
 cTNUpuv2nLdw61ajnTUJF+o3Enoh5Q2XaSZYI/riH3m24fTmKDRWeOKIM2yNr66lnGcojzqn4Sa
 7+GlewQ8peU5Rw5fBR3ILI/0KmRlu4CPOQz2sNAfHGhdWLpDXZ3aoqRhDVP82SkFs8CfIwc8bYi
 bW8rL0ZAAJiqaveg2R9mqIbGiHapeFTjuR5QcEZl34y86gdP/7uilut3zlEgQujs4OZNUs8obmw
 VXW3OTDMzad9draMwM0pTdUYn/aKNUBVzEpe/ZhOtJ3YjBVnnowxI8Whwg5Y32Ad2HpW6h
X-Received: by 2002:a05:6a20:c525:b0:38d:e87c:48d5 with SMTP id
 adf61e73a8af0-38de88b96c6mr144807637.21.1768382585505; 
 Wed, 14 Jan 2026 01:23:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2a00:79e0:201d:8:c346:2298:451a:a3f3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc8d29516sm22099403a12.19.2026.01.14.01.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 01:23:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: dpi: Find next bridge during probe
Date: Wed, 14 Jan 2026 17:22:42 +0800
Message-ID: <20260114092243.3914836-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
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

Trying to find the next bridge and deferring probe in the bridge attach
callback is much too late. At this point the driver has already finished
probing and is now running the component bind code path. What's even
worse is that in the specific case of the DSI host being the last
component to be added as part of the dsi_host_attach callback, the code
path that this is in:

 -> devm_drm_of_get_bridge()
    mtk_dpi_bridge_attach()
    drm_bridge_attach()
    mtk_dpi_bind()
    ...
    component_add()
    mtk_dsi_host_attach()
    anx7625_attach_dsi()
    anx7625_link_bridge() - done_probing callback for of_dp_aux_populate_bus()
    of_dp_aux_populate_bus()
    anx7625_i2c_probe()

_cannot_ return probe defer:

    anx7625 4-0058: [drm:anx7625_bridge_attach] drm attach
    mediatek-drm mediatek-drm.15.auto: bound 14014000.dsi (ops mtk_dsi_component_ops)
    mediatek-drm mediatek-drm.15.auto: error -EPROBE_DEFER: failed to attach bridge /soc/dpi@14015000 to encoder TMDS-37
    [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
    anx7625 4-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.
    panel-simple-dp-aux aux-4-0058: DP AUX done_probing() can't defer
    panel-simple-dp-aux aux-4-0058: probe with driver panel-simple-dp-aux failed with error -22
    anx7625 4-0058: [drm:anx7625_i2c_probe] probe done

This results in the whole display driver failing to probe.

Perhaps this was an attempt to mirror the structure in the DSI driver;
but in the DSI driver the next bridge is retrieved in the DSI attach
callback, not the bridge attach callback.

Move the code finding the next bridge back to the probe function so that
deferred probing works correctly. Also rework the fallback to the old OF
graph endpoint numbering scheme so that deferred probing logs in both
cases.

This issue was found on an MT8183 Jacuzzi device with an extra patch
enabling the DPI-based external display pipeline. Also tested on an
MT8192 Hayato device with both DSI and DPI display pipelines enabled.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 61cab32e213a..53360b5d12ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -836,20 +836,6 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
-	int ret;
-
-	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
-	if (IS_ERR(dpi->next_bridge)) {
-		ret = PTR_ERR(dpi->next_bridge);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-
-		/* Old devicetree has only one endpoint */
-		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
-		if (IS_ERR(dpi->next_bridge))
-			return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
-					     "Failed to get bridge\n");
-	}
 
 	return drm_bridge_attach(encoder, dpi->next_bridge,
 				 &dpi->bridge, flags);
@@ -1319,6 +1305,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq < 0)
 		return dpi->irq;
 
+	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
+	if (IS_ERR(dpi->next_bridge) && PTR_ERR(dpi->next_bridge) == -ENODEV) {
+		/* Old devicetree has only one endpoint */
+		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
+	}
+	if (IS_ERR(dpi->next_bridge))
+		return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
+				     "Failed to get bridge\n");
+
 	platform_set_drvdata(pdev, dpi);
 
 	dpi->bridge.of_node = dev->of_node;
-- 
2.52.0.457.g6b5491de43-goog

