Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10705747FC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1DC18AFE9;
	Thu, 14 Jul 2022 09:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E27018B0C9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BDF2C32008FE;
 Thu, 14 Jul 2022 05:12:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 14 Jul 2022 05:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789979; x=1657876379; bh=nC
 YDIlqrQCLx2B7lcbY2DzA4PXh14e5ZeLT8TifelkM=; b=YcKylzhMC136+R/2fE
 /Dcx8v13isPWpu8uPMA6q/3PsPJpRT33KZlilqqoPag8+WMf9HqDvogMrkSB9pSW
 zSXykQzma7nUPnb2j9FzZwWFkfUPdKM9ZEM6MnBQz3VNnVxBc3sfIQSGAUkhSSmV
 YwszBj7xxnOS6sVL+6Dls9sfu7BR9PDySmh1OKJZTwLQUIxRxs/mBiOUrAvW2ZfP
 djBSCh5i/jZFxkG5NFQpZbtq2z1NvDO5+gotJo5RCQl87UqtFwlOd9Jov1Aqdido
 cmYO77oGCyU37Gdn7sYqguC07tc/DmSOZvbU/2NUM0Jtlm1Lb8KWxnDaTUNeI/pR
 mwKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789979; x=1657876379; bh=nCYDIlqrQCLx2
 B7lcbY2DzA4PXh14e5ZeLT8TifelkM=; b=2lajLh2liGEDz6cgjUUChBFY6JdSm
 xwBOQleF9rKZ0jDhnFDUvpHMYlFlXMvPzgxvDa5ymHK0HKUCZmFgGwI5AZEwSgJ2
 vQ8yhosrG0UQmAnG26g0gqX6uc/3ccblF0DivgjKNHteRrn1rHTPQUGOI40hS27u
 4NbelH1ldOvqQyr+g/srpDnwfhcH5YgYh9zELTnPv0flaP3ATUwW9/X6PE3XE1yr
 IMAAjq0RhBvqQgWClD6LC01em8E2t3Jhk8m5Ih98g2vWX9VvMAPd762t3WKSx06E
 eMmarBbbMCxj37r9Ur1n74iYqjIfr8C8kZg3FyMhrub19DElvwBvOV9mQ==
X-ME-Sender: <xms:Gt7PYuCUOSrWfNASOdbOyrP53xMAUk-r7kDYAKq_DrQ5OirjtQf1BQ>
 <xme:Gt7PYoi_u3zuQR1vym0aKb-vc1Nk0_BUB35KTYOemZ60F8e5EjVr0M1Yx3ACAglYk
 pikEzSbxbNl-vKRcmA>
X-ME-Received: <xmr:Gt7PYhkVxUKAOgsCe6dwFHQKMW9iRYqUrjjePE6SUmqZRZnQNLcw4d67FcewrQlALuZXoWWEkgCY0kZ7PFheM5vPVHfQapsECAUrJZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gt7PYszdzeQYOAxbQVRN5ZQfaiB2SP08Gpyv8ny-CN7UoGCVfNttiQ>
 <xmx:Gt7PYjR8QP03ixwdSST0yem01XmjaqA39dYkZupZBN6LcO7MVULKhQ>
 <xmx:Gt7PYnY24twG1_Pcr0bk1pTM0XjY3MiTCkCOStIKUyr7fFs7H9Z_AQ>
 <xmx:G97PYo8JhtFDgIniHozjUwbiuqSTSGo9WaXql3RsVFOXxchv8e0Hcg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:12:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 1/8] drm/vc4: hdmi: Constify drm_display_mode
Date: Thu, 14 Jul 2022 11:12:45 +0200
Message-Id: <20220714091252.2089015-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't modify the drm_display_mode pointer we have in the driver in
most places, so let's make them const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3b75ac6fa0db..adcc2d3918f1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -295,7 +295,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	if (vc4_hdmi->disable_4kp60) {
 		struct drm_device *drm = connector->dev;
-		struct drm_display_mode *mode;
+		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
 			if (vc4_hdmi_mode_needs_scrambling(mode, 8, VC4_HDMI_OUTPUT_RGB)) {
@@ -651,7 +651,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 }
 
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 struct drm_display_mode *mode)
+					 const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -673,7 +673,7 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -975,7 +975,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
@@ -1032,7 +1032,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	const struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
@@ -1179,7 +1179,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		drm_atomic_get_new_connector_state(state, connector);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long tmds_char_rate = vc4_conn_state->tmds_char_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
@@ -1283,7 +1283,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	unsigned long flags;
@@ -1304,7 +1304,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index c3ed2b07df23..b3f404ca94b6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -71,7 +71,7 @@ struct vc4_hdmi_variant {
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
 			    struct drm_connector_state *state,
-			    struct drm_display_mode *mode);
+			    const struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-- 
2.36.1

