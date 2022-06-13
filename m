Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C185485C1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5D510E81A;
	Mon, 13 Jun 2022 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803F10E81A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CE8EF3200302;
 Mon, 13 Jun 2022 10:48:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131690; x=1655218090; bh=Cq
 u4qVj5XwGEIFbi/x5neftEkpNEgt0chneysUpiW0w=; b=qI2KUyF0DVI8Apy45P
 Kp8NldnqXkzVJCAnO63oA0Tsv9RJAKNLFlFK0I7naXUdF1TZAc+ApLPi5ErQDM1+
 00PHqr0FYIfNd5YeDgR1ClYRPMbKgbp6zWFkxsuzqN/qv3hdAWpd8uTduKISC2fV
 J8CAR+bKM4WO9dNO9ZXYX3WC8IQmT7vhSBgS+Xlzc5m9egucuk3C45ftfGoU86OU
 a/Y4tIqotCAqCBunWoOFwmbdZhDOWWWMtcAK0W4x4HDSJtQ6mPd+5ngIQe5UlHwn
 Zh1d5WjvnKDxDJtX46P2Yc+oOZMV9AMV6rtA0a/BwDKnatrxVJXOFaUaDLEyZZE4
 88hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131690; x=1655218090; bh=Cqu4qVj5XwGEI
 Fbi/x5neftEkpNEgt0chneysUpiW0w=; b=BezgB+l27Lm0pTShrIDXnOBEC4M/6
 g6PYWoWyC/wb24Kfa9mhH98XXllz1sAu9dlpGnxfJWD5LjsrbZtfv2tz11i9C+4U
 XhHnnBuMxIe9rZVM6THVsA0PH3Bfk9flx9jbQu2CWZ+BUf3qF/Gz5wcWgHqqIH47
 ixL1gL0BFzhew4rWfn10WeeqOruKea8BaHJnYwVRilHNSu38zf6M9HrVAI05slzV
 sIeWrcU6k0ld3BdpI5tFoBs6snXBzyQd1CQjnFR/O9xA1hDYTrAFz215GtANKPKP
 5nSG7GABM8dUXyyGYoiRMGO+izCCApT07PuB9B9kodRaI9YO7JdfHwDBw==
X-ME-Sender: <xms:Kk6nYoAph0Ke-nOKlNQTTP_jVf1q-MRy_e6XLr-_2xERuaqyjUR_tg>
 <xme:Kk6nYqjHy0zqoUgnif_ga1q-75CEvRDZsmGHPiYq3_1QegqIY12iUoCLn6OfKp3eL
 Orc6uo8ovXGoTNGqj8>
X-ME-Received: <xmr:Kk6nYrlKZX5axunFlUnr7BMVz-Mtby6xlh0srHA_6PlaTKLIqBwSa-5--ST6HIOPnS895jhFAfwlUFYVqK8bJzP517xbAQzEIY83JTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kk6nYuxysmd6vmxjH5PWPz2PFtCqgz_kxFVdANaSk_hZUtyuMMfH5A>
 <xmx:Kk6nYtS6DlCLIOJIDngRTLKYMy7FD7OA3ZgYAet4QDYInTBLWdiKXA>
 <xmx:Kk6nYpagduYYVXfhpaZxU8Gj0vNncpmvL5Fh_hKJJtJ3_GryVvjAiw>
 <xmx:Kk6nYrMMlCbs9bagtxWzKW4MHfrojw55ngzDnH9PM4LHixzAjwvbMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/33] drm/vc4: kms: Warn if clk_set_min_rate fails
Date: Mon, 13 Jun 2022 16:47:29 +0200
Message-Id: <20220613144800.326124-3-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently ignore the clk_set_min_rate return code assuming it would
succeed. However, it can fail if we ask for a rate higher than the
current maximum for example.

Since we can't fail in atomic_commit, at least warn on failure.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index c169bd72e53b..7a7c90d8520b 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -405,7 +405,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		 * Do a temporary request on the core clock during the
 		 * modeset.
 		 */
-		clk_set_min_rate(hvs->core_clk, core_rate);
+		WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
 	}
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
@@ -438,7 +438,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		 * Request a clock rate based on the current HVS
 		 * requirements.
 		 */
-		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
+		WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
 
 		drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
 			clk_get_rate(hvs->core_clk));
-- 
2.36.1

