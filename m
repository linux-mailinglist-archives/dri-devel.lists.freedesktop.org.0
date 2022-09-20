Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5672D5BE66B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E30610E6A8;
	Tue, 20 Sep 2022 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC51C10E6A8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:53:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A97683200A0C;
 Tue, 20 Sep 2022 08:53:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 20 Sep 2022 08:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678403; x=
 1663764803; bh=wGqLmKp8PyrCWTiski6RZ9ILduluZPIkJhco5wIZcAs=; b=X
 nMjZ841XeoCfJsO/Ga2e8KRZBI9BfRkLJYsauzFgSdp86HD6ti5ybHpc7KeY/Ojt
 N/ohr9g/wb23hgFp5YSLM3qb7DXKFw/FSpV0a0KcrvD9fwy52qNOR6eJOWEL5nE/
 A7zfy7IFSNG1lV0wrDq9LZ7rPp9RGZA7jXz+AV15xH9ziV0cFSYov1rtmQzFQBnZ
 bpP70LxE2TvxKDuMwU4XHGX1j6yhlPBo4bXSlSvcPWbBGD4AQ0IRJycODtZEhpYo
 W213L5bJiFsAnH9Hu3Q4JssBd94duaBtqTP329H6JrXKsltb8ac2/Ei4UY7NYqrU
 mVDGNspd5SjHw6L4TqGIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678403; x=
 1663764803; bh=wGqLmKp8PyrCWTiski6RZ9ILduluZPIkJhco5wIZcAs=; b=z
 ZmbmMhjJYLtD89tLN/IOlairvEfjMDcnCv7RC1Ti+TyNE0Fr+FHuw61hwSjule6T
 9af7wc0hugoYAQ52Ix8RgcndEx7AnCWDI5MoeuxiMzbMf1ni5sRwyPgiDm4mv6wY
 ZX3/FlFmdwU1xZczRL/ny6zl89F6L84hsCshhLK+w9mNuVoWluM1eDeJjkEBiBlh
 UD3f1WksZ7MO3kocXgoMISeHHQfFbx1yyX4pXtIRcv3xFthw6ClRfE63+dKIxvAF
 mRt01imSnzKnpVGIOko9bEBNd4F5OUXxjsY8tSY7HgeRoPvjJthJPabUxoM3olCt
 ZVAjcRZiygJp6micv5zjg==
X-ME-Sender: <xms:w7cpY2iOaqLycF5URQd1bnsOXVk4dR7GuD9I-1nkogq4KRsCyjrwTA>
 <xme:w7cpY3AuJqOp5S3Kd-2-MqfrLkXNFCvxJ9Hjm8sXfgAoRugLdezKBIyx-z3ZIASzd
 FvkM_0vZ_l18s_m1b4>
X-ME-Received: <xmr:w7cpY-G9mquNPd0TbUUZvdEhzRlUx4kD8rwn-84KpkEROt2EabFij1_-ByjO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:w7cpY_RqyoWmxys0UNsLPP-i3BuKS-oen-qkRjMYXkhznHkWzEoCWA>
 <xmx:w7cpYzyGekDNPKqTG_L0Eyt_veFcRXhmigRhdBXTYwfD-etpA7PeVA>
 <xmx:w7cpY96r-9ADy-k2poLscqYM656popZpMllR5fUrUo7kAgzVoSb5VA>
 <xmx:w7cpYzCqr95pHE4bwzKhaaVGK6KitQvqB8usd8ZgOwlFAtZbQJPXGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:53:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 20 Sep 2022 14:50:26 +0200
Subject: [PATCH v2 7/7] drm/vc4: Make sure we don't end up with a core clock
 too high
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-7-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ktzm8C9IydCiRKTg61h6xCxAgPQPdqFOXPfUpNJEefY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/k8XyfPEslInSfzsn/HPx+nqS2317rKzlr3d71VxsJ1
 alsSOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARRXtGho+R+a/8XG75hTAc2KY1cc
 lS5+J/B2c1lsxO2DRTTD+zMJ2RYbaBgdC0J/duRwdkR1ekn715qXWC06blFn/rKw+Waf6sYwEA
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
index b45dcdfd7306..d241620fd5a7 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -397,8 +397,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	if (vc4->is_vc5) {
 		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
 					       new_hvs_state->core_clock_rate);
-		unsigned long core_rate = max_t(unsigned long,
-						500000000, state_rate);
+		unsigned long core_rate = clamp_t(unsigned long, state_rate,
+						  500000000, hvs->max_core_rate);
 
 		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
 
@@ -432,14 +432,17 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_cleanup_planes(dev, state);
 
 	if (vc4->is_vc5) {
-		drm_dbg(dev, "Running the core clock at %lu Hz\n",
-			new_hvs_state->core_clock_rate);
+		unsigned long core_rate = min_t(unsigned long,
+						hvs->max_core_rate,
+						new_hvs_state->core_clock_rate);
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
b4 0.10.0
