Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3251840C
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87B10F95A;
	Tue,  3 May 2022 12:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6FF10F94D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1B31C320098D;
 Tue,  3 May 2022 08:14:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 03 May 2022 08:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580072; x=1651666472; bh=kQ
 mWEwY5Rg6o5ehhB2EBcnY8OpZ76XdexZ0cJa4xDE0=; b=QuCiF7CcNmj8vNe7qn
 Dfb6yEBa1pyJIvQD/AArej5puimMbgBTuOUgAFX3VG2TyXzpEk2SATSRxmVQ3Ezv
 bo8lqqyVJwLs+CP9uhLilv26QbIJ6OBjBnsRNAYKeIQ8ZmEFPsPNFYXQjQahnVJP
 Xf/VhTUkdyCrj1K46V4xXQaO+r6fN212jwplgpb/RtsXN0EdCnnczyCJyb26NLsl
 smxETnktrNSelqShK9b6oVViLyXjnk5ZMNKCjdzbQZXrcMUw4av1R1cqppykhIWT
 pdaTsUxGlWKLJUx0K5Bm5nWAETQn209+oGKY2jbLrdOzCzvZ/oSoDSsOIcfmxRUE
 SoJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580072; x=1651666472; bh=kQmWEwY5Rg6o5ehhB2EBcnY8OpZ76XdexZ0
 cJa4xDE0=; b=cFMSH/Uxaast5yrJpYlDndKqQO9B7ubPVVacyCnhZo97/oD2e/l
 RnWW6Z2zL7A7RZAdxA22TImoHru129h6IG4cx8d31l//wmWEJ4d9jY3n6tKB0FjH
 QRH47vKhNjOMNpjOPq/ImrP4HnroZWboFomrL5CUU7z87F2K16i5gvS1yiLQT41y
 uvo2j6JDoxoPLuwhY2G9d4PAHMQ43J4JJIBF4+1tC6XyGSxeyHXKZxjG2JSb6feq
 Yz2sStSQiQSiB3ZCsTiqd6OuUhkN9vMvqiKkYiR4WQKJkdD4wLhUBY5uhbXvLeFb
 /E7ag3WoytclK9VUwHNriQIXbBjbC+oDlIA==
X-ME-Sender: <xms:qBxxYofdZz6L3xDK1HnsFN2YvvQvaxoCwLHfvrGWdxWyZCNZvFYgQw>
 <xme:qBxxYqO4qnXHBN_Z-QECWV3jhW2I0y7yGWeqVJA8gKcyDDM3ZfgRkWwEG8xjCD4Ro
 72YIiZ7w2RkOR3nenA>
X-ME-Received: <xmr:qBxxYphnNwNnZ5BSCLyHing0oxgsR2W7JOorSAval06oi97wJge_uv3Fr5eossSP54X7yQshLUYT5Df0kkUuijmiL645jM7CCYTNCTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qBxxYt8Xrbq5TiVDrwKl_b0TC4fpfyukTXLUcEca5Sx6Edv03jm3fw>
 <xmx:qBxxYktI_Z4adNpPB0RLRH0OW6NwoMjSbaQzxI_EVUWcNYG6kgWFVA>
 <xmx:qBxxYkHG1XA0t45FSvswhW_fZG_IOhnzPI9f9crPPUg62IDPupl-Iw>
 <xmx:qBxxYuUy5lgwL1OfI539mHPcPxpUwG1CN-oc_dRPpvdzeWUJBfFywA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Date: Tue,  3 May 2022 14:13:40 +0200
Message-Id: <20220503121341.983842-14-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e0ae7bef08fa..8e1369fca937 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -776,6 +776,7 @@ struct vc4_async_flip_state {
 	struct drm_pending_vblank_event *event;
 
 	union {
+		struct dma_fence_cb fence;
 		struct vc4_seqno_cb seqno;
 	} cb;
 };
@@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
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
+	ret = dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
+	if (ret)
+		return ret;
+
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
@@ -874,8 +912,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
 	 */
 	drm_atomic_set_fb_for_plane(plane->state, fb);
 
-	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
-			   vc4_async_page_flip_seqno_complete);
+	vc4_async_set_fence_cb(dev, flip_state);
 
 	/* Driver takes ownership of state on successful async commit. */
 	return 0;
-- 
2.35.1

