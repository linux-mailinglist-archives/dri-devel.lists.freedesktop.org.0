Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0F439837
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CC6E038;
	Mon, 25 Oct 2021 14:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD0689FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id AB47D5805C9;
 Mon, 25 Oct 2021 10:11:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 10:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=THqkG9CQz5e/W
 GVPnbLRZuBmGr1LKHsZoeshuJbnnGQ=; b=k1FTv6/DotFMROwLePZ7vb3F0NlpR
 HNegEGlFlgISbX7xRUj7v/kK7j+4e3ZHG/LzJo68yKP/zzNvqN2yoTspkLKBbsu2
 pwby5vcmX+1xc8bGQfBCXzcMtkUBIfqfCm1Mfh4YOE2IXyn6BTnp4RvpcC/NRPSB
 CuxECM4I7Q/ZpcmiHlnrH0KvOesHi7r6X6dB8jnALIddDTY/NWohCpBEUdK7JZsH
 ozFDDE9e8nD8gVaGbbIf0WJJcCqYRPvnxgzJ9KkJIgixE5CcRDYlx7HFM4kNSySS
 N+GQTp/WiAbWowaLwq1tpUei819dCov+DHNtvcZtLvb7K9F91lKDIaZOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=THqkG9CQz5e/WGVPnbLRZuBmGr1LKHsZoeshuJbnnGQ=; b=EbkbJtSy
 Zx/xoEm3HXy30qu8vfRg/CsLcWKzdRZkK5+gSzqqED3OgAfkGdS6MwHi4g4OwxWQ
 Q8Tv0dbejdThQRK6NQRl4k6lqbWSBJJOKD8GCj9CK2n745Ff2yidVA6NJ2IaiR+4
 iv4uHp/aES3+OT1ip6a1Cd/edrn/yQsKfYyJmRXRSYzrkvpXq6k7rCW0dc+YXRsc
 g4+K9LWGsKqxsBpHB3PXnPk4OhUaGGkZErh/d1iP+BYDAHcfqPuvBGp4gSbyYz8i
 rsvMk45gZuCeyHSai21WyOMhBWjGlCS6DuV3Q/SXv9r4v5fDT/NgGeOMDYDUwSiu
 aWWUeJQLJ8gOKA==
X-ME-Sender: <xms:B7t2YQeFe0LhsPWn5s1uRxZwj9Yr6DnXeCg2VjzCG-guQ_HsXVEH-g>
 <xme:B7t2YSMKhkTacTTHMaUPA0YlvBtyMpEjQHdNH_vF08vz-TeXPuY-tsvmwKHKRrUaf
 TqOVBxOkI0xncmc5-0>
X-ME-Received: <xmr:B7t2YRgb0kMi50NYbXvS8ny-r7aKvOScg9UsAwDyVANvDIG1LucSit_GkcB77NG1wsp-8dLxazi6yL5nVSJ5jBlDR4RO9AbTbrvQ_mCN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeetueeludeikefgheethfefgfektdfgheefleetheffuddvleegffekvdfh
 vdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:B7t2YV-F0LPPP_sVIsBvZ8o0r9ahHxMTgDAiIwV0vcbPgmT4zKMPBA>
 <xmx:B7t2Ycvnc3nNF674IP-nN8iQflMSgBQwQ3keRUQXwiFPu7ycw2BiIQ>
 <xmx:B7t2YcGvpBIXIFDAaPY89Nkhyj_QcEfYsetVJvxGgczKWweqtciDQg>
 <xmx:CLt2YeK7HXU5uGwhwCECkGhngLF065lOMk5XIRrDs_e2fgpXKyh5wA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 1/9] drm/vc4: crtc: Drop feed_txp from state
Date: Mon, 25 Oct 2021 16:11:05 +0200
Message-Id: <20211025141113.702757-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accessing the crtc->state pointer from outside the modesetting context
is not allowed. We thus need to copy whatever we need from the KMS state
to our structure in order to access it.

