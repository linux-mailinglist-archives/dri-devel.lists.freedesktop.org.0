Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E3219931
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A876E9E0;
	Thu,  9 Jul 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A732E6E591
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B4937D42;
 Wed,  8 Jul 2020 13:44:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NXFBntegE5RrZ
 XvpflL1i5OjOX+uH8j9qhJJrBSi/zg=; b=PpIR2vOFlmPOGHNCer7zG6LCMHlJt
 F/ENVZFVs0l7qBPXvwMgz7ZkAY8i88QSrvpEtdDEetTV28Aq/9SEodpDHs90YlcA
 ehVAAUNR9N0SjSLKcOZmJ6s6XZRrvZCBhLkKiBhmKd3lTpvLChMJeKuEq263vRIj
 rEo95IqXHH8PjjruK3a+FHgVa2gFEoVsSVjced6P9xvuVTSWycDU41Abv28yNWju
 5o3k3Xjc+2CLJcYo0BJJ2KHrMFLi4NEWtknU5q56Fi3M3DqjPJF74Z3e+27Ok5Vj
 GeeR/mCYqH2bvuPskq2dmGNHK3MicCGsTBWqigYcoe8UdojZdUjhv35kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NXFBntegE5RrZXvpflL1i5OjOX+uH8j9qhJJrBSi/zg=; b=OfmQo5It
 GLhJY9dIlYYkRH63Cw22PYo+wJDUdSej9kfPkjX4aI9GwhDnFj8NAz/eblts4Hx8
 VTqXcMLE++TbQbmUOT5zl7dEedzG7itDGbP86LF6y/kU66QLBtYRTm6cSYqP+2el
 lMnGP8gWYlB8cXpCfEC3PxGREStvTBCzz+4tEO1chiQcvrIyg4R9J6qO94cim+RY
 H35BK8eQzvDOPJ1IDP//rxCjzyA+xW3sg+X5+ZSpDKKywUmsu4BhASYHMZSXw99Y
 kUNtjjwpb5Sijgp8Nd/YlwKV6eV4N+26ZxejVMzipz6hDp/bjy0xXcUy3ySWZ9Pq
 b99z+jWqTmCJbw==
X-ME-Sender: <xms:9gUGX5O1uEnpLTtBe1w9RiwWcH94D1AKCF2gV8Ps-Fca0mnt5b_CUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9gUGX799QXyRgWNk59IZIQaJIkIimGLmoDrSJP7q8H8-HlEJjeDYGw>
 <xmx:9gUGX4R8UERzrrB_fiMaJRvGDJIEAVCPKgYy7ijiD-gQcGPixcvjwg>
 <xmx:9gUGX1sIt-z0il0PD53cii7uXqsXCchO7iHNxn76TbBHrWZsoNWfEg>
 <xmx:9gUGX7v1kZy2GH6-2CxEtm_OqMPaNBwTpvk3fQIC4IeSAYlMs--2ds1IkpU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F088D30600B4;
 Wed,  8 Jul 2020 13:44:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 77/78] drm/vc4: drv: Support BCM2711
Date: Wed,  8 Jul 2020 19:42:25 +0200
Message-Id: <90c53367b289e9c0f9eeb97794a8d3b08d813884.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
index 7c8a87339959..ae479f988666 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -532,6 +532,9 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	int i;
 
+	if (!vc4->load_tracker_available)
+		return 0;
+
 	priv_state = drm_atomic_get_private_obj_state(state,
 						      &vc4->load_tracker);
 	if (IS_ERR(priv_state))
@@ -681,10 +684,14 @@ int vc4_kms_load(struct drm_device *dev)
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
 
@@ -698,8 +705,14 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	dev->mode_config.max_width = 2048;
-	dev->mode_config.max_height = 2048;
+	if (of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc5")) {
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
@@ -714,14 +727,17 @@ int vc4_kms_load(struct drm_device *dev)
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
