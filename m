Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7254660D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5CA10EBE7;
	Fri, 10 Jun 2022 11:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CA10EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:52:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 583105C0112;
 Fri, 10 Jun 2022 07:52:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 07:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861936; x=1654948336; bh=8D
 fvx/IRwF+CDV31/n5Ihz8vGvwm52VaRc5WhrxAOSU=; b=4j4yR3nhfgvTy2s4SE
 2dIXwUwub3TR5wJs7tTD3kfHyEmBBU0ahMItC79W7LSBLwkmQ7mzM/pEC9SrJKLn
 A+KIfbXKRZG+3XSNb5QG/USEjrGrNItOXyU4co8xx2+Xl6+t+as9d0gPQukOYu3h
 diN7+IscRYReA+Id+L480Fz2UDRhooZDXRF+SI1HQ8jDFMqFaMKr3dltFn/6NVqM
 KmEyF0+Qn/V52kzMVSWCc9aoOzcZLJQSV/CsLMZJx2KQoFn744+oy2oBrQbmOhgJ
 HC81PSoq4l1sIKgecWOmjG0VAHD4wdTsJa20XT4fbSzdUmniw4YSLTA/UqwY3CTW
 nHxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861936; x=1654948336; bh=8Dfvx/IRwF+CD
 V31/n5Ihz8vGvwm52VaRc5WhrxAOSU=; b=vy344BgMg/kyNwpUAANDzlhJ6dYch
 skU9YDicYQatB9dfyz4zlXODgSPvTRxpDK7xSqxMmcNtp7tBap2YkKMsUmM99lAb
 AfWTO0s5KeFsP8mHRx23sNaqWxlDlIikjuskuGMZr5spquKA9vHeiMGr+uOgjNO0
 nhcvmVO/o1pQHW4hajji3o1N/rRthNITcLzv8HLBigwqXKzRWcn7tzcaU2aqZUP2
 FprpEtEvtUzzg3gd3xoaGZf0CbjuuMMPe57xLF5eADx38Q503W7B+qiDBF8yyQKq
 Z8H8XeuWuxBHZ4YB6Ji+OM5ntmBzSIf5zaDg2rjEeumN29USGUn0TgNOQ==
X-ME-Sender: <xms:cDCjYljTPWIdaF5LEDqOCnc_tYsttUxV4bajrmFmu4Ac4D8g6n3KGg>
 <xme:cDCjYqAoSs33Bqb7BpOA6ZFcS2xVQzI3IHizgHQzbqnvYQdNLa_9jL78BZuClqFRG
 w5dKd7WyuIvEYCRDXI>
X-ME-Received: <xmr:cDCjYlFk8zP888pzh9nrwHSyhteEQcV5zrCarhN41dI2nikda5oaOHW2ng_tk_pCua2O9TvLdK-aB89hvx1WdnL27jk6Ju3MNxOtZdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cDCjYqToUch3OX_FdgkepmoVKIrIkDFtDwWKeogjOXORzEzT9Vd5rg>
 <xmx:cDCjYiwqV82lLlPOgibPJZL_Qin3s2JJE49aUW2KMBCc0RsRzn4Bxw>
 <xmx:cDCjYg4Zd0ez2xw9A2-Sn9JHTEK12U4cEtspXwamR5vgzMeiUiNeuA>
 <xmx:cDCjYpo4KqLDgBHHeJ3xM8ejPSapZUlc5q9xtLqOCSdDG0kLyzMr0Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:52:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Date: Fri, 10 Jun 2022 13:51:48 +0200
Message-Id: <20220610115149.964394-14-maxime@cerno.tech>
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

When doing an asynchronous page flip (PAGE_FLIP ioctl with the
DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
possible GPU buffer being rendered through a call to
vc4_queue_seqno_cb().

On the BCM2835-37, the GPU driver is part of the vc4 driver and that
function is defined in vc4_gem.c to wait for the buffer to be rendered,
and once it's done, call a callback.

However, on the BCM2711 used on the RaspberryPi4, the GPU driver is
separate (v3d) and that function won't do anything. This was working
because we were going into a path, due to uninitialized variables, that
was always scheduling the callback.

However, we were never actually waiting for the buffer to be rendered
which was resulting in frames being displayed out of order.

The generic API to signal those kind of completion in the kernel are the
DMA fences, and fortunately the v3d drivers supports them and signal
when its job is done. That API also provides an equivalent function that
allows to have a callback being executed when the fence is signalled as
done.

Let's change our driver a bit to rely on the previous function for the
older SoCs, and on DMA fences for the BCM2711.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 50 +++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index a3c04d6cbd20..9355213dc883 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -776,6 +776,7 @@ struct vc4_async_flip_state {
 	struct drm_pending_vblank_event *event;
 
 	union {
+		struct dma_fence_cb fence;
 		struct vc4_seqno_cb seqno;
 	} cb;
 };
@@ -835,6 +836,50 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 		vc4_bo_dec_usecnt(bo);
 }
 
+static void vc4_async_page_flip_fence_complete(struct dma_fence *fence,
+					       struct dma_fence_cb *cb)
+{
+	struct vc4_async_flip_state *flip_state =
+		container_of(cb, struct vc4_async_flip_state, cb.fence);
+
+	vc4_async_page_flip_complete(flip_state);
+	dma_fence_put(fence);
+}
+
+static int vc4_async_set_fence_cb(struct drm_device *dev,
+				  struct vc4_async_flip_state *flip_state)
+{
+	struct drm_framebuffer *fb = flip_state->fb;
+	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct dma_fence *fence;
+	int ret;
+
+	if (!vc4->is_vc5) {
+		struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
+
+		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
+					  vc4_async_page_flip_seqno_complete);
+	}
+
+	ret = dma_resv_get_singleton(cma_bo->base.resv, DMA_RESV_USAGE_READ, &fence);
+	if (ret)
+		return ret;
+
+	/* If there's no fence, complete the page flip immediately */
+	if (!fence) {
+		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+		return 0;
+	}
+
+	/* If the fence has already been completed, complete the page flip */
+	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
+				   vc4_async_page_flip_fence_complete))
+		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
+
+	return 0;
+}
+
 static int
 vc4_async_page_flip_common(struct drm_crtc *crtc,
 			   struct drm_framebuffer *fb,
@@ -844,8 +889,6 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct drm_plane *plane = crtc->primary;
 	struct vc4_async_flip_state *flip_state;
-	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
-	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
 
 	flip_state = kzalloc(sizeof(*flip_state), GFP_KERNEL);
 	if (!flip_state)
@@ -876,8 +919,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
 	 */
 	drm_atomic_set_fb_for_plane(plane->state, fb);
 
-	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
-			   vc4_async_page_flip_seqno_complete);
+	vc4_async_set_fence_cb(dev, flip_state);
 
 	/* Driver takes ownership of state on successful async commit. */
 	return 0;
-- 
2.36.1

