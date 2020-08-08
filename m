Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC823F955
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 00:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F326E2B1;
	Sat,  8 Aug 2020 22:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7606E2A3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 22:31:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so5794806ljo.12
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilSAsGJw2zEAe3E5tlzP/pTSNr9F18NvYED5QqBubwg=;
 b=YOji09vu/R97BrbTxRg8n1F5iYACbQpI45D5eRDXfdGca2XOMXptKE7jVsd+yii2fm
 s3wy1UibHu+0vZEQSF8UyTpNiiwQac3GobmGfL+f8gfWOkIlaO1seYZaMS6j3F/HDSyR
 kLC8TVEL6U/JU+Q0Fe8pikEvBNET1TKQ5KsNA2HqzcZpKWyEXJjxsE4WtBSbgtzjrEuD
 rdxucksRvZ+gsswrGEbZjRXdc0aWa/I4FwTlBy3O/2HSNKrhPd9KCyxy6hO+R7G09Jap
 aPOCyUPj9pBwKlYbi80UUalaenccW+18K8TbLO57a2kz/jDIrlDSBtAfLxt2ICEEl6IO
 iIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilSAsGJw2zEAe3E5tlzP/pTSNr9F18NvYED5QqBubwg=;
 b=MYm2PRW6FY4vcnlCEIvMtkgoc4VySpR6xNwrH9HOkjuY93oJdwKZDyY6CJsXRMpA1D
 Y6N2WLjJ9yFjIVxjpebFleIEIHRbZLs9u5eAR19joAedR23zyQ97q2gCmHfzXPPqSXfg
 NSs9hiWJNa/LR80Q/TYfJZRDFk7tkUqc57b+cw6nILxXBKm+GCgacA68as58XZPXyX2J
 p5sAJ03hL2m7ELfnPlhOILh/2L7x6RTAVoEf3h+6qrII6B33yrFTZ+ENI8yHRekw0E4f
 IFIMiLmT5n/utym7ESjiHybx+qWIXuoX8Lx3wrd39x4MoCIac8AolTeJU96bKCPpAyL8
 TqIQ==
X-Gm-Message-State: AOAM5310UbApuLKPTjzOlVn5Ie9Xq43pG718L7i2k/sS0Pj+JQFNR1a5
 PVc/7sufI6I6K/1rY+Tzk5TlUWZtHDtBaA==
X-Google-Smtp-Source: ABdhPJzob9rAzb5rIdx/ecxkmVVoaq35KCWo07n3B3iuMyIc2Mj9FJ6p30BA9BkBlz3lJB2U+q+bIw==
X-Received: by 2002:a2e:9913:: with SMTP id v19mr8548256lji.292.1596925890888; 
 Sat, 08 Aug 2020 15:31:30 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x4sm5803827ljd.34.2020.08.08.15.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:31:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 4/4 v2] drm/mcde: Enable the DSI link with display
Date: Sun,  9 Aug 2020 00:31:22 +0200
Message-Id: <20200808223122.1492124-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808223122.1492124-1-linus.walleij@linaro.org>
References: <20200808223122.1492124-1-linus.walleij@linaro.org>
MIME-Version: 1.0
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
Cc: newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MCDE DSI link hardware which is modeled like a bridge
in DRM, connected further to the panel bridge, creating
a pipeline.

We have been using the .pre_enable(), .enable(),
.disable() and .post_disable() callbacks from the bridge
to set this up in a chained manner: first the display
controller goes online and then in successive order
each bridge in the pipeline. Inside DRM it works
like this:

drm_atomic_helper_commit_tail()
  drm_atomic_helper_commit_modeset_enables()
    struct drm_crtc_helper_funcs .atomic_enable()
      struct drm_simple_display_pipe_funcs .enable()
        MCDE display enable call
    drm_atomic_bridge_chain_enable()
      struct drm_bridge_funcs .pre_enable()
        mcde_dsi_bridge_pre_enable()
        panel_bridge_pre_enable()
          struct drm_panel_funcs .prepare()
      struct drm_bridge_funcs .enable()
        mcde_dsi_bridge_enable()
        panel_bridge_enable()
          struct drm_panel_funcs .enable()

A similar sequence is executed for disabling.

Unfortunately this is not what the hardware needs: at
a certain stage in the enablement of the display
controller the DSI link needs to come up to support
video mode, else something (like a FIFO flow) locks
up the hardware and we never get picture.

Fix this by simply leaving the pre|enable and
post|disable callbacks unused, and establish two
cross-calls from the display controller to bring up
the DSI link at the right place in the display
bring-up sequence and vice versa in the shutdown
sequence.

For command mode displays, it works just fine to
also enable the display flow early. The only time
we hold it back right now is in one-shot mode,
on-demand display updates.

When combined with the previous patch and some patches
for the S6E63M0 display controller to support DSI
mode, this gives working display on the Samsung
GT-I8190 (Golden) phone. It has also been tested working
on the Samsung GT-S7710 (Skomer) phone.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 36 +++++++++++++++++------
 drivers/gpu/drm/mcde/mcde_drm.h     |  2 ++
 drivers/gpu/drm/mcde/mcde_dsi.c     | 44 +++++++++++------------------
 3 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index d608cc894e01..c271e5bf042e 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -999,6 +999,16 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	mcde_configure_fifo(mcde, MCDE_FIFO_A, MCDE_DSI_FORMATTER_0,
 			    fifo_wtrmrk);
 
