Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D029FFB5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ADF6E98C;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37616E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 69ADD5807F9;
 Thu, 29 Oct 2020 15:01:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=c5Q85KyiNucov
 r00X8xQCnw2lhLdOXIjBmibM4kFAXA=; b=qWA48SNUEhCnWWun7Q1BUPHs4lpa5
 XOUThMoArpHrkmePRHvqdsRpfp+L662p7jp93ILxbTXPCImi/w/iOuv8VqSO+cPW
 CBGe7fhcaLjL5+1rB2drtcnxF2GCybQC9CwF8WmSwNB2cUjuOHZtn9oQYNzQUrGX
 YccR8XCDROcNjVvauC7jCjtsVqyzP/dtKtXCDc7cGP9A+nn6+3PeykxV3mRMRvCr
 /g93eJryvG0MoCQeL+Urw/qZFjxOR893f3Ix7ggAcMDyEDaH76IezcEVN4/IDJsf
 tNq+Xr7iCkziAoe3u9Y4rcmbFL2OAA8WPe+FeEljEDXooE2UNPY9YfHUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=c5Q85KyiNucovr00X8xQCnw2lhLdOXIjBmibM4kFAXA=; b=TddfqbA0
 Z01cTkGtFe9ReIMkQnC6YmYAWuvD+2wC8xXjbzpfjmGenFGoYkulYbEOc+m3jM9K
 w9StLnk5EXhnDcIFNlZM8WjD3HgAtCMXZ92sNlVbafuP9zUvJ4KixEJCJb0vAG8G
 2EioN1ClZKttzQ3oL37j6wZsH8fCBP74zf74LktOYY/ekuMsth8tecU0DBATbOC3
 pXzS1iAzV5mZAxuojprQzEfNNrqZ+036GXz+1cBSXpYaJca31VORXbjSkRjGvwjp
 h0hO3k7DZjSyoJLI0Wst6SoCRMokZmDR5fF7M2E/rrxfiCLvei4+pN2gYRUpqwM2
 0sddR4WiylKqNA==
X-ME-Sender: <xms:eRGbX9D7i9mLJzSViJmpHY2rV0XWikLfW94ef_NyytwiczEKq6omCA>
 <xme:eRGbX7gzjTCTf_rMAQTT86qD0EawqSl6vLla2DWNY6IbdoadxVCv2HWry_1MmyrVL
 O0msCYKviYxhJwVqew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eRGbX4mtlr0hI5V-aW9mqdXNXpW1pPmadQDNt8kGkKbmufRwb8cEng>
 <xmx:eRGbX3xlQCYbfPJEabgo4iz7y5457LCsE0BK6kbil9srp6RELuJwoA>
 <xmx:eRGbXyRiLHdfTUbG4r1A0L9KFVjCsZMS3rzVRVeqaQs7MdLRkJT-BA>
 <xmx:eRGbX1EKYIpev5BmHCBBW3yfnjOeKqzQD5xAH9IFtjhg45A9OrJe7w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC82C328005D;
 Thu, 29 Oct 2020 15:01:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 5/6] drm/vc4: Use devm_drm_dev_alloc
