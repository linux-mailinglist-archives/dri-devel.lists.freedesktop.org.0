Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885114AC5C6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA05510E309;
	Mon,  7 Feb 2022 16:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8C110E309
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 017085801D9;
 Mon,  7 Feb 2022 11:35:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=dV2bE6VudZJYfwXdJWepSvJGD4u9y1
 G/mJn+0lFY6zQ=; b=Wt/F1FEqqoBvbwYHvHZlCoAEom0DVa93TTfOGJaqbK4Vu4
 XmMKGDG9z0l15gb/JI8qRFtL9w0tS/XB/AK5pSgiIlmMAs8oP1tfsgw0yEz5uUMd
 YQYmAWyVMdjaYL7zSKUgWsJUu2p8laYwardYII2AiTkM/3jhXQoKsQmmHjCjg6j8
 cnyAWc8aVYGOZ2xZqmZpQHKlkJe8/oyl/g/wLp35PHEgDJshLZss6LnbxQlBDh/x
 136yjjzqhpv/JgQIy50C3b7M3r07gKKHo57Oktq2htU3riOzmPOWeTTNJxPm0SYD
 By+55SCe4IoKwXv6UWcHrRxSU0yF8MbawR5iaeLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dV2bE6
 VudZJYfwXdJWepSvJGD4u9y1G/mJn+0lFY6zQ=; b=W0m+5rAp2/n1RwoNJhZLGT
 uxWgYnqVu1gAStZD2dycTVftq9qhAEtT1KAASs5TPLDEGByjbiHvb+nG7SsRsHnt
 RK2KRKFpqQf3SJaNmZMra7ZxQNjdF04ZUYQ0fg9H7dMCAvE6U/3old/NBsTJZ8EP
 3PgAGmNBpL/1r6wpkzcpHzNl0QKbKceN5A8HTE3jtxETNr+pMwLXbwaRQlNwgfa3
 gDUuQGxXoUJbX8PGrerWabrPAWnZl8IgNvnTarYRIG2b0tzC/yxrmXmYrS0bB6Hw
 BbMM/oROK+MytYCtyR/JSAdS2Gi4hftgxLzv3MoxWlhHpcC6szov78WrhjGPXp3g
 ==
X-ME-Sender: <xms:SkoBYqOsuAbcFg1iclescICl8JCsImHe6bx_e8oAmajvvAY2pLU8UQ>
 <xme:SkoBYo8P9o9lfL5o9Iz1MtJnCSc7X4RY1oP0177sujZsOAbU-CMrs2oYTrRUMejlD
 CKycxxxYR85Zqea1wU>
X-ME-Received: <xmr:SkoBYhRy8646Bc_9r_OhfZlJGHN4z_MklcGYgcxmRUZ0ZKdAn-XfRW-sfxf_l5E2QF2FNRg2oioGwwjKQ-TYUh6jV79fxaK5Ww2EBTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SkoBYqv2eP0GObTyRLRkohVQOKLxncv-9GLVzEqMeMstc18pMqK7yw>
 <xmx:SkoBYidtBoZDSwaBuzQJOubx5i0hORPWGYe23iV5lwSF_er1UAJ9og>
 <xmx:SkoBYu0fqMmIB8gviXNILSdRk-sMUUO1-M6OaRWlVfcgQujbOYh1XQ>
 <xmx:SkoBYo3RCgkpy5CfHCnIYB2AA0bdkvRMDIe8N0faq7FAI0ma67poSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 01/23] drm/komeda: plane: switch to plane reset helper
Date: Mon,  7 Feb 2022 17:34:53 +0100
Message-Id: <20220207163515.1038648-2-maxime@cerno.tech>
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

komeda_plane_reset() does the state initialisation by copying a lot of
the code found in the __drm_atomic_helper_plane_reset(). Let's switch to
that helper and reduce the boilerplate.

Cc: Brian Starkey <brian.starkey@arm.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..1778f6e1ea56 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -145,14 +145,10 @@ static void komeda_plane_reset(struct drm_plane *plane)
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
-		state->base.rotation = DRM_MODE_ROTATE_0;
-		state->base.pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
-		state->base.alpha = DRM_BLEND_ALPHA_OPAQUE;
+		__drm_atomic_helper_plane_reset(plane, &state->base);
 		state->base.zpos = kplane->layer->base.id;
 		state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
 		state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
-		plane->state = &state->base;
-		plane->state->plane = plane;
 	}
 }
 
-- 
2.34.1

