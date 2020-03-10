Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4D17F536
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B438D6E19C;
	Tue, 10 Mar 2020 10:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE996E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:40:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200310104050euoutp016874a2eb5df8ab0224dcf1a7cb163d2e~66zlULcrV0227502275euoutp01B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:40:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200310104050euoutp016874a2eb5df8ab0224dcf1a7cb163d2e~66zlULcrV0227502275euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583836850;
 bh=h8EnI0Ps4EDMkuvENIFMaL3EShKfIVUI0eaE4/33qXI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pucMQZ8Pfa7wA6SvwhyZudC8B0okCNWavKHTOBqP3OIEeiZL88EZQBbHZONkhWgzf
 R0Lmn3NdnhHlX0diuVfhdmipgpxHXz0b+JuW31vhQVZQLkYzBBgfafD0Cx3wZgmHCy
 UBv62R6XORDc2oCeW7j0BkGHB2CPz+1uyYmeCN8A=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200310104050eucas1p20033f6258a81cf2aac6c05c31d0a10ab~66zlB2CEV2000120001eucas1p2F;
 Tue, 10 Mar 2020 10:40:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 10.17.60698.2BE676E5; Tue, 10
 Mar 2020 10:40:50 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f~66zkoziwL2792127921eucas1p1R;
 Tue, 10 Mar 2020 10:40:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200310104049eusmtrp14f270dc7b53cb7812bfe6a7404a599ad~66zkn4hMv2107721077eusmtrp1K;
 Tue, 10 Mar 2020 10:40:49 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-64-5e676eb2d13b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 66.23.07950.1BE676E5; Tue, 10
 Mar 2020 10:40:49 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200310104048eusmtip2958d88966a263faa9e295bb5988f59b2~66zjy0LT90209802098eusmtip2T;
 Tue, 10 Mar 2020 10:40:48 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v2] drm/bridge: analogix_dp: Split bind() into probe() and
 real bind()
Date: Tue, 10 Mar 2020 11:34:27 +0100
Message-Id: <20200310103427.26048-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+XbOdo7W7DQFP8yUBgVaambEJ2WUCR6lqP7ILuZl5mlK25Qd
 ZxpdRpHYNDMlsyNdSDO1Nq+YpZhKNS80w1s2NC0E8453KtOcR+u/3/O9PO/z8PKRmKRc6EBG
 q+IYtUqmkIqs8coPP01uZSp56M7PJgyZDSYhutP6BaDS7GIh6pidEKGl7yNC9DDjCsroS8dR
 5/wQhgpmHhCoabQTR7fu5hFoqn8JQ9mttQKkf9dLoIa0YJSdOSQ6QNET3TcJ+jXXS9A5yQ+E
 dGN6m4DuSzEK6PK8a/Qf7i1Op1UUAbrudiZOv+p6hNHTZU7H1p2x3hfJKKLjGbXH/nDrqNym
 vbEzQQmPDKQW5AbogBUJqd3wRds8pgPWpIQqALA567GAFzMAcuVmnBfTAOa9NwvWLCVcsogf
 PAcwpbSYsAxWLD86TlpYRHlC3ZhOZGE7SgGnkkeBhTGqEIdPun0tbEudggPNKbiFcWorHB/u
 WNkjpnxgWopWxIc5wxcldRjPtQTM/HiWZz9Y3cIBnm3hsLGC4NkRtmSmrrSG1A0Av5n0BC9S
 AWy/nr3q2At7TL+WE8jlRi6w+I2HBSF1EI6PXOXRBnaPbeQr28CMyvsY/yyGyUkSfsc2yBkN
 /1LrP7WttqRh4bNGjL9ICBwZWBCkAyfuf9QTAIqAPaNhlXKG9VIxF91ZmZLVqOTu52KUZWD5
 K7UsGmerQO1CRAOgSCBdL45yOx8qEcri2URlA4AkJrUThznLQyXiSFniJUYdE6bWKBi2AWwi
 cam92OvpUIiEksvimAsME8uo16YC0spBC2qqrUSjJ/StE3NBEZ1Vk94DRxeNfr6Hf6fmmGp6
 90wHvQznIrO8u3d56Vz6lbIerWYp797Y3Ag1b48mfS63Z5A+x7tGT+cPB4u/BmzIjx/M4QaJ
 Q4uBOwxD+kJzWJJ/4BHHoM1gO2lu3MJqyxVzrlNbc+un/dISNiWdcQU6fynORsk8XTE1K/sL
 +spw/EYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42I5/e/4Pd2NeelxBo8/q1ncWneO1aL//E1G
 i40z1rNaXPn6ns3i/6PXrBZzJ9VaTLo/gcXi6veXzBYrvsxktzj55iqLRefEJewWnx78Z7aY
 cX4fk8XaI3fZLQ71RVvMmPySzUHA4/2NVnaPnbPusnvM7pjJ6nFiwiUmj/vdx5k8Ni+p9/g7
 az+LR9+WVYweB3ons3hsvzaP2ePzJrkA7ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1D
 Y/NYKyNTJX07m5TUnMyy1CJ9uwS9jMUnrQu+hFXMW8fRwLjYs4uRk0NCwERiw6wOti5GLg4h
 gaWMElcubmaHSMhInJzWwAphC0v8udYFVfSJUWJaZycTSIJNwFCi6y1IgpNDRCBP4uFhkDgX
 B7PAZhaJ31vaWEASwgJhEj8uzAErYhFQlXj36grYBl4BW4m+7gY2iA3yEqs3HGCewMizgJFh
 FaNIamlxbnpusZFecWJucWleul5yfu4mRmBMbDv2c8sOxq53wYcYBTgYlXh4BbTT4oRYE8uK
 K3MPMUpwMCuJ8MbLp8cJ8aYkVlalFuXHF5XmpBYfYjQFWj6RWUo0OR8Yr3kl8YamhuYWlobm
 xubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhiPLnPIqVby+XGeZdbjntTtV5j2GRS1
 CVfaTPr2qW7h1uC2tRe4XubWXJYqyWZIKFvP9q7s9h/377wfdF2zyrrNIo3X/o5X7f67R0e5
 YNtf/yNznpg5cRl/Tyzikvnfkrhyd87Ptapp/js2bzRwaoux9j9i/fjWj4p1GueuthtXVW1K
 jzYom6fEUpyRaKjFXFScCADudgJonwIAAA==
