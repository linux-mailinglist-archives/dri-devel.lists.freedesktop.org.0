Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF96341D4F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189ED6E9C4;
	Fri, 19 Mar 2021 12:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFB86E9C4;
 Fri, 19 Mar 2021 12:49:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7455E5808F4;
 Fri, 19 Mar 2021 08:49:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Mar 2021 08:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3nEck07EZJHTN
 gemnzC1zjsTWu9gbN68lVh8DZ7b0Vo=; b=nhJFT8zaqYTadrIZwOEIMoCwD15hP
 hjxjvcYMoD0uM73bdVpEs53JQedhFjtWwbYwhGvBK+9XmlW2Q4/0YnJCvvfLH/Pf
 NWjnk+22ndHJm36ZNJHUBFe1iT5DuqT2LJEItRpjMe61bF2Tm9ns3TN2By212Kp9
 30bzb8PpC0N1/d2eyoS4v74rV08wM5o+BV15lHALOeskjBRvuVg5cweWzJzwA3Pe
 RGy0T5KBMYj71dCahF7U2F9CLroWZZ0IcPuTWZj5fDMfSI8MRF/lZctALr7ZLwJJ
 pI0HOryLt6RW8Ftd/jHMQYGjn9M5AILT5+TxrCudLVr1dPK6g4fB7hqZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3nEck07EZJHTNgemnzC1zjsTWu9gbN68lVh8DZ7b0Vo=; b=ce8sYtdP
 vk348SJjrmI+jThILoIs1uhZAveod3QWaRWfK4aGvAt5crIjKfvioMxlkRYOc7GG
 BOyIYE7Lo/WIaYzsUaxu7nnFwsq6mEjwuSC4iAHPLAuYSi+rfHJcCWWKO7Y0eJeI
 0Sq36C29hoP0FGTK1bpuXkLaCJExgVmwrS+7AaMnaWy4NzJMyMETcO3mbpEk6N8x
 VmWKxVM5qkO+nHt1QqGAZqhou8EIcvE1fCXVEWM+6dyhwG6Sr+GUy4Xm/HUVCxO6
 j5SQK1Zi6NKM75Ol+Pl1aAd4Y+3003RWzqk6hQQh5YvlbATQmDdYKHU5qW5uMDfT
 HCPKJebOG8QCNg==
X-ME-Sender: <xms:2p1UYPPUss4W0GqBHp5EMLjpJagw3Xez-5FBBW--Rn-KpRt1nVDYaQ>
 <xme:2p1UYJ8Zcf_0GBSqa8xkbXj1K_gVesJSkk1FKnO-c-Ance9AhF5I2yjcXEcQEr22K
 cSe7hA22bupry910pI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2p1UYOQaIdgH916ZCx2h2OBUI-Mgp36wdjNAkXXC2GJDF8fFcxSFpg>
 <xmx:2p1UYDu3VItZjqG6c-1qHwe14WrU97UuYbYRm3rQDyPxrsQjm_c2zw>
 <xmx:2p1UYHfKWMBHWNdAiMGmUXj8rOtrDiCNvf9aBAhuQMuQys2SeL-C_w>
 <xmx:2p1UYKl2_zHteAHVR9oJWjd5yfcqZJ7F-I-zMH1VgomJZP00f2Twqw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C66851080054;
 Fri, 19 Mar 2021 08:49:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/vc4: Add HDR metadata property to the VC5 HDMI
 connectors
Date: Fri, 19 Mar 2021 13:49:22 +0100
Message-Id: <20210319124922.144726-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319124922.144726-1-maxime@cerno.tech>
References: <20210319124922.144726-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Now that we can export deeper colour depths, add in the signalling
for HDR metadata.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eee9751009c2..c8846cf9dd24 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -214,6 +214,31 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
+static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
+					  struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = new_state->crtc;
+
+	if (!crtc)
+		return 0;
+
+	if (!drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed = true;
+	}
+
+	return 0;
+}
+
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	struct vc4_hdmi_connector_state *old_state =
@@ -263,6 +288,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
 	.get_modes = vc4_hdmi_connector_get_modes,
+	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
@@ -299,6 +325,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	connector->interlace_allowed = 1;
 	connector->doublescan_allowed = 0;
 
+	if (vc4_hdmi->variant->supports_hdr)
+		drm_connector_attach_hdr_output_metadata_property(connector);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
@@ -432,6 +461,25 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 	vc4_hdmi_write_infoframe(encoder, &frame);
 }
 
+static void vc4_hdmi_set_hdr_infoframe(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector_state *conn_state = connector->state;
+	union hdmi_infoframe frame;
+
+	if (!vc4_hdmi->variant->supports_hdr)
+		return;
+
+	if (!conn_state->hdr_output_metadata)
+		return;
+
+	if (drm_hdmi_infoframe_set_hdr_metadata(&frame.drm, conn_state))
+		return;
+
+	vc4_hdmi_write_infoframe(encoder, &frame);
+}
+
 static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -444,6 +492,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	 */
 	if (vc4_hdmi->audio.streaming)
 		vc4_hdmi_set_audio_infoframe(encoder);
+
+	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
 static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
@@ -2101,6 +2151,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 	.channel_map		= vc4_hdmi_channel_map,
+	.supports_hdr		= false,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
@@ -2128,6 +2179,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
+	.supports_hdr		= true,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
@@ -2155,6 +2207,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
+	.supports_hdr		= true,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..060bcaefbeb5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -99,6 +99,9 @@ struct vc4_hdmi_variant {
 
 	/* Callback to get channel map */
 	u32 (*channel_map)(struct vc4_hdmi *vc4_hdmi, u32 channel_mask);
+
+	/* Enables HDR metadata */
+	bool supports_hdr;
 };
 
 /* HDMI audio information */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
