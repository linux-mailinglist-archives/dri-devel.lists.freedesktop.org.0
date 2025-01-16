Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E2A13859
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7C110E93B;
	Thu, 16 Jan 2025 10:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vCWqJBm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8393410E930
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:56:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540215984f0so893759e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737024989; x=1737629789; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oLwqBByLeWsf82TxhBAw7J4jDGpGwBW52ql37U6AKEk=;
 b=vCWqJBm5aaVGiAzlU3WF71KGAvGkRye/CjsSIQjvE7JnUoKyKwUJDU0p79uBEH/L2J
 WNXbbkIG9UypCJnDNkSdxWve0rIX+XFEZ3dSRoDY8YVS/+UCbIRhgTE432fZTauU9rdn
 dugSoP5fjlvw0+cFL2mqnCRErRyalMh2wCT2fS0RCNeUzKJQefiGPCVxP21AHwZzpoeW
 6mtysc+2RenSR3Q1d9IS6m5g710WlUUUPHEcGwTCaZA5v35xeiOq7c6+Q1rHV3fvvNaC
 AtL6LOTFXR1iVYcLRo9JoZ45j/JLcNDdFQQHfGtqGbvsGVDziFCYPXYDayt+zwK878Mj
 MeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737024989; x=1737629789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLwqBByLeWsf82TxhBAw7J4jDGpGwBW52ql37U6AKEk=;
 b=lkrZxYb4+SPPEMm9A2DA5wAyiE5lr68C8OVTTtejpf6CRaH14yvDeDD1FfvJhaF9Ni
 2IteRWB2uhQerETAqoIlI5NgBxrul5LUdUp6iW2kDNx8vbW2QeBLwQhNR0sCk9yOdnXK
 PMVsMXTPT2cLDxiLwYJPRcuWVKF9NzamdEQ+SwFfA8yVG9Z5xIGAjYJtD3GWmqbzlUbw
 xeYsgkKbq7DZ7Mo1cA3aozdbaETpPvE/AlKIxoTr+ucS/cHc3yCi7DOWV/FUZnxq71yQ
 GZassyu6cKY0yelNwYYexUqUuvRvKRGy36SZQgMXqnoadxF6Oz8sBtjA/AweeGk5Zd2E
 6h6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV57ZBYRT+8V7R/G5MOh4BbFto6qqMb0J4LJ4rDMIV+x/RF5pB6UQElzibYlS6mcIGbC747Y/j2YG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2pLx8GrarJF702zsZcYdj+dGonnPSW81KDauiNUd8K+1PwNde
 sTb8Y8iTLsJQKENgl3TG3VZt7uZTDKpzSZ95bFylLhWDydNJmoe+5QNv21vmmJg=
X-Gm-Gg: ASbGnctxleFyIy0e+rLk52Il0B8G1yjXMc5gmMrPuV99ztNFMxk8hpconQUQA6P8VI6
 w+UPLtzwqYX7uj8ikznc7SnILZVog9nPxs5fa819kULJgE0KaKH667WdwP5s6divYeFTqCAEmHc
 IzgHgx4ecwjlDXwwW2Pr1cQSpsDNEomx3+LIptAAD/s4MY2XLozKmZ00QCljAe3/sFzlcQHAI25
 Z5EYyaea5wzlXsu29nmAwvZgi/1Te/y+/yY2XHDEusJyit564R3/x2TWz/4LtZ5+IP0PV8qxpvB
 sGJfhq78xjQb/VZvvrJrECrlm8+16PooRKCw
X-Google-Smtp-Source: AGHT+IFjBheZVjWtGyWU8MRHgGImbjWHKh2gh51qLXWFLwCR48p/ob7J3ogeUQlMs8pnNuy6e6qBUA==
X-Received: by 2002:a05:6512:b02:b0:542:23c9:43ad with SMTP id
 2adb3069b0e04-542845e4b7fmr11872960e87.34.1737024989478; 
 Thu, 16 Jan 2025 02:56:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a67sm2282813e87.167.2025.01.16.02.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:56:28 -0800 (PST)
Date: Thu, 16 Jan 2025 12:56:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116113236.39ba876a@booty>
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

