Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468319A53EC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B310E2C5;
	Sun, 20 Oct 2024 11:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dwvb/dr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B610E2C5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:57:37 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb5be4381dso35925341fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729425456; x=1730030256; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5O0yOz3cWb1IQD7Tg15vbiZe6MI3K0GYtKBYpCEEezg=;
 b=dwvb/dr0hYvLFFnaOFAfmPdd0vtaS+Y17EbJNMASxUX3fGiRQsWUMvlIT+5aj9un0o
 G6YrroALzU+/KDly1t6eLEs80RFdwDVDD+k0Fkch9/gNPsFsgHxzCkFwOFYVg6Ff9tFn
 6PRQUmnmVj46qs3TjBnOZ4Kg3342OtVhFzMNuwhBh8R2Spm//UHbaap7hd+478CV7ByC
 TUQDCCkg7FyasLYNYWFGvB4c4yI0Nf441nt9tIFLYDRrWluCY//kK+u6lvAwFltjNId4
 GNdI2InZJNmrXwFAyTpvwRwnVSUQef9+HgB7fwElvz/yi5WDsE4NekwF1UnBK0TeY/kM
 OBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729425456; x=1730030256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O0yOz3cWb1IQD7Tg15vbiZe6MI3K0GYtKBYpCEEezg=;
 b=MkyunTV+Kd+qD9jztnaVBMMDAvNogJnzd5LVaiNXzR3tLABWuwALU6NcM2/HfcWo5S
 y1x2NWUUFvVYqv0OOmcaQS0w6KUYMgCx+XteGmUztVoeEzNOLmcxAZtfbSE9CD5gV3ht
 TwyRI+IkZMBMTuQsvGzTLVNvKIIYVEFvrtHh4ig4bYOkqBCu4G8mQMhqo+Ko4zFJCn0y
 TaB5K6Zjh/yaQLZ8wr+mFnurPFRzispfNvHszSBfPD+pzH5U4QGFYg7SQTDtRV+2wNuA
 /LjLPPYHeofxkh7vDt7IkwGkJeYJBGe/INCEFT543V8uEBvR7Rbw0Gs4cwSGKsG+Veta
 47vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMW/ZuRlhg6bdREkooppws09xZHLNd7rryY0naDPah8qNZcendBvg0XzNk8xYddKt4ltqJ9WjTGGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA6yezw7J14nnn94OssYmZZVcvwKFNIexWQDkQxPJHFxxQwts8
 ufwsST35eEsd9SBXWZmib+KOpigAUo/OavIRK/DrAskYZ1V5SpzqiDw8gxpsJts=
X-Google-Smtp-Source: AGHT+IHHy9TnC1ymBfAe1E716Oluk0OiwxHzPTwEx+CT7cluP5ONLkyX701HDnwlr4hgRXnCLaOyIw==
X-Received: by 2002:a05:6512:3185:b0:539:f65b:3d1 with SMTP id
 2adb3069b0e04-53a152198c9mr4193710e87.21.1729425455844; 
 Sun, 20 Oct 2024 04:57:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a224319besm202236e87.215.2024.10.20.04.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:57:35 -0700 (PDT)
Date: Sun, 20 Oct 2024 14:57:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 13/13] drm/bridge: cdns-dsi: Use
 pre_enable/post_disable to enable/disable
