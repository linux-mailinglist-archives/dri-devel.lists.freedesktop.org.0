Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE75853FA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F761113830;
	Fri, 29 Jul 2022 16:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E00210F9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D652F58098F;
 Fri, 29 Jul 2022 12:37:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112626; x=
 1659119826; bh=4qGx3hZit6lgcEk+++mw0lRXGNof3zdttC570gMtjkM=; b=l
 GACZXlgopYcJNm4Jm6wUqewu+H5w79l2k87mB6ByuFKrffOg2jW04MqWIKX7wXuT
 tu/gXq7aZ6MiPhdXSCQmnR867FM5S6bHMgb0KwLbCKQ14lB8/+d7mWV+uoJ2Zko5
 g1Z7KdTmmhnvUoLy8ujVPawPqvy5dzvTz2I7fK8w0UU9vA/6m00uKcbwRCLKYxgv
 LgrX4C6bJMXUPRpVpH//dPw5Qg6kA+iiqpchNOcxcJH0ywL+lTuEermd8+goPpm2
 Al17zY5g3h814WxOVm0PqSUgBIOUCc8QbX2keq3Dp8adm4spk62UB4BcMgT8FYIh
 gW+9bhBxWG4Q4+7miGbRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112626; x=
 1659119826; bh=4qGx3hZit6lgcEk+++mw0lRXGNof3zdttC570gMtjkM=; b=c
 OvUOHm9ML7xSguz94NpbYgHBEoQHjTx71dbbu2OgTJHN5RqyOhVUVVd7T2XgB++S
 rge56cRXsONSQYTJPXBHlrxJcnLQhqZUuEL2CejFHEyupVXss4H+jxOoHqnFqdoe
 MHKeeegoNvasrgU8EvWVngBhAxcnYt34ro6tEP+6kwAB5KXpVO6e3Q5n8INY/f3N
 58JM5mw/1GrjZEBePm/sRYLWZ/D6R6n5ECtzNf420wkyUCYxLhAnlMJis3HzKW4u
 qnGs0TK+kzZ2BoajUJHv9aeICJY5wvfoTT17tiupUS2js06CdfeACWHksF1EQZoi
 tsA+DY71nFeZTrqzkku1w==
X-ME-Sender: <xms:sgzkYtkz2igTVrIsv4wD5TTDGtzjOyx3dc1k-LTYA00VIpRgoLjE8A>
 <xme:sgzkYo0lf7HKkWLM1KcKiSAB8A4B0WxXZy8B07vtbHVAp8u9VXoPV8L6TAvfmfCGM
 OtDnPAnvfSTWEWH-EM>
X-ME-Received: <xmr:sgzkYjoDPKoAaxu2C_-ypyZJW6qCKxwPmQl9gOEdRpqb7NoYY4eFT-ITJ-bJ7yfYesn6BUzDYyugEJaZh0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sgzkYtnnzvCIrnkoeZfuupii8TnxYLTrIn0Vyo9DVbEQxQ2g_UTcrg>
 <xmx:sgzkYr1xtZIIvkJu4p4CirYW0QgUEx7xo6OmbvSmPxjsl7WsXsm_0A>
 <xmx:sgzkYsvXk7wj0tkYE9lgDsSW8bgon7iKJ8nAXoRhYtPZrokwTqUHHg>
 <xmx:sgzkYmEKF4G1B_FABO6kc972JK6uqx9D0oCMHNk150ek6jjaEnsTYQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:05 -0400 (EDT)
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
Subject: [PATCH v1 27/35] drm/sun4i: tv: Merge mode_set into atomic_enable
Date: Fri, 29 Jul 2022 18:35:10 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-27-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=j0+yMQ24E6EGIp+/t0OCzlRHmGmJAkQbvTve/uup35s=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VGqVGbNf3G7w++iaqyd3Kqsk+uWPVoba7c/5YyfxaFb
 WYHyHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEyksJLhr9TCllaboHWHGySPhz76Lh
 d0kvNi/moR/VCrqnx7lj82Bxn+cHLyujT81VqYnaCcyHro4GX9Aisdiy2z8nnkWrxmN2i5AwA=
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

Our mode_set implementation can be merged into our atomic_enable
implementation to simplify things, so let's do this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index f7aad995ab5b..3944da9a3c34 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -359,23 +359,13 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 {
 	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
 	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
-
-	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
-
-	sunxi_engine_apply_color_correction(crtc->engine);
-
-	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
-			   SUN4I_TVE_EN_ENABLE,
-			   SUN4I_TVE_EN_ENABLE);
-}
-
-static void sun4i_tv_mode_set(struct drm_encoder *encoder,
-			      struct drm_display_mode *mode,
-			      struct drm_display_mode *adjusted_mode)
-{
-	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, encoder->crtc);
+	struct drm_display_mode *mode = &crtc_state->mode;
 	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
 
+	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
+
 	/* Enable and map the DAC to the output */
 	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
 			   SUN4I_TVE_EN_DAC_MAP_MASK,
@@ -468,12 +458,17 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 		      SUN4I_TVE_RESYNC_FIELD : 0));
 
 	regmap_write(tv->regs, SUN4I_TVE_SLAVE_REG, 0);
+
+	sunxi_engine_apply_color_correction(crtc->engine);
+
+	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
+			   SUN4I_TVE_EN_ENABLE,
+			   SUN4I_TVE_EN_ENABLE);
 }
 
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.atomic_disable	= sun4i_tv_disable,
 	.atomic_enable	= sun4i_tv_enable,
-	.mode_set	= sun4i_tv_mode_set,
 };
 
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)

-- 
b4 0.10.0-dev-49460
