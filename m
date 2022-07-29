Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222A5853F4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBCD11A131;
	Fri, 29 Jul 2022 16:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDFE112338
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C6C995809A0;
 Fri, 29 Jul 2022 12:37:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112650; x=
 1659119850; bh=RtBWVyhipgVGKBzgLaFQoPKZOkGMW/GOSPDOm45R7S8=; b=M
 lcpT7S42vUoBsb1paiUYfzf+gl8RIdDTAEpKVyaxHIdPaKZq4VuxptHLtYuN20b7
 6HtvPEapUJaG3l3a1VTxmfPVHl34sJKT5dxR++BFrOwZe8kRKX0hVUUHwkOba/d2
 4dyd4mFzL3s56HnvtuO6aZuBBjt50x9lKWuZaCESNb4wgwzXVC8E7hoe8850ZlRE
 2flwvgKNk8oSOQLzeGkx6Tcr/ziBjhiJi+qUlNaGzP8LYWMnfGiyKbt3YHBVfcYE
 XJp6JBSurKmlWtQL4Kr5U24AE1Zad1IuMCpdp6psBRNlyGFR2/13KKaonDWYnAfX
 QLD253AEgyLKGvPyNwQyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112650; x=
 1659119850; bh=RtBWVyhipgVGKBzgLaFQoPKZOkGMW/GOSPDOm45R7S8=; b=K
 DYreJWMnBTy+0cSUz8cAFX2RO4/L9YU7S2uh884CNa0pVwG3vM2ncBEH+XpfD+ry
 f2meQReko4SsFt7kltRmlPRftOEPfBhkoRaR7KSBWskt8v6o7tW0dXT2sgGOjCCJ
 MnHEogUADDNCqKMRC+Kz7JVqUz8GHniwh6Pd0LZs+e5Xy/dMgEwLzxoOnANBpks5
 Ac61vO9nNi4BwNnqg3kyDKWrg8dNAoC+QezkRV444N0ByEWQ4uzxZQXALWqpS7zt
 iu83XW3nGVC5IADTlNShyEn8eSpdw/RZlZmQuG70h6C/l8EonvF604OLo2/q05qT
 EZXgEu+cKmwenWRQChqlQ==
X-ME-Sender: <xms:ygzkYhKDkCWepRbkJ9LyJek-gggNgCqqAg4PZMGBcRbOLg8MR5XJhA>
 <xme:ygzkYtIW2IwCczDRxNcXIi7hnCOx-DgUAtZICCXEs_GpNkoz5GUBE2r-GVAhK0Men
 -tMJf05Ul5M63EMYes>
X-ME-Received: <xmr:ygzkYpu7ejkYyI3s1zyzmrCzxlPyZh_E1QA9y65qQbMHDWC7uuuwAFWvAu_IQ_WMFOxtanvXeIqehAmHDBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfduhffhkeeiteejledtieeuteehkeehieekgedugeffudekjedu
 geffieethfeinecuffhomhgrihhnpehmrghrghhinhhsrdhtohhpnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:ygzkYiaPll_2bx-BUMwfYJrm648yq7UvHmJC6H_dkO0iILseTJKXZA>
 <xmx:ygzkYobbAh-3D2h1dgCzA_WJXoNNlGX0iF1h-E1Kr6E6It6-OilDTQ>
 <xmx:ygzkYmB44Nl_tLsb48g3QBDmLvjqA5AxD_q8W8PxnevxkHGx32Za-Q>
 <xmx:ygzkYkKH5tGLibCQ_l7WFcZCN4juqtQ9EBzcYXe-ESUPUrHcueGmUA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:29 -0400 (EDT)
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
Subject: [PATCH v1 33/35] drm/connector: Remove TV modes property
Date: Fri, 29 Jul 2022 18:35:16 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-33-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4771; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rMRLOOg7VJ8NjH+0TL7KazwOYRQZ1QYUtbNupki7utg=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHyu5D54kRPOG8sY6RYy+Orf9Z3rPoo9JZj/n5lP5s4
 kxLTjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACZy6AjDbzbdxI6r25eqiB37WL91yR
 UdK92LNw46W6n1SPHsye8XMGJkWP/RJ+B31+75vyw/+lyNfp7GMzFXO7x7Mdv874/EHG5MEAAA
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

