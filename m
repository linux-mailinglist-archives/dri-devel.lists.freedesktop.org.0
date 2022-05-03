Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC9518404
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504EE10F933;
	Tue,  3 May 2022 12:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7610F933
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B591B3200953;
 Tue,  3 May 2022 08:14:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580045; x=1651666445; bh=3s
 gWAHPW/6p+kkBTvrH2lwqkXJ8EbXQz5b1gNKCXtrU=; b=C1XVT1URWXLl2hizVw
 dAt0NZlIpaqUBQx935L7GybjauUNxr+2XHd0na6IAQxNtRTROy87NmlzzUlnzMvW
 8Dmv+s82smoxaD43bnd5BNu72bGYLuPJGO5k+LAnpnMpG6N34TZCUIbsH35bCAy+
 GKQ+J23aekfePbq7E65azZlEoUswmgBAYImhSF6LhnSSuyxjNZgMnrLZK5wK7Lkt
 C1yKnSzLmnLt19hzQGeIplQOKQl4pxesEZqJeSnZXcyPEM6PQgqsGgU7NCi9ab9y
 IHMxVegqpoL6tYZYqwGPmT4cuJ9ZbSWd8S+h21UkxauI8ZNvBHIqf3fzigkqGnBi
 X6Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580045; x=1651666445; bh=3sgWAHPW/6p+kkBTvrH2lwqkXJ8EbXQz5b1
 gNKCXtrU=; b=QC1Bo1WEdmWRdfIBAyvM1Va8AIZ1YC/eAb8Aya0tU6yMZhIPuqy
 GPLOILLy06tccqke5wxG4UVO1/wupZPdosm5xxQJ+3W83hKPcOB5aswIFXZDeoW5
 QYV+092pM2M6qk5glLZvNlC7hwl0Nz2wbqD+Di3mIEuxHVaHLHvSSCpgHLXXZry2
 SwtTBzV5KpJVoe6kIt2pVzChMWiIDOKigAGLV0h5ZpaUEYsOcVhsv7V+NpDH+KEk
 nAPzcOqU0n+lpFSk3s9ZOzwX22n5xxamxvvRGwwlFp8aKbC40X3dq79+olto1XU+
 hwVi1Ila18AaqLDyAzL6WDrXkTv6uBV1LwA==
X-ME-Sender: <xms:jRxxYuG7_Dc0qH2ltpPQPdlRH2BoIIBUfxqNB2KQNAOCfd-pEEvkFw>
 <xme:jRxxYvVAyoAXey9J6zhjK2eahBmRmytw7VPGDxm5mQ4VRYlHoFv7141oO1ev_9gEy
 wGofaBM92_IS3BwUhs>
X-ME-Received: <xmr:jRxxYoIettt3jPU5DCJJ2y19y8JqvjCqxFNYLCYjhtSqSZx5Uv1JlwywwskE6N3g8Qilr3tDAPHjPLbfK3DES5szea62p6M70SwrgFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jRxxYoE1r0wKi3K8AVlS1wOGUUSCqy6FmlfiR5n58MTyYJOxt-woqQ>
 <xmx:jRxxYkVy232GB_vSBChw0JerEbReGW-KP1D0LeGDXFuPNYORDFljAQ>
 <xmx:jRxxYrNBnG1OzASU2mWRVRLug89zjC659VdsgscLpFvLNWmUYWwe8g>
 <xmx:jRxxYud-0e6CU8-VgqUTSX3vTpVwQG84t_eKuKiV_yFQhiN8piooig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/14] drm/vc4: drv: Register a different driver on BCM2711
Date: Tue,  3 May 2022 14:13:32 +0200
Message-Id: <20220503121341.983842-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior to the BCM2711/RaspberryPi4, the GPU was a part of the display
components of the SoC. It was thus a part of the vc4 driver.

However, with the BCM2711, it got split out and thus the v3d driver was
created. The vc4 driver now only handles the display part.

We didn't properly split out the code when doing the BCM2711 support
though, and most of the code around buffer allocations is still
involved, even though it doesn't have the backing hardware anymore.

Let's start the split out by creating a new drm_driver that only reports
and uses what we support on the BCM2711. The ioctl were properly
filtered already, but we were still exposing a .gem_create_object hook,
as well as having an .open and .postclose hooks which are only relevant
on older generations.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 51 ++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index eb08940028d3..4f9e2067dad0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -76,6 +76,19 @@ int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
 	return 0;
 }
 
+static int vc4_dumb_create(struct drm_file *file_priv,
+			   struct drm_device *dev,
+			   struct drm_mode_create_dumb *args)
+{
+	int ret;
+
+	ret = vc4_dumb_fixup_args(args);
+	if (ret)
+		return ret;
+
+	return drm_gem_cma_dumb_create_internal(file_priv, dev, args);
+}
+
 static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv)
 {
@@ -173,7 +186,7 @@ static const struct drm_ioctl_desc vc4_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VC4_PERFMON_GET_VALUES, vc4_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
 };
 
-static struct drm_driver vc4_drm_driver = {
+static const struct drm_driver vc4_drm_driver = {
 	.driver_features = (DRIVER_MODESET |
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM |
@@ -202,6 +215,27 @@ static struct drm_driver vc4_drm_driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
+static const struct drm_driver vc5_drm_driver = {
+	.driver_features = (DRIVER_MODESET |
+			    DRIVER_ATOMIC |
+			    DRIVER_GEM),
+
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = vc4_debugfs_init,
+#endif
+
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_dumb_create),
+
+	.fops = &vc4_drm_fops,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
 static void vc4_match_add_drivers(struct device *dev,
 				  struct component_match **match,
 				  struct platform_driver *const *drivers,
@@ -225,6 +259,7 @@ static void vc4_match_add_drivers(struct device *dev,
 static int vc4_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	const struct drm_driver *driver;
 	struct rpi_firmware *firmware = NULL;
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -236,14 +271,12 @@ static int vc4_drm_bind(struct device *dev)
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
 	is_vc5 = of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
+	if (is_vc5)
+		driver = &vc5_drm_driver;
+	else
+		driver = &vc4_drm_driver;
 
-	/* If VC4 V3D is missing, don't advertise render nodes. */
-	node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
-	if (!node || !of_device_is_available(node))
-		vc4_drm_driver.driver_features &= ~DRIVER_RENDER;
-	of_node_put(node);
-
-	vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
+	vc4 = devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
 	vc4->is_vc5 = is_vc5;
@@ -275,7 +308,7 @@ static int vc4_drm_bind(struct device *dev)
 			return -EPROBE_DEFER;
 	}
 
-	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
+	ret = drm_aperture_remove_framebuffers(false, driver);
 	if (ret)
 		return ret;
 
-- 
2.35.1

