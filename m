Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3F6ABD49
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418DC10E21E;
	Mon,  6 Mar 2023 10:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582410E21E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:47 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B4D625C0249;
 Mon,  6 Mar 2023 05:49:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Mar 2023 05:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678099786; x=1678186186; bh=IRi/LV6dR8lxjkA56/olwYNpNudyHVuxQ5u
 n23PSJmk=; b=O0qMAI3CFX02TrHrskAcIzTj4s1M/Lme9/CATwLmL56AYEk05U1
 AXcjAoJ1+4aPch+U/a/vovjo+SQVn5L6JKH8cqVleXedSaNF1bdBh+ey/MDMY952
 qBNiCPa+iyxoxsMiEIxtEyE3Q74Jw5m9cT6zpUjsHQwNyPS2jSRQ4dC8YXuCwvB7
 5O2Rjl4IIypGRPC3JdcfQtbsR3sbAiTJG8zHEXinis7MwxB34kzQVkLzbwespET3
 TcIWQjJv3PLyCePvdx5AroqFkp9Y2RmKaihiFZEHIApLAPEFl4XUeGVBqLoznzFf
 Zuvk20USuAu+WV8B0hFT5N8EdANg0MKIuWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678099786; x=1678186186; bh=IRi/LV6dR8lxjkA56/olwYNpNudyHVuxQ5u
 n23PSJmk=; b=UzEEQbro2pZqrtjCmze/pM3+ebSPUIToDN+cZh50IsDwG+t6hcg
 /qrX9QCVKazDnqq+Lt1oNfUv6xeQwKBgAeMe4LcB3UwgbNfBGL2hUPvTm5fuzF/y
 AycVnrB4X+MyvbwOpxOtrOxNplqFSuek8RTMCpvymsf2cYnRNXYxduTuqVVE3bfz
 u+S8IYG8eMuspQsKmk0Gwe48j3GpIEW+aZmuyOmowYF+G/lP4HIqY7GR6qy+vSMX
 s7Q/nvVj51bmnxVWuuRHEGdRtcMY9R8Ogq5gTL4CbxnFRMNtV4rQDyAZZSPxFGC1
 piZNkPba8i5pXe3OSbqVQdRhGGHk/T+vaAw==
X-ME-Sender: <xms:SsUFZNAKkL-yCMoGdYW0DtmdPhHft6o_RorhyOO2HezjIYqwkWWj9Q>
 <xme:SsUFZLiWwZkbrakomZ5ilHusaSRrxHJ09UPcRCd-iRYsYRURjzdmxgileugGap37t
 kycoyoFjqG4TsAOTOo>
X-ME-Received: <xmr:SsUFZInU1t0MLXa5iqSGBCoXOgBXkod1SaWst77GGCSLVPFoqVzY6UNEa9CPDhdu9cQyeFuxJhm3tPZ4ixgrK8hici0T9Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SsUFZHwAm3jnJHLe9PV8Sl2rjAkuknTfmKKv6-arHqUeUvsS994lKg>
 <xmx:SsUFZCRhAtPQNwNr0OCV28qjeRRm4rnpWwAv9qGeZdw9pv0quIDndQ>
 <xmx:SsUFZKZQYEE2VszaiN6tLOWqa1Z58O5Wdzy5H6Uu6WgBDr8vZ6WMzg>
 <xmx:SsUFZLDUMlaxNZ_yBJLhSWC3i6VBsFL--jLWWQCXT0YYiwwzBw5V8Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Mar 2023 11:46:44 +0100
Subject: [PATCH v3 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v3-3-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9122; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=94Ur22Wx0ZTY8UhfX5QQ+W5gUZBJJLtQgSWEMZgujjQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6ZnuN2eVSs2Yavl2glN/hMjjk67HBm2i9nvJd9nCTZt
 C9/vHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI20eG/6G1FrFOqenV0x00Jnkan2
 2rmNMk/F5PxvDqDBHX/3cer2RkOKR5yWvvL1XN/N73ax16vvbc03O++sNjE6vGkq7QKf8NeQE=
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Copy Intel's "Broadcast RGB" property semantics to add manual override
of the HDMI pixel range for monitors that don't abide by the content
of the AVI Infoframe.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 97 ++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h |  9 ++++
 2 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 522cfbc83fe4..d23c0c3df2ee 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -154,10 +154,16 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 }
 
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
-				       const struct drm_display_mode *mode)
+				       struct vc4_hdmi_connector_state *vc4_state)
 {
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
+	if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
+		return false;
+	else if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
+		return true;
+
 	return !display->is_hdmi ||
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
 }
