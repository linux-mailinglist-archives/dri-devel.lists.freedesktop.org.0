Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE6A2DB6C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 08:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC7410E249;
	Sun,  9 Feb 2025 07:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h0jmspDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2AB10E249
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 07:00:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54298ec925bso4215567e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 23:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739084448; x=1739689248; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ke/v0zcSbRhluMj5/me33mYIoYLzSRKf+I/pzTCjOhE=;
 b=h0jmspDYhbVA2mHuSbLoPCpdVmgdvvfarP4KcBaafgLxYR8AmT+ZEcPCd1V/V77ZnU
 J7y3K30+dJaBOuRhzn8m/2j3PWyas35O7hqWOioOpKcltqgH6vqOyOzIWdKMg6J45gLy
 lZcrtDG7UaD6JKIQbGs01J7PwnRMB9vBbOyCXSiFxneZMHgYiGfvC4ejozkonn161qml
 /g7/CptTFyI5ZhWvEONOx7EAXNDIuaeD3kQpOdydWSeXqolFtRPOTXDBK816Du7dohXm
 Z1JpfmKUxA2nPhs8aiF+ge7jUDd2A2JLxrfSPmMdE4yWpgwl//+iM+hBZanDSvAVXIfB
 SkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739084448; x=1739689248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ke/v0zcSbRhluMj5/me33mYIoYLzSRKf+I/pzTCjOhE=;
 b=Unz6lNc4YdiWI1l50xI0Om+t1NRalbMRFWIxes6U+qHzR/W2i1HvFXRkgWAWpkAlW9
 pjNgBCdWWgTGjhdrWYllAlmkWg1sNn+GYkhQ9V4hy9UrsOPIlilScZGz9ZdS+H5Tj8QK
 LrxN/x+LEMXrv0tlOUkoGLSx4lIMv9tIQYBuTE+q+jpBvZPJuAlglWZ9la2qZtinnG21
 FXimKb7MRRi223E5BnCrSqa3TZ7qI+POEFu9FUmtU14DuLvSE7SYO5VfUurWz4GoMhI5
 s5WUhXAdxhgRqHf4BN3VbOZezEWY1yFnu7O0o9E375HWE/uoeCFYrQ6+N/QcUXAqWT4G
 A8cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9HfxDutPjU5A9qxiHLscn9l5xzbfx0bLnFuaDtVwAfUnKZZwiiKGldI3qsmSZXmGFpFsPPlAYxq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPg46yS51VWFOFxbHnQD1XQMt+Slbyruj11Iiriq9PRdO4B2Oe
 FnEhIc0kmMV1bVqq63g0AeaBnY2GL4AYzY3C/3Y9/8XoEfPdTNQprHthjThpUW8=
X-Gm-Gg: ASbGncvC/RmHIT+aR/6KfNyfLio9PT8PQz6cHzWmEGR4t4PJpO4YrYhUcKeHs6Rf2yW
 45HQ+fZcyq2opJBA7/JPXA8TMBzC/r84qi2dybhdZ6DmDgnfzIK+DgeM0JbP24/cCxyoloaU8HU
 FZ29LGa1GBDb9vws7KloSqcnmrn0gh8YXm5z1Xyu9lyrmc7laScMHevYN4syywjCZwWHJUc/yVp
 /UJ84QAYArp3Dcmh2bVmKn10EhR5f4YW4xqSzwKQdrkAozFbIQAbsi4cMstpvjRLf+HWwXAZzQJ
 P6sDtnm27Zpyt/NQ7tKUFFCV9/qnKiI9COMpgY/X3YigQt/8QVuys3/d3e37KLzJ0wHVIs4=
X-Google-Smtp-Source: AGHT+IEWGCtofmuEwEkuJxpqGHPNiiv0ZSPga34PIfnpTkm+HFVLF7PR6GYzqouNn/0GIyXy1u930w==
X-Received: by 2002:a05:6512:114e:b0:544:1187:26fa with SMTP id
 2adb3069b0e04-54414ab68bbmr3087873e87.14.1739084447927; 
 Sat, 08 Feb 2025 23:00:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545043e99e4sm385822e87.225.2025.02.08.23.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 23:00:46 -0800 (PST)
Date: Sun, 9 Feb 2025 09:00:44 +0200
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
Subject: Re: [PATCH v2 30/35] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <nclqj5lovum5cv7xhznv3hcuhxivl2vtky3caiduo3izbc4bcn@lmgyev4soj4q>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-30-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-30-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:58PM +0100, Maxime Ripard wrote:
> Now that connectors are no longer necessarily created by the bridges
> drivers themselves but might be created by drm_bridge_connector, it's
> pretty hard for bridge drivers to retrieve pointers to the connector and
> CRTC they are attached to.
> 
> Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> encoder field, and then the drm_encoder crtc field, both of them being
> deprecated.
> 
> And for the connector, since we can have multiple connectors attached to
> a CRTC, we don't really have a reliable way to get it.

It's not very precise, there is usually only a single connector attached
to that encoder:

 connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);

Most likely I understand what you mean, but the commit message might
require some polishing.

> 
> Let's provide both pointers in the drm_bridge_state structure so we
> don't have to follow deprecated, non-atomic, pointers, and be more
> consistent with the other KMS entities.

Well... Currently we mostly have variable data inside the state. Adding
drm_connector to the drm_bridge_state means that it also becomes
dynamic, however it usually isn't. Another option might be to pass
drm_connector as an argument to various atomic_foo() callbacks, but it
is also suboptimal.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
>  drivers/gpu/drm/drm_bridge.c              |  5 +++++
>  include/drm/drm_atomic.h                  | 14 ++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
>   * that don't subclass the bridge state.
>   */
>  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
>  					    struct drm_bridge_state *state)
>  {
> +	if (state->connector) {
> +		drm_connector_put(state->connector);
> +		state->connector = NULL;
> +	}
> +
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index ad91a0ac375a9c8cf82834354ec7f654a59a7292..fcff08c7d609477b7cadabc109f0b543a6b9b506 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -803,10 +803,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>  							       bridge);
>  		if (WARN_ON(!bridge_state))
>  			return -EINVAL;
>  
> +		bridge_state->crtc = crtc_state->crtc;
> +
> +		drm_connector_get(conn_state->connector);
> +		bridge_state->connector = conn_state->connector;
> +
>  		if (bridge->funcs->atomic_check) {
>  			ret = bridge->funcs->atomic_check(bridge, bridge_state,
>  							  crtc_state, conn_state);
>  			if (ret)
>  				return ret;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 7af43062e5ca8c30b3fd600a34543e79137ab3ea..12f3676b85454e81de74c6b5eec700a355d42836 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1197,10 +1197,24 @@ struct drm_bridge_state {
>  	/**
>  	 * @bridge: the bridge this state refers to
>  	 */
>  	struct drm_bridge *bridge;
>  
> +	/**
> +	 * @crtc: CRTC the bridge is connected to, NULL if disabled.
> +	 *
> +	 * Do not change this directly.
> +	 */
> +	struct drm_crtc *crtc;
> +
> +	/**
> +	 * @connector: The connector the bridge is connected to, NULL if disabled.
> +	 *
> +	 * Do not change this directly.
> +	 */
> +	struct drm_connector *connector;
> +
>  	/**
>  	 * @input_bus_cfg: input bus configuration
>  	 */
>  	struct drm_bus_cfg input_bus_cfg;
>  
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
