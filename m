Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801015EFA93
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884410EACE;
	Thu, 29 Sep 2022 16:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5DE10EAC3;
 Thu, 29 Sep 2022 16:31:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7FA80580801;
 Thu, 29 Sep 2022 12:31:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469073; x=
 1664476273; bh=NqeEFRbtHik2o4qNm0P0DotZ0TS6EZQpNbFNGjmzYcM=; b=S
 KYVJZu0/wyKSbS7etD9+G3zSgkvitng+iIZm1GD75/yxS2Qq5kysvLNqFNydVpWX
 Eydo3qbea4aoEIZCGkVYerASynUscf2iknGdOK2dKoUzQi2oHQhUGJ2+RH3pgaFe
 jaKETPXsWLVxDwFyla0WN70Y6dZlWdc67bJvgHymz7Fdr3fjLM2xyctJJqwjLXav
 sZpkfZST8Vkm0YjqOg5/aavWhqdc/fzdfvSGeOzwB6CW0f8sWvcoDQ+uvO3/9XE/
 DQGTuFpG8zykHSTZleZGjWN3NowAUu7LROxi067WLbr/ZQnVSzHVMHCnwsJPwTvD
 Jkzdp+Cj4PGVx/Oegr9tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469073; x=
 1664476273; bh=NqeEFRbtHik2o4qNm0P0DotZ0TS6EZQpNbFNGjmzYcM=; b=P
 OqMyZQvNMh0J5pvNvgNuHe95I2TYpmOznE9Ow1EA/1m7Uaoi6wW3wk4niHXwjwnr
 NeFWn0NcUxXsE8DMHXC55BR+m7GjbKS00QvSVe0p66Gh1Jnor2Ex1HDDG65dhYV5
 Ib4gQ9jxPd9l4YUCBzX2KJ+Xe46Hd21AXpo1Bxv2pvaf+YPox/J3MAfAmq/prnoG
 Jtqez7itSFQB//RqlJgweUkdvq8mGHKKctmQ7vwbVuESjh1idsk9w4O3GeTdBUCM
 hPnHVfxxDMyVQPliGWgrj5xXHZjuUlCFdjQGjMmMqkSWwJPYG6RaSZ5X9yEf1VGj
 4TXYClCecLkUN+vKEGk+w==
X-ME-Sender: <xms:Ucg1Y4AdbZ_iZJ-btCqpQDf29p0WY9Ck4DLmicmCEuGJfosC8Y55YA>
 <xme:Ucg1Y6ir7GN1EY4dhSWNQdaj0gD91por6M_D3e6_xRPiIgiJhkKyJEe_GscWVcTtr
 OOAloDnDW1zYitpvwQ>
X-ME-Received: <xmr:Ucg1Y7lePhS5SH7hqcaVtae_d71OMGni-_jzTmC4ELp_yMmCN1Twn1r9CgrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ucg1Y-z2F61ZhrTwDogtVOtoP-PVQMrDdFjrLoijptgYCpwcSE4tlg>
 <xmx:Ucg1Y9Tu38AWJ3EBsgJryHR2CzFW3RgkL1Y_kXLfzYqZlk3WhAeK-A>
 <xmx:Ucg1Y5bEQdQQJAEuQDUzze6ooYK9fRp8sddfCEbewSMwpXSKe0-AuA>
 <xmx:Ucg1Y4_0ZpUqm9NHUlSF9MKzGwgANV3V4sF-RcDg6YnR-bUxx78vlA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:30:56 +0200
Subject: [PATCH v4 02/30] drm/tests: Order Kunit tests in Makefile
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-2-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=HuwK97Xq6h9BSxzpkyXNZrIGuAN2vJJSVgoZGWP2G7k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9z2/nnQ/MnfWyc5I/wlr9HM8gcRllFem9S1jr492Nxm
 mtLTUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInwNDEyvO5cmneFr+hQUWiGb0hwp+
 8mfm1Zxjcrg1bflYp+/KCHmeF/4bVa7+6dZQaup3s0G6z0+Hb0u75TWG37jPNd0KFn0VY8AA==
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

Since we've recently added a ton of tests, the list starts to be a bit
of a mess and creates unneeded conflicts.

Let's order it alphabetically.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/Makefile | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 91b70f7d2769..2d9f49b62ecb 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -1,5 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o drm_damage_helper_test.o \
-	drm_cmdline_parser_test.o drm_rect_test.o drm_format_test.o drm_plane_helper_test.o \
-	drm_dp_mst_helper_test.o drm_framebuffer_test.o drm_buddy_test.o drm_mm_test.o
+obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_buddy_test.o \
+	drm_cmdline_parser_test.o \
+	drm_damage_helper_test.o \
+	drm_dp_mst_helper_test.o \
+	drm_format_helper_test.o \
+	drm_format_test.o \
+	drm_framebuffer_test.o \
+	drm_mm_test.o \
+	drm_plane_helper_test.o \
+	drm_rect_test.o

-- 
b4 0.11.0-dev-7da52
