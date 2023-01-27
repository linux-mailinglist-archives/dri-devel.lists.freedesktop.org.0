Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F467E20B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254C310E448;
	Fri, 27 Jan 2023 10:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053E10E449
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:43:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 49BC82B07175;
 Fri, 27 Jan 2023 05:43:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 27 Jan 2023 05:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674816227; x=1674823427; bh=++YhNcrxN+
 hdybk+JQlWZuvUjaALX2EkCZ7w4Jz2pww=; b=hB/5gJcc+Ms2+lG9M/lY+r6gDI
 FZx19V+cg/FCM1KDPvuv8XJnoTFBs+UNbW3cM3NK9Bs2bnG+J2r6PIauv2+6Evdo
 K6rPeFCkdhVbWIo990zyu7SBrLKlMbt+v0Jcsz3Qt8Cs4xICS5O1IxIkqTd4DvU7
 gJX8uus92qnKN6/Ks4vXsyy0lPHzWz8fffTc9mP/wLRFREIPxKSqjGD9grBsDO7J
 r1QOFJWP+5vTILZptak5jCkzWRmVti30o3/3qX/5gT4p7k2z7wdPcgp0Wf9p1VXR
 BxFbbvBtHX6rR+cvobeg9FnGltad01eLZLXu8CiY3I3VDiKdGe9b/idOS2ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674816227; x=1674823427; bh=++YhNcrxN+hdy
 bk+JQlWZuvUjaALX2EkCZ7w4Jz2pww=; b=mi2dYi+joLduuvSQetFOu2nUzYWT3
 jbFRiowK4/PwxRPcJZqgp4k7jKr/xxdvIp4uaJkby/iMyU5Vvj3q1ub+wPPB9SqY
 EeeJDp/Xbk47n7GjViG4ATo5QkYJmh9U1K5pneWxCBjgpeL8NEB4zt3ClPIPS+TJ
 +Omiu3XKnGA6rq0V/YZI3KcBn6fzVwbH27TUXAL8r/eSoszIatMGR5vbbnWo/Kx6
 7P/ymO0GLDCKi1Ec8Nuyu1DLXLLt15cHXNYVpUdp9W1yGOLBkDf1Ip7rpjzp1cEt
 mI0KL1XlSyiHS9s4aKjpZKvD7vopj7FAIjNw9Si7paLozePm/mkKkR3qQ==
X-ME-Sender: <xms:4qrTY8--iaMr7ao7ffEkFseEIpSC1-_B5v9iJPsRxb5tNgt5NSxB3A>
 <xme:4qrTY0tU3hMON0TxP7IK3c_Qiqi9ENLDHytCzVAyH3hFV5WY3yZ32TlwJP5W08wuk
 e9B8TqqJG85pZXgg24>
X-ME-Received: <xmr:4qrTYyCe6etOg4u5kYYOKzjmVt1LUOdqYkji7pW8OSrJJBnGat_FjeuGhbexWayiyqTkGh3D4Iw5tCmVREKeJmnuFLoiwNb7A2hXemGqhaBIsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhephefgueegjeeuudevvdehtdejfeejgfeuteduudfhtddtgeetueeigfefvedu
 ieehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4qrTY8d_7CDkQC_IuOaF7T0ARbCC_kXxtJ7OUVKBT97mHAouboAmmQ>
 <xmx:4qrTYxP2NhkvD8oqCpQj0VSWLaALogMAHdOMo-FOJobu0HjT7uRVXg>
 <xmx:4qrTY2l05vHASzSQVoEjirKo2TPehu10wbzuFVWxiNktK3-YK3uwKw>
 <xmx:46rTY49s6bKlQtKMirWASPYlo0AR0XOSuFRskxNtyOIKEfGCYxI4fAAp4oA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 05:43:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 27 Jan 2023 11:40:26 +0100
