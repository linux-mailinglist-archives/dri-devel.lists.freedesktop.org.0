Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004825EFAD8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B660F10E62C;
	Thu, 29 Sep 2022 16:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7B110EAF4;
 Thu, 29 Sep 2022 16:32:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6871F580800;
 Thu, 29 Sep 2022 12:32:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 29 Sep 2022 12:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469130; x=
 1664476330; bh=DrWOk2ihzJHxkJ+IH1bPLn7A5tu4crGDmeNO2S0VXzg=; b=d
 uMzcYnqgAS2lVDbTz/saPWkMyBaRmJvVI9tmqVIhHInTQBHr5CH4e8rzUXYIMZqF
 pxCmbb2cyVaXOjZMrB6bqHn/uMuDWTk1iY6r5sOUuHF9QyCdGq+5A4lYXetvffOc
 zPecf+8FBCT9yHHnTTtf7xpKiZ+KnO7qvgLv7aELtTRW4jN8/WfDnQ2PpzSsezY1
 hdxZjymV1RU7iP5da8Au3VM/BcixME+kNG0gf70Re5YlwJweq+gN8xYLkFA9xNjW
 xnUWoV8DK5ChwUSmgLcEtB57ZkbCXnlkNQ3zSTPZhaj+cAD9/QETJ/JL6lBvry9P
 exJk5jSXJ/Z9Fw0m/LpVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469130; x=
 1664476330; bh=DrWOk2ihzJHxkJ+IH1bPLn7A5tu4crGDmeNO2S0VXzg=; b=W
 mC4h/dJ6lYFOoRtJ81k/5JBuxtbYGRRH+g1iUUA8DGgUPdnCTljTAg5hl5bSMfr6
 nO+G5vuXtLRLiH0bFUAL2Bp7ZLTRoLNM3q2tBpRMUgjVHQM/qqHqd6K+yD8Mn7N9
 h7BwNW1WI1G91tU2VW8Hg3nAEU643hBy6A8oj9zlIk/JBBXch4sLdhgn10P2P0MC
 Qkga0YQKBYSngZ7llop9hGmybm026a8Gl7iVaVf6wAsWSGDoPBKp+wTYw+vYCPTG
 0bgdjaZlyolne7iSrvzKiDSphVnz6/BK6LmGz5H5coweG6B7fhhAfPbkLM2O/+gY
 WKCPeWqTCWCoA4by7SxIg==
X-ME-Sender: <xms:isg1Y4366fhtLDMaQGiW-X8D7aoy_nlM_2e5LZq-5qnrVMdqy4oYTg>
 <xme:isg1YzF4rLpbJAQoKiXfGCu-1hD3JPAnuIxhsUujIQo-q-6YAatgf0gsohiB5MjJt
 3hGG-ZqW53b5FdFLeE>
X-ME-Received: <xmr:isg1Yw6L97Huoet2Ijephwb8aZjqugUw8j5x8q--S3ZNDYF4h2RFgJYvolpn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:isg1Yx01IMfEZN35mhOJ78w-c4UiqEoufVlUq_tzW9z92ns_8ra43g>
 <xmx:isg1Y7FvbhF3iEDyGb2NgxHYqZLzAfhQwBSz0HpDiHEwlcQ8QI_3FQ>
 <xmx:isg1Y68wcZr8p7QXd_vPreBBe22EMWxvmKFZJHVURUhg_0t7-7_z6g>
 <xmx:isg1Y7Sn_tGbThZh5gp8ZDmlZCBvg4MoymR2YeZBmLfdtmA18vnSrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:19 +0200
Subject: [PATCH v4 25/30] drm/vc4: vec: Fix definition of PAL-M mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-25-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Yx6xetI7W1bi6cUNbRZTYvzIlC7IPHunx4eteH/lSq8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzyecRTvmlSdpm0goMJ5JsJrxjoOXaNZO3srfq2+yPT9
 5/aXHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjI1gCGf1q6N06Gx+e/mVTbx6VYGb
 V8hV+4zb9jt9m2Nrdn3Oa2W8jI0Ff+iP/W0n07Pds0Dre2d17Y9cxpncv3OBWVlPOL33iF8gEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

PAL-M is a Brazilian analog TV standard that uses a PAL-style chroma
subcarrier at 3.575611[888111] MHz on top of 525-line (480i60) timings.
This commit makes the driver actually use the proper VEC preset for this
mode instead of just changing PAL subcarrier frequency.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 4d82ad30449b..adc9bf99e3fd 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -69,6 +69,7 @@
 #define VEC_CONFIG0_STD_MASK		GENMASK(1, 0)
 #define VEC_CONFIG0_NTSC_STD		0
 #define VEC_CONFIG0_PAL_BDGHI_STD	1
+#define VEC_CONFIG0_PAL_M_STD		2
 #define VEC_CONFIG0_PAL_N_STD		3
 
 #define VEC_SCHPH			0x108
@@ -255,10 +256,9 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	[VC4_VEC_TV_MODE_PAL_M] = {
-		.mode = &pal_mode,
-		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
-		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
-		.custom_freq = 0x223b61d1,
+		.mode = &ntsc_mode,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 };
 

-- 
b4 0.11.0-dev-7da52