Now that all the other drivers have been converted to the new style TV mode
property, let's get rid of the old one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d7ff6c644c2f..d52e87e8e6aa 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -698,8 +698,6 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->tv.margins.top = val;
 	} else if (property == config->tv_bottom_margin_property) {
 		state->tv.margins.bottom = val;
-	} else if (property == config->tv_mode_property) {
-		state->tv.mode = val;
 	} else if (property == config->tv_norm_property) {
 		state->tv.norm = val;
 	} else if (property == config->tv_brightness_property) {
@@ -810,8 +808,6 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->tv.margins.top;
 	} else if (property == config->tv_bottom_margin_property) {
 		*val = state->tv.margins.bottom;
-	} else if (property == config->tv_mode_property) {
-		*val = state->tv.mode;
 	} else if (property == config->tv_norm_property) {
 		*val = state->tv.norm;
 	} else if (property == config->tv_brightness_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d73a68764b6e..5e138159f2de 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1650,9 +1650,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
  * 0 on success or a negative error code on failure.
  */
 int drm_mode_create_tv_properties(struct drm_device *dev,
-				  unsigned int supported_tv_norms,
-				  unsigned int num_modes,
-				  const char * const modes[])
+				  unsigned int supported_tv_norms)
 {
 	static const struct drm_prop_enum_list tv_norm_values[] = {
 		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
@@ -1722,20 +1720,6 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 		goto nomem;
 	dev->mode_config.tv_norm_property = tv_norm;
 
-	if (num_modes) {
-		unsigned int i;
-
-		dev->mode_config.tv_mode_property =
-			drm_property_create(dev, DRM_MODE_PROP_ENUM,
-					    "mode", num_modes);
-		if (!dev->mode_config.tv_mode_property)
-			goto nomem;
-
-		for (i = 0; i < num_modes; i++)
-			drm_property_add_enum(dev->mode_config.tv_mode_property,
-					      i, modes[i]);
-	}
-
 	dev->mode_config.tv_brightness_property =
 		drm_property_create_range(dev, 0, "brightness", 0, 100);
 	if (!dev->mode_config.tv_brightness_property)
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index bed52423776e..1d4025663530 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -526,8 +526,7 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	ret = drm_mode_create_tv_properties(drm,
 					    DRM_MODE_TV_NORM_NTSC_M |
-					    DRM_MODE_TV_NORM_PAL_B,
-					    0, NULL);
+					    DRM_MODE_TV_NORM_PAL_B);
 	if (ret)
 		goto err_cleanup_connector;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 91d343238b0f..2e7e964928b3 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -704,8 +704,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 					    DRM_MODE_TV_NORM_PAL_B |
 					    DRM_MODE_TV_NORM_PAL_M |
 					    DRM_MODE_TV_NORM_PAL_N |
-					    DRM_MODE_TV_NORM_SECAM_B,
-					    0, NULL);
+					    DRM_MODE_TV_NORM_SECAM_B);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 78275e68ff66..e535dca6376e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -712,7 +712,6 @@ struct drm_tv_connector_state {
 	enum drm_mode_subconnector select_subconnector;
 	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
-	unsigned int mode;
 	unsigned int norm;
 	unsigned int brightness;
 	unsigned int contrast;
@@ -1806,9 +1805,7 @@ void drm_connector_attach_dp_subconnector_property(struct drm_connector *connect
 
 int drm_mode_create_tv_margin_properties(struct drm_device *dev);
 int drm_mode_create_tv_properties(struct drm_device *dev,
-				  unsigned int supported_tv_norms,
-				  unsigned int num_modes,
-				  const char * const modes[]);
+				  unsigned int supported_tv_norms);
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
 int drm_mode_create_scaling_mode_property(struct drm_device *dev);
 int drm_connector_attach_content_type_property(struct drm_connector *dev);

-- 
b4 0.10.0-dev-49460
