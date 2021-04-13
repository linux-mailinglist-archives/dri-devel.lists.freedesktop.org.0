Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7735DE55
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 14:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77AE6E160;
	Tue, 13 Apr 2021 12:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53289E65;
 Tue, 13 Apr 2021 12:11:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56D91580475;
 Tue, 13 Apr 2021 08:11:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 13 Apr 2021 08:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=MfFnEC2VgNp5S
 i/OefddRQO7Z9XqoycZqax9wIJjj2A=; b=pm2GSV9ncgzpUPFkOTFCtmx6zjJDD
 MFzg6/pHWNp2ikx0s6XpaBSizIWjVeA0EUQ18zDvrbsmmZ1vcLhduapbl3/hterg
 At9Qw6F4WO7cPzpCZv1zdoDFFrmOnjiD8yprSUcVYeYAlAy29IBZOIDecON8ROD6
 D82O3AR6jJceS+t/NnCJ9w6hSTwS6NMlavDFvtpOp3odr9GOV0zpEw+Y2RGWJ2KB
 cENlmY85NJSrxbtTqX62zOsuX/pGfwQ1eIQW555sgP7hJA5VRCXjugIlxjNFfkhk
 +jC0Ps1B6IJLP03ngHqEyc7NTKdjDJ1duHjDkomNyxk5QfRRfEIf9T7Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MfFnEC2VgNp5Si/OefddRQO7Z9XqoycZqax9wIJjj2A=; b=Iw/MF+ID
 Zbw46NtbMqPWI0EdPpoiNdEJLVuc1Xb7AZTR5Abjz9dQ06Al6Br6AzbmRg7Hc+mo
 Qr49TgfR9IWnheGzI2cLV3HSgmbykSxR0I08VW2Eya2IyhlZpkj/O0gDyHOH7ih+
 uzEcHOL20JyZhKFc6fz5GGp3nLXtp2TW1qb7X1GtOX1bF82MkHpn9r/afDx8jDOd
 4pLi7TvGpd+kSEKxUyKaFjI+PCiliSEZRr7fNV1UraJFDbt0R1EmeLG8dJijPzCq
 v6YP28h6oLYPUbGnOz2/SwQ6P4hAkq6PbZoGXBetiqWoQbvfluEm0TuTeA6YGX9p
 m+/1p/j/UpZUcw==
X-ME-Sender: <xms:Xop1YAePzY3V7vRLuxyesFW7OquP4C1euF4-tBPSeHwMgHFr3jHtwg>
 <xme:Xop1YL3iDtcN-tiRNsuSp_Gewz0i4uv2RDaCxLFr0_nc-32fHbagPRb4uwE8Oo2Wb
 8qNZvVIZrRMSXFp4mU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Xop1YBhQGo_Cp3XobZQn0HJuas5GGR1IHpBiO4OWCgnJHMz4vRellw>
 <xmx:Xop1YJSyx2yom2zLX7AOKvEcibQsGQmg03QOXEXj-p3ABfy9uYG2DQ>
 <xmx:Xop1YKiEspxcloGBKfVKaeHzlIf7Of9eWoZq7TT3z-guumo18oM3xQ>
 <xmx:YIp1YPHyuuKUu7eegPPxDkgDBiBq8hI2aitpeVf8VtH-QsQNf7-Avg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F0961080064;
 Tue, 13 Apr 2021 08:11:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/5] drm/vc4: Add HDR metadata property to the VC5 HDMI
 connectors
Date: Tue, 13 Apr 2021 14:11:02 +0200
Message-Id: <20210413121104.375789-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413121104.375789-1-maxime@cerno.tech>
References: <20210413121104.375789-1-maxime@cerno.tech>
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
 Robert Foss <robert.foss@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
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

Changes from v1:
  - Rebased on latest drm-misc-next tag
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1fda574579af..a33fa1662588 100644
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
@@ -2102,6 +2152,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc4_hdmi_phy_rng_disable,
 	.channel_map		= vc4_hdmi_channel_map,
+	.supports_hdr		= false,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
@@ -2129,6 +2180,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.phy_rng_enable		= vc5_hdmi_phy_rng_enable,
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
+	.supports_hdr		= true,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
@@ -2156,6 +2208,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
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
