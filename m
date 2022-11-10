Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51F6240F6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB210E70B;
	Thu, 10 Nov 2022 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE810E6F0;
 Thu, 10 Nov 2022 11:07:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EEA9C58024D;
 Thu, 10 Nov 2022 06:07:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078473; x=
 1668085673; bh=0J8jXg/H+V6dCY8gnHwiEXk3FB9p2OP+FFJ4y36FvLE=; b=o
 GjUe3yPv5vfhIalYJhK5z3dKa0folfF7L7UACD8KzL1cBQ/oUNhbrAuzzxSUhU13
 nGgerfFZiIt/kpKd/pfUo3DB4cxhS5O9QmZqb9svFXiCps7fu1aUykGu+styZXVG
 8RUsXQn6/ptxONxjtQtC4XE213/X4pIkdreeLmmPGdJSRcvINNl2uZuj3wl97nBY
 qv5lyMVtbtqfmZOrsAZCAiRhSRvsKWZWbN5nuqzO27MncF8s5PjP8tYcw2qiIpAb
 MWa2TYsMaTlvHakyPhawFvPlPMoY/ZNzdsufCUXDRNSTKu16wKnG0XfSKCJNiS7T
 ZYExASgIh7FMiww/Xb5Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078473; x=
 1668085673; bh=0J8jXg/H+V6dCY8gnHwiEXk3FB9p2OP+FFJ4y36FvLE=; b=V
 w8mQzdJ5P1hs3khP9p5NHyMO/ywrUgugYQxK8qZp6LK5iBaAVza6gca75UdXtF51
 7j2mtmJS/mi2yzoGFCBd2utLGXT7ektnWt1Is30icN9JOWiv+wSYVq+lvLn/7+lN
 0AzFWXPsoKSTilc5WwqV8vyGP0dowmURuOY6CcQ/5hVAGXEgFgcYuNHoSJ7USr/L
 y4LaqSYwbzQ8PgRpWNuuuBaMkG0kTVMDKz2Z/4MmPOUvGg5m4USlTEkNW6rm4m/i
 X35xyZYfAY75FDyvxr/yXnzb+ascUgJSA0y+7M6tTlw/TRodMxc//Wl8+IbWQEgw
 z/7l5PBHh/hbvrlAkYcLw==
X-ME-Sender: <xms:idtsYwkZASNRx6wY-KgEohS7mWQTI5Tyg2mrTAXXkV9-yksNwXOK5Q>
 <xme:idtsY_3aNw4z-ZbIetQaSurI9LNdx1ZiAZtf3RWszJDjCKVw7Q-Vu1nI9k-fBHvDu
 HdahQh8oTKUH6d5N8I>
X-ME-Received: <xmr:idtsY-rjI3sCfOghhsdWycsgSUsb60z7Z57wtNUao4P8303rK0Zy1vM5dJQWmBsWBpZL9b3VlPah-1bqwO8C8f797HbwqLAs5Y-6ITNfGX0mTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:idtsY8myp_m_1oJgJLV0brJz7EtV8wYVcgOy_zn74RtjOoIeU-nL7A>
 <xmx:idtsY-15l1ID2a4RbgDK3DDSkPKjq3Vclnyq-Ipk_pt3ueWN23ShXQ>
 <xmx:idtsYzt0bK9t2aQJ7f0JeIF0-BdtTw05KPW007r9W7E8ycyZmFHqWQ>
 <xmx:idtsY1Cwv5u7tJP3mOpryNjDX_0mPF4dWDMLGRni8cWk0WWIJw-H5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:30 +0100
Subject: [PATCH v8 18/24] drm/atomic-helper: Add a TV properties reset helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-18-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4436; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sIgvEAdaOQI9cn5/RCosEn3AFdlcITvQO/GXmM6TT8Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1PT/l8/te9h7kWzPJ8nntMTFct29L168JrtyuzXR96t
 eevwu6OUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATme7C8L90QpaBet51dVY/KfFJ+Q
 6n/JVXnhc0/L/SgDXg/n0N/n0M/0xsXpxP4JbXrhcx4rm6JX4Dr+au1ptfY3Y0a26S+x36lwUA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
