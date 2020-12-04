Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FA2D0C38
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4038089F5F;
	Mon,  7 Dec 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9C46E196
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:11:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E8D3558016D;
 Fri,  4 Dec 2020 10:11:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Dec 2020 10:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PX7X2Z6taOpqK
 t6iQGcnzgqz2zwAc/S2uGxRr/4zIcM=; b=qYt31ghTHx33E6P/uA8mUw5WmmuQO
 a9sLZCZGCnFbYk0JHeukUdw6uSxGOc+7NMrmX9YaccM5uX23vJVHYw9DhGfei1bq
 8LraUUpq9UJAQR50h3/vOJB6ZkrRx/oVugDQUUhe/u3OwQHTYsvyd9o+JIXti/rq
 RJG2dB7sFnte4yJzP8PXzathj93+Md7UPWXMb2XSWiN4m6Xamkot+w/6Ta4GBcRx
 Y6KFhYtUpaw8ZQ004xsCoODTJc0tyXwLtZEKC+/aqUxjprZBk0EotFaYZd1jnG0c
 zmcRILsUF1rbWhT95UVm93S2XlINfNGwUXMiEpaAJRUhhNwnUEd/OKaKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PX7X2Z6taOpqKt6iQGcnzgqz2zwAc/S2uGxRr/4zIcM=; b=RHrtIz5c
 KuUfPdOzPQxx5GBg4WPByg6o9X9d/IcZN/Kn2MYl5pRkYn0g8DTx0xsUF1VWfzPJ
 48hCrAC/Sr/X2+peAW3VqcJTFQWMs6JIva8U/Kx/2t7bMWyF6fk3vpwi3GJqFXzG
 0VWX1t+r9zUbnvcJVb29QvkMV0j+q5D/M7PxjNysv9aiPoey0tNMugIbeiWEoH/O
 PzI7GS2qDySevNUmuoOATdZWsI4r8MXsmQtKq921oUXcea3z03iCeJeK0N0Fo6FS
 Pl/USbDgDbNUGl6ZWZl5C0GOsH5MlzlrFEaoywCObT5Y4+UOjLub66lbSDAZLEBm
 3XSHmTDMtlErEw==
X-ME-Sender: <xms:tVHKX1AiRxtdYVmw8qfQnR42XczQGLtO8BPL5F--p6Fyr9JjDTU2SQ>
 <xme:tVHKXyeBCBy0uooN4iLp_PgjN7Tp_PD3TcTzR5hkWjiYObIMfNsKz9yyQGm16WtrR
 B-8jQ7eQZwVChgdaAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tVHKX8p6RqkHrkuqBHPILJ-PqgVJeMF-99TlS0V0bCbP11mVeKmHbQ>
 <xmx:tVHKXzQ0bySGEXH85I7qCXz84rhSGAXEIVJKW-vi6_iETAJR4Tj-Gg>
 <xmx:tVHKX8XBwfofIXKsdI0zaUZ2xzkCQD-leIzm_GQ4U8ENO1BW6NC8hg>
 <xmx:tVHKX8d2aMqdk6xNyAtfUiDkrg6pGqS3CxGRcdCC3wS2ZYP9PD2N1A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9197E24005A;
 Fri,  4 Dec 2020 10:11:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 6/7] drm/vc4: kms: Remove async modeset semaphore
Date: Fri,  4 Dec 2020 16:11:37 +0100
Message-Id: <20201204151138.1739736-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204151138.1739736-1-maxime@cerno.tech>
References: <20201204151138.1739736-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have proper ordering guaranteed by the previous patch, the
semaphore is redundant and can be removed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 13 -------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 --
 drivers/gpu/drm/vc4/vc4_kms.c  | 24 ++----------------------
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 482219fb4db2..c469594a2d3a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -690,7 +690,6 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 		container_of(cb, struct vc4_async_flip_state, cb);
 	struct drm_crtc *crtc = flip_state->crtc;
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = crtc->primary;
 
 	vc4_plane_async_set_fb(plane, flip_state->fb);
@@ -722,8 +721,6 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 	}
 
 	kfree(flip_state);
-
-	up(&vc4->async_modeset);
 }
 
 /* Implements async (non-vblank-synced) page flips.
@@ -738,7 +735,6 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 			       uint32_t flags)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = crtc->primary;
 	int ret = 0;
 	struct vc4_async_flip_state *flip_state;
@@ -767,15 +763,6 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	flip_state->crtc = crtc;
 	flip_state->event = event;
 
-	/* Make sure all other async modesetes have landed. */
-	ret = down_interruptible(&vc4->async_modeset);
-	if (ret) {
-		drm_framebuffer_put(fb);
-		vc4_bo_dec_usecnt(bo);
-		kfree(flip_state);
-		return ret;
-	}
-
 	/* Save the current FB before it's replaced by the new one in
 	 * drm_atomic_set_fb_for_plane(). We'll need the old FB in
 	 * vc4_async_page_flip_complete() to decrement the BO usecnt and keep
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c5f2944d5bc6..4dcef3140dff 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -215,8 +215,6 @@ struct vc4_dev {
 		struct work_struct reset_work;
 	} hangcheck;
 
-	struct semaphore async_modeset;
-
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
 	struct drm_private_obj hvs_channels;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index fa40c44eb770..ffbfdde55fff 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -418,8 +418,6 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 		clk_set_min_rate(hvs->core_clk, 0);
 
 	drm_atomic_state_put(state);
-
-	up(&vc4->async_modeset);
 }
 
 static void commit_work(struct work_struct *work)
@@ -477,26 +475,17 @@ static int vc4_atomic_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
 	if (state->async_update) {
-		ret = down_interruptible(&vc4->async_modeset);
-		if (ret)
-			return ret;
-
 		ret = drm_atomic_helper_prepare_planes(dev, state);
-		if (ret) {
-			up(&vc4->async_modeset);
+		if (ret)
 			return ret;
-		}
 
 		drm_atomic_helper_async_commit(dev, state);
 
 		drm_atomic_helper_cleanup_planes(dev, state);
 
-		up(&vc4->async_modeset);
-
 		return 0;
 	}
 
@@ -512,21 +501,14 @@ static int vc4_atomic_commit(struct drm_device *dev,
 
 	INIT_WORK(&state->commit_work, commit_work);
 
-	ret = down_interruptible(&vc4->async_modeset);
-	if (ret)
-		return ret;
-
 	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret) {
-		up(&vc4->async_modeset);
+	if (ret)
 		return ret;
-	}
 
 	if (!nonblock) {
 		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
 		if (ret) {
 			drm_atomic_helper_cleanup_planes(dev, state);
-			up(&vc4->async_modeset);
 			return ret;
 		}
 	}
@@ -1008,8 +990,6 @@ int vc4_kms_load(struct drm_device *dev)
 		vc4->load_tracker_enabled = true;
 	}
 
-	sema_init(&vc4->async_modeset, 1);
-
 	/* Set support for vblank irq fast disable, before drm_vblank_init() */
 	dev->vblank_disable_immediate = true;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
