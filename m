Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132D25D1DB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C376EA81;
	Fri,  4 Sep 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986DD6E0DA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5DFBBB74;
 Thu,  3 Sep 2020 04:01:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=QqGZcYvmNlgMu
 X9a38SiS88Q1t5fPVWaEbYQNa0977M=; b=JB+m3fWsL+O2BERJYzfnKf4cr9JmP
 8GYos7Yafx7oJTvMVwqlkQDex3zHKNxmWSDQpbEzJDwN3SKvx8lwJKnb1nvMBdkm
 YEE8ra05NFz5VPYBjHALMDsfYGoW836vKiMs4Hq8s/N7ju6pegAtUAsxI1pgwdbx
 1w7fVFG+cf7KvqHNyQv88k3RzGJCTdcGY8dl1pgYWGGV9OcrGplHCk3tRIjNXnno
 fs6ijv3aKtVssjWxO61JUq9bHu4w+BaTWiRUuEakOPgOhzIwV0Q+ISQoMcKHuqyV
 UrI6EbQEytlYqvSQw4imTgfVf7Qgq2e+yo4fq7fauDNyhHmU37DmF/AeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=QqGZcYvmNlgMuX9a38SiS88Q1t5fPVWaEbYQNa0977M=; b=OJJPc5MN
 GOKZiy3uazbr0uw9XDLAsLaFqXRQVBF68LSi5BAG4oijxSASrvSyZ2Qpj/9ujP2t
 uRjuRnW5wRwkx4Kh35dn/NsgH5sKf2YTn9iRA5K0ilp79N1lW6DRD23p0YzB7VVg
 QzZ9j95b2/0/Zn/dzR2gKFfc4Zld+pSpn/5Wxrp1RyNy0WxLydIn09J+wQX01RPf
 rINEBKJoZGPWWpiQjMaPADAjpd6WDVwKvxzYAFbHwApkU1gtd2ctT6TXn8ssvphG
 Ed6G7G51qK5QEaBrNxBMpyJVBGbXBqxUwPJrgS+9e3ryZME8myUBBluOODRZ9mv8
 j2e0SiuaBRcYEw==
X-ME-Sender: <xms:9qJQX5oT2TrfuhaGjQXUkEu25l8eJhfcHJ9pm1yeo2Ea_H9MmM7tVw>
 <xme:9qJQX7rQ9_uwLcKW2S83Or3Ess0djSuyJpMXR3VksicEloxkNYQnRd8GEYkiZ2BHt
 UhbdwBHrNZd7xyEFZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9qJQX2NT45wOkzo1ljg1qdBeYStxlpqKaf9-Kv_5rtAyEIraQ4SMVQ>
 <xmx:9qJQX07f3AdfmVTQN1IdDUrE3pdGPfqvtDElcsSbGSxXwgVBGsC-xQ>
 <xmx:9qJQX47s1oXlpGKMLlPfAvFfJalzOcFQZVf-XNzi-kXgBjbEbXpnXw>
 <xmx:96JQX4i9Gm7Y-Rc8iNYQYH9iPKnDyLHUiMAX0L4rX8HRMY_PZgCVKy5c7GA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9229D3060060;
 Thu,  3 Sep 2020 04:01:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 03/80] drm/vc4: hvs: Boost the core clock during modeset
Date: Thu,  3 Sep 2020 10:00:35 +0200
Message-Id: <37ed9e0124c5cce005ddc8dafe821d8b0da036ff.1599120059.git-series.maxime@cerno.tech>
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

In order to prevent timeouts and stalls in the pipeline, the core clock
needs to be maxed at 500MHz during a modeset on the BCM2711.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
 drivers/gpu/drm/vc4/vc4_hvs.c | 18 ++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_kms.c |  9 +++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e4cde1f9224b..6358f6ca8d56 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -320,6 +320,8 @@ struct vc4_hvs {
 	void __iomem *regs;
 	u32 __iomem *dlist;
 
+	struct clk *core_clk;
+
 	/* Memory manager for CRTCs to allocate space in the display
 	 * list.  Units are dwords.
 	 */
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 836d8799d79e..abdb43c4cc10 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -19,6 +19,7 @@
  * each CRTC.
  */
 
+#include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/platform_device.h>
 
@@ -540,6 +541,20 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.regs = hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
+	if (hvs->hvs5) {
+		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(hvs->core_clk)) {
+			dev_err(&pdev->dev, "Couldn't get core clock\n");
+			return PTR_ERR(hvs->core_clk);
+		}
+
+		ret = clk_prepare_enable(hvs->core_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
+			return ret;
+		}
+	}
+
 	if (!hvs->hvs5)
 		hvs->dlist = hvs->regs + SCALER_DLIST_START;
 	else
@@ -624,6 +639,7 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 {
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
+	struct vc4_hvs *hvs = vc4->hvs;
 
 	if (drm_mm_node_allocated(&vc4->hvs->mitchell_netravali_filter))
 		drm_mm_remove_node(&vc4->hvs->mitchell_netravali_filter);
@@ -631,6 +647,8 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 	drm_mm_takedown(&vc4->hvs->dlist_mm);
 	drm_mm_takedown(&vc4->hvs->lbm_mm);
 
+	clk_disable_unprepare(hvs->core_clk);
+
 	vc4->hvs = NULL;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 08318e69061b..210cc2408087 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -11,6 +11,8 @@
  * crtc, HDMI encoder).
  */
 
+#include <linux/clk.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
@@ -149,6 +151,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc;
 	int i;
 
@@ -160,6 +163,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
 	}
 
+	if (vc4->hvs->hvs5)
+		clk_set_min_rate(hvs->core_clk, 500000000);
+
 	drm_atomic_helper_wait_for_fences(dev, state, false);
 
 	drm_atomic_helper_wait_for_dependencies(state);
@@ -182,6 +188,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 
 	drm_atomic_helper_commit_cleanup_done(state);
 
+	if (vc4->hvs->hvs5)
+		clk_set_min_rate(hvs->core_clk, 0);
+
 	drm_atomic_state_put(state);
 
 	up(&vc4->async_modeset);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
