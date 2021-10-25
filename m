Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B836A439A2C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93C6E152;
	Mon, 25 Oct 2021 15:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860A46E153;
 Mon, 25 Oct 2021 15:16:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8D125806CE;
 Mon, 25 Oct 2021 11:16:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 11:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aukaaii7eMmjt
 ussZ47JHi84aYPnG7d4VwRuG6/sJ+I=; b=Nvaz3Lym3JP5xqXJdtmKMzTFa2GUZ
 /bgrOLmRgVdoYx7XY4gvr25Q4g+E0VU5H+WeUDHE0fA/Vf+OiU/HuKE/TwucZMkA
 nI7/xV/Sjx6wGMgRmwLqKzmfptgc3tHZLo0/8oPebQzcaAfsLaS+jOYq2DwW+tpo
 6bePxPXtwETq8eHZxe9ByWuc3NpBwsp2aWKG0E5kovCFNLkk0FcMPaD5KYJki6r7
 Ds7Lw19Ua1Lj5sIBZZCleGHG5aFdNMkJnd8C3om9rpxtgcdmvSeYkuwOe11TayfN
 5l1rhd429N6zoYvY3HWkCEA+OZcdDkZa9XyTl7IfYQ8k4qzIra7x1VwVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aukaaii7eMmjtussZ47JHi84aYPnG7d4VwRuG6/sJ+I=; b=J+BDRvEN
 glstRbB6dsu2l05oao3NlFvceOLEKaMMYMUxEn6LgRu+as7Hm6J5BmuBobgHjTTw
 qqbMFH6C/KCX2O8H9TA4babAW4BODWd8cto0kQRqEooVr5AE1rd+CXoQ+sOpmXuy
 WbZdERxcqeDyick9ZRZTJ96I1ybZcPkDu40EaC8D2/5dHjPNcCiT765XuwgakAd5
 nvadI6y24CjL2G2KTVXm5p7Pmz9xmW2rFXfuh07CsOFNT2QjLT2KwVvFfGu+thby
 Ym0rgrgVjv5WJEXoRqm72W5cn9A76jCfI+22BVezI0pZtrBeLETXjx+RuYIF1VZV
 iacqLdZ3EJa3OA==
X-ME-Sender: <xms:Usp2YUwbtoQLkfJTfOJWPW7w_my-5sHVKNoKUPknMOwN9jElPdPlUQ>
 <xme:Usp2YYQDFnhQg2_zH44aWUra4O3RrC7PXlag6XFyyrfzYhK5UnO5OOE6Fmg9pJCbn
 uPDK9GiGlbuB82ZkXs>
X-ME-Received: <xmr:Usp2YWVvmJUTwRo5MT56UdfYT5ctlqPZ06w9EMr6f34iBtHKfP2wNDNqtBgSYIDmpAoGSN9j8xRm5yXhHpaBTRvl1MMd3O3Mvx2n6Cmk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Usp2YSiY-zEcwPQlJoEm2_xkw2oX8JXyWgAKfr-9YOPzaqTEHPG76g>
 <xmx:Usp2YWB994MiGXkD4ASrkaw3VfxuJ4KOXGL28O59As46Vy7wlIwgxQ>
 <xmx:Usp2YTI-a-AItQffizctQHkwFhh04ACTRw3h1ppnJ2bck5guSc3J3w>
 <xmx:Usp2YTMsyqNZPF-xyTpAXi1aK7PfIgGVamyoEq_F5LEcJNAjFzh0jA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v6 21/21] drm/msm/dsi: Adjust probe order
Date: Mon, 25 Oct 2021 17:15:36 +0200
Message-Id: <20211025151536.1048186-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-1-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
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

