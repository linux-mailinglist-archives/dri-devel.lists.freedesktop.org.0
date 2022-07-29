Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172185853E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090E4112338;
	Fri, 29 Jul 2022 16:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1457D112EDE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0752358092E;
 Fri, 29 Jul 2022 12:35:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 29 Jul 2022 12:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112544; x=
 1659119744; bh=Piuly92aaJFxSVJhjTs+noDe9qR4aoY87LMU5VgChJc=; b=X
 fIQg4wGk1mpoOyBrgDyHTSVX8OBs3DOMREVVij2Nnpp846qxvqYJVhI9pvwG/22X
 oIX8TNTNBSwKiMEixZZ6piR56Ass3a+ERuc6Cg5IfxWEakM0mdF2ux/8hcccw1FK
 Oob6m/6lsQuRpkOS2OpiuTx95JeryS+1JtCQCk60ao4L2reifjPPwM/kOIEnbpnC
 ze09ixdffeVLYCDH6cvIn6QhK8g1Pf8WCUO74cb4fr2QdSvq/+t+wXez2ESP4TPU
 qJMheVw4pVB4nbzKAxX3SQ8dOlDQDAZQOyQHkUBIMvPiAeoMpn3M0sOu2yPxbhlp
 j/wL+7uPGJtiSt76J/RPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112544; x=
 1659119744; bh=Piuly92aaJFxSVJhjTs+noDe9qR4aoY87LMU5VgChJc=; b=0
 18t6rjhQDFxsIgcAsYF/tIyElFrpkRbpoXO9mTFyN2XvoO09mX0vx3CwuEfIhLFI
 P+WSO64i9Lx2d3ufEhwI4S3zGVM1b7UesNNRLY4W1JUDM35S35cWdLbtAw7daf3d
 Epy9bvQErHE0Duwuu5XmJalzPQQHWaWfJ/ZHeWY1WGhC+B1wuIOkFB1V6t0bkHaE
 aHzZF9ka09uJBVgmZMY7Z6ke1xO8MDHN/cGb2S8TzmrvtKfqJ31Go6pkQPUFAz/8
 c7EYTiJFttFVfICJUODf38mLJuolbxCE6xvFUbbFOAM0VxC8KxJt6Q3dOMJrEWIt
 rT0KbIeDu8a7kdD/Hbv7g==
X-ME-Sender: <xms:XwzkYkTmN0ugPpymP-aGSrpRxnc0PR4DvuhVzfe-uTLSoRUAca1JLw>
 <xme:XwzkYhw_VMZzYILKO8FG0_NkQK_XfAwSR9vQkXPTDNlRrbxQGdUc4HPOt7luRMBef
 N1NE0sSYZ9d7uziTls>
X-ME-Received: <xmr:XwzkYh1fwo9U_dmHY-WZCus6uxOXgKAhX9JDfE5RKmaDU7i32xvsS3oe8T9DfNanq8WTVpA_EEkAKsOMY6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XwzkYoD51fBbLDDHr-X5MfyLWJ4uS4KwuaIsYgf2hGDiowbh6xLEZg>
 <xmx:XwzkYtj_hwfh-4ovQb4TG2D_j4QJ0_8hV7qDMkNE-XMZ3LZq82DrXw>
 <xmx:XwzkYkqbyhCTz96SW7ch1j2Y_7UsWL5Y8UPyd_yBnjBIPWSnzgkJxA>
 <xmx:YAzkYsQTINi6znJnaXUeMwDhtLrFUZ4VkceZFMQ24D94Fv3XjGlgTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:42 -0400 (EDT)
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
Subject: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Date: Fri, 29 Jul 2022 18:34:47 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cMSAEXdEomRu9CA2Xoi4TxGpQx4Z47j7hj4nQ3DGJ0M=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VH61eca8fWR0ZYnorV83/3XPzvM4LrK5tXy6OSA483G
 AkrCHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEyEv47hf3LoDjeJSSKPZxrsdI6b9P
 KBbJPFmd6Dz92i/hWGRahv+s7wz+JL0YELZo8/6aSF1jJev5BoeljpidqhK3p/lv3KEk58aA0A
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

Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
modes in the drivers.

Since those modes are fairly standards, and that we'll need to use them in
more places in the future, let's move the meson definition into the
framework.

The meson one was chosen because vc4's isn't accurate and doesn't amount to
525 and 625 lines.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 304004fb80aa..a4c1bd688338 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -48,6 +48,24 @@
 
 #include "drm_crtc_internal.h"
 
+const struct drm_display_mode drm_mode_480i = {
+	DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
+		 720, 739, 801, 858, 0,
+		 480, 488, 494, 525, 0,
+		 DRM_MODE_FLAG_INTERLACE),
+	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
+};
+EXPORT_SYMBOL_GPL(drm_mode_480i);
+
+const struct drm_display_mode drm_mode_576i = {
+	DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
+		 720, 732, 795, 864, 0,
+		 576, 580, 586, 625, 0,
+		 DRM_MODE_FLAG_INTERLACE),
+	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
+};
+EXPORT_SYMBOL_GPL(drm_mode_576i);
+
 /**
  * drm_mode_debug_printmodeline - print a mode to dmesg
  * @mode: mode to print
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 8110a6e39320..98ec3e563155 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -45,21 +45,11 @@ struct meson_encoder_cvbs {
 struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
 	{ /* PAL */
 		.enci = &meson_cvbs_enci_pal,
-		.mode = {
-			DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
-				 720, 732, 795, 864, 0, 576, 580, 586, 625, 0,
-				 DRM_MODE_FLAG_INTERLACE),
-			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
-		},
+		.mode = &drm_mode_576i,
 	},
 	{ /* NTSC */
 		.enci = &meson_cvbs_enci_ntsc,
-		.mode = {
-			DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
-				720, 739, 801, 858, 0, 480, 488, 494, 525, 0,
-				DRM_MODE_FLAG_INTERLACE),
-			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
-		},
+		.mode = &drm_mode_480i,
 	},
 };
 
@@ -71,7 +61,7 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
 	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
 		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
 
-		if (drm_mode_match(req_mode, &meson_mode->mode,
+		if (drm_mode_match(req_mode, meson_mode->mode,
 				   DRM_MODE_MATCH_TIMINGS |
 				   DRM_MODE_MATCH_CLOCK |
 				   DRM_MODE_MATCH_FLAGS |
@@ -104,7 +94,7 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
 	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
 		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
 
-		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
+		mode = drm_mode_duplicate(priv->drm, meson_mode->mode);
 		if (!mode) {
 			dev_err(priv->dev, "Failed to create a new display mode\n");
 			return 0;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
index 61d9d183ce7f..26cefb202924 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
@@ -16,7 +16,7 @@
 
 struct meson_cvbs_mode {
 	struct meson_cvbs_enci_mode *enci;
-	struct drm_display_mode mode;
+	const struct drm_display_mode *mode;
 };
 
 #define MESON_CVBS_MODES_COUNT	2
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index a80ae9639e96..b4a440e2688c 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -394,6 +394,9 @@ struct drm_display_mode {
 
 };
 
+extern const struct drm_display_mode drm_mode_480i;
+extern const struct drm_display_mode drm_mode_576i;
+
 /**
  * DRM_MODE_FMT - printf string for &struct drm_display_mode
  */

-- 
b4 0.10.0-dev-49460
