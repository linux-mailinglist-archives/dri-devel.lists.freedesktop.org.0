Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E35931ED
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9180CC61E;
	Mon, 15 Aug 2022 15:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FD9CC547
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:32:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 95DA03200920;
 Mon, 15 Aug 2022 11:32:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 15 Aug 2022 11:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577525; x=
 1660663925; bh=ktrfhO8azzfkir+67dZmGrwjSV9EUzVMeN4/IEU4X6M=; b=V
 YAhYNzvIjzJLKvvgKU/X1TSh5ruxiC1wfD8Iwx8j25phA+LvLP/cRWNAPBDkTTcU
 pkvjhboV30EySAN+apd2dNRixKjLMkqSMviypfYOSk3gg/wiPF2aGPPc2uv/t814
 IlVHGHLNbLjrNGEORX0PbVnbHUhL2evujlLZ6gvPc8t6tgNRCwvSX0z5MidYrW4j
 nInxxpn2N+9VZf3fQItilbJprHA5FK/DYD0fZC4uQ3Ds0bsHawS6HDLncjaUQ8dV
 maWXhedbvD21ppK48mtx10sKEz/DrB/wrOoYL7fAIFpyRVz9dvG6GzsVPsuvQMlo
 H0dQp5G9IkfrEYCwUpEGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577525; x=
 1660663925; bh=ktrfhO8azzfkir+67dZmGrwjSV9EUzVMeN4/IEU4X6M=; b=X
 dK7lbuwOPcp8nbszWIPiTu1Zx81jbH65ExTPQyJFwJxihuaZHBd59abMsi0mvUck
 niNV4YAsXbgL2YlnNaNuPVKnSAwqOlYWMfSnCH50g1TP+X0efGBBtK6b7cn4PowP
 lDskhufBIBd6KMl3qLyrKIO9+6HBgcfRse8NaZkAX8YBJqv4F6pRgMOzbytWCfym
 0Hv7bgOlseIhGHSEgkgZlt/fRnDy1p0qkzbvrb3gVNYJYEXghVothPauRkCQXptB
 VRyMpwSPjFlItvatrIJ1/BE+GoRkL2M6YEcQQItQQch3/WwoV/A5cSWl2K7jDodM
 ed0UEQkZQZQG2nPnUYVpA==
X-ME-Sender: <xms:9Gb6YoK6ph85Et6slP5xjHr1AndGTf3JA1tP06KeXw8vSWMOoH-UCQ>
 <xme:9Gb6YoJRXDm50tKDMjlf2ZQWfWojK2lrD6Cf3HYtS20EmjfTuTyu6GNaHSEHH2ltV
 5tYxvdf3PyzXMomrHo>
X-ME-Received: <xmr:9Gb6YovYwTSUHv3l8wwlEv45Q_-qg-vqQwHicZa5R9wLSE8MGOaCaKJnGn4O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9Gb6YlaBHQ7q4pjT4OGGEoJ22gqnyav5vp93r2oCmSMzyQ6UiVmpbg>
 <xmx:9Gb6YvYZT5A0YSKR_35knn-1OcH06BOcdlawV-vUoPpMO_qWog3MXQ>
 <xmx:9Gb6YhCur0bUkAnvD-gmQS6FyZ989jqg3YNVyKyMX_AfcNVlvKdM2g>
 <xmx:9Wb6YgLWx-womBx7y1kCWwm8PeYjanv4CYEeNZQh0w-Pwox9U5YJAw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:32:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
Date: Mon, 15 Aug 2022 17:31:28 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-6-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=3642; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=/B3+T5b5gJ8/wE/uR7uFJRjlugXjIMN1lxOXg37WzDw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k7MUlT2i3UQvRNz7UKqzj8J6zn9Z0MWPZkXUMJZtP3y
 enOrjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzE4S4jw8OJfTF/SgTCVs1+aZQRdL
 nFgtOB6+pG3sgKMefWNa8CLjAyvHl4YZp5f6thgcSaosiVc36b6Z/9lvJOhE/C8f2hCSduMgEA
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

From: Dom Cobley <popcornmix@gmail.com>

At least the 4096x2160@60Hz mode requires some overclocking that isn't
available by default, even if hdmi_enable_4kp60 is enabled.

Let's add some logic to detect whether we can satisfy the core clock
requirements for that mode, and prevent it from being used otherwise.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index d48ef302af42..e05f62a7eed6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -347,6 +347,12 @@ struct vc4_hvs {
 	 * available.
 	 */
 	bool vc5_hdmi_enable_scrambling;
+
+	/*
+	 * 4096x2160@60 requires a core overclock to work, so register
+	 * whether that is sufficient.
+	 */
+	bool vc5_hdmi_enable_4096by2160;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 371fbc05bf5a..5abbb2fe41ac 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1476,6 +1476,7 @@ vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
 
 static enum drm_mode_status
 vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     const struct drm_display_mode *mode,
 			     unsigned long long clock)
 {
 	const struct drm_connector *connector = &vc4_hdmi->connector;
@@ -1488,6 +1489,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	if (!vc4->hvs->vc5_hdmi_enable_scrambling && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
+	/* 4096x2160@60 is not reliable without overclocking core */
+	if (!vc4->hvs->vc5_hdmi_enable_4096by2160 &&
+	    mode->hdisplay > 3840 && mode->vdisplay >= 2160 &&
+	    drm_mode_vrefresh(mode) >= 50)
+		return MODE_CLOCK_HIGH;
+
 	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
 		return MODE_CLOCK_HIGH;
 
@@ -1522,7 +1529,7 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 	unsigned long long clock;
 
 	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, clock) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->tmds_char_rate = clock;
@@ -1685,7 +1692,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 3fdd2c4356f6..6cfc1a4e7161 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -673,6 +673,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
 	if (vc4->is_vc5) {
+		unsigned long min_rate;
 		unsigned long max_rate;
 
 		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
@@ -685,6 +686,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (max_rate >= 550000000)
 			hvs->vc5_hdmi_enable_scrambling = true;
 
+		min_rate = rpi_firmware_clk_get_min_rate(hvs->core_clk);
+		if (min_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");

-- 
b4 0.10.0-dev-a76f5
