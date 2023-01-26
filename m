Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0667CC93
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025D510E8F4;
	Thu, 26 Jan 2023 13:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EE010E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4DB985C0112;
 Thu, 26 Jan 2023 08:48:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 26 Jan 2023 08:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674740887; x=
 1674827287; bh=lkNErsxE6JCadru7+e17OWwyojhxsSXvn/3JQJuZvmA=; b=h
 ikzqE6JUpGMkM94olc/rqIGfFzirueIBEPKBqUbjD7YVa/jwe8yWyQK6YLcQ94Z+
 C3HVUFc2MEWTgxLL5Tuwoj+zYyb/hc75sDBrpId+1RzoXzcCKb3lBbbwPY4JnmGP
 Fp5EBjA8vskJD/ABHhDx+Gxbvg8F/VCwzWbBgHiiyfXgx2llMqU2yRO5tA/fNmjP
 DAEvoZVqdJLlzdVa7uXcSjyGCJFKkz4is1WT7VwTu/rfDyAc2AbRr4A6n1WsjqiC
 Pbrlbpt0vOKkosIyHlAm42q0TAL0lzu2PSWdGsDhryrraP/QeZx5KxPh+nZNSl7Z
 I4EDEeFqG6P8slWYSJyQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674740887; x=
 1674827287; bh=lkNErsxE6JCadru7+e17OWwyojhxsSXvn/3JQJuZvmA=; b=S
 GEjHcF4WVKer9I9s7OnXlgbL/4v6s6X9iZf+waVvZHYjJ7dWQT1rIIOyMm65GFNy
 cXG057xHUDkA+XsASkFJVZ/H1m8yvTrXpxuN7c0MZkUUulegQd/1GHP9X/WNVUgf
 d6AfLhQWemrcDsMjcbxvuijLEb/nk5b/aZDM0f/MglDuusE3jI4wTkpIt12KZ0iE
 5ESLHmOzPeFYJGVJW0RX+U1G6kDlLjzyCWHMVHhGnioEcHy1Vltat7F3TWiACAhL
 2lk0ZvguhZ1wqxviD59h8dWwYWPOa8ZN++9y77tpB0rRMZYF2Ih8WccRKEdE7ibF
 G/aqrQ1sR2zVX+iddAPtg==
X-ME-Sender: <xms:l4TSY68l1QKPZgqsNXWgaig_0r-0yktRDgWm1RVznsVe83ilrseGGg>
 <xme:l4TSY6th5ntSPgibeI3Fki1jXmQANAXUDHJJrycuAhLBdfq8qV5UXmVWltgait1Fi
 6npfy6m_lJC-fZKunw>
X-ME-Received: <xmr:l4TSYwCQ2weNp2t4bf3cYfMt2QhS86DicvsZI32yZTh-IUOHyldCpnJxW9JzJVVdNXHIQ6fHA3e79-GxdEkXHyqRVQ2DnYTPfwdpRZyIQJqe4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
 teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:l4TSYye8v6Bz438TOcmX2E5-YWHJ4CsZGybknQHX9uJ5spCdo75Zzg>
 <xmx:l4TSY_Pq5TY7zhX5EaUcqckeKiSWoUwo81jKwTTWNgxsgX0JjlLutw>
 <xmx:l4TSY8n35cMBokG6GJkqE0Ap8sL1LAZ-0Kumw2Mc7B0ocIFuuJX1Hg>
 <xmx:l4TSY8driKGaWBlS1nyydtyXbxcJpgEFiTI715PddRH1KKMXATa4DA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 26 Jan 2023 14:46:37 +0100
Subject: [PATCH v2 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v2-3-8ace2d8221ad@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9122; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ROFwTmDmTipZX1NujgN7qD+totvTR+KbvIAOA92Q4X0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWly2zPktsrn3j8ryMM1rF2apfdgTciKy6voF/7MfN+6e
 Gyr5v6OUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATEdzHyDDh4gxbNinRhv5pQuzZfm
 KqGSwPjkyfor9C69X7e79+dZsy/FO66f7ritn6hraipcsfp16XyvBQ4+OOjKlf/in60ZzopQwA
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
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
index 4b3bf77bb5cd..78749c6fa837 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -150,10 +150,16 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
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
@@ -524,8 +530,12 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
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
@@ -558,6 +568,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	}
 
 	if (old_state->colorspace != new_state->colorspace ||
+	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
 		struct drm_crtc_state *crtc_state;
 
@@ -571,6 +582,49 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
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
@@ -590,6 +644,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
 	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
+	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
@@ -607,6 +662,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
 	new_state->output_bpc = vc4_state->output_bpc;
 	new_state->output_format = vc4_state->output_format;
+	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -617,6 +673,8 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_get_property = vc4_hdmi_connector_get_property,
+	.atomic_set_property = vc4_hdmi_connector_set_property,
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
@@ -625,6 +683,33 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
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
@@ -671,6 +756,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
@@ -825,7 +912,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
 					   HDMI_QUANTIZATION_RANGE_FULL :
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
@@ -1066,6 +1153,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 csc_ctl;
@@ -1079,7 +1168,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1232,7 +1321,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
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
2.39.1
