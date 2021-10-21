Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E90435C1B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D306EC16;
	Thu, 21 Oct 2021 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D266EC16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A34EE2B00475;
 Thu, 21 Oct 2021 03:41:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 03:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aukaaii7eMmjt
 ussZ47JHi84aYPnG7d4VwRuG6/sJ+I=; b=ZT7+Y8Q4tBaex/F9ouLOSHAfXIw+A
 EWV+MDbmOEcFzq3qH1H78fPn3qIjkpUoXK1wluxGE5H2Hram5miwS3l0muc11tTw
 /HjyBIvJ1DkB8tZWB13m59AGN6Rw2B52HlD+eaiQ1FWhzyHEMiHkTEqB50Wr/8t7
 2dc2feMguqoyEuCzOS9cZYb3v/7sHIH264sYsOnC+1TH5gjmqa+rhhPgr6vJcC07
 3pVaxWJ1q4KTxFQ3vmDrmir+Lp5DgtjthkpBhnfvu2C0yjHUNcJ1RlVX5TPudhJp
 n5NTFunhgkbuJZRR1pZKYS99mTVDWpln0Vu9iGy+rBVdMzvAQqMxTh84w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aukaaii7eMmjtussZ47JHi84aYPnG7d4VwRuG6/sJ+I=; b=hc7/UA67
 xEO/PK6JKnVEJG4yrESn1ZLsFWZog2NxRAdQnbSRUmLCiWLB20rDDbMiAvG77bYf
 GH5oJrhqdyfoq7gLXqIbt5S6wNXsTW6dDbO3+1Md0UN/3bojVwpEcZr724VnVEe8
 70NG3Sbl7RCXGBVnyBkpIVjCFnXu6n6QzRs/43ePa7qbTFLyvePJzgGh+Oeb02br
 D6tDK4g1DK5NFYZNAASOe/iDlgxDwXiPDe+tltJHuC8PxIAnzHShkIa5wltZdxcs
 Jdt3czsepdX1UOfTDxHn1UH8ph+nllR6Qv1tNDqIWDB9kBtW3h7P3ixu9Ge4ykql
 uBkkhBaPz1ZDQA==
X-ME-Sender: <xms:qRlxYRlgmPGITQWHEMZBgMMN1L01w8yz9aZqg2LLfUeOKb7BKFuhbg>
 <xme:qRlxYc18OVHGFbZ47JoQks4FTns463uZcm_2bTnnsk3LzJXjPp3L84kbIeE--ezCk
 9goN6xEWnXCV3ZuK1w>
X-ME-Received: <xmr:qRlxYXqp9gUH1PB6oLnnBqJ4xGOCCYMVyXSKGB2r7_7jWcH_uMRE_MSUY5xJSqSX2PdON3Lpchgkt5qrB049qOPDNXaU-c8j7jNj8Ohw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qRlxYRkxpXNVmWaQVHIZGNfz-sFcxq8aTpV6XDpY98fdOmO2SaGhCA>
 <xmx:qRlxYf0hwtT7EdiO-B_vndxeFQUkNSDriMyxI2pGFwNl6HHVr5GANg>
 <xmx:qRlxYQtjVD2DhmFPE9u7Pl9RVD1qNcKdNE-ShH1wOeZpOvPnlbQBKQ>
 <xmx:qRlxYSCYrxG2nP-paamASIEh4YWjs2tUXKEeKuU84sZBPTLib3w7DM9TCtI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Amit Pundir <amit.pundir@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v5 21/21] drm/msm/dsi: Adjust probe order
Date: Thu, 21 Oct 2021 09:39:47 +0200
Message-Id: <20211021073947.499373-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
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

From: Rob Clark <robdclark@chromium.org>

Switch to the documented order dsi-host vs bridge probe.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 50 ++++++++++++++++-----------
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 22 ++++--------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  6 ++--
 drivers/gpu/drm/msm/msm_drv.h         |  2 ++
 5 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 614dc7f26f2c..ad73ebb84b2d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -112,18 +112,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi;
-
-	DBG("");
-	msm_dsi = dsi_init(pdev);
-	if (IS_ERR(msm_dsi)) {
-		/* Don't fail the bind if the dsi port is not connected */
-		if (PTR_ERR(msm_dsi) == -ENODEV)
-			return 0;
-		else
-			return PTR_ERR(msm_dsi);
-	}
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
 	priv->dsi[msm_dsi->id] = msm_dsi;
 
