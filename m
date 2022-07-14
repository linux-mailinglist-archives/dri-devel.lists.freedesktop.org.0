Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E97574809
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C412B565;
	Thu, 14 Jul 2022 09:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D96D12AB41
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0714F32008C3;
 Thu, 14 Jul 2022 05:13:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 05:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657790000; x=1657876400; bh=49
 tRGl2La//pGO0hPDZ9cizcmDKqQyOcSFL8m7yun20=; b=OPH9+SrzvPrIXtK0da
 p/AToKlERtt4J7u7VS+3/hlB2cHvnYXI0x+5NhhU5FFTLsSxMZaCllKTZ9EiPLto
 IbI6o5Zk+dc/OZPRWfAXTErvzDW09l3REb2aEkVO4wLjt3g0lWdlhBY9F3Y1UqY5
 2IrpxhosCD78CBr5WIOys9vyIkyku8poNca8lOXRUrrSa5HjnjvaOnYWv2A35PNI
 8ZHiaduU0dKddyqINV5bQf5kJQ7l4GsH4PDDxxC3GFF+Hej73LNBT7GAU5TbXDxS
 nShbD04E/ynApaOZRnA7xx8solN6IFB63N9oelUHGkJEZ6PGWv7ckd5oM45m0nhW
 4zeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657790000; x=1657876400; bh=49tRGl2La//pG
 O0hPDZ9cizcmDKqQyOcSFL8m7yun20=; b=cF/G2lCnj6RFSJS5WoOv4+I/y6lE9
 vyXAzlSgKyzKGv/ii+R7EhTAQp2UKLtG+D6AGtZvrfPSY6l9zxGzb4D/M3UyDSHM
 z0C+sT5+herNLs6kl1voBBdMsBHHgPRurP+puCpiVB70Ju8qavjDxgPZmTszmiYB
 +7Dr9fFx0MWh0Yr6m41afrTKdjNi4Cm8vbHiCJG2v+pBqDYKW6ehDQXWhAQUc67m
 vxBoGrG5CMCbHzw1uSTTuiMydWtkgZg27Vx7ZJPm0caZycjPALzUEQB2F7X+DoD3
 VEeV5a0A3Jhj5KkY7DsylgDRi2cNm1qc0/SBehoBjVvcYKXjsfWSRl4rA==
X-ME-Sender: <xms:MN7PYtehoMIs5mSuJ848Y3Q7uI2ppiFiN-UCPmKEju7-gJEx469YKQ>
 <xme:MN7PYrMu9hu0LxAOgov4zvtLiSpEuYKJskoMxRtr58dnKXfO8tiaTGgzNl7b2y2mh
 aF7nvidPQ_BhsjInb8>
X-ME-Received: <xmr:MN7PYmgMK1QZJcdlE41o0KxcG4r4ogr9ZyLGrZA2d7kaP5gOQGsgJPCyR-KkF8SOrCFZhPSPH_RzThxeiAzs21ZRgYpGnrxkH35Fiqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MN7PYm8kPWi6MrDWQnkDUBbBotBEcgeNlYAJACzdLsMhQLrwl8zDDw>
 <xmx:MN7PYpsBXGXgG1XFU9ba-6jByQlYeiUPYJGkhiTfXH0-z34PY6_TrQ>
 <xmx:MN7PYlGNaDfjb7Cngz6ru044n5o4Bchn5zS6yWhCalFdmaE5dJGGPw>
 <xmx:MN7PYvI-MDGEVoYENQV3AFFSt_jOQGMjn-ATjzBA341aG6OeJTjQEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 7/8] drm/vc4: hdmi: Reset link on hotplug
Date: Thu, 14 Jul 2022 11:12:51 +0200
Message-Id: <20220714091252.2089015-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a hotplug cycle (such as a TV going out of suspend, or when the
cable is disconnected and reconnected), the expectation is that the same
state used before the disconnection is reused until the next commit.

However, the HDMI scrambling requires that some flags are set in the
monitor, and those flags are very likely to be reset when the cable has
been disconnected. This will thus result in a blank display, even if the
display pipeline configuration hasn't been modified or is in the exact
same state.

