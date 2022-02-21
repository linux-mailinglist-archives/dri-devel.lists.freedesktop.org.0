Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A574BDA02
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF9710E3C0;
	Mon, 21 Feb 2022 13:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E03610E392
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6CABF5C01F7;
 Mon, 21 Feb 2022 08:42:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 08:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=TMMToBlps5uxyswoANHhH5t4mR7fFx
 jdiLTdE0y76bo=; b=G8bM0qldnn5FOoLRuQSZ8YLOVZTDUkfHnO3Z+aAFSPQ8X5
 LTZkk7t413wCamLY78n7ctKAsXtjbQp1jwxYv4z5AoXXsWfwku4/KzBgfmRc7HVM
 hW77cn6qmVqsYrp5b8ia9qAXwae+aiqGCqdC8HnErS70ZAoZMePepxZct4an73UB
 C9CA1YslmxBUrc0of+Joop3E4MLFcReJjgypTT8fmkSt+Iky6C4J30E5r5PZS1ix
 5GtV6wuwJ3g2klUpKSKjwO3xv1ESlTPPhuJEA/5DC7AQD3dgXRlajiOYkoXnpG0W
 tPSRs5yt6Q8oXD2DaGxARIv2vlJ/c2zs9dOuK8PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TMMToB
 lps5uxyswoANHhH5t4mR7fFxjdiLTdE0y76bo=; b=lEbM3PPx/lWyCXmOJgao2q
 JRPiZTTCkVnf2tl+pvxrodF+zBzy40O1c9TgKUnzsNd+cJ28luYmHBdqfz6WcLoO
 oXbR1aEF4qt4W9CCbfGXkyarZTCTmuGUWPakQyGKsEFf7uk7Lrt3BHoJrcUZ7tIV
 dc8RJOzkYWMklbK5aDzP4bWqdtUz9QWPN7+1gBvAa1vOggwIKV2QJ0pD2S6Jdv3F
 CEgtpSzT06//CaQ16PSj00lA7hEHBwgogtjzXFHSfe3HvxJKzC5V+REISRmdg+tN
 ejcfLP8+OoL1XYs+ENNgmg7Y8vkYnUmi4NyFj0NfQpkjGF3r2zLiGN8yCSNsKGRw
 ==
X-ME-Sender: <xms:uZYTYo-qPygKHnyMT-UfMKXhciSg4Da80oTqgJGTwoq1ctXiBQaXDg>
 <xme:uZYTYgs1ItwuA2cWuhat7wyI8rFtqNqLNbb0d1shMYwB7nB43DtjlVFDZV7wXkQdA
 cdcb_3Oz-sl_8FD3hU>
X-ME-Received: <xmr:uZYTYuDPvN3egy5YPg297epsAIaGKp4T8Vnw9MeRC3VcmzJbye8UUMypmvazeJdBk7Cv3c9HGRB3eY555wCRnPwdHtkRKlTIV8TbceQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uZYTYocuizPz4zajuz0jh_jGY9EcATFNALKwNooIbVtih0zA7HdOsg>
 <xmx:uZYTYtPdxzCuz7E8xDiefUEgHM5S0mJeXSOB3309vFfmOSgUmpC31A>
 <xmx:uZYTYimhz0-Vxz_1CZDzI7JYRWKd3cjKD_rjqmAb21uP66IxcZLmbg>
 <xmx:uZYTYmhwvy_3W0iRpoYStB4DXnV1SwIlVz_9Ep-LbICKhK-65rs-hA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 8/8] drm/vc4: hvs: Defer dlist slots deallocation
Date: Mon, 21 Feb 2022 14:41:55 +0100
Message-Id: <20220221134155.125447-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During normal operations, the cursor position update is done through an
asynchronous plane update, which on the vc4 driver basically just
modifies the right dlist word to move the plane to the new coordinates.

However, when we have the overscan margins setup, we fall back to a
regular commit when we are next to the edges. And since that commit
happens to be on a cursor plane, it's considered a legacy cursor update
by KMS.

The main difference it makes is that it won't wait for its completion
(ie, next vblank) before returning. This means if we have multiple
commits happening in rapid succession, we can have several of them
happening before the next vblank.

In parallel, our dlist allocation is tied to a CRTC state, and each time
we do a commit we end up with a new CRTC state, with the previous one
being freed. This means that we free our previous dlist entry (but don't
clear it though) every time a new one is being committed.

Now, if we were to have two commits happening before the next vblank, we
could end up freeing reusing the same dlist entries before the next
vblank.

