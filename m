Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88360E4C9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6D710E557;
	Wed, 26 Oct 2022 15:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A0610E50B;
 Wed, 26 Oct 2022 15:34:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0AFFA580260;
 Wed, 26 Oct 2022 11:34:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 Oct 2022 11:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798447; x=
 1666805647; bh=jcOnOdXWLsvfuERAn7jxcp7yCPzCHCf0KyOetRLO8bI=; b=O
 9GpUnWgUAeX/g2tX5v7f4xxhZ6zF5rgw/W8EIr4xutJI48BhgKaMZ8K91wy1hsYs
 GXH0fyI7k6Uazd0mJEYDv+iAJulVSndll7y8DiRZy8+exsP1qIWZ7lNw2xm1gojz
 lqE5ZTSzfcapRFTfGqLCDGEg/GhPbd0pFNlL7lw/SNLjvwigORQARrqkus8y/A+p
 RcntELpHC+ejafAtpVudwzO9SGvVZZ7Ftv6MNpttpkLhmzNcjkuM0uqNk0jW21B7
 sMB2qXaWg5LmKbSojxBWQAPG6VgHYD6oIMaM98hdd+DgzwuGCli53tfjPy3qqXqH
 eX9BUAEHH8lCBiqG1hxIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798447; x=
 1666805647; bh=jcOnOdXWLsvfuERAn7jxcp7yCPzCHCf0KyOetRLO8bI=; b=V
 mV4m4iHB/7mcpXGM1NHT89BBmFJP12gcT2dAl3LDmidI1S+gjKBVgP3I2o6t8SHS
 3/okBOSyP47ZdLN4Z/M/uZM5GkdKx2P9nefEwloghgxGi1c4EDynqro2kMJ2t58o
 5v958BInizfTrDw1YC8L5ZRTQ0Z72G/CasjMNauN8COBJSFajxPdPCVdUp2X+AS9
 KizWBEOjYoCgn34DJDKZAgWx+yxpjwkuwBdSiksi83K3fQ6CEDS9uHTkW7MEUrgI
 IiP6gOI7uzzB8TVLDbRm+uhZKIOUwqXwsgsA4ZpMGwzl+Aw9HqVpAysac2w8p4kq
 QE2FyLT9e6GVWvKwvlqig==
X-ME-Sender: <xms:blNZYz8AOh7-NgN1-XWLTBOgE4z5dCo69-se-K7PVzc8kN-KKA8BZw>
 <xme:blNZY_vQ9B4UjFUjhsjB0LJnA3gg6yaKtgcH7KfeyfVZuRlR00vRam8Oz7Jr2Hjxk
 2z2iijWJQh2lPWQ2AU>
X-ME-Received: <xmr:blNZYxDVwmpNK8n_vJV0Pp__VmyxaIWs-9eGvdWzVPoDPX8urseNrGFF7KIr0ehL02ginrL0b-kfVUUmPNijIo2ivJ6Bwd19ziyOkY_yMS5nZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:blNZY_eDBBBAKKm5hy04xhR8RKl1aSnzlFbc4vA0GLc_IoGIrfa5pA>
 <xmx:blNZY4Pec_Zv2AgGBseN4UudQytgz6JTG4ZkQ3cEKgdV-JrBiRPODg>
 <xmx:blNZYxkM6kQh86A9o59tuaFPDm2FQJA0kpGEmbKNpN80iTWbEtaXIg>
 <xmx:b1NZY9YIPvYfdisWYAgl7qa4kxsm_bQf_kj20hYCGd8xot6H3XRrBw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:06 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:36 +0200
Subject: [PATCH v6 17/23] drm/atomic-helper: Add a TV properties reset helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-17-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4374; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UtWard2Kai/O6yyag/3mB3Zscqt5UbEIDevckU35kvo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwe4iFfcFb7i7lr95u6ftf9eEtN9RBjMKPk9ZvXjl3pgr
 zv/8OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRLZ0M/92+ftJPvp82jfXcpIrs1H
 bv0nWnlsZtfd964gVL36eGaE5Ghh3bHt7vdqg9/GuqSkTC+dk+vzkfcUyY9aRY5VqiBGtyHwcA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_tv_create_properties() function will create a bunch of properties,
but it's up to each and every driver using that function to properly reset
the state of these properties leading to inconsistent behaviours.

Let's create a helper that will take care of it.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
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