The solution we've had so far is to enable the scrambling-related bits
again on reconnection, but the HDMI 2.0 specification (Section 6.1.3.1 -
Scrambling Control) requires that the scrambling enable bit is set
before sending any scrambled video signal. Using that solution thus
breaks that expectation.

The solution used by i915 is to do a full modeset on the connector so
that we disable the video signal, enable the scrambling bit, and enable
the video signal again.

As such, we took that code and plugged it into vc4. It probably could
have been turned into an helper, but it proved to be difficult for
several reasons:

  * i915 has fairly different structures than simpler KMS drivers such
    as vc4, so doing some code that works with both proved to be
    difficult;

  * Other simpler drivers could reuse some of it (tegra, dw-hdmi), but
    it would still require to move some parameters currently stored in
    private structure that are needed to compute whether the scrambling
    is needed or not, and then inform the driver that it needs to be
    enabled. Some of those parameters are already in core structures
    (drm_display_mode, drm_display_info, bpc), but the output format
    isnt't. Adding it is fairly challenging since unlike the TMDS char
    rate or mode, there's no consensus on what format to pick in
    drivers, so it's not possible to write some generic code that can
    depend on it.

For these reasons, we chose to duplicate the code for now, until someone
else really needs it as well, in which case we will be able to convert
it into a generic helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 104 ++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2d988c73d12b..f136efe32047 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -242,9 +242,103 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
+static int reset_pipe(struct drm_crtc *crtc,
+			struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_atomic_state_alloc(crtc->dev);
+	if (!state)
+		return -ENOMEM;
+
+	state->acquire_ctx = ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto out;
+	}
+
+	crtc_state->connectors_changed = true;
+
+	ret = drm_atomic_commit(state);
+out:
+	drm_atomic_state_put(state);
+
+	return ret;
+}
+
+static int vc4_hdmi_reset_link(struct drm_connector *connector,
+			       struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *drm = connector->dev;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	bool scrambling_needed;
+	u8 config;
+	int ret;
+
+	if (!connector)
+		return 0;
+
+	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
+	if (ret)
+		return ret;
+
+	conn_state = connector->state;
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	ret = drm_modeset_lock(&crtc->mutex, ctx);
+	if (ret)
+		return ret;
+
+	crtc_state = crtc->state;
+	if (!crtc_state->active)
+		return 0;
+
+	if (!vc4_hdmi_supports_scrambling(encoder))
+		return 0;
+
+	scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
+							   vc4_hdmi->output_bpc,
+							   vc4_hdmi->output_format);
+	if (!scrambling_needed)
+		return 0;
+
+	if (conn_state->commit &&
+	    !try_wait_for_completion(&conn_state->commit->hw_done))
+		return 0;
+
+	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
+	if (ret < 0) {
+		drm_err(drm, "Failed to read TMDS config: %d\n", ret);
+		return 0;
+	}
+
+	if (!!(config & SCDC_SCRAMBLING_ENABLE) == scrambling_needed)
+		return 0;
+
+	/*
+	 * HDMI 2.0 says that one should not send scrambled data
+	 * prior to configuring the sink scrambling, and that
+	 * TMDS clock/data transmission should be suspended when
+	 * changing the TMDS clock rate in the sink. So let's
+	 * just do a full modeset here, even though some sinks
+	 * would be perfectly happy if were to just reconfigure
+	 * the SCDC settings on the fly.
+	 */
+	return reset_pipe(crtc, ctx);
+}
 
 static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
+				    struct drm_modeset_acquire_ctx *ctx,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
@@ -257,6 +351,10 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * .adap_enable, which leads to that funtion being called with
 	 * our mutex held.
 	 *
+	 * A similar situation occurs with
+	 * drm_atomic_helper_connector_hdmi_reset_link() that will call
+	 * into our KMS hooks if the scrambling was enabled.
+	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
 	 * the lock for now.
@@ -277,7 +375,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	kfree(edid);
 
-	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+	vc4_hdmi_reset_link(connector, ctx);
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
@@ -309,7 +407,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return status;
-- 
2.36.1

