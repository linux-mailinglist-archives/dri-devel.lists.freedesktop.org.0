Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF65A4D53
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284A010F231;
	Mon, 29 Aug 2022 13:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EE510F231
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:14:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 24ECF2B06074;
 Mon, 29 Aug 2022 09:14:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778893; x=
 1661786093; bh=0AX96P1waKKRQkTO+iOcWMCk5MIh+zpbK0wX9UzjYxs=; b=p
 +u+j2z7mXJaKZNgbxLUPtn53RdJ5bct1pVsvyb9wppWuFKea+xJHiwNZNupcQb41
 TSEQSHcCavgPmZzBmw6XvlNMjni4bUzt7vvbfg1HuOI0Otejn/tTJxzpLwEl3E5a
 sNp2Jorf32HqaUpmzr1P6eCoOr4GKtQNHP4TjT3pfj/2upNCjh0OahuYEBBa/9Nl
 amatbdQAMJlC0pdzbrOU6FbTi2glvJgqFI1ot6LNeNzijjU5zIDeylHhuSuBlaBE
 yozctptZENEcEZ8UIRQR5Jz3ISL2XdW3F29N9nzl1DDGAA9zmfEQ8VOtYVdqNed1
 zj0XlEEbzxx9Akn8nyWrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778893; x=
 1661786093; bh=0AX96P1waKKRQkTO+iOcWMCk5MIh+zpbK0wX9UzjYxs=; b=M
 +xoIfRFY5i+n71nasLyR7QMx+2AN1YXFrzIjiqfecUrFtipf0n6muHE0j9SfJ+1I
 V/kJD9C36blu2+1AOSF50ilV2qY6stjWCdpITOPol91iLTSSGTCVzDIC7WwmABKS
 OZpep9wl7ctamQvVQ7ndX5q/zPwy/MWNKspjljYzotxL+PNCLZ9y+NebbDe2FbdE
 0PPuwQYY/1rqiMlyVdOIGRfPYT0pZtkDTangYO2LWIFKFeSrMPBeyduHNah53IH0
 4ZTTxw8JYjHlnICdZv8mHJBoMQY7Bbiq2zTaioXz1Tugbd4AvpZJ0CKUxrYh0WUf
 6BpLkXOkRrevK+LYdSgkw==
X-ME-Sender: <xms:zbsMY7d1WlWT2hrH7n1xynviRw2F-EYGsFQZNmZa2mJrr3ajlGOydw>
 <xme:zbsMYxOl8Bt3g698No-jEQI7X1iVuKagL6yKTu7gHdC2md3fU0dbTi-CL2dgMuTSW
 8CXZTX6oZovbE7XEtA>
X-ME-Received: <xmr:zbsMY0izqbg6-cPYMFMeY8w19pNNWwv8Pk9RVlMro0eQ53BrEW6Y-jIruiv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zbsMY89xlxJ9h-ZFTiW0Fl5L7VrFu3EPEIJlnMhbpU7IHlVhjP80DQ>
 <xmx:zbsMY3sz06M3NQibEVMRYqjhFy7CJXBaOzh3svETHEFQJt72RIXbbg>
 <xmx:zbsMY7EJeCEdFYHrK68rSYfiGIWeiw6ruhv4FhbGbq9a6pR_C1eO1A>
 <xmx:zbsMYyXhfr8MMw0sZvYnJtml9zT3HM9pttGEtdPU8P2g2vqyj_DLMmia-P0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:14:52 -0400 (EDT)
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
Subject: [PATCH v2 26/41] drm/vc4: vec: Refactor VEC TV mode setting
Date: Mon, 29 Aug 2022 15:11:40 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-26-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=4170; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=nZsI1zyDpc3LEVYskgEvCZJpXsuMlEITNi4SdhWkPfA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxTu994+GFwZZFJ4SaDh2E0GzwLuaW/Opxqfezd52YK/
 KQemdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi0VEM/x33RIncND68/aFPOMvhDC
 Y+7w5Xscd1aretn73pudeQYcvI8FfidKSy6nf3+wwbsrQuFKhMLJE/odzNKSNn2dvfk/WSEwA=
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
Change the mode_set function pointer logic to declarative config0,=0D
config1 and custom_freq fields, to make TV mode setting logic more=0D
concise and uniform.=0D
=0D
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index 72eee0cbb615..9a37c3fcc295 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -194,7 +194,9 @@ enum vc4_vec_tv_mode_id {=0D
 =0D
 struct vc4_vec_tv_mode {=0D
 	const struct drm_display_mode *mode;=0D
-	void (*mode_set)(struct vc4_vec *vec);=0D
+	u32 config0;=0D
+	u32 config1;=0D
+	u32 custom_freq;=0D
 };=0D
 =0D
 static const struct debugfs_reg32 vec_regs[] =3D {=0D
@@ -224,34 +226,6 @@ static const struct debugfs_reg32 vec_regs[] =3D {=0D
 	VC4_REG32(VEC_DAC_MISC),=0D
 };=0D
 =0D
-static void vc4_vec_ntsc_mode_set(struct vc4_vec *vec)=0D
-{=0D
-	struct drm_device *drm =3D vec->connector.dev;=0D
-	int idx;=0D
-=0D
-	if (!drm_dev_enter(drm, &idx))=0D
-		return;=0D
-=0D
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN);=0D
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);=0D
-=0D
-	drm_dev_exit(idx);=0D
-}=0D
-=0D
-static void vc4_vec_ntsc_j_mode_set(struct vc4_vec *vec)=0D
-{=0D
-	struct drm_device *drm =3D vec->connector.dev;=0D
-	int idx;=0D
-=0D
-	if (!drm_dev_enter(drm, &idx))=0D
-		return;=0D
-=0D
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD);=0D
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);=0D
-=0D
-	drm_dev_exit(idx);=0D
-}=0D
-=0D
 static const struct drm_display_mode ntsc_mode =3D {=0D
 	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,=0D
 		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,=0D
@@ -259,37 +233,6 @@ static const struct drm_display_mode ntsc_mode =3D {=0D
 		 DRM_MODE_FLAG_INTERLACE)=0D
 };=0D
 =0D