Date: Thu, 29 Oct 2020 20:01:03 +0100
Message-Id: <20201029190104.2181730-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029190104.2181730-1-maxime@cerno.tech>
References: <20201029190104.2181730-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can simplify a bit the bind code, its error path and unbind by using
the managed devm_drm_dev_alloc function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c  |  4 ++--
 drivers/gpu/drm/vc4/vc4_drv.c | 27 ++++++++++-----------------
 drivers/gpu/drm/vc4/vc4_drv.h |  4 ++--
 drivers/gpu/drm/vc4/vc4_gem.c | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_v3d.c | 12 ++++++------
 5 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 730d5775ab42..74129dc78875 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -468,7 +468,7 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t unaligned_size,
 	}
 
 	if (IS_ERR(cma_obj)) {
-		struct drm_printer p = drm_info_printer(vc4->dev->dev);
+		struct drm_printer p = drm_info_printer(vc4->base.dev);
 		DRM_ERROR("Failed to allocate from CMA:\n");
 		vc4_bo_stats_print(&p, vc4);
 		return ERR_PTR(-ENOMEM);
@@ -609,7 +609,7 @@ static void vc4_bo_cache_time_work(struct work_struct *work)
 {
 	struct vc4_dev *vc4 =
 		container_of(work, struct vc4_dev, bo_cache.time_work);
-	struct drm_device *dev = vc4->dev;
+	struct drm_device *dev = &vc4->base;
 
 	mutex_lock(&vc4->bo_lock);
 	vc4_bo_cache_free_old(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index ab873e27aa0e..6e037fbaa090 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -245,41 +245,37 @@ static int vc4_drm_bind(struct device *dev)
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
-	vc4 = devm_kzalloc(dev, sizeof(*vc4), GFP_KERNEL);
-	if (!vc4)
-		return -ENOMEM;
-
 	/* If VC4 V3D is missing, don't advertise render nodes. */
 	node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
 	if (!node || !of_device_is_available(node))
 		vc4_drm_driver.driver_features &= ~DRIVER_RENDER;
 	of_node_put(node);
 
-	drm = drm_dev_alloc(&vc4_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
+	if (IS_ERR(vc4))
+		return PTR_ERR(vc4);
+
+	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
-	vc4->dev = drm;
-	drm->dev_private = vc4;
 	INIT_LIST_HEAD(&vc4->debugfs_list);
 
 	mutex_init(&vc4->bin_bo_lock);
 
 	ret = vc4_bo_cache_init(drm);
 	if (ret)
-		goto dev_put;
+		return ret;
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		goto dev_put;
+		return ret;
 
 	ret = vc4_gem_init(drm);
 	if (ret)
-		goto dev_put;
+		return ret;
 
 	ret = component_bind_all(dev, drm);
 	if (ret)
-		goto dev_put;
+		return ret;
 
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
@@ -304,8 +300,7 @@ static int vc4_drm_bind(struct device *dev)
 
 unbind_all:
 	component_unbind_all(dev, drm);
-dev_put:
-	drm_dev_put(drm);
+
 	return ret;
 }
 
@@ -320,8 +315,6 @@ static void vc4_drm_unbind(struct device *dev)
 
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 	drm_atomic_private_obj_fini(&vc4->ctm_manager);
-
-	drm_dev_put(drm);
 }
 
 static const struct component_master_ops vc4_drm_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index b1a038df00f3..f8a1426be14a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -72,7 +72,7 @@ struct vc4_perfmon {
 };
 
 struct vc4_dev {
-	struct drm_device *dev;
+	struct drm_device base;
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
@@ -235,7 +235,7 @@ struct vc4_dev {
 static inline struct vc4_dev *
 to_vc4_dev(struct drm_device *dev)
 {
-	return (struct vc4_dev *)dev->dev_private;
+	return container_of(dev, struct vc4_dev, base);
 }
 
 struct vc4_bo {
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 071626ad8551..c4bf96c8cef6 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -314,16 +314,16 @@ vc4_reset_work(struct work_struct *work)
 	struct vc4_dev *vc4 =
 		container_of(work, struct vc4_dev, hangcheck.reset_work);
 
-	vc4_save_hang_state(vc4->dev);
+	vc4_save_hang_state(&vc4->base);
 
-	vc4_reset(vc4->dev);
+	vc4_reset(&vc4->base);
 }
 
 static void
 vc4_hangcheck_elapsed(struct timer_list *t)
 {
 	struct vc4_dev *vc4 = from_timer(vc4, t, hangcheck.timer);
-	struct drm_device *dev = vc4->dev;
+	struct drm_device *dev = &vc4->base;
 	uint32_t ct0ca, ct1ca;
 	unsigned long irqflags;
 	struct vc4_exec_info *bin_exec, *render_exec;
@@ -1000,7 +1000,7 @@ vc4_job_handle_completed(struct vc4_dev *vc4)
 		list_del(&exec->head);
 
 		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-		vc4_complete_exec(vc4->dev, exec);
+		vc4_complete_exec(&vc4->base, exec);
 		spin_lock_irqsave(&vc4->job_lock, irqflags);
 	}
 
@@ -1258,7 +1258,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 fail:
-	vc4_complete_exec(vc4->dev, exec);
+	vc4_complete_exec(&vc4->base, exec);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index f7ab979721b3..65d0dac69b0b 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -168,7 +168,7 @@ static void vc4_v3d_init_hw(struct drm_device *dev)
 
 int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 {
-	struct drm_device *dev = vc4->dev;
+	struct drm_device *dev = &vc4->base;
 	unsigned long irqflags;
 	int slot;
 	uint64_t seqno = 0;
@@ -246,7 +246,7 @@ static int bin_bo_alloc(struct vc4_dev *vc4)
 	INIT_LIST_HEAD(&list);
 
 	while (true) {
-		struct vc4_bo *bo = vc4_bo_create(vc4->dev, size, true,
+		struct vc4_bo *bo = vc4_bo_create(&vc4->base, size, true,
 						  VC4_BO_TYPE_BIN);
 
 		if (IS_ERR(bo)) {
@@ -361,7 +361,7 @@ static int vc4_v3d_runtime_suspend(struct device *dev)
 	struct vc4_v3d *v3d = dev_get_drvdata(dev);
 	struct vc4_dev *vc4 = v3d->vc4;
 
-	vc4_irq_uninstall(vc4->dev);
+	vc4_irq_uninstall(&vc4->base);
 
 	clk_disable_unprepare(v3d->clk);
 
@@ -378,11 +378,11 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 	if (ret != 0)
 		return ret;
 
-	vc4_v3d_init_hw(vc4->dev);
+	vc4_v3d_init_hw(&vc4->base);
 
 	/* We disabled the IRQ as part of vc4_irq_uninstall in suspend. */
-	enable_irq(vc4->dev->irq);
-	vc4_irq_postinstall(vc4->dev);
+	enable_irq(vc4->base.irq);
+	vc4_irq_postinstall(&vc4->base);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
