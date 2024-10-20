Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3A9A53D8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539A10E2BF;
	Sun, 20 Oct 2024 11:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CzMTfuKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BB810E2BF
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:42:20 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539fe02c386so4556397e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729424539; x=1730029339; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Re9ea2Fbhj4sQlgiUBc5/pgSXFotaCfmOVOUipxA6Uk=;
 b=CzMTfuKPFIkSbSvjDFrzhFcre6vxzhE76mP1vFfUWzydlSyL8CoFsW4Cv5XezRntwb
 jNbWgjYMNaiuzmdnI+3t3N3jQq5oEM6aFv5IgC+jEQTnwhcbKwn650eKqIQZbUnuG+hL
 /Um+68FZ8FLyRmfztwmfJ7qQ11MYvtKrpRogF0sX4dPKkf+HNqsZ4olKzq/PYNJu7W4y
 7GQ3Rw6NfbKT731K6o4BsV+NIxDIAv75YQ7KKhh/iKh9G5CTTGH+yNkqtmIz00D09uAG
 jETNHl2Q4LUWsqZPhH+CI9dFe3j00tGLitThKA7J5Pi31Qhqmnig+kjHYD17GX+C9Pda
 dLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729424539; x=1730029339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Re9ea2Fbhj4sQlgiUBc5/pgSXFotaCfmOVOUipxA6Uk=;
 b=QxG2306qxk3hhpUeHwHNB4d/BsCLB3Ue8pWcrNp3UAYmFtHbfnrUq/wjEta4JxD2/k
 okMzToub1FnpuP+/g+lmnm2Lf8REO8t1JAw7OooVo9OZ+EwgWCVOy4Yfv33Nq2DOVwr2
 DFEaVR/defLutTEk3ky/fi5oQi6MxanQoXMc/aezVA8WUgoTXyztV1yDsEw73oHomhoE
 DH1YGr+/nDipppL2KX571WDvy2x5+OzSP6ypbpg4k6JJ6fYDdUVa2NQWHwe2Pp7teZIC
 MQojTP+WyxGyjF7/dC6KzXbxJSWrpwWZFw4HKKSOp/4n6hRF8Df42c7hcI1kCkdKemRQ
 Hsxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpuqR4hn/hGLB3EwK/FbYr3JJ8BorMIomC/YTppX2JYGQKm1iUSA7bld4sx2/K53DT9VxF7udXqr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVKegqfMJt6hD8czZ3I9sT9TwORtoVUihghj20wHt3oSmFzJU0
 t1mCMxp3i1JmgvUDP9nUni5qSbTvYbZgIjaqXD7hgnhRW2A53mkWICPlAuKGZgc=
X-Google-Smtp-Source: AGHT+IFwVJWScHOxNtIO9jOkti32TUNVgSQPzSh0Yn+npLDF7bD3R90ZUdOqYrxAaAALCV2JubLUvw==
X-Received: by 2002:a05:6512:23a5:b0:539:f922:bd3a with SMTP id
 2adb3069b0e04-53a0c7525aamr3841505e87.25.1729424538590; 
 Sun, 20 Oct 2024 04:42:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a224202d5sm198065e87.136.2024.10.20.04.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:42:18 -0700 (PDT)
Date: Sun, 20 Oct 2024 14:42:15 +0300
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
Subject: Re: [PATCH v5 10/13] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
Message-ID: <wgxqkelcwum4y7ggc36avwcnnsdyu3nfjj7lp4mvopws6p23f5@h22uk464s62t>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-3-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019200530.270738-3-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:35:27AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> At present, the DSI mode configuration check happens during the
> _atomic_enable() phase, which is not really the best place for this.
> Moreover, if the mode is not valid, the driver gives a warning and
> continues the hardware configuration.
> 
> Move the DSI mode configuration check to _atomic_check() instead, which
> can properly report back any invalid mode, before the _enable phase even
> begins.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 18 +++++++++++++++---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h |  1 +
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 7341e609dc8b..79d8c2264c14 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -769,7 +769,7 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	struct drm_display_mode *mode;
>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>  	unsigned long tx_byte_period;
> -	struct cdns_dsi_cfg dsi_cfg;
> +	struct cdns_dsi_cfg dsi_cfg = dsi->dsi_cfg;
>  	u32 tmp, reg_wakeup, div, status;
>  	int nlanes;
>  
> @@ -782,8 +782,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	mode = &bridge->encoder->crtc->state->adjusted_mode;
>  	nlanes = output->dev->lanes;
>  
> -	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
> -
>  	cdns_dsi_init_link(dsi);
>  	cdns_dsi_hs_init(dsi);
>  
> @@ -954,6 +952,19 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	struct drm_display_mode *mode = &crtc_state->mode;
> +	struct cdns_dsi_cfg *dsi_cfg = &dsi->dsi_cfg;

This makes .atomic_check store data in the non-state structure. However
it is not guaranteed that each atomic_check() will result in the
atomic_commit(). So in addition to moving the check to the
atomic_check() callback you also have to move the cdns_dsi_cfg and all
other structures written during the check to the new structure, wrapping
drm_bridge_state.

> +
> +	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
> +}
> +
>  static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>  	.attach = cdns_dsi_bridge_attach,
>  	.mode_valid = cdns_dsi_bridge_mode_valid,
> @@ -961,6 +972,7 @@ static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>  	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
>  	.atomic_enable = cdns_dsi_bridge_atomic_enable,
>  	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
> +	.atomic_check = cdns_dsi_bridge_atomic_check,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> index 5db5dbbbcaad..b785df45bc59 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> @@ -77,6 +77,7 @@ struct cdns_dsi {
>  	bool link_initialized;
>  	bool phy_initialized;
>  	struct phy *dphy;
> +	struct cdns_dsi_cfg dsi_cfg;
>  };
>  
>  #endif /* !__CDNS_DSI_H__ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
