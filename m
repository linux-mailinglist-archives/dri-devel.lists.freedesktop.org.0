Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB643983B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452CF6E064;
	Mon, 25 Oct 2021 14:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F86E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C106A5805CC;
 Mon, 25 Oct 2021 10:11:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Oct 2021 10:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+hSOzJzRLZ76M
 okv/w6B702fkyVIiqVGebQxl3vcw5A=; b=F6UQyIH/9i8+xD8NgH/19jiag+7WB
 gZEbWzvwxnAQLPb+WrY1UcFueO2geFlpw5kreukr2agTmqpIcDeyRk7Tpghtl0cF
 nyDlFfjeRzPhRpnMyGw5039melaqGtUgZMwkhbR4iWchkWsBruhzWIsgYWZL4Rnt
 U5gCZCmpW46Ns5qiHdeEp++9oX+HlfQ36r8eWwxUQ+dKjEltktgr8VvP09ccNDrR
 Ge9O8sB+Cqk2YKcwirXRL3lLVUiEX8ZeRtouxfeBbT1vmZECqqmAL0gYeDiT6HRs
 JNZnJeJtzWnJygyHo2PcbfSM4jSwJzdMhjVgZe7WobLlaOfJ/80oEimsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+hSOzJzRLZ76Mokv/w6B702fkyVIiqVGebQxl3vcw5A=; b=iJPMjKJW
 1/mTP/ikiIe9gFIXQsaH5jP0qoXqA6UBqcXV74RmfykbZ2z0nglIofelOP1r4lJo
 u9gDUzfAVDHMtYzvWMLJxBJbvnNGvaPhw5vtsmPphRC8SK4jYGqC1Iv66uTt+W4V
 1bHWgDnbyGKoo0g4wRKkJRcSTaj6WadxQWuLictPFLWNR7XT1a0noGmi3WEc3e0Z
 98SIgkrSsayJBVyKXUWeVXBCg68e0zSDTVVW/Q3YU9Lt/DocX5LD8Vs0R3mt8anf
 ECg8+FwTJ+82KWtGL9gcmQMx5DZGJ+hyyhvfDDCBnnt636a++1A58ZBi984xX3y6
 W9hb7wNt8GXOiA==
X-ME-Sender: <xms:Crt2YfnGyu4oI5sr96nmbY0z70IovWOCjxWazUrEjxyyrWAdbkMpzQ>
 <xme:Crt2YS2KnH7V1dhE4e_rLwYt4e4kbu7CnCbsLAy6d3FAkGjS9mIroEaCFAM_cDXeo
 RSJoDVLNJxlQWGRdP8>
X-ME-Received: <xmr:Crt2YVqbp-us0xTj6tFRXDt4L1MITS3QH4cdPfJpvT1-Yew8DCnT5cQq1xFjuSVhx0-JC6bbXjuH9E6wM2ZI62n6adk80zOmClPF_2Vy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeetueeludeikefgheethfefgfektdfgheefleetheffuddvleegffekvdfh
 vdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Crt2YXlty3MfynYMUQDg5Nd4hnlkj75WssS20liB5Gx0fF84Y2NQXw>
 <xmx:Crt2Yd0WyCeIRIyutiTg9LX9mjwuQyguHn3_Yf1M0kO_Wjq9GA-LaQ>
 <xmx:Crt2YWvmXu8udLC7-htRvw1woNF1P4i9Yw_AjfJwrUw-HdcaMMmxrw>
 <xmx:Crt2YXzeahW5XLmB_yck5kWpGTrn6aZ7TCX71bGlkyxGJj-8DpbMUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 2/9] drm/vc4: Fix non-blocking commit getting stuck forever
Date: Mon, 25 Oct 2021 16:11:06 +0200
Message-Id: <20211025141113.702757-3-maxime@cerno.tech>
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

In some situation, we can end up being stuck on a non-blocking that went
through properly.

The situation that seems to trigger it reliably is to first start a
non-blocking commit, and then right after, and before we had any vblank
interrupt), start a blocking commit.

