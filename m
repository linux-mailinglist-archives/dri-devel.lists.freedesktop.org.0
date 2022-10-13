Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CB5FD6C6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8915010E69A;
	Thu, 13 Oct 2022 09:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9A710E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DE78B5C0162;
 Thu, 13 Oct 2022 05:13:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 05:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652402; x=
 1665738802; bh=qmzT73Nu8Eo80tOnAkFbYbAqOXBysXSE5lE905g1TjE=; b=d
 l3+WEg5YQS895fzP8Iv6T22TGg5de4JRmgwkSHgT7i8T688LZn8IkrjHppYsoP8k
 AvHpHaXwiviVbWxbKthEKPGfUq7fXfNRSv3P2gyxCP0VeRkC7019rv2SCCLhSOIB
 HyTNvS3V5bWCVpF6PenHg8ZIvrUoJLTqVvLpCKLElkqDR9Lxtc+oe2JpKNPA+oIe
 eJXWF+Gyq/Q5jF7bJ02a7aevmbB8UEkKyv7fs5wtfuL8TqUEZFSMUyY3XBJpRXg7
 kgkSdVdkHCnyYiuTvH30EfveL/INnexP3VFugT2uqolu/snmRKNgcpTEvbVykqOM
 Iq+VB5mPTjULSzsYrQMhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652402; x=
 1665738802; bh=qmzT73Nu8Eo80tOnAkFbYbAqOXBysXSE5lE905g1TjE=; b=A
 nQIVh1bP0qcIsXkAlIvQ1h2kQA4MYkCxHMQzomBmSaq+X17CxBXpaOZBdiTB5Fg3
 oRYOe4bvHU4EYG9en5v9+mEbq3rLldPkJ6E8RUKG+boHTlKPuDXKCEbO4mxqbuto
 Q1HlBQD6gOOCJlZBJCTin8nYKk/gEET0v0ub9k8MBiMTYjIGoEbg41w3HdwSjIu4
 834no9bp4dZwTPzVOLsdbd7D4wlDtcyA3V/krL1bVUvpLxyQH+RnQBPWYWq2Ofwv
 HzJp4//sAPxXNANwxjJsxRb7QoteIT8EgutlxrDMeSveKejNAOMc5pIRhVo5skWd
 KEHFMSjxsJlLKBFRqHupQ==
X-ME-Sender: <xms:stZHYylcTXvMtPmiEKyA2PRjBMpbJgNoUSaANvRWI9Ep3crzgdNHjA>
 <xme:stZHY50vf8yX-D_FT7UyCK9sfLCB8ekm94O6pit7iycfa4OKiuYI5XBzNf3CPlnEo
 HDE5ug1MoZd-DUxf6Y>
X-ME-Received: <xmr:stZHYwqsClmJm0RNgR-d9fR5LKEHDa3bBvRGTF-gue8kqHkrrbxIDeEYqOm-AgYp937Qa4IqLIz-owQJi7l2VdxTnAC6-0rJZspj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:stZHY2moNwqqfXA-JjlJPprVNAC2Teu1RtpRfw6A4auxk0YSz25m6g>
 <xmx:stZHYw3PEOZX13IAWWCpF44sBkUtrgAVzXBWJcnTvRVGwnNgEDWLfQ>
 <xmx:stZHY9tyELYerJzqrzLYd9O-e_KOyipVU0ckLtr_S76bd-SnBykmTg>
 <xmx:stZHY5GlWjVhJMzjpNOCPv72R4dSPBeUVLohZqWy92WtJzR1NgZ4UA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:13 +0200
Subject: [PATCH v3 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-6-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=oHROItAGNywnvJYBrN7pZtlhRHDQIJa7w2WOAz0D1No=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15b47m09yaP5K5Pvd6jdX/9WDWE1a8vTz+ZrydYvtHKR
 1vzTUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkkTGD4Zxxv+20F63LB8/+z+vbPmd
 Znq9ZUNN9CJvwYXyabcIY6EyPDqQsxJwUXNNhcs1CY7m0jFjy1QuK/jL9upbKxSFKU8F1GAA==
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++--
 drivers/gpu/drm/vc4/vc4_hvs.c  |  3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 09cdbdb7fff0..094ebe8567e2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -349,6 +349,12 @@ struct vc4_hvs {
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
index f367f93ca832..cf1fee6c29f3 100644
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
index e28a13a75ec2..32f5ab937ace 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -698,6 +698,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (max_rate >= 550000000)
 			hvs->vc5_hdmi_enable_scrambling = true;
 
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
 		hvs->max_core_rate = max_rate;
 
 		ret = clk_prepare_enable(hvs->core_clk);

-- 
b4 0.11.0-dev-7da52
