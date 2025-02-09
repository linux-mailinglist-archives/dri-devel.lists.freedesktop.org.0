Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED12A2DB70
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 08:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A3810E263;
	Sun,  9 Feb 2025 07:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s4Vb/Lw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E2710E263
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 07:06:35 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54505a75445so999957e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739084794; x=1739689594; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3gtecDF1iEe88AdH66OfxEN34baIE59vMgWfXFwAPM=;
 b=s4Vb/Lw1/JSSdyKhV0B+1V8NrQlvRxQ0fa7/1o+XGefW5EKy6Ni9pCnoMFBE7LgXPr
 jeEcQTtWDCSkBhDXBbxwPjwpvs/3SELf0JgxsAwksaZDyqCybwzv7ccEjeyGx4EcxFX6
 4xD+MBmiH8ZbDOUCQmFE1U7sSw8eRRI24NfTXobsPqi26Icp2ERBS3jYmOHIgexlEoY5
 6fr0NVFXiECLZ59PEw9tP3jUdZBi1bpI2q0ycbqkDv1Ie+bHxyTcmTlGCxN7bW67+kGn
 AoEYHUsL+eMq0CQpstCk1Rw6P+Gqrm4c1+nsNl6VGfhg9FPOOxj090SI30EVLhEBWJNy
 /dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739084794; x=1739689594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3gtecDF1iEe88AdH66OfxEN34baIE59vMgWfXFwAPM=;
 b=MHumpjqzHcf6ZZ3Sx6/25QGQb0bWSdIrR0Sq4AhbIS4gWPEdea22b8Fa+/5h/WTq/W
 8v4+vW4STn7xmX4A2Vu+sOV+iIug8SgLqgJzbIYR6hC1J6gkIWwTedm8D+sJ41zBpvut
 d0cZXE7tKu9Fhzwm2cHcwabvlyRvqPpwxkRra9ni3mFsa8BqGADykQzm+jBXB2LET93c
 QsPcv04DvnOXnpPKpp65W391DebBtmn00qFB9roTerEzSugg6xnGkPIaJrsFNIZsv8D2
 1BzE8WpGRr0PzudWVhVjYS/C+/3rfrNvGU6nwwvX19JCevLIaRf7+8pipMoQlflS2qMs
 5gVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYo359dpA6Hcjq7tqPpRVs/qI8/wjd8aJwgXpZZpP2jbAWtkV7cWaLR0fe5bFvhS08s/2X0jXyiiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywQRf2tq4LL661kv57HAHFjoM2K56uChgL/1q30tx8Mwm6F4zR
 5POTGsq0KSewPAeiCpnC43NpgOEhY2HYBCeslnTdcNlWoO/0Cf1cUoehAPIA0yE=
X-Gm-Gg: ASbGncvZoiV5g9k8N43imx6wlARPdhBUm2jy81k9hUyJlkLvCOqpr37pvqfsWvzQhDX
 tdyH7XMhr7BK74N3K1x5GwG3ctwTbIh26q2bcOysDT49s1GUHiryj4rmV08mPRNbL/CJNSFEDca
 DYijGLi9F9UsK1DKrE58Q5HFDQBS50K5Y7jVKouHoGtLM6WKBCYCsJ0WZiEgut6D7D6JxbPi6lX
 542/8qgw5dhFRSwYqi/eoKPLg+eb4XzHNaBH7MApdhs8Lrm+OLAV9mw2lHDspAx4gxM7o+h+XrO
 KrIAA83ohSNQob4CQk1Y5E2AKPtDQeDKrcZZ/f8/XjRCPVv1jHJBBn0zD3MqUW6D2t/FPR8=
X-Google-Smtp-Source: AGHT+IGO0y8ozaQ7emnIBAm8M2EFteZN5PwoZ6gCGixdrslK91jOmK/vbcZBOUZkLPqMpDulnadkxQ==
X-Received: by 2002:a05:6512:114e:b0:544:1187:26fa with SMTP id
 2adb3069b0e04-54414ab68bbmr3094286e87.14.1739084793546; 
 Sat, 08 Feb 2025 23:06:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c3ad600sm758e87.243.2025.02.08.23.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 23:06:32 -0800 (PST)
Date: Sun, 9 Feb 2025 09:06:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 32/35] drm/bridge: cdns-csi: Switch to atomic helpers
Message-ID: <fhgqv3cvjktmgpwuaxi2bfz5iebpwuodhg4eiezvrznxi7zm4i@vsc3ukxo6uox>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-32-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-32-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:58:00PM +0100, Maxime Ripard wrote:
> The Cadence DSI driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer.

See below.

> Fortunately, the crtc pointer is now provided

Nit: CRTC

> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 27 +++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 8f54c034ac4f3e82c38607a0e52d4745654b571f..c856e7843f83b363340443dec1deb26c9ae1b912 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -654,11 +654,12 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  		return MODE_BAD;
>  
>  	return MODE_OK;
>  }
>  
> -static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	u32 val;
>  
> @@ -674,11 +675,12 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
>  		dsi->platform_ops->disable(dsi);
>  
>  	pm_runtime_put(dsi->base.dev);
>  }
>  
> -static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	pm_runtime_put(dsi->base.dev);
> @@ -751,15 +753,17 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>  	writel(val, dsi->regs + MCTL_MAIN_EN);
>  
>  	dsi->link_initialized = true;
>  }
>  
> -static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	struct cdns_dsi_output *output = &dsi->output;
> +	struct drm_bridge_state *bridge_state;
>  	struct drm_display_mode *mode;
>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>  	unsigned long tx_byte_period;
>  	struct cdns_dsi_cfg dsi_cfg;
>  	u32 tmp, reg_wakeup, div;
> @@ -769,11 +773,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  		return;
>  
>  	if (dsi->platform_ops && dsi->platform_ops->enable)
>  		dsi->platform_ops->enable(dsi);
>  
> -	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	mode = &bridge_state->crtc->state->adjusted_mode;

And then it also follows crtc->state, which might fail for non-blocking
commits.

I think a proper way would be to

connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
conn_state = drm_atomic_get_new_connector_state(state, connector);
crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);

>  	nlanes = output->dev->lanes;
>  
>  	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
>  
>  	cdns_dsi_hs_init(dsi);
> @@ -891,11 +896,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	tmp = readl(dsi->regs + MCTL_MAIN_EN) | IF_EN(input->id);
>  	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>  }
>  
> -static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_atomic_state *state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> @@ -906,14 +912,17 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
>  }
>  
>  static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>  	.attach = cdns_dsi_bridge_attach,
>  	.mode_valid = cdns_dsi_bridge_mode_valid,
> -	.disable = cdns_dsi_bridge_disable,
> -	.pre_enable = cdns_dsi_bridge_pre_enable,
> -	.enable = cdns_dsi_bridge_enable,
> -	.post_disable = cdns_dsi_bridge_post_disable,
> +	.atomic_disable = cdns_dsi_bridge_atomic_disable,
> +	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
> +	.atomic_enable = cdns_dsi_bridge_atomic_enable,
> +	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  };
>  
>  static int cdns_dsi_attach(struct mipi_dsi_host *host,
>  			   struct mipi_dsi_device *dev)
>  {
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