@@ -136,12 +125,8 @@ static void dsi_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
-	int id = msm_dsi->id;
 
-	if (priv->dsi[id]) {
-		dsi_destroy(msm_dsi);
-		priv->dsi[id] = NULL;
-	}
+	priv->dsi[msm_dsi->id] = NULL;
 }
 
 static const struct component_ops dsi_ops = {
@@ -149,15 +134,40 @@ static const struct component_ops dsi_ops = {
 	.unbind = dsi_unbind,
 };
 
-static int dsi_dev_probe(struct platform_device *pdev)
+int dsi_dev_attach(struct platform_device *pdev)
 {
 	return component_add(&pdev->dev, &dsi_ops);
 }
 
-static int dsi_dev_remove(struct platform_device *pdev)
+void dsi_dev_detach(struct platform_device *pdev)
 {
-	DBG("");
 	component_del(&pdev->dev, &dsi_ops);
+}
+
+static int dsi_dev_probe(struct platform_device *pdev)
+{
+	struct msm_dsi *msm_dsi;
+
+	DBG("");
+	msm_dsi = dsi_init(pdev);
+	if (IS_ERR(msm_dsi)) {
+		/* Don't fail the bind if the dsi port is not connected */
+		if (PTR_ERR(msm_dsi) == -ENODEV)
+			return 0;
+		else
+			return PTR_ERR(msm_dsi);
+	}
+
+	return 0;
+}
+
+static int dsi_dev_remove(struct platform_device *pdev)
+{
+	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+
+	DBG("");
+	dsi_destroy(msm_dsi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b50db91cb8a7..83787cbee419 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -116,7 +116,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
-int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
+int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 			struct msm_dsi_phy *src_phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..f741494b1bf6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1624,6 +1624,10 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (ret)
 		return ret;
 
+	ret = dsi_dev_attach(msm_host->pdev);
+	if (ret)
+		return ret;
+
 	DBG("id=%d", msm_host->id);
 	if (msm_host->dev)
 		queue_work(msm_host->workqueue, &msm_host->hpd_work);
@@ -1636,6 +1640,8 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
+	dsi_dev_detach(msm_host->pdev);
+
 	msm_host->device_node = NULL;
 
 	DBG("id=%d", msm_host->id);
@@ -1970,7 +1976,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	return 0;
 }
 
-int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
+int msm_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	int ret;
@@ -1984,20 +1990,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
 			return ret;
 
 		msm_host->registered = true;
-
-		/* If the panel driver has not been probed after host register,
-		 * we should defer the host's probe.
-		 * It makes sure panel is connected when fbcon detects
-		 * connector status and gets the proper display mode to
-		 * create framebuffer.
-		 * Don't try to defer if there is nothing connected to the dsi
-		 * output
-		 */
-		if (check_defer && msm_host->device_node) {
-			if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
-				if (!of_drm_find_bridge(msm_host->device_node))
-					return -EPROBE_DEFER;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..fc949a84cef6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -72,7 +72,7 @@ static int dsi_mgr_setup_components(int id)
 	int ret;
 
 	if (!IS_BONDED_DSI()) {
-		ret = msm_dsi_host_register(msm_dsi->host, true);
+		ret = msm_dsi_host_register(msm_dsi->host);
 		if (ret)
 			return ret;
 
@@ -92,10 +92,10 @@ static int dsi_mgr_setup_components(int id)
 		 * because only master DSI device adds the panel to global
 		 * panel list. The panel's device is the master DSI device.
 		 */
-		ret = msm_dsi_host_register(slave_link_dsi->host, false);
+		ret = msm_dsi_host_register(slave_link_dsi->host);
 		if (ret)
 			return ret;
-		ret = msm_dsi_host_register(master_link_dsi->host, true);
+		ret = msm_dsi_host_register(master_link_dsi->host);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..31d50e98a723 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -344,6 +344,8 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 
 struct msm_dsi;
 #ifdef CONFIG_DRM_MSM_DSI
+int dsi_dev_attach(struct platform_device *pdev);
+void dsi_dev_detach(struct platform_device *pdev);
 void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
-- 
2.31.1

