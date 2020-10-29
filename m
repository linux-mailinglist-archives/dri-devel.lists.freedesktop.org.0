Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36B29FFA6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B66E9A4;
	Fri, 30 Oct 2020 08:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5744A6E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C30B55807F6;
 Thu, 29 Oct 2020 15:01:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FGRcmC4+CTr3X
 uP9csnxf5aCWsAbiQHvvYN4KkFNZxI=; b=cmbUQx1xE34fSMrubYZPOGQi8ePOr
 8FXA3TZvptl1cGdpkZITMyj7jOT7ndRDjpnsZ0v76GW8lGTnXYT3R4UznWBeoRIg
 yrXujfgAqDn1GyT4Xtf8pyxihetz8fUSnBsDacxW/WUH5U46A6rpftOlSUQpF6M+
 Lyh+NYneJZOBIEOsyHK7QIJFfUtDDU5ZdpI1SubNd4egzcTp+X6xhj6JCrqp/4In
 rU0fG+/JIT3ZeBIzSCmshlry49zwIOfzXRlMYnh7Ey+WcuFh4EVqN7WyRJukL0XU
 U/THztZE1at8IWAWviSF9SYiZh+goU96+esqrOU5h0CDVgLgAXLnVt6mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FGRcmC4+CTr3XuP9csnxf5aCWsAbiQHvvYN4KkFNZxI=; b=kPVODnrj
 UMvPtcbgJP/F83jqFRf8ZtpWlhWllzBEbg1tXq3g2kugVuT+66oP0UnlS+mcOoJ7
 1FUc1CO0pRk+ZekjdyjJ/4f8W/HojfFMQu5fQ726F+adPJn0npz0rIyldG5qH0FX
 epksE2XSXr86LeJOCj/XSieDKePLBz2Xrh+JNMFvsb1DnHacS2IxplINFSaqPVCZ
 8qKxUdMYtZqcO0GWtddkP6lVCuXQzYQfyffkdIMKoYvMlnoR2gLmU+VpNucG56iG
 BJLczZQZOju1Ph0JaVb03gWG6lciRqNH5JsKIO7retlg4Ca4vNCQvNawAb2fsDUR
 eRjPl1hJ7l+HiQ==
X-ME-Sender: <xms:ehGbX97rivW_SXA8vLsqzfmEytCHJ35XDQUZ_xihLkYQ7U5Lwx-kZA>
 <xme:ehGbX679rZhPtfVzyLpRo-gvpXQmHUBsATy-N1Aht-2E_ca8WVcs5vPSnQhHPWKZ8
 K2nk1UjcneCSBs5zN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ehGbX0evxwsYmeHeucghaDudCr6EshJkk_dTIdk4S5Aty6ixdotUeg>
 <xmx:ehGbX2LX1td0o6TldKmij50toSuqUKHYgMSwZqoyscgpo2Ok9qNPfg>
 <xmx:ehGbXxKFl7Ks8WYUkzLEls1gOK5iot7j2-pS8WNYY-PEwS2SlrDuLw>
 <xmx:ehGbX4_37ND76HWOQLStZZiRWNDgrANVgAxVs992pygwwXsV8AA4uQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 348FC3064610;
 Thu, 29 Oct 2020 15:01:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 6/6] drm/vc4: kms: Add functions to create the state objects
Date: Thu, 29 Oct 2020 20:01:04 +0100
Message-Id: <20201029190104.2181730-6-maxime@cerno.tech>
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

In order to make the vc4_kms_load code and error path a bit easier to
read and extend, add functions to create state objects, and use managed
actions to cleanup if needed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c |  3 --
 drivers/gpu/drm/vc4/vc4_kms.c | 78 +++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 6e037fbaa090..08c1cc225045 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -312,9 +312,6 @@ static void vc4_drm_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 
 	drm_atomic_helper_shutdown(drm);
-
-	drm_atomic_private_obj_fini(&vc4->load_tracker);
-	drm_atomic_private_obj_fini(&vc4->ctm_manager);
 }
 
 static const struct component_master_ops vc4_drm_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 708099a24406..fbfb0698073e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -93,6 +93,29 @@ static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
 	.atomic_destroy_state = vc4_ctm_destroy_state,
 };
 
+static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	drm_atomic_private_obj_fini(&vc4->ctm_manager);
+}
+
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
+	return drmm_add_action(&vc4->base, vc4_ctm_obj_fini, NULL);
+}
+
 /* Converts a DRM S31.32 value to the HW S0.9 format. */
 static u16 vc4_ctm_s31_32_to_s0_9(u64 in)
 {
@@ -609,6 +632,34 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
 };
 
+static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
+{
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	if (!vc4->load_tracker_available)
+		return 0;
+
+	drm_atomic_private_obj_fini(&vc4->load_tracker);
+}
+
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
+	return drmm_add_action(&vc4->base, vc4_load_tracker_obj_fini, NULL);
+}
+
 #define NUM_OUTPUTS  6
 #define NUM_CHANNELS 3
 
@@ -711,8 +762,6 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 int vc4_kms_load(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_ctm_state *ctm_state;
-	struct vc4_load_tracker_state *load_state;
 	bool is_vc5 = of_device_is_compatible(dev->dev->of_node,
 					      "brcm,bcm2711-vc5");
 	int ret;
@@ -751,26 +800,13 @@ int vc4_kms_load(struct drm_device *dev)
 	dev->mode_config.async_page_flip = true;
 	dev->mode_config.allow_fb_modifiers = true;
 
-	drm_modeset_lock_init(&vc4->ctm_state_lock);
+	ret = vc4_ctm_obj_init(vc4);
+	if (ret)
+		return ret;
 
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
-
-		drm_atomic_private_obj_init(dev, &vc4->load_tracker,
-					    &load_state->base,
-					    &vc4_load_tracker_state_funcs);
-	}
+	ret = vc4_load_tracker_obj_init(vc4);
+	if (ret)
+		return ret;
 
 	drm_mode_config_reset(dev);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
