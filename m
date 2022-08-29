Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237315A4D5C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E3B10F235;
	Mon, 29 Aug 2022 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3D10F231
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 707D12B06076;
 Mon, 29 Aug 2022 09:15:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778899; x=
 1661786099; bh=ReY7J5eErJiBY0rbxwL7vnhNBn09T/DT66uuFDXXy5o=; b=N
 4aBI9wNpgH0ceAnmBkyvIF5Lu77njTisbo1TIyV+MRUDKNuwulNc4YbhWRKmMWKJ
 dMmbHy4NlVARJ71cduUN5bndKcGqo8JAA1V3MMlbU7gj2RVigr/12iQMd4qrtjTR
 068iX8T9PUlEal4YDwm5TNEO/mByZnEOIfRoYuFPdfrfUMlRXdE9c3P19gsyqyXj
 ULyMUUW3+3BbIZxip3q0FnvBh2WgJ9dnK6bwrIPhSQ8jwWS0oUTKpTHV0Zx0Hc1l
 W2FKnIl25AbHCAn3CMWARmuupC2rggRMAEZFdpGGnE0LNPXQeoWvqeSqAa+Rme1h
 I6rVpG7lLlXdnj2mlt6yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778899; x=
 1661786099; bh=ReY7J5eErJiBY0rbxwL7vnhNBn09T/DT66uuFDXXy5o=; b=o
 VKmlz4/W/h4tuO2rKshy4dLtdEoUzgZu3epYaNMaNiZt0AisN2tANX1ZniOGV8o/
 Zr8hHGEYyaqvt/kyIHZfgQKZRLOuNEL08Q6NPh72AbG8zqv0YKyvo0/QUc/ahNXx
 OHORusfP8StHLkZSbT302o7kyPAQgMWNH+Uxb7NfWkPV2Fm5FVbqXv1TwxUlc9Pj
 lDb4SXb/cJMZ2vBJ2tRKZZAiRAcZNN1CulovQA4L/67dQL24Ss62DpW3Vl4ScGeP
 gCJSF6wBmQpFVDqSNKaPOr/nue5Uubipn1xysS4U07LHhACEjHMCEpdjKgLlGVRk
 00smxhdUqCJ13zgW5eqdg==
X-ME-Sender: <xms:07sMY4v1KrwH5b2QwEQbcPIY_gZm-mu5VNd3fJbAikYySqx6ASjW-A>
 <xme:07sMY1eK_-TorPa-ERxLshxC1NNCAh7i-en7iE_eHNGVn0G504n_HD8KbmeWEOCAk
 y5IBjZYHs6V2lIBucc>
X-ME-Received: <xmr:07sMYzxprAjrU7vfNAYaqREbT9wjpqmung_J5Sej1zgKs3MOyULW3HTDe-U2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:07sMY7MiKOjYLhG8tGdhJzlApsnjf_MwTt1kLgRgs0CxFwF0kUeKGg>
 <xmx:07sMY49ci1sqB6ChX6AMudvjFJ2yzb2fDhUgstuqxWngZbuXDN2ruA>
 <xmx:07sMYzV_OQb2dXGxOlNySF4yZw8tPGR06FPKH2kBVcR6UTTqXSTRfA>
 <xmx:07sMY0mej0rQ3D6ADPox7KBLYHgBWJpAig_pqgai4x81lxMwDGJxuL3ozkU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:14:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 27/41] drm/vc4: vec: Remove redundant atomic_mode_set
Date: Mon, 29 Aug 2022 15:11:41 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-27-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QXOlllk5ml+SVmFRbPCWgY/56C60l8/t88mB+T2Hd8I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxRarzw76nXbROFT8FTJfZ3vCgOyZc3+Rc1vzw7+F6jR
 czK6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOp7GD4xTxX5aN6ObuKyquJYl93cv
 MypLxZ/fer0zGFZZyfLztEXGZkeBN54K165Hf/Iv1072wP+68Xg+pWPT0srdHbuOGba9J3XgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
