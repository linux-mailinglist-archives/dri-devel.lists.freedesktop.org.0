Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B402B3AED
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851D889D2E;
	Mon, 16 Nov 2020 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178656E544
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 827C858032A;
 Fri, 13 Nov 2020 10:32:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LsuWTxJ7U9x4P
 hgEymZ4YeNrqSn3LIwuw+1S4H82KmU=; b=FeZqo58NESPCYhtqN4i13vsP9JZwh
 iIqjWVAx2fGqeZAmOtme+Uv8S6dqxlzOS+Bhc3bxJ6gWv1yxM8l3BulrlSbuCmFB
 yt55vvTyRU0BvjPlBpiVadoT2VH1v0PjdwZOAcaZtQGIqthFSHENVYXmq09V8vG1
 8F81CDF9jJ+n9rSe3aqyFklwi355ZIcE8nbLd53FqzN+OmLZwXeZNhLuODyOKsm/
 NWrwUydSGLTEgoy/CfyEs6+VmgXI/VG7LFwnPKnRd6FieQtR0kAfqApOoMhFcoen
 NZgDvI8x+Rq05S1VppfWWnrHQ3q2wAUsuBNPi6djDFjmXpS796jXrkHFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LsuWTxJ7U9x4PhgEymZ4YeNrqSn3LIwuw+1S4H82KmU=; b=b97p9uE4
 qEkIehQYtbfUPzvOXGBWibakickX3RDRU6olukL5N7WAmsOXop9NauxlrhiiD47L
 1vIH4BdMD+68QPAMt0svvZskvecOa8wQvVgrN0xuHa9RFdjqUrBB1BM6JOfSf9+Z
 aQEzEfsW3AXqER7n9xn3PJcCpFvdeZhy3Qu7nQ0HcWbnZAvC2trmRHdPaGnvmPs8
 FLSQSHF6qwJ+aqXSNdqjcENUkfg5Ln4duOZlmCHwZVR2EqG6XMtaZiJTzZjnzL8p
 wNqjIcWYHIM/hasiGw/xYFZwdACG2Lu2wvN91zZWpxoz2v9ztv5Sze6mVH+0Aq6u
 jrQbRpSV37H22Q==
X-ME-Sender: <xms:C6euX4Wp1MA392n8nO0uLgEMOJi64tCWE_r0s0i24qO5UeyLz8xE0w>
 <xme:C6euX8nHaw9aZMeNWip38HU2c5mh6cb7YxtczKtCoz6udtNpLI2v3SbAAAzvz5SSm
 hNgZCEnRNi4rd3ofZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C6euX8b-DtmPo5wN19yoUsX08hhiFtukYGmLCO98Wh-GDQyf3qxo8A>
 <xmx:C6euX3XKs7teeBdwpvXgEGnaYJYyicJpDKK3iUwZqNJfVXSnAtvOyg>
 <xmx:C6euXykWksl8Cp2VqNfB_HOd_VEcmjXVrIfHOUvyCxlIWUhMPrIO3w>
 <xmx:C6euX39cDQ8o15Xc1WyqvdCDoHxNcjjtCmulSJKCZ6-x5nuI4mhn5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 044963064AB3;
 Fri, 13 Nov 2020 10:32:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 8/8] drm/vc4: kms: Convert to atomic helpers
Date: Fri, 13 Nov 2020 16:29:56 +0100
Message-Id: <20201113152956.139663-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113152956.139663-1-maxime@cerno.tech>
References: <20201113152956.139663-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

Now that the semaphore is gone, our atomic_commit implementation is
basically drm_atomic_helper_commit with a somewhat custom commit_tail,
the main difference being that we're using wait_for_flip_done instead of
wait_for_vblanks used in the drm_atomic_helper_commit_tail helper.

Let's switch to using drm_atomic_helper_commit.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 112 +---------------------------------
 1 file changed, 3 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 79ab7b8a5e0e..ede5d2b6ac65 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -333,8 +333,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	}
 }
 
