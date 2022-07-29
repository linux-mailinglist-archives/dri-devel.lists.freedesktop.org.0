Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6525853E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E7710F72D;
	Fri, 29 Jul 2022 16:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7C51132CB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 08BC6580951;
 Fri, 29 Jul 2022 12:36:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112589; x=
 1659119789; bh=xVGYG5LL1TbN6HzfjsLCzXmVKf2LOPhGZdr8USk7meY=; b=p
 sUv3q5i+eOKguiIImUQZjbGJyoHNNhvkb2t+VGuXB5IClNxqPzKYyAnHHT3vzZHy
 E6/fYXzf1DMsQuhv2VNT1zSJrRyNfsau+S4DLyqiVVRfHPx83YDp944G1vbFC6Ff
 W5yJ3IdfRTWWDHySAyuS+S3GPg6DDs1v2Vsqw8kjb+lwBS99A5gNaiXYkfry7/TS
 Vmr7rzftZS7RBzTLqZqBEFww3MiyzpdDR6b2Q1FCbGCceZTR1qQw3E9F+20xwotR
 USLQpnjD/4B/MtuCWCgY75uoB90DZ5Ba3maV/VZL/3yIyCFEQOlJ95e5BqB7OSLb
 X1DbxcB3Q/gGhVFbyGlpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112589; x=
 1659119789; bh=xVGYG5LL1TbN6HzfjsLCzXmVKf2LOPhGZdr8USk7meY=; b=A
 SwGXUrqj4EmXJlUL0MlMca60jel0G/0BdWq4AKtJgbUk2+Z415jf7iCPLxDXvtqa
 pHKSTb4Vt7VcGsZ4KoXkLKQeap7bdv9iOxMWFygwVdTmOyQtmLwPpngPJee4Giri
 vgyHzt4URsvg/qX8TVUU4z9HzwqUsRl3V3tz4Bzqs7VKF1Ojd32N2y2mf4Z+p+C7
 SGbRYLG9eo3j3ZRIOUNaRKO5LGn+LlVnJnAQfKhU/KIOLZQ9rl4E7qwM2Q0DQML/
 vJsJZSY/f859ci4OpnFCB0qMVPVtvhZCgy+r+jZpBJ0LnryzvPeincjdlcWV1266
 Ohi6e/Thnl8kRnAhK8EGQ==
X-ME-Sender: <xms:jAzkYve5CRcbHVTdnVmb1Gj7lw1cliMyPUqry7Mvj5U8gCwPsIPT3Q>
 <xme:jAzkYlM04nX9l-erxTblGp_XvcIFIyO_QtJnaWVT8wklliMdbpwNpYROqL2o_Zlyj
 wy3MqaIfAvReLCDaLs>
X-ME-Received: <xmr:jAzkYogxN5oFnyn1H3mksBVDsUaro-XWMSoS4x0WNqPIvYVCglEAVUC7xb0ZDCItCW-xCCra4boPVxKhz88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jAzkYg-zQx4ynVmr7E6m7SkQRTI3zcpOZ2RACKvE6g38Ac_KpNHd_g>
 <xmx:jAzkYrt7ygVOEWAH12qSZ3tzenrxONQgiGq1kVlSBBxq_rABaeJcFA>
 <xmx:jAzkYvFMqx0tWkHkMnN5uUL6h9sP4ZQI2qyWVUQf5krvbEGnBqD9jQ>
 <xmx:jQzkYq93fXjd52PPMzdA-jwe_WxG3CJGLxUWfukPFUxzKGWLodZZCw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:27 -0400 (EDT)
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
Subject: [PATCH v1 17/35] drm/vc4: vec: Refactor VEC TV mode setting
Date: Fri, 29 Jul 2022 18:35:00 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-17-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4172; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=O/9+DbxGFhrV8t/G57jPy8C5DgCC7v+vV6zzCbqSKNs=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHKtvsgPEGAadeceQIW801MC7y4uz0L+num9/jOc5GW
 P2jWUcrCIMzBICumyHJd8K0dX1iUWwTPh80wc1iZQIYwcHEKwES21DAyvPZht+Wcx2DHc+5as6NJXY
 DLL9uzTvFRcjkSmSab0hffYWTYGt2TcElkfXZCq0/XZl/GrKoL3bybAiUzV/LUms3Knf0LAA==
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

