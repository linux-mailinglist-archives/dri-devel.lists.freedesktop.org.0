Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43D54AAA8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075B510FA4D;
	Tue, 14 Jun 2022 07:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE4710FAB6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:31:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CF6FA5C00DE;
 Tue, 14 Jun 2022 03:31:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 14 Jun 2022 03:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1655191862; x=1655278262; bh=Dbk8kA3/CUb/CaOmXekOBIJYO
 kqO37bfGP3D3h82pdI=; b=GjScZWiLfZQp+GRfzqrZkrlx8z0eymYKG26evbTcZ
 +xaJFYiHwkMa1WqUbD5Z5TVH3CsaX9i4BFzYvtTx1+Uk2pQ97xEg7PyX8BQJ51qG
 NmlRgX3lpLgV6iVpDbESPHnPYh3ut0lXwQPQtOAeLNk8M+AYL+P8SiCaPBDky7y8
 E0sw+Mu7K6+tEMPnhElJOMiGIlc3S6yElK7p/srJ/G9OqKkvSwarBlXq1hpJSNKp
 n90aQXXG4vSxG3rsuZNMl/+s0tHLkMrnYBlW5/we3fUQGzIvCh8S1MHh+oOzYI4g
 cwj4Du//PB1VKYI0BzrsHvUaUxEHMuDK7TbC+0HcS1NTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655191862; x=1655278262; bh=Dbk8kA3/CUb/CaOmXekOBIJYOkqO37bfGP3
 D3h82pdI=; b=RRx+YASnTQKS74TUfNjQxCEegiO474fxANvHlE2etkWoZOomiML
 J8WOEcjX3OlTw65GLjoTp/hyh/2vDcKPqGXo8TzPT2RAWhxYoT4Rv1jHxBG+bsdA
 VY2ef8nQCzQppCdzGD0eFBoT9V8fIqr3T3nphGTzvWuTBs4VqKxGWAg5PBdnUg5+
 PuoWYIebct4Src3LYLip+66Q9ZPMBUJzH43NM7wKIgkKXkU0XzlVHIDFKlV4pS/d
 CG2Afs7zqkPnGR57OaHXCzW+vBqzP0cxX2jKPLUBG4mxp+bzIIpDQXQwJ0d/JV2K
 rw7H1B1J87jW1YHcUe++T/RCAxhJkZVBNWg==
X-ME-Sender: <xms:NjmoYjK6eDDoUIVQihZuQoHhq4K5AC2hcz7QUD3ho1Sd5Zkw4WAuhA>
 <xme:NjmoYnJPvmSGJfBVwvNhZ4nnYLRDpTkPpTCyff38kKRKOD_GR2Gp8IlPxrF7r8t63
 HbAZ5SfPmC_C650rQ>
X-ME-Received: <xmr:NjmoYruX4PBmhgPBU9HliJ9tOECioYeac_cSZ6PjH7URGzN6rT6cl7wwpKR-XwVtbAaTz3xo685LYKelLt4-lF5cxmMFGwHEcvy-svsbQrJqydsmNXDuPZBh2kV_96eATrKfiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddukedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeeh
 hffhkeekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:NjmoYsYIOqf-XLTYTfxq-IUOf7FECYtefDg3Ng70sZsS2zGK_GWX8g>
 <xmx:NjmoYqZkY16jvUk8Uqfsmx1MFx-cJ4dLbwZF1PdqgBwgu4aReC6rUg>
 <xmx:NjmoYgCbrbqXd0t3PiNvDqFlpQrwp-kgzqjWqlMD_QU_UKfna1yPsQ>
 <xmx:NjmoYmS-87aCNzBeVwL2beT_wtRysCRqSbeTfy3VdR2NEe1GxYQzWQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 03:31:01 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict
Date: Tue, 14 Jun 2022 02:31:00 -0500
Message-Id: <20220614073100.11550-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio
support") added a consumer for this GPIO in the HDMI connector device.
This new consumer conflicts with the pre-existing GPIO consumer in the
sun8i HDMI controller driver, which prevents the driver from probing:

  [    4.983358] display-connector connector: GPIO lookup for consumer ddc-en
  [    4.983364] display-connector connector: using device tree for GPIO lookup
  [    4.983392] gpio-226 (ddc-en): gpiod_request: status -16
  [    4.983399] sun8i-dw-hdmi 6000000.hdmi: Couldn't get ddc-en gpio
  [    4.983618] sun4i-drm display-engine: failed to bind 6000000.hdmi (ops sun8i_dw_hdmi_ops [sun8i_drm_hdmi]): -16
  [    4.984082] sun4i-drm display-engine: Couldn't bind all pipelines components
  [    4.984171] sun4i-drm display-engine: adev bind failed: -16
  [    4.984179] sun8i-dw-hdmi: probe of 6000000.hdmi failed with error -16