Indeed, we would start from an initial state taking, for example, the
dlist entries 10 to 20, then start a commit taking the entries 20 to 30
and setting the dlist pointer to 20, and freeing the dlist entries 10 to
20. However, since we haven't reach vblank yet, the HVS is still using
the entries 10 to 20.

If we were to make a new commit now, chances are the allocator are going
to give the 10 to 20 entries back, and we would change their content to
match the new state. If vblank hasn't happened yet, we just corrupted
the active dlist entries.

A first attempt to solve this was made by creating an intermediate dlist
buffer to store the current (ie, as of the last commit) dlist content,
that we would update each time the HVS is done with a frame. However, if
the interrupt handler missed the vblank window, we would end up copying
our intermediate dlist to the hardware one during the composition,
essentially creating the same issue.

Since making sure that our interrupt handler runs within a fixed,
constrained, time window would require to make Linux a real-time kernel,
this seems a bit out of scope.

Instead, we can work around our original issue by keeping the dlist
slots allocation longer. That way, we won't reuse a dlist slot while
it's still in flight. In order to achieve this, instead of freeing the
dlist slot when its associated CRTC state is destroyed, we'll queue it
in a list.

A naive implementation would free the buffers in that queue when we get
our end of frame interrupt. However, there's still a race since, just
like in the shadow dlist case, we don't control when the handler for
that interrupt is going to run. Thus, we can end up with a commit adding
an old dlist allocation to our queue during the window between our
actual interrupt and when our handler will run. And since that buffer is
still being used for the composition of the current frame, we can't free
it right away, exposing us to the original bug.