-static void vc4_vec_pal_mode_set(struct vc4_vec *vec)=0D
-{=0D
-	struct drm_device *drm =3D vec->connector.dev;=0D
-	int idx;=0D
-=0D
-	if (!drm_dev_enter(drm, &idx))=0D
-		return;=0D
-=0D
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);=0D
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);=0D
-=0D
-	drm_dev_exit(idx);=0D
-}=0D
-=0D
-static void vc4_vec_pal_m_mode_set(struct vc4_vec *vec)=0D
-{=0D
-	struct drm_device *drm =3D vec->connector.dev;=0D
-	int idx;=0D
-=0D
-	if (!drm_dev_enter(drm, &idx))=0D
-		return;=0D
-=0D
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);=0D
-	VEC_WRITE(VEC_CONFIG1,=0D
-		  VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ);=0D
-	VEC_WRITE(VEC_FREQ3_2, 0x223b);=0D
-	VEC_WRITE(VEC_FREQ1_0, 0x61d1);=0D
-=0D
-	drm_dev_exit(idx);=0D
-}=0D
-=0D
 static const struct drm_display_mode pal_mode =3D {=0D
 	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,=0D
 		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,=0D
@@ -300,19 +243,24 @@ static const struct drm_display_mode pal_mode =3D {=0D
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {=0D
 	[VC4_VEC_TV_MODE_NTSC] =3D {=0D
 		.mode =3D &ntsc_mode,=0D
-		.mode_set =3D vc4_vec_ntsc_mode_set,=0D
+		.config0 =3D VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,=0D
+		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 	[VC4_VEC_TV_MODE_NTSC_J] =3D {=0D
 		.mode =3D &ntsc_mode,=0D
-		.mode_set =3D vc4_vec_ntsc_j_mode_set,=0D
+		.config0 =3D VEC_CONFIG0_NTSC_STD,=0D
+		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 	[VC4_VEC_TV_MODE_PAL] =3D {=0D
 		.mode =3D &pal_mode,=0D
-		.mode_set =3D vc4_vec_pal_mode_set,=0D
+		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,=0D
+		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 	[VC4_VEC_TV_MODE_PAL_M] =3D {=0D
 		.mode =3D &pal_mode,=0D
-		.mode_set =3D vc4_vec_pal_m_mode_set,=0D
+		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,=0D
+		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,=0D
+		.custom_freq =3D 0x223b61d1,=0D
 	},=0D
 };=0D
 =0D
@@ -470,7 +418,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder =
*encoder,=0D
 	/* Mask all interrupts. */=0D
 	VEC_WRITE(VEC_MASK0, 0);=0D
 =0D
-	vec->tv_mode->mode_set(vec);=0D
+	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);=0D
+	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);=0D
+=0D
+	if (vec->tv_mode->custom_freq !=3D 0) {=0D
+		VEC_WRITE(VEC_FREQ3_2,=0D
+			  (vec->tv_mode->custom_freq >> 16) &=0D
+			  0xffff);=0D
+		VEC_WRITE(VEC_FREQ1_0,=0D
+			  vec->tv_mode->custom_freq & 0xffff);=0D
+	}=0D
 =0D
 	VEC_WRITE(VEC_DAC_MISC,=0D
 		  VEC_DAC_MISC_VID_ACT | VEC_DAC_MISC_DAC_RST_N);=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
