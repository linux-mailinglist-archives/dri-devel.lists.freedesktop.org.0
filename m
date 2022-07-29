Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F5853D1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92C10F48C;
	Fri, 29 Jul 2022 16:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4211278E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C9F1958095A;
 Fri, 29 Jul 2022 12:36:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112599; x=
 1659119799; bh=AbNcPzJA6v/1uyYWumbYgSqegXZI6Xt12q0cobRS6KU=; b=S
 2ZADGuo9ZIFB5W0yiNQUOgLYWbIvo3HriE7GN2yzby9+XyODXiuUp4zd12rZnkq7
 PznbIbn/ZssNgWJh0/XoDoMC794l1lBDZ+3iqkQEn+Wf8Fjfs/Vxss3a/Ivj0GFa
 RvmIIbjotac56Ab8FrKPH8ZQpH+4pBNZsQJw/Da4sJkv2s2SDFbJgCXs61rSgVWy
 teSAmefS3UgPmHaJ/4Ag3bu7t6bQZUlzWNSjJvM+2bkqXNMH3pK/W1MIYvgpMHaI
 qTWJxPE/M51B1iBA68ot4ODqW5bHK/NVa7pEjXe9+WIgsv7LH6mnfFPk9Sd+tXw3
 1QnVG5BUidOVd9uYR5EkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112599; x=
 1659119799; bh=AbNcPzJA6v/1uyYWumbYgSqegXZI6Xt12q0cobRS6KU=; b=c
 uXI7RYXu/CYtaumHSYijNmhPTAc69E6acqDsOPEiJV2DhisNYOMCEPnyvHyQZN4e
 ANEog9t3IJ/EfK6UukMBauG4sOKb4asdVZ5KEQkVGh+Ike51K5Qx3mry3ZTzYPXm
 LF6AQmFom6pP+pXN9J2Z/jt59PqUiTAlXrKy+iVAYPmJzwPhpzZqGGPu5deJE3V+
 z6SDqU6KJP7lPXrBH8FkvC3pjHzfuxWLg5YDWyOGjlgtKtoOWmhIdOnDc4UkOrbL
 eLmtZrUeCuTZgwVK2syhHpfD15lsAXrCNfCvm74q3EMB51ducvJSO8WLI6cjRyZY
 vQgojyOliaep7cfJCcY9Q==
X-ME-Sender: <xms:lwzkYrlwtQbB9iUJk1UbRBhYZZRkFDu0gcRDFIJ2v8jrOOmZAJttRQ>
 <xme:lwzkYu1QCX8d1xOUk4s8Puw3GJl-3Fc4VtsNifpylob9Qv9LZu8vr8tyElTb07eBo
 mYS-toW75hQOeB_BRY>
X-ME-Received: <xmr:lwzkYhq7iI00-l5t1a6YTQnQ5fGBEb1Tdc6hUbEXtkOkTrPg7GGuzhIdl2Pg07ARMaziBROLbsKhg9eyUPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lwzkYjlyLGinsBuVLZofx8nnnRUx2NrpK1IBbo_CEYH9ohfL0hWL-A>
 <xmx:lwzkYp2cW0CWHRhw4WbOKTaManrumGwEiDVsrHJPooatTp2SHQrFNA>
 <xmx:lwzkYitZWb2WbmxenJVAsYbFkt5v2bnekBwkxuviQNS6oikBpUwoIw>
 <xmx:lwzkYkEyfQPOf0np-oHcelKkmbaysisF36WQNRIwvbJPRXrn_gkSOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:38 -0400 (EDT)
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
Subject: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
Date: Fri, 29 Jul 2022 18:35:03 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=D8SpF+ipMcOmIfOKSwAuLhopKhw+DWNbLfscw43wats=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFK2TaX/aiA1Achtoznca7X69ijj0Tuj30usYIxbZJd
 9WTTjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbCsZGRYdol8Ulb9X32PT1Q9btpcf
 zy+2v1uZzqw9Vu8bS0rWnVnMnI8OXmB/vuB15sk04aqmrlFM8UvDg1JkNmqx5f7YtQt0y2mwA=
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

Now that the core has a definition for the 525 and 625 lines analog TV
modes, let's switch to it for vc4.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 8f30a530b2d5..255bba563fce 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -224,38 +224,24 @@ static const struct debugfs_reg32 vec_regs[] = {
 	VC4_REG32(VEC_DAC_MISC),
 };
 
-static const struct drm_display_mode ntsc_mode = {
-	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
-		 480, 480 + 7, 480 + 7 + 6, 525, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
-static const struct drm_display_mode pal_mode = {
-	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
-		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
-		 576, 576 + 4, 576 + 4 + 6, 625, 0,
-		 DRM_MODE_FLAG_INTERLACE)
-};
-
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	[VC4_VEC_TV_MODE_NTSC] = {
-		.mode = &ntsc_mode,
+		.mode = &drm_mode_480i,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_NTSC_J] = {
-		.mode = &ntsc_mode,
+		.mode = &drm_mode_480i,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL] = {
-		.mode = &pal_mode,
+		.mode = &drm_mode_576i,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &pal_mode,
+		.mode = &drm_mode_576i,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
 		.custom_freq = 0x223b61d1,

-- 
b4 0.10.0-dev-49460
