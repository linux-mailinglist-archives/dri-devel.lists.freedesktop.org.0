Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F773F16AF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3B66E82A;
	Thu, 19 Aug 2021 09:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADD6E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2BF9580B71;
 Thu, 19 Aug 2021 05:51:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 05:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=eeLv+e45A6Rz/
 VwiNq8pVG1tTqzdastMYr67hGUkuOA=; b=a4EQWfglWN8cW23wZdG7btunr517w
 QhwAX6tISO5EGW5IQHLx4oHP70ybwgRkB8diIwdQn2u/2c1WS+73RGeTFPaz2Z4/
 oaGk0G+tf0tQ+Ozq4Kta18yp24ff95H7eNIWiVeCJg5dofPoy2oVUu0M9T4Sad7c
 WlAbCDvmk18BfDCfFG9gKMgE7FeUj0m5Pf/7DcJR1V+AJVMKBAKVSUNK6Wwc1pbQ
 dJlYxX3Q4tO0dud0Ukyv1WgmGpYn7PiPtnXFtdOtkw+2+j7KTehCco4BzRs1nIpO
 /ElDa85w30imzuNhk9dVL3PUiIPBlqOhjTPt7H+ois1jYXGmUm4ryBcmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eeLv+e45A6Rz/VwiNq8pVG1tTqzdastMYr67hGUkuOA=; b=ItxzkhGy
 dkhbrCnZslhltp7An5E1pEFCJgLJQGhwR84ehprdvYB54Hp8BrWPXEBZ3v8dAhrM
 8aEvdJnpP5itRhb/Gik21kCIWr1xMpJlKZC6XNgureVM4NIdGG+FhdCrOVfpkfnE
 rT30nU9hAMbYLNiayvxXA28cRVlEbgvnOvSdGgZxj4Ta54Iuz8i5VrWDJQSXV4ST
 iWfe87kQimkzufoYdcroRf8hJh6VXwp7LHcgtSKXb4t7lrDXgcsVCe/T3uUgMPkX
 2VY6LTb4qh++QiVkqt61NZa5l0ERqJ9ro9h4SKYSDtCJGLJnfh58MpJzYmxxZK1P
 aLNlLA0/IXCdOQ==
X-ME-Sender: <xms:rSkeYbCNeYP8-61jF_9anFBfo0V-lGjtH-GZhYCPGsAzRpoj9DH-Pg>
 <xme:rSkeYRiQQ7bOJbOnZL0gewHxuQFDV-S8pMrpPmqnLKN3JlaKJURSxmu1mHgjBs8Tr
 9vpI1cmHZu1isHpPpM>
X-ME-Received: <xmr:rSkeYWlCuusjb4vaEWQRTA0Ii9hmLTD_fAQUeq0xJdPRdn7BzXdzqXil_ufIRStEGZLzq8ONTzF78-YJj9xkCUDsieJ09tvgk3cq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rSkeYdwIqEFIs57g9TpeAmxpa_1kGtcG3F5Ef56_aWj8fFhOE-Z0WQ>
 <xmx:rSkeYQQylRsPpOIft98dYggAxj2OXd9WfKXtmrRT05ZIbG1WUST5Tg>
 <xmx:rSkeYQaADN4bEToiZk9weEWzOcEzPAEBQ0rc-6vxLqhvLfLu-zdWPQ>
 <xmx:rSkeYcozPaBDFk-vQaj4aZAz06Ms8KIqX-TginLsEQ3KMXWxvPX0Sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 07/10] drm/vc4: Leverage the load tracker on the BCM2711
Date: Thu, 19 Aug 2021 11:51:16 +0200
Message-Id: <20210819095119.689945-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
index 220c5e81ba2c..95a1eb7ebf90 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -202,9 +202,6 @@ struct vc4_dev {
 
 	int power_refcount;
 
-	/* Set to true when the load tracker is supported. */
-	bool load_tracker_available;
-
 	/* Set to true when the load tracker is active. */
 	bool load_tracker_enabled;
 
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f0b3e4cf5bce..ca688115381e 100644
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

