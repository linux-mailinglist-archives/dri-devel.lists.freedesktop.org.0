Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB711450374
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5A56E80B;
	Mon, 15 Nov 2021 11:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC386E845
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5A7C42B0118A;
 Mon, 15 Nov 2021 06:31:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 15 Nov 2021 06:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9qnLfLih64vPe
 62o39bsacGI/EGK3RY0ptjuiD5ENvg=; b=mQWIowdMyYCmt3YcUcfF83Sdf21vg
 3pzKJdOASlgKr7kIxyhPifKCJXI9WIb2djHRG2XoBKQbKYLtPzfTUIE5eWoWf5yI
 Z9YenV5PoTUHaNnTOzMD5ATf6cdB7BoJ2a/KHIq0azg6J0tf7IZ9dVJ386/66N9W
 3CuJcOLd+OJ+vZecEuuSq1tXHZqhM8WKiS410wqfIDrxvl8O4layCT6rXSEhMoiW
 dFRDLuKuUqniJYk9C0VHGxDXW81KsZrobqGk6aT86MpcYEh/Y224oT9OJWz3MQBH
 7f0eflP6b+VtmK06EU9hoqnc/kxhWgUFYRTO0ra0+QFGfy2dQdfVHv0aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9qnLfLih64vPe62o39bsacGI/EGK3RY0ptjuiD5ENvg=; b=nVG9L/54
 AXXYqle+lCQnubuuaetVo6DpZuAAD/4R8Ww7sO+pooSHHGDgM6S3Dup5dGmTygO6
 BFiyaiELNoE18O5BLM2sxcbd0TVxMQVMKT26/6BBifh7ahU+ub8bA8W6C5C+Bqsv
 lLE5RPrrt5OKgUxM88UsEnFcC18ujcB2XC4M3xisYiWNXOVvIB1mP4jm6UxH/nAa
 IIMHLxDXOdphOzbwe7hdgZQ10hfOpcbaZfY7A+Rd9P03PZfpWSIN49zhuMJpE3og
 G8l19BxqTr1sRYrHTnLPZmWPVFjYtOEtbFR3OUy8OWgVDf67m/sbAulVYe8SrKly
 j8f+opGGE2FqKw==
X-ME-Sender: <xms:AEWSYcJMTuO2vpmW3a0IULrGDGN3C_u6PHxNDIGp-zNt63yLxIDLwA>
 <xme:AEWSYcIWG2hTEaneP3xjzBHEGcH8s6V0IzwN_hz6M083SsE8ore3GoWqpWnsqGUfO
 VZo_CRtoHfGEXXFQmw>
X-ME-Received: <xmr:AEWSYctUM9hDnL5FUhFIf-dmQwucrjH5GvORz1P6XYRJbHVskimpf7zds1VFFa-krK5TfuPCtQiT6T5AelVjT_YqkGnym2K_UGWr4rnJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AEWSYZboEKY6FWZKCWVdO0TIXV_teKXv18-r_oK_uP9oJJx129tNTQ>
 <xmx:AEWSYTaQtaBXxshHdzQnwJnG0u1XSZ6_PQG3A7ETNAWZSMgsnz88WQ>
 <xmx:AEWSYVCHjdOmNjuniYjDSlu68_G5ppSKVGTGVCnym23uScS2fchpWw>
 <xmx:AUWSYdlaKQ22XvunfzPwJ1RH5EdJOSKmZZYVMI-l9I4nBuyX01qK5lclA5s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 1/6] drm/vc4: kms: Wait for the commit before increasing our
 clock rate
Date: Mon, 15 Nov 2021 12:31:00 +0100
Message-Id: <20211115113105.103275-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115113105.103275-1-maxime@cerno.tech>
References: <20211115113105.103275-1-maxime@cerno.tech>
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
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several DRM/KMS atomic commits can run in parallel if they affect
different CRTC. These commits share the global HVS state, so we have
some code to make sure we run commits in sequence. This synchronization
code is one of the first thing that runs in vc4_atomic_commit_tail().

Another constraints we have is that we need to make sure the HVS clock
gets a boost during the commit. That code relies on clk_set_min_rate and
will remove the old minimum and set a new one. We also need another,
temporary, minimum for the duration of the commit.

The algorithm is thus to set a temporary minimum, drop the previous
one, do the commit, and finally set the minimum for the current mode.

However, the part that sets the temporary minimum and drops the older
one runs before the commit synchronization code.

Thus, under the proper conditions, we can end up mixing up the minimums
and ending up with the wrong one for our current step.

To avoid it, let's move the clock setup in the protected section.

Fixes: d7d96c00e585 ("drm/vc4: hvs: Boost the core clock during modeset")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f0b3e4cf5bce..764ddb41a4ce 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -353,9 +353,6 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
 	}
 
-	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 500000000);
-
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
 	if (!old_hvs_state)
 		return;
@@ -377,6 +374,9 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			drm_err(dev, "Timed out waiting for commit\n");
 	}
 
+	if (vc4->hvs->hvs5)
+		clk_set_min_rate(hvs->core_clk, 500000000);
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
-- 
2.33.1

