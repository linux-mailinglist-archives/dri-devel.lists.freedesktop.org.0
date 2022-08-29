Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE05A4E7D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E5410F2A8;
	Mon, 29 Aug 2022 13:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65E410F2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7528E32004CE;
 Mon, 29 Aug 2022 09:48:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780896; x=1661867296; bh=k1
 AFbr1RpW7/E4mqaSBi+oqOyDuhsIcZHMpv6rQZqZU=; b=Sab88IHGJ6CYIc9EYB
 J0zJQwYQTcHHuWFoHDs8IDUkFXP+5euqptiWHYO9VeimIlZD7p+awbwWGVfxccYJ
 r84lXO1/Dt6wLa9qgHS4dyRj4eg1abDnDUIH5YkqcN3fqGd6vNJyIZhYsE2/0FvQ
 LPALxvYxmqyiUysED/3iVzwJwCj4jocyElIdYwGfqnlr3G7B4ukV3wLnmCSQcd/A
 rGO3qmq3di4I4NxKsEvEk2EDo3RfIU31BeImTnr4RHv2MepjfoZbAaA5w1sOTLjY
 YATJTULzfL9YedwdQdu6ysrMBjlMkc0BSP4HAKtoJkphFAgW5mIKr/vIjoUJ/bNk
 TH3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780896; x=1661867296; bh=k1AFbr1RpW7/E
 4mqaSBi+oqOyDuhsIcZHMpv6rQZqZU=; b=SBZhti2H1991DfM9X6yv9Qt5YQKlB
 PD2IS8UZa0+gCJ9gQi6uMXSi/MKkGuQiH1C0+Xpu389aLRKZUMU8bX68XTbXvqdD
 oBNj/qwOohQuxcXg30yAcodFBV0rXigKPBFPcVQ84aHlTtm9m/AZGsTS3QnnZfaE
 AWEsrlUfj+JaffUhgLKRrQMhDsXBm9kkIT3hHFrXbsP7tsmCZsYxdenoz0AZ+1r8
 Wzct3gjojuJFD8Glc8ltoDAOv6Fvg/K7AX+EMmbiOWqTWkDaYFgQEaA2129Lp9AS
 D2EG6KSDwg10JDZhOk9GMsmKZYdmApzky0d7ibNWLSn0a1SxUflwXRcaw==
X-ME-Sender: <xms:oMMMYxPJcXsj0GEYP-B4eUDVJvzQjeu9sJ1gj0NaXnlx762DPp1ZGA>
 <xme:oMMMYz_Lk-lJSCzhtteeqM8bHaSwa6j9rEebGCW0QeMUDgqLL-XfeDpGOqvcXrCcP
 dunszQxsv0W-UexjCg>
X-ME-Received: <xmr:oMMMYwR8_DOTwvcS2_w6E8zug185GaMOG9drYZzPAi3rByKGEuneDuh6IKka>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oMMMY9vRfwpdrLNkKkLg1cyeg9eaDRI_waZUBjq7re4iXzIGbTObrQ>
 <xmx:oMMMY5fgHuumcuwaBAun-NFJ1s0FrOoSWn5_0SKW3Kr4jVYaSbFIlQ>
 <xmx:oMMMY53mB1hbAjBjE391csZdz9ap3WlXk6ZYc5FwCA_le6cJBHbjog>
 <xmx:oMMMY14faf5trQ9TdmMkP1Lgud2DpNYfPfy_cCq20321ww6qeKYSGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:48:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 7/8] drm/vc4: hdmi: Reset link on hotplug
Date: Mon, 29 Aug 2022 15:47:30 +0200
Message-Id: <20220829134731.213478-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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
index a510da7462fd..1b3131947a5b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -288,9 +288,103 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
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
@@ -303,6 +397,10 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -323,7 +421,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
 	kfree(edid);
 
-	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+	vc4_hdmi_reset_link(connector, ctx);
 }
 
 static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
@@ -355,7 +453,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 			status = connector_status_connected;
 	}
 
-	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
+	vc4_hdmi_handle_hotplug(vc4_hdmi, ctx, status);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return status;
-- 
2.37.1

