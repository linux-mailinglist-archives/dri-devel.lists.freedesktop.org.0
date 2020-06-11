Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D41F82C7
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854946E441;
	Sat, 13 Jun 2020 10:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7446E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:38:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 941385801C9;
 Thu, 11 Jun 2020 09:38:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FWp+nZAt67kLf
 FFkXkpwijsYrr9zE6nbCo+sUTODdjc=; b=PO5TbbRDiDd9vquEI2izdzx5XpLdi
 sGmfhrBskrR+t6/GMejvBheZXdBJELSmYF3cXeKg9LoS2aOLV+2TqIqBGaV/S9cV
 twxhXRVNbjmfOXJr7s5hfX6bEdxdv4+Rt9ZdbQ4/BBbNaDQ9UHA84an+DLzLUdo9
 0Q/DIdcX4qS3iGRz3B1jcNJ/xYDIyVWzdoTYLglwTeQ1hA6FgK0+LPVXSt9GWFLb
 P8ybi6/KAFPEm4yAxOIc9XauNgDBuSXf9R810tyi8ziv3omE+KzP1i1GIrxPbjxV
 LVaNBDOiRmhlVX6Fi48eZrkK8dbGoaUR5BQx9g6tAt0JUM6xqgYLyrRpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FWp+nZAt67kLfFFkXkpwijsYrr9zE6nbCo+sUTODdjc=; b=a8DD08GD
 CqCAZVg4+LmSVtSG4wp5iyzz2yZoDHsWGq+WJf8euDifVxIsnLXxO6zh16QCN/BV
 WuiQTgCsakD1a3NIWn3yY5DxeJ0Odbx3Nszes9boQjgENGBLleKfiUrWXkYTCuF9
 ogq2k6HqMiRc2b/hWMfqdkiMEEtCcwCSVFrkE1WkicP271Bq+ifcYcFy1gaqimh7
 UKaG1p2wB610Uag1kx3O+HN1/NbsdpAOGAnpK/QyTbRZ+XoHxojplYgtPYghNvEv
 lsKClIqxeKcGmrtjk0fvsCFzYEdMU5ANYFGbH0PjFjdjNpvsNcmqB42iRnwxA8Vb
 hJbQx3DCCpblcg==
X-ME-Sender: <xms:3jPiXmMLohy4J_QZWJSMpV_5pIw9qjpdnxTo56z-JdRY7Dape0FzdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3jPiXk_nc2gMMchheLODPbny01rG9RAhmdnc64qOvpuXa6tcgm9iCA>
 <xmx:3jPiXtTOXlEGT-Be4Pve4uhg4V1bQmaAwbUiXR_JmVDbHMsUouLmfg>
 <xmx:3jPiXmv0g5t9jrLSztAgKfddd5F0HKbR5bO8ilwQ1XXabLoAYQPLHA>
 <xmx:3jPiXkvjcc-jqcRIeJ2gHXqy2EJeh8TuK8y86mMjG7NE1rAe8pj47g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14BF7306669C;
 Thu, 11 Jun 2020 09:37:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 6/9] drm/vc4: crtc: Move the CRTC initialisation to a
 separate function
Date: Thu, 11 Jun 2020 15:36:51 +0200
Message-Id: <3a3026c0e7408895d154d8dea454cf6d1c459715.1591882579.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The upcoming patches to turn the TXP into a full-blown CRTC will have the
same CRTC initialisation code, so let's move it into a separate, public,
function so that we can reuse it later on.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 87 ++++++++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  3 +-
 2 files changed, 53 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 49c9954d3e00..e30a5036d2e6 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -878,6 +878,48 @@ vc4_crtc_get_cob_allocation(struct vc4_crtc *vc4_crtc)
 	vc4_crtc->cob_size = top - base + 4;
 }
 
+int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
+		  const struct drm_crtc_funcs *crtc_funcs,
+		  const struct drm_crtc_helper_funcs *crtc_helper_funcs)
+{
+	struct drm_crtc *crtc = &vc4_crtc->base;
+	struct drm_plane *primary_plane;
+	unsigned int i;
+
+	/* For now, we create just the primary and the legacy cursor
+	 * planes.  We should be able to stack more planes on easily,
+	 * but to do that we would need to compute the bandwidth
+	 * requirement of the plane configuration, and reject ones
+	 * that will take too much.
+	 */
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
+	if (IS_ERR(primary_plane)) {
+		dev_err(drm->dev, "failed to construct primary plane\n");
+		return PTR_ERR(primary_plane);
+	}
+
+	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+				  crtc_funcs, NULL);
+	drm_crtc_helper_add(crtc, crtc_helper_funcs);
+	vc4_crtc->channel = vc4_crtc->data->hvs_channel;
+	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
+	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
+
+	/* We support CTM, but only for one CRTC at a time. It's therefore
+	 * implemented as private driver state in vc4_kms, not here.
+	 */
+	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+	vc4_crtc_get_cob_allocation(vc4_crtc);
+
+	for (i = 0; i < crtc->gamma_size; i++) {
+		vc4_crtc->lut_r[i] = i;
+		vc4_crtc->lut_g[i] = i;
+		vc4_crtc->lut_b[i] = i;
+	}
+
+	return 0;
+}
+
 static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -885,8 +927,8 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	const struct vc4_pv_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *primary_plane, *destroy_plane, *temp;
-	int ret, i;
+	struct drm_plane *destroy_plane, *temp;
+	int ret;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
@@ -907,32 +949,11 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	vc4_crtc->regset.regs = crtc_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(crtc_regs);
 
-	/* For now, we create just the primary and the legacy cursor
-	 * planes.  We should be able to stack more planes on easily,
-	 * but to do that we would need to compute the bandwidth
-	 * requirement of the plane configuration, and reject ones
-	 * that will take too much.
-	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(primary_plane)) {
-		dev_err(dev, "failed to construct primary plane\n");
-		ret = PTR_ERR(primary_plane);
-		goto err;
-	}
-
-	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-				  &vc4_crtc_funcs, NULL);
-	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
-	vc4_crtc->channel = vc4_crtc->data->hvs_channel;
-	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
-	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
-
-	/* We support CTM, but only for one CRTC at a time. It's therefore
-	 * implemented as private driver state in vc4_kms, not here.
-	 */
-	drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
-
-	vc4_crtc_get_cob_allocation(vc4_crtc);
+	ret = vc4_crtc_init(drm, vc4_crtc,
+			    &vc4_crtc_funcs, &vc4_crtc_helper_funcs);
+	if (ret)
+		return ret;
+	vc4_set_crtc_possible_masks(drm, crtc);
 
 	CRTC_WRITE(PV_INTEN, 0);
 	CRTC_WRITE(PV_INTSTAT, PV_INT_VFP_START);
@@ -941,14 +962,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_destroy_planes;
 
-	vc4_set_crtc_possible_masks(drm, crtc);
-
-	for (i = 0; i < crtc->gamma_size; i++) {
-		vc4_crtc->lut_r[i] = i;
-		vc4_crtc->lut_g[i] = i;
-		vc4_crtc->lut_b[i] = i;
-	}
-
 	platform_set_drvdata(pdev, vc4_crtc);
 
 	vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
@@ -962,7 +975,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 		if (destroy_plane->possible_crtcs == drm_crtc_mask(crtc))
 		    destroy_plane->funcs->destroy(destroy_plane);
 	}
-err:
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6587bc09b2cd..1c49c27a564f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -794,6 +794,9 @@ void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
+int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
+		  const struct drm_crtc_funcs *crtc_funcs,
+		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
 void vc4_crtc_destroy(struct drm_crtc *crtc);
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
