Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB4A349D4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D921810E0D8;
	Thu, 13 Feb 2025 16:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kCu8fgAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396210E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:29:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so1135324e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464189; x=1740068989; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kJugKKEOwlREPb+p1Z0P7OAg934ldgSxN+eJwACQfYc=;
 b=kCu8fgAHiJ+2nuyOFrYy6rvtwt5k98ulGwQc7DQvEPHKg/s2tXLTBXvADP66ONJ0xx
 oRzHvLetCt0vGlAXyKJhePfvRjTHDTrq8HKKgFE980oPb323/zMgogaBB2yF/JSNmgPd
 4STcM6DqekrVg9zmNRwD6FfDJW2wuDa5Z/thSjBc1/wqB6WHzBWy30mkMWwdK3NBTedX
 8J3aRjdMaFolP/4lvTAzcqOTxrVLTcfPwRO5cumHHMtKxEKoDj4UoYW5E6yPK5v9OiC/
 6jLKcBv+Yxzp6tl84arEX5lRQ4Khvu0aiYiHZRW5fUeRpx2FBZIgRtTw+DAmEDL1+BrB
 rDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464189; x=1740068989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJugKKEOwlREPb+p1Z0P7OAg934ldgSxN+eJwACQfYc=;
 b=WrUvLKynOF7VjtH/fAEjFO9CYMO/97tvS4mO2ChDfZSKNMWau4Q9IbzpcV7YEkm9ne
 c9HeCh8CdNrKd4cI4T0JCjsM/xGubTTAQE9DdrN0rq2i10FhuTO8xTdOXIz36Ai63s00
 lNX82hQi+/tWHaVpJpUSs5bVLFZLUE9QWTR/rH6zNJjZl+gR9P4jU7ZEbu2cztttmmv8
 JkVTs164j1HzTz+4hai8u2EMdK61iR/EFXg7ig5DuM0YWhz3yce0JO/OCQCXSgBl4zyx
 RrPqsmHEpF0VfJcZVr8okFyvE08XXF59MsUTcMYWJT75LouWpD9MGsFpsDZ0snz5/BgJ
 vtoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuUfucWEKhWkXwfrvEFI81nntLHOgb2lkWRVb4CLzqr3MK39xL+UxHkzGLPyAVAeyLNSRI/teS9Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRaOJp5YQttas4XNVcMbSU5jrx8GgOhSmKRvG39OIKE4WMVbcZ
 YxbDGqn719lhHH14WPPLrgx84dVedComX2psoKkestTzl8vkloA+q64iHzcJTy0=
X-Gm-Gg: ASbGncsIdWOSFVJIorlylzbHf7FuQNSYDKcAUlsH+V9NCkbVbHdgyBXvv1A4DJm1fL6
 pEPw/DlSHoy8KyJelnaUzB1mntXeOLr1pWYerLv2kGRgJjqHrT+GL1eFWgQ0Gpu4ZcTIdhZQETI
 vqy1TMNlTl5Gjvka294MCdGepRQ1jSpwKPqtiD0dUuUmMI7uILUIEwoBcGAfUfeCy7SP8HTnUyt
 P9uU9OPfcAeeDgmUS9wcS9rtHwN6/irCqhFcK6OybW2+xmM5bmf1GCDHHF+le5y+iR7PMf+8JyH
 2AWCebU61ukkUCihvpR/+b1rPnImIUq4oHQBhWfIAJVtdqJBoMR2Y3ZE4h/J3l7rFFfmKsQ=
X-Google-Smtp-Source: AGHT+IF+hsft0VbXMNxPd7FKHumPUJvG86RfezAnMtzpnxwfK6f53xvCiC2uO574gIXJvAXy7nelxQ==
X-Received: by 2002:a05:6512:e93:b0:545:2300:924d with SMTP id
 2adb3069b0e04-5452300945dmr420589e87.22.1739464188919; 
 Thu, 13 Feb 2025 08:29:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11241csm214792e87.206.2025.02.13.08.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:29:48 -0800 (PST)
Date: Thu, 13 Feb 2025 18:29:46 +0200
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
Subject: Re: [PATCH v3 30/37] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
Message-ID: <vjdpctck2afcjrt2rlgjtzmrkf4a5bg5ihymc53vuw6md576wd@kbb5y27a5woi>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-30-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-30-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:49PM +0100, Maxime Ripard wrote:
> The drm_atomic_bridge_check() runs the atomic_check callback if needed,
> or falls back to mode_fixup if it's not there.
> 
> Going forward, we'll need to setup the bridge atomic state even though
> drivers might not be implementing atomic_check at all.
> 
> We can thus switch to using drm_bridge_is_atomic() to take the atomic
> path, and do additional things there in the future, or go the mode_fixup
> route.

This will break bridges like tc358768, rcar_lvds and mtk_hdmi: they
implement atomic_reset() and mode_fixup().

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d2525d0b1324cc3a63e32f5bf6ca6c4f9034eb4e..b6d24092674c8fa33d9b6ebab9ece0f91fb8f8ea 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -803,23 +803,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
>  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  				   struct drm_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state)
>  {
> -	if (bridge->funcs->atomic_check) {
> +	if (drm_bridge_is_atomic(bridge)) {
>  		struct drm_bridge_state *bridge_state;
>  		int ret;
>  
>  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>  							       bridge);
>  		if (WARN_ON(!bridge_state))
>  			return -EINVAL;
>  
> -		ret = bridge->funcs->atomic_check(bridge, bridge_state,
> -						  crtc_state, conn_state);
> -		if (ret)
> -			return ret;
> +		if (bridge->funcs->atomic_check) {
> +			ret = bridge->funcs->atomic_check(bridge, bridge_state,
> +							  crtc_state, conn_state);
> +			if (ret)
> +				return ret;
> +		}
>  	} else if (bridge->funcs->mode_fixup) {
>  		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
>  					       &crtc_state->adjusted_mode))
>  			return -EINVAL;
>  	}
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
