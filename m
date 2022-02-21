Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C44BD8C9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA8910E307;
	Mon, 21 Feb 2022 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952D110E2FE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 11FA0580259;
 Mon, 21 Feb 2022 04:59:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Feb 2022 04:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=NYWW80GsyUCeEqj7HkaGsRQxvtLYVY
 4L2V9iEh7oljA=; b=BodkgIua9GOdsnUxgmeG89y+tLA9yUuItiRuYDmWbEI0D6
 37uhZB/6fPD43MZK+YzbFU5SlLhyjz2jkPDtZPJ++vuoOGU1GqyueWTlqaB1WkPQ
 mkbxTPgGqWFDsEpAN5bsKhOhzpigT/6KfRzznVWhSxbI8in9xT03d2ePihIlOfXw
 XIAhaI36SO6/LMyJWEWCbNclrbQjLYEHZRerS+rgkgT04taOFCk06lkvWWwEgkmQ
 RQz+fxt08LROsOMh8UFUO3UvJAiEYGX6AiUg/1eNWV6uVpS/++ZqlS3Ie++Vd6P2
 iQGQjhDOkRoOpHRGkpckkwgfNLSB0Bxmk9ZKIufw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NYWW80
 GsyUCeEqj7HkaGsRQxvtLYVY4L2V9iEh7oljA=; b=fFaF+pNif3Vvmwo3Sk8qCN
 NY/nld8llzNvdkV8UAj5Sm2sNfEVhYvFxcUL6AN1fHtZ+jDZyDw5ke2phL2Qanft
 Ie2RtvC0HYeGfsL7sc2iGjqJfw8lbTUQHs3v2afo18/DylT6bMYQWEjwpvIzROu2
 aWLkRnVWEIyS3cWwMWp7HeeXfLGrNIgJJKNYl8B67U+q2ISOe71zjdZNBeWiSC0j
 gahLwY/4t/wCNR0oH72fMJgTpJKkXLHMBU4Fv8gaMoPWNTwCCxmu1KODpEFwJftG
 ZhxVZeLbr9eAptE4L400MszIx4uJEb+LEy55+KKt0XoPZFToXW4rmXVnXmlTwOLg
 ==
X-ME-Sender: <xms:e2ITYueuAMWGsRxldyBgv8HugtLlfe_n-ff5bSTsizOuS2radq6dyQ>
 <xme:e2ITYoMeWFUjPNV-AUwPbF3Z4INhTh7pKmeOvXpXThTPrsOpg6mj5zH0W8rqpBNab
 9TrlkFvWZ9AmA7BF-o>
X-ME-Received: <xmr:e2ITYvgHEzTji6jSLuD7XR1KIwneMzzRKbR7ix5vx6F80UCpRZhRerJnnSQQspzCZ70DOC6AqmjPDO13mrEk47CMCwpUInfnq7evfGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e2ITYr-gxvLt5PVvyOAr5pyV_A7WPyDK40QgkqOolWWVIE1oTmpYOA>
 <xmx:e2ITYqvPVeHz4nHaX0WOjWb1K8woR4oT4o8c7w0rV4ZUOkY0RCyn9Q>
 <xmx:e2ITYiGqp0YsvvA6-C-6Joh2bLkzu6rPYJ3sCeiHTDJauwazSr_4XQ>
 <xmx:fGITYrGyh7NPBD7ulOToj79EMFVe0pJJyvdnjriqJeuucSejH7ZssA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 01/22] drm/komeda: plane: switch to plane reset helper
Date: Mon, 21 Feb 2022 10:58:57 +0100
Message-Id: <20220221095918.18763-2-maxime@cerno.tech>
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
2.35.1

