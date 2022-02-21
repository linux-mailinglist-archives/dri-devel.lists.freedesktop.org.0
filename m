Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D64BD8D6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C8D10E2FE;
	Mon, 21 Feb 2022 10:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E341D10E847
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C2A7580263;
 Mon, 21 Feb 2022 05:00:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 05:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=+znYlsTYo3T9d5Ixvozjp/PRDBbb4A
 hXJw9LtbbgDbI=; b=kLFncAvw+M+JXuOKheuemYtEiaci8pToqcFfoujpvn4vIF
 yaIUPNMvnyimc/qVZulxA8RcSvGCUuPriPOrksdu8gfxDyqjUHwKki0K6x8KFL4K
 EQrljq+jkwsGOlLdTHP+t5eiB/Fdq97AssieErL3dejUqo652Al3khNv9l9Q8/lF
 ZfkiUCijYyVAzHrjYa8kWROvB9NcV+FsONH2uPIP4lGbmgaWWgSPNcR0bFe9RMpU
 Ds+pg82QFIKm5ovd701gGiu/n+WHxj85wzblVPndvmpgjQDIp/YPS2MHQrF59Eo+
 tQwTqb5HCciGqbqJB9sthtEkGT3hegkSd4wDLnaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+znYls
 TYo3T9d5Ixvozjp/PRDBbb4AhXJw9LtbbgDbI=; b=Y5hnJ2TBIugNOd2Gt+d+UB
 OQY9Qt/jXnQF0or0ep7j0qkMnmq85/dX5q+9Mr8bFKsqSdwsaOHPCK7FRJl4Z30C
 uMjFiL57HlQJjy1lsJjyRPzSzNd2T9u9jrnbeIfGJlD61S+FIMRQ4jElSCo9FBrX
 KUokFG4hD44PhO+IC4sDuUq8p9b+QRtGlE2Mwaj4raht6UvXu880fzhqhjtNVvyH
 9Xwya+pkgHzfMMEPlDrxFFR+qyQHl0CNxRCBCH0SpnNlbjFjxoMWCt0XGknuZcco
 lMP1ZIGAInLpkcJaZ1h/lfACR3iSv10VeLNEep8+mym4yFxSFDx+YTWWGFL/Hk1w
 ==
X-ME-Sender: <xms:n2ITYmZM7HcQ1jxHSPps16Kn52Nq-Bw3zryfrpBeUyWfr8BEIxXWEw>
 <xme:n2ITYpZHPoar1W5lnsvoiFHoIvdk9dcmTK_3dQVYFOgO24Qp7T4Fpnh_L2eNCvQy2
 6wRCoujR93WKm_B5zY>
X-ME-Received: <xmr:n2ITYg-XfSZOUihbpkaC3KfUyzs3YgN6u7EVYyQ1Ejfs-68Si2ffuC7RGYq8B8oSL5-jGSUwsBZ31LCEEcheyHGUSpMksxatwMZJAKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n2ITYoo36METSUamRnKOYwx2ndZxiMYwRxKnGxKfUtVB7_ObX0HFSQ>
 <xmx:n2ITYhpmQU14yhB5bzQED_EDc4XUkunK0TvxfwDtrWV7n3Uu5VpawA>
 <xmx:n2ITYmRxctPYvE-_0hl3Kj3IrwQqoX6SsD07scIuop4Do64dKiJKTA>
 <xmx:oGITYvgrKhwlgSBMDswTU0AdMSjmMun0Ywc6Tjw0AFaYRW6Rljlkjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 17/22] drm/sun4i: layer: Remove redundant zpos
 initialisation
Date: Mon, 21 Feb 2022 10:59:13 +0100
Message-Id: <20220221095918.18763-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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
2.35.1

