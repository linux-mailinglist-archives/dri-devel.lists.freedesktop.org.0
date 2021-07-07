Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FE3BE4A0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACC16E846;
	Wed,  7 Jul 2021 08:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AFF6E846
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 625E92B00943;
 Wed,  7 Jul 2021 04:48:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 04:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=YyP14HhgJiEPD
 LobY7EM72JpMB0p8QGpT5+/lC1jZxc=; b=Qp45ysaXN/99CS/G1vikveXYvEDGG
 UlgIkMg2pLPkUG74W+Ty6MwxIPG4fv1EpcpM9+M90QpAr6CYvP/EyA1kEi87f++f
 /z9taWA2uL3OTB0D+hD5CVakybMpnV4HGVHkOM3qLodm0NiBzbXmKt9Zn0iwsL1R
 UygdmoN+UcganJQVBQJvu+2hKRXuXYadgD604t2qKJbX+Ovbo3RXJnign2cEMmuj
 ylfwlp4Xo23vv5wV8CHsXxq1h4Z2mbWnUOKs36wVGpPxYtBLq90/ylmZY2qrF7Lk
 p8+R+0KnE6DMKV7vWHwEBYdfB7wNpF4sMfIGIVyZexrYbkCYijNNmbsgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YyP14HhgJiEPDLobY7EM72JpMB0p8QGpT5+/lC1jZxc=; b=QP0EEGd9
 +h2E5exUUV8FV0tRPohdK+6GA22VNBVs7dAeb9D5VgpzGYj6HnhHDkoE/r2zcT42
 QeSGDl2PUCu6niUIjY6UhRpJJEshn+Jci9BxZR18IZRcnsI2Ohpb4DGYDjrB33D/
 8yb1+1eSEwVEBNGx/K3jnDnOQFfhFkFkRCmsRBS0Uuc5A4UOAuexoO4MjRQcj5Qy
 oc44hwCYJirN5peqEeg73/g2biS/54HZ5Kuxh+e2kW9VA1Vf1OggAx9OBgv8KWHV
 /R3h5/hUre6N3ZjBUdxXEi4EwQuTC/84uR21hy3pCErVJTwdQS4OPbu2Exxr7I4k
 m6sKUMpjMiWLHg==
X-ME-Sender: <xms:UGrlYK9CWiz_psgaumJApW08LuE0JMaVTucLNveTQTsJjT62kzvvRg>
 <xme:UGrlYKu6oX2jsAaSWsnx6L5DIlQYKkiAehXNT5qzYgozM1dDzTqoEkUdewRnSn5nE
 RCK00NE05-yAFLWT2k>
X-ME-Received: <xmr:UGrlYAB1liJnRrpGgMtm8W13gpIIzzoapoFQdNK7xcYnh756H31OoQZn0DUbqfyREeoh5Pi_yRQl9ENhIEBJU3PjsDtQJN3PvMcD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UGrlYCc9EQgCAznP5DIYjiP-Gz-zPgg9h216Sb2f0mxTYpfjyQnv0w>
 <xmx:UGrlYPPXf1q18zJkYLzfsZz8JytvGTDp9OC-jX0EYNA0SPV8bxcmCA>
 <xmx:UGrlYMngXbMEwAJaZwv11KLr21qAT7mUze6l4pnustCGZ-wVsdWQtQ>
 <xmx:UWrlYGkfH9EWaD8W5HcoKzCrVqX0Ucd0hH532P0BY2gr9HmzXZLEbQDbPeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:48:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 07/10] drm/vc4: Leverage the load tracker on the BCM2711
Date: Wed,  7 Jul 2021 10:47:42 +0200
Message-Id: <20210707084745.1365390-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
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
 drivers/gpu/drm/vc4/vc4_plane.c   |  5 -----
 4 files changed, 10 insertions(+), 21 deletions(-)

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
index 19161b6ab27f..ac761c683663 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -529,11 +529,6 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	struct vc4_plane_state *vc4_state;
 	struct drm_crtc_state *crtc_state;
 	unsigned int vscale_factor;
-	struct vc4_dev *vc4;
-
-	vc4 = to_vc4_dev(state->plane->dev);
-	if (!vc4->load_tracker_available)
-		return;
 
 	vc4_state = to_vc4_plane_state(state);
 	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-- 
2.31.1

