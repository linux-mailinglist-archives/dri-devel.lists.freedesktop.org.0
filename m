Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C9525D5D
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 10:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103110E772;
	Fri, 13 May 2022 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3210E772
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 08:32:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220513083245euoutp025d92899c6f3ccfaa6e70a7b7b76192ac~unQamDPCB2782827828euoutp02u
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 08:32:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220513083245euoutp025d92899c6f3ccfaa6e70a7b7b76192ac~unQamDPCB2782827828euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652430765;
 bh=WJLM1q9DhvZj6/uNnLJdKZnAvZc8gcipMobnGIIE0Ho=;
 h=From:To:Cc:Subject:Date:References:From;
 b=sH+KWvofkDUfe/mqV1A0FmeOqTDLxGpfOnj1gUQ1+Lz4cGIlgl2wCjdHkFhaJUerf
 34WKC8EUfd+vE5Q/3NCW95qa7QfGx9I1oKPPDYHNX7i++kxBoGRY74C87PLqgUeSE1
 CidEERU3HBKOma2w66uqalqShKUqJAMeeZ5OFlIM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220513083244eucas1p26669b15266bc4653116848e2b124e4b5~unQaBy5Qh2224422244eucas1p26;
 Fri, 13 May 2022 08:32:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.9B.10260.CA71E726; Fri, 13
 May 2022 09:32:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220513083244eucas1p115ea99c134d62692389303b8116702be~unQZj5zQL0897308973eucas1p1q;
 Fri, 13 May 2022 08:32:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220513083243eusmtrp21bab30dff350b1add7042b4c624a8dd5~unQZdg4VC2308923089eusmtrp2B;
 Fri, 13 May 2022 08:32:43 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-13-627e17acac82
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.78.09522.BA71E726; Fri, 13
 May 2022 09:32:43 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220513083243eusmtip2981de19b28f5749e168ca57e06757639~unQZC2bKL2109921099eusmtip2v;
 Fri, 13 May 2022 08:32:43 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: mic: Rework initialization
Date: Fri, 13 May 2022 10:31:05 +0200
Message-Id: <20220513083105.9456-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djPc7prxOuSDBZskbe48vU9m8Wk+xNY
 LL5smsBmsff1VnaLGef3MVmsPXKX3eLTrIfMFjMmv2Rz4PBY+/E+q8eda3vYPO53H2fy6Nuy
 itHj8ya5ANYoLpuU1JzMstQifbsEroxHsx8xF/xUrzj6djpjA+NXhS5GTg4JAROJ/9uOM3Yx
 cnEICaxglGju6GaHcL4wSnxZtJMJwvnMKLH1w1dWmJblD66yQSSWM0qcn72fBa6la/M6dpAq
 NgFDia63XWwgtoiAm0TT4ZmsIEXMAs1MEkfPHmAGSQgLmEvMmzQZrIhFQFXi09pzTCA2r4CN
 xNQDTcwQ6+QlVm8AqecCsjs5JGatnwHkcAA5LhIX+60haoQlXh3fwg5hy0j83zmfCaIkX+Lv
 DGOIcIXEtddroEZaS9w594sNpIRZQFNi/S59iLCjxMFXr9ghOvkkbrwVBAkzA5mTtk2H2skr
 0dEmBFGtJjHr+Dq4nQcvXIIa7iHxZF8rWFxIIFbi+tG7jBMY5WYh7FrAyLiKUTy1tDg3PbXY
 OC+1XK84Mbe4NC9dLzk/dxMjMCWc/nf86w7GFa8+6h1iZOJgPMQowcGsJMJb01yTJMSbklhZ
 lVqUH19UmpNafIhRmoNFSZw3OXNDopBAemJJanZqakFqEUyWiYNTqoFpMe+xyO3LDJOWf2BV
 FHE/brlaeJFj5S0p9qIL2bNuajulv3JS0cx/mtTBlRowL+oSo3/i1EzrrYZs3nIC72vvzimP
 Y+cUb/AKTXh30Xzq2jOCFy9PCI/W3KS7bvsMS6frn5gXfxCdcaZLhcfQ0EhEyu39FPldPy0u
 m8xxO/9/Qj9npa+dn3NidPYSW9EXLhrFqq9K+NZ6y7Me8Xm5aonQy0XWJZca3vwNFF3BofSx
 9MMPx6CJXxrXcC12f9rox/Q70LcvZ3VX2WLTz7Hq10pX1Ty8KbI44Mh2Lqbbusty/R65n/YR
 PxghqsfUU3zefaLKcf/+g+uvSNatYa1aUuvmVZP5V2DiPDf1txXu6UosxRmJhlrMRcWJAKFz
 zm54AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsVy+t/xe7qrxeuSDC7tMrW48vU9m8Wk+xNY
 LL5smsBmsff1VnaLGef3MVmsPXKX3eLTrIfMFjMmv2Rz4PBY+/E+q8eda3vYPO53H2fy6Nuy
 itHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQi
 fbsEvYxHsx8xF/xUrzj6djpjA+NXhS5GTg4JAROJ5Q+usnUxcnEICSxllHh/dCEzREJG4uS0
 BlYIW1jiz7UuqKJPjBIL5nxlB0mwCRhKdL0FSXByiAh4SDR/O84OUsQs0M4k0dm5iwUkISxg
 LjFv0mSwIhYBVYlPa88xgdi8AjYSUw80QW2Tl1i94QDzBEaeBYwMqxhFUkuLc9Nziw31ihNz
 i0vz0vWS83M3MQIDctuxn5t3MM579VHvECMTB+MhRgkOZiUR3prmmiQh3pTEyqrUovz4otKc
 1OJDjKZA+yYyS4km5wNjIq8k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+J
 g1OqgWnTvuXcE5q/9Eed771844Gu2OPVh39LKtdeuCnrZmkbcmj+HKOLj2L3J2/vPOg8qbx9
 1Y82naWJ71adFVqWPoN/F6PeI7tPIWuS5qmq5389Yu0pZlJvu8d1yRYWxqce07bcSfwZb2f8
 7NnV3rXzhB2nq6o9qxD8LWWp/HHZv3lMuxpnm9b8zFY4FBq6yUpLM3qeeVgK94LIpi1zhL6u
 e6xVyPEx4mGYWbvA+zPNbMnTF+XGB/3Qm1IWrWo0Z56cpM/3O6X/OV4ffhgrv3lXmc6x112V
 yx9NdzJP8E6IWzZd7OTh4mMhiemFqo2/63tOJTdYRifMN/arX8g/YUOrj08C+37j9cZ7tv53
 iWiq2aXEUpyRaKjFXFScCADCLuzO0QIAAA==
