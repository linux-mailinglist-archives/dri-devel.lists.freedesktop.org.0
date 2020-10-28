Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50A29E5F7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901C6E867;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F06E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A22A58014D;
 Wed, 28 Oct 2020 08:41:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=63HENL6hLTTGl
 PuMj9W1F2N99G0lJ9X4hlOMFTXOO1k=; b=RcBwpDbwiJI/auP1E/ZDjTYS3juKL
 PvxHG4dG9eDw83zSJKc8M4AoXnErMMfAU7kLIH2ySQX9E1BV4Kz3f3NxuokaUAQO
 Ro1W/0gHwbd5X5vMj+TYyv3FFJUzjW/QYmPf6Zbm8+oqKiXYpQT+oNu5EI+BT9bM
 NvcYi0MbtpTzlsYRwEanJQigpmsQ8NQ0Y3gcHSFoUaEll9EnLjgq1wdjWUs2s45i
 g+G9UDUrQQmNwgcXACR9/PRgvhlw2BELbMAIM5I4sqJl0jJP4GH6d04eqqkg47JA
 p251k9dnqIVk61F43gtI2J5dGNthNi4HFO47iZkkmw0Jh/IwlkCN5E/BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=63HENL6hLTTGlPuMj9W1F2N99G0lJ9X4hlOMFTXOO1k=; b=nx725qkI
 +dp9RNDUTCUXn006C5GcDrgfqCPb8/8nX6qdtH1jWsPALOjWIyNsBcnF7JE2ZeDO
 NVwzcATreNTTr4epEfOxdyRfsH2VYJs/CHoWLNvJ5M5tB5WHdxwbInDOJFFJuZkd
 x2EIER8FnEEiG1jJj5Vc9oSwRjixAHtWScJu7n9/WOAy8+caIFr1glVc/9CghXNX
 Vg3aFfFTOMrSo+9TLblKD7dV8dD0QCehBunGQOA36wlzdmcTpySCyN+hczaP1UfN
 W0EC+U3w/Q1zhAzFVz5qzexfaEJ5Bu9QfvG13aQs/GMg4HVzFSiv7HD6mIZxYkZ3
 PJdMW+htIdTu/w==
X-ME-Sender: <xms:6GaZX1LDj2Gtu4zi22LQTbx2iAu9GIixzMqypvo6KIgMvqrLs0Nf_g>
 <xme:6GaZXxLyPye84hCp-S8QaVeI-qfA0yc1g1xtel2SyaLmomXfq6IPGJ-QnAUz37t5_
 oNCqufS9TSo_-mYSRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6GaZX9uVruUIX0NbVB992NCd7BO2b3Fw8gY-kR98sSTNUk1q-jrtXw>
 <xmx:6GaZX2b8v_okKqgTBtWMDIlS1JnbiVPT8w6YmM6szg5ekyhRfmywFQ>
 <xmx:6GaZX8bfzZ5jlbILgtg2-CEJYqETXAxw3hAEl1SubLnCeGYHuVjyOw>
 <xmx:6WaZX5K8dgCcOFOSgLUpzwP-4ZjWmIN0qdm71jiBrdMMHyNarJqUtg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A29003280059;
 Wed, 28 Oct 2020 08:41:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 5/7] drm/vc4: kms: Add functions to create the state objects
Date: Wed, 28 Oct 2020 13:41:02 +0100
Message-Id: <4554645c4f884252c4f0b3a45ed457aa9bbb3d13.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to add a new private state, so let's move the previous state
function creation to some functions to make further additions easier.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 70 +++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index b0043abec16d..2cac556f7799 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -95,6 +95,27 @@ static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
 	.atomic_destroy_state = vc4_ctm_destroy_state,
 };
 
+static int vc4_ctm_obj_init(struct vc4_dev *vc4)
+{
+	struct vc4_ctm_state *ctm_state;
+
+	drm_modeset_lock_init(&vc4->ctm_state_lock);
+
+	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
+	if (!ctm_state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(vc4->dev, &vc4->ctm_manager, &ctm_state->base,
+				    &vc4_ctm_state_funcs);
+
+	return 0;
+}
+
+static void vc4_ctm_obj_fini(struct vc4_dev *vc4)
+{
+	drm_atomic_private_obj_fini(&vc4->ctm_manager);
+}
+
 /* Converts a DRM S31.32 value to the HW S0.9 format. */
 static u16 vc4_ctm_s31_32_to_s0_9(u64 in)
 {
@@ -611,6 +632,23 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
 };
 
+static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
+{
+	struct vc4_load_tracker_state *load_state;
+
+	if (!vc4->load_tracker_available)
+		return 0;
+
+	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
+	if (!load_state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(vc4->dev, &vc4->load_tracker,
+				    &load_state->base,
+				    &vc4_load_tracker_state_funcs);
+
+	return 0;
+}
 
 /*
  * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
@@ -745,8 +783,6 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 int vc4_kms_load(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_ctm_state *ctm_state;
-	struct vc4_load_tracker_state *load_state;
 	bool is_vc5 = of_device_is_compatible(dev->dev->of_node,
 					      "brcm,bcm2711-vc5");
 	int ret;
@@ -785,30 +821,22 @@ int vc4_kms_load(struct drm_device *dev)
 	dev->mode_config.async_page_flip = true;
 	dev->mode_config.allow_fb_modifiers = true;
 
-	drm_modeset_lock_init(&vc4->ctm_state_lock);
-
-	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
-	if (!ctm_state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(dev, &vc4->ctm_manager, &ctm_state->base,
-				    &vc4_ctm_state_funcs);
-
-	if (vc4->load_tracker_available) {
-		load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
-		if (!load_state) {
-			drm_atomic_private_obj_fini(&vc4->ctm_manager);
-			return -ENOMEM;
-		}
+	ret = vc4_ctm_obj_init(vc4);
+	if (ret)
+		return ret;
 
-		drm_atomic_private_obj_init(dev, &vc4->load_tracker,
-					    &load_state->base,
-					    &vc4_load_tracker_state_funcs);
-	}
+	ret = vc4_load_tracker_obj_init(vc4);
+	if (ret)
+		goto ctm_fini;
 
 	drm_mode_config_reset(dev);
 
 	drm_kms_helper_poll_init(dev);
 
 	return 0;
+
+ctm_fini:
+	vc4_ctm_obj_fini(vc4);
+
+	return ret;
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