+	/*
+	 * This brings up the DSI bridge which is tightly connected
+	 * to the MCDE DSI formatter.
+	 *
+	 * FIXME: if we want to use another formatter, such as DPI,
+	 * we need to be more elaborate here and select the appropriate
+	 * bridge.
+	 */
+	mcde_dsi_enable(mcde->bridge);
+
 	/* Configure the DSI formatter 0 for the DSI panel output */
 	mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
 				     formatter_frame, pkt_size);
@@ -1025,16 +1035,20 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 
 	drm_crtc_vblank_on(crtc);
 
-	if (mcde_flow_is_video(mcde)) {
-		/*
-		 * Keep FIFO permanently enabled in video mode,
-		 * otherwise MCDE will stop feeding data to the panel.
-		 */
+	/*
+	 * If we're using oneshot mode we don't start the flow
+	 * until each time the display is given an update, and
+	 * then we disable it immediately after. For all other
+	 * modes (command or video) we start the FIFO flow
+	 * right here. This is necessary for the hardware to
+	 * behave right.
+	 */
+	if (mcde->flow_mode != MCDE_COMMAND_ONESHOT_FLOW) {
 		mcde_enable_fifo(mcde, MCDE_FIFO_A);
 		dev_dbg(mcde->dev, "started MCDE video FIFO flow\n");
 	}
 
-	/* Enable automatic clock gating */
+	/* Enable MCDE with automatic clock gating */
 	val = readl(mcde->regs + MCDE_CR);
 	val |= MCDE_CR_MCDEEN | MCDE_CR_AUTOCLKG_EN;
 	writel(val, mcde->regs + MCDE_CR);
@@ -1055,6 +1069,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	/* Disable FIFO A flow */
 	mcde_disable_fifo(mcde, MCDE_FIFO_A, true);
 
+	/* This disables the DSI bridge */
+	mcde_dsi_disable(mcde->bridge);
+
 	event = crtc->state->event;
 	if (event) {
 		crtc->state->event = NULL;
@@ -1164,8 +1181,11 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	if (fb) {
 		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
 		dev_info_once(mcde->dev, "first update of display contents\n");
-		/* The flow is already active in video mode */
-		if (!mcde_flow_is_video(mcde) && mcde->flow_active == 0)
+		/*
+		 * Usually the flow is already active, unless we are in
+		 * oneshot mode, then we need to kick the flow right here.
+		 */
+		if (mcde->flow_active == 0)
 			mcde_start_flow(mcde);
 	} else {
 		/*
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 9f197f4e9ced..8253e2f9993e 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -97,6 +97,8 @@ static inline bool mcde_flow_is_video(struct mcde *mcde)
 
 bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
 void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
+void mcde_dsi_enable(struct drm_bridge *bridge);
+void mcde_dsi_disable(struct drm_bridge *bridge);
 extern struct platform_driver mcde_dsi_driver;
 
 void mcde_display_irq(struct mcde *mcde);
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 0d7ebb59b727..a46a45c5cd52 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -844,23 +844,11 @@ static void mcde_dsi_start(struct mcde_dsi *d)
 	dev_info(d->dev, "DSI link enabled\n");
 }
 
-
-static void mcde_dsi_bridge_enable(struct drm_bridge *bridge)
-{
-	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
-	u32 val;
-
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		/* Enable video mode */
-		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
-		val |= DSI_MCTL_MAIN_DATA_CTL_VID_EN;
-		writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
-	}
-
-	dev_info(d->dev, "enable DSI master\n");
-};
-
-static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+/*
+ * Notice that this is called from inside the display controller
+ * and not from the bridge callbacks.
+ */
+void mcde_dsi_enable(struct drm_bridge *bridge)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	unsigned long hs_freq, lp_freq;
@@ -938,6 +926,11 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 		val |= DSI_VID_MODE_STS_CTL_ERR_MISSING_VSYNC;
 		val |= DSI_VID_MODE_STS_CTL_ERR_MISSING_DATA;
 		writel(val, d->regs + DSI_VID_MODE_STS_CTL);
+
+		/* Enable video mode */
+		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
+		val |= DSI_MCTL_MAIN_DATA_CTL_VID_EN;
+		writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
 	} else {
 		/* Command mode, clear IF1 ID */
 		val = readl(d->regs + DSI_CMD_MODE_CTL);
@@ -950,6 +943,8 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 		val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
 		writel(val, d->regs + DSI_CMD_MODE_CTL);
 	}
+
+	dev_info(d->dev, "enabled MCDE DSI master\n");
 }
 
 static void mcde_dsi_bridge_mode_set(struct drm_bridge *bridge,
@@ -1012,7 +1007,11 @@ static void mcde_dsi_wait_for_video_mode_stop(struct mcde_dsi *d)
 	}
 }
 
-static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
+/*
+ * Notice that this is called from inside the display controller
+ * and not from the bridge callbacks.
+ */
+void mcde_dsi_disable(struct drm_bridge *bridge)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	u32 val;
@@ -1027,11 +1026,6 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 		/* Stop command mode */
 		mcde_dsi_wait_for_command_mode_stop(d);
 	}
-}
-
-static void mcde_dsi_bridge_post_disable(struct drm_bridge *bridge)
-{
-	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 
 	/*
 	 * Stop clocks and terminate any DSI traffic here so the panel can
@@ -1070,10 +1064,6 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
 	.attach = mcde_dsi_bridge_attach,
 	.mode_set = mcde_dsi_bridge_mode_set,
-	.disable = mcde_dsi_bridge_disable,
-	.enable = mcde_dsi_bridge_enable,
-	.pre_enable = mcde_dsi_bridge_pre_enable,
-	.post_disable = mcde_dsi_bridge_post_disable,
 };
 
 static int mcde_dsi_bind(struct device *dev, struct device *master,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
