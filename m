Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024FE645E6C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9CF10E3E7;
	Wed,  7 Dec 2022 16:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0410E3E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CBFB5C0178;
 Wed,  7 Dec 2022 11:09:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 11:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429352; x=
 1670515752; bh=7vOQ4kY2xlVuqIbP2mOJ++PsRwhZhQVpILcjOtlTWic=; b=G
 B6R5APPyYEZtroiQFtMXJ9CGldbB0NrOFU2UqqgSjFS0raQrfkhp0M4MiBMRUON7
 haBUee1UstM6mR7fbftJBvBiPTBf6CRqf/fQk2jwQwmEKt3+b5FPDvlYlKHfjxWa
 h7O79Q76x8QAhS7uBl6eainxP0y+CUqMoyWD8PlxZh7k25cnIzaBXscBdGdiYbF3
 /KC8kP1Q0gxMsNfCbKuUDef3Gwd90apF89/wzRVrTXF8ZZmWyNrMGBwPj6JV4wgJ
 uN8IQHdxDUtRbipbd+fJVEnQszOCemsbWrp/F675AuGM6jOryOrkocFemKdfpFii
 bd7IUPbXyBrYeNg0WLy1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429352; x=
 1670515752; bh=7vOQ4kY2xlVuqIbP2mOJ++PsRwhZhQVpILcjOtlTWic=; b=o
 9KHYHuhI/pvdvFmhYGzsGgRSW5vvR+EL8OXIU3p+7eLkEKdNpuUZMCm28hp7oTXd
 ZCWlWqQqA/mGRbbF3JS7b58xVIptTAzI6nU+T0DtT2ywtQ1v9AbS+jgWeF1KD9mB
 euwVP2uPM6SHacjPbr+nnqZPDHARdMjLwbOa9m5jWNaWY0gArJe6z62fKVmxSAQi
 z4h9Yq9t4YyJ9P+lu82zawXECwwFgfX/XVev602NI5Qpsotsb2bpozxq6qKjdWDO
 JLEoxHynTXfRXN2HYc0xklFfhneTziX56qYEvH36eWARhI+WY7LPheKcm5qEoyIW
 2MbdsG+ph6eekcx2GM+Mg==
X-ME-Sender: <xms:qLqQY8E-meGDUjDVkbzKjO8_ichCwRiaR7a-CthjI6oPFPKYfvbjHw>
 <xme:qLqQY1U6gzxMY86zOByw3ugZ6XUbdrUQv0cczCeyMEN20WPHNjKkkuzqnB8dnYqa6
 AiK0U9Ks1WZCL36YF8>
X-ME-Received: <xmr:qLqQY2KMBB40RAGocOUU8C9QKIctO4_1RW7V2mgbL1V46olyUSy21gLBGuBCjaDTccYWNPp04LBjIl91vIg8CZiZ_xuU-jXABUN0wM92HezEDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qLqQY-E9S4nLpNkyf_TVNWcPYPWD121mRKl5wfmBEsfYl5Fjb2wdTg>
 <xmx:qLqQYyVDUXQWVnoBo7UOr3gkcVtBjjI7lYpb-GLl6AKRBIxIPPmIow>
 <xmx:qLqQYxNx7wXB_EOQlN8uHiWG1UOJ116EzyP1g1bhpvPSfKr2OAfqSw>
 <xmx:qLqQYzuE0l8UhEGbgdYFBO9dkxgrMvah0RIjRsu65wHLW6CAR-jmfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:47 +0100
Subject: [PATCH 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-3-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=7949; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+kPKqlCCsqLPoCGeW5qfUUrf7WllrgcP3sp7IFnD31o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgX9VDy9zs014Nmuvrmxfxc/KywqebiN4cfBZ64zL/st
 7L/b3lHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJXORn+B+yyW/JNKcFKpY1U93Om7
 z+Ufb8xQR/w5Vvph5ItLRc87KX4b+XwLMvExo57xbalHN7JWidWzGFuaWw9Uh/Q8bBrGBZTkYA
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 87 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 15 ++++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0eafaf0b76e5..488a4012d422 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -154,6 +154,11 @@ static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
+	if (vc4_hdmi->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
+		return false;
+	else if (vc4_hdmi->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
+		return true;
+
 	return !display->is_hdmi ||
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
 }
@@ -515,8 +520,12 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
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
@@ -539,6 +548,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	}
 
 	if (old_state->colorspace != new_state->colorspace ||
+	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;
 
@@ -552,6 +562,49 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
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
+	struct vc4_hdmi_connector_state *vc4_conn_state =
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
@@ -571,6 +624,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
 	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
+	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
@@ -588,6 +642,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
 	new_state->output_bpc = vc4_state->output_bpc;
 	new_state->output_format = vc4_state->output_format;
+	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -598,6 +653,8 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_get_property = vc4_hdmi_connector_get_property,
+	.atomic_set_property = vc4_hdmi_connector_set_property,
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
@@ -606,6 +663,33 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
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
@@ -652,6 +736,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
@@ -1690,6 +1776,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_lock(&vc4_hdmi->mutex);
 	drm_mode_copy(&vc4_hdmi->saved_adjusted_mode,
 		      &crtc_state->adjusted_mode);
+	vc4_hdmi->broadcast_rgb = vc4_state->broadcast_rgb;
 	vc4_hdmi->output_bpc = vc4_state->output_bpc;
 	vc4_hdmi->output_format = vc4_state->output_format;
 	mutex_unlock(&vc4_hdmi->mutex);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 023ea64ef006..d423f175339f 100644
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
@@ -221,6 +229,12 @@ struct vc4_hdmi {
 	 * for use outside of KMS hooks. Protected by @mutex.
 	 */
 	enum vc4_hdmi_output_format output_format;
+
+	/**
+	 * @broadcast_rgb: Copy of @vc4_connector_state.broadcast_rgb
+	 * for use outside of KMS hooks. Protected by @mutex.
+	 */
+	enum vc4_hdmi_broadcast_rgb broadcast_rgb;
 };
 
 static inline struct vc4_hdmi *
@@ -241,6 +255,7 @@ struct vc4_hdmi_connector_state {
 	unsigned long long		tmds_char_rate;
 	unsigned int 			output_bpc;
 	enum vc4_hdmi_output_format	output_format;
+	int				broadcast_rgb;
 };
 
 static inline struct vc4_hdmi_connector_state *

-- 
2.38.1