X-CMS-MailID: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
X-Msg-Generator: CA
X-RootMTR: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
References: <CGME20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f@eucas1p1.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Analogix_dp driver acquires all its resources in the ->bind() callback,
what is a bit against the component driver based approach, where the
driver initialization is split into a probe(), where all resources are
gathered, and a bind(), where all objects are created and a compound
driver is initialized.

Extract all the resource related operations to analogix_dp_probe() and
analogix_dp_remove(), then call them before/after registration of the
device components from the main Exynos DP and Rockchip DP drivers. Also
move the plat_data initialization to the probe() to make it available for
the analogix_dp_probe() function.

This fixes the multiple calls to the bind() of the DRM compound driver
when the DP PHY driver is not yet loaded/probed:

[drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops [exynosdrm])
exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops [exynosdrm])
exynos-dp 145b0000.dp-controller: no DP phy configured
exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops exynos_dp_ops [exynosdrm]): -517
exynos-drm exynos-drm: master bind failed: -517
...
[drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 14400000.fimd (ops hdmi_enable [exynosdrm])
exynos-drm exynos-drm: bound 14450000.mixer (ops hdmi_enable [exynosdrm])
exynos-drm exynos-drm: bound 145b0000.dp-controller (ops hdmi_enable [exynosdrm])
exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_enable [exynosdrm])
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
Console: switching to colour frame buffer device 170x48
exynos-drm exynos-drm: fb0: exynosdrmfb frame buffer device
[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
...

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- moved plat_data initialization to exynos_dp_probe/rockchip_dp_probe as
  pointed by Andy Yan
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 33 +++++++++++------
 drivers/gpu/drm/exynos/exynos_dp.c            | 29 ++++++++-------
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 36 ++++++++++---------
 include/drm/bridge/analogix_dp.h              |  5 +--
 4 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9ded2cef57dd..76736fb8ed94 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1652,8 +1652,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 }
 
 struct analogix_dp_device *
-analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
-		 struct analogix_dp_plat_data *plat_data)
+analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct analogix_dp_device *dp;
@@ -1756,22 +1755,30 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 					irq_flags, "analogix-dp", dp);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq\n");
-		goto err_disable_pm_runtime;
+		return ERR_PTR(ret);
 	}
 	disable_irq(dp->irq);
 