-static void
-vc4_atomic_complete_commit(struct drm_atomic_state *state)
+static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -357,10 +356,6 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	if (vc4->hvs->hvs5)
 		clk_set_min_rate(hvs->core_clk, 500000000);
 
-	drm_atomic_helper_wait_for_fences(dev, state, false);
-
-	drm_atomic_helper_wait_for_dependencies(state);
-
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
 	if (!old_hvs_state)
 		return;
@@ -408,20 +403,8 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
-	drm_atomic_helper_commit_cleanup_done(state);
-
 	if (vc4->hvs->hvs5)
 		clk_set_min_rate(hvs->core_clk, 0);
-
-	drm_atomic_state_put(state);
-}
-
-static void commit_work(struct work_struct *work)
-{
-	struct drm_atomic_state *state = container_of(work,
-						      struct drm_atomic_state,
-						      commit_work);
-	vc4_atomic_complete_commit(state);
 }
 
 static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
@@ -454,96 +437,6 @@ static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
 	return 0;
 }
 
-/**
- * vc4_atomic_commit - commit validated state object
- * @dev: DRM device
- * @state: the driver state object
- * @nonblock: nonblocking commit
- *
- * This function commits a with drm_atomic_helper_check() pre-validated state
- * object. This can still fail when e.g. the framebuffer reservation fails. For
- * now this doesn't implement asynchronous commits.
- *
- * RETURNS
- * Zero for success or -errno.
- */
-static int vc4_atomic_commit(struct drm_device *dev,
-			     struct drm_atomic_state *state,
-			     bool nonblock)
-{
-	int ret;
-
-	if (state->async_update) {
-		ret = drm_atomic_helper_prepare_planes(dev, state);
-		if (ret) {
-			up(&vc4->async_modeset);
-			return ret;
-		}
-
-		drm_atomic_helper_async_commit(dev, state);
-
-		drm_atomic_helper_cleanup_planes(dev, state);
-
-		return 0;
-	}
-
-	/* We know for sure we don't want an async update here. Set
-	 * state->legacy_cursor_update to false to prevent
-	 * drm_atomic_helper_setup_commit() from auto-completing
-	 * commit->flip_done.
-	 */
-	state->legacy_cursor_update = false;
-	ret = drm_atomic_helper_setup_commit(state, nonblock);
-	if (ret)
-		return ret;
-
-	INIT_WORK(&state->commit_work, commit_work);
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	if (!nonblock) {
-		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
-		if (ret) {
-			drm_atomic_helper_cleanup_planes(dev, state);
-			return ret;
-		}
-	}
-
-	/*
-	 * This is the point of no return - everything below never fails except
-	 * when the hw goes bonghits. Which means we can commit the new state on
-	 * the software side now.
-	 */
-
-	BUG_ON(drm_atomic_helper_swap_state(state, false) < 0);
-
-	/*
-	 * Everything below can be run asynchronously without the need to grab
-	 * any modeset locks at all under one condition: It must be guaranteed
-	 * that the asynchronous work has either been cancelled (if the driver
-	 * supports it, which at least requires that the framebuffers get
-	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
-	 * before the new state gets committed on the software side with
-	 * drm_atomic_helper_swap_state().
-	 *
-	 * This scheme allows new atomic state updates to be prepared and
-	 * checked in parallel to the asynchronous completion of the previous
-	 * update. Which is important since compositors need to figure out the
-	 * composition of the next frame right after having submitted the
-	 * current layout.
-	 */
-
-	drm_atomic_state_get(state);
-	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
-	else
-		vc4_atomic_complete_commit(state);
-
-	return 0;
-}
-
 static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 					     struct drm_file *file_priv,
 					     const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -966,11 +859,12 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 
 static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
 	.atomic_commit_setup	= vc4_atomic_commit_setup,
+	.atomic_commit_tail	= vc4_atomic_commit_tail,
 };
 
 static const struct drm_mode_config_funcs vc4_mode_funcs = {
 	.atomic_check = vc4_atomic_check,
-	.atomic_commit = vc4_atomic_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 	.fb_create = vc4_fb_create,
 };
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
