Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C89439A7F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7AE6E0DC;
	Mon, 25 Oct 2021 15:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910B6E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD6A75806D4;
 Mon, 25 Oct 2021 11:29:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hxGb0SbYrAXzn
 KzmKDoVjsVmB836QfdMPBmRNBRjH/Q=; b=anarQEMyQGtZtkeCgT11WRO9tZmDH
 kfhl6Qk/eZ9xRpF01CWnymJnTh6nxjRaGh1BGAofd8TkQxH4e73wI9L31OM91oj9
 H7LQUSW12OwUc6ggpl4EVSvCclxFnCT4EfitJB/9J08cltQBemawSuH0QIY7D7qe
 LZE/iPWrBz9w0o0dPvbPZemGny4puj30UqrljxAdw7kiyq14XAnqqrzzRlQICtln
 nDqfN2wWXjE+AdZjs3XoJ0K6ZZl7GyTWnKhCRs0PjShjfW6ql8cOITaqiM0vF7nH
 SdkSZwly+jktFPztXyZ0ppf8lpitcBkxWO5ZYIwjHCIy7DtQwGBRafaGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hxGb0SbYrAXznKzmKDoVjsVmB836QfdMPBmRNBRjH/Q=; b=flvYUUfh
 axpsSaap1KeH3H3kwqRVtM87P+5F9ZXy/KfgHX3amqdg2LYQdMF3D/117AkatxS9
 l8L/z/l5SBzpq5hBlYMMKmg+bqdBiQl6c009IH1Ux4Ixjb38yNE7k3+6Fq+Vi7jf
 rP/Cx0aviEfE2xDD974QUyZmSsntbsykVXDo/jqZNTb0ef83Zlj0r8n84Uo7vpSt
 16iasJ4do73z5lLnVkmLMyqV/eNfnSjCTjsbpzFTfBpsicwrI/+t5ygzV0ucRsHc
 Tsw6Zq2yJEuswe8JQi+BUwknzkwronomBRyTqdehX4rHfarUwWwBlv1L1D1l0Mvl
 IjDU6N7zaoiDGQ==
X-ME-Sender: <xms:Uc12Ye_DNiTEWO3oSvOyaeYHD1VrDIXgCa03OBvTQ_seta6zf0trkQ>
 <xme:Uc12YetCpMkkfMkX_ll0oQpsyNysBNG8l__ZgpLj9k76CnQKdLz7VUUkWM43-Z-9B
 sr9NmfoqgH8GfnZohE>
X-ME-Received: <xmr:Uc12YUD4E-EpB317BHsyxkc6Q2y5qmSE1izBxwLAoTiRMoB6IRBD_2ucquGn5ZdUHsNUr9OEpFfiVyEJm_MlB6xZ7fING3GbZ-tByIlr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Uc12YWefbWayXOBxYaEXdPWTRYqw2Gs9qJfpq1Ghy26_5UswAkRQUg>
 <xmx:Uc12YTMtG5s4xYCK0HRC4atVNngs90VMcRBih7O14x1srUYwp_8c5Q>
 <xmx:Uc12YQmtGNtP93dQA5G792zj5r4OzL3ufvTjE_bVK3zeRDi8XT4gug>
 <xmx:Uc12YalYvzsEbAZbbApkKFONCBctWLJU0GoKPjaqIFGY_Mh7mOAYQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 07/10] drm/vc4: Leverage the load tracker on the BCM2711
Date: Mon, 25 Oct 2021 17:29:00 +0200
Message-Id: <20211025152903.1088803-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025152903.1088803-1-maxime@cerno.tech>
References: <20211025152903.1088803-1-maxime@cerno.tech>
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
index 60826aca9e5b..813c5d0ea98e 100644
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
index 028f19f7a5f8..41cb4869da50 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -552,9 +552,6 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
 	struct drm_plane *plane;
 	int i;
 
-	if (!vc4->load_tracker_available)
-		return 0;
-
 	priv_state = drm_atomic_get_private_obj_state(state,
 						      &vc4->load_tracker);
 	if (IS_ERR(priv_state))
@@ -629,9 +626,6 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (!vc4->load_tracker_available)
-		return;
-
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 }
 
@@ -639,9 +633,6 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
 	struct vc4_load_tracker_state *load_state;
 
-	if (!vc4->load_tracker_available)
-		return 0;
-
 	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
 	if (!load_state)
 		return -ENOMEM;
@@ -869,9 +860,12 @@ int vc4_kms_load(struct drm_device *dev)
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

