Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27425853AB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5A418B643;
	Fri, 29 Jul 2022 16:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A718E548
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:40:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 94D405808FB;
 Fri, 29 Jul 2022 12:35:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112530; x=
 1659119730; bh=rHszA6yTYdadm9FE2nCZkXzGtjsFgA60URB5qXutatY=; b=t
 HevhV/aL4JbnO4YUhip09KVnzHeXZ5uMk0SmoPApJgCAw1qetKVzlKy8SvHSaAxd
 zcHf4+ijP95IG0JNdzbEs7SMrXr2Fi+ZWoxTkzob2724jprkM/LdPidCxskleQC+
 sb6v7+ST9oZZBsUWn2pm/gEDIIIVOfvxBvIcDxkdH7j9qsfCy2gufLOK610NxP/k
 ERCKNhJQXS5MugMywsaMu63WX5/Q5E79miCZb24S4lghuvm8cq5pO87iA2/Fa86j
 RZu/Wj4cEVweaHKq5OY3lfqTUuxnaJzzeAOgJ513/RWmHaVSNTPdUtfcaiwRV+AS
 q9iNq4r88ETGaaOqfYKtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112530; x=
 1659119730; bh=rHszA6yTYdadm9FE2nCZkXzGtjsFgA60URB5qXutatY=; b=S
 +pzdQa4XXXBdex7hWuyCDHEzTEzn1vLNrXWbKGbey1v1OtBP/xcjt39YBUjfbBZl
 8ZTu6V1GhEtIUqecwoWE8aKoD9+HMtaCq8+3tJH2BvJ905+p0AtG81h2yiSG+Qca
 wISXfvplLouHH1A5Ncjldnc4/VE5e1bf4C7dTvYRAWhDbRygGFdfSHNDzr7M1Wl3
 k8MoKSyd5da/4l1ooF2t2rwxh2ViLuUFe+R2+cNqtsNHAp/9ICprz2Qq7TuIstLU
 myz0DeFU9sgauxFrRWQqjukYR4/kTu7IvnaCHR4IIIiilM4tgyZRRatxA2P3ZROJ
 NJUz71nhpDhAv2uU1m+WQ==
X-ME-Sender: <xms:UgzkYjHh0jsQboqLfAwCBX_4evynMkTFfHFj1G1vEEkMJbjCBr4UuQ>
 <xme:UgzkYgUEPk5T4YsfXbrz42ZqArvJ62mfAhUQrjRyx5zS2CgnBafX9OhKkCfnO9iNR
 A7Wk5oVoCRzWkNeZMI>
X-ME-Received: <xmr:UgzkYlKMAAqA-b-ISQMxlJIacrFOLQZeNZqbC9IMOcI4EUi3gCSpBzB0JIjjQ0bE4ki0o_2awRK17RydS8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfduhffhkeeiteejledtieeuteehkeehieekgedugeffudekjedu
 geffieethfeinecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:UgzkYhHXyHzyEsijorJenWyJQRWYTQEi50NwDGP3HCHoKwbKYZViIA>
 <xmx:UgzkYpWcrNCFCUeGt-AnHJWJ1TUgD6yhqXKDQyuVQ3kDM8Us4-xDJQ>
 <xmx:UgzkYsMlb_65NvdyS_Ez9NIoLziTP-li7xWFzP8d3YIQ-pbYUYta6g>
 <xmx:UgzkYnn_DfkCYzHymEMpsqvqLFMXyArN-BVKCgAtf84pDTCawQjNSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 01/35] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
Date: Fri, 29 Jul 2022 18:34:44 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-1-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3LO0aI1Yh755iBsOxkpa0oEMVEvSmtsQbweMjXCmxKE=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFSYDLgbmbSKuGIuKvUeU9zUly2iUq0YMf2fuO3do4L
 WYU6SlkYhDkYZMUUWa4LvrXjC4tyi+D5sBlmDisTyBAGLk4BmEjXVIZ/2nLzX3sYL1SPSQi84JJS9T
 AjXuJIgUOIzylXoZcmjpOPM/yVcTD+v2TVn/paPre2zbU/YjI2Tak9v/JK0+9m+xSzV03FAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have two sets of TV properties.

The first one is there to deal with analog TV properties, creating
properties such as the TV mode, subconnectors, saturation, hue and so on.
It's created by calling the drm_mode_create_tv_properties() function.

The second one is there to deal with properties that might be useful on a
TV, creating the overscan margins for example. It's created by calling the
drm_mode_create_tv_margin_properties().

However, we also have a drm_atomic_helper_connector_tv_reset() function
that will reset the TV margin properties to their default values, and thus
is supposed to be called for the latter set. This creates an ambiguity due
to the inconsistent naming.

We can thus rename the drm_atomic_helper_connector_tv_reset() function to
drm_atomic_helper_connector_tv_margins_reset() to remove that ambiguity
and hopefully make it more obvious.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bf31b9d92094..dfb57217253b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -464,12 +464,12 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
 /**
- * drm_atomic_helper_connector_tv_reset - Resets TV connector properties
+ * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
  *
  * Resets the TV-related properties attached to a connector.
  */
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector)
 {
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
 	struct drm_connector_state *state = connector->state;
@@ -479,7 +479,7 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 	state->tv.margins.top = cmdline->tv_margins.top;
 	state->tv.margins.bottom = cmdline->tv_margins.bottom;
 }
-EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
 
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index d0addd478815..fa636206f232 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -355,7 +355,7 @@ static void gud_connector_reset(struct drm_connector *connector)
 	drm_atomic_helper_connector_reset(connector);
 	connector->state->tv = gconn->initial_tv_state;
 	/* Set margins from command line */
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_margins_reset(connector);
 	if (gconn->initial_brightness >= 0)
 		connector->state->tv.brightness = gconn->initial_brightness;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 719a3c3b4ef6..66e38760d5aa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -397,7 +397,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 	new_state->base.max_bpc = 8;
 	new_state->base.max_requested_bpc = 8;
 	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
-	drm_atomic_helper_connector_tv_reset(connector);
+	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
 static struct drm_connector_state *
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 3f8f1d627f7c..192766656b88 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -70,7 +70,7 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
-void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
 					   struct drm_connector_state *state);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2c6fa746efac..f185ad862cb1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -671,7 +671,7 @@ struct drm_connector_tv_margins {
 
 /**
  * struct drm_tv_connector_state - TV connector related states
- * @subconnector: selected subconnector
+ * @select_subconnector: selected subconnector
  * @margins: TV margins
  * @mode: TV mode
  * @brightness: brightness in percent

-- 
b4 0.10.0-dev-49460
