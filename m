Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B95853CC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5417410EC4B;
	Fri, 29 Jul 2022 16:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9053113F31
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8D6FA58095D;
 Fri, 29 Jul 2022 12:36:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112602; x=
 1659119802; bh=KDco9eCGDduZLjJ6UEu8nzvgHaRDBuru3VXQGkkLnUI=; b=n
 E0tkzx03WN5TiLGs9ipU/YdE7rVpwNKNzk/pRTKLVCzktxzmICb5Q/h7Hh5rzw2a
 2YzFLyOwiRCBiGtDC80HMZLaeRL5og1zTLggerFpWOIyn2vt9CmqqChXcrwAurS4
 Jym+kzwu5t0LwtvkLKYup8xKX7jYeu/CDrBuys1TIzC1EN25TpnFQYGqUegKnXFN
 wFp7cARKd3czLfIAxtfuutOaHAD9XsCkzyy+OzWtDFBCQ/bOUpXx2x7nNjC/BCjT
 OkbQshwaTiUfXdDO2clZoG+fw8+OEEJZSFDd4xNnagLgmzV1i37qC6XFKOV7Z9jc
 qRetOt7bLl6FHZV1FVyXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112602; x=
 1659119802; bh=KDco9eCGDduZLjJ6UEu8nzvgHaRDBuru3VXQGkkLnUI=; b=o
 WV8/cNEZ0Bym/9XhKH/7zycveDBjY5tcA20WybRz1B+ATy40EIWgkt12sw1mwXs6
 GUSapHLTLVIWlUEy3cC9o+NpqRA+v5pBpwLBk93nGFrGLz4hbtG2ydvDX+xnfaRl
 mNESpTI2hAXOkTsPPDsPjldemnVafS2dkwul1i3yZuxFh2MjrXe7P+BsEUYVwbLn
 QpngoNdNBJ3VD/guJW71fdvqy/lVREqip1rpOjZWwGwVE+KOtTLyVOXD3xyJkRT6
 8Oj28MhnzG8RTtxvJOPOGBrQgd1m6zpoufNCUsU5+uOHJobo5gZl9yCkJkn/8t1p
 4faUZRuRWtZGNugpOIvMA==
X-ME-Sender: <xms:mgzkYmucP36Vpc-a6lTYbXnMumf4bqNkVpwez-8tQs0WEte6xVQstg>
 <xme:mgzkYrfXNyx9YSmIsks0TL3ASWmFGPN-D7RG08MoE_F18QC83PnSx9TwidZJGx2-U
 VQ8FtSgNArqQou1YNk>
X-ME-Received: <xmr:mgzkYhybqYWfXz48ckShCNcCgvEzwAMs4fAkAKieNDaYJuoCLKFAXukttqY7_vFV3ISUarf-y6_UAlmEfM4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mgzkYhOfRdU76YScxjxocfsh-WVZcfJ-6WN7qee43NxZkAV4gJ4Z5A>
 <xmx:mgzkYm-RV7f1DsPTgJn-H02U4cYhWpmMsqKsBV-9P79eVtgao12_CA>
 <xmx:mgzkYpVCLZIpV6lx97soF8YMRWaVF7lvWgmhBHPJtr8GI5y_BQw2JQ>
 <xmx:mgzkYkM7aJOOIwfsy--kdPmtm9q1xKGzGNmA_gu1c_Ah4MxxI6AgkQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:41 -0400 (EDT)
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
Subject: [PATCH v1 21/35] drm/vc4: vec: Fix definition of PAL-M mode
Date: Fri, 29 Jul 2022 18:35:04 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-21-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=q6ak9G5lLCyLk1cD0J927SADrL34ogzk7cE5OcIe9fI=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VEKlez6xPWljINBRypiGZNEXLT0hsg1tk7ZX/P2T9z8
 ferEjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbSasjwP/brk6fLdqY0FsqcNUqOkU
 zy9VujZnyqwCaC5dTtpy8rfBgZVvyJmeHxb6Juh0Xrl2PnNvw9tc9SQedfZH8u8/PitsCybgA=
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

PAL-M is a Brazilian analog TV standard that uses a PAL-style chroma
subcarrier at 3.575611[888111] MHz on top of 525-line (480i60) timings.
This commit makes the driver actually use the proper VEC preset for this
mode instead of just changing PAL subcarrier frequency.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 255bba563fce..fba15a14787e 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -69,6 +69,7 @@
 #define VEC_CONFIG0_STD_MASK		GENMASK(1, 0)
 #define VEC_CONFIG0_NTSC_STD		0
 #define VEC_CONFIG0_PAL_BDGHI_STD	1
+#define VEC_CONFIG0_PAL_M_STD		2
 #define VEC_CONFIG0_PAL_N_STD		3
 
 #define VEC_SCHPH			0x108
@@ -241,10 +242,9 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &drm_mode_576i,
-		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
-		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
-		.custom_freq = 0x223b61d1,
+		.mode = &drm_mode_480i,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 };
 

-- 
b4 0.10.0-dev-49460
