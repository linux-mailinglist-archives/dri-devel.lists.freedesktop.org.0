Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C3BF46C0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731910E565;
	Tue, 21 Oct 2025 02:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="iCYdBRp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com
 [101.71.155.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05FA10E565
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:58:42 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2697bbc0d;
 Tue, 21 Oct 2025 10:58:38 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 15/18] drm/exynos: exynos_dp: Apply
 analogix_dp_finish_probe()
Date: Tue, 21 Oct 2025 10:57:01 +0800
Message-Id: <20251021025701.1524229-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025701.1524229-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025701.1524229-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b4536403a3kunmcdd3bf8c5a493d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNNTlZLHkNLSh8YHx5MT0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=iCYdBRp/EXen27y3zxGnL+vrPX6yCzjBw8luXMElwkWn45v/YD7IFtieS3WApntkDxzBNIC/JJIul2RmLne2MImDOz2E1RIeCrR2pbxPiiDdgmTSNwBe95Ip258vlxL0R32KYjHNk4G3VFf72VnZEM5migqT/IRp/gmMe/hFuxs=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=36qAwsDTVy9wgoqXZPEVS1e3Z0LGmmuS3+IMx7hmpEo=;
 h=date:mime-version:subject:message-id:from;
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

Apply analogix_dp_finish_probe() in order to move the panel/bridge
parsing from Exynos side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes in v4:
- Rename analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v7:
- Remove exynos_dp_legacy_bridge_init() and inline API
  devm_drm_of_display_mode_bridge().
- If the panel or the next_bridge is parsed from DT, use ptr validity
  to check whether to call component_add() directly at the end of
  probing.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 478eaa6f3175..6126820aad3b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -157,9 +157,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct exynos_dp_device *dp;
-	struct drm_panel *panel;
-	struct drm_bridge *bridge;
-	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 			  GFP_KERNEL);
@@ -186,30 +183,30 @@ static int exynos_dp_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
-	if (ret == -ENODEV) {
+	if (of_get_display_timings(dev->of_node)) {
 		dp->plat_data.next_bridge = devm_drm_of_display_mode_bridge(dp->dev,
 									dp->dev->of_node,
 									DRM_MODE_CONNECTOR_eDP);
-		ret = IS_ERR(dp->plat_data.next_bridge) ? PTR_ERR(dp->plat_data.next_bridge) : 0;
+		if (IS_ERR(dp->plat_data.next_bridge))
+			return PTR_ERR(dp->plat_data.next_bridge);
 	}
-	if (ret)
-		return ret;
 
 	/* The remote port can be either a panel or a bridge */
-	dp->plat_data.panel = panel;
-	dp->plat_data.next_bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
+	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	if (dp->plat_data.panel || dp->plat_data.next_bridge)
+		return component_add(&pdev->dev, &exynos_dp_ops);
+	else
+		return analogix_dp_finish_probe(dp->adp);
 }
 
 static void exynos_dp_remove(struct platform_device *pdev)
-- 
2.34.1