Subject: [PATCH v2] drm/vc4: hvs: Defer dlist slots deallocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230127-rpi-cursor-corruption-v2-1-1f97bd00df01@cerno.tech>
X-B4-Tracking: v=1; b=H4sIABmq02MC/x2NQQqDMBBFryJZd8SJWm1XvUdxEdOxBjSRiYpFv
 HtHYTbvw5u3q0jsKKpnsium1UUXvIC+Jcr2xn8J3EdY6UznGeoKeHJgF46BwQbmZZrFAPuoO3v
 PHqbFWonbmkjQsvG2F9svwyDjxNS57Yq9G+HexTnw72qveK5n5jzEvMCyTFGXRVEBwmg2N9LLE
 vuQziRfm+M4/mRhy/i+AAAA
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=17813; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=u1BYRlL1IbbO0ArqVQeJR1hxqGwaUZdgflbc8fm5ciU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXVxnq7UpsqT7wxuJF58HqrT2asv0GSt5CbG76M77tjBW6
 Fbmko5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPpL2JkWDJXe7LHDn/5u6V/M5uSNO
 NmWqjuPuW6ae+7nHVrXyUn+zMyHH+WaLS7aMr2Wcd8xcxqWPdEpqttVX974UHZ+VZ9br5obgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
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
Hi,

This series fixes a long standing issue with the VC4 driver when one was
moving the cursor on X11 along the edges of the monitor, if we had
overscan margins enabled.

The details are in the commit log of the last patch, but the main reason
was that moving along the edges with the overscan margins enabled
triggers a full blown commit, as opposed to an async commit. Since that
commit is on the cursor plane, it's treated as a legacy cursor update,
and won't wait for vblank, so it's possible to queue multiple commit
between vblank.

Now, the composition happens in the HVS, and the HVS has a series of
descriptors stored in an internal RAM, one for each plane. Allocations
in that RAM are tied to the CRTC state, and freed when that state is
destroyed. That internal RAM is also used by the HVS to store some
internal context while it's generating a frame.

If we get multiple commits between vblanks, chances are that the RAM
entries used by one of the first commit is going to be freed and reused
by a later commit, which will then overwrite the content of the earlier
entries, erasing the context in the process and corrupting the frame.

We've tested multiple solutions, but the one that seem to work without
any cons is to defer the deallocation of RAM entries to the next vblank
after the CRTC state has been freed.

In the solutions we've considered and tested, removing the legacy cursor
updates entirely has done in:
https://lore.kernel.org/all/20220331152021.2671937-1-daniel.vetter@ffwll.ch/

did indeed improve the situation, but we were still getting some similar
bugs when running Kodi, as reported here:
https://github.com/raspberrypi/linux/pull/5327

That patch makes them go away entirely, and since the legacy cursor
updates are still there after a bit less than a year, I believe we
should merge that patch.

Let me know what you think,
Maxime
---
Changes in v2:
- Rebased against current next
- Fixed a kunit breakage
- Link to v1: https://lore.kernel.org/dri-devel/20220221134155.125447-1-maxime@cerno.tech/
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  10 +-
 drivers/gpu/drm/vc4/vc4_drv.h  |  15 ++-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 208 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 210 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cdc0559221f0..c0e5a343dc37 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1073,14 +1073,8 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
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
index 95069bb16821..db3d5a09c8d5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -336,6 +336,9 @@ struct vc4_hvs {
 	struct drm_mm lbm_mm;
 	spinlock_t mm_lock;
 
+	struct list_head stale_dlist_entries;
+	struct work_struct free_dlist_work;
+
 	struct drm_mm_node mitchell_netravali_filter;
 
 	struct debugfs_regset32 regset;
@@ -614,10 +617,16 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
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
 
@@ -1032,6 +1041,8 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
+void vc4_hvs_mark_dlist_entry_stale(struct vc4_hvs *hvs,
+				    struct vc4_hvs_dlist_allocation *alloc);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4da66ef96783..fea0ec404848 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -257,6 +257,176 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 	vc4_hvs_lut_load(hvs, vc4_crtc);
 }
 
