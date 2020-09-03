Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76C25D226
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67926EAD2;
	Fri,  4 Sep 2020 07:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565B46E581
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E3329B44;
 Thu,  3 Sep 2020 04:03:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=drJ+BFJBQYiQb
 DPjeCt0XCzj5cTedbAvqWxxXhWZ8EE=; b=gCCzoAdCYyGXvRsdqASjO73QpOwQJ
 zQjppC7iedvkdUtYOqNlCAFxeHw8BJUQ5TmvzO/uSPOcb0LoDyY35tFB2gAGI+5E
 eexqW+uT844t4SF+FFj3+KLkpz1achXpUWrgeWRpntG3enU865Lh6OQ6p0C8Ner3
 tkl8s8DWPr08bi1eFEorjdWYA/HPPW1q31I3oKU1UGXiD7RHeo3Cggut+lriOgf6
 CcA6YtFoeWZB2s1bLHGo1uwuC1sPQXnP6MQbE6BAw4vl2ImPnx1NgveqgihAc/7Y
 hNwnz8yMTfwJ4dlDW29bktf+qLi2ryo6iQ/eRVk+GYl2gIqdtvabdln4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=drJ+BFJBQYiQbDPjeCt0XCzj5cTedbAvqWxxXhWZ8EE=; b=CZqFk8Zl
 zXDbmjhIjGht5eOI4Jwu6VTkDhFErkBCMsLoIe3fJ4ERSF9c16cMujrcRJB1RRZI
 s7LPlCoB+C7NPPNCRWVae9dNUv3UADpc8kiZstXQAF/PP+F94JjIU5rAvs5Ci8cc
 7QLhaspp87Mm4MRJBzbOHckgIuLlRDxoRrsYqxF+Xl31nOO2oS8moKlSCkpQyPnJ
 ijL5TWgfi8f++4GyqWt7U6iDQlbfGmy/OtSmZU9viw3oZCw62dHE/sSCjuZrMy9A
 SdCGBYBbzxbtEFQIVFQk9WsCcvqKVdc5nSjBYiwOL8QW1hng728F65oGsiA//O0q
 LGsLAbYn46D5ig==
X-ME-Sender: <xms:YaNQXwNbHfMsk6xKPNHgkMxUs7X4eYhksslFZkOROcIUoiM9b8qPPg>
 <xme:YaNQX2-O_qsEimcbhCGg4uQfuN1yKQGorBDgLoBaZeWgwWOq8S-dzXAdE8Sw-SBIm
 Y81Y2xzo9NcmvVJwPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejvd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YaNQX3S3DndjD1C8MM5RKKaoDRUxdzAV3YNphEniXmdlMpuss4i6VA>
 <xmx:YaNQX4vA6eWar3WDzEDIUCQrW9K9SUqE-wPdU7HpIntogke46hrK4w>
 <xmx:YaNQX4eh6y3iwUl8PDxeXs_UgBHFcN0Ccn49CjlcFfOGvQzLjl737Q>
 <xmx:YaNQX82MDLYwia3iE8lIz9HH-cgwh45eg8UbExofTETXrkA4yOX1_cNhOdg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A1B4306005F;
 Thu,  3 Sep 2020 04:03:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 79/80] drm/vc4: drv: Support BCM2711
Date: Thu,  3 Sep 2020 10:01:51 +0200
Message-Id: <beac4f9ef0261bca731a0402c8354e9af740519c.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 has a reworked display pipeline, and the load tracker needs
some adjustment to operate properly. Let's add a compatible for BCM2711
and disable the load tracker until properly supported.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c   |  1 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_kms.c   | 44 +++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_plane.c |  5 ++++-
 4 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 9567d1019212..f1a5fd5dab6f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -372,6 +372,7 @@ static int vc4_platform_drm_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_of_match[] = {
+	{ .compatible = "brcm,bcm2711-vc5", },
 	{ .compatible = "brcm,bcm2835-vc4", },
 	{ .compatible = "brcm,cygnus-vc4", },
 	{},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 501a48a714d3..8c8d96b6289f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -200,6 +200,9 @@ struct vc4_dev {
 
 	int power_refcount;
 
+	/* Set to true when the load tracker is supported. */
+	bool load_tracker_available;
+
 	/* Set to true when the load tracker is active. */
 	bool load_tracker_enabled;
 
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index bfc7ddd49ac5..16e233e1406e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -536,6 +536,9 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	int i;
 
+	if (!vc4->load_tracker_available)
+		return 0;
+
 	priv_state = drm_atomic_get_private_obj_state(state,
 						      &vc4->load_tracker);
 	if (IS_ERR(priv_state))
@@ -683,12 +686,18 @@ int vc4_kms_load(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_ctm_state *ctm_state;
 	struct vc4_load_tracker_state *load_state;
+	bool is_vc5 = of_device_is_compatible(dev->dev->of_node,
+					      "brcm,bcm2711-vc5");
 	int ret;
 
-	/* Start with the load tracker enabled. Can be disabled through the
-	 * debugfs load_tracker file.
-	 */
-	vc4->load_tracker_enabled = true;
+	if (!is_vc5) {
+		vc4->load_tracker_available = true;
+
+		/* Start with the load tracker enabled. Can be
+		 * disabled through the debugfs load_tracker file.
+		 */
+		vc4->load_tracker_enabled = true;
+	}
 
 	sema_init(&vc4->async_modeset, 1);
 
@@ -702,8 +711,14 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	dev->mode_config.max_width = 2048;
-	dev->mode_config.max_height = 2048;
+	if (is_vc5) {
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
@@ -718,14 +733,17 @@ int vc4_kms_load(struct drm_device *dev)
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
index 1e38e603f83b..24d7e6db6fdd 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -516,6 +516,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
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
