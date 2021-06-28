Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02563B5E44
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0516E454;
	Mon, 28 Jun 2021 12:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9730D6E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 138BB5803A8;
 Mon, 28 Jun 2021 08:43:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Jun 2021 08:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=lzONwh6xVx1kB
 ANDcuAuFJdv1AbJzgK69WujXLtDXQQ=; b=Y4XogUkW1KyAgyxqvZ0f2Rke6MY2p
 5GCiw2s1xOfEeSgkUxEhM30fJfjvQyCAr6Pu1o19W5cfYo9lKoEivqCrViv6A3/h
 HK3OL4/qUml8zEz6kYCXSqb/QrpCTbROBqPikSERKIs4+BdzJlF5dvOJxYKs29Ip
 AmMC403R6JvyFzEQsbjF0zD4cRY/UHo3vThTxGh+Hmsfbs0WNO3ufkah0prdahvY
 OqAPl8exyRpZkS/gCjQse+yefy0wQi6DPWrWHpuEt/kbE0I8IaFrSBQtqfN6zVTL
 8uh2DKmt464Hm8ox5gMqdufaFfUu+HbI3zAaf6jTH4St0aTof29v3Mjdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lzONwh6xVx1kBANDcuAuFJdv1AbJzgK69WujXLtDXQQ=; b=FWaO44C+
 sRuSShGJ/49OHc7LTH0fXPB65ReO8fKIjwXwpU/QvUKX0KqrWxNZnf+1wxtNIKj9
 QkDXCe2qTfpluh90sBJeSmMOfYK3QKWTogQ7QKVFD9/4VkpaRCXPEqoN3v8NhRo7
 76TCLPzzW25eWHb2YXM+snL84oOpoTBW4Dl/w9+eMqUJyKnNUwHOpPZo2woiIp9j
 zqBYPq7kIwO+xzXl2m3s4rVf1/LxnoJvEMWa4gapj2iPRrBseBddFFLs75XrwLKB
 +RenkbMhs8ArJfYz106Wj2rbXKXfTiLZ9257UMmF4x1tJOpdZjy6ERKH6EfgIrPS
 69BdfgHXJAhPtA==
X-ME-Sender: <xms:4cPZYOu3043M-s7_l0TzqM3kEwu2qosftjDldNvXsBdx3hvYBZpUMQ>
 <xme:4cPZYDeN_Djig2xMYV55OUrHp6gI3FB6L-eTahlhBvOFsbMqOtb4szZiF9edsPOFN
 gZnY6PldDMiLClu8m0>
X-ME-Received: <xmr:4cPZYJziewLdKQsGf2t8weqrYH3i_XWc2qOJ_wgPWuRPhNEiKAGR8-fb7mkdIh2JMnuOgfooFSE1urq4GjFumj-JQNp5yklsL68X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4cPZYJMQC9EW4ff15lJsX-d1fAfCTLIgacmeDyaNUCS7G9-nA21itA>
 <xmx:4cPZYO_kYfBM1830SJxEhis7HWiOqWBv_WnOOXRqqKmwutAPJUb6vQ>
 <xmx:4cPZYBXQlxz29KnBM0tjRQvSsfVGRmdDsy2s1Xe5exH7j428eY-G7g>
 <xmx:4sPZYJfy86GPPYWou9D-PgCaDdIq8kHDXa7bmmC3meFEPmv_pSNtOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 07/10] drm/vc4: Leverage the load tracker on the BCM2711
Date: Mon, 28 Jun 2021 14:42:54 +0200
Message-Id: <20210628124257.140453-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The load tracker was initially designed to report and warn about a load
too high for the HVS. To do so, it computes for each plane the impact
it's going to have on the HVS, and will warn (if it's enabled) if we go
over what the hardware can process.

While the limits being used are a bit irrelevant to the BCM2711, the
algorithm to compute the HVS load will be one component used in order to
compute the core clock rate on the BCM2711.

Let's remove the hooks to prevent the load tracker to do its
computation, but since we don't have the same limits, don't check them
against them, and prevent the debugfs file to enable it from being
created.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c |  7 +++++--
 drivers/gpu/drm/vc4/vc4_drv.h     |  3 ---
 drivers/gpu/drm/vc4/vc4_kms.c     | 16 +++++-----------
 drivers/gpu/drm/vc4/vc4_plane.c   |  3 ---
 4 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 6da22af4ee91..ba2d8ea562af 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -7,6 +7,7 @@
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
+#include <linux/platform_device.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
@@ -26,8 +27,10 @@ vc4_debugfs_init(struct drm_minor *minor)
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
 	struct vc4_debugfs_info_entry *entry;
 
-	debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
-			    minor->debugfs_root, &vc4->load_tracker_enabled);
+	if (!of_device_is_compatible(vc4->hvs->pdev->dev.of_node,
+				     "brcm,bcm2711-vc5"))
+		debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
+				    minor->debugfs_root, &vc4->load_tracker_enabled);
 
 	list_for_each_entry(entry, &vc4->debugfs_list, link) {
 		drm_debugfs_create_files(&entry->info, 1,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 52214a1568fe..ac8021639d03 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -200,9 +200,6 @@ struct vc4_dev {
 
 	int power_refcount;
 
-	/* Set to true when the load tracker is supported. */
-	bool load_tracker_available;
-
 	/* Set to true when the load tracker is active. */
 	bool load_tracker_enabled;
 
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f29ac64a5aa5..d6b707711f58 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -551,9 +551,6 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	int i;
 
-	if (!vc4->load_tracker_available)
-		return 0;
-
 	priv_state = drm_atomic_get_private_obj_state(state,
 						      &vc4->load_tracker);
 	if (IS_ERR(priv_state))
@@ -628,9 +625,6 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (!vc4->load_tracker_available)
-		return;
-
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 }
 
@@ -638,9 +632,6 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
 	struct vc4_load_tracker_state *load_state;
 
-	if (!vc4->load_tracker_available)
-		return 0;
-
 	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
 	if (!load_state)
 		return -ENOMEM;
@@ -868,9 +859,12 @@ int vc4_kms_load(struct drm_device *dev)
 					      "brcm,bcm2711-vc5");
 	int ret;
 
+	/*
+	 * The limits enforced by the load tracker aren't relevant for
+	 * the BCM2711, but the load tracker computations are used for
+	 * the core clock rate calculation.
+	 */
 	if (!is_vc5) {
-		vc4->load_tracker_available = true;
-
 		/* Start with the load tracker enabled. Can be
 		 * disabled through the debugfs load_tracker file.
 		 */
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 19161b6ab27f..01914d65bff5 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -532,9 +532,6 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	struct vc4_dev *vc4;
 
 	vc4 = to_vc4_dev(state->plane->dev);
-	if (!vc4->load_tracker_available)
-		return;
-
 	vc4_state = to_vc4_plane_state(state);
 	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
 							state->crtc);
-- 
2.31.1

