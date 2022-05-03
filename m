Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD6518409
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706B310F96E;
	Tue,  3 May 2022 12:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B3510F978
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 70A7C320097F;
 Tue,  3 May 2022 08:14:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 May 2022 08:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580061; x=1651666461; bh=nq
 I93mn9BOOeqU9NKQjb7aS0f5gw66g+J98H/nYiakw=; b=Yx4xa7Z3L5OUpLzykP
 XJ36ZP2SHzdllXTfCHA7e3JpWhvOUM6sx8upthcygRw7/l3GaFIyfs22M5zsm/Zz
 CzgYXChtB5y1dUhhub30eQHsKmpzASaZ2gagCRafu9gI6HAQHzRVQAEm8sxRSYgA
 XiqHI0ydOyVamPBswmZyOaFZIl/04aN+38//BVkG5w8hWWefl7453r92/AU5SpAy
 R/+45sCriO0zeBUCsaN7fwQm6vB/nCZuetCV9WmLpsuyq4cDT+lXogVxAHtLuV03
 2TpEmQbMi/kXKUppRxvpfoWkMvyRIQ2upJBF8YahEgDHQTIS7G5CJHZRW+E1BGTH
 qyGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580061; x=1651666461; bh=nqI93mn9BOOeqU9NKQjb7aS0f5gw66g+J98
 H/nYiakw=; b=TNbcqNeAHCmTJDwF5rzLpVnlDygHFxBn9PX35Wqzn3a0Z4EJ2z2
 I100T3vAPcSegXL9vxlqsEWz9Cu7MCyX1WYkUrw78iUBnIHaWCdnarjszizR3Np+
 WY1ikF2a/eXcPS+7D/+2ECtJ1opQw7pDsMIjxYRJ367qEocU2mENNKASMNQIBbzL
 m7xtyIp8fRxv+NJbD0UmL7AJU52K3mexq5dF2RHrF4RoMg1RAUpANYk52tQFWGSQ
 TJYtQ1vhyJ9zif/FcU/425bjZT6LhvOWBjtkyfoGY7dboTTya2L7gXprhbiOwYyL
 t3dv8Roh8INmQlZ2/DMJvJdwKqLcjiC+Y+A==
X-ME-Sender: <xms:nRxxYpDwO8OowJRvYdIdtWj2wq5j1PCHXprB2sya8rYRd3T7jzg9lQ>
 <xme:nRxxYnjpXOeeDHtyaZVc4VyvLW9Bmftda_92bfKWFvurANw4OcIfa5_7Htt9pXvRW
 cLfEMQQsYbIccajhhU>
X-ME-Received: <xmr:nRxxYkmQUT6Ni_FcQfybOUVcTMg8jua5QSuwM_5tWuJaRcUezO8ddz38UWizrY2QmQ2063Ean1Y1fHx4wm5Kv0MH606HtusAvKtng4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nRxxYjxxi2aDGx2PSA3iftYTqbhUZM-1K9ECRDg1WNivM4I9jlQP8A>
 <xmx:nRxxYuTirphy59SmXXH3xMKhV-LYDSbodEXGHvVAZBPhTgzciHVGzg>
 <xmx:nRxxYmYPZoXSfcXqdw2NPsVjqPEgAiUxaYzJ7yTACTSWPIXM0EDAfA>
 <xmx:nRxxYrLdaMtfVhUrYkF5kgbCb6sU37hKtMUaXwjYVjhYkXODvr_EUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/14] drm/vc4: crtc: Move the BO handling out of common
 page-flip callback
Date: Tue,  3 May 2022 14:13:37 +0200
Message-Id: <20220503121341.983842-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll soon introduce another completion callback source that won't need
to use the BO reference counting, so let's move it around to create a
function we will be able to share between both callbacks.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 1f247c037ce0..0410db97b9d1 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -802,21 +802,8 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 	drm_crtc_vblank_put(crtc);
 	drm_framebuffer_put(flip_state->fb);
 
-	/* Decrement the BO usecnt in order to keep the inc/dec calls balanced
-	 * when the planes are updated through the async update path.
-	 * FIXME: we should move to generic async-page-flip when it's
-	 * available, so that we can get rid of this hand-made cleanup_fb()
-	 * logic.
-	 */
-	if (flip_state->old_fb) {
-		struct drm_gem_cma_object *cma_bo;
-		struct vc4_bo *bo;
-
-		cma_bo = drm_fb_cma_get_gem_obj(flip_state->old_fb, 0);
-		bo = to_vc4_bo(&cma_bo->base);
-		vc4_bo_dec_usecnt(bo);
+	if (flip_state->old_fb)
 		drm_framebuffer_put(flip_state->old_fb);
-	}
 
 	kfree(flip_state);
 }
@@ -825,8 +812,27 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 {
 	struct vc4_async_flip_state *flip_state =
 		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+	struct vc4_bo *bo = NULL;
+
+	if (flip_state->old_fb) {
+		struct drm_gem_cma_object *cma_bo =
+			drm_fb_cma_get_gem_obj(flip_state->old_fb, 0);
+		bo = to_vc4_bo(&cma_bo->base);
+	}
 
 	vc4_async_page_flip_complete(flip_state);
+
+	/*
+	 * Decrement the BO usecnt in order to keep the inc/dec
+	 * calls balanced when the planes are updated through
+	 * the async update path.
+	 *
+	 * FIXME: we should move to generic async-page-flip when
+	 * it's available, so that we can get rid of this
+	 * hand-made cleanup_fb() logic.
+	 */
+	if (bo)
+		vc4_bo_dec_usecnt(bo);
 }
 
 /* Implements async (non-vblank-synced) page flips.
-- 
2.35.1