Fortunately for us, the hardware provides a frame counter that is
increased each time the first line of a frame is being generated.
Associating the frame counter the image is supposed to go away to the
allocation, and then only deallocate buffers that have a counter below
or equal to the one we see when the deallocation code should prevent the
above race from occuring.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  10 +-
 drivers/gpu/drm/vc4/vc4_drv.h  |  15 ++-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 181 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_regs.h |   1 +
 4 files changed, 184 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 5bb4027e479e..ed5fc400b66d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -920,14 +920,8 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 	struct vc4_dev *vc4 = to_vc4_dev(crtc->dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
 
-	if (drm_mm_node_allocated(&vc4_state->mm)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
-		drm_mm_remove_node(&vc4_state->mm);
-		spin_unlock_irqrestore(&vc4->hvs->mm_lock, flags);
-
-	}
+	vc4_hvs_mark_dlist_entry_stale(vc4->hvs, vc4_state->mm);
+	vc4_state->mm = NULL;
 
 	drm_atomic_helper_crtc_destroy_state(crtc, state);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 15e0c2ac3940..4d155af0262d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -330,6 +330,9 @@ struct vc4_hvs {
 	struct drm_mm lbm_mm;
 	spinlock_t mm_lock;
 
+	struct list_head stale_dlist_entries;
+	struct work_struct free_dlist_work;
+
 	struct drm_mm_node mitchell_netravali_filter;
 
 	struct debugfs_regset32 regset;
@@ -544,10 +547,16 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 					 struct drm_crtc_state *state);
 
+struct vc4_hvs_dlist_allocation {
+	struct list_head node;
+	struct drm_mm_node mm_node;
+	unsigned int channel;
+	u8 target_frame_count;
+};
+
 struct vc4_crtc_state {
 	struct drm_crtc_state base;
-	/* Dlist area for this CRTC configuration. */
-	struct drm_mm_node mm;
+	struct vc4_hvs_dlist_allocation *mm;
 	bool txp_armed;
 	unsigned int assigned_channel;
 
@@ -936,6 +945,8 @@ extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
+void vc4_hvs_mark_dlist_entry_stale(struct vc4_hvs *hvs,
+				    struct vc4_hvs_dlist_allocation *alloc);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 50faa5227cf1..70f8ee916133 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -196,6 +196,150 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 	vc4_hvs_lut_load(hvs, vc4_crtc);
 }
 
+static void vc4_hvs_irq_enable_eof(const struct vc4_hvs *hvs,
+				   unsigned int channel)
+{
+	u32 irq_mask = hvs->hvs5 ?
+		SCALER5_DISPCTRL_DSPEIEOF(channel) :
+		SCALER_DISPCTRL_DSPEIEOF(channel);
+
+	HVS_WRITE(SCALER_DISPCTRL,
+		  HVS_READ(SCALER_DISPCTRL) | irq_mask);
+}
+
+static void vc4_hvs_irq_clear_eof(const struct vc4_hvs *hvs,
+				  unsigned int channel)
+{
+	u32 irq_mask = hvs->hvs5 ?
+		SCALER5_DISPCTRL_DSPEIEOF(channel) :
+		SCALER_DISPCTRL_DSPEIEOF(channel);
+
+	HVS_WRITE(SCALER_DISPCTRL,
+		  HVS_READ(SCALER_DISPCTRL) & ~irq_mask);
+}
+
+static struct vc4_hvs_dlist_allocation *
+vc4_hvs_alloc_dlist_entry(struct vc4_hvs *hvs,
+			  unsigned int channel,
+			  size_t dlist_count)
+{
+	struct vc4_hvs_dlist_allocation *alloc;
+	unsigned long flags;
+	int ret;
+
+	if (channel == VC4_HVS_CHANNEL_DISABLED)
+		return NULL;
+
+	alloc = kzalloc(sizeof(*alloc), GFP_KERNEL);
+	if (!alloc)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_irqsave(&hvs->mm_lock, flags);
+	ret = drm_mm_insert_node(&hvs->dlist_mm, &alloc->mm_node,
+				 dlist_count);
+	spin_unlock_irqrestore(&hvs->mm_lock, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+	alloc->channel = channel;
+
+	return alloc;
+}
+
+void vc4_hvs_mark_dlist_entry_stale(struct vc4_hvs *hvs,
+				    struct vc4_hvs_dlist_allocation *alloc)
+{
+	unsigned long flags;
+	u8 frcnt;
+
+	if (!alloc)
+		return;
+
+	if (!drm_mm_node_allocated(&alloc->mm_node))
+		return;
+
+	frcnt = vc4_hvs_get_fifo_frame_count(hvs, alloc->channel);
+	alloc->target_frame_count = (frcnt + 1) & ((1 << 6) - 1);
+
+	spin_lock_irqsave(&hvs->mm_lock, flags);
+
+	list_add_tail(&alloc->node, &hvs->stale_dlist_entries);
+
+	HVS_WRITE(SCALER_DISPSTAT, SCALER_DISPSTAT_EOF(alloc->channel));
+	vc4_hvs_irq_enable_eof(hvs, alloc->channel);
+
+	spin_unlock_irqrestore(&hvs->mm_lock, flags);
+}
+
+static void vc4_hvs_schedule_dlist_sweep(struct vc4_hvs *hvs,
+					 unsigned int channel)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&hvs->mm_lock, flags);
+
+	if (!list_empty(&hvs->stale_dlist_entries))
+		queue_work(system_unbound_wq, &hvs->free_dlist_work);
+
+	vc4_hvs_irq_clear_eof(hvs, channel);
+
+	spin_unlock_irqrestore(&hvs->mm_lock, flags);
+}
+
+/*
+ * Frame counts are essentially sequence numbers over 6 bits, and we
+ * thus can use sequence number arithmetic and follow the RFC1982 to
+ * implement proper comparison between them.
+ */
+static bool vc4_hvs_frcnt_lte(u8 cnt1, u8 cnt2)
+{
+	return (s8)((cnt1 << 2) - (cnt2 << 2)) <= 0;
+}
+
+/*
+ * Some atomic commits (legacy cursor updates, mostly) will not wait for
+ * the next vblank and will just return once the commit has been pushed
+ * to the hardware.
+ *
+ * On the hardware side, our HVS stores the planes parameters in its
+ * context RAM, and will use part of the RAM to store data during the
+ * frame rendering.
+ *
+ * This interacts badly if we get multiple commits before the next
+ * vblank since we could end up overwriting the DLIST entries used by
+ * previous commits if our dlist allocation reuses that entry. In such a
+ * case, we would overwrite the data currently being used by the
+ * hardware, resulting in a corrupted frame.
+ *
+ * In order to work around this, we'll queue the dlist entries in a list
+ * once the associated CRTC state is destroyed. The HVS only allows us
+ * to know which entry is being active, but not which one are no longer
+ * being used, so in order to avoid freeing entries that are still used
+ * by the hardware we add a guesstimate of the frame count where our
+ * entry will no longer be used, and thus will only free those entries
+ * when we will have reached that frame count.
+ */
+static void vc4_hvs_dlist_free_work(struct work_struct *work)
+{
+	struct vc4_hvs *hvs = container_of(work, struct vc4_hvs, free_dlist_work);
+	struct vc4_hvs_dlist_allocation *cur, *next;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hvs->mm_lock, flags);
+	list_for_each_entry_safe(cur, next, &hvs->stale_dlist_entries, node) {
+		u8 frcnt;
+
+		frcnt = vc4_hvs_get_fifo_frame_count(hvs, cur->channel);
+		if (!vc4_hvs_frcnt_lte(cur->target_frame_count, frcnt))
+			continue;
+
+		list_del(&cur->node);
+		drm_mm_remove_node(&cur->mm_node);
+		kfree(cur);
+	}
+	spin_unlock_irqrestore(&hvs->mm_lock, flags);
+}
+
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
 	u8 field = 0;
