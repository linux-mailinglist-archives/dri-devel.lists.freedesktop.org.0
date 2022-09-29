Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674B5EFAE0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ED010EB1B;
	Thu, 29 Sep 2022 16:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2B10EAEE;
 Thu, 29 Sep 2022 16:32:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A33525807D7;
 Thu, 29 Sep 2022 12:32:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469126; x=
 1664476326; bh=XWDD19QUDYLh4/ScZssAecOOjJqgRPliowIW5HH3+ls=; b=U
 tOPGM+p6OkogkAjG6CQ/USDTQorwPjx3n9tuW81rCYrocScG2XsLDQ0UdB5YrdmP
 W/lJCdgl3Ps7bvVD0H1WWcNv0Id/cZNjWsJx9XHNBGe5ECpYghQjyKryRWzPrDGb
 VItIChZaZVuLbKJKYwayEUiaMkClKTEC3+zkVoZZu33BHMooZb5Bg92eEih3G/TD
 +IshBW+ZD/g+diTpVk7nb3o7PYu4OZEceO1CJl7ZpylLC2wtH5Y5IVl1j3ghXTX5
 w+fMYU8Z/rcXoH2MtO7Tc/IskcVNhJYO255hBgmEon3uNdTibpyF7cY7LVRvd/V+
 TekOvQFzzeXqVl/AYbdrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469126; x=
 1664476326; bh=XWDD19QUDYLh4/ScZssAecOOjJqgRPliowIW5HH3+ls=; b=O
 Rnxm0EY8Sf1eoSb/3ClZ5/VvokuDoBvg8vJGgl6YhQxbEZKV89Uxn438vF3eJvaw
 w33yajreBt9Y0vo+JIiRywJEOzTB+bvtOXVEbFJflehZ3JtRSV2KZbFZiBWcPxG2
 niox0m6kHaqm4eFfxtnoJT8UgtXCEvPZn9nNolFHpV/gP0nwTPR6uQDDZKBPsSt+
 cRy/SpTGcU3Jg2UuyFz4r27EqTJcTeIY+RPVh9s+7ee8Ei59iJuv3eliE/63eIJa
 RYJ5R5CjfUudpoE0ULf4uouwRI6vZaRhgWESEd9H/BBUl54YPMTt3l++W6NsqOfl
 koJJzTSTnpDUQXWO1XaSA==
X-ME-Sender: <xms:hcg1Y1M0wQgxTtM1OdXFvap5S_78eQj-RrbEEoZlx3nUiIJsPezV4Q>
 <xme:hcg1Y3_1v80mBsd5V00gDROYo1aB1_2tU7YCVCAOWa6p75eU2JLxyDuxp0OI35drp
 2xmya-W2lnPkhW8eDU>
X-ME-Received: <xmr:hcg1Y0T5v3sUmXTLUn3PCJoZ--WRuI_vrhoNy5mkLcEesYkmjmbIxRYd58R5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hcg1YxumQzJWRZbqEGVRAktXNKUu3bICQti7FE_hpvx3BNIJNyiI4A>
 <xmx:hcg1Y9e_MfWEo_gbFFySBOiU7iulU9PPp1L-Ukm7gK4l4irXV9AUvw>
 <xmx:hcg1Y910pOVHi9PTHVagv2g-KyLC72VjEFrj0CDH2Az_110c2MnCJA>
 <xmx:hsg1Y0qGL9QDQhachloT81ktBgp79qJI5LvtTDNjo-D2_ga41XgXDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:17 +0200
Subject: [PATCH v4 23/30] drm/atomic-helper: Add a TV properties reset helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-23-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=4273; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qT3wOjvYdSdI/mF48wsTEgKtODgNXnI4hC+PGj+pRVI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9yfctW6Tj8h0qXEvm1it5uY2ZfFAbGWpbWsK0Ov1rv7
 J1Z2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJfjRn+cMtt3Xz11RlelsfH1J9svP
 ZqYdaVg9ZbROclLY2+FK2x/SbD//hHzb8vd8W9sPXMuHJbdoVrX7Puv3rRTcvSfTaK3WRYzAsA
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 75 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index dfb57217253b..0373c3dc824b 100644
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
+	if (cmdline->tv_mode)
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
b4 0.11.0-dev-7da52