=0D
Let's remove the superfluous tv_mode field, which was redundant with the=0D
mode field in struct drm_tv_connector_state.=0D
=0D
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index 9a37c3fcc295..4d7bc7c20704 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -171,8 +171,6 @@ struct vc4_vec {=0D
 =0D
 	struct clk *clock;=0D
 =0D
-	const struct vc4_vec_tv_mode *tv_mode;=0D
-=0D
 	struct debugfs_regset32 regset;=0D
 };=0D
 =0D
@@ -316,7 +314,6 @@ static int vc4_vec_connector_init(struct drm_device *de=
v, struct vc4_vec *vec)=0D
 	drm_object_attach_property(&connector->base,=0D
 				   dev->mode_config.legacy_tv_mode_property,=0D
 				   VC4_VEC_TV_MODE_NTSC);=0D
-	vec->tv_mode =3D &vc4_vec_tv_modes[VC4_VEC_TV_MODE_NTSC];=0D
 =0D
 	drm_connector_attach_encoder(connector, &vec->encoder.base);=0D
 =0D
@@ -360,6 +357,11 @@ static void vc4_vec_encoder_enable(struct drm_encoder =
*encoder,=0D
 {=0D
 	struct drm_device *drm =3D encoder->dev;=0D
 	struct vc4_vec *vec =3D encoder_to_vc4_vec(encoder);=0D
+	struct drm_connector *connector =3D &vec->connector;=0D
+	struct drm_connector_state *conn_state =3D=0D
+		drm_atomic_get_new_connector_state(state, connector);=0D
+	const struct vc4_vec_tv_mode *tv_mode =3D=0D
+		&vc4_vec_tv_modes[conn_state->tv.mode];=0D
 	int idx, ret;=0D
 =0D
 	if (!drm_dev_enter(drm, &idx))=0D
@@ -418,15 +420,14 @@ static void vc4_vec_encoder_enable(struct drm_encoder=
 *encoder,=0D
 	/* Mask all interrupts. */=0D
 	VEC_WRITE(VEC_MASK0, 0);=0D
 =0D
-	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);=0D
-	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);=0D
+	VEC_WRITE(VEC_CONFIG0, tv_mode->config0);=0D
+	VEC_WRITE(VEC_CONFIG1, tv_mode->config1);=0D
 =0D
-	if (vec->tv_mode->custom_freq !=3D 0) {=0D
+	if (tv_mode->custom_freq !=3D 0) {=0D
 		VEC_WRITE(VEC_FREQ3_2,=0D
-			  (vec->tv_mode->custom_freq >> 16) &=0D
-			  0xffff);=0D
+			  (tv_mode->custom_freq >> 16) & 0xffff);=0D
 		VEC_WRITE(VEC_FREQ1_0,=0D
-			  vec->tv_mode->custom_freq & 0xffff);=0D
+			  tv_mode->custom_freq & 0xffff);=0D
 	}=0D
 =0D
 	VEC_WRITE(VEC_DAC_MISC,=0D
@@ -442,15 +443,6 @@ static void vc4_vec_encoder_enable(struct drm_encoder =
*encoder,=0D
 	drm_dev_exit(idx);=0D
 }=0D
 =0D
-static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,=0D
-					struct drm_crtc_state *crtc_state,=0D
-					struct drm_connector_state *conn_state)=0D
-{=0D
-	struct vc4_vec *vec =3D encoder_to_vc4_vec(encoder);=0D
-=0D
-	vec->tv_mode =3D &vc4_vec_tv_modes[conn_state->tv.mode];=0D
-}=0D
-=0D
 static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,=0D
 					struct drm_crtc_state *crtc_state,=0D
 					struct drm_connector_state *conn_state)=0D
@@ -470,7 +462,6 @@ static const struct drm_encoder_helper_funcs vc4_vec_en=
coder_helper_funcs =3D {=0D
 	.atomic_check =3D vc4_vec_encoder_atomic_check,=0D
 	.atomic_disable =3D vc4_vec_encoder_disable,=0D
 	.atomic_enable =3D vc4_vec_encoder_enable,=0D
-	.atomic_mode_set =3D vc4_vec_encoder_atomic_mode_set,=0D
 };=0D
 =0D
 static int vc4_vec_late_register(struct drm_encoder *encoder)=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
