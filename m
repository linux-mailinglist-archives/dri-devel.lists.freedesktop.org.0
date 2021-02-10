Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204B316793
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 14:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA466EC80;
	Wed, 10 Feb 2021 13:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D255B6EC91
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 13:11:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l12so2502958wry.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 05:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=s03sQ832SgXdiNDUmP03CTP+mq4NdcSn/+dYlfQmwcc=;
 b=PxY1ItijCBx9yZt9GDoetR+Op0lQC/DWXgC1sXU8fsSETfJLCku2M5hbsJux72ypT5
 68s4xbs4GCHobFHT7aJxRgV07aKZpAXtydg1v/Qes/K+Ik5pM7mCeU3qwizOHDmmyIYp
 9SV2Ipl+/MBK+WwF1Bx5MDU8zdm3twTWHnTQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=s03sQ832SgXdiNDUmP03CTP+mq4NdcSn/+dYlfQmwcc=;
 b=Z4Tn/NQ2w4YuKV1ODCNi0DxE0A6DhJJRmw2JgsbfAmeMlejkTIcSjTmMeHeF0Np2ri
 228Z3WRcx6e8AUg8rfujI+qFDyeNbMU/b/CGRaLp7/+y29O0g7drIPU1Gp4jzshRP0W9
 EBYDhjFhlMlTikkZ/n8Hk8krcqw5TAcUqM8FzlOftmjRuHbj9q7hvlfTpctOqr8He2xl
 GtR2RpewW6rY274N/VOxi/8aTCvgQC+aqG+gINXlNx1dU0hquS1kToalYOhjmS6eliTz
 dy6i6+Kz5F8S5Dd2zyUSP9HfkrKkiFb3de4vLkGYs6J4BVVkkvi6QJvz4JtWQfqAZ8B4
 vAAg==
X-Gm-Message-State: AOAM532hn5c8BKHMt/xna7SPbRm0TcqFLZUoh1Kt7HqLZ5SE88qadQF4
 7HJiFtTljhWyS8g6w21uZAh+/g==
X-Google-Smtp-Source: ABdhPJxvQIoEeHx1VzpIFLhKqb997h456wb6uD0Jberkt3N+Tp+np8Vt694+JDyf4Mgk3yBG1UKPVQ==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr3686880wrl.4.1612962677521;
 Wed, 10 Feb 2021 05:11:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a84sm2430371wme.12.2021.02.10.05.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:11:16 -0800 (PST)
Date: Wed, 10 Feb 2021 14:11:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] drm: use getter/setter functions
Message-ID: <YCPbctaFCApnwOmT@phenom.ffwll.local>
Mail-Followup-To: Julia Lawall <Julia.Lawall@inria.fr>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
References: <20210209211304.1261740-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209211304.1261740-1-Julia.Lawall@inria.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Andrew Jeffery <andrew@aj.id.au>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 10:13:04PM +0100, Julia Lawall wrote:
> Use getter and setter functions, for platform_device structures and a
> mipi_dsi_device structure.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to drm-misc-next, thanks for the patch.
-Daniel
> 
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             |    2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |    2 +-
>  drivers/gpu/drm/panel/panel-lvds.c                  |    2 +-
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         |    4 ++--
>  drivers/gpu/drm/panel/panel-simple.c                |    2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c            |    2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..9858079f9e14 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4800,7 +4800,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
>  
>  	err = mipi_dsi_attach(dsi);
>  	if (err) {
> -		struct panel_simple *panel = dev_get_drvdata(&dsi->dev);
> +		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
>  
>  		drm_panel_remove(&panel->base);
>  	}
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index 0ee508576231..3939b25e6666 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -267,7 +267,7 @@ static int seiko_panel_probe(struct device *dev,
>  
>  static int seiko_panel_remove(struct platform_device *pdev)
>  {
> -	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
> +	struct seiko_panel *panel = platform_get_drvdata(pdev);
>  
>  	drm_panel_remove(&panel->base);
>  	drm_panel_disable(&panel->base);
> @@ -277,7 +277,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
>  
>  static void seiko_panel_shutdown(struct platform_device *pdev)
>  {
> -	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
> +	struct seiko_panel *panel = platform_get_drvdata(pdev);
>  
>  	drm_panel_disable(&panel->base);
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 654bc52d9ff3..bd5ba10822c2 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -725,7 +725,7 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
>  
>  static int rockchip_lvds_remove(struct platform_device *pdev)
>  {
> -	struct rockchip_lvds *lvds = dev_get_drvdata(&pdev->dev);
> +	struct rockchip_lvds *lvds = platform_get_drvdata(pdev);
>  
>  	component_del(&pdev->dev, &rockchip_lvds_component_ops);
>  	clk_unprepare(lvds->pclk);
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 457ec04950f7..c7707338bfdb 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -284,7 +284,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	dev_set_drvdata(&pdev->dev, priv);
> +	platform_set_drvdata(pdev, priv);
>  
>  	ret = sysfs_create_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
>  	if (ret)
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..989a05bc8197 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2457,7 +2457,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  
>  static int cdns_mhdp_remove(struct platform_device *pdev)
>  {
> -	struct cdns_mhdp_device *mhdp = dev_get_drvdata(&pdev->dev);
> +	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
>  	unsigned long timeout = msecs_to_jiffies(100);
>  	bool stop_fw = false;
>  	int ret;
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 66c7d765b8f7..59a8d99e777d 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -244,7 +244,7 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  
>  static int panel_lvds_remove(struct platform_device *pdev)
>  {
> -	struct panel_lvds *lvds = dev_get_drvdata(&pdev->dev);
> +	struct panel_lvds *lvds = platform_get_drvdata(pdev);
>  
>  	drm_panel_remove(&lvds->panel);
>  
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