Both drivers have the same behavior: they leave the GPIO active for the
life of the device. Let's take advantage of the new implementation, and
drop the now-obsolete code from the HDMI controller driver.

Fixes: 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 54 ++-------------------------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  2 -
 2 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index a8d75fd7e9f4..477cb6985b4d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -93,34 +93,10 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
 	return crtcs;
 }
 
-static int sun8i_dw_hdmi_find_connector_pdev(struct device *dev,
-					     struct platform_device **pdev_out)
-{
-	struct platform_device *pdev;
-	struct device_node *remote;
-
-	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!remote)
-		return -ENODEV;
-
-	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		of_node_put(remote);
-		return -ENODEV;
-	}
-
-	pdev = of_find_device_by_node(remote);
-	of_node_put(remote);
-	if (!pdev)
-		return -ENODEV;
-
-	*pdev_out = pdev;
-	return 0;
-}
-
 static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 			      void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev), *connector_pdev;
+	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_hdmi_plat_data *plat_data;
 	struct drm_device *drm = data;
 	struct device_node *phy_node;
@@ -167,30 +143,16 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, PTR_ERR(hdmi->regulator),
 				     "Couldn't get regulator\n");
 
-	ret = sun8i_dw_hdmi_find_connector_pdev(dev, &connector_pdev);
-	if (!ret) {
-		hdmi->ddc_en = gpiod_get_optional(&connector_pdev->dev,
-						  "ddc-en", GPIOD_OUT_HIGH);
-		platform_device_put(connector_pdev);
-
-		if (IS_ERR(hdmi->ddc_en)) {
-			dev_err(dev, "Couldn't get ddc-en gpio\n");
-			return PTR_ERR(hdmi->ddc_en);
-		}
-	}
-
 	ret = regulator_enable(hdmi->regulator);
 	if (ret) {
 		dev_err(dev, "Failed to enable regulator\n");
-		goto err_unref_ddc_en;
+		return ret;
 	}
 
-	gpiod_set_value(hdmi->ddc_en, 1);
-
 	ret = reset_control_deassert(hdmi->rst_ctrl);
 	if (ret) {
 		dev_err(dev, "Could not deassert ctrl reset control\n");
-		goto err_disable_ddc_en;
+		goto err_disable_regulator;
 	}
 
 	ret = clk_prepare_enable(hdmi->clk_tmds);
@@ -245,12 +207,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:
 	reset_control_assert(hdmi->rst_ctrl);
-err_disable_ddc_en:
-	gpiod_set_value(hdmi->ddc_en, 0);
+err_disable_regulator:
 	regulator_disable(hdmi->regulator);
-err_unref_ddc_en:
-	if (hdmi->ddc_en)
-		gpiod_put(hdmi->ddc_en);
 
 	return ret;
 }
@@ -264,11 +222,7 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
 	sun8i_hdmi_phy_deinit(hdmi->phy);
 	clk_disable_unprepare(hdmi->clk_tmds);
 	reset_control_assert(hdmi->rst_ctrl);
-	gpiod_set_value(hdmi->ddc_en, 0);
 	regulator_disable(hdmi->regulator);
-
-	if (hdmi->ddc_en)
-		gpiod_put(hdmi->ddc_en);
 }
 
 static const struct component_ops sun8i_dw_hdmi_ops = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index bffe1b9cd3dc..9ad09522947a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -9,7 +9,6 @@
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_encoder.h>
 #include <linux/clk.h>
-#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -193,7 +192,6 @@ struct sun8i_dw_hdmi {
 	struct regulator		*regulator;
 	const struct sun8i_dw_hdmi_quirks *quirks;
 	struct reset_control		*rst_ctrl;
-	struct gpio_desc		*ddc_en;
 };
 
 extern struct platform_driver sun8i_hdmi_phy_driver;
-- 
2.35.1