Change the mode_set function pointer logic to declarative config0,
config1 and custom_freq fields, to make TV mode setting logic more
concise and uniform.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index ba0a81250d08..02cef4134f2f 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -194,7 +194,9 @@ enum vc4_vec_tv_mode_id {
 
 struct vc4_vec_tv_mode {
 	const struct drm_display_mode *mode;
-	void (*mode_set)(struct vc4_vec *vec);
+	u32 config0;
+	u32 config1;
+	u32 custom_freq;
 };
 
 static const struct debugfs_reg32 vec_regs[] = {
@@ -224,34 +226,6 @@ static const struct debugfs_reg32 vec_regs[] = {
 	VC4_REG32(VEC_DAC_MISC),
 };
 
-static void vc4_vec_ntsc_mode_set(struct vc4_vec *vec)
-{
-	struct drm_device *drm = vec->connector.dev;
-	int idx;
-
-	if (!drm_dev_enter(drm, &idx))
-		return;
-
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN);
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
-
-	drm_dev_exit(idx);
-}
-
-static void vc4_vec_ntsc_j_mode_set(struct vc4_vec *vec)
-{
-	struct drm_device *drm = vec->connector.dev;
-	int idx;
-
-	if (!drm_dev_enter(drm, &idx))
-		return;
-
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD);
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
-
-	drm_dev_exit(idx);
-}
-
 static const struct drm_display_mode ntsc_mode = {
 	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
 		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
@@ -259,37 +233,6 @@ static const struct drm_display_mode ntsc_mode = {
 		 DRM_MODE_FLAG_INTERLACE)
 };
 
-static void vc4_vec_pal_mode_set(struct vc4_vec *vec)
-{
-	struct drm_device *drm = vec->connector.dev;
-	int idx;
-
-	if (!drm_dev_enter(drm, &idx))
-		return;
-
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
-	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
-
-	drm_dev_exit(idx);
-}
-
-static void vc4_vec_pal_m_mode_set(struct vc4_vec *vec)
-{
-	struct drm_device *drm = vec->connector.dev;
-	int idx;
-
-	if (!drm_dev_enter(drm, &idx))
-		return;
-
-	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
-	VEC_WRITE(VEC_CONFIG1,
-		  VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ);
-	VEC_WRITE(VEC_FREQ3_2, 0x223b);
-	VEC_WRITE(VEC_FREQ1_0, 0x61d1);
-
-	drm_dev_exit(idx);
-}
-
 static const struct drm_display_mode pal_mode = {
 	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
 		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
@@ -300,19 +243,24 @@ static const struct drm_display_mode pal_mode = {
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	[VC4_VEC_TV_MODE_NTSC] = {
 		.mode = &ntsc_mode,
-		.mode_set = vc4_vec_ntsc_mode_set,
+		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_NTSC_J] = {
 		.mode = &ntsc_mode,
-		.mode_set = vc4_vec_ntsc_j_mode_set,
+		.config0 = VEC_CONFIG0_NTSC_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL] = {
 		.mode = &pal_mode,
-		.mode_set = vc4_vec_pal_mode_set,
+		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
 		.mode = &pal_mode,
-		.mode_set = vc4_vec_pal_m_mode_set,
+		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x223b61d1,
 	},
 };
 
@@ -470,7 +418,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	/* Mask all interrupts. */
 	VEC_WRITE(VEC_MASK0, 0);
 
-	vec->tv_mode->mode_set(vec);
+	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);
+	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);
+
+	if (vec->tv_mode->custom_freq != 0) {
+		VEC_WRITE(VEC_FREQ3_2,
+			  (vec->tv_mode->custom_freq >> 16) &
+			  0xffff);
+		VEC_WRITE(VEC_FREQ1_0,
+			  vec->tv_mode->custom_freq & 0xffff);
+	}
 
 	VEC_WRITE(VEC_DAC_MISC,
 		  VEC_DAC_MISC_VID_ACT | VEC_DAC_MISC_DAC_RST_N);

-- 
b4 0.10.0-dev-49460
