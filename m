Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04B5E6577
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800810EBB2;
	Thu, 22 Sep 2022 14:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C2B10EBA9;
 Thu, 22 Sep 2022 14:28:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 571492B05B3C;
 Thu, 22 Sep 2022 10:28:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856920; x=
 1663864120; bh=U+kzfhAo//WtOXcUfFEucxsRHnjvV7GaIvI1DudP6HQ=; b=D
 4iEtEue+ybuQ8vogDqY21P9SfgTk8a4yk2hbgMqnA42/McL33aPoHLrjQTjnJS7h
 DXwobMUz9TiWPJIIbqA6oWMTAAhpKt26MFDYDJIlDgL+Fpr/VlN/nAZq80+dZMF3
 K0IzYmBoIscI2WlMsZnog0LZScHMV2D/1siOlfL+5Re1gVQVCB7IvT8I5bjlWv0X
 BC69g+Hmatf9Gfjbz6q0HQDuOYbl9L8eAMGrWZSf9vINBvOwhjurtOC82579fQbW
 blCmAQahiFBPsqbeHzhG++V511DiDRbJHst89MDR9HIi64xcaoxQDJJKiZ5cz9K4
 /a87zoQpGnI23Q8Lq+oYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856920; x=
 1663864120; bh=U+kzfhAo//WtOXcUfFEucxsRHnjvV7GaIvI1DudP6HQ=; b=J
 Oo1wqE/ZugoKyeE6j81uZ0jH+LS3Pa6XDkOmS96s8USWDJ/w7rmi8zBJqJsAxarX
 4myndEpqT9kee+jvvhxy5p+Lvl1telGy1L02luGhErNvQ/4wo0PPfH0TJkUrRt6P
 JwQrArMB/fLtW0snIavz8mBklhxCnn2AH//5/U2F/RPOAAg14ia1Cj5q+258y5pb
 gMygqdKhLdieWm6uYHG4r83bU2ZrSsP3l/3U9VfytiRXxdydwomhDjIwhHn10nw7
 /hQaRMz3F2f1ISFbU9k5g2fY28PCTP5xmTC4Fm3m2Goqe+RecimxWar+NycPxUp1
 tBHXxZvEGQaGZHd5kOK2w==
X-ME-Sender: <xms:GHEsY7NMH3Jm3YbxU1IBj27Zg8OMXcGMT2CW0WMKDSLiqEiuR7Tafg>
 <xme:GHEsY1-WNu1jDBvVN6wIf6C5kXRkWzZT7_ltVyt3fukW-3sr6oD-0myHhuILWU4yv
 1W7B3EaWt11qrgXgl4>
X-ME-Received: <xmr:GHEsY6S4SwQOlG_rzaaY-yjwtxz4BXyY85A8mdm-zSnpFzlOcsAdBJCNYl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GHEsY_thNJCqToWHdbrTaBn2-4vgvv0U4O0UOn7k8vFwuBbPRQhN3Q>
 <xmx:GHEsYzf-_K9IrMhoGjhiViP_WULPyp0UulL6JG4UH4ojm9oD-t9yOQ>
 <xmx:GHEsY71DuMjt9MMqabiRzqWgFQ5vjeTYXWmDUGt4s3eYFxHnOaBtug>
 <xmx:GHEsY6oLsuyeTbQQAVjmvR5pWVZs0zGxeLG4hcVfbHRhDJP8Dvqtg3K7eB0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:43 +0200
Subject: [PATCH v2 26/33] drm/atomic-helper: Add a TV properties reset helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-26-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4090; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Qn9tXXejtzVlILpWn1CiUIZt886SF4nFCM9aMutkhW4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYFbLF7W2S08Lb16nf6R7U7lDlMvTJzAJeBwZ2qrVMD/
 LH/ZjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE+Rsjw6fXbaJmb5u7N2cZn7i3Xm
 mn6Sd+i1WfYiTFyqr/fHvwvYXhn6najmozt8c6CddEF+Xeq5zMaqyi9eLDPfl7PmlrI7zi2AE=
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
b4 0.10.0
