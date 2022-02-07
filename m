Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A914AC5D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862210F9E3;
	Mon,  7 Feb 2022 16:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1917B10F9E3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9C87B2B0015B;
 Mon,  7 Feb 2022 11:36:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 11:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=V8EVNwc5nHynWtDy2ZcZZsjHZn7jq0
 wud2WmvRiUFsM=; b=WF8LhGW4cnYGmHwbJtXnP0iTA2MujGLHhFHw5pFc7WqkJL
 Ln/Wl7D9SzVJ9KeeMez8oWFeD+arJ/7w3IiMKUqyJCHI1Qv9qGo+40izdo3cOUoQ
 sIy1RqZqJItjivQH8yy1crvrqimqbQJqCK2rH1WRz7eIOFn6TKJVb5MytbKb6yy5
 EJ4j5ai9soxy8PdzaaPe4jdvbXxiOJfPGq8jmwmQQOAjm1RLMJHaLK+hIZO9C40y
 JhKeSuXokSSO6PnlAHhefK/FG4oMC2Pdr7kha7rj/TTZGQzwO7leVEeQ8WV9vIvU
 G05xBbc22pzHlNj6tG30a1x0aQhGTKrGpvrFVjzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V8EVNw
 c5nHynWtDy2ZcZZsjHZn7jq0wud2WmvRiUFsM=; b=SNeqJBqShwbxVaQEGvHE4u
 C9dBFZJ0M46qhEhyCpDj3ToiC/J6jTvI+qzLkl84VXYgkgBBKd+X+9kF51P2vL2F
 yGQhWotIyRkvqCmiglop5eN5cwX2kQ3qewzzvbFY/EeowPr4DQOjPn8fWyBNrtNn
 GaQsqXuBGi5iOsSSzJfMgsWyQ6UxwVPBk+Xe/FZx9OacoPpC+GLmivJiWK9LhffZ
 h0NYu/l14FhQbTMviFdWGq37XA938Dk1NahTuP4oqF60R/mb5wJr2P3cvpjiF6qF
 HkQAbUTGMRwcX40iQb0XXu71RQCIrX2ABxi5d8I68uhnQnEyMSiSFWQGD+/RASCQ
 ==
X-ME-Sender: <xms:f0oBYqfM_Iwci5oicGPUUlB3UlA-Khuu7XD002MdbndSkFxjXNaDZg>
 <xme:f0oBYkNJa-tCPHEK9bZaiI21va4XH4fRaquy2CZoaTbqjweeOpUg3hD-NyqPBvwaE
 -oLeltitQbM_k4irMM>
X-ME-Received: <xmr:f0oBYri7pDuQKpxXFavJ-N_9LM1zjf9x0bT_jy6gXnapsQIPIUfra3ed6ED34hjo-a9JpRZSWnqR5n9033XiDxyuiK-qOnc2IFILEX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:f0oBYn-pTkim-6lC4kUOPF_MgyZbHUhRS43JOyyuuRk0by5Oly7JpQ>
 <xmx:f0oBYmsJHhXsZ1t98zB4wlhKPmBR6zXCeOt-1dOcNVk1ZlarIRw2Gg>
 <xmx:f0oBYuHAyvM6rx-6oNV-ViKN1QP3TEgQCl7G9es0LAEov-AZUdHOYg>
 <xmx:gEoBYnFSlKgbwuUogqyx0VSXMPth90QhVI27Y7QbBYyX3-Ie3kk_YEWjqEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 18/23] drm/sun4i: layer: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:10 +0100
Message-Id: <20220207163515.1038648-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sun4i KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in sun4i_backend_layer_reset().
However, the helpers have been adjusted to set it properly at reset, so
this is not needed anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 929e95f86b5b..6d43080791a0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -18,7 +18,6 @@
 
 static void sun4i_backend_layer_reset(struct drm_plane *plane)
 {
-	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 	struct sun4i_layer_state *state;
 
 	if (plane->state) {
@@ -31,10 +30,8 @@ static void sun4i_backend_layer_reset(struct drm_plane *plane)
 	}
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
+	if (state)
 		__drm_atomic_helper_plane_reset(plane, &state->state);
-		plane->state->zpos = layer->id;
-	}
 }
 
 static struct drm_plane_state *
@@ -192,7 +189,8 @@ static const uint64_t sun4i_layer_modifiers[] = {
 
 static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 						struct sun4i_backend *backend,
-						enum drm_plane_type type)
+						enum drm_plane_type type,
+						unsigned int id)
 {
 	const uint64_t *modifiers = sun4i_layer_modifiers;
 	const uint32_t *formats = sun4i_layer_formats;
@@ -204,6 +202,7 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->id = id;
 	layer->backend = backend;
 
 	if (IS_ERR_OR_NULL(backend->frontend)) {
@@ -226,8 +225,8 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 			     &sun4i_backend_layer_helper_funcs);
 
 	drm_plane_create_alpha_property(&layer->plane);
-	drm_plane_create_zpos_property(&layer->plane, 0, 0,
-				       SUN4I_BACKEND_NUM_LAYERS - 1);
+	drm_plane_create_zpos_property(&layer->plane, layer->id,
+				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
 
 	return layer;
 }
@@ -249,14 +248,13 @@ struct drm_plane **sun4i_layers_init(struct drm_device *drm,
 		enum drm_plane_type type = i ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		struct sun4i_layer *layer;
 
-		layer = sun4i_layer_init_one(drm, backend, type);
+		layer = sun4i_layer_init_one(drm, backend, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
 		}
 
-		layer->id = i;
 		planes[i] = &layer->plane;
 	}
 
-- 
2.34.1

