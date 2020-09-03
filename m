Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3BE25D211
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EC96EB08;
	Fri,  4 Sep 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228146E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 08195C02;
 Thu,  3 Sep 2020 04:02:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6fdwtjKwmETNW
 XeSJaFFIb/jsDXXZpglybcolLFXiBk=; b=Nu8D74RIVhfQt4NDlBDVxLjnZVYsK
 HCKGGoMFLjCtE1Y4qbPm18raT9TnVWXdk4Uu+yjkk3Ne+++TksUrOvAquHbS9p6e
 QLX1zky/YdIrsOAXEpjgyfxdhlRf5sCYolv++FZzCOolU5MbvRmRQAVJgwvh8US5
 RTP1mRGu8PBR1vq/o+MoYXP/6x4ZiS/x2J0BFsuUp0dtABoVgZu9DJi9k0KkgQjy
 hg4RYbx5w/+MGq72kEMtKT98RBorBfB2SZVtC02xNnbUIsT0vKGZazGfQ4si//e7
 USkrTMW4V/BGMjAh7maOuPrFTL495Dei2+8ZDT61ktHGJgyjSfceYSC0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6fdwtjKwmETNWXeSJaFFIb/jsDXXZpglybcolLFXiBk=; b=LQ1zPpCm
 yxmdLCiPSzV9bqcJH2js9agp0qZCTfj5gymSgSnKs/cgSTVQ+fy0k2fTwdj3wV5z
 ICnrcDfwbcEZKNqhroOy1quY6VvslneACioE7gu1F9Y1jLGwfZBkHa+l2QiA47p7
 4s4DjPMhOgdNpKoLBMAOGrDHyIzZ+uP7Te9rGN8LGhXHZDS2gYMimh8PPbswul1T
 rShx2MxK1xyO2PXFa1GPHWayVnZ/xvDGB7jK8sXz3Q+cyhCMjh8wEzs0wGZpGOnM
 d07qMfBkn2XlBNNKlbGRWJj2r6EskanXfTZ3SbCki6WtghB0BVL5v3DDABacJe5c
 9z/uP4whvf4LJw==
X-ME-Sender: <xms:IqNQX3oIIR0Bo0X7KTqz6dYf7too4u1JK8xvellgijNEahjEhGOgGw>
 <xme:IqNQXxpUHPlzhMqGfyX1HRzM2E0383aIIbdfgWyWuTWmOhbraCuNy6TlfSHnRiJl9
 uykjWpb-P_u_LSrff0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefvd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IqNQX0OD94_Bx--SB3-_LobX8kj9IqWj5yUOlS3ZcjoJNUaDz8OFYg>
 <xmx:IqNQX66B-Axp1AB81ei-INIdmwySiXO4PTC7YYzsqLGLUpjmryAZJQ>
 <xmx:IqNQX25P_XbDa4b3DdIDBmMQ0Jk-pvP8cK0rOA6tfXit-W2iKsccFw>
 <xmx:IqNQX-guUQT7yjDBizhDC-9DZ_FomyWcetk2WOa_Gm-pDpbuEVm1GpLrGKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5411D306005F;
 Thu,  3 Sep 2020 04:02:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 35/80] drm/vc4: drv: Disable the CRTC at boot time
Date: Thu,  3 Sep 2020 10:01:07 +0200
Message-Id: <ad57f1bdeae7a99631713b0fc193c86f223de042.1599120059.git-series.maxime@cerno.tech>
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

In order to prevent issues during the firmware to KMS transition, we need
to make sure the pixelvalve are disabled at boot time so that the DRM state
matches the hardware state.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.c  |  4 ++++
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 4156c5f66877..dfac304fe2b0 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -427,6 +427,31 @@ static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
 	return 0;
 }
 
+int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct drm_device *drm = crtc->dev;
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	int channel;
+
+	if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2711-pixelvalve2") ||
+	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2711-pixelvalve4")))
+		return 0;
+
+	if (!(CRTC_READ(PV_CONTROL) & PV_CONTROL_EN))
+		return 0;
+
+	if (!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN))
+		return 0;
+
+	channel = vc4_hvs_get_fifo_from_output(drm, vc4_crtc->data->hvs_output);
+	if (channel < 0)
+		return 0;
+
+	return vc4_crtc_disable(crtc, channel);
+}
+
 static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 38343d2fb4fb..9567d1019212 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -252,6 +252,7 @@ static int vc4_drm_bind(struct device *dev)
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
 	struct device_node *node;
+	struct drm_crtc *crtc;
 	int ret = 0;
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
@@ -298,6 +299,9 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind_all;
 
+	drm_for_each_crtc(crtc, drm)
+		vc4_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto unbind_all;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 860be019d8e3..1a97545b9244 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -813,6 +813,7 @@ void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
+int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
 int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
