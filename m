Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDE12B421
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 12:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBFB6E438;
	Fri, 27 Dec 2019 11:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735146E433
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 11:02:19 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191227110217euoutp024c11772c1d9c30665f449cd39dd2e076~kNXMUhvVM0344603446euoutp024
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 11:02:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191227110217euoutp024c11772c1d9c30665f449cd39dd2e076~kNXMUhvVM0344603446euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577444537;
 bh=7IW5udX+iI/ujHDqlQbniwM2i8DuaCoh2oKCz0vZc9k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=h43HceZ8a0ekUwJA+9LDMrPqT8NlDG8hiJuOb+8HYTJKegZu6ECEN/vZoyo7Qtr4Z
 vyKRYpl3X2N276x2h9sSu7Hr783Qw2RcpoUyw3pUEiH3HbOJMKtTgGPVuwDVByfDfF
 O2RfpJ4TFC2c2t2ZzSoHfKZH9KWd2SdAbTzJiBwU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191227110217eucas1p19cfaba571a02e6c727e24ba92a23a1b2~kNXMAgTp11154011540eucas1p1V;
 Fri, 27 Dec 2019 11:02:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B9.C9.60698.9B4E50E5; Fri, 27
 Dec 2019 11:02:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d~kNXLfY-sA1605716057eucas1p1F;
 Fri, 27 Dec 2019 11:02:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191227110216eusmtrp244914cb7ffdf08dd563e85d7c09fa281~kNXLermgo1574115741eusmtrp2_;
 Fri, 27 Dec 2019 11:02:16 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-d4-5e05e4b91c39
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id ED.F0.07950.8B4E50E5; Fri, 27
 Dec 2019 11:02:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191227110216eusmtip2251225f2b120d14565874ed25c5b00ff~kNXKuphzW1996819968eusmtip2b;
 Fri, 27 Dec 2019 11:02:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix Exynos DSI after making bridge chain a
 double-linked list
Date: Fri, 27 Dec 2019 12:01:35 +0100
Message-Id: <20191227110135.4961-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+c7d4eQ0JT+8wqKgSG1ocSQLBaFjSPRnlJdmO3lJp2xOsyBE
 UXQzr5VzilksFc3bUNNlYstcaGmpgYlLEo00L6VJTiTbdrT++73P+zzv+/LxUahIj3tQifJ0
 TiGXJosJAdY9ZB3z653HY05Y572Z6dZRnOnQtuHMyNthhJncXCOY8tlSjBkbayeZwjI9yUwY
 awhGO9aPMC2DFpIxFV9hGq1dgNFWLBKM1ViLhbqwa1N5JNtj0QO2V2ch2eqCKpw1NBUS7KzG
 jLD6Bx8JtrizCbAbBp+LTpcFITIuOTGDUwScvSpIqOn6jKdpvG4aJ7eQbJAL1cCJgnQQXH7a
 iKiBgBLRjQAWr75G+eIXgJahdZwvNgDsn5nE9iMTw4V7rgYAFwcXHA1HZHecsTNBS6B6RU2o
 AUm50dfhE4cdpRdQm6PDYXelo6Bh6wdpZ4w+DAeqN3A7C+kQOPWzD/C7fGFz+4AjDOl6Eu7c
 f0fwjXCoXf6K8OwKl8ydJM9ecLf3IcIHcgH8MtpC8kURgBM52r2xp+HM6LZtEmW76ShsMwbw
 chhsLG7B7TKkXeDUygG7jNqwvLsS5WUhLMgX8e4jUGdu/bf25ftxlGcWfuuxkPyTRMP1olW8
 FPjo/u+qA6AJuHMqZUo8pwyUc5n+SmmKUiWP97+WmmIAtr8z8se82QP6d+JMgKaA2FlYYMRi
 RLg0Q5mVYgKQQsVuQnk8HiMSyqRZtzhFaqxClcwpTcCTwsTuwsDHi9EiOl6azt3guDROsd9F
 KCePbFCrCw5SkV6Ft/MiG55XqM6dfFQ1J6nvHJpLlEVp/Ft9AoW5vs53vKPqwmWTkrD2LHl1
 yd2M7nvmF1PjWFxOMDu+7ckKG57BEu+kC9/1xKdD0f1IxPm2HEzSA2dP5V9Kit04GPo7z7DU
 lxmh0JR16yKvHI9rfjX9we+MvPZNZbkYUyZIJcdQhVL6F5hfPZs3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xe7o7nrDGGVz6Z2xxa905VouNM9az
 Wpw+c4rJ4srX92wWk+5PYLE4f34Du0XnxCXsFpd3zWGzmHF+H5PF2iN32S0O9UVbrPi5ldFi
 xuSXbBY/d81jceDzeH+jld1jx90ljB47Z91l95jdMZPVY9OqTjaP+93HmTyWTLvK5tG3ZRWj
 x+dNcgGcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2
 CXoZc7beYy3olqnYdeUHUwNjs0QXIyeHhICJxOVTncxdjFwcQgJLGSUeX9vPDJGQkTg5rYEV
 whaW+HOtiw2i6BOjxO2We4wgCTYBQ4mutyAJTg4RgQyJ9olTwSYxC7xmlmi6cwUsISwQJXHk
 73Z2EJtFQFXiwOzPYFN5BWwkbnzcwwixQV5i9YYDzBMYeRYwMqxiFEktLc5Nzy020itOzC0u
 zUvXS87P3cQIDPltx35u2cHY9S74EKMAB6MSD6/BDpY4IdbEsuLK3EOMEhzMSiK8eemscUK8
 KYmVValF+fFFpTmpxYcYTYGWT2SWEk3OB8ZjXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTE
 ktTs1NSC1CKYPiYOTqkGRol7hw/1rVv5cYXY0gChF7eT+yc5Pcj2mxWWfoshzbFOPWJysKnH
 H813h6OfctQd6wkxsrF02rFF/mhB9T1Gw5Z5Stal76rcrs9+ysneETclsGKRyb5lxzi3XN5T
 y1B39tQkAwHG2h+xetu05i2p//at9uXcbsV3BtV9q1KqL0wU5ItXW5t9W4mlOCPRUIu5qDgR
 ANFAaRaPAgAA
