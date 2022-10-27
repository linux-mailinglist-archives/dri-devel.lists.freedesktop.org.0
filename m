Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF560F81F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3722210E61C;
	Thu, 27 Oct 2022 12:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11B310E622
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:53:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7BE9732000EB;
 Thu, 27 Oct 2022 08:53:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Oct 2022 08:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875191; x=
 1666961591; bh=anFwM+Gin/ssAo750veMr4y+fhnl3kt3lfIrq/Apdp4=; b=D
 In162q8O7mSV6/K8toH8O6MTBGbSsdJf2gNm8gj6IZmIXIchcxPX3LLwEP5AZOzf
 QcmkOAM7tRXRHhLwjgRoLKIOmVCA2uhi0rbwvH0anX1CX7iRnKkRmFjB/AbvEP7P
 nCHrwJz6kqsNsS2bp658osVX4yWpOb9duckdTKpBjE1iGdbbZw9hvJnLcUs0pJzu
 94blML4iocyuI+91CQT3PVGD1/3B+5yxYrTEuuiuMat094GZJPMlYcwvMUhZWNBE
 NOmHd/U9VQIXXQzUvOBrqvZeeo8dD1KGpGaNOLF9ylU10x5sJ30A8UH0IVjw9ZoD
 xUVMzToOmrjX9mkJJDleg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875191; x=
 1666961591; bh=anFwM+Gin/ssAo750veMr4y+fhnl3kt3lfIrq/Apdp4=; b=E
 /x15WzLqmlSlM/C4AMXaQtwpLfEgY4YRaRWmYDiEtwFIdEEVDaLRrekt/uSEUh1B
 2QlLAsoWaqSJfsKnyXM0SsTNAoRkTXd8TiQMVJ40iynTu2GDYE8GLqzj7/RRlBZJ
 Qu6NKusvdD7zBCJyFdOqieYIKRFy4Uvskb0o6YHUWOXLhNaKcah1lWK36tSbFY5R
 raSvjA8QDR8Yai6BDAUDf7cN4EWj/2ZUB/u7FNgD1i4qmJonQDLQMie2Ngl8ihSS
 PnOh2IdtdBB4Vx01T9Zw2Nz6XeWSgc7qr9xkS8reGTkg2u7XPqllkcmq4a066fqC
 wW2jAoSUhpdCHazsL2tqw==
X-ME-Sender: <xms:N39aY3x3QN0AXoywpjUN0tEOX7IKBaRh91A_5ifFikwZsgMOt_hPaw>
 <xme:N39aY_RjEhbYTseC1Gt4hNemnJQqb1JE9x-pmz7SCuQkSK7vsDwrk37EoUugrh1cX
 UgEk8a0GJhn7t6Pe9E>
X-ME-Received: <xmr:N39aYxUf8p9eOQM3-0zsMrpcHcEr358PdtuTJuauawNu8xzrw6rivwAMQdJvfhr1NG8hsNM_Z_4enD5bx13QUv_vtwbt_VNtqn5i0lxk6_8qxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:N39aYxiGQ8Sln0wb-zMuYhKGAIfzEDKPNjnYdGnlpqXyhmp6pthyRQ>
 <xmx:N39aY5BsneUkQPaDM08swP7RLVWHfl-ibbqJn0lrp1imZJ8apCcQkg>
 <xmx:N39aY6I1N6lTEwVM6XOqM1k5pfNcq6e2Gbv5iogBVxOvxJluxPZ5Ig>
 <xmx:N39aY91YVyH_u1MvWWBikIUVLyxQGzkSkZZa4l_wFY6ddrlmAJongA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:53:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:46 +0200
Subject: [PATCH v5 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-6-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=itpyssrr1dy+1K+Icy/g2wEEx5bg6P7/SUR1I1FBckY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TJX7Q88MHFmT8lQOfvHP1Y0vCI+58m9gwd1fJf66+gm
 ftnZUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIn8vcHIcPXlJLbTJz7ptqVZmp1VSW
 W+fulxoUaKRhC72ZPSj7PZeBgZ5vD+vJ6f+ZKz9UPU795vtSknX87c6XR0ubK61EFpzY+7mAA=
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

At least the 4096x2160@60Hz mode requires some overclocking that isn't
available by default, even if hdmi_enable_4kp60 is enabled.

Let's add some logic to detect whether we can satisfy the core clock
requirements for that mode, and prevent it from being used otherwise.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++--
 drivers/gpu/drm/vc4/vc4_hvs.c  |  3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8da2b80fdbd3..515228682e8e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -347,6 +347,12 @@ struct vc4_hvs {
 	 * available.
 	 */
 	bool vc5_hdmi_enable_hdmi_20;
+
+	/*
+	 * 4096x2160@60 requires a core overclock to work, so register
+	 * whether that is sufficient.
+	 */
+	bool vc5_hdmi_enable_4096by2160;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 98a6643821bb..1b201df2d4f9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1753,6 +1753,7 @@ vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
 
 static enum drm_mode_status
 vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     const struct drm_display_mode *mode,
 			     unsigned long long clock)
 {
 	const struct drm_connector *connector = &vc4_hdmi->connector;
@@ -1765,6 +1766,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
+	/* 4096x2160@60 is not reliable without overclocking core */
+	if (!vc4->hvs->vc5_hdmi_enable_4096by2160 &&
+	    mode->hdisplay > 3840 && mode->vdisplay >= 2160 &&
+	    drm_mode_vrefresh(mode) >= 50)
+		return MODE_CLOCK_HIGH;
+
 	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
 		return MODE_CLOCK_HIGH;
 
@@ -1799,7 +1806,7 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 	unsigned long long clock;
 
 	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, clock) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->tmds_char_rate = clock;
@@ -1962,7 +1969,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index fc4b7310bf63..c4453a5ae163 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -818,6 +818,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (max_rate >= 550000000)
 			hvs->vc5_hdmi_enable_hdmi_20 = true;
 
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
 		hvs->max_core_rate = max_rate;
 
 		ret = clk_prepare_enable(hvs->core_clk);

-- 
b4 0.11.0-dev-99e3a
