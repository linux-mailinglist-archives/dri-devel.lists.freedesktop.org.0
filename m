Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B140AAF6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD616E454;
	Tue, 14 Sep 2021 09:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEDC6E453
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:35:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A0D132B012D1;
 Tue, 14 Sep 2021 05:35:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 05:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=vGRGc5msdaUUt
 N2Q/hEpOdZOoPgZX0N6pFbxp/JPVss=; b=iZtLCyi9wFRsqeqp+Pn88WCe/klKA
 o9zn8SMryAZKaVbWAawd6nfJ8OiE4rbAuNHOQYTzDPKFb29UvmQm20WEvGxLjSJl
 qeYW0XR7md+Z0sDdTyjG5aaLnql/uFzBkKd58Kpro0DXlEV3gchFh6ewYQb4sxhe
 r4Zqu93DN+lOzsT9C7iEnPzT1iS3EOTOSv2x6jVR6U/LkAD1fya6f1o140ilzO3/
 bjELQ7z+i4Qe45XCNDiLcvTl2y0EukH5X4MY0JcAeuYXyXTDLO/6rqC3o5tZoF2/
 fEdsZn0fph22OQM/q1GvHbVpEZJAbJTooEivrG2acTPkmeSWQSHnHzcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vGRGc5msdaUUtN2Q/hEpOdZOoPgZX0N6pFbxp/JPVss=; b=D9cIWhv9
 V/yAl0NZquUorK4TPBJap/U9U8HYE5M6YkoUAd1w1o0WqhsypH1lGkMwitpG6SBh
 lW2f/LdI8r6BxA0WrSaNh7qUiQwo9EByIjLrGh9N1Wl9/SZVsj917kLNWlA1gyn3
 ojvJaXhTjsrQPDH0Ry/CS8EjJA6+RXQ5i8+/7+5AEO7lCCggOzrJWQ8VGpzew3t9
 Fs+j1gGYtCIxUma0yoXdyGlzq5dmADZ5q/j1CE/NwkCcXHVqM7ma2vRIjJHngKW6
 f1TiCb1pke+jYnF2S1V207pR1qby7jzZPT9tuilzY6K/FeQjXb8ZoFI56zAIO/Ww
 vQlirGeWNgKazw==
X-ME-Sender: <xms:32xAYU-6imLex7xT10hlfH3mDDKBDt9owv_cXt_YoMPRKIl2uCFpTg>
 <xme:32xAYctpPiMjghd4kKg8NwuffS_mxXvqjjBYokW8R6uYzimlEXyQhd6XFjmRk39GQ
 FF-FicD5BMh53tjECg>
X-ME-Received: <xmr:32xAYaDFI51vvN7vTCWfZSU8e2xpIU7GHbR5Yzj5B5JMAo9hwFX5yPUpGJsOdsuph_f48YAiAiOZiLmGIcfwav2XgGFzkf7cxYQ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:32xAYUdRLEA8OROnMha0i66RB4JrCjTmEdHpJICRGcIpBtE69Lrj0Q>
 <xmx:32xAYZMpnN9Y7RN5XJ3yY1icorWFk4bZf9E6pAQOe76nI9EOUBFv0A>
 <xmx:32xAYelhQtHmWs4nGILXrXDZ5mM4PVP8xdbyLeIYgjBnmjUqhWUAwA>
 <xmx:32xAYas68gkl1cNU2Q2IV456xflCm-Z8GvxbJJKOTpAOyNowdo3ERsKT3Do>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 05:35:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 2/3] drm/vc4: hdmi: Convert to the new clock request API
Date: Tue, 14 Sep 2021 11:35:14 +0200
Message-Id: <20210914093515.260031-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914093515.260031-1-maxime@cerno.tech>
References: <20210914093515.260031-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new clock request API allows us to increase the rate of the HSM
clock to match our pixel rate requirements while decreasing it when
we're done, resulting in a better power-efficiency.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a1115043114..099a94570e86 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -635,6 +635,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
+	clk_request_done(vc4_hdmi->bvb_req);
+	clk_request_done(vc4_hdmi->hsm_req);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
 	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
@@ -941,9 +943,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
 	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
-	if (ret) {
-		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
+	vc4_hdmi->hsm_req = clk_request_start(vc4_hdmi->hsm_clock, hsm_rate);
+	if (IS_ERR(vc4_hdmi->hsm_req)) {
+		DRM_ERROR("Failed to set HSM clock rate: %ld\n", PTR_ERR(vc4_hdmi->hsm_req));
 		return;
 	}
 
@@ -956,9 +958,10 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	else
 		bvb_rate = 75000000;
 
-	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
+	vc4_hdmi->bvb_req = clk_request_start(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
-		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
+		DRM_ERROR("Failed to set pixel bvb clock rate: %ld\n", PTR_ERR(vc4_hdmi->bvb_req));
+		clk_request_done(vc4_hdmi->hsm_req);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
 	}
@@ -966,6 +969,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
+		clk_request_done(vc4_hdmi->bvb_req);
+		clk_request_done(vc4_hdmi->hsm_req);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 33e9f665ab8e..683b2d8a3dca 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -176,6 +176,9 @@ struct vc4_hdmi {
 
 	struct reset_control *reset;
 
+	struct clk_request *bvb_req;
+	struct clk_request *hsm_req;
+
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
 };
-- 
2.31.1

