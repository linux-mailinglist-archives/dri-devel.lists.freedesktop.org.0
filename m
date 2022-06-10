Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5C54660A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6910EB14;
	Fri, 10 Jun 2022 11:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399B510EB14
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 971AA5C012E;
 Fri, 10 Jun 2022 07:52:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 07:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861929; x=1654948329; bh=O2
 Z8X0N4uMlj0CNqel9Ba8Gcy7xDPqtyXw872MAId3s=; b=kmFDG7s9XLZOd0N987
 vYnKI5Wk7FhCZu39syq4EumG2Nr0YCxT19CDWHX6lz1+JPLfFSqO5XJE7oHw9Oqa
 Hq7kIsUlmnBxfyrsqe94YYNUAbCMO+Igu8ayQkBbiVj4/InZ+brDod+jvzkohFjr
 g5ZOQomvwQa9lfljXaryrHDSPAR0szcmqhZqvuwpkyeyF+/epAx8fWBnb+NxVWjK
 djOLh4v9nSgFekZSc2FQFDxnoRbDSaVMvGtMg0lV7iWBzT7n+Voo0LgX/pztHmuH
 Ova/F+08fUl/lv5AyFanuYAlkFAdJaxpk57WQugoDQ+3ZbjMrJT2iP4hFpSGBGoZ
 beKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861929; x=1654948329; bh=O2Z8X0N4uMlj0
 CNqel9Ba8Gcy7xDPqtyXw872MAId3s=; b=B6My1jmwfvzdi6qtcGxdYOXn8tSYn
 mpH7tBd5QsJJp8uFxGL2z1F6CbxJTav9ESbWHl5bbrEF3Nj/P3uYbJgJ37fhPVjk
 LD9PHCSoWp4njyydZANMiqDZAhmZxk3OCgW9dsesdnp1uiN3LB4s+V/0UBcSKXyE
 SwADvm1Em75m3RIKIogfobpl35/j63l+jxEiYkVDhg7KICTreZMTwSLWPNjaNKQr
 8Ua5q4NOtKGDq3N7kNmuviGZsCsupYVzDl9HS4Ea2EnS1M3e9mVXZ8EKg+Ks0JwE
 ie6dj2PGy4fLlldQiHNdSIUj14XPODk66J8vQYq3vBgfzS7LW/5TR3NBw==
X-ME-Sender: <xms:aTCjYhTv3Q1dHiQB4dlI_MINVtJV74Qz7A_Qz2VIxihH-_io3XY0SA>
 <xme:aTCjYqzfsFIOi4yGvx-6HgaJXFn06Iv6ZdPmbyBvzi_iIIwM8kvWiuS1EWsmIy0fI
 nb3L2q7bqub-jYkcL4>
X-ME-Received: <xmr:aTCjYm0cNHDxJat0mSuPc3Vm_QwqGPRAuOXDpQV8t12eL5FEtsS95JyR5uDoGbX_LVK55U8_EAdGte41709m11v4aZJmH8uitGctvo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aTCjYpB0GZdD761HscCNzDuB6vHWw900ym4gVW-bWiZiG1d4Qfy4Eg>
 <xmx:aTCjYqjFk8V420VR4EjREKoD1J5BdIjyI3sWY4cormar554X9wJgaA>
 <xmx:aTCjYtq0Rks0m6h72LjynolM9KxNnngNmlW5HojwR85pAI8-6KDtNg>
 <xmx:aTCjYsbAq5N-dnxh_3Cprbc8FG_FPBTxyqXb3FMNQHgv3OnvUgfzXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 09/14] drm/vc4: crtc: Use an union to store the page flip
 callback
Date: Fri, 10 Jun 2022 13:51:44 +0200
Message-Id: <20220610115149.964394-10-maxime@cerno.tech>
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

We'll need to extend the vc4_async_flip_state structure to rely on
another callback implementation, so let's move the current one into a
union.

Reviewed-by: Melissa Wen <mwen@igalia.com>
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
2.36.1

