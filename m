Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E52CE9E6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5893E6EC8A;
	Fri,  4 Dec 2020 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF396E9B8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:49 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3EC775803F4;
 Thu,  3 Dec 2020 08:25:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 03 Dec 2020 08:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fIDoWgxdw2VQ/
 24C2iWYnOjJSac/bdhVrwBtMOIoSk0=; b=sU2wHtMPpv8K2CJ2r+6iCsw3m8z6O
 GyoyOODXyDt5U8ilvWt+KFjJiRF1MOO+GvV2qGRWIuuCuaJk6tzjQTdR0Vkv003c
 2YssZ0Odw02bRcue4jokD8Hb4np1fe4rzAIVrHWdDMFM2YPnR47x3Q/kBvnuVMyP
 CeaQo/riWNnD9N8XLlJUKx8kQG3Vu7h8OxV/UZVEGosjq6vdNiET12EidZ3tJg6N
 QqZaypuATjpysCbViBmlakmEYJ3N4+k+24lDKfuEjL9p5LU2BbOoE2ByLANOdJ54
 js00azLZqoCXcSXQT0bz4AQYB50/xI6AS9qODng7tRoRH0PLbbgca3UXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fIDoWgxdw2VQ/24C2iWYnOjJSac/bdhVrwBtMOIoSk0=; b=I3xAFXir
 7HhLipLE/RTsy1rThzIiVShnwcRZA5Q4+pNjMG0lZ3e/7JyIh6Mg3oGT8dm2j3Mu
 7FDcPpLiUaOXyVhfEJ5LWHRDiOAr3GaBTselaXOCeXlOyCFx3p+ACxxQkrZl+zP7
 p38xQWZBQ3B/uGaon2m7ztPCh10x8jOx7pkB7cugbiBRQp/IEzxeCriNZ8lK5/zQ
 vQBve51IPFyCKpu6fAvbldREyLkOs01rn6t/Ri8peDWUc7vGxHdFss2TaEbSxuFx
 0mY5mQQLPxzlVcHr6WFvqGcO50X+oUKqT12zk9gMeb54tZ55N51smtLmpY0EA9mC
 xddGyb0VQ1ybiQ==
X-ME-Sender: <xms:WufIX0qzr3PFlnEtQpex-vIbkn6wVvTqxQS4uTvHHmuN6tMIdoVDGg>
 <xme:WufIX6ruEdlJXu6KtCD6lL8N_bp6cGQIv_F8SxurnB3uWXt18gzyieGV6r_-exKbS
 FhF39-zjqxEfQy1muI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WufIX5OyJ_G6Ir0D2HgU3TsuW9BP8zuZAg0SUqZojKLNHB2oeRFntA>
 <xmx:WufIX76GvrZfvVhFueM_Cck1N_wuWjql7Kt057B24ZKbgIC2rlYTgw>
 <xmx:WufIXz7XmTOcP48HbSgLYwQnDHrGv72Szw2dzeL2HMM0oGBF4KkOaQ>
 <xmx:XOfIX9tlxMzQAzx5GVQQkeb0ElMz4znH9uB3Xhrnff43NCNu2-Xg1w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 80D9724005B;
 Thu,  3 Dec 2020 08:25:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 1/8] drm/vc4: drv: Remove the DSI pointer in vc4_drv
Date: Thu,  3 Dec 2020 14:25:36 +0100
Message-Id: <20201203132543.861591-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That pointer isn't used anywhere, so there's no point in keeping it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_dsi.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c5f2944d5bc6..ee95b4327796 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -77,7 +77,6 @@ struct vc4_dev {
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
 	struct vc4_dpi *dpi;
-	struct vc4_dsi *dsi1;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 19aab4e7e209..b1d8765795f1 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1459,7 +1459,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
 	struct drm_panel *panel;
@@ -1612,9 +1611,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	if (dsi->port == 1)
-		vc4->dsi1 = dsi;
-
 	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
@@ -1643,8 +1639,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_dsi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	if (dsi->bridge)
@@ -1656,9 +1650,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 */
 	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
 	drm_encoder_cleanup(dsi->encoder);
-
-	if (dsi->port == 1)
-		vc4->dsi1 = NULL;
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
