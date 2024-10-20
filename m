Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC49A53CC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D0110E08D;
	Sun, 20 Oct 2024 11:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RziD2Igh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444BC10E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:34:35 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so34266711fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729424073; x=1730028873; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QC0KnB6o2h4mn/hVK+dZGyuz3d5o2C5KLZTYulXkdRQ=;
 b=RziD2Igh3pzANGUKg5DoEfK7TKmzWMVB8eaBl2tmyNt3i7k5+YqGJt8zpu3cnIjVQD
 6LPQkhZA3p8kvL0FQb7EkmoIymIad6cdu8TCQIkoJSb68sDRTAwBELaZx8lmwwaGZXOQ
 mqkAS4e6ghh//97sHbZMoISjygslJ6VKo/7zOwkEHg/Y48tyRJSN9dIyNd9v/uQYwuxY
 84WeuBFjUJwBQbBkqwYSm7GlbvaSv4eToDiwXcsYiSPvxXX3JObPb8xyfR/67mrSfoBY
 xnm4+Tf70QDMPcPNoF0srqWvp6X3fNx39mizhy32klYmqeL8sVTIQBhP//vfhiXJ8Fo/
 rq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729424073; x=1730028873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QC0KnB6o2h4mn/hVK+dZGyuz3d5o2C5KLZTYulXkdRQ=;
 b=qV1fRdwe8Zu/X01viGSuND+W12/l83Tjh8pXvTVpFY2YV2Ya+TiZ9WTeP9k53RH70Z
 ptkUItWtBlzpRe4dMsgmrQ3AtLzNRT9Cb1q8YVA6ZNU/4gM0j+q3u2PYQPSqSWwWqaIw
 P6X5n860UEQ9mK+zeZyIxBoH1W3+UEuxWWMgswb2vtfxcBYs6jRiiie/FQbiF4FlZqpV
 8NRb9uZ14miRZCnqJ81v7oPciNdNtswQu4ACFSw96v/dRFcGTNVm9DgeIdg5H8XqEi4y
 oiVH2j2s2mORPqfhSJue6CTSQbzZ4b5xEzRF6AIxu8BzrJvyx+38+So1eSJHFDGRKU/v
 OptA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7dhjKRY1tkx2I3V3ihBMxH6h0Ln3HVq0WVlO0c7dOa7G73GPLu+moMjYYKerRAgBEZU+dM7NISVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdIkdgOfFYSxGN+dMhxxIve4UpYdEzuXog9eKv9INj6KMRjj1H
 Isi3xhha9BdBf3p+Q2WlseAJShYVPMz8J1JeP1fRFM9I8rdqgI3Cxe1hqNtBtOw=
X-Google-Smtp-Source: AGHT+IHw7JUxCsHiCWKAeBC9lGrE1QOYEOuzwLBF37sN/Bov8L27eTs6yeqUaRmGDeoT/SoNNTNn6w==
X-Received: by 2002:a05:6512:1384:b0:536:55a9:4b6c with SMTP id
 2adb3069b0e04-53a1545338fmr4077961e87.13.1729424073213; 
 Sun, 20 Oct 2024 04:34:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a2243edb9sm195178e87.274.2024.10.20.04.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:34:32 -0700 (PDT)
Date: Sun, 20 Oct 2024 14:34:30 +0300
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
Subject: Re: [PATCH v5 03/13] drm/bridge: cdns-dsi: Fix Phy _init() and _exit()
Message-ID: <i5o65ui4psc7b4hsqq5hl7t2hvf43xc7pmvlrcstjhqp2okwx3@izezpdd7tmk2>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019195411.266860-4-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019195411.266860-4-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:24:01AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Initialize the Phy during the cdns-dsi _resume(), and de-initialize it
> during the _suspend().
> 
> Also power-off the Phy from bridge_disable.

Please describe why, not what. Especially, if it is considered a fix.

> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 5159c3f0853e..d89c32bae2b9 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -672,6 +672,10 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
>  	if (dsi->platform_ops && dsi->platform_ops->disable)
>  		dsi->platform_ops->disable(dsi);
>  
> +	phy_power_off(dsi->dphy);
> +	dsi->link_initialized = false;
> +	dsi->phy_initialized = false;
> +
>  	pm_runtime_put(dsi->base.dev);
>  }
>  
> @@ -698,7 +702,6 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>  	       DPHY_CMN_PDN | DPHY_PLL_PDN,
>  	       dsi->regs + MCTL_DPHY_CFG0);
>  
> -	phy_init(dsi->dphy);

This moves the call order, moving phy_init() before
platform_ops->enable(). It should be documented with the clear pointer
that it considered to be safe.

>  	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
>  	phy_configure(dsi->dphy, &output->phy_opts);
>  	phy_power_on(dsi->dphy);
> @@ -1120,6 +1123,8 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
>  	clk_prepare_enable(dsi->dsi_p_clk);
>  	clk_prepare_enable(dsi->dsi_sys_clk);
>  
> +	phy_init(dsi->dphy);
> +
>  	return 0;
>  }
>  
> @@ -1127,10 +1132,11 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>  {
>  	struct cdns_dsi *dsi = dev_get_drvdata(dev);
>  
> +	phy_exit(dsi->dphy);
> +
>  	clk_disable_unprepare(dsi->dsi_sys_clk);
>  	clk_disable_unprepare(dsi->dsi_p_clk);
>  	reset_control_assert(dsi->dsi_p_rst);
> -	dsi->link_initialized = false;
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
