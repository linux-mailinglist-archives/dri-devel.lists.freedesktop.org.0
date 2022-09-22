Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA55E6523
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1610EB7C;
	Thu, 22 Sep 2022 14:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551410EB4A;
 Thu, 22 Sep 2022 14:25:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9FC1E2B05B0E;
 Thu, 22 Sep 2022 10:25:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856737; x=
 1663863937; bh=GzvrS3y9EoBmuMQfDZjRp2mrXQsq7hD4pDiqsO5bxJo=; b=z
 O0lkzAQc8d5bSz1zw6fUw0PxrjRPt1GIQaGr19PmvLipmuPoNYRU7I7rE4TaPmRb
 /lkeJqqcocFSpqhMgVXvIlYptObRfV9hO7kdmnTzS/0PceojLPMnnXnFcBTIY0QR
 hf3oseV5OsT8vYCsC1zDXdaKeTIS83RyFHbC9eacBKWWPJi3EqOrmNYIrpTXF1LK
 qx+Xzir4XfgOeaCe7Y6S0qLcZBwnmfVNXbs2vGXbuml3+Em9Z2O50YugOhQmOJkj
 VvcQkFxabvS6MxZD+uikr29x4Zqi6mjITODqu7wwMLUHvI+RLlcypIdFcfCWCUy0
 QKzk+BbKDZIU9lG5/UFgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856737; x=
 1663863937; bh=GzvrS3y9EoBmuMQfDZjRp2mrXQsq7hD4pDiqsO5bxJo=; b=O
 kFjFF/VQVd2CVPjVql7OMaTlXjh5zjueL0A/6lOIUiGgEtgZ98qhgVr5V9IIpUWN
 ReJbSAITabaaFWPnP+3RDHru23Ubh7nkS7P81gNKbq0L17j3C6bKr8OuIzrPAxVt
 1yf7ES7kXpmRsjG7LhiVeSB3rGVAsgvTwd0VuzrgiXtQLWCknVzOnIcKz8ECeUCA
 TqMNpX7IOZN59P/3ypFDhjAw2GH1FBs4ea/7bvUyrOU5y3XAu8BHMR12KeahVb6R
 buQjdVMH2/1CtHDAixazQJhqi7i8Lf9ol0kZs5uUKo/3QGdkaLez/Vopu+2Uh5G6
 RdnbtUlK1gQBlzEd6FtsA==
X-ME-Sender: <xms:YHAsY_VMTDOC4gr7h88Iq8OytbZov3ZR4cA3XjXs056cWIlXbjXCFw>
 <xme:YHAsY3n-chRMQj7qgepD22MZ2CMOvLn00Xp0WHYoy95y-amu85xY-NZr23_pTNWIA
 r2-Bcsy2_kiVVn3ZUY>
X-ME-Received: <xmr:YHAsY7Zng4J6Y3kgb6rGI-Ar-ntPSuGLhFInXf7uwPPe1jIukLu-yS7vlJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YHAsY6UYzFV071pR-Jzyjbei4qZU0AIRFCv0FeiD_oCsbkzHCiWkAg>
 <xmx:YHAsY5mAavDFktMwNJfTw5lai5lUhkOwtESKBGpwLjYIEitZRxhx7w>
 <xmx:YHAsY3fT1MiKGcjwIze9TiqdnwNH-C9ejZEYwthYFoFWo0QhUJRVzg>
 <xmx:YXAsY9xaAdXHP1L0SWDEta6CV0hQ0x-BFFgYFGC5Zf6QxrTuBo8gosKsOf8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:25:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:18 +0200
Subject: [PATCH v2 01/33] drm/tests: Order Kunit tests in Makefile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-1-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xwgXAUzZ4rFgjLxuyhsyeBgnQ3zrH13dR0coPbfjvig=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQG1R5OsNh04f/vsHlnF7aet/yqntn1lYg48/19Ui114
 U4NlRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbicIyR4dVXvxyZDMEc06CKLr/btp
 HG+30X2zzT61noflyrxvSeBSPDMuHNZ5Nvxq+S8VY7FaB/lfm6ztvdXp11RzUktsRLLzNiBwA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we've recently added a ton of tests, the list starts to be a bit
of a mess and creates unneeded conflicts.

Let's order it alphabetically.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

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
b4 0.10.0
