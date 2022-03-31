Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72D4EDA34
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 15:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563F10F1CC;
	Thu, 31 Mar 2022 13:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25C10F1C0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:05:53 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 87D565C00C1;
 Thu, 31 Mar 2022 09:05:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 31 Mar 2022 09:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=ZlTXjsQYc/H1RIytcKpl4fBrYGZmJJaxzsH5gG
 6o/GE=; b=CBGBJB2RoPdp35BPaMgmGDh8M4uwMWt+Rde+1ZeQxUsQDQHWpE+vAb
 NQI3VztX7gmzDOhotHj6TFYxQUhu7wNixvFOgdJ0SxqC63heWHJUtn/F5CEzY1G6
 plvfE5pMq0Os+eAa+xaSU65FJjcLgtPs9SenM71EMMVAoarvfxD/enXfihdbm7Bo
 zdJFxUZWDCRUiJawGw5qRgTG5pzKgGPiQ8bR0IoIKeY40anh+NKO780Z5evEZ/2/
 r2FOMzYnNseFQU/6nhrWHqsKk2lereG/Jku6M3xMx5ZZ2L7ReNoWwtcATQKEcALv
 k6huZmJ4KJFXwoMw9CTYkbcP7UcLc/jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZlTXjs
 QYc/H1RIytcKpl4fBrYGZmJJaxzsH5gG6o/GE=; b=Y28aluULydjQbizhaH1dFs
 RAdewXYzpOChxDGxYzqO1DhuLLqp6mpZKGubT9RbWIsOQeKywNiqGaneIS5wp+1c
 PY8I1u4RIN1FiCuJO+ccajshgpTlVP6di4KKllW+PkZ3dpzhFzzA0XdYFvIcV0Bw
 zPfVW4/vHTnub8Tv0goc+/rzJhXNwiEFFMn7gZQUDHABlZrxwYxQEk4+T+y80Ypg
 nj+usmjJUiY0DqDgVQY6mj38iYFmhDDDt8p5AHe7HU9D2zwwYl4J4OwMnszDYDf0
 Wc1vSuGaMR+qqRp0ztHnSdWzM5Ns7hphrA99S2luYi15dTAaLGWKIL2CFv4OHejw
 ==
X-ME-Sender: <xms:LadFYuc0HjYxJ_IaRETPfO4qtFTyFZduhQPhvMCXGxwpVMcw8STuVQ>
 <xme:LadFYoMsTo1K3hfYw92IfKFOTpv_FLZ2PPYWo1mefnwtaejaimV_ezSKfYEGlgiiz
 1R51J9xEQiTQ4S3K-w>
X-ME-Received: <xmr:LadFYvj9agDw7zBbHbdwaJCqnYFuDsDj90CwiwNfhwwZcB1v2embtzZXFojD3lSluIYYIVd1NlaIK5MaJBkVjC5Ep_kh6NYR5sXRiSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuleejkeehuedtjedvlefhudejtdekhedtieeitedvuefhtdelheetvefggeej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LadFYr9ePsOUW39EmLNzYT2Zq1GdtS-eddHLxPvSvnJYFGjwRvaJWw>
 <xmx:LadFYqu1BWHHsccZq8T8A2yqtBdi79FCL03TelZIo0ohjmVKWNWKCw>
 <xmx:LadFYiGYMLUqMvXSNcUvNK0riheReS9Kkcfe6hBBaykwpTz8vN9RDQ>
 <xmx:LqdFYiH1EPD8k0CeDwnMCBH-pHn2qeDhcFyaWgl_iO0FSQB-xwMnew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 09:05:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/atomic-helpers: remove legacy_cursor_update hacks
Date: Thu, 31 Mar 2022 15:05:45 +0200
Message-Id: <20220331130545.625721-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

The stuff never really worked, and leads to lots of fun because it
out-of-order frees atomic states. Which upsets KASAN, among other
things.

For async updates we now have a more solid solution with the
->atomic_async_check and ->atomic_async_commit hooks. Support for that
for msm and vc4 landed. nouveau and i915 have their own commit
routines, doing something similar.

For everyone else it's probably better to remove the use-after-free
bug, and encourage folks to use the async support instead. The
affected drivers which register a legacy cursor plane and don't either
use the new async stuff or their own commit routine are: amdgpu,
atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.

Inspired by an amdgpu bug report.

v2: Drop RFC, I think with amdgpu converted over to use
atomic_async_check/commit done in

commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Wed Dec 5 14:59:07 2018 -0500

    drm/amd/display: Add fast path for cursor plane updates

we don't have any driver anymore where we have userspace expecting
solid legacy cursor support _and_ they are using the atomic helpers in
their fully glory. So we can retire this.

v3: Paper over msm and i915 regression. The complete_all is the only
thing missing afaict.

v4: Rebased on recent kernel, added extra link for vc4 bug.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=199425
Link: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
Cc: mikita.lipski@amd.com
Cc: Michel Dänzer <michel@daenzer.net>
Cc: harry.wentland@amd.com
Cc: Rob Clark <robdclark@gmail.com>
Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Tested-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..a2899af82b4a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
-	 /*
-	  * Legacy cursor ioctls are completely unsynced, and userspace
-	  * relies on that (by doing tons of cursor updates).
-	  */
-	if (old_state->legacy_cursor_update)
-		return;
-
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
@@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 			continue;
 		}
 
-		/* Legacy cursor updates are fully unsynced. */
-		if (state->legacy_cursor_update) {
-			complete_all(&commit->flip_done);
-			continue;
-		}
-
 		if (!new_crtc_state->event) {
 			commit->event = kzalloc(sizeof(*commit->event),
 						GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bf7ce684dd8e..bde32f5a33cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8855,6 +8855,19 @@ static int intel_atomic_commit(struct drm_device *dev,
 				state->base.legacy_cursor_update = false;
 	}
 
+	/*
+	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
+	 * everything.
+	 */
+	if (state->base.legacy_cursor_update) {
+		struct intel_crtc_state *new_crtc_state;
+		struct intel_crtc *crtc;
+		int i;
+
+		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+			complete_all(&new_crtc_state->uapi.commit->flip_done);
+	}
+
 	ret = intel_atomic_prepare_commit(state);
 	if (ret) {
 		drm_dbg_atomic(&dev_priv->drm,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 27c9ae563f2f..6ed14fafa40c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -237,6 +237,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		/* async updates are limited to single-crtc updates: */
 		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
 
+		complete_all(&async_crtc->state->commit->flip_done);
+
 		/*
 		 * Start timer if we don't already have an update pending
 		 * on this crtc:
-- 
2.35.1