X-CMS-MailID: 20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d
X-Msg-Generator: CA
X-RootMTR: 20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d
References: <CGME20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d@eucas1p1.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exynos DSI DRM driver uses private calls to out bridge to force certain
order of operations during init/exit sequences. This no longer works after
conversion of bridge chain to a double-linked list. To fix the regression
call bridge related operations manually instead of the generic
drm_bridge_chain_*() operations.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
---
This patch is a result of the following discussion:
https://www.spinics.net/lists/dri-devel/msg239256.html
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3955f84dc893..f5905c239a86 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -255,7 +255,6 @@ struct exynos_dsi {
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct drm_panel *panel;
-	struct list_head bridge_chain;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 
@@ -1391,7 +1390,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		if (ret < 0)
 			goto err_put_sync;
 	} else {
-		drm_bridge_chain_pre_enable(dsi->out_bridge);
+		if (dsi->out_bridge->funcs->pre_enable)
+			dsi->out_bridge->funcs->pre_enable(dsi->out_bridge);
 	}
 
 	exynos_dsi_set_display_mode(dsi);
@@ -1402,7 +1402,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		if (ret < 0)
 			goto err_display_disable;
 	} else {
-		drm_bridge_chain_enable(dsi->out_bridge);
+		if (dsi->out_bridge->funcs->enable)
+			dsi->out_bridge->funcs->enable(dsi->out_bridge);
 	}
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
@@ -1427,10 +1428,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
 	drm_panel_disable(dsi->panel);
-	drm_bridge_chain_disable(dsi->out_bridge);
+	if (dsi->out_bridge->funcs->disable)
+		dsi->out_bridge->funcs->disable(dsi->out_bridge);
 	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_unprepare(dsi->panel);
-	drm_bridge_chain_post_disable(dsi->out_bridge);
+	if (dsi->out_bridge->funcs->post_disable)
+		dsi->out_bridge->funcs->post_disable(dsi->out_bridge);
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
@@ -1521,9 +1524,11 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL);
+		out_bridge->dev = drm;
+		out_bridge->encoder = encoder;
+		if (out_bridge->funcs->attach)
+			out_bridge->funcs->attach(out_bridge);
 		dsi->out_bridge = out_bridge;
-		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
 		int ret = exynos_dsi_create_connector(encoder);
 
@@ -1589,7 +1594,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 		if (dsi->out_bridge->funcs->detach)
 			dsi->out_bridge->funcs->detach(dsi->out_bridge);
 		dsi->out_bridge = NULL;
-		INIT_LIST_HEAD(&dsi->bridge_chain);
 	}
 
 	if (drm->mode_config.poll_enabled)
@@ -1737,7 +1741,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