@@ -349,13 +493,12 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
+	struct vc4_hvs_dlist_allocation *alloc;
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane;
-	unsigned long flags;
 	const struct drm_plane_state *plane_state;
 	u32 dlist_count = 0;
-	int ret;
 
 	/* The pixelvalve can only feed one encoder (and encoders are
 	 * 1:1 with connectors.)
@@ -368,12 +511,11 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 	dlist_count++; /* Account for SCALER_CTL0_END. */
 
-	spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
-	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
-				 dlist_count);
-	spin_unlock_irqrestore(&vc4->hvs->mm_lock, flags);
-	if (ret)
-		return ret;
+	alloc = vc4_hvs_alloc_dlist_entry(vc4->hvs, vc4_state->assigned_channel, dlist_count);
+	if (IS_ERR(alloc))
+		return PTR_ERR(alloc);
+
+	vc4_state->mm = alloc;
 
 	return 0;
 }
@@ -385,8 +527,9 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 
+	WARN_ON(!vc4_state->mm);
 	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-		  vc4_state->mm.start);
+		  vc4_state->mm->mm_node.start);
 }
 
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
@@ -411,8 +554,10 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
+	WARN_ON(!vc4_state->mm);
+
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
-	vc4_crtc->current_dlist = vc4_state->mm.start;
+	vc4_crtc->current_dlist = vc4_state->mm->mm_node.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
 }
 
@@ -469,8 +614,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
 	bool enable_bg_fill = false;
-	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
-	u32 __iomem *dlist_next = dlist_start;
+	u32 __iomem *dlist_start, *dlist_next;
 
 	if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
 		return;
@@ -480,6 +624,9 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		vc4_hvs_dump_state(hvs);
 	}
 
+	dlist_start = vc4->hvs->dlist + vc4_state->mm->mm_node.start;
+	dlist_next = dlist_start;
+
 	/* Copy all the active planes' dlist contents to the hardware dlist. */
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		/* Is this the first active plane? */
@@ -502,7 +649,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	writel(SCALER_CTL0_END, dlist_next);
 	dlist_next++;
 
-	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
+	WARN_ON(!vc4_state->mm);
+	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm->mm_node.size);
 
 	if (enable_bg_fill)
 		/* This sets a black background color fill, as is the case
@@ -596,6 +744,11 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 
 			irqret = IRQ_HANDLED;
 		}
+
+		if (status & SCALER_DISPSTAT_EOF(channel)) {
+			vc4_hvs_schedule_dlist_sweep(hvs, channel);
+			irqret = IRQ_HANDLED;
+		}
 	}
 
 	/* Clear every per-channel interrupt flag. */
@@ -652,6 +805,8 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
 
 	spin_lock_init(&hvs->mm_lock);
+	INIT_LIST_HEAD(&hvs->stale_dlist_entries);
+	INIT_WORK(&hvs->free_dlist_work, vc4_hvs_dlist_free_work);
 
 	/* Set up the HVS display list memory manager.  We never
 	 * overwrite the setup from the bootloader (just 128b out of
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index bae8c9cd6f7c..deb0c2f9c97f 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -234,6 +234,7 @@
 # define SCALER_DISPCTRL_DSPEIEOLN(x)		BIT(8 + ((x) * 2))
 /* Enables Display 0 EOF contribution to SCALER_DISPSTAT_IRQDISP0 */
 # define SCALER_DISPCTRL_DSPEIEOF(x)		BIT(7 + ((x) * 2))
+# define SCALER5_DISPCTRL_DSPEIEOF(x)		BIT(7 + ((x) * 4))
 
 # define SCALER_DISPCTRL_SLVRDEIRQ		BIT(6)
 # define SCALER_DISPCTRL_SLVWREIRQ		BIT(5)
-- 
2.35.1

