Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8982645966
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7010E38E;
	Wed,  7 Dec 2022 11:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EAF10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A874F5C01C2;
 Wed,  7 Dec 2022 06:55:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 06:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414121; x=
 1670500521; bh=baD35foiFpwZCUKzO+BRxuNeos7NPkrjuUtRCB/nYf0=; b=Y
 YEEa2jf7ntEmGlJQ8HtMqp6WK2a3/jxXLVx8jfb9kv+r3QswJoJBPO3mWSD5Udnh
 NUSFyCPsTK+A5mLsn96EMdNlNmk9eiBd/MG+eeSNPlLc/Jlxp3sYkVJP3JZh/17e
 LZ+QYZWac4q1eM7bpC82Pk+zrUg3pK+AaE5729vtTo3Etar4Cox4d9b+ikHkjnQg
 PkPAM6IW368mZx3Qs+OalDi8qL7lMkW6e/xgN2CxfSihrHLmWeXqqWqJlb+B+VIp
 8656+L2UJy9PIqm9im53jGdc4LSnU1bO7t7vJfNBAB9X5vBdodJnkpJ7Jkp3QyTK
 LSKTLQ7K1+c0DbHm0/xxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414121; x=
 1670500521; bh=baD35foiFpwZCUKzO+BRxuNeos7NPkrjuUtRCB/nYf0=; b=g
 82id9ruI5uJ1rAya7gVjByPAxdrMG+PzEnvty32CmvPgw+qEwQF7LoqGBB1aCfci
 dnJNyKzRw6ef8BMvRlJBEFZonwMfvVjQFkwvh+ed8lAhPaXXuGBQtLT9h6iwt5+t
 WboQ6bNvTQXqIpnL+Vx9koIH1MiS5K/LHZ1j7XpZc6WWrParYV92Sm//GoESkO8l
 tBKUqPr3Qcp71wKLL3dtYjdxazkjGIlZ2fUtOiVwXQouYotjf54kRCqMo0s4I/m4
 w4wDP91DOwXOIxhaWAni9ubcAa430TpyDlwePjl/ysRJ+tBHKLXu3RZWWvxZ7zjr
 NFARRWze0ArzfKw6YHgbA==
X-ME-Sender: <xms:KX-QY8x3Zv6OOVfWYolGI7QltYPDvWx2MXzDfMsSHGLYlJd27IJo0g>
 <xme:KX-QYwRmSAG_ky-Igi0yNVVhAvbnz8E7u1yJZb03OHtDmD5HY3_eDTeKD3TlSxqwg
 UHDgi8gsJtF00y-Rgg>
X-ME-Received: <xmr:KX-QY-VfixIiRUpQgMRiWWgMt0aIBHHT_8b5HTblQf-kVLvTs-ZVAXB4LeSJwsjRm25bZGqov6cQiNzAI6LYEcQs3NZtDZvAD8qMTH7DmWiYRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KX-QY6j-fl8Q7wewD3SYFm_EI-1fn2jJ9Ei05lDoWmhfwIz9h8bsqw>
 <xmx:KX-QY-AhAXG-18lcCwEUa_9i_-tnlhj1s1cg5SYDAsgB9DLE5QZ9kg>
 <xmx:KX-QY7JIUR2hXaPFxK3SMYj7CKAPwUm5uZuqs2GfBiFQ5Nzz46v5MA>
 <xmx:KX-QY271DGErMqjR5comiqBL0AYuLBPBxwYdunAnlda8i7a8asbc0Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:16 +0100
Subject: [PATCH 05/15] drm/vc4: hvs: Support zpos on all planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-5-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=5206; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=4CV2+PCYIvO5q3yVEDVtoCz7WaQzAp4zgRv5gDx5kMo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lZwCpbdUbyYvfhZg/zaUxuUN3xft/HKny+nrqXOiilz
 YGHv7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEbr9iZHj9rknw89GAD3Iv52vX3O
 F95dkZ0yZ3TOXDPTX74/3/2QMZGXabuPTop4WqfuR4GCBSvtdy8ZLEnIlvxHRutdz6q7lvIh8A
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Adds the zpos property to all planes, and creates the dlist
by placing the fragments in the correct order based on zpos.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 43 +++++++++++++++++++++++++++--------------
 drivers/gpu/drm/vc4/vc4_kms.c   |  1 +
 drivers/gpu/drm/vc4/vc4_plane.c | 22 ++++++++++++++++++---
 3 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index d9fc0d03023b..3582ede1a0aa 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -570,6 +570,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool enable_bg_fill = false;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