@@ -528,8 +534,12 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 {
 	struct drm_connector_state *old_state =
 		drm_atomic_get_old_connector_state(state, connector);
+	struct vc4_hdmi_connector_state *old_vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(old_state);
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
+	struct vc4_hdmi_connector_state *new_vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 
 	if (!crtc)
@@ -562,6 +572,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	}
 
 	if (old_state->colorspace != new_state->colorspace ||
+	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;
 
@@ -575,6 +586,49 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
+					   const struct drm_connector_state *state,
+					   struct drm_property *property,
+					   uint64_t *val)
+{
+	struct drm_device *drm = connector->dev;
+	struct vc4_hdmi *vc4_hdmi =
+		connector_to_vc4_hdmi(connector);
+	const struct vc4_hdmi_connector_state *vc4_conn_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
+
+	if (property == vc4_hdmi->broadcast_rgb_property) {
+		*val = vc4_conn_state->broadcast_rgb;
+	} else {
+		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
+			property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
+					   struct drm_connector_state *state,
+					   struct drm_property *property,
+					   uint64_t val)
+{
+	struct drm_device *drm = connector->dev;
+	struct vc4_hdmi *vc4_hdmi =
+		connector_to_vc4_hdmi(connector);
+	struct vc4_hdmi_connector_state *vc4_conn_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
+
+	if (property == vc4_hdmi->broadcast_rgb_property) {
+		vc4_conn_state->broadcast_rgb = val;
+		return 0;
+	}
+
+	drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
+		property->base.id, property->name);
+	return -EINVAL;
+}
+
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	struct vc4_hdmi_connector_state *old_state =
@@ -594,6 +648,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
 	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
+	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
@@ -611,6 +666,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
 	new_state->output_bpc = vc4_state->output_bpc;
 	new_state->output_format = vc4_state->output_format;
+	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -621,6 +677,8 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_get_property = vc4_hdmi_connector_get_property,
+	.atomic_set_property = vc4_hdmi_connector_set_property,
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
@@ -629,6 +687,33 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
 
+static const struct drm_prop_enum_list broadcast_rgb_names[] = {
+	{ VC4_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
+	{ VC4_HDMI_BROADCAST_RGB_FULL, "Full" },
+	{ VC4_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
+};
+
+static void
+vc4_hdmi_attach_broadcast_rgb_property(struct drm_device *dev,
+				       struct vc4_hdmi *vc4_hdmi)
+{
+	struct drm_property *prop = vc4_hdmi->broadcast_rgb_property;
+
+	if (!prop) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+						"Broadcast RGB",
+						broadcast_rgb_names,
+						ARRAY_SIZE(broadcast_rgb_names));
+		if (!prop)
+			return;
+
+		vc4_hdmi->broadcast_rgb_property = prop;
+	}
+
+	drm_object_attach_property(&vc4_hdmi->connector.base, prop,
+				   VC4_HDMI_BROADCAST_RGB_AUTO);
+}
+
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
 {
@@ -675,6 +760,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
@@ -829,7 +916,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
@@ -1069,6 +1156,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 csc_ctl;
@@ -1082,7 +1171,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1235,7 +1324,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	case VC4_HDMI_OUTPUT_RGB:
 		if_xbar = 0x354021;
 
-		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state))
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
 		else
 			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 5d249ac54cd1..89800c48aa24 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -117,6 +117,12 @@ enum vc4_hdmi_output_format {
 	VC4_HDMI_OUTPUT_YUV420,
 };
 
+enum vc4_hdmi_broadcast_rgb {
+	VC4_HDMI_BROADCAST_RGB_AUTO,
+	VC4_HDMI_BROADCAST_RGB_FULL,
+	VC4_HDMI_BROADCAST_RGB_LIMITED,
+};
+
 /* General HDMI hardware state. */
 struct vc4_hdmi {
 	struct vc4_hdmi_audio audio;
@@ -129,6 +135,8 @@ struct vc4_hdmi {
 
 	struct delayed_work scrambling_work;
 
+	struct drm_property *broadcast_rgb_property;
+
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
@@ -238,6 +246,7 @@ struct vc4_hdmi_connector_state {
 	unsigned long long		tmds_char_rate;
 	unsigned int 			output_bpc;
 	enum vc4_hdmi_output_format	output_format;
+	enum vc4_hdmi_broadcast_rgb	broadcast_rgb;
 };
 
 #define conn_state_to_vc4_hdmi_conn_state(_state)			\

-- 
2.39.2

