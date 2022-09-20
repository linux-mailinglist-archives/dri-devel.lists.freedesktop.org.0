Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71D5BE663
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89310E697;
	Tue, 20 Sep 2022 12:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0882410E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:53:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DDD3E3200985;
 Tue, 20 Sep 2022 08:53:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Sep 2022 08:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678398; x=
 1663764798; bh=QPg9G5ivjHJPpfwME/clZpzxlHbJakfKiCz4R1/XPHk=; b=R
 KWZUVjw71KTr3vm/kU+oGkWy8tOP0PJ/bpCrzMxdoM1iyo1e2qBSSgIRnASiEJd1
 HajNVq0ZWTTYDHNTNnDx7warrKYcm7rqlYhSm5oz8au4SFyFdeqyrWwjtpK306vZ
 Pzfp5SeSIlA20y8IZUK3U8+h1fEzvGrzeVZs6wAiqmGbAnNCHooAgzMaFqybu+K3
 hiQvmc2KoAt1f8/qjcE/adtDDQJNh+OjG4Na5wV5rKNWGYRGCnJNsZ4Ch2T1MMod
 zFIUmoueSlrgO6Tbv3ujR/XJ47zO/utd7RvYadVDJ/fqwbA5X76LgN9viNz7rMPY
 ED2BqqOG2BTnS3vcP7/lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678398; x=
 1663764798; bh=QPg9G5ivjHJPpfwME/clZpzxlHbJakfKiCz4R1/XPHk=; b=C
 gNIQPjKD08AzbBKJYXT5WkdFqHhwwl1rSzerY8yH7LV7IJk92uLiUvA6CnsuRJFb
 qczbRZ5vW4i35XDkG83q+mwHDm3s6SebO5W9LyDWwpNJUfqDSopWgdoldsGRaLLX
 rSzpw+imrWP3OYoVr2sMqs8iXuifNniv6E7TUn8FSKKkASFuKNO/cafORIkUeuN4
 RM/f2qwF0NXkp6PAVGLcqHEoowPk7NgRS6wCz1feRq/dVuwkbuZZMjB9CoTcCO32
 tQcM/kMJGlLI+vWtnVqN4cZ+Vm9EDlny0p9ZXpPqoMEBYW6oHCZN9uGidbNxRY3/
 pA58PHGhpGfqIOL/UolUg==
X-ME-Sender: <xms:vrcpY5f7rkkp9yxEqu86_Kun3QQUWkNPd2NDjsR-wino0OQzw5NrGw>
 <xme:vrcpY3PltL5PC_twNtVD3yve0QK7xcPV_hNsn9pnlYMq25VuINVEAzznhucz_eTjw
 eyU5372rRywZ28fARo>
X-ME-Received: <xmr:vrcpYyhcj_Cz3MzOinxG8-DdNlkMzyKR-9D-Vfs4yMdZiXAwZmFso_P6P_Pq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vrcpYy-ZmSPFcr1iP0WoFp97ejx0J1lsk73KSFhBygFAku2nBxpgOw>
 <xmx:vrcpY1s3nl0qdiks7biIwLSQz409y3QIHd47MW68TWZMh9XemwsTrg>
 <xmx:vrcpYxHw43Tps1hSIyYl1mP99lfXg0649Pj6fvsRPBPXUA6HEVJg4Q>
 <xmx:vrcpY1P90JtmGiBQxSPNu4fRJrbg75mIcFQ-Go9jUJx8a7qDyr1U6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:53:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 20 Sep 2022 14:50:25 +0200
Subject: [PATCH v2 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-6-983276b83f62@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3248; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=og7yp0bHrituGtq5GFguKmTt56yND9plFAQ/PXTZ8pI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/l8pXYkrZoZX72wKq8tOFXqlJRr1aY3bFe8rig9cTvf
 sjSuo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZxsHwV1L5mrwSe7KdtYvOTbmjZ5
 wvFGfWf9F/F7YsTpWz67Y2B8M/HedYodsbpxl4pP5+M+GATr0Qm+g66QOqhXO0XLX9Glu4AA==
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

From: Dom Cobley <popcornmix@gmail.com>

At least the 4096x2160@60Hz mode requires some overclocking that isn't
available by default, even if hdmi_enable_4kp60 is enabled.

Let's add some logic to detect whether we can satisfy the core clock
requirements for that mode, and prevent it from being used otherwise.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

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
b4 0.10.0
