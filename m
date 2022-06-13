Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAA5485C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6834C10E804;
	Mon, 13 Jun 2022 14:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F19E10E804
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0094A3200931;
 Mon, 13 Jun 2022 10:48:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131696; x=1655218096; bh=Qk
 wICmGwaWR+7wjxirm3F3E7gVtYR6OKDZ+E/kOBMYM=; b=k5EilDOKYfJvZ+a4qL
 qUwtd2E3recK8Hez2aW6x7n6sOuyhjICSVsTUsBPnATIEa+LaWQZAG1GMj8wQ73l
 ZxDOiFJwlk1GOB7vH3uMOmdm6so+FxmFBr41oX7QK1n+bC5LRp2mbkvMWpisZkHP
 jYEM3vcHkjttbTBMwkO3nKtd+12Uh29inJIXwuS4tjZimmDLb6AL5wT6GHr9r4wu
 dlVtILx5WGwLjwn5jXxg177j7NJs3cUztJt2ZCVKt0H4jfKjgobTcGzvbue6imqF
 x5W32iqxl2rsXX6mYrQ3o4I5f97iatkenW6gz09WVR3OtI3DxTaVbb0TmLyn0a1i
 iWPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131696; x=1655218096; bh=QkwICmGwaWR+7
 wjxirm3F3E7gVtYR6OKDZ+E/kOBMYM=; b=GypszQe0Ftd3j6/m0saFHelewMRhF
 p4iOG9E084LKJvd0Whe1HQxh2oSYPMC29qIzTiNIazCrfuV1wwnoXLqP2lhN0Tb6
 6JAEjaLlyDKnZo5T9WE6xrzUp6GYLoawFfZZGosxqsl+CwHY/5vbdts0gfJShJ8X
 ScQl0s2kDjJCUslIZel9pijBOQmN6IB3dTThuxLzv371NtEf70Zpg0AqgLM9xaw6
 Y0R5R5N95n/PH2iuCszqZCSPD07Q5MFpvXQ6IhvQDFNWOSjI+yx0/d86zattfdfs
 mj2HUzBeZdmJSMK1ADKJgvkEcGdnesl5JAlkscuHbHpfiGuXaKdgNxEyg==
X-ME-Sender: <xms:ME6nYo5AYsoEwXsqkaxKwbZhM8bUQd7tqJksMGbWratq0KihtyWZ_A>
 <xme:ME6nYp4ss2DtOyBLsn9JEcHyrtodMUFRFd-_KxN_wH-ppZU1YB5DQ-wf8TE8QKq5Y
 GBkbNXVB7fJxGgLIX0>
X-ME-Received: <xmr:ME6nYndLaEO2S-6H-fAxX5vX61qGtuz2bbBLCrCPXlduZfy01MafN96De4dTaUjwRgKtXu5aJgA0MVONqPGO8o4bTNPBwyxOGteo2VI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ME6nYtJ3zG-uscFPg4a0e3eLhv-RTlXgA0QpjHmXsQdFjT7k1oqhfw>
 <xmx:ME6nYsJ0kRtEQKgTMCZmJ3VUUrtt843rgMXUW_xJeDylZ9-PPWKKyw>
 <xmx:ME6nYuyek8vZ5ZOCcfofZ6QvCgWv-HjEC3MOMFmF7kChKKnZOP4Hcw>
 <xmx:ME6nYmgABafU0O4uxQk4ODJ2rfuNvWnw7eDK8zDJ3sP5xlJNAHYy3w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/33] drm/vc4: plane: Remove subpixel positioning check
Date: Mon, 13 Jun 2022 16:47:31 +0200
Message-Id: <20220613144800.326124-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

There is little harm in ignoring fractional coordinates
(they just get truncated).

Without this:
modetest -M vc4 -F tiles,gradient -s 32:1920x1080-60 -P89@74:1920x1080*.1.1@XR24

is rejected. We have the same issue in Kodi when trying to
use zoom options on video.

Note: even if all coordinates are fully integer. e.g.
src:[0,0,1920,1080] dest:[-10,-10,1940,1100]

it will still get rejected as drm_atomic_helper_check_plane_state
uses drm_rect_clip_scaled which transforms this to fractional src coords

Fixes: 21af94cf1a4c ("drm/vc4: Add support for scaling of display planes.")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b3438f4a81ce..650c652281e8 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -339,7 +339,6 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_cma_object *bo = drm_fb_cma_get_gem_obj(fb, 0);
-	u32 subpixel_src_mask = (1 << 16) - 1;
 	int num_planes = fb->format->num_planes;
 	struct drm_crtc_state *crtc_state;
 	u32 h_subsample = fb->format->hsub;
@@ -361,18 +360,15 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 	for (i = 0; i < num_planes; i++)
 		vc4_state->offsets[i] = bo->paddr + fb->offsets[i];
 
-	/* We don't support subpixel source positioning for scaling. */
-	if ((state->src.x1 & subpixel_src_mask) ||
-	    (state->src.x2 & subpixel_src_mask) ||
-	    (state->src.y1 & subpixel_src_mask) ||
-	    (state->src.y2 & subpixel_src_mask)) {
-		return -EINVAL;
-	}
-
-	vc4_state->src_x = state->src.x1 >> 16;
-	vc4_state->src_y = state->src.y1 >> 16;
-	vc4_state->src_w[0] = (state->src.x2 - state->src.x1) >> 16;
-	vc4_state->src_h[0] = (state->src.y2 - state->src.y1) >> 16;
+	/*
+	 * We don't support subpixel source positioning for scaling,
+	 * but fractional coordinates can be generated by clipping
+	 * so just round for now
+	 */
+	vc4_state->src_x = DIV_ROUND_CLOSEST(state->src.x1, 1 << 16);
+	vc4_state->src_y = DIV_ROUND_CLOSEST(state->src.y1, 1 << 16);
+	vc4_state->src_w[0] = DIV_ROUND_CLOSEST(state->src.x2, 1 << 16) - vc4_state->src_x;
+	vc4_state->src_h[0] = DIV_ROUND_CLOSEST(state->src.y2, 1 << 16) - vc4_state->src_y;
 
 	vc4_state->crtc_x = state->dst.x1;
 	vc4_state->crtc_y = state->dst.y1;
-- 
2.36.1

