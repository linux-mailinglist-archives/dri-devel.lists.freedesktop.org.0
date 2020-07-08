Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21621219910
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486E76E9CE;
	Thu,  9 Jul 2020 07:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8556E908
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4FBB62F2;
 Wed,  8 Jul 2020 13:42:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RlVVp5ey41A4/
 xHfB5R+NY+MB0nkGXB8vLAeySU6ylg=; b=oVe02zEz2eNtnRU/u6ih82wxAgvvZ
 6kjPbaeldSYzqtsqme0jKR+2qUIK60ucWadgg+VFJdYhhnigMhToLnCH6cdWlzsU
 iaKwoxYdUNPzMfPFnF4TPRfwUjpYpfXepkS//Nr1gMIfjpDztttgzuOd/xsUJ3iz
 E81YaygA5b7M476DQtObUYTsb90L6rRAvHNVP8tF1keA/Sqhy3ouNjGqcYSYJmXc
 w7WKFya33ZJNvgbyylmD5QUhp6vtfmlELkXwopQQt3wv4FBZMjwBmyc9IQrYzLlj
 UFG3dsHNKAlJJ9MF8TwZ9YbCzJbSzn0grxsd9JdoYEVQprHSHK0bLdY5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RlVVp5ey41A4/xHfB5R+NY+MB0nkGXB8vLAeySU6ylg=; b=OAoiTM70
 19Y1PDo24qMLUZEmUWOvhaBka+FIH5lNPbhS3GnBoV8Qq8wsoheFCU2uS5OvL/Qy
 Q7PKl4MS0lPDBC8M4BmDBndnAgey0c7OM6l7CAZnRcSvcYxkUP0xVSBa15owDPeW
 s3JngJMqYDFWauT8p+c7a9lrDSSHMNf3+jr5PHYLVDz0kpnAtem4F8A4A58UQipX
 kc0N4LU/N25Oi3VPT8O+cb9bkSEn8AeBjbKosYoZyjeLjxPZ0jHZPFqEkZ6I5oGU
 rKDQBFfzT0XoWkgA2DUPM6ETqthXWZXW/sQvEJzY9VtkzOXSpKwSZKocDGpApzM2
 zl/s6rl8TDSMbQ==
X-ME-Sender: <xms:iwUGX0M06B2VkYeYJ4S4VH6dNXAhI_3wYbMYEUL-fKMIjvw1Nl1dsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iwUGX6-OjOrrepuhj8CiyoIWUZ88s0e6ZAJxnYFAUmZbJ_InZicFoA>
 <xmx:iwUGX7RSvminUFyVYx9VKr4RDCQy_kBhEQelK9x0_KJAX9NHT2j1Gw>
 <xmx:iwUGX8taKjKbsBcA7mvj5KEULxvatYwKgpVSKRjPdBuHsoI7dH2Otg>
 <xmx:iwUGX6sig-CMKfH5zjlmQV25IzasEezICFavgTCqGEt3DZXUrWLI4S6Wi9U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A03030600A3;
 Wed,  8 Jul 2020 13:42:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 03/78] drm/vc4: hvs: Boost the core clock during modeset
Date: Wed,  8 Jul 2020 19:41:11 +0200
Message-Id: <b04341887fb1acb9ed4adc28d109f9e21f146c7d.1594230107.git-series.maxime@cerno.tech>
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

In order to prevent timeouts and stalls in the pipeline, the core clock
needs to be maxed at 500MHz during a modeset on the BCM2711.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
 drivers/gpu/drm/vc4/vc4_hvs.c |  9 +++++++++
 drivers/gpu/drm/vc4/vc4_kms.c |  9 +++++++++
 3 files changed, 20 insertions(+)

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
index 836d8799d79e..091fdf4908aa 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -19,6 +19,7 @@
  * each CRTC.
  */
 
+#include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/platform_device.h>
 
@@ -540,6 +541,14 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.regs = hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
+	if (hvs->hvs5) {
+		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(hvs->core_clk)) {
+			dev_err(&pdev->dev, "Couldn't get core clock\n");
+			return PTR_ERR(hvs->core_clk);
+		}
+	}
+
 	if (!hvs->hvs5)
 		hvs->dlist = hvs->regs + SCALER_DLIST_START;
 	else
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
