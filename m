Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34129443118
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBEE72E77;
	Tue,  2 Nov 2021 15:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5AC72E67
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A55EB58074F;
 Tue,  2 Nov 2021 10:59:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 10:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SXBIm86j0pqm5
 5jTQj8YmXi08inHuWsfso5gtk94vbY=; b=UzCPWoS2CVe7/7qg2Caz7zOjeQwws
 lEL9LJ4nIJy2w0jdrwm3iw3fx+FQtjCHEZlsnhbIGQoJ/tAfYC8Niq2Z2cJyxBhY
 taEk2jM+yR2Fkrecwbs4p0E8S9gKXC6mUWeg0/oN32Z1Z5cbyaMBXeycPh+h9aKt
 M8VsIWa7hhI2CVei8/k0jua7oFxk5OZbo0ahi1lE6IVcVaPj1Cxo87PIM2go53m2
 bObJKKjQetcvb9NocXTX0IiXk/cbXtNMW0yFfn6q2OXct0aVQiB2ja5AtFbGmsue
 oUNoWGvP2qt6TYyf/NvuZNUec9moiszEQ5G/LKvVUzeiF1S8NPxfxuq4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SXBIm86j0pqm55jTQj8YmXi08inHuWsfso5gtk94vbY=; b=FtdXnaDi
 +QalmBhu2UJxi1/xhKt2WcrWfLyZUMpAjXFYWQlEdQy4wzwmTlaqtfnOKw3aR7YN
 ZQae010mJcJXFFEONSRujPmpSVosO28V9XPw3SUg5iPIiyAZwKkVsLm8sFsprq0m
 AppFQ1wliUzoh+z8UG+HL9LApMDtIh3SSfOb/t3xwplvVMrqMS6JVi+5nnZlFmOf
 irZlDuKEyceLOGm7XBPA/zii7bd4wFSi4LNDm5KMJ3sfGBS7q4AYluHF2i1ntqLS
 LVDejQPBOszgZS08DdT1zDyvNDEEikZXJeZ6VcCQxIjfAIXj4boxEAM7xP5K7Mr2
 /wCk3NDY/aSIzQ==
X-ME-Sender: <xms:b1KBYUMjMKyi6ELKSiZ9P9qjN_OygnKtk0AsWK_X1qZCoeyROtXT0g>
 <xme:b1KBYa9R53M5kldirhzsb1vD8UxlqRcP5L70iitI4x8vICq6BiL3cKU70Etttdtsy
 ZIIg4yKrUesVS77seM>
X-ME-Received: <xmr:b1KBYbRZlTOAoXQOcXsxA8nzoqI6wr9XumkqbExjzhUAKA8R0Fy9O8O6cJXmXSCQyeecgvvzE3lvcpNtm-uO3CpGGQh9_qdW8ObN_u9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b1KBYctVAjQZMmJACFNpFpIYPCLWQLUHUhXm3tlYLDwq5NCMZyVxyQ>
 <xmx:b1KBYceteptJ9HNePIhm7zQjpoe0vHGDopd5QlN-LEYSNDUbV4fNXA>
 <xmx:b1KBYQ1kt7HZKhi5bhLtnrwRPQtd7Y1meerkp70JpInCLdwawdlKDA>
 <xmx:b1KBYU5_VFZgdjUSaYjwlQ3GCkElAOlvZZLEEPpPFkut1IFJLS7J-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:59:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/13] drm/atomic: Add HDMI reset link helper
Date: Tue,  2 Nov 2021 15:59:35 +0100
Message-Id: <20211102145944.259181-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
2.32.0

