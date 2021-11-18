Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59345592F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931F56E9D3;
	Thu, 18 Nov 2021 10:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFF46E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 39A1C580917;
 Thu, 18 Nov 2021 05:38:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 18 Nov 2021 05:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3WRT3HJ4FEnb8
 IB8py4nFAKWpdEbh7dU/Hcx6aHEmR0=; b=MvZT21McHr1v4ZPQYPVTMyC4y+IBb
 lXifsKyzIeNSxIdIBdE34Sqc1zWPILWDW5p1MkCvRrx8GEDEtJ3CQIpllRVMP3Ug
 LbIS9ntXj60AxvvDTejX4VmjXJxPurHZ3KLbBBzKRwu1z0t9kAS3T7je47wyfkJ5
 MvjNg2J31br9R9Nov3HOatHyfRPo1tmKgAGp1UXsh8bq3Zv+DMw0WD3Q0T53VTCY
 5hT2PLT9wjENIgI5d6byxiMgfVbC3R9W56oxJDALBX9IovzLjOYCQ0s4PytdGTB/
 QkRyVRiiPVU/GPkPq2FaJYefmNidk5Kox5LvOAj/AWc8TtjVsQdPOWBYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3WRT3HJ4FEnb8IB8py4nFAKWpdEbh7dU/Hcx6aHEmR0=; b=XxOI5pWo
 tmmyAA5nm+rvalfhT0FuHuhiCechKObUBqdgAjhkQTCHEaneYKNuJUwAFxn9/AGV
 4c3MorfXiY4vmGPwAp7KlLDcrofs4H9WqsEiWqojnGQtaFXSqkqGMYgMQIe655e1
 OP5lJlKI75Hwnz6mD7FeI7ZtZO9GnDc0RqwAmeHCyozoSek8IM4z7z4pFPMDhUuQ
 frcHz0z9RGN78WlLGQI9hVfPg8/curmY65cMDok4+9MEW7Hbx7rYRLYZmrjd3dTv
 K8SU4f00mnUHbXX3ncgyLnJHxEGFHrM1Uls0wZspHZbZ+5nzQ9vT4fEq8cX3MH46
 0+Nr2lPRWbWHEQ==
X-ME-Sender: <xms:IS2WYcNRDLNDuQRpqLw91q1u7q-DQp3zpC-YnrYFfbVplArV9srgUA>
 <xme:IS2WYS8ebg-Re7Y2kA96UEdBtNf9G94X_Kr6-VB8zmQ2rhSfa2U0X1hi8-aV-soX5
 7v3Whg1pF4phh_wMzk>
X-ME-Received: <xmr:IS2WYTRstQ2BEdVDn0uDo6TUeqTJgZc_Di3UFAN5F65lowxyom8MAXjqjf8chJ7fmfZzKVN8-sq9fbs4EabFPvnjaLUYdoi0fxF4UuVq6sk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IS2WYUs2SfLfUOLnKEqTbAxwcwbaPC7czM-lKudZa6-VyGFfxzCzGA>
 <xmx:IS2WYUdEW0MOHayLjBVc4hn_jKbZaedPf6gUnxf-gDQ16IuWW26mNw>
 <xmx:IS2WYY14jrGodOtajry9pqGJu2WOHy_xIBj3MXk_Zr8-4gRUeDfnkQ>
 <xmx:IS2WYc5_FO51O4cGkTCNaxpnd_XWnYaqs2cOfsbPHDBmSyLG7epOZw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 03/13] drm/atomic: Add HDMI reset link helper
Date: Thu, 18 Nov 2021 11:38:04 +0100
Message-Id: <20211118103814.524670-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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

One solution would be to enable the scrambling-related bits again on
reconnection, but the HDMI 2.0 specification (Section 6.1.3.1 -
Scrambling Control) requires that the scrambling enable bit is set
before sending any scrambled video signal. Using that solution would
break that specification expectation.

Thus, we need to do a full modeset on the connector so that we disable
the video signal, enable the scrambling bit, and enable the video signal
again.

The i915 code was doing this already, so let's take its code and
convert it into a generic helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_helper.c | 109 ++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |   3 +
 2 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c0c6ec92820..9f3fcc65e66e 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -38,6 +38,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_scdc_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
@@ -3524,3 +3525,111 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 	return input_fmts;
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
+
+static int modeset_pipe(struct drm_crtc *crtc,
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
+/**
+ * drm_atomic_helper_connector_hdmi_reset_link() - Resets an HDMI link
+ * @connector: DRM connector we want to reset
+ * @ctx: Lock acquisition context
+ *
+ * This helper is here to restore the HDMI link state after the
+ * connector status has changed, typically when a TV has come out of
+ * suspend or when the HDMI cable has been disconnected and then
+ * reconnected.
+ *
+ * Returns:
+ * 0 on success, a negative error code otherwise.
+ */
+int drm_atomic_helper_connector_hdmi_reset_link(struct drm_connector *connector,
+						struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	u8 config;
+	int ret;
+
+	if (!connector)
+		return 0;
+
+	drm_WARN_ON(drm,
+		    (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA) &&
+		    (connector->connector_type != DRM_MODE_CONNECTOR_HDMIB));
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
+	if (!conn_state->hdmi_needs_high_tmds_ratio &&
+	    !conn_state->hdmi_needs_scrambling)
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
+	if (!!(config & SCDC_TMDS_BIT_CLOCK_RATIO_BY_40) ==
+	    conn_state->hdmi_needs_high_tmds_ratio &&
+	    !!(config & SCDC_SCRAMBLING_ENABLE) ==
+	    conn_state->hdmi_needs_scrambling)
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
+	return modeset_pipe(crtc, ctx);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_reset_link);
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11..d7727f9a6fe9 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -231,4 +231,7 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
+int drm_atomic_helper_connector_hdmi_reset_link(struct drm_connector *connector,
+						struct drm_modeset_acquire_ctx *ctx);
+
 #endif /* DRM_ATOMIC_HELPER_H_ */
-- 
2.33.1