On Thu, Jan 16, 2025 at 11:32:36AM +0100, Luca Ceresoli wrote:
> Hello Dmitry, Maxime, All,
> 
> On Fri, 10 Jan 2025 11:58:19 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
> > Hi Dmitry,
> > 
> > On Thu, 2 Jan 2025 13:01:49 +0100
> > Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > 
> > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > > > >  	struct device *dev = dsi->dev;
> > > > >  	struct device_node *np = dev->of_node;
> > > > >  	struct device_node *remote;
> > > > > +	struct drm_bridge *out_bridge;
> > > > >  	struct drm_panel *panel;
> > > > >  	int ret;
> > > > >  
> > > > > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > > > >  
> > > > >  	panel = of_drm_find_panel(remote);
> > > > >  	if (!IS_ERR(panel)) {
> > > > > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > > > +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > > >  	} else {
> > > > > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > > > > -		if (!dsi->out_bridge)
> > > > > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > > > > +		out_bridge = of_drm_find_bridge(remote);
> > > > > +		if (!out_bridge)
> > > > > +			out_bridge = ERR_PTR(-EINVAL);
> > > > >  	}      
> > > > 
> > > > While looking at this patch, I think we should migrate the driver to
> > > > drm_of_find_panel_or_bridge().    
> > > 
> > > Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I'm
> > > going to convert it.  
> 
> I've been struggling to find a good way to handle the panel bridge
> lifetime, and still haven't found a way that looks totally good.
> Here's my analysis and some possible ways forward.
> 
> For "normal" bridges there is a device driver that probes, allocates a
> struct drm_bridge and registers it via drm_bridge_add() and at that
> point the bridge can be found by other drivers, such as the previous
> bridge or the encoder. Those "other drivers" will obtain a pointer to
> the struct drm_bridge and with refcounting they need to
> drm_bridge_put() it.
> 
> So there are two clearly separate roles: the provider (bridge driver)
> and the consumers (which gets/puts a pointer). So far so good.
> 
> And there are panels, which probe similarly as far as I can see.
> 
> And then there is the panel bridge. My understanding (which I'd love to
> get clarified in case it is not accurate) is that DRM bridges expect to
> always interact with "the next bridge", which cannot work for the last
> bridge of course, and so the panel bridge wraps the panel pretending it
> is a bridge.

Well.. There are some drivers that interact with the drm_panel directly.
However I think the tendency was to migrate to always having the bridge
instead. I.e. the only reason to interact with the panel directly seems
to be able to access panel timings instead of modes.

[skipeed 1 & 2]

> 
> Idea 3: 
> 
> The idea is that if the panel driver framework always creates a panel
> bridge, it will never need to be created on the fly automagically by
> its consumers, so the whole problem would disappear. It also would be
> better modeling the hardware: still wrapping a panel with a drm_bridge
> that does not exist in the hardware, but at least having it created by
> the provider driver and not by the consumer driver which happens to
> look for it.

I think this is the best option up to now.

> 
> This looks like a promising and simple idea, so I tried a quick
> implementation:
> 
>  void drm_panel_init(struct drm_panel *panel, struct device *dev,
>                     const struct drm_panel_funcs *funcs, int connector_type)
>  {
> +       struct drm_bridge *bridge;
> +
>         INIT_LIST_HEAD(&panel->list);
>         INIT_LIST_HEAD(&panel->followers);
>         mutex_init(&panel->follower_lock);
>         panel->dev = dev;
>         panel->funcs = funcs;
>         panel->connector_type = connector_type;
> +
> +       bridge = devm_drm_panel_bridge_add(panel->dev, panel);
> +       WARN_ON(!bridge);
>  }
> 
> This is somewhat working but it requires more work because:
> 
>  * as it is, it creates a circular dependency between drm_panel and the
>    panel bridge, and modular builds will fail:
> 
>      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> 
>  * The panel bridge implementation should be made private to the panel
>    driver only (possibly helping to solve the previous issue?)

Or merge drm_panel.c into bridge/panel.c. The panel bridge already
exports non-standard API, so it should be fine to extend / change that
API. Likewise we might move drm_panel.c to drm_kms_helper.o, also
resolving the loop. There will be a need for a Kconfig update in both
cases.

>  * Many drivers currently call devm_drm_panel_bridge_add() directly,
>    they should probably call drm_of_get_bridge instead

I'd say, make it a stub that calls drm_of_get_bridge() with a possible
deprecation warning.

> 
>  * drm_of_find_panel_or_bridge() should disappear: other drivers would
>    just look for a bridge

Please keep it for now.

Some of the drivers think that it returns literally panel-or-bridge (but
not both). However if panel bridge is already created, it will return
both. So those drivers need to be updated.

But in a longer term indeed  it should fade away.

> 
> Opinions about this idea?
> 
> Idea 4:
> 
> 'stop pretending there is always a "next bridge" after each bridge'
> looks like a _very_ long term goal, but it would be interesting to
> discuss whether this is a correct idea.
> 
> If you've been reading thus far, thanks for your patience! I'll be very
> glad to hear more opinions on all the above.
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
