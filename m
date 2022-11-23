Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B536363B3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE710E59A;
	Wed, 23 Nov 2022 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151410E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:30:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BFEBF2B069B3;
 Wed, 23 Nov 2022 10:30:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Nov 2022 10:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217421; x=
 1669224621; bh=JATl2qhr/RFfgqDqkRZKh+3K38ne/hZ5dmlydDeuhjA=; b=d
 2gvJo/leKNNGU1zZC7oyFKSTD4B+1TZz8PEcIpcOmKNBjrdWoxpQP7XhqzZrtxGW
 stHer8rDi2teHfPdC8gZz7m2IhwC1K8I5eO1/4jrpmvUgkc7yFM+n2DuEVZ5p8bH
 ID+E9ciGUHfplK0+it5Mqxwi7J4m85hm3uKNe7Bdzym90wSak1RNDEZtNk9VcjL0
 HvuVkMhTyENCbzG7khs5VOwOl7hR+Yj8bX4j5/QMnMAlkXzy/3jjSDTBoDnMYiWs
 LbxdIHYVx4NQk1y3nwL5HOAp5q/SfPnH9sHDQzSPXYkoZGscEnb0VoaJ5Ibs54xS
 DQdO2BjUsoSrRbmS0L8Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217421; x=
 1669224621; bh=JATl2qhr/RFfgqDqkRZKh+3K38ne/hZ5dmlydDeuhjA=; b=K
 EvphMPzG32dJH3dVYiPy5PTo7fCpCEQijLkPbP+zvRa+7h7W/B/hdHfo58IAjMFC
 3UHmGS2yrDGWBI+uumiXJ/QIexZxXg6CS18Zcn3XlwaG95LlguD6lqYSMUdGWtnm
 e3KPYyTaGmJf7tBFDYqWXN5l5n2xe2CsoqRYVtjkAnDdvuHv8jgPLakhgUvDlEj8
 fb1mF7Qf1rjdLvgn7YgxlpZ3mdLDXiIc53UgbMlBHfgfUnu0F6tv1si/e8xDHEXK
 nuzp+Dvs1ojlbscmrcnwbqdcOQnp+JpJ4qrtd3ZICJgKIhsVTjJ7I6p+2SiKNvgK
 iqpj3qmUNi8GrF4wAYXMw==
X-ME-Sender: <xms:jTx-Y12x8ntzbKZOm5sWk06nRA3tn_OP--XfZJwKNKyDfiVhPBeMrg>
 <xme:jTx-Y8EuYUGAgkKssRZOdbXRpkBWx5BZLk6ZvYIcMU-nMNo2SRemuTLHyR6yKucQN
 CuwZ3bKbHrg36eyRko>
X-ME-Received: <xmr:jTx-Y16mrpUWrVpnNCoBoH8SkaSwfArhXxIenobCGCyMfPSXCzq1Wm20EBzdcue35jrioVT6mNlWLYj5L6MFuqbAxdqmgcUZjxAEZWdlskNfbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jTx-Yy22YMyya6qBrg9apA_5bAGx_xYXBp9NaIUU9NFSjSyYAxZ1PQ>
 <xmx:jTx-Y4HDmRyBrQ5EPRq0mc1bfkjqRTuJ6zc2dF5ImE5RAI2o6JMahQ>
 <xmx:jTx-Yz_A8OwluGs3LrUGCyKVeDxYPtrqsAt_piPgLf4_wTHzJ87ZFg>
 <xmx:jTx-Y6nvKxMfxpiWJ-h0RQSwG8lsyoHyNr-EDh7CJwGDCMkfsL9wn0Jpwxk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:30:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:26:03 +0100
Subject: [PATCH 21/24] drm/vc4: hvs: Provide a function to initialize the HVS
 structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-21-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4822; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EMemUBe66KSq5rc8ZBbOyen0nlUmdwgeEwccgFMU3X0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11jWM39YKFrbNsTc8Gb5e2PjVsh7n9F3dm1sLgx/2fVg1
 0/F0RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZydhYjQzPjJ5tw/v9dO9UFZyw9HL
 hFaKsWq+mc5bdPlWd1fX71kY/hJ2Ok7pbzl+0Vu3uC3EoL/XnSPzrUzVv+wWyf29SWxxrZPAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to initialize the HVS structure without a backing device to
create a mock we'll use for testing.

Split the structure initialization part into a separate function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 81 +++++++++++++++++++++++++------------------
 2 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 54352db48476..e0be7a81a24a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -1009,6 +1009,7 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev);
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c4453a5ae163..94c29f8547bb 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -768,22 +768,60 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 	return 0;
 }
 
-static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	struct vc4_hvs *hvs = NULL;
-	int ret;
-	u32 dispctrl;
-	u32 reg;
+	struct drm_device *drm = &vc4->base;
+	struct vc4_hvs *hvs;
 
 	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
 	hvs->vc4 = vc4;
 	hvs->pdev = pdev;
 
+	spin_lock_init(&hvs->mm_lock);
+
+	/* Set up the HVS display list memory manager.  We never
+	 * overwrite the setup from the bootloader (just 128b out of
+	 * our 16K), since we don't want to scramble the screen when
+	 * transitioning from the firmware's boot setup to runtime.
+	 */
+	drm_mm_init(&hvs->dlist_mm,
+		    HVS_BOOTLOADER_DLIST_END,
+		    (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END);
+
+	/* Set up the HVS LBM memory manager.  We could have some more
+	 * complicated data structure that allowed reuse of LBM areas
+	 * between planes when they don't overlap on the screen, but
+	 * for now we just allocate globally.
+	 */
+	if (!vc4->is_vc5)
+		/* 48k words of 2x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
+	else
+		/* 60k words of 4x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
+
+	vc4->hvs = hvs;
+
+	return hvs;
+}
+
+static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = NULL;
+	int ret;
+	u32 dispctrl;
+	u32 reg;
+
+	hvs = __vc4_hvs_alloc(vc4, NULL);
+	if (IS_ERR(hvs))
+		return PTR_ERR(hvs);
+
 	hvs->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(hvs->regs))
 		return PTR_ERR(hvs->regs);
@@ -835,29 +873,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	else
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
 
-	spin_lock_init(&hvs->mm_lock);
-
-	/* Set up the HVS display list memory manager.  We never
-	 * overwrite the setup from the bootloader (just 128b out of
-	 * our 16K), since we don't want to scramble the screen when
-	 * transitioning from the firmware's boot setup to runtime.
-	 */
-	drm_mm_init(&hvs->dlist_mm,
-		    HVS_BOOTLOADER_DLIST_END,
-		    (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END);
-
-	/* Set up the HVS LBM memory manager.  We could have some more
-	 * complicated data structure that allowed reuse of LBM areas
-	 * between planes when they don't overlap on the screen, but
-	 * for now we just allocate globally.
-	 */
-	if (!vc4->is_vc5)
-		/* 48k words of 2x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
-	else
-		/* 60k words of 4x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
-
 	/* Upload filter kernels.  We only have the one for now, so we
 	 * keep it around for the lifetime of the driver.
 	 */
@@ -867,8 +882,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vc4->hvs = hvs;
-
 	reg = HVS_READ(SCALER_DISPECTRL);
 	reg &= ~SCALER_DISPECTRL_DSP2_MUX_MASK;
 	HVS_WRITE(SCALER_DISPECTRL,

-- 
2.38.1-b4-0.11.0-dev-d416f