This will lead to the first commit workqueue to be scheduled, setup the
display, while the second commit is waiting for the first one to be
completed.

The vblank interrupt will then be raised, vc4_crtc_handle_vblank() will
run and will compare the active dlist in the HVS channel to the one
associated with the crtc->state.

However, at that point, the second commit is waiting using
drm_atomic_helper_wait_for_dependencies that occurs after
drm_atomic_helper_swap_state has been called, so crtc->state points to
the second commit state. vc4_crtc_handle_vblank() will compare the two
dlist addresses and since they don't match will ignore the interrupt.

The vblank event will never be reported, and the first and second commit
will wait for the first commit completion until they timeout.

The underlying reason is that it was never safe to do so. Indeed,
accessing the ->state pointer access synchronization is based on
ownership guarantees that can only occur within the functions and hooks
defined as part of the KMS framework, and obviously the irq handler
isn't one of them. The rework to move to generic helpers only uncovered
the underlying issue.

However, since the code path between
drm_atomic_helper_wait_for_dependencies() and
drm_atomic_helper_wait_for_vblanks() is serialised and we can't get two
commits in that path at the same time, we can work around this issue by
setting a variable associated to struct drm_crtc to the dlist we expect,
and then using it from the vc4_crtc_handle_vblank() function.

Since that state is shared with the modesetting path, we also need to
introduce a spinlock to protect the code shared between the interrupt
handler and the modesetting path, protecting only our new variable for
now.

Link: https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/
Fixes: 56d1fe0979dc ("drm/vc4: Make pageflip completion handling more robust.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  5 ++++-
 drivers/gpu/drm/vc4/vc4_drv.h  | 14 ++++++++++++++
 drivers/gpu/drm/vc4/vc4_hvs.c  |  7 +++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b90187d2c819..98de8b265220 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -713,8 +713,9 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
+	spin_lock(&vc4_crtc->irq_lock);
 	if (vc4_crtc->event &&
-	    (vc4_state->mm.start == HVS_READ(SCALER_DISPLACTX(chan)) ||
+	    (vc4_crtc->current_dlist == HVS_READ(SCALER_DISPLACTX(chan)) ||
 	     vc4_crtc->feeds_txp)) {
 		drm_crtc_send_vblank_event(crtc, vc4_crtc->event);
 		vc4_crtc->event = NULL;
@@ -728,6 +729,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 		 */
 		vc4_hvs_unmask_underrun(dev, chan);
 	}
+	spin_unlock(&vc4_crtc->irq_lock);
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
@@ -1127,6 +1129,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		return PTR_ERR(primary_plane);
 	}
 
+	spin_lock_init(&vc4_crtc->irq_lock);
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3c69b89363cb..6d2480abcf08 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -500,6 +500,20 @@ struct vc4_crtc {
 	 * @feeds_txp: True if the CRTC feeds our writeback controller.
 	 */
 	bool feeds_txp;
+
+	/**
+	 * @irq_lock: Spinlock protecting the resources shared between
+	 * the atomic code and our vblank handler.
+	 */
+	spinlock_t irq_lock;
+
+	/**
+	 * @current_dlist: Start offset of the display list currently
+	 * set in the HVS for that CRTC. Protected by @irq_lock, and
+	 * copied in vc4_hvs_update_dlist() for the CRTC interrupt
+	 * handler to have access to that value.
+	 */
+	unsigned int current_dlist;
 };
 
 static inline struct vc4_crtc *
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 9ddaee6b368d..f8ed0f6a57e0 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -365,10 +365,9 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	unsigned long flags;
 
 	if (crtc->state->event) {
-		unsigned long flags;
-
 		crtc->state->event->pipe = drm_crtc_index(crtc);
 
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
@@ -388,6 +387,10 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
 			  vc4_state->mm.start);
 	}
+
+	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
+	vc4_crtc->current_dlist = vc4_state->mm.start;
+	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
 }
 
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
-- 
2.31.1

