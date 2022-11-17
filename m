Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2562D6F3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4F10E5BB;
	Thu, 17 Nov 2022 09:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCBF10E5B8;
 Thu, 17 Nov 2022 09:29:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id D15072B069CA;
 Thu, 17 Nov 2022 04:29:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Nov 2022 04:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677392; x=
 1668684592; bh=0J8jXg/H+V6dCY8gnHwiEXk3FB9p2OP+FFJ4y36FvLE=; b=O
 KAQttiWTohoG4/UIewyWNVXYFotvEIgEUMlVi3RnKpiX1Qfous9ZphjJAUIaGngn
 tHtWGd91oc7qM+TKhtxA3qT4r6Ud+0Svb2JofTaYVYkmzIa2XLAzMLF7voWAkhJ7
 1lys6GZxofkEV+VguSDGPRX9IRvJ8dJ8a8BkrAtYjt4CmvtfiODl+Crc94EWJ7po
 mNbtARFjNB5DOef91qYgG3ojOrf1XnRVs9DmFuozGMXA9/C4KvFdOdfKpcEfiU97
 30huiMxj9uiZDbaPahMWYltBHpTpcvA8jJTYpnH74Xj17C+YT/YRf0yrtvIVy9sK
 CxXl50sHvvxOBRyHfDfYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677392; x=
 1668684592; bh=0J8jXg/H+V6dCY8gnHwiEXk3FB9p2OP+FFJ4y36FvLE=; b=L
 eLQwBSZ092m5tQmtFwQhoh3z90H3ZWsrVbrSdk209U0QOYx5Tfljyuf3pE4sah1a
 vmLakibr2cTxLxUhQdHAkxmRO/16/rLCHmOp/sIltUni/l6ljsGlDjMsz08mbME4
 jDbBdi5J0ifcnvw1TBQSskHiBYf5/e0sSSq80WGiTjUY1pT+eEQWDYec0tr9Sqjb
 c4UkzPQGMEAdVCAixJZy42KtiO0K+p0kSQlBLsqs0CFfOfZdNkPIlHSQjQ2kcHjQ
 g1rPVBy+nLw3aIEMm8ec/aNCKZfNYGjrbSJ8OW0X9BgL8Hf9mwqOUy5yAwKTJQzq
 G7b9qlgJ0nmg7iQt3lAlw==
X-ME-Sender: <xms:EP91Y90Knnv-7Bdn3MVTWmxYHq_PVy_8RZNjt_VJ01qjGRJRcq1FDA>
 <xme:EP91Y0FKv5FhKB9djLw3Z8d9nMVZ3XwUxSLiX9HTXisUTKpEbxOEsgJTigxyTR-YI
 Fd1to_ITTCx5mES9dM>
X-ME-Received: <xmr:EP91Y95bdbR-LzANsb1x90yl5SlwPlCptjIf_U5F0uSUgVtBBPKuz5l0bDKECbLGahF6_A8tgZW29j-_JdGFZOmPw33PPuYl3iMcDnNuXk5IvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EP91Y639DMBBMC0VndCWKc5187jtoT6U-NtrTM5XLqKxaLCFzWVhmw>
 <xmx:EP91YwE1MY8QXPzgcGxxeA3BmnsTDPGpkHsDNZfpilbm2ZXKHJdZKA>
 <xmx:EP91Y78TZWk4K6mv9r5I-DflKwpU1PmASjpivbXErTjK9dDIJb_mlA>
 <xmx:EP91Y4TdQVfnjB9BFshcXUGo-cdV5RcLkzxZNQ8OTuihmgnk8BN8DlxCk98>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:56 +0100
Subject: [PATCH v10 13/19] drm/atomic-helper: Add a TV properties reset helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-13-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4436; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sIgvEAdaOQI9cn5/RCosEn3AFdlcITvQO/GXmM6TT8Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y7s2/6//9HztN5NCbqnKvWZ+7lnXGyevYfx+maBcIvs
 5ty7HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjI4WKG/56p/hkC0f37/v+dECeSuP
 XOU9X7VrF7nFtcgq8Imh6TlmNkePfzBPf5tyEPhDxlA82fbNE+3nf/Ov/+7xpn5zq1L/PewQ0A
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_tv_create_properties() function will create a bunch of properties,
but it's up to each and every driver using that function to properly reset
the state of these properties leading to inconsistent behaviours.

Let's create a helper that will take care of it.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Use tv_mode_specified instead of a !0 tv_mode to set the default
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 75 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index dfb57217253b..e1fc3f26340a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -481,6 +481,81 @@ void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connecto
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
 
+/**
+ * drm_atomic_helper_connector_tv_reset - Resets Analog TV connector properties
+ * @connector: DRM connector
+ *
+ * Resets the analog TV properties attached to a connector
+ */
+void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
+	struct drm_connector_state *state = connector->state;
+	struct drm_property *prop;
+	uint64_t val;
+
+	prop = dev->mode_config.tv_mode_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.mode = val;
+
+	if (cmdline->tv_mode_specified)
+		state->tv.mode = cmdline->tv_mode;
+
+	prop = dev->mode_config.tv_select_subconnector_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.select_subconnector = val;
+
+	prop = dev->mode_config.tv_subconnector_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.subconnector = val;
+
+	prop = dev->mode_config.tv_brightness_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.brightness = val;
+
+	prop = dev->mode_config.tv_contrast_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.contrast = val;
+
+	prop = dev->mode_config.tv_flicker_reduction_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.flicker_reduction = val;
+
+	prop = dev->mode_config.tv_overscan_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.overscan = val;
+
+	prop = dev->mode_config.tv_saturation_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.saturation = val;
+
+	prop = dev->mode_config.tv_hue_property;
+	if (prop)
+		if (!drm_object_property_get_default_value(&connector->base,
+							   prop, &val))
+			state->tv.hue = val;
+
+	drm_atomic_helper_connector_tv_margins_reset(connector);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 192766656b88..c8fbce795ee7 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -70,6 +70,7 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,

-- 
b4 0.11.0-dev-99e3a
