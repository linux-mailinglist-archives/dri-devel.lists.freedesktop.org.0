Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF4A3898C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B652610E544;
	Mon, 17 Feb 2025 16:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HHPSxaFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7D010E544
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso27285815e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739810487; x=1740415287; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GH7dByoQjATcMtRNPRz1qJqOaKrEwLdFgaeAEJKWfqY=;
 b=HHPSxaFxz6oHIV+0k0r+hdzjDSJekw9uLoPMSJflWxzk44zOZeRcC5TuZ8/DEnxrls
 wpWpp35v/pyioDuREghlVBrmwXNwVNmmcErTwvHwYeS2n0VQcyzhNGR+W7G11DE+Ja5d
 PXNzhU1yLDjj9ubQVrPuuxR8oTPrQKyW0XCWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810487; x=1740415287;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GH7dByoQjATcMtRNPRz1qJqOaKrEwLdFgaeAEJKWfqY=;
 b=mjdSJy+++buk8QZZFdLG79I2M0uK/Af6qK2YbFqb+6FAbKBR/PcNkw+u6rup65WQF1
 7/ScdwD31brhhrYJXaTjcD/Lwp105tkdPWT/tkSU7H0Ge/4Br2yhqzRW2viuZor7+Da3
 nP6awRGQ4+7Dwg8/ldJTNCnMTMi/5uLdrgSjtSMnAgkhTT/ysWxvixk8qz0YV/xYa6vJ
 Cj1lwW973+68h2fwsGqxGaTDxdMFYYxEuwAG4dZ7Y0BjF4/RRKux7o8Ik0esQU+yAptj
 Y1EZr2PlzUlmozmVgktCXOBcLjtc64QbFnX7Lm4YnNJTPrkntoxvejbsY1Nht+x2UcLP
 QGVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGVczR5YT3g6WDusTgicCfr5x3ZnrjA/44yCBEp+F4+bh+nnb9vyKV27swbghgz/+pDYk7gE0ggl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjKVq2B8Qioo571z9SwcD8C6Fm6M3QZr85fwtGV0XqwOda+OZV
 sbt0c2H6MLFhDahvNIon3+hX2inNVv8WONlw6l+wlanPIc015EfWvcFNQLDyCeA=
X-Gm-Gg: ASbGncsgkZBZEmC2kHPkbEU0Joq/RvrPUtIKHWITA/Hn92JRZfJ636hkdcznUEv+fdP
 FMsKy5Qxvv0qSdEWE4g9yW/V3o/OQDXITgk5Q93SP8Id0rg5mFC+BtDC0Pv/V5jHTDUjojXutsU
 dqTQ355HVWJ3MZkSreusld5WUvJIBU1kHjjXnkwqYIeh5OgnqdeZhvnU0ws8MrDkw9ftp8LwObe
 EXCC4J+l65MaoQSTHgmoDohuMqTNu9BlhGyfzdy1sKKBK2bQ6VukU322OeY2WeJL/GvF+jZMa9Z
 FBvLO5jqF4tpNrCevaPMG92GcK8=
X-Google-Smtp-Source: AGHT+IFRhKctt5xCG+FRKWC52l+K41KeexQa204yjGmhr/2wp4/LnFs1TbG9nQwuRUmQ3E8RWifHQw==
X-Received: by 2002:a05:600c:2d03:b0:439:7ef0:a112 with SMTP id
 5b1f17b1804b1-4397ef0a282mr45449985e9.10.1739810486832; 
 Mon, 17 Feb 2025 08:41:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4491sm12453272f8f.7.2025.02.17.08.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:26 -0800 (PST)
Date: Mon, 17 Feb 2025 17:41:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <Z7NmtF83adILfasi@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

Eh, this isn't quite how this works. So unless bridges have become very
dynamic and gained flexible routing the bridge(->bridge->...)->encoder
chain is static. And the crtc for an encoder you find by walking the
connector states in a drm_atomic_state, finding the right one that points
at your encoder, and then return the ->crtc pointer from that connector
state.

It's a bit bonkers, but I think it's better to compute this than adding
more pointers that potentially diverge. Unless there's a grand plan here,
but then I think we want some safety checks that all the pointers never
get out of sync here.
-Sima

> 
> And for the connector, since we can have multiple connectors attached to
> a CRTC, we don't really have a reliable way to get it.
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
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