X-CMS-MailID: 20220513083244eucas1p115ea99c134d62692389303b8116702be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220513083244eucas1p115ea99c134d62692389303b8116702be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220513083244eucas1p115ea99c134d62692389303b8116702be
References: <CGME20220513083244eucas1p115ea99c134d62692389303b8116702be@eucas1p1.samsung.com>
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
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
moved Exynos MIC attaching from DSI to MIC driver. However the method
proposed there is incomplete and cannot really work. To properly attach
it to the bridge chain, access to the respective encoder is needed. The
Exynos MIC driver always attaches to the encoder created by the Exynos
DSI driver, so grab it via available helpers for getting access to the
CRTC and encoders. This also requires to change the order of driver
component binding to let DSI to be bound before MIC.

Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
A few words of comment. The mentioned commit has my Tested-by tag and
indeed I gave it. However that time due to remote work and incorrect
camera configuration in the office I was not able to check if the board
really produces valid display, I only checked if it boots and reports
valid DRM structures to the userspace.

If possible, please merge this to the drm-misc-next together with the
rest of Exynos DSI to drm bridge rework patches.
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++--
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 42 +++++++------------------
 2 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 424ea23eec32..16c539657f73 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -176,15 +176,15 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 	}, {
 		DRV_PTR(mixer_driver, CONFIG_DRM_EXYNOS_MIXER),
 		DRM_COMPONENT_DRIVER
-	}, {
-		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
-		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(dp_driver, CONFIG_DRM_EXYNOS_DP),
 		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(dsi_driver, CONFIG_DRM_EXYNOS_DSI),
 		DRM_COMPONENT_DRIVER
+	}, {
+		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
+		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(hdmi_driver, CONFIG_DRM_EXYNOS_HDMI),
 		DRM_COMPONENT_DRIVER
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9e06f8e2a863..09ce28ee08d9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -26,6 +26,7 @@
 #include <drm/drm_print.h>
 
 #include "exynos_drm_drv.h"
+#include "exynos_drm_crtc.h"
 
 /* Sysreg registers for MIC */
 #define DSD_CFG_MUX	0x1004
@@ -100,9 +101,7 @@ struct exynos_mic {
 
 	bool i80_mode;
 	struct videomode vm;
-	struct drm_encoder *encoder;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	bool enabled;
 };
@@ -229,8 +228,6 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
 	writel(reg, mic->reg + MIC_OP);
 }
 
-static void mic_disable(struct drm_bridge *bridge) { }
-
 static void mic_post_disable(struct drm_bridge *bridge)
 {
 	struct exynos_mic *mic = bridge->driver_private;
@@ -297,34 +294,30 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 	mutex_unlock(&mic_mutex);
 }
 
-static void mic_enable(struct drm_bridge *bridge) { }
-
-static int mic_attach(struct drm_bridge *bridge,
-		      enum drm_bridge_attach_flags flags)
-{
-	struct exynos_mic *mic = bridge->driver_private;
-
-	return drm_bridge_attach(bridge->encoder, mic->next_bridge,
-				 &mic->bridge, flags);
-}
-
 static const struct drm_bridge_funcs mic_bridge_funcs = {
-	.disable = mic_disable,
 	.post_disable = mic_post_disable,
 	.mode_set = mic_mode_set,
 	.pre_enable = mic_pre_enable,
-	.enable = mic_enable,
-	.attach = mic_attach,
 };
 
 static int exynos_mic_bind(struct device *dev, struct device *master,
 			   void *data)
 {
 	struct exynos_mic *mic = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_crtc *crtc = exynos_drm_crtc_get_by_type(drm_dev,
+						       EXYNOS_DISPLAY_TYPE_LCD);
+	struct drm_encoder *e, *encoder = NULL;
+
+	drm_for_each_encoder(e, drm_dev)
+		if (e->possible_crtcs == drm_crtc_mask(&crtc->base))
+			encoder = e;
+	if (!encoder)
+		return -ENODEV;
 
 	mic->bridge.driver_private = mic;
 
-	return 0;
+	return drm_bridge_attach(encoder, &mic->bridge, NULL, 0);
 }
 
 static void exynos_mic_unbind(struct device *dev, struct device *master,
@@ -388,7 +381,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos_mic *mic;
-	struct device_node *remote;
 	struct resource res;
 	int ret, i;
 
@@ -432,16 +424,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
 		}
 	}
 
-	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
-	mic->next_bridge = of_drm_find_bridge(remote);
-	if (IS_ERR(mic->next_bridge)) {
-		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
-		ret = PTR_ERR(mic->next_bridge);
-		goto err;
-	}
-
-	of_node_put(remote);
-
 	platform_set_drvdata(pdev, mic);
 
 	mic->bridge.funcs = &mic_bridge_funcs;
-- 
2.17.1