Message-ID: <m7t4hsa3lcszjbipxlypf655uspoxw3xfyy5jo3n3bnmqaiqcf@6wti5f477gve>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-6-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019200530.270738-6-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:35:30AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The cdns-dsi controller requires that it be turned on completely before
> the input DPI's source has begun streaming[0]. Not having that, allows
> for a small window before cdns-dsi enable and after cdns-dsi disable
> where the previous entity (in this case tidss's videoport) to continue
> streaming DPI video signals. This small window where cdns-dsi is
> disabled but is still receiving signals causes the input FIFO of
> cdns-dsi to get corrupted. This causes the colors to shift on the output
> display. The colors can either shift by one color component (R->G, G->B,
> B->R), or by two color components (R->B, G->R, B->G).
> 
> Since tidss's videoport starts streaming via crtc enable hooks, we need
> cdns-dsi to be up and running before that. Now that the bridges are
> pre_enabled before crtc is enabled, and post_disabled after crtc is
> disabled, use the pre_enable and post_disable hooks to get cdns-dsi
> ready and running before the tidss videoport to get pass the color shift
> issues.
> 

Not being an expert in the TI DSS driver, would it be more proper to
handle that in the TI driver instead? I mean, sending out DPI signals
isn't a part of the CRTC setup, it's a job of the encoder.

> [0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
>      TRM Link: http://www.ti.com/lit/pdf/spruil1
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 62 ++++++++++---------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 79d8c2264c14..dfeb53841ebc 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -658,13 +658,28 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> -					   struct drm_bridge_state *old_bridge_state)
> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *old_bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	u32 val;
>  
> +	/*
> +	 * The cdns-dsi controller needs to be disabled after it's DPI source
> +	 * has stopped streaming. If this is not followed, there is a brief
> +	 * window before DPI source is disabled and after cdns-dsi controller
> +	 * has been disabled where the DPI stream is still on, but the cdns-dsi
> +	 * controller is not ready anymore to accept the incoming signals. This
> +	 * is one of the reasons why a shift in pixel colors is observed on
> +	 * displays that have cdns-dsi as one of the bridges.
> +	 *
> +	 * To mitigate this, disable this bridge from the bridge post_disable()
> +	 * hook, instead of the bridge _disable() hook. The bridge post_disable()
> +	 * hook gets called after the CRTC disable, where often many DPI sources
> +	 * disable their streams.
> +	 */
> +
>  	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
>  	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
>  		 DISP_EOT_GEN);
> @@ -683,15 +698,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>  	pm_runtime_put(dsi->base.dev);
>  }
>  
> -static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> -						struct drm_bridge_state *old_bridge_state)
> -{
> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> -	struct cdns_dsi *dsi = input_to_dsi(input);
> -
> -	pm_runtime_put(dsi->base.dev);
> -}
> -
>  static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>  {
>  	struct cdns_dsi_output *output = &dsi->output;
> @@ -760,8 +766,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>  	dsi->link_initialized = true;
>  }
>  
> -static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> -					  struct drm_bridge_state *old_bridge_state)
> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *old_bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
> @@ -776,6 +782,21 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
>  		return;
>  
> +	/*
> +	 * The cdns-dsi controller needs to be enabled before it's DPI source
> +	 * has begun streaming. If this is not followed, there is a brief window
> +	 * after DPI source enable and before cdns-dsi controller enable where
> +	 * the DPI stream is on, but the cdns-dsi controller is not ready to
> +	 * accept the incoming signals. This is one of the reasons why a shift
> +	 * in pixel colors is observed on displays that have cdns-dsi as one of
> +	 * the bridges.
> +	 *
> +	 * To mitigate this, enable this bridge from the bridge pre_enable()
> +	 * hook, instead of the bridge _enable() hook. The bridge pre_enable()
> +	 * hook gets called before the CRTC enable, where often many DPI sources
> +	 * enable their streams.
> +	 */
> +
>  	if (dsi->platform_ops && dsi->platform_ops->enable)
>  		dsi->platform_ops->enable(dsi);
>  
> @@ -912,19 +933,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>  }
>  
> -static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> -					      struct drm_bridge_state *old_bridge_state)
> -{
> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> -	struct cdns_dsi *dsi = input_to_dsi(input);
> -
> -	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> -		return;
> -
> -	cdns_dsi_init_link(dsi);
> -	cdns_dsi_hs_init(dsi);
> -}
> -
>  static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>  					       struct drm_bridge_state *bridge_state,
>  					       struct drm_crtc_state *crtc_state,
> @@ -968,9 +976,7 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>  	.attach = cdns_dsi_bridge_attach,
>  	.mode_valid = cdns_dsi_bridge_mode_valid,
> -	.atomic_disable = cdns_dsi_bridge_atomic_disable,
>  	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
> -	.atomic_enable = cdns_dsi_bridge_atomic_enable,
>  	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
>  	.atomic_check = cdns_dsi_bridge_atomic_check,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
