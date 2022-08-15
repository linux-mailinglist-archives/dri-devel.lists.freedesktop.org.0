Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4A5931FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2240CC534;
	Mon, 15 Aug 2022 15:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104CCC51E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:32:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 55DA43200903;
 Mon, 15 Aug 2022 11:32:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577529; x=
 1660663929; bh=0H1FgCTKGm4EwtAlZfdPc/4yY1n4HBSyRugi/OIJS9g=; b=i
 s9Pwq361itx3Jtl4ywNGvG4TAFsd8iXDpwLJ432J/j4IADTZDWxuIXWPHZwNi7JN
 up+cvVK3NC7bE8d8l0o8b2500uYnSrfJEojLWvn+zdXZOZlU8u5iUnkCLSh/alL2
 s9QB/Bxy/56V9lSIRpvuBkUa6sNR3+VERlTJelHIiamdCzzygWmj0uMtK15B451q
 oFwQvQ/XZ8LGDFx9tOwGJEA5EmGYXQ9EHm6D+6ZP2/a1wHfYvra8S+ldrNgRBI2j
 zfKQVhYk5A7cS/w68HHNqOPQvADiLAHC00VvKH7hVlqlCy7wa1jwO++fBqMpfLO1
 z2tNIgZXEuypOzW85LaeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577529; x=
 1660663929; bh=0H1FgCTKGm4EwtAlZfdPc/4yY1n4HBSyRugi/OIJS9g=; b=2
 W6J17YR5uDpGSKqt9GFekVnfOcJFfWut+dzg+fA4476CEUV9qMiVh1AkVNG6ELfF
 fPsrY2HgOECI7TFitRnxPS6YJbtLidgUoetIQhj4a3y5ArDSOXvzCInGj58oDKmz
 mLMp1tsDls/5EorXa+eVc79vSqSYNq7j9CintlCVx2w/2QpZ2tGSsCYYuHdTxN5S
 rFmbbThNsd7yPKbhdVMBCNgolEHqbLfF9ySBvnn+cwWuqpN5po2iTR1TLcHjpt0U
 7FmaJdL4kM1QwyoIf9Cq3G3SrF9rxlrp7gctu2aVVi1Q0gxjQZIcH7JDkcpUDo/U
 nJO4hnwhd9XF15kJqA4Jg==
X-ME-Sender: <xms:-Wb6Ynvit5JZ93qho07T7YiifEuFsD0oZNrm9ds9wjF_srKqhRBqeg>
 <xme:-Wb6YocMIGm9Fu80uY9thGRnTaIDK5JiONYPAwmJJS_rQ5LzbdcH9K9WNqHInT4gM
 qFbPtZAxxadPbhQp3Y>
X-ME-Received: <xmr:-Wb6Yqz3uiNsx3epovQIfs3KKgBeKMlNBAe8tbIumW6A5gFsiW7U85oX8LyP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-Wb6YmNok_DwS_2IX_2nmI1m18cUAvoULSgiAoxYaZMSl3rs-zwGZw>
 <xmx:-Wb6Yn8oFDC8QDSTVIKbqYbwh29V8F9_EPXrAWFeP4__A2KIpZ2upQ>
 <xmx:-Wb6YmX08YxcpIdjd2yAyTwFCIOYJTba8eu9s_tANOy-OF3VQ5IQbQ>
 <xmx:-Wb6Yuf_IqsKMKCNmLPX8geuYpLpyNAcTHJiA16ITzpnnzTdCLE1lA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:32:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 7/7] drm/vc4: Make sure we don't end up with a core clock
 too high
Date: Mon, 15 Aug 2022 17:31:29 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-7-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5xL8zqAbx64ymg/R2TZazkdU4kRqZkVFXJuXP1IVv7A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k5YZt2yOnqh5LT2jrYtu/bzGz9g4Aq+HREa9zL+wjHv
 nWvsO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR5ixGhu2p88p/tNU+SEpdLytQWJ
 6RpddvzDMjOW3znZtihvwzixgZTrJItM8969r9Q2jjhHlvv/Td2bTt4hPV9F9ZXMd7bqnE8QEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the clock rate range improvements to the clock framework,
trying to set a disjoint range on a clock will now result in an error.

Thus, we can't set a minimum rate higher than the maximum reported by
the firmware, or clk_set_min_rate() will fail.

Thus we need to clamp the rate we are about to ask for to the maximum
rate possible on that clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index b45dcdfd7306..4794e7235bb0 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -22,6 +22,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#include <soc/bcm2835/raspberrypi-clocks.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
@@ -354,6 +356,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	struct vc4_hvs_state *new_hvs_state;
 	struct drm_crtc *crtc;
 	struct vc4_hvs_state *old_hvs_state;
+	unsigned long max_clock_rate;
 	unsigned int channel;
 	int i;
 
@@ -394,11 +397,12 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		old_hvs_state->fifo_state[channel].pending_commit = NULL;
 	}
 
+	max_clock_rate = rpi_firmware_clk_get_max_rate(hvs->core_clk);
 	if (vc4->is_vc5) {
 		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
 					       new_hvs_state->core_clock_rate);
-		unsigned long core_rate = max_t(unsigned long,
-						500000000, state_rate);
+		unsigned long core_rate = clamp_t(unsigned long, state_rate,
+						  500000000, max_clock_rate);
 
 		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
 
@@ -432,14 +436,17 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_cleanup_planes(dev, state);
 
 	if (vc4->is_vc5) {
-		drm_dbg(dev, "Running the core clock at %lu Hz\n",
-			new_hvs_state->core_clock_rate);
+		unsigned long core_rate = min_t(unsigned long,
+					       max_clock_rate,
+					       new_hvs_state->core_clock_rate);
+
+		drm_dbg(dev, "Running the core clock at %lu Hz\n", core_rate);
 
 		/*
 		 * Request a clock rate based on the current HVS
 		 * requirements.
 		 */
-		WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
+		WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
 
 		drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
 			clk_get_rate(hvs->core_clk));

-- 
b4 0.10.0-dev-a76f5
