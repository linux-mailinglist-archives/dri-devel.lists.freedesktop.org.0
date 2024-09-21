Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AE197DC82
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 11:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFF110E173;
	Sat, 21 Sep 2024 09:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="uwswMxnJ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ogc+tI7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861B10E173
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:52:49 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id ED0781140253;
 Sat, 21 Sep 2024 05:52:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Sat, 21 Sep 2024 05:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1726912368; x=
 1726998768; bh=nay3ZyN0cN/80lVEv9bgr4vS0wpneM/GiqVSWG6S8J8=; b=u
 wswMxnJRVGPk1w0GshhQ3R16g7oTbJ/m6qkHiHeQcBdMAC3yfKzGw6oo194ROMsK
 qeY5TABEliiPacbLsqt/sBOVpyDR7GOFdzxVsffUFvUBESd4NPQj/4sGyeyCDa9p
 kMUYkJnzC/oNOu9Q3gTgeD67bGyDfDbNbGFvkPYfGDPrmmM9ITcQ2x6/mjwFkmu9
 ud8lyRK2iL+M0J6+25qWV58K+ut3Ct0GqI4SoW5btABX4rKrmbSIY1KgsOZLX2OT
 03pBz+rzHuv6Z7YAc/ZGXIGee2NUa31dcenZpOTdpqxWuC7gWwAL7CCK5SEJuGi7
 q+TxAkCfiNSj0MnIqUaAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912368; x=
 1726998768; bh=nay3ZyN0cN/80lVEv9bgr4vS0wpneM/GiqVSWG6S8J8=; b=O
 gc+tI7kx3oco+4QyFzLhXet0hno+iwlIg/TQeOi42k9bcFl/Bpz54Y8Og8As/DEC
 TBHqry5oOPjlqCvJdtvBGgPibntLtHO0Pzc0yU1ELH3nhsZwe/2x4aTHfFTSaIfv
 AOGZe7eBbpKN4J8VQJSj9HSJq7iFRH6fUupYxM27z0ANWrR9kM7NCHxQxEAkb+tq
 nTtft4hyrklyrJSMBKf5q85Dz7VhYvFjyO/IoJdnyAG9j4dKLPPZZ+ctyfeKDr1r
 sm0Bs9keXr4EVy3MQAN++OCByZaY8+6ZbulE+qaDdoI1pFsjoQ33BXk2BpZc6XIE
 jqwBnhqUs56blB2HaPoKw==
X-ME-Sender: <xms:cJfuZqLG8PHGnTGjn16fuYhpnlxIWuAXYWbwIQgz6YmlS7GdbYP3fw>
 <xme:cJfuZiI7SDe0XShkZunfLC7vModL5wOVFfiZIk5sEdjidvNZqso13zpoClQMBIfa2
 QqU-CDhONO3HyqR3w>
X-ME-Received: <xmr:cJfuZqsRmmVJmrthHlr5RZIcH1-r0w37qFe6kwWaAtEWCOX4JOQVcBHvvwvZdQnbwT6rcHA7U6Mx3nFcKLMQ_8789PB5rIDv_qS_JqUsV_uSDeCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:cJfuZvaTAIdugz_mg8_4ANCNWbPPOvLytHG_GEJAtsujf0U5TIRfug>
 <xmx:cJfuZhbIOffah3ba8w6_z8d_uvS0wdgDIQfsQbLZIahOn4U4xItjIQ>
 <xmx:cJfuZrCRjDYnX9vSgIjSilzzwk38zkqKA3woG4YPZujMMWfIRDFtNw>
 <xmx:cJfuZna5m-XKGg05MtUpgkC4WD1RbzO5uK_mOlwa46hFdYdgID1ujA>
 <xmx:cJfuZuLZx_1LXWGi2bocp8O-18fR441BLaTBKieconAvzDtW7jwSSeO8>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:52:42 -0400 (EDT)
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
Subject: [PATCH v4 04/26] drm: sun4i: de2: Initialize layer fields earlier
Date: Sat, 21 Sep 2024 21:45:53 +1200
Message-ID: <20240921095153.213568-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
2.46.1

