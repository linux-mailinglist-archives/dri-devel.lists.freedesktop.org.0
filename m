Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5F5853E7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1991910F765;
	Fri, 29 Jul 2022 16:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62A41120A1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 356A1580955;
 Fri, 29 Jul 2022 12:36:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112594; x=
 1659119794; bh=vVsQAjYM0tkRzzhmVnTG0QrWEmyLcfbfkDUVypL8jFE=; b=F
 YXdkICqnkMS2347HmG0172VDMGNToF0Dar+isurNDYS3ZwnAqgBYqm3cwF6UqIxx
 xKShFvc2QdolUTyNN0afWfacdD3/UdRUTay0ZUPgbXAi67WShvhWMfdqDambC4EI
 5Fn4OqK/nhh6hUPt/2X6+lvhipprW1zmr2Cf51KDbpueGWe78gJhj2Q9Pg60+YXw
 Yn6T6KWhnwb28XihWtjiEnAsXR/3VadewZ2ZyVSgoUKzHzEPb2NzBtYE2FgxiRor
 pYKrLWqqT9Lt5hvgO8z9BQ7qjOXcklb1e6iZMEN7Y3z9M5v7gxNtcNGFcLJugGqn
 YOjz85Ly92JD1nTGVx95w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112594; x=
 1659119794; bh=vVsQAjYM0tkRzzhmVnTG0QrWEmyLcfbfkDUVypL8jFE=; b=l
 gLGQ7J6JMaZ+w4oo0tLEHy1UzcbKGZ2ru/6g/wWHDD9newXHjb0QceOkFQVprwvt
 Et4S8qdiCSD63+XNCJjb0LD0dQBX74gr8ibK3lvx+RBJXfSvzZMXHEPZEcSDzWEt
 9AEJaXZMoiNJ1hfUu6h6j3fODgaPQk+UpTrgS2OOll8ttyWBLLSbGi9gkrylsbFI
 8VkKDJbcakvVqIq6BwyxGwXUjz1Tm8VIcX1heGtDA8OQtmqWNditZcha/mDx20kq
 KMONY5q9dxtOKttkPdFGDvW4FifmNG6Xdd3ChQPmK0xbFDaVx4BmBGU7JWr2r/wh
 TOThuR9G5U/lsA5ve5x8g==
X-ME-Sender: <xms:kAzkYo6qhrx-fXuxrn-s9yjuVf4pMCUFMo0OEvCoKNpYHlZCaqb1lQ>
 <xme:kAzkYp5OcOmXSYt1KAmTlixH2z63cZjovGl1d1adhxgr3wlshHId7JWaqTyh_t-vm
 QEVmcTz8k0QkIpXiQ8>
X-ME-Received: <xmr:kAzkYnfFe8CN6CCREnzRzNdM3KRIbCWL-Neu9ghHN73rbhcaTZZ_EPqfZydUbg6A_xNsb_Ij_a9KZW5g8es>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kAzkYtJps6jkmlXHMy_PUYZSGs_Fc7h8_NoSEWOT4wcKnL7nN17l6g>
 <xmx:kAzkYsJ-Uuv0sxNGXBAqmZ9vLMfZfp2_HAQXzwXXoesTmVocanK8_Q>
 <xmx:kAzkYuzgwOelqObruP3doYiu9UZhGumEV_spaRr6Xg8SRmVC056zwA>
 <xmx:kgzkYh6v3ab2SLoCvUwg4v_hQikEBlKAiPudrOm7LwzdCfnFoS6MwQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:31 -0400 (EDT)
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
Subject: [PATCH v1 18/35] drm/vc4: vec: Remove redundant atomic_mode_set
Date: Fri, 29 Jul 2022 18:35:01 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-18-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DL7F7vucmT5JzUmSHSpqiWno9BOcCmSgmLtawRfl4IE=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VGa8K1B6c+XxrSerNq/073eP55wdup5s/o1giksq1co
 RC9L7ihlYRDmYJAVU2S5LvjWji8syi2C58NmmDmsTCBDGLg4BWAiHJ8Y/he+exl7yml1khALp7opc6
 3lFpOHxu8Zrz7nDn74psHX7AsjQ/uTxA2x835xuent/vvqrrwlo83Klg7VUK55Itz8jodPrwMA
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

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

Let's remove the superfluous tv_mode field, which was redundant with the
mode field in struct drm_tv_connector_state.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 02cef4134f2f..a9fefd92f0f1 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -171,8 +171,6 @@ struct vc4_vec {
 
 	struct clk *clock;
 
-	const struct vc4_vec_tv_mode *tv_mode;
-
 	struct debugfs_regset32 regset;
 };
 
@@ -316,7 +314,6 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.tv_mode_property,
 				   VC4_VEC_TV_MODE_NTSC);
-	vec->tv_mode = &vc4_vec_tv_modes[VC4_VEC_TV_MODE_NTSC];
 
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
@@ -360,6 +357,11 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
+	struct drm_connector *connector = &vec->connector;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	const struct vc4_vec_tv_mode *tv_mode =
+		&vc4_vec_tv_modes[conn_state->tv.mode];
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
@@ -418,15 +420,14 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	/* Mask all interrupts. */
 	VEC_WRITE(VEC_MASK0, 0);
 
-	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);
-	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);
+	VEC_WRITE(VEC_CONFIG0, tv_mode->config0);
+	VEC_WRITE(VEC_CONFIG1, tv_mode->config1);
 
-	if (vec->tv_mode->custom_freq != 0) {
+	if (tv_mode->custom_freq != 0) {
 		VEC_WRITE(VEC_FREQ3_2,
-			  (vec->tv_mode->custom_freq >> 16) &
-			  0xffff);
+			  (tv_mode->custom_freq >> 16) & 0xffff);
 		VEC_WRITE(VEC_FREQ1_0,
-			  vec->tv_mode->custom_freq & 0xffff);
+			  tv_mode->custom_freq & 0xffff);
 	}
 
 	VEC_WRITE(VEC_DAC_MISC,
@@ -442,15 +443,6 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	drm_dev_exit(idx);
 }
 
-static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
-{
-	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
-
-	vec->tv_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
-}
-
 static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
@@ -470,7 +462,6 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 	.atomic_check = vc4_vec_encoder_atomic_check,
 	.atomic_disable = vc4_vec_encoder_disable,
 	.atomic_enable = vc4_vec_encoder_enable,
-	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
 };
 
 static int vc4_vec_late_register(struct drm_encoder *encoder)

-- 
b4 0.10.0-dev-49460
