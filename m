Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46657090E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB090305;
	Mon, 11 Jul 2022 17:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2706902F9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 282835C0162;
 Mon, 11 Jul 2022 13:40:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561216; x=1657647616; bh=Ya
 JyKR4koQ4CUFnFie99J/yX0cJTJA7jHSYG1qH22j0=; b=szg/ogH+PI6g0x/nCJ
 Ro772iD23DcsyISdF7wJQNPlx6l01TTUzgJ2JflaSJacT+O5f+lWzLAqw4zM+F88
 lKqu3JtouPxkHz5RC74cUjsondL5qQpZnsLmf4q6UcnVb+ZF+HgYz2PJLHCATQn3
 DUmihBRi3IxoWLQ3zFvlr7Y4nJYjFuNYah5oXNwsNToMCIXIU42PwNWZ4iGyA1Vy
 FZFKRmTq3f89NZB3YuQhP75a1MqBtXHYc9viQqxyA/yYShlPdYrv+O4/U0SoMnjh
 QxRR3PmFTmtXPimrpx4BkKAbNx1uG+zhi5N6kY8jzVb2+JDi2YyiKjAWqZajxMuH
 4B/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561216; x=1657647616; bh=YaJyKR4koQ4CU
 FnFie99J/yX0cJTJA7jHSYG1qH22j0=; b=pJPfdsK/XYwesYrMxNI4we1E6ibeX
 BL2eNR9FvIAm54qSDWSAUXBagbYrLiA62w7fzfteM0JoB3PkWbUDSaYIp2SvxgkV
 sD0qg3aovY60skVZ9xSZDX717cpukiJ0/9TJjz8PiyntiZ+DOgIUTVKbXhbaDwic
 +VMMQwiZtPMlkwr062BwcC6PvNUcsGuobVlA9U2Tgmu3cHaYhrkhTM+kryUlN236
 PvKyWHynbp59Y7hZ4lcusC65IPGQ9VNoY3by1X4OBAPtKJy90PaNvdcxUAVebd6+
 p1Cnw6QsYNhDnvJpsmQDvWFzxrvIQv7G++7utKw3AO6rOnGrITfFdI5wQ==
X-ME-Sender: <xms:f2DMYtrpoH3wcuwTjHPwdjdU-wh2sR2hAXyHWbrm5T98Ray68WYyBg>
 <xme:f2DMYvqJi_iKF5AMqdjklGegT9m5uxq1u6Kk4fs6AzlM0XYT3_Ssp2JL6vCHBt_uq
 -j17N7jvRchL6WmoTw>
X-ME-Received: <xmr:f2DMYqOzOCfhuTyla6cJbTUkP8Hib52jIMb47m8JfMQksUyRicNMUNjrINcS5qMp3aFrs4RNHfCMH1UADlshPaI3AnST1tFLF9hRZis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gGDMYo5asN3DwNPC4pxN3Eo0HOzqI6dUGPjzNDIG8fjoL279ycmqQQ>
 <xmx:gGDMYs7mnbAl7mCMYNth71_CTqrskObryd8M9T8Q3fXyHHPzbIu42Q>
 <xmx:gGDMYgj2ZvvSjLXFlhEanRtjwkB2_yBI_CxWnlOWJq6Vm2Iqa3BVUA>
 <xmx:gGDMYmQm_JCnQ9JAaZ0qSdcu5Zt-GqEHTxdaY6e54iGVGyHxstVAGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 19/69] drm/vc4: plane: Switch to
 drmm_universal_plane_alloc()
Date: Mon, 11 Jul 2022 19:38:49 +0200
Message-Id: <20220711173939.1132294-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's switch to drmm_universal_plane_alloc() for our plane allocation and
initialisation to make the driver a bit simpler.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  1 -
 drivers/gpu/drm/vc4/vc4_plane.c | 23 ++++++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 03a799ba9ee8..d7cc006b22c9 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1282,7 +1282,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	const struct vc4_pv_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *destroy_plane, *temp;
 	int ret;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a344762d86eb..82a650268f19 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1483,8 +1483,6 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs vc4_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	.set_property = NULL,
 	.reset = vc4_plane_reset,
 	.atomic_duplicate_state = vc4_plane_duplicate_state,
 	.atomic_destroy_state = vc4_plane_destroy_state,
@@ -1496,11 +1494,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_plane *plane = NULL;
+	struct drm_plane *plane;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
-	int ret = 0;
 	unsigned i;
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
@@ -1511,11 +1508,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		DRM_FORMAT_MOD_INVALID
 	};
 
-	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
-				 GFP_KERNEL);
-	if (!vc4_plane)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
 			formats[num_formats] = hvs_formats[i].drm;
@@ -1523,13 +1515,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		}
 	}
 
+	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
+					       possible_crtcs,
+					       &vc4_plane_funcs,
+					       formats, num_formats,
+					       modifiers, type, NULL);
+	if (IS_ERR(vc4_plane))
+		return ERR_CAST(vc4_plane);
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
-				       &vc4_plane_funcs,
-				       formats, num_formats,
-				       modifiers, type, NULL);
-	if (ret)
-		return ERR_PTR(ret);
 
 	if (vc4->is_vc5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
-- 
2.36.1

