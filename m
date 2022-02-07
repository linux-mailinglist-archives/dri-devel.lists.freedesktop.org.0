Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3D24AC5CE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18B210F7F4;
	Mon,  7 Feb 2022 16:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB310F7FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AF6358021B;
 Mon,  7 Feb 2022 11:35:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Bl+dD7T/EpHrg6mEklJh9mkWCVzP46
 4edVKYPLPbsXw=; b=iAlLPtrASb0gOufhIymRe6WKg2Q6wlmyb/D54If9KDOq6p
 /NTx8keC06EkPVMinmrJgPkB+HsSm6QYn2HHl88Z8VlhbP8si4wZ3ub+f9ZFOfS5
 opPlD/TMyOsYfQ1KDghOjPQwY3lS6pfGgTSke1XWnbT8yDtEACMLphrJT9AodWK+
 E5TDIXmM6syfmN+4oRpa5806UO3k95lJ5m0Zpkl6xkm3qpQdZMzmGlhLhAAOEXXK
 s88mYMxOwkiadLXstRyBK0BLkgFliOG7hCVbZgGNKn9st5HbRRfPuZl93dGlKEHh
 Lv5aJfsWaQIr5ocbOjb2uP9/w5YnhNjfPOQ7zsAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Bl+dD7
 T/EpHrg6mEklJh9mkWCVzP464edVKYPLPbsXw=; b=MTScspCqrtYTr2756/nBAJ
 e66tq6WMzyBoCy6R0aqPyskTYNwG691FxVIAkgUvEhRGrvtnnZxcpbJDCHURCLTJ
 6DqJ0PDaUCjgWw0HVK7dtV8TAiROjYQn5WiwP1lW0+rVho19y7HtqEmrTaQ2jlrk
 GDqM7FuT74QwzGOMcuJxa1WmSazwtSuI6D9P9MsqqRG03hMfGikfom0Hw4MtJH1E
 lRpeFNSEVItknEqhfeU391Oae9LRKpeNEJ/Gxhfp+Vx3e6QnJV6YbrZs4V5UfxR8
 8Wtw7nH+jJo6yxqpCpaIY/291rs4dgDaWsuI6gg1f8zNJHSTQUkk80YXZSYc74Zg
 ==
X-ME-Sender: <xms:YEoBYjhiHexHtaEIM6wTWD64BN4Yp_Cf47xtlLlHMZptrkbNW8GEfg>
 <xme:YEoBYgA-V1JkBa9jYmeUJCOkqsHGWxsh4MtgGEizQA0XdCw78kCQc_T0zQynw_X3y
 oCp3nqVhnOntoPlWEg>
X-ME-Received: <xmr:YEoBYjG-OZDvtcnh2u0a0_qr4F4jhn9liz9CKP9GrBimhiApFBxrGh26be4Ej91IV1HZFPJg5N9xN5aTNi_9nbxfBHbLJD1gXnT6V6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YEoBYgRthWFWhA0j7Vx0_fA252Rj7QOAxtV9E6femMD-S2gy9Gj4Cg>
 <xmx:YEoBYgzHtJlDRBWLOESz59sgr80HSpLxk8oMT7KS3yn9j2wKiDTqfw>
 <xmx:YEoBYm4kxEQ1TtrjpV4u2lgKg8VEcA-WD7HSNdAwNiZj5iZ-xQ5bhg>
 <xmx:YEoBYrq3avWJHMhJMAenK5smBj2UKdvZ6DwRNNHSwIYIJHTX1O_iGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 09/23] drm/komeda: plane: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:01 +0100
Message-Id: <20220207163515.1038648-10-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The komeda KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index.

Since the initial value wasn't carried over in the state, the driver had
to set it again in komeda_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Brian Starkey <brian.starkey@arm.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 1778f6e1ea56..383bb2039bd4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -135,7 +135,6 @@ static void komeda_plane_destroy(struct drm_plane *plane)
 static void komeda_plane_reset(struct drm_plane *plane)
 {
 	struct komeda_plane_state *state;
-	struct komeda_plane *kplane = to_kplane(plane);
 
 	if (plane->state)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
@@ -146,7 +145,6 @@ static void komeda_plane_reset(struct drm_plane *plane)
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		state->base.zpos = kplane->layer->base.id;
 		state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
 		state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
-- 
2.34.1

