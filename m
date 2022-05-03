Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43851840A
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3D10F9AE;
	Tue,  3 May 2022 12:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3010F94D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 57FAC320098A;
 Tue,  3 May 2022 08:14:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 03 May 2022 08:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580065; x=1651666465; bh=l6
 +T2WooOKnkLZVfu1cuWZp3aUS+nnaiETDmQNpgp/E=; b=wt5kHe0osLqam6DivH
 O4hUZiG8pMcIlonGXbYl7KFNrVbJmDk3JVdU9SEyVKBh4S/l1QrIPxd/1gSuG7uL
 h87CAceCFD60rIdg6K4Gos/ZMjRKslLjgADlCdz4aVpkiNqqOzoNJefrhvZOhl7u
 gWAYQd4dYJiWENHnBHNvdqTEwbi4D+Eiwvs2yy5sEZKjj4fMi2v3cpuZhYQN+xvH
 TX3xO9n3JrAc0pw4aZpf8UhzR3y8c5eRcCO7Jy+p2C+goYtvIESlN6lip38zVm2J
 D1NsYzvEHD4MM2qLsEVXf+yG+om1eQuss06OXQSvSCxIDbs4YtMM1X8Q2HBeToEE
 /RCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580065; x=1651666465; bh=l6+T2WooOKnkLZVfu1cuWZp3aUS+nnaiETD
 mQNpgp/E=; b=PirsLU9CCtN3XOum4i5BDX0FA3vwXi9zKvkiqEX7OL99fRlerNl
 wEljZqQTkYUQgCg+gy07EpsnkSy/JPj+OxLLssm9f5a+EvVCsWipgPUOKI/xOxzn
 89lcZ4gKrqFlUt2Iny6qE8Ll5k+VLHteKSPcAZfJ8DAYXkbFLWgmu2C3PQd/6wch
 mh/dDXiq6pyjE1GQfFMMfUF4m9JgslA0+/BkTjlqY+X9WghZT8lf+vbqLQvVGmk7
 Rd8/beLQhmwMxQyxitG9BB8PwulOU3cWFcDAoSMPvR+sYQI+ocWUefl1h2mJ3A7g
 cpfYY+uTYyg45CxuUiec7MZISFa3bzqo9lQ==
X-ME-Sender: <xms:oRxxYtN5xWA1eKm4kJDFE7rKiCeEqWiGETRhUD9JWj7MhZioLDNRrw>
 <xme:oRxxYv-MAjDZhGKpVOqV_l_QHnPa-Ee4kpl6KfewTcspsGzI_Ngwo5Dh6UX5oUYMa
 cRl9crfBJ9X0j5fKVA>
X-ME-Received: <xmr:oRxxYsR6N9DbPZ439zA8t1KRCl0CqHMwZVxa6fwQx1PTo5lVUQxNDajM-df2ZS6sffC3HPO-lTuVPtbpiDUrsJWYO6VOJ9lCDeZzFV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oRxxYpvJfun_UXHRgA53hF_MwJJdogpKZPLv4S5ZWdTNkLLPtHA0vQ>
 <xmx:oRxxYlfdRNVW1nSXYzIfIixQWiQGUq_SSVNOTEIQIuUKvDRG0TwYFA>
 <xmx:oRxxYl0ESaw2iVgFOkr6Hhnq_JyV8WnIr8y61qbPSdFM5P2QaL6g9w>
 <xmx:oRxxYuH3kbC2vWfcX3yT8BZCtSEYlM4eOUSZwvG_umTEsAKtzwUR3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/14] drm/vc4: crtc: Move the BO Handling out of Common
 Page-Flip Handler
Date: Tue,  3 May 2022 14:13:38 +0200
Message-Id: <20220503121341.983842-12-maxime@cerno.tech>
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

The function vc4_async_page_flip() handles asynchronous page-flips in
the vc4 driver.

However, it mixes some generic code with code that should only be run on
older generations that have the GPU handled by the vc4 driver.

Let's split the generic part out of vc4_async_page_flip() and into a
common function that we be reusable by an handler made for the BCM2711.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 75 ++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 0410db97b9d1..bd85b1f13cee 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -835,40 +835,19 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
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
-	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
-	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
-
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
 
 	flip_state = kzalloc(sizeof(*flip_state), GFP_KERNEL);
-	if (!flip_state) {
-		vc4_bo_dec_usecnt(bo);
+	if (!flip_state)
 		return -ENOMEM;
-	}
 
 	drm_framebuffer_get(fb);
 	flip_state->fb = fb;
@@ -902,6 +881,48 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
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
2.35.1