+	return dp;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_probe);
+
+int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
+{
+	int ret;
+
 	dp->drm_dev = drm_dev;
 	dp->encoder = dp->plat_data->encoder;
 
 	dp->aux.name = "DP-AUX";
 	dp->aux.transfer = analogix_dpaux_transfer;
-	dp->aux.dev = &pdev->dev;
+	dp->aux.dev = dp->dev;
 
 	ret = drm_dp_aux_register(&dp->aux);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
-	pm_runtime_enable(dev);
+	pm_runtime_enable(dp->dev);
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
 	if (ret) {
@@ -1779,13 +1786,12 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 		goto err_disable_pm_runtime;
 	}
 
-	return dp;
+	return 0;
 
 err_disable_pm_runtime:
+	pm_runtime_disable(dp->dev);
 
-	pm_runtime_disable(dev);
-
-	return ERR_PTR(ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
@@ -1802,10 +1808,15 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 
 	drm_dp_aux_unregister(&dp->aux);
 	pm_runtime_disable(dp->dev);
-	clk_disable_unprepare(dp->clock);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
+void analogix_dp_remove(struct analogix_dp_device *dp)
+{
+	clk_disable_unprepare(dp->clock);
+}
+EXPORT_SYMBOL_GPL(analogix_dp_remove);
+
 #ifdef CONFIG_PM
 int analogix_dp_suspend(struct analogix_dp_device *dp)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index d23d3502ca91..5ee090691390 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -159,15 +159,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	dp->dev = dev;
 	dp->drm_dev = drm_dev;
 
-	dp->plat_data.dev_type = EXYNOS_DP;
-	dp->plat_data.power_on_start = exynos_dp_poweron;
-	dp->plat_data.power_off = exynos_dp_poweroff;
-	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.get_modes = exynos_dp_get_modes;
-
 	if (!dp->plat_data.panel && !dp->ptn_bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
@@ -185,13 +178,11 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->plat_data.encoder = encoder;
 
-	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
-	if (IS_ERR(dp->adp)) {
+	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
+	if (ret)
 		dp->encoder.funcs->destroy(&dp->encoder);
-		return PTR_ERR(dp->adp);
-	}
 
-	return 0;
+	return ret;
 }
 
 static void exynos_dp_unbind(struct device *dev, struct device *master,
@@ -222,6 +213,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	dp->dev = dev;
 	/*
 	 * We just use the drvdata until driver run into component
 	 * add function, and then we would set drvdata to null, so
@@ -247,16 +239,29 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.panel = panel;
+	dp->plat_data.dev_type = EXYNOS_DP;
+	dp->plat_data.power_on_start = exynos_dp_poweron;
+	dp->plat_data.power_off = exynos_dp_poweroff;
+	dp->plat_data.attach = exynos_dp_bridge_attach;
+	dp->plat_data.get_modes = exynos_dp_get_modes;
 	dp->plat_data.skip_connector = !!bridge;
+
 	dp->ptn_bridge = bridge;
 
 out:
+	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
+	if (IS_ERR(dp->adp))
+		return PTR_ERR(dp->adp);
+
 	return component_add(&pdev->dev, &exynos_dp_ops);
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
+	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &exynos_dp_ops);
+	analogix_dp_remove(dp->adp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index f38f5e113c6b..ce98c08aa8b4 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -325,15 +325,9 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
-	const struct rockchip_dp_chip_data *dp_data;
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	dp_data = of_device_get_match_data(dev);
-	if (!dp_data)
-		return -ENODEV;
-
-	dp->data = dp_data;
 	dp->drm_dev = drm_dev;
 
 	ret = rockchip_dp_drm_create_encoder(dp);
@@ -344,16 +338,9 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 
 	dp->plat_data.encoder = &dp->encoder;
 
-	dp->plat_data.dev_type = dp->data->chip_type;
-	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
-	dp->plat_data.power_off = rockchip_dp_powerdown;
-	dp->plat_data.get_modes = rockchip_dp_get_modes;
-
-	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
-	if (IS_ERR(dp->adp)) {
-		ret = PTR_ERR(dp->adp);
+	ret = analogix_dp_bind(dp->adp, drm_dev);
+	if (ret)
 		goto err_cleanup_encoder;
-	}
 
 	return 0;
 err_cleanup_encoder:
@@ -368,8 +355,6 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
 
 	analogix_dp_unbind(dp->adp);
 	dp->encoder.funcs->destroy(&dp->encoder);
-
-	dp->adp = ERR_PTR(-ENODEV);
 }
 
 static const struct component_ops rockchip_dp_component_ops = {
@@ -380,10 +365,15 @@ static const struct component_ops rockchip_dp_component_ops = {
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct rockchip_dp_chip_data *dp_data;
 	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
 	int ret;
 
+	dp_data = of_device_get_match_data(dev);
+	if (!dp_data)
+		return -ENODEV;
+
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
 	if (ret < 0)
 		return ret;
@@ -394,7 +384,12 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
+	dp->data = dp_data;
 	dp->plat_data.panel = panel;
+	dp->plat_data.dev_type = dp->data->chip_type;
+	dp->plat_data.power_on_start = rockchip_dp_poweron_start;
+	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.get_modes = rockchip_dp_get_modes;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
@@ -402,12 +397,19 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dp);
 
+	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
+	if (IS_ERR(dp->adp))
+		return PTR_ERR(dp->adp);
+
 	return component_add(dev, &rockchip_dp_component_ops);
 }
 
 static int rockchip_dp_remove(struct platform_device *pdev)
 {
+	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
+	analogix_dp_remove(dp->adp);
 
 	return 0;
 }
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 7aa2f93da49c..b0dcc07334a1 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -42,9 +42,10 @@ int analogix_dp_resume(struct analogix_dp_device *dp);
 int analogix_dp_suspend(struct analogix_dp_device *dp);
 
 struct analogix_dp_device *
-analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
-		 struct analogix_dp_plat_data *plat_data);
+analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
+int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
 void analogix_dp_unbind(struct analogix_dp_device *dp);
+void analogix_dp_remove(struct analogix_dp_device *dp);
 
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