In VC4, a number of users of that pointers have crept in over the years,
the first one being whether or not the downstream controller of the
pixelvalve is our writeback controller.

Fortunately for us, Since commit 39fcb2808376 ("drm/vc4: txp: Turn the
TXP into a CRTC of its own") this is no longer something that can change
from one commit to the other and is hardcoded.

Let's set this flag in struct vc4_crtc if we happen to be the TXP, and
drop the flag from our private state structure.

Link: https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/
Fixes: 008095e065a8 ("drm/vc4: Add support for the transposer block")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 +--
 drivers/gpu/drm/vc4/vc4_drv.h  | 6 +++++-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 7 +++----
 drivers/gpu/drm/vc4/vc4_kms.c  | 3 ++-
 drivers/gpu/drm/vc4/vc4_txp.c  | 3 +--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index c0df11e5fcf2..b90187d2c819 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -715,7 +715,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	spin_lock_irqsave(&dev->event_lock, flags);
 	if (vc4_crtc->event &&
 	    (vc4_state->mm.start == HVS_READ(SCALER_DISPLACTX(chan)) ||
-	     vc4_state->feed_txp)) {
+	     vc4_crtc->feeds_txp)) {
 		drm_crtc_send_vblank_event(crtc, vc4_crtc->event);
 		vc4_crtc->event = NULL;
 		drm_crtc_vblank_put(crtc);
@@ -893,7 +893,6 @@ struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
 		return NULL;
 
 	old_vc4_state = to_vc4_crtc_state(crtc->state);
-	vc4_state->feed_txp = old_vc4_state->feed_txp;
 	vc4_state->margins = old_vc4_state->margins;
 	vc4_state->assigned_channel = old_vc4_state->assigned_channel;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ef73e0aaf726..3c69b89363cb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -495,6 +495,11 @@ struct vc4_crtc {
 	struct drm_pending_vblank_event *event;
 
 	struct debugfs_regset32 regset;
+
+	/**
+	 * @feeds_txp: True if the CRTC feeds our writeback controller.
+	 */
+	bool feeds_txp;
 };
 
 static inline struct vc4_crtc *
@@ -521,7 +526,6 @@ struct vc4_crtc_state {
 	struct drm_crtc_state base;
 	/* Dlist area for this CRTC configuration. */
 	struct drm_mm_node mm;
-	bool feed_txp;
 	bool txp_armed;
 	unsigned int assigned_channel;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c239045e05d6..9ddaee6b368d 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -375,7 +375,7 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 
 		spin_lock_irqsave(&dev->event_lock, flags);
 
-		if (!vc4_state->feed_txp || vc4_state->txp_armed) {
+		if (!vc4_crtc->feeds_txp || vc4_state->txp_armed) {
 			vc4_crtc->event = crtc->state->event;
 			crtc->state->event = NULL;
 		}
@@ -395,10 +395,9 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(new_crtc_state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	bool oneshot = vc4_state->feed_txp;
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	bool oneshot = vc4_crtc->feeds_txp;
 
 	vc4_hvs_update_dlist(crtc);
 	vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f0b3e4cf5bce..028f19f7a5f8 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -233,6 +233,7 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	unsigned int i;
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		u32 dispctrl;
 		u32 dsp3_mux;
@@ -253,7 +254,7 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 		 * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
 		 * route.
 		 */
-		if (vc4_state->feed_txp)
+		if (vc4_crtc->feeds_txp)
 			dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
 		else
 			dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 2fc7f4b5fa09..26eda7542f74 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -391,7 +391,6 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 	int ret;
 
 	ret = vc4_hvs_atomic_check(crtc, state);
@@ -399,7 +398,6 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 		return ret;
 
 	crtc_state->no_vblank = true;
-	vc4_state->feed_txp = true;
 
 	return 0;
 }
@@ -482,6 +480,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_crtc->pdev = pdev;
 	vc4_crtc->data = &vc4_txp_crtc_data;
+	vc4_crtc->feeds_txp = true;
 
 	txp->pdev = pdev;
 
-- 
2.31.1

