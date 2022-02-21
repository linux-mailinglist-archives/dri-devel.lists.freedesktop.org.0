Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3E4BD8D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B55310EAAF;
	Mon, 21 Feb 2022 10:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4366B10E463
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9C6CB58025D;
 Mon, 21 Feb 2022 04:59:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=zI+A8kuccAxz9CqqXVtqcAMYRs+IUY
 h/SEHu9k6niCs=; b=BLSJEY3V0mfH9jEO9ZWqPJLYg6cMLW5eAYY1r/2v/vv31I
 BG2KK8xkNJqDtbfPZx1nCWit6U8xdpwwt9iJeIww+pfJ+reVf56TQvx+PlhXyWzO
 G0D6mrjRS+yqqgtP6llGbrhsPdqF2wYjO2BOsC+J7sKXJGnycx7RTx2ddaZys9w+
 VQw5RcCj3G28qdQoIXIPbhyhN3IC//ABwgu1LNxB3u7AlxNrfxskw5WPkyFyfked
 KvoTYL9kwxSZaNr4UCqvHi6B/rD8y7zcPxSvvjTK5gF8AYzfcBv8MaZn863dEdF0
 r7huKZqyRxHMjtsoBaR8obcS/0e5O46Ucy4FOICw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zI+A8k
 uccAxz9CqqXVtqcAMYRs+IUYh/SEHu9k6niCs=; b=FQIdzKMMtPnhT6rNGbdU0T
 h47ofkrjw0FYZjHHuIEQexxKM2IhGxzjNb05XanTGlnbVV9ZsGRHDCya5FSpLRdP
 EhcwzfPz/m0FuQSZZnCS6MJBp/Idnf3/sLvKNhJnzPPzSdxGAYckUfJ1Lo+dXUpG
 hN0xKzaI/+os/6NhFLsN0P8SMJThdXUTl+nbDr9ec4OjDHpXi2qzZ//AwOsAraG8
 HcZAi3pGVY9l2Jw7SgOOt1gDZWaG8rosQzYwg68wDMtOVgi6IYkzqW7iHBvMBC7E
 eq083ylxMZf5boCYH1ovNhy8ivJ+mzvob1UfhwNPg4O03QJLU/0ihzMguukblbRg
 ==
X-ME-Sender: <xms:jmITYlrsNcGU9ImHvzxMOwjBV4kQvZg7o9cuioABDY9NtktW98OzZQ>
 <xme:jmITYnqaPO2kvOwLoveYLUiVvz43lND1XhQOu29GqOUkvTEnoQ8KKLYDX1WJsktcB
 C-Bpf4jGHFsGbi4yok>
X-ME-Received: <xmr:jmITYiO6b6FH4pQsciNqM75l5R_eplwPOUPFwZxwYIP-myYx1Y3u9fq1CryEeo-VL7hxK4UZaoT9IlbZky4ZjL_EHZOEmqwFpNa3e68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jmITYg4f9VRhU6BqHsOiABI-v39BNQDLwsyIvy3PTt4fks1GHJeD9Q>
 <xmx:jmITYk6RcGcEbaRwt15IxVRoMxVrZ_6ukRZq3fweIgI9POpmAbnvvg>
 <xmx:jmITYoiOSEZpqkgMLhWxo4A0rYhBUzr8PAZuvvxZDtVUfb-foso9zg>
 <xmx:jmITYkypc06RUThIk2ufGMnsBK_gk0K1eEBhjdapxNLc-g7jhgtO8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 09/22] drm/komeda: plane: Remove redundant zpos
 initialisation
Date: Mon, 21 Feb 2022 10:59:05 +0100
Message-Id: <20220221095918.18763-10-maxime@cerno.tech>
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
2.35.1

