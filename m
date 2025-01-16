Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F5A13071
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6903310E545;
	Thu, 16 Jan 2025 01:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F8rodydH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EE710E545
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:06:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso494619e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736989607; x=1737594407; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QKjpr+PCtv9Xlm25hxPqz35tX6Hp8bb5htelYjdFoXc=;
 b=F8rodydHmUz2Z4hGpCYMCR3kaxMjgOo+6h0bFr35mNo3HxfJetcpQq3RXU93ZcMu+K
 n1uLQ1UFRAiDKZJFOEKwsCJdTRF7LknOVKs5l9fzYOPhTixvfPJWI79/lnBLqAt6HGpz
 pZb8OyyVKetiYmebCdil+nqhamYBEYzjM981ay0MWFfYUb+SArzC3t01kJlQ/ilyVW7W
 J3oNeHl9H5FbXn8eztUct7wS7gXFyQWXPaml2DH9WwQSHuOCIlhI7uQjERndweN/PMQo
 mddke7lE4OV+8WxLaZKiZ3V++4TxYZFP2RvwyF3h+wHFmyHYkc7o1fueUxn/uPwiStgR
 4GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736989607; x=1737594407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKjpr+PCtv9Xlm25hxPqz35tX6Hp8bb5htelYjdFoXc=;
 b=eoU/MDHixYyVwjQF0UwMyS8uHj/iqYKhJx4+/aZEBNbGixnOeqRe9Dhyc9f65E+v+q
 gJQhapen6iQqVYUwUSGq/dlPuwP4nHM4WoQiZ/vqTUgXDEtqozDu+zBFuX4tD9y7C2fe
 cy7FYF2gDcG/9e2GLK2SITG27WzoFJw2/99kibQqQBd9gfkfWFJTOvtF+QidsCRuoK1C
 d8UDpPxiSP6vN3B2qz5VtW6znqII38EXqgiJSu4N2lwEet65k3nG9BVkxIOTgirmAMqk
 q3iqsw67DIOSFT173laeodVQGa7UhCPP6oof5J8u3aT1t6MuFhv8D8xF/Ar0mskAPk+6
 CYYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgXPBxG6i/38H3tSnSlks4uJv1wY4/FQUUTyksJj6Bfqy9vp4Nc0a28VtgRFIlsn8zejAeFmCop68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy96mdbCPLr0vk97HRPDa2bRQaAerlmgFSrzWbnARqe74HP7TAH
 lH+okWL06k45yfhiFnyqqH4Sd/XKrEqld1+Y5ruLk0kZCOudeQWigY6RsrHHTgA=
X-Gm-Gg: ASbGnctNhaM4Sg8OOPyMp8CwVVnAOWCsQ1DUqfkvuxozT4WXPb/wCNZY8aHmii+AUm8
 Ai1RkfrMBlkDfx+EXR4tOPKF6jn6yZ3bVo/AmsFWnvTNJFVKZq6tDHQUdy6dTrH9c+HLNzk3L3k
 smud5B1vStAmjiwcTcTNz66JCgF9x01mlWbLBK62ytqZtAyR3g8yu0/i1CbL70R+fkdsD8cC0Jz
 Vpyjo0WTzZ36mua6HHanAN9yHYtDCLVeUXlZSMTT0hqUsQwc7833DAxcJLmeTKj/De6BotzROjM
 25rN9FsZYbinvd8FnpV+DyxAtK8KMzkOfloD
X-Google-Smtp-Source: AGHT+IE6AyNQM4b5B1BKSWYNOLxyZfpSuMzjKikAnrr4mbs9Vwlqc3x13hdbXp0soFpmgvKWgI4/QA==
X-Received: by 2002:a05:6512:6ca:b0:542:23b3:d82c with SMTP id
 2adb3069b0e04-542844f69ebmr11602576e87.3.1736989607153; 
 Wed, 15 Jan 2025 17:06:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea676bsm2200782e87.126.2025.01.15.17.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:06:45 -0800 (PST)
Date: Thu, 16 Jan 2025 03:06:43 +0200
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
Subject: Re: [PATCH 27/29] drm/bridge: tc358775: Switch to atomic commit
Message-ID: <l2qhiief72s3x4yl4empx4ef76jfp27aaybgqy6d4j2uee2n7x@jrt2erhhvu5l>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-27-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-27-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:34PM +0100, Maxime Ripard wrote:
> The tc358775 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 32 +++++++++++---------------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 0b4efaca6d682320b76ce09ed41824ae7f84ca2d..8f8ed8dc033daf001fc188d919fb38918673bd72 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -285,11 +285,12 @@ struct tc_data {
>  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
>  {
>  	return container_of(b, struct tc_data, bridge);
>  }
>  
> -static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> +static void tc_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	struct device *dev = &tc->dsi->dev;
>  	int ret;
>  
> @@ -308,11 +309,12 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
>  
>  	gpiod_set_value(tc->reset_gpio, 0);
>  	usleep_range(10, 20);
>  }
>  
> -static void tc_bridge_post_disable(struct drm_bridge *bridge)
> +static void tc_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	struct device *dev = &tc->dsi->dev;
>  	int ret;
>  
> @@ -367,34 +369,22 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
>  	if (ret < 0)
>  		dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
>  			ret, addr);
>  }
>  
> -/* helper function to access bus_formats */
> -static struct drm_connector *get_connector(struct drm_encoder *encoder)
> -{
> -	struct drm_device *dev = encoder->dev;
> -	struct drm_connector *connector;
> -
> -	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> -		if (connector->encoder == encoder)
> -			return connector;
> -
> -	return NULL;
> -}
> -
> -static void tc_bridge_enable(struct drm_bridge *bridge)
> +static void tc_bridge_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
>  	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
>  	u32 val = 0;
>  	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
>  	struct drm_display_mode *mode;
> -	struct drm_connector *connector = get_connector(bridge->encoder);
> +	struct drm_connector *connector = bridge_state->connector;
>  
> -	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	mode = &bridge_state->crtc->state->adjusted_mode;
>  
>  	hback_porch = mode->htotal - mode->hsync_end;
>  	hsync_len  = mode->hsync_end - mode->hsync_start;
>  	vback_porch = mode->vtotal - mode->vsync_end;
>  	vsync_len  = mode->vsync_end - mode->vsync_start;
> @@ -599,14 +589,14 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  				 &tc->bridge, flags);
>  }
>  
>  static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.attach = tc_bridge_attach,
> -	.pre_enable = tc_bridge_pre_enable,
> -	.enable = tc_bridge_enable,
> +	.atomic_pre_enable = tc_bridge_atomic_pre_enable,
> +	.atomic_enable = tc_bridge_atomic_enable,
>  	.mode_valid = tc_mode_valid,
> -	.post_disable = tc_bridge_post_disable,
> +	.atomic_post_disable = tc_bridge_atomic_post_disable,

Same comment: we have to provide state-management callbacks.

>  };
>  
>  static int tc_attach_host(struct tc_data *tc)
>  {
>  	struct device *dev = &tc->i2c->dev;
> 
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry
