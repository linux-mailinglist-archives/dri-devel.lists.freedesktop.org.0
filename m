Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347BE1E599F
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137C6E45F;
	Thu, 28 May 2020 07:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF646E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E454958200C;
 Wed, 27 May 2020 11:49:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YPVkA42r4+6W/
 vsowzv0aziDtj61rrsZr23S9R/5TQU=; b=XNpVcwyPtZWTwFeClLwvn2VVGagf0
 Bs6fEtH3FcRLgmtRdIRmTZhM+Dnqd9yH8WxLZyW8jpLLaiPf2CB8furjPHarv0iZ
 PK88iGXrKVgWdVOvd7YWHlogEqhOWmOPfhhP+qa7RXAg3lDV266z9908dDdKN/sg
 Bdln+az6WoWgiu6rWCa2HPevnX3HH0SxgDAL/AJCWU46CGYdxldChmvktJT8zMGB
 TodJmt6xWaJ6BCGBbnNy6+LqroZaCcEa57wKGxDGzgSi6ZmP7dRrNjsMWl6u6+Ea
 9pnWiKmKSe1xAa/7KNriWAe8yquQkCWLvL0I1oAVVaU1IBbi5K6jQh6Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YPVkA42r4+6W/vsowzv0aziDtj61rrsZr23S9R/5TQU=; b=fufEWdsT
 Kd8ktmA5+TYW4s6jgpNEqmI4SxKT/fLxVb1fQGaOR3zRF2rQwh7PkMsivFmYmw3Q
 H7A62bRivCTmHU1SwbmD1xBucJbRDfxMGCYat3kBa2SqMjGHjeGuvgF+QrUr5FC/
 OeI54ih7/O5HJ88AqxjZXoIwYxPP4xKaoOID4ZE5ZV0Kx8vW5j0Q8pEIxwVeEoQn
 DCAQVEFRy5cXlEf672qPvyql2E9zOToEhJ4zRFhySieFyooFB+1O1RKf1JPEvGkm
 D9FUEX5epNNPvN3VangyCOjGH0VeV9DezR/oho+ztyHVayTFwt6nNh3DpenuZX+Y
 15/2iRPr0x8HGA==
X-ME-Sender: <xms:D4zOXqOusdx61rev90hPIZGH1vuqhA_2KqXrFrFDZWkmuoP-Fchi4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:D4zOXo_pxzp6ijX0Pzr6vZPSXnSoAWJG57L4rshBpUAMGMY1Lyxgdg>
 <xmx:D4zOXhREKewy6wNWTlm-UtglLTeRtNPxlOeFiZ5zpiTAbCieQFg04g>
 <xmx:D4zOXqtgDwAhwqRXclj7u1mW5dIBxgHd2-5KoYW2dfudphPapqZbCg>
 <xmx:D4zOXov1yuNOH20ViF9bKgDmJwm02AAE4-d5_IL7xBZ5qlteErTeJg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84A53328005E;
 Wed, 27 May 2020 11:49:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 012/105] drm/vc4: drv: Support BCM2711
Date: Wed, 27 May 2020 17:47:42 +0200
Message-Id: <49c552751ec619e03371bc4bb1b9ec66c8423bf7.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

The BCM2711 has a reworked display pipeline, and the load tracker needs
some adjustement to operate properly. Let's add a compatible for BCM2711
and disable the load tracker until properly supported.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c   |  1 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_kms.c   | 42 +++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_plane.c |  5 ++++-
 4 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 76f93b662766..d7f554a6f0ed 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -364,6 +364,7 @@ static int vc4_platform_drm_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_of_match[] = {
+	{ .compatible = "brcm,bcm2711-vc5", },
 	{ .compatible = "brcm,bcm2835-vc4", },
 	{ .compatible = "brcm,cygnus-vc4", },
 	{},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6f50a91e3933..649bf47c80e5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -201,6 +201,9 @@ struct vc4_dev {
 
 	int power_refcount;
 
+	/* Set to true when the load tracker is supported. */
+	bool load_tracker_available;
+
 	/* Set to true when the load tracker is active. */
 	bool load_tracker_enabled;
 
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 78d4fb0499e3..9417e45d981f 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -415,6 +415,9 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	int i;
 
+	if (!vc4->load_tracker_available)
+		return 0;
+
 	priv_state = drm_atomic_get_private_obj_state(state,
 						      &vc4->load_tracker);
 	if (IS_ERR(priv_state))
@@ -514,10 +517,14 @@ int vc4_kms_load(struct drm_device *dev)
 	struct vc4_load_tracker_state *load_state;
 	int ret;
 
-	/* Start with the load tracker enabled. Can be disabled through the
-	 * debugfs load_tracker file.
-	 */
-	vc4->load_tracker_enabled = true;
+	if (!of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc5")) {
+		vc4->load_tracker_available = true;
+
+		/* Start with the load tracker enabled. Can be
+		 * disabled through the debugfs load_tracker file.
+		 */
+		vc4->load_tracker_enabled = true;
+	}
 
 	sema_init(&vc4->async_modeset, 1);
 
@@ -531,8 +538,14 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	dev->mode_config.max_width = 2048;
-	dev->mode_config.max_height = 2048;
+	if (!of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc5")) {
+		dev->mode_config.max_width = 7680;
+		dev->mode_config.max_height = 7680;
+	} else {
+		dev->mode_config.max_width = 2048;
+		dev->mode_config.max_height = 2048;
+	}
+
 	dev->mode_config.funcs = &vc4_mode_funcs;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
@@ -547,14 +560,17 @@ int vc4_kms_load(struct drm_device *dev)
 	drm_atomic_private_obj_init(dev, &vc4->ctm_manager, &ctm_state->base,
 				    &vc4_ctm_state_funcs);
 
-	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
-	if (!load_state) {
-		drm_atomic_private_obj_fini(&vc4->ctm_manager);
-		return -ENOMEM;
-	}
+	if (vc4->load_tracker_available) {
+		load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
+		if (!load_state) {
+			drm_atomic_private_obj_fini(&vc4->ctm_manager);
+			return -ENOMEM;
+		}
 
-	drm_atomic_private_obj_init(dev, &vc4->load_tracker, &load_state->base,
-				    &vc4_load_tracker_state_funcs);
+		drm_atomic_private_obj_init(dev, &vc4->load_tracker,
+					    &load_state->base,
+					    &vc4_load_tracker_state_funcs);
+	}
 
 	drm_mode_config_reset(dev);
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 91e408f7a56e..57a73a2e2e5c 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -492,6 +492,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	struct vc4_plane_state *vc4_state;
 	struct drm_crtc_state *crtc_state;
 	unsigned int vscale_factor;
+	struct vc4_dev *vc4;
+
+	vc4 = to_vc4_dev(state->plane->dev);
+	if (!vc4->load_tracker_available)
+		return;
 
 	vc4_state = to_vc4_plane_state(state);
 	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
