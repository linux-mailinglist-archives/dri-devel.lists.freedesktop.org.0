Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4354660F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C910EBF6;
	Fri, 10 Jun 2022 11:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A002E10EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EC56A5C01B4;
 Fri, 10 Jun 2022 07:52:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 07:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861932; x=1654948332; bh=Fk
 5iSfOW0udewOUbQPj+ghO4guNhuBradIjNqf6ElrA=; b=fOR4A+q601okURvlJ+
 xmSRtIuG1z2mWEqwTSLQJUPzvI6GsprEedz3+RpFTrmT8EYejxyF3Me1dAgEC4X3
 3oOeDaMC9bMWPOc/CuqNgN97ngeRJq6fKDAYGUKmiTgje8KGbHUJaacbApQH1bVA
 Z+rxCyDTT496wEzxqtsu4oU7mLJCPGGsUhCyCAEotBqTPZhd4yOubnkMKWwtNjvK
 LNi0nKRrdqvCwaGFy7bKPyGoWxxfn5NoxZ+2O33rZkF5KPOXtuF2RXsWWnf9504L
 1sGQqj6MNmMN0YEyfcT6hfh18PyFRamTOj7ZCMAME8JN/6G7tyr8r1OxWY65dEIz
 j2Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861932; x=1654948332; bh=Fk5iSfOW0udew
 OUbQPj+ghO4guNhuBradIjNqf6ElrA=; b=mINNZpGDbb0+XKsJ5WmEbNGZkZ7Jv
 mU3bqJQhQ7cfT6n9/TV/hB9HfGUECmEFbZNiBo/F3FC0MrrFzf5Rx+O8r2Rx4Q3j
 LqGhOyNN4Ym1eiRTPRS8fhXLOVVehuk/DhiNusTWMcxnG8dmSRgBWHfi+VkKJJcm
 ForkGdRwtNTlze96v8DerX21FIPK6xyWvQf7chij5LL0CyoDTWpGKnC8XtLx5SAv
 px1RZrVdYYHX3nbuqe4L11DwjsNg0qPm4OLmobNA+/uJMb7WEuMo7V6NKZk7wkeJ
 AgZpyw0949QmyRQPQxdUOVRRaK4rAqqNEJ2+Sr6UvFKX5rWhWZRvPsbAw==
X-ME-Sender: <xms:bDCjYmLnLtIv9P-dc7ajYU1pn-ZvfrMQWTr8-66Pja44QVmx2Ycmmw>
 <xme:bDCjYuKsKDTPlKsKHi_tR8ptg1htEVOd-sA2fwhf1rSejSJgcUuSe_ieToh7X37-I
 CTLj2_oii_d1-Numm4>
X-ME-Received: <xmr:bDCjYmsAXRR0dGnmYlrm-mKdOhYmQplPleadekLrZLKS-G5T3VvPy1EzDEPkW_WtUIlnm3a8BG2n-j0Y3bQ0DRA754cK0bosGrEciVU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bDCjYra7gKuAKmd5wRSsxPkVOFxIIIiUlmeTTiMG9-liBYjSMOV15g>
 <xmx:bDCjYtY0gcq-Uaeq0kK8qImYgZatd8JqLdE5BRtsQ3Onu82I1EuXxQ>
 <xmx:bDCjYnBfqhhDWJJGaYtMD9E6LaFiGXShLkg-16IH-OnlAR7_8M3Vgg>
 <xmx:bDCjYgw_j0UrMAm_zveJbT6UdOPjrJyT84fw9Bp0oy4cbLVHEnECFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 11/14] drm/vc4: crtc: Move the BO Handling out of Common
 Page-Flip Handler
Date: Fri, 10 Jun 2022 13:51:46 +0200
Message-Id: <20220610115149.964394-12-maxime@cerno.tech>
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

The function vc4_async_page_flip() handles asynchronous page-flips in
the vc4 driver.

However, it mixes some generic code with code that should only be run on
older generations that have the GPU handled by the vc4 driver.

Let's split the generic part out of vc4_async_page_flip() and into a
common function that we be reusable by an handler made for the BCM2711.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 73 ++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 0410db97b9d1..c00fb964c534 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -835,40 +835,21 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 		vc4_bo_dec_usecnt(bo);
 }
 
-/* Implements async (non-vblank-synced) page flips.
- *
- * The page flip ioctl needs to return immediately, so we grab the
- * modeset semaphore on the pipe, and queue the address update for
- * when V3D is done with the BO being flipped to.
- */
-static int vc4_async_page_flip(struct drm_crtc *crtc,
-			       struct drm_framebuffer *fb,
-			       struct drm_pending_vblank_event *event,
-			       uint32_t flags)
+static int
+vc4_async_page_flip_common(struct drm_crtc *crtc,
+			   struct drm_framebuffer *fb,
+			   struct drm_pending_vblank_event *event,
+			   uint32_t flags)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_plane *plane = crtc->primary;
-	int ret = 0;
 	struct vc4_async_flip_state *flip_state;
 	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
 	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
 
-	/* Increment the BO usecnt here, so that we never end up with an
-	 * unbalanced number of vc4_bo_{dec,inc}_usecnt() calls when the
-	 * plane is later updated through the non-async path.
-	 * FIXME: we should move to generic async-page-flip when it's
-	 * available, so that we can get rid of this hand-made prepare_fb()
-	 * logic.
-	 */
-	ret = vc4_bo_inc_usecnt(bo);
-	if (ret)
-		return ret;
-
 	flip_state = kzalloc(sizeof(*flip_state), GFP_KERNEL);
-	if (!flip_state) {
-		vc4_bo_dec_usecnt(bo);
+	if (!flip_state)
 		return -ENOMEM;
-	}
 
 	drm_framebuffer_get(fb);
 	flip_state->fb = fb;
@@ -902,6 +883,48 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	return 0;
 }
 
+/* Implements async (non-vblank-synced) page flips.
+ *
+ * The page flip ioctl needs to return immediately, so we grab the
+ * modeset semaphore on the pipe, and queue the address update for
+ * when V3D is done with the BO being flipped to.
+ */
+static int vc4_async_page_flip(struct drm_crtc *crtc,
+			       struct drm_framebuffer *fb,
+			       struct drm_pending_vblank_event *event,
+			       uint32_t flags)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
+	int ret;
+
+	if (WARN_ON_ONCE(vc4->is_vc5))
+		return -ENODEV;
+
+	/*
+	 * Increment the BO usecnt here, so that we never end up with an
+	 * unbalanced number of vc4_bo_{dec,inc}_usecnt() calls when the
+	 * plane is later updated through the non-async path.
+	 *
+	 * FIXME: we should move to generic async-page-flip when
+	 * it's available, so that we can get rid of this
+	 * hand-made prepare_fb() logic.
+	 */
+	ret = vc4_bo_inc_usecnt(bo);
+	if (ret)
+		return ret;
+
+	ret = vc4_async_page_flip_common(crtc, fb, event, flags);
+	if (ret) {
+		vc4_bo_dec_usecnt(bo);
+		return ret;
+	}
+
+	return 0;
+}
+
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
-- 
2.36.1

