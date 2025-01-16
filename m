Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA8A13077
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0010E546;
	Thu, 16 Jan 2025 01:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qd6/ACy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973E410E546
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:07:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so426364e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736989573; x=1737594373; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qdf7EZb9x6MeeZzuSxRu3B3na0HB0y8dyenTQFmxEJY=;
 b=qd6/ACy8YQ74KTQO4BXFca3qV7OdSs96LjLkxqcEtIPRhxlJVh3r+WmdcHRSula9AA
 1gxQ+QnLYN2WYE1iG372F/J3T94IOBRRRE9KiHSA0VK7S9NbB2E1KwW/mCfo3qTSjRUp
 qTbCGmmaKeGeKNlYbfCd4EljxbCYX5Dc7YU2YB81f3MYfSYvRS2+HlCFeuI3qfgRWSnf
 n4tSDX/FBUSazqyMIGpdaCGxYwglsE7Qa/o4lA7IHaC76uNvxj5FD5c/pwOK/LOIOWLF
 nYZcFzLJZlWT6CimraApoLFdxsA4mQ1m8oz8+ip8zuUV6RIJtN9e2GIR9X2zLGy8/WSf
 Tcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736989573; x=1737594373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdf7EZb9x6MeeZzuSxRu3B3na0HB0y8dyenTQFmxEJY=;
 b=MHihCmWY0jthHf05l6jnhAQMql/u5ENMt8MVXkSGvV9DN7/cam7oe4hDZA9F8oFGBN
 FZ5iZja9lsVBVBa5dCdQwPoXupVwaDoB7pHtXFSWRU+L0h2/xfWqwT7CmlZ3lufCUMNb
 2pkHsMW6EElSfDUCPLn0Z1VzXW54YBcok3IgklFFmAq7lRyGTwvxFocwA1eKukWv3P4J
 TsqQpKRt7kC0RyZ8EbjNHNMNS6vqkbv+TbDzZSt6lZRrBQJGwCxJxCSLxAvVGEmFaA8t
 FT//I0XUuyO4WUP77rDiFmwtObhvLF8BGDFJNorLpIb9VPXuTPEMpvzD3FO3lj3x28ln
 HNiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVsBh0MkkePvb6cp7Bz4L3U9yNXj1DYA/W3AJMRnBeA/3kKt5SQLfIJ5QVHXcL5OB/W/F/iKqRrjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjt88ZeX+/TL0EguLwk3+ck2jlxorGUPeA1JJD3VtOuEDHVJRD
 k5M08e+AYmSUdFRMfpQ1OEgHISGEHdN3hTo3D0x25COea9wGZSo6Tq8Dx9PZTI8=
X-Gm-Gg: ASbGncs2n8VQdg38N0sbx6DtrdmV9qnlbMSa8OuaMMtSeCfoAPkQwi7tnoBhOV0QfQv
 dXXFjCW8fP3ECe/yzamm/zSfxI3e9P2mbgEz75tIVcSDnRHJZq+aoad6lZeyoO5wRCG0IfqPCNf
 kFeO1OkpqqCkzkiceKh098qk+8Y9TpDyXIW7xbjuEzhJxRBXOW8xuXhA6DES+rUp2Tp6vaZIYDm
 mAX1u1HHTzpjlXUel894FEN2G0XYbI9pVabZd3lspmX868a6YNH4lx276uOr+etRpKkYyxtghv0
 4CJN7c2U3cPeysROKPavj70OVcV6GPcXoEL+
X-Google-Smtp-Source: AGHT+IH8hmvihl13CPzWZ7/sOlbdZlxpfC8Sp2ZgD0R3GKcoXAYox3rJZby6ooS0fA8iYQ7kOISf7A==
X-Received: by 2002:a05:6512:2348:b0:540:1fd6:4e4f with SMTP id
 2adb3069b0e04-542845b9ec0mr9759714e87.22.1736989572927; 
 Wed, 15 Jan 2025 17:06:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be53f8bsm2200773e87.89.2025.01.15.17.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:06:11 -0800 (PST)
Date: Thu, 16 Jan 2025 03:06:09 +0200
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
Subject: Re: [PATCH 26/29] drm/bridge: cdns-csi: Switch to atomic helpers
Message-ID: <cwshwpwqisrrk2bzhqz7kphsnbhqnj3bsd7x2gxjtkvu3bkrgr@tf2tq4q3uoux>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-26-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-26-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:33PM +0100, Maxime Ripard wrote:
> The Cadence DSI driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index c7a0247e06adf3e532f830363b3422a8058513ef..aab4959a6f80c3502f717e0881eef30a2c7d1f18 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -653,11 +653,12 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  		return MODE_BAD;
>  
>  	return MODE_OK;
>  }
>  
> -static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	u32 val;
>  
> @@ -673,11 +674,12 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
>  		dsi->platform_ops->disable(dsi);
>  
>  	pm_runtime_put(dsi->base.dev);
>  }
>  
> -static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	pm_runtime_put(dsi->base.dev);
> @@ -750,11 +752,12 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>  	writel(val, dsi->regs + MCTL_MAIN_EN);
>  
>  	dsi->link_initialized = true;
>  }
>  
> -static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  	struct cdns_dsi_output *output = &dsi->output;
>  	struct drm_display_mode *mode;
> @@ -768,11 +771,11 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  		return;
>  
>  	if (dsi->platform_ops && dsi->platform_ops->enable)
>  		dsi->platform_ops->enable(dsi);
>  
> -	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	mode = &bridge_state->crtc->state->adjusted_mode;
>  	nlanes = output->dev->lanes;
>  
>  	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
>  
>  	cdns_dsi_hs_init(dsi);
> @@ -890,11 +893,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	tmp = readl(dsi->regs + MCTL_MAIN_EN) | IF_EN(input->id);
>  	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>  }
>  
> -static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *bridge_state)
>  {
>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>  	struct cdns_dsi *dsi = input_to_dsi(input);
>  
>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> @@ -905,14 +909,14 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
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

Don't we also need to provide the .atomic_reset /
.atomic_duplicate_state callbacks? Otherwise the bridge isn't registered
as a private object and thus the state will not be managed properly.

>  };
>  
>  static int cdns_dsi_attach(struct mipi_dsi_host *host,
>  			   struct mipi_dsi_device *dev)
>  {
> 
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry
