Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FAC605AD2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE2310E58E;
	Thu, 20 Oct 2022 09:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEDA10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 882442B05E5C;
 Thu, 20 Oct 2022 05:13:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 05:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257229; x=
 1666264429; bh=37BiTl/8+yRd6z/JmqgJOWpEYV/jaByX4NWqybx8188=; b=Y
 r7HFLzYKe981sc+wrD+kDFdIU/i9QAzkOhfDjzJZ9iocg5lNsVAYDoLhlrHgjRkd
 t7IVQYrr1yysOVj6PENg7oeqg/cq/o5oDkaj5XZUCR6evY4USJTxwY7ZbdaCSTnG
 PUHEXrc1h79NOpNgKma6Dt2z/g1AIG77/C/c7kPRjO82zsAQHTepUNUWGgcZielY
 vH4tis35CxhpFSwbZaiAuF4/773HUE5pBVsbwgrf4D6uMqBBDYRC5LeocgIjKtKB
 13XioMr1D+HabW30pHfMXJyMkW66rIkZEZgEKHQ+QLr6iEkRuP1cfepACYABmnfk
 iJQik0xum/0D1MmM2tMXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257229; x=
 1666264429; bh=37BiTl/8+yRd6z/JmqgJOWpEYV/jaByX4NWqybx8188=; b=V
 Uy54n0G0shaXTiihmx9FRkBx7sAlfpA8V4IW0VPiOmlF3mZCvnjIZiu6VNy99IEM
 5Y72kAbFoVCd1OIyJkZqhMu6C7T6/KuQzwZHFtPSDd6KZC1sy+lm2lxJJevrrbyg
 9z2a6cqWNs1Ci2LLhUkfhhg4otpZviolWTNxURN/4oVDEUl4ycpVO5F5/qlggB1z
 HbAzG4/7JP6u3UdSa5WibXljPYT2J8hGszUbDGefAIiUxzFpixGWkertxCI7YV/e
 svOHr65I79oAyMBh7Wojc8S8aPb1O2i/G27MKeTe2c+FKugjE2lSXfTTEEi1slXN
 POeW9RGBoaStVn6vUSOMQ==
X-ME-Sender: <xms:TBFRYzNTbJJwrDjGo9WX0PKrR8nq8S3vj1WDWGT9mqa9gmNVmRq_jw>
 <xme:TBFRY99a2d_phSBKR54NntMOP1bgd4vFPMUlUoRXZRGqp6-9GgsbL-qZY18uWzopG
 c3ia9cYxruiMQrGhXE>
X-ME-Received: <xmr:TBFRYyRjJLbG0oScQgWD-MyvAP_qKIczc2fnPghCAlQPS6tyCRmkYTMwyzub78wLit1AEiZGTFsSCz0K01fuoq7ltmSl_BUwR9lNtO7IIjtPUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:TRFRY3v6oyCp6RapDUhavIDbsLaWoyU_r5HdODsLjHDwzgbQMGLK3g>
 <xmx:TRFRY7fsgwiSPeegsL8V0i1ixhu9j9H28Wy-DKbhk1AC62YfMBOKsw>
 <xmx:TRFRYz3QcpLuJ9yeFSebpkq1tBs_9cqfn4mu8BrM9NUJFm9K4zrT4Q>
 <xmx:TRFRY5_8c89IzPUhh6egmRmHrleFjQkmCsntINY_XOW-QHPAomfjdBmXjyc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:48 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:14 +0200
Subject: [PATCH v4 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-6-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QTgOeJuxmwauDIkCRKut8vRcGO6wjQAZnCghZDPfmdo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq++Pkhc8fPyDaWQq1d9baxiHacyukvPi1qQ9tbSo5+9
 66xpRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbS+oDhv2vM5d6KGY/NP022i/eLbb
 WdNHXp8k0rGx/Uv9uq13h++wlGhjl+XwxOha5/lm+UWqv66HDXrWqxJ4/i09+b5iREsS49xQEA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

At least the 4096x2160@60Hz mode requires some overclocking that isn't
available by default, even if hdmi_enable_4kp60 is enabled.

Let's add some logic to detect whether we can satisfy the core clock
requirements for that mode, and prevent it from being used otherwise.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++--
 drivers/gpu/drm/vc4/vc4_hvs.c  |  3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8b2b1af565f9..72a6b7151d23 100644
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
index afe3daa2173e..fd3730ea976f 100644
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
index 300ac0b57571..a68913f76687 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -818,6 +818,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (max_rate >= 550000000)
 			hvs->vc5_hdmi_enable_scrambling = true;
 
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
 		hvs->max_core_rate = max_rate;
 
 		ret = clk_prepare_enable(hvs->core_clk);

-- 
b4 0.10.1
