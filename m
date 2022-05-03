Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E93518408
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195810F949;
	Tue,  3 May 2022 12:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794FA10F93D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 267743200985;
 Tue,  3 May 2022 08:14:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 03 May 2022 08:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580058; x=1651666458; bh=MW
 t/dxOj6y+Jh0i/fdLzLZ/XTUCmrJyiBpqbVrCxPmg=; b=zVFvqVkn7uYq5f5OZm
 qW4xSwWbAaH7ZjFpFanBZJmP3+BQpUFvo+RCc6mHbBWz+kFt2TQ4BJd2ty5UTeH5
 N69JtBWI18VeOCNIBi1xXoReUyALL1orwuSx20NPkyxRbvHaRCVLUFA8Spkp6XuD
 +IUZAEHYukS/BGTDel071EvckC19xSU+0p1nG95Fi4nB1whuS499NBp5j9BpHQqt
 R41c17BS1TPDoOlZCKC2XGg+ZgvcTXIH704DWjGLZolIZajlunvqZwjj41ootAl0
 aO2Ka5HvvY6a5UAzndewnnXyqwCEMck5LdRT0qfdMjDrpKuZoOlEx1sjXDIHz2eo
 BYPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580058; x=1651666458; bh=MWt/dxOj6y+Jh0i/fdLzLZ/XTUCmrJyiBpq
 bVrCxPmg=; b=y/AKHHSoJXBX+QamKNL7o8YxK3ed2FX/8fKUn/mAjLUzMGdI88R
 zYbEbdKq5J6GS4MePiMp07tfiLiX0Q+e+eznihQ4fv2BWtAHkGaJLtrzXpi5M6w4
 SBhyiV51t5ADlv8RKsV0CGsG9blREsdizf6RbBVZ7nU5HJWWbnPYolUpzcusczPW
 64M4Ae99HsKtYixMPAKaHwhGuMM5Gpy9wQpf7+PHao3l1n18GV8Irr6LKajjLzTO
 AmCnG87+N2a0z4rpuffM60+lpUgWL3BW0LrXeBXiwsQkSw5cra6D2sHHPDMZ9J7k
 gRboap5e0ZKRzbiW2/YkZvl8Yr48cUaopSw==
X-ME-Sender: <xms:mhxxYnu26j3sl5-OlJasQTpI_EaONQNSmVuGwW1Imjdsy_FdZ8oRdg>
 <xme:mhxxYodQPGh-x8DvfvSO2RP4f51s37KcapbhnF7v5MWnuC5HLpxoAyQBHVvkh71rK
 CmX7dySOPzh8xJ7xWM>
X-ME-Received: <xmr:mhxxYqzr29dUdAjAAohx4luc3RjK3yDnKNaX52dNyzYZTOyVdrG8qxMe_RiAMibdOIeRnl1WQOikteL9yG-DJMCPbv8kpQovl1r43Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mhxxYmNM0y1kiVhoxwXIcZDaF9x657CG7J6sfWBBfA0Aiv8q5XmcVg>
 <xmx:mhxxYn88INvv80hIW-lsmT55r5YQuNfA3GoEF7CTvvScyfOph0Dp_Q>
 <xmx:mhxxYmV4DquxkaH946s9QP5wIIQpZMgn42GniLD40CMG4Hgos93EmQ>
 <xmx:mhxxYimAwcoWln8FcK2IP14pVvV7lTuJhmudye9tbGRCQW9xgM5Ecw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 09/14] drm/vc4: crtc: Use an union to store the page flip
 callback
Date: Tue,  3 May 2022 14:13:36 +0200
Message-Id: <20220503121341.983842-10-maxime@cerno.tech>
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

We'll need to extend the vc4_async_flip_state structure to rely on
another callback implementation, so let's move the current one into a
union.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index dd5fb25d0f43..1f247c037ce0 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -775,17 +775,17 @@ struct vc4_async_flip_state {
 	struct drm_framebuffer *old_fb;
 	struct drm_pending_vblank_event *event;
 
-	struct vc4_seqno_cb cb;
+	union {
+		struct vc4_seqno_cb seqno;
+	} cb;
 };
 
 /* Called when the V3D execution for the BO being flipped to is done, so that
  * we can actually update the plane's address to point to it.
  */
 static void
-vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
+vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 {
-	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb);
 	struct drm_crtc *crtc = flip_state->crtc;
 	struct drm_device *dev = crtc->dev;
 	struct drm_plane *plane = crtc->primary;
@@ -821,6 +821,14 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 	kfree(flip_state);
 }
 
+static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
+{
+	struct vc4_async_flip_state *flip_state =
+		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+
+	vc4_async_page_flip_complete(flip_state);
+}
+
 /* Implements async (non-vblank-synced) page flips.
  *
  * The page flip ioctl needs to return immediately, so we grab the
@@ -881,8 +889,8 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	 */
 	drm_atomic_set_fb_for_plane(plane->state, fb);
 
-	vc4_queue_seqno_cb(dev, &flip_state->cb, bo->seqno,
-			   vc4_async_page_flip_complete);
+	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
+			   vc4_async_page_flip_seqno_complete);
 
 	/* Driver takes ownership of state on successful async commit. */
 	return 0;
-- 
2.35.1

