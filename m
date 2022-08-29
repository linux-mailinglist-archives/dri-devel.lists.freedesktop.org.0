Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39C5A4E70
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C40710F274;
	Mon, 29 Aug 2022 13:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC8B10F274
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:47:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1AA3132001E9;
 Mon, 29 Aug 2022 09:47:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780860; x=1661867260; bh=BD
 OWRIP7cNEo6akKf8zKUIRLAS8cBwVhuyWH7ubcHiQ=; b=guPnklBP8G4BfLsifJ
 tZat9l/7KA8GXa7Th809WUJg1pxDQh5v/uD2GCmopgeIcR/i8KKBZ6+fygFas8sj
 9EAUYHUmGa0MGlv6VNI1+hRGyusAZ/1aFRMTsz4covUvU/UUXBoM+ZLMq2s1kX+h
 g1g1PHVczmIdEqdqd71KzXuYpqUVUapE1KyLRZZENTGcsB4zo7ZVtge5hvFSuhWY
 G1eNANVnuHIODIPoNepvVzG8M5iGZvOoOOtdbx1g0B034MoLtF1SgN6k5IKbtIkh
 OL3+F/H9cHZsv1gIeYAhZPvzrTmrhT61mDUc0OAEzT50o/wxOCj1G3SIyDWhMqY7
 iyXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780860; x=1661867260; bh=BDOWRIP7cNEo6
 akKf8zKUIRLAS8cBwVhuyWH7ubcHiQ=; b=VKviNW7x73Y2R9BoGP3ytgKry0aha
 MVbMnmlwu7LY8KrhfpAsCkI1U+39THRE1IFhssw+40XSg/LWMQVdaTIcyAEFmXNZ
 muGE+BDt5BmNn6DsQVh9ruuWDskA4tGRiXetLOfDgK/boc3DR6j7LADD93L6C9U+
 b/6ySURvK0u+A+wwWPn6vKOs7gq69drwBIgBlJaz3dGfhlsuMulJ2dy1HBFBjEpt
 klp2XDSDHb1wLgSfSULUmEkhzghAVQGB8k3EykAxvQHLSvryL8PJr/vKfzKPmzpW
 XtgQgChnnO2zznZ/KaH4EDKKKWni42AJd+kloRftJealG6Xyk713yQ0dw==
X-ME-Sender: <xms:e8MMY0ObNM2Gz4YKgl-7kP8U4diCOFF1joHgaqaAdu9DjUcq5g4Bnw>
 <xme:e8MMY69pniZKrm6ykbo-Gmv1eW-qocTtSu6KQh9XDetmm-rpAvMW9sArISC6Zn-YS
 g6-LdBUHqyC-MdHhJE>
X-ME-Received: <xmr:e8MMY7SRGuudQYNgygyuMxfIAWD-u2i17qjqHNUrXlDBvvp1DFep7a7Tn18U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e8MMY8stC6gcf11GyRnhkVT-3k4At6Kt_ysWtZeOcI2qgmBNSRTksQ>
 <xmx:e8MMY8elThWoFQAQdJtpWr85OYHLjRpwL3ZSf3oCjElmDLEcK7pFRQ>
 <xmx:e8MMYw38x6H8EtW34dPCYTsJZHVDO3mSsSDTGqyvRpayugEfIwRXpg>
 <xmx:fMMMY05XQ76xKhGOWKuNsms_IpK7ic5V_PT7gI0LVtLw2gyyI4K2eQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:47:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 1/8] drm/vc4: hdmi: Constify drm_display_mode
Date: Mon, 29 Aug 2022 15:47:24 +0200
Message-Id: <20220829134731.213478-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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
index 84e5a91c2ea7..4a8c902dbbc8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -335,7 +335,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	if (vc4_hdmi->disable_4kp60) {
 		struct drm_device *drm = connector->dev;
-		struct drm_display_mode *mode;
+		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
 			if (vc4_hdmi_mode_needs_scrambling(mode, 8, VC4_HDMI_OUTPUT_RGB)) {
@@ -709,7 +709,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 }
 
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 struct drm_display_mode *mode)
+					 const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -732,7 +732,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 	int idx;
 
@@ -1077,7 +1077,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1141,7 +1141,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
-				 struct drm_display_mode *mode)
+				 const struct drm_display_mode *mode)
 {
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	const struct vc4_hdmi_connector_state *vc4_state =
@@ -1303,7 +1303,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		drm_atomic_get_new_connector_state(state, connector);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long tmds_char_rate = vc4_conn_state->tmds_char_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
@@ -1416,7 +1416,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	unsigned long flags;
@@ -1444,7 +1444,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 99b0bc1297be..79495ef79f09 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -72,7 +72,7 @@ struct vc4_hdmi_variant {
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
 			    struct drm_connector_state *state,
-			    struct drm_display_mode *mode);
+			    const struct drm_display_mode *mode);
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-- 
2.37.1

