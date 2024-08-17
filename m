Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E50955A4A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 01:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A60010E125;
	Sat, 17 Aug 2024 23:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="FfXnyVEE";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="GoONJZ0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD3A10E125
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:11:13 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal
 [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 27D2C1150152;
 Sat, 17 Aug 2024 19:06:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1723935967; x=
 1724022367; bh=qG2/uQfs+g0HVMch4QLUx6OeeZoxlVqfvaiVKsGcu3w=; b=F
 fXnyVEEa5CgKjPUP5oIkDFtm5P2epWyANxX+68IUk4ErOelFNZt5Hn29/0FcmKWE
 eZa/IaFFOcrhLvtGZqattG/fPQFKJS7TulXKSQ9vg3S5JUlFGuwkbk606uzbpgxe
 RXeqiZVBrcw3h5hc2gIKQND9645yEguUUpJyrz8FMT4KHzNzXxLvMKq0s6+HSrcN
 XgMK6QjFNRiVHwdJ+YC49TH+8cdI5o3xwY6kpJD6jmEKLEhuE9xjhAQSsfpKY+TD
 9Wkx0Jt3azjpZh6YXBjlKovryZTi8KadkCWJvG1fXXb16kUVrvL+RYDVNhnmMllB
 +B63KP681glKHJjryWSBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935967; x=
 1724022367; bh=qG2/uQfs+g0HVMch4QLUx6OeeZoxlVqfvaiVKsGcu3w=; b=G
 oONJZ0tg8AUQv+icT0AaPrKpKg2ChXaa8eT+n30yr1g9FurHHet2HI8UIQCYzkP6
 nff537V31kROgblSSA09IzrOculnnOvmIPaULVtdjOam7+4IG6oT2PYN2JqiDeai
 CW7JgVlDHBEu5W+JP9sH+JtkbY3KP6R0brGdZ8S6h/qoJMYw+JmlZbq7Bb4NAP+6
 AL55NqprH9Gc7MDb+2/hsSsav4j725VO3d5MAWwjVF0fQOAPdHJViMX/UuM+Usk+
 LCY4A+BoigYXCy4zOVYbfFX5sHJp2VEe5vShGMa7cJ3c++1eBscQ6V6YVT6KYN9N
 3NFMd4CZvVeO1coSl8n3Q==
X-ME-Sender: <xms:3izBZhGclOTxx4my1WN7oaAjyqbDo1nCzpI0zH2KKtzrPPtkjdgnZw>
 <xme:3izBZmXVH723BFK9k7q14EJUTOlZzZGUwEM6B-iJHdouUYXnB3LF88942jC_AlztT
 8-7LTCMxXTVrKrFNQ>
X-ME-Received: <xmr:3izBZjLywmYM0a-qSY6rquvyJYr8Ey3IZAa8j0ujVd91tyk2Ebg2dQenVdoRI3rL6BK5X_3cBrlIbrIGky_hRscZjyOKSF1Pd_o-parkON0YF8g9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3yzBZnF3lc2w4OWdzaAytsdYR4uIwukwxiT5mdlR1NVLv-FdlVpeQw>
 <xmx:3yzBZnUlYyhLKqh--2wjw-cO7JpeS6dZTPiEtrai005y07qmJ2kVFg>
 <xmx:3yzBZiOtoMQ2aCnDsXrdywTLOMy5_gvZnR-2ab2yTUObBXPsVPmO9w>
 <xmx:3yzBZm272HyPsZg0l7myGIVHj-_h5j7pEbY0Bt3fIPbAuCJVGjiD7A>
 <xmx:3yzBZtESxjyjUvli2DjGJQ-_UUmzGiQMt7mGVpcYetK1la2IKvfIalF3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:06:00 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 04/26] drm: sun4i: de2: Initialize layer fields earlier
Date: Sun, 18 Aug 2024 10:45:51 +1200
Message-ID: <20240817230503.158889-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index aa987bca1dbb9..cb9b694fef101 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -295,6 +295,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -325,10 +330,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f3a5329351caa..3c657b069d1f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -478,6 +478,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -536,10 +541,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.46.0

