Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B2546611
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339110EC19;
	Fri, 10 Jun 2022 11:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2E10EBD9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4545F5C01A0;
 Fri, 10 Jun 2022 07:52:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 07:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861931; x=1654948331; bh=Jz
 Es86apTXmXn6b8kArkP/V2SLj865fR4Uh6j23Ua5I=; b=urkxp6S1dc/RDRhs+C
 OwmfjErN3hs0FuSBV3TSpCqRycEi9bX4Im3Y5VHzswOj+a+lzi4EkfkXPi0LGVIJ
 j6cLIJEBzGrVP8au5Wv/uJMQtDg0vScwcP57HZhUl1Qyu8Q6PR7Ax2vQrFOnsbhf
 tfzQj7pRdMBPYXdTk6xd8TaXkf6VFbEsbHgoCRmx2QRTR72QPheD0vAttny3szY8
 ua8io3HQi8YYm9W3tPZPS4LNRyawL4VK9ZTEciZiVDiZ712k3cs1sYBCOdVFPK3G
 QfLX9khITAxeOnXPppQ6MqiLj5btb5ovV7AV3v9fKG5rWgdJtz5HAieckDX8m1Xf
 pFNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861931; x=1654948331; bh=JzEs86apTXmXn
 6b8kArkP/V2SLj865fR4Uh6j23Ua5I=; b=YBuQVAZctxrlI0uLGscRzTfppMnyc
 a46V3Tttr0K45vX6QIx8y2k/5MMGzEKWLYrwuZcsl5KVrsGU83VDNgvXrzK1rqD9
 /a95gUlkiY8FwgkIVMRKB2vZLnq8iodAXP0BEVbiuRyUS14Z4+0rw7Qjpc83Uyuo
 8b5Ii7VrW82pKugxsvKZd4Y0Rt4Q6hNNDvJAIwYy2oyDU9sLmQHldMKHHDCM8ybM
 97FRbgHvrVv4cU/gf6+Pd14rt7mOWi9WPbLPzHX/9lIYCEbe/JxKaogMIZ5uIgLI
 KGrBBxtaIbFpNreSBBq/1Ia/fa3JxL7Eu9CVqmhY3bACAO3e4LMskBEoA==
X-ME-Sender: <xms:azCjYogw85OK60yGd52PYutRMtgzUO96wtJzUuNK27PlDExG_LkuiQ>
 <xme:azCjYhD2e3HiMbT3LUrtERSTGhGZNximpeN54LoaEL8BJlaAuBDEYGzurHYfiwiw9
 oWGut5dGJ4A-MMETYA>
X-ME-Received: <xmr:azCjYgF9-l4eQGjkX6cf3qWebna0z7iqgbD62RjHlgYv3UtfnLa3KmeJgnQR17ALcGmqSHPFdyVDIatkzvwgK_jS6OeCWCa15QhVXUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:azCjYpSLxdxiAzr3yQtsm6O-a-kqt6TpgiwV0MI5sjWKIOXfqDjFWA>
 <xmx:azCjYlwqN7xZAtABoMOq8vbVOCfmLEUpuYImBvkghk4gS0e5NaQGMA>
 <xmx:azCjYn5NQgnBrN0hH0G2hru0wOedWDK6ZQMgyLoqmYfIi2HmwjyV4A>
 <xmx:azCjYopoL6Xui3NRezb6XBDZdYwGbfp5m0FOOBIXryUtzOaIwGYjyg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 10/14] drm/vc4: crtc: Move the BO handling out of common
 page-flip callback
Date: Fri, 10 Jun 2022 13:51:45 +0200
Message-Id: <20220610115149.964394-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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

Reviewed-by: Melissa Wen <mwen@igalia.com>
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
2.36.1