+static void vc4_hvs_irq_enable_eof(const struct vc4_hvs *hvs,
+				   unsigned int channel)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+	u32 irq_mask = vc4->is_vc5 ?
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
+	struct vc4_dev *vc4 = hvs->vc4;
+	u32 irq_mask = vc4->is_vc5 ?
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
+	INIT_LIST_HEAD(&alloc->node);
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
+static void vc4_hvs_free_dlist_entry_locked(struct vc4_hvs *hvs,
+					    struct vc4_hvs_dlist_allocation *alloc)
+{
+	lockdep_assert_held(&hvs->mm_lock);
+
+	if (!list_empty(&alloc->node))
+		list_del(&alloc->node);
+
+	drm_mm_remove_node(&alloc->mm_node);
+	kfree(alloc);
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
+	/*
+	 * Kunit tests run with a mock device and we consider any hardware
+	 * access a test failure. Let's free the dlist allocation right away if
+	 * we're running under kunit, we won't risk a dlist corruption anyway.
+	 */
+	if (kunit_get_current_test()) {
+		spin_lock_irqsave(&hvs->mm_lock, flags);
+		vc4_hvs_free_dlist_entry_locked(hvs, alloc);
+		spin_unlock_irqrestore(&hvs->mm_lock, flags);
+		return;
+	}
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
+		vc4_hvs_free_dlist_entry_locked(hvs, cur);
+	}
+	spin_unlock_irqrestore(&hvs->mm_lock, flags);
+}
+
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
 	struct drm_device *drm = &hvs->vc4->base;
@@ -442,13 +612,12 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
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
@@ -461,12 +630,11 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
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
@@ -482,8 +650,10 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
+	WARN_ON(!vc4_state->mm);
+
 	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-		  vc4_state->mm.start);
+		  vc4_state->mm->mm_node.start);
 
 	drm_dev_exit(idx);
 }
@@ -510,8 +680,10 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
+	WARN_ON(!vc4_state->mm);
+
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
-	vc4_crtc->current_dlist = vc4_state->mm.start;
+	vc4_crtc->current_dlist = vc4_state->mm->mm_node.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
 }
 
@@ -568,8 +740,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
 	bool enable_bg_fill = false;
-	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
-	u32 __iomem *dlist_next = dlist_start;
+	u32 __iomem *dlist_start, *dlist_next;
 	unsigned int zpos = 0;
 	bool found = false;
 	int idx;
@@ -587,6 +758,9 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		vc4_hvs_dump_state(hvs);
 	}
 
+	dlist_start = vc4->hvs->dlist + vc4_state->mm->mm_node.start;
+	dlist_next = dlist_start;
+
 	/* Copy all the active planes' dlist contents to the hardware dlist. */
 	do {
 		found = false;
@@ -620,7 +794,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	writel(SCALER_CTL0_END, dlist_next);
 	dlist_next++;
 
-	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
+	WARN_ON(!vc4_state->mm);
+	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm->mm_node.size);
 
 	if (enable_bg_fill)
 		/* This sets a black background color fill, as is the case
@@ -748,6 +923,11 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 
 			irqret = IRQ_HANDLED;
 		}
+
+		if (status & SCALER_DISPSTAT_EOF(channel)) {
+			vc4_hvs_schedule_dlist_sweep(hvs, channel);
+			irqret = IRQ_HANDLED;
+		}
 	}
 
 	/* Clear every per-channel interrupt flag. */
@@ -794,6 +974,8 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 	hvs->pdev = pdev;
 
 	spin_lock_init(&hvs->mm_lock);
+	INIT_LIST_HEAD(&hvs->stale_dlist_entries);
+	INIT_WORK(&hvs->free_dlist_work, vc4_hvs_dlist_free_work);
 
 	/* Set up the HVS display list memory manager.  We never
 	 * overwrite the setup from the bootloader (just 128b out of

---
base-commit: e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
change-id: 20230127-rpi-cursor-corruption-c98fc609ab18

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>

