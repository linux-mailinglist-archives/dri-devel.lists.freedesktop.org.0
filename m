Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCFE2D0C36
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2B589DA2;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58396E196
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:11:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3DAE758016F;
 Fri,  4 Dec 2020 10:11:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Dec 2020 10:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=KIbGMqANMpUGy
 omEfr64e+hVoWsMUljgRPHO1eQw31c=; b=HXtXLcZ+6VwMCqTbSTcMlCzbM8Sc8
 tjtpM0ZcCzY8m29068d7tZCiIl9UB49XlkLiUWZBteHzdYOVXNQGutal3JPVKO9S
 fUYoDelFc1FC597m9Y3V2qXeOfVGw6LWq3eYH4NGAMemehv10stUC/Aw6OVblkMT
 jVHnbRv73kMn2yEj+wpMNzcrIrfy/550/vZmPYypFwcCJEJSvCeDCKf/DVCUmXF7
 Nsp4Gln+BvrSL/hXVuCieKo0BpmWGbU4G1rJDyc/CDhn9J8Al8sbh3e3MwJwGar6
 tfeae+yveXXUW3b7S/n+8kjFP18H90Rpu0lWrKwsYs4MOyjftKH3BtdNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KIbGMqANMpUGyomEfr64e+hVoWsMUljgRPHO1eQw31c=; b=pJStvFHa
 1K9/htmo3an9h4VDd/6UjfLG4Jw6iLj/ocJEMBlkBeS1O+QbCNJ/eJqmvpysZbnG
 2sP/GRJJg7yJrowM+x/1kvMYVaR1hx7x2O10Y8OBpN6wVc6b42doSe20E0KeNZUo
 TRm6E4udrEuTeNdkUmDmnxN0ncEOfGyVUssmzL49EbW1Mhr0U3WRQOE5/CW2CM0F
 eqSNLZlJZOlkiVs8pMi63qM8WYnpekPbdP6oms2QVQyU2tJSvShCDE/eUR1RQSmg
 D3CBMWAyuqdW23NJwSFOrtYNDzxzhKCtoGMkjiLTgH9+th8mjDadsGU3B2wXo7cw
 ZrvMUuqd1vAojQ==
X-ME-Sender: <xms:t1HKX5kq7gi3JoOOcgUxyyCp60I17S-ZoeEUH20sw0-3ZAptsthCig>
 <xme:t1HKX-ccBTcjPlRGA-nZU--QxlX1OrWInVY86ySukap6EHQ6hxnDQHItRssk7h35t
 sqHlJ_YJ6-qZ8-15w8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeikedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:t1HKXzFAfigrVLyc8iDKBcW9xaUSNK5eBrD_zAOehLSPAhxD-8k50A>
 <xmx:t1HKXwc7ocQpc7owF7dsm9S285_TUkO9UDcjH1G8rBVE8t7PuXzRYg>
 <xmx:t1HKXy_K-ArtWlswwLfTDnSEL-YK9KeVh6w3HhD3WUSs3dlW8rHKAg>
 <xmx:t1HKXxCy6jazxVzczuStCXXcdGSe5xF-JHrIxzo-k6zhYLRxE1uYTw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF58E24005C;
 Fri,  4 Dec 2020 10:11:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 7/7] drm/vc4: kms: Convert to atomic helpers
Date: Fri,  4 Dec 2020 16:11:38 +0100
Message-Id: <20201204151138.1739736-8-maxime@cerno.tech>
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

Now that the semaphore is gone, our atomic_commit implementation is
basically drm_atomic_helper_commit with a somewhat custom commit_tail,
the main difference being that we're using wait_for_flip_done instead of
wait_for_vblanks used in the drm_atomic_helper_commit_tail helper.

Let's switch to using drm_atomic_helper_commit.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 110 +---------------------------------
 1 file changed, 3 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ffbfdde55fff..05f451f3e642 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -332,8 +332,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
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
@@ -412,20 +407,8 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 
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
@@ -458,94 +441,6 @@ static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
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
-		if (ret)
-			return ret;
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
@@ -966,11 +861,12 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 
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