+	unsigned int zpos = 0;
+	bool found = false;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx)) {
@@ -583,23 +585,34 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	}
 
 	/* Copy all the active planes' dlist contents to the hardware dlist. */
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		/* Is this the first active plane? */
-		if (dlist_next == dlist_start) {
-			/* We need to enable background fill when a plane
-			 * could be alpha blending from the background, i.e.
-			 * where no other plane is underneath. It suffices to
-			 * consider the first active plane here since we set
-			 * needs_bg_fill such that either the first plane
-			 * already needs it or all planes on top blend from
-			 * the first or a lower plane.
-			 */
-			vc4_plane_state = to_vc4_plane_state(plane->state);
-			enable_bg_fill = vc4_plane_state->needs_bg_fill;
+	do {
+		found = false;
+
+		drm_atomic_crtc_for_each_plane(plane, crtc) {
+			if (plane->state->normalized_zpos != zpos)
+				continue;
+
+			/* Is this the first active plane? */
+			if (dlist_next == dlist_start) {
+				/* We need to enable background fill when a plane
+				 * could be alpha blending from the background, i.e.
+				 * where no other plane is underneath. It suffices to
+				 * consider the first active plane here since we set
+				 * needs_bg_fill such that either the first plane
+				 * already needs it or all planes on top blend from
+				 * the first or a lower plane.
+				 */
+				vc4_plane_state = to_vc4_plane_state(plane->state);
+				enable_bg_fill = vc4_plane_state->needs_bg_fill;
+			}
+
+			dlist_next += vc4_plane_write_dlist(plane, dlist_next);
+
+			found = true;
 		}
 
-		dlist_next += vc4_plane_write_dlist(plane, dlist_next);
-	}
+		zpos++;
+	} while (found);
 
 	writel(SCALER_CTL0_END, dlist_next);
 	dlist_next++;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 7282545c54a1..44deee666032 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -1093,6 +1093,7 @@ int vc4_kms_load(struct drm_device *dev)
 	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
+	dev->mode_config.normalize_zpos = true;
 
 	ret = vc4_ctm_obj_init(vc4);
 	if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 8b92a45a3c89..c212f8c10388 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1568,9 +1568,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_create_zpos_immutable_property(plane, 0);
+
 	return plane;
 }
 
+#define VC4_NUM_OVERLAY_PLANES	16
+
 int vc4_plane_create_additional_planes(struct drm_device *drm)
 {
 	struct drm_plane *cursor_plane;
@@ -1586,24 +1591,35 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 * modest number of planes to expose, that should hopefully
 	 * still cover any sane usecase.
 	 */
-	for (i = 0; i < 16; i++) {
+	for (i = 0; i < VC4_NUM_OVERLAY_PLANES; i++) {
 		struct drm_plane *plane =
 			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY,
 				       GENMASK(drm->mode_config.num_crtc - 1, 0));
 
 		if (IS_ERR(plane))
 			continue;
+
+		/* Create zpos property. Max of all the overlays + 1 primary +
+		 * 1 cursor plane on a crtc.
+		 */
+		drm_plane_create_zpos_property(plane, i + 1, 1,
+					       VC4_NUM_OVERLAY_PLANES + 1);
 	}
 
 	drm_for_each_crtc(crtc, drm) {
 		/* Set up the legacy cursor after overlay initialization,
-		 * since we overlay planes on the CRTC in the order they were
-		 * initialized.
+		 * since the zpos fallback is that planes are rendered by plane
+		 * ID order, and that then puts the cursor on top.
 		 */
 		cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR,
 					      drm_crtc_mask(crtc));
 		if (!IS_ERR(cursor_plane)) {
 			crtc->cursor = cursor_plane;
+
+			drm_plane_create_zpos_property(cursor_plane,
+						       VC4_NUM_OVERLAY_PLANES + 1,
+						       1,
+						       VC4_NUM_OVERLAY_PLANES + 1);
 		}
 	}
 

-- 
2.38.1
