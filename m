Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A424064F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858E8897D4;
	Mon, 10 Aug 2020 13:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5FC897D4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:03:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q76so8259318wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wQn0Qfgwudsh6MJH2FzG0omU21OOba4T9OVfNii3hmE=;
 b=BfaFZXoSbrPWxSC4pHC6xL/Yd3rlupukzXq9QZv8oTmr8eZUU1KHdzQjnTkOMaMqJX
 swaR655D3vK3xKUf+VIz0UCpG8Uk6DuehaC11vlA2tipjGci2l5bU4L164KF2WuVBAR5
 xpeDGxdjhXVK0aLHIEWpUpTZu58Dhz9uTR6rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQn0Qfgwudsh6MJH2FzG0omU21OOba4T9OVfNii3hmE=;
 b=X/aUBPLPBKDFHBxCaubEombnyp3GaErNuPQbBJNkLa7kx+uAor5Wwx6OvsOjqoHwKK
 E87Rwl91BysKDUjwSO9TrALS4UTL3rDr9eTw/T8cmA9r/blJbYEKJkgVMg/Fsaf6l/sN
 gJbtDRWylnkxg8kZHvd/Bo5mZ/FRMnZQL3efuXdDf0WHat9VaQwbFqR4OtSLYPSef6m4
 sfum4/U7HpsaVtsYP2ZNPxwCEYeNa0mGgySQvOgTym9dTVttC+V+LO9y9ux0QKZDC8Yx
 VaNVRZpNG5yWZa2ObrhXQd3OVc2kPpVQoUdNlQIGM3v99pmQwA+BrIjVoD4ylxP3Wev2
 2K6w==
X-Gm-Message-State: AOAM533ksgoNEVYzmeEhDoWMB4D6Ft0mqTxNBk17ObdT6y7caeev8l5p
 hI8bPQic2anZ3OhAMuxBpSE0lw==
X-Google-Smtp-Source: ABdhPJzsnrTSpuEhcToivOHKN7esjsNgEYOoqcWZWIbbY6y4OuN9leVnemjriukqwc4fNXHzgLwXMQ==
X-Received: by 2002:a1c:493:: with SMTP id 141mr26540966wme.131.1597064613772; 
 Mon, 10 Aug 2020 06:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f15sm20720481wmj.39.2020.08.10.06.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:03:32 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:03:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4 v2] drm/mcde: Enable the DSI link with display
Message-ID: <20200810130330.GQ2352366@phenom.ffwll.local>
References: <20200808223122.1492124-1-linus.walleij@linaro.org>
 <20200808223122.1492124-4-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808223122.1492124-4-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Stephan Gerhold <stephan@gerhold.net>, newbytee@protonmail.com,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 09, 2020 at 12:31:22AM +0200, Linus Walleij wrote:
> The MCDE DSI link hardware which is modeled like a bridge
> in DRM, connected further to the panel bridge, creating
> a pipeline.
> 
> We have been using the .pre_enable(), .enable(),
> .disable() and .post_disable() callbacks from the bridge
> to set this up in a chained manner: first the display
> controller goes online and then in successive order
> each bridge in the pipeline. Inside DRM it works
> like this:
> 
> drm_atomic_helper_commit_tail()
>   drm_atomic_helper_commit_modeset_enables()
>     struct drm_crtc_helper_funcs .atomic_enable()
>       struct drm_simple_display_pipe_funcs .enable()
>         MCDE display enable call
>     drm_atomic_bridge_chain_enable()
>       struct drm_bridge_funcs .pre_enable()
>         mcde_dsi_bridge_pre_enable()
>         panel_bridge_pre_enable()
>           struct drm_panel_funcs .prepare()
>       struct drm_bridge_funcs .enable()
>         mcde_dsi_bridge_enable()
>         panel_bridge_enable()
>           struct drm_panel_funcs .enable()
> 
> A similar sequence is executed for disabling.
> 
> Unfortunately this is not what the hardware needs: at
> a certain stage in the enablement of the display
> controller the DSI link needs to come up to support
> video mode, else something (like a FIFO flow) locks
> up the hardware and we never get picture.
> 
> Fix this by simply leaving the pre|enable and
> post|disable callbacks unused, and establish two
> cross-calls from the display controller to bring up
> the DSI link at the right place in the display
> bring-up sequence and vice versa in the shutdown
> sequence.
> 
> For command mode displays, it works just fine to
> also enable the display flow early. The only time
> we hold it back right now is in one-shot mode,
> on-demand display updates.
> 
> When combined with the previous patch and some patches
> for the S6E63M0 display controller to support DSI
> mode, this gives working display on the Samsung
> GT-I8190 (Golden) phone. It has also been tested working
> on the Samsung GT-S7710 (Skomer) phone.
> 
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

So the idea kinda was that if you need this, you'd write your own modeset
code. That's why atomic helpers are fairly modular. Then you can place the
various drm_bridge_enable/disable calls exactly where you need them to
make your upstream blocks happy.

You could even do that with simple pipe helpers by overwriting the
atomic_commit_tail function with your special enable/disable sequence.
Since you have simple hw this would look something like:

static void mcde_helper_commit_tail(struct drm_atomic_state *old_state)
{
	struct drm_device *dev = old_state->dev;
	bool fence_cookie = dma_fence_begin_signalling();

	mcde_display_disable(...)

	drm_atomic_helper_commit_planes(dev, old_state, 0);

	mcde_display_enable(....)

	drm_atomic_helper_fake_vblank(old_state);

	drm_atomic_helper_commit_hw_done(old_state);

	dma_fence_end_signalling(fence_cookie);

	drm_atomic_helper_wait_for_vblanks(dev, old_state);

	drm_atomic_helper_cleanup_planes(dev, old_state);
}

And mcde_display_enable/disable would then call into bridges and anything
else you need to be called.

Anyway just an idea, for patches 2-4:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 36 +++++++++++++++++------
>  drivers/gpu/drm/mcde/mcde_drm.h     |  2 ++
>  drivers/gpu/drm/mcde/mcde_dsi.c     | 44 +++++++++++------------------
>  3 files changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index d608cc894e01..c271e5bf042e 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -999,6 +999,16 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>  	mcde_configure_fifo(mcde, MCDE_FIFO_A, MCDE_DSI_FORMATTER_0,
>  			    fifo_wtrmrk);
>  
> +	/*
> +	 * This brings up the DSI bridge which is tightly connected
> +	 * to the MCDE DSI formatter.
> +	 *
> +	 * FIXME: if we want to use another formatter, such as DPI,
> +	 * we need to be more elaborate here and select the appropriate
> +	 * bridge.
> +	 */
> +	mcde_dsi_enable(mcde->bridge);
> +
>  	/* Configure the DSI formatter 0 for the DSI panel output */
>  	mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
>  				     formatter_frame, pkt_size);
> @@ -1025,16 +1035,20 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>  
>  	drm_crtc_vblank_on(crtc);
>  
> -	if (mcde_flow_is_video(mcde)) {
> -		/*
> -		 * Keep FIFO permanently enabled in video mode,
> -		 * otherwise MCDE will stop feeding data to the panel.
> -		 */
> +	/*
> +	 * If we're using oneshot mode we don't start the flow
> +	 * until each time the display is given an update, and
> +	 * then we disable it immediately after. For all other
> +	 * modes (command or video) we start the FIFO flow
> +	 * right here. This is necessary for the hardware to
> +	 * behave right.
> +	 */
> +	if (mcde->flow_mode != MCDE_COMMAND_ONESHOT_FLOW) {
>  		mcde_enable_fifo(mcde, MCDE_FIFO_A);
>  		dev_dbg(mcde->dev, "started MCDE video FIFO flow\n");
>  	}
>  
> -	/* Enable automatic clock gating */
> +	/* Enable MCDE with automatic clock gating */
>  	val = readl(mcde->regs + MCDE_CR);
>  	val |= MCDE_CR_MCDEEN | MCDE_CR_AUTOCLKG_EN;
>  	writel(val, mcde->regs + MCDE_CR);
> @@ -1055,6 +1069,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>  	/* Disable FIFO A flow */
>  	mcde_disable_fifo(mcde, MCDE_FIFO_A, true);
>  
> +	/* This disables the DSI bridge */
> +	mcde_dsi_disable(mcde->bridge);
> +
>  	event = crtc->state->event;
>  	if (event) {
>  		crtc->state->event = NULL;
> @@ -1164,8 +1181,11 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>  	if (fb) {
>  		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
>  		dev_info_once(mcde->dev, "first update of display contents\n");
> -		/* The flow is already active in video mode */
> -		if (!mcde_flow_is_video(mcde) && mcde->flow_active == 0)
> +		/*
> +		 * Usually the flow is already active, unless we are in
> +		 * oneshot mode, then we need to kick the flow right here.
> +		 */
> +		if (mcde->flow_active == 0)
>  			mcde_start_flow(mcde);
>  	} else {
>  		/*
> diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
> index 9f197f4e9ced..8253e2f9993e 100644
> --- a/drivers/gpu/drm/mcde/mcde_drm.h
> +++ b/drivers/gpu/drm/mcde/mcde_drm.h
> @@ -97,6 +97,8 @@ static inline bool mcde_flow_is_video(struct mcde *mcde)
>  
>  bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
>  void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
> +void mcde_dsi_enable(struct drm_bridge *bridge);
> +void mcde_dsi_disable(struct drm_bridge *bridge);
>  extern struct platform_driver mcde_dsi_driver;
>  
>  void mcde_display_irq(struct mcde *mcde);
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 0d7ebb59b727..a46a45c5cd52 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -844,23 +844,11 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>  	dev_info(d->dev, "DSI link enabled\n");
>  }
>  
> -
> -static void mcde_dsi_bridge_enable(struct drm_bridge *bridge)
> -{
> -	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
> -	u32 val;
> -
> -	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -		/* Enable video mode */
> -		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
> -		val |= DSI_MCTL_MAIN_DATA_CTL_VID_EN;
> -		writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
> -	}
> -
> -	dev_info(d->dev, "enable DSI master\n");
> -};
> -
> -static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +/*
> + * Notice that this is called from inside the display controller
> + * and not from the bridge callbacks.
> + */
> +void mcde_dsi_enable(struct drm_bridge *bridge)
>  {
>  	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
>  	unsigned long hs_freq, lp_freq;
> @@ -938,6 +926,11 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
>  		val |= DSI_VID_MODE_STS_CTL_ERR_MISSING_VSYNC;
>  		val |= DSI_VID_MODE_STS_CTL_ERR_MISSING_DATA;
>  		writel(val, d->regs + DSI_VID_MODE_STS_CTL);
> +
> +		/* Enable video mode */
> +		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
> +		val |= DSI_MCTL_MAIN_DATA_CTL_VID_EN;
> +		writel(val, d->regs + DSI_MCTL_MAIN_DATA_CTL);
>  	} else {
>  		/* Command mode, clear IF1 ID */
>  		val = readl(d->regs + DSI_CMD_MODE_CTL);
> @@ -950,6 +943,8 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
>  		val &= ~DSI_CMD_MODE_CTL_IF1_ID_MASK;
>  		writel(val, d->regs + DSI_CMD_MODE_CTL);
>  	}
> +
> +	dev_info(d->dev, "enabled MCDE DSI master\n");
>  }
>  
>  static void mcde_dsi_bridge_mode_set(struct drm_bridge *bridge,
> @@ -1012,7 +1007,11 @@ static void mcde_dsi_wait_for_video_mode_stop(struct mcde_dsi *d)
>  	}
>  }
>  
> -static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
> +/*
> + * Notice that this is called from inside the display controller
> + * and not from the bridge callbacks.
> + */
> +void mcde_dsi_disable(struct drm_bridge *bridge)
>  {
>  	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
>  	u32 val;
> @@ -1027,11 +1026,6 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
>  		/* Stop command mode */
>  		mcde_dsi_wait_for_command_mode_stop(d);
>  	}
> -}
> -
> -static void mcde_dsi_bridge_post_disable(struct drm_bridge *bridge)
> -{
> -	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
>  
>  	/*
>  	 * Stop clocks and terminate any DSI traffic here so the panel can
> @@ -1070,10 +1064,6 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
>  	.attach = mcde_dsi_bridge_attach,
>  	.mode_set = mcde_dsi_bridge_mode_set,
> -	.disable = mcde_dsi_bridge_disable,
> -	.enable = mcde_dsi_bridge_enable,
> -	.pre_enable = mcde_dsi_bridge_pre_enable,
> -	.post_disable = mcde_dsi_bridge_post_disable,
>  };
>  
>  static int mcde_dsi_bind(struct device *dev, struct device *master,
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
