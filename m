Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B798DA349E7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2B710E0F4;
	Thu, 13 Feb 2025 16:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5wAdSmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588E310E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:32:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450b91da41so885551e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464363; x=1740069163; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VPHPNoshl1RcqwcSXICHqKvooCShtbqpBD0+IwmXNA4=;
 b=S5wAdSmB2CeISPp5nEj+M7QMgPGvLKTkJSHasrnoRaOE+gFMMrUf0kYEV67WWdiUxH
 SowAUOA0xC0wuTiYTlCwqXrepX4qe/1qkvfGPrb5/kXn4kAklTKnl44Wo6agCj2EgpvA
 5tPC5AVWsb6NtA6joIXpuvS2LYjdpd0wTDyOPeQErAr+dYK74gqs9ZLyUqqfp6wWCf/W
 SPcxKrIFrjWvPUomZ3YrgB3RMOLr6ntlkLv0Wab5Ssr4pIIdnB6/AGMc+3SyQ/ATno6D
 UGeiY5VEL0pNRxCitJiwaFv+rTLGByFofei8xVplICUnrNI2Z6ibbIUvHg4yWQSwb4gM
 kVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464363; x=1740069163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPHPNoshl1RcqwcSXICHqKvooCShtbqpBD0+IwmXNA4=;
 b=pGQRi7myIWJsUxD0pW63VwNJK4WEP3psD7ffL3jYXxIaFv7HFQ3pibCd2+FpFYUs6+
 GAtx62Lj/ba+RB/iZUhXoDceuXEdJxUZ3rRpXI6qkXLTZ0N/VTk6OG9EZlGvor0aF2HO
 4murnNRjMBJ/TFtVer7W/hzWMpBBv38BnWNwe3ZMOGLu3Mhwk4mo4Tjr/B8JXYw0dceH
 u9MxGQYHnb2r81RuaH12OIgPlM8tQUWNM8PtdZuOqFNHQreL6T7MBUwB59ddSeO6EUOB
 mpD+OgJZPZlVyh70H+QOriuwkFWDtZZ1hyV+Utrnb6lCmKakUtrNwdOehTey2zhKvNPb
 pEig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6+KSndkqqVB4l1vjptzIpuhLHBQkl2dxsUb5QxL7FCWDjbVxy+DfAuw8MHLChNlv4TlvQOgQWtnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWvR2zRZ4/wSsrQ04OyPY/HlJBKxl1T40lg4QKN6M8lkfX7jU2
 MvoHuEHmJ1Z6HMW6epc66ZOG0c7qA7tqXyIGnCNh5SahsDjvBbTY14HOStj7tzQ=
X-Gm-Gg: ASbGnct2hbHIOUEqcg/rW9wmqpwGshtOIlBytSZJH1g71c7nF0eh6og1mm7zGvRDa0/
 rp3aUy+0YblmDajvfbOJSSLDy8z6uHKeqogX9o2Ghw3NFTdTephNu2FLfEnMtuDUlUYMVZdmbNa
 LViOxWz1K8EqL5m+Z5yl2jxD0mH284YHrjI7iI86J7I6NOfDQ4dCBNW2MDvcnu2tdebhecmGJ6Y
 xfJEzlN61xy7FkcujBeqk8FewKcdjMOSJ0qs06tdXpBxL8ObduzqM6zBwVQQ/jUiDzKt+M+CoeR
 SGTcHiCIus3touoVOVs97b7E7mYOy4rCB5jq1GjymxSzELjOis5TrcsRlQ6wXhPLA4zzQ4U=
X-Google-Smtp-Source: AGHT+IHYWp+sMLAjjpwVQxvBUjGuUYEk19nenxTiG1/XVXYJCYHZpVNR+G42KEVOd0IkKtkXJD85fg==
X-Received: by 2002:a05:6512:3c96:b0:545:d35:6be2 with SMTP id
 2adb3069b0e04-54518155288mr2789477e87.34.1739464362577; 
 Thu, 13 Feb 2025 08:32:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f0834d3sm215968e87.11.2025.02.13.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:32:42 -0800 (PST)
Date: Thu, 13 Feb 2025 18:32:39 +0200
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
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <gyfchljgrqamb26sot4c26gcwupbst2zuu5fw6el5wsl6gl5xp@ruqbpsn4lpvx>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
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

The same comment as for v2:

It's not very precise:

 connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);

Is that unreliable somehow?

> 
> Let's provide both pointers in the drm_bridge_state structure so we
> don't have to follow deprecated, non-atomic, pointers, and be more
> consistent with the other KMS entities.
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
> index b6d24092674c8fa33d9b6ebab9ece0f91fb8f8ea..db2e9834939217d65720ab7a2f82a9ca3db796b0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -812,10 +812,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
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
> index 4c673f0698fef6b60f77db980378d5e88e0e250e..293e2538a428bc14013d7fabea57a6b858ed7b47 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1216,10 +1216,24 @@ struct drm_bridge_state {
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
