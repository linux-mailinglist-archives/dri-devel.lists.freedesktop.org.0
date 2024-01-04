Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EF824349
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2977510E15F;
	Thu,  4 Jan 2024 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C84610E15F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 14:08:25 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id LOOSrLWbxQhj4LOOSruDmn; Thu, 04 Jan 2024 15:08:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1704377304;
 bh=AmaWgiCBszsRzKx9yuitDxgMmje90hv7fadfNNATm+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FyZMz01YX0Tw3hBtFEoZeVGGECM14rbYltZqrQn2Q0Txau1v2w+fGQ+g/6eKl2GnD
 s+Vwf0NET8jIbp+KxLuJGT6o02BET4IFfBsmzPVQPjnpDvdWO8tY68ktYPL8LzjJu+
 4HQXaEVJUkPOCnuuu/sCbisaJcdwqJkh5Cv0W9CmfJM1FV2DntOGTO6BEs1RAkB5kz
 JBJ5Z2Idz25qdwe5hnG3qsigbIVW3FmDDnb25gmfb+TdPxXgpGhbbDZ+PMdhZZ9Ts+
 xmbv+oTd5cAv0tow+RJ2RKHTEeK5r3bKuuB5VIWkuRxl69lMwSAZM4knKHjVjRyub8
 3FpdUG4/uRE1A==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 04 Jan 2024 15:08:24 +0100
X-ME-IP: 92.140.202.140
Message-ID: <5a8463c6-1390-4a53-8373-5b9549e79070@wanadoo.fr>
Date: Thu, 4 Jan 2024 15:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: ltk050h3146w: use dev_err_probe wherever
 possible
Content-Language: fr
To: Quentin Schulz <foss+kernel@0leil.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104-ltk-dev_err_probe-v1-0-8ef3c0b585d8@theobroma-systems.com>
 <20240104-ltk-dev_err_probe-v1-2-8ef3c0b585d8@theobroma-systems.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240104-ltk-dev_err_probe-v1-2-8ef3c0b585d8@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 04/01/2024 à 13:41, Quentin Schulz a écrit :
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This is only a cosmetic change.
> 
> This replaces a hand-crafted EPROBE_DEFER handling for deciding to print
> an error message with dev_err_probe.
> 
> A side-effect is that dev_err_probe also adds a debug message when it's
> not EPROBE_DEFER, but this is seen as an improvement.
> 
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index ecfa4181c4fd9..9d87cc1a357e3 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -650,20 +650,13 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "cannot get reset gpio\n");
>   
>   	ctx->vci = devm_regulator_get(dev, "vci");
> -	if (IS_ERR(ctx->vci)) {
> -		ret = PTR_ERR(ctx->vci);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to request vci regulator: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ctx->vci))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vci), "Failed to request vci regulator\n");
>   
>   	ctx->iovcc = devm_regulator_get(dev, "iovcc");
> -	if (IS_ERR(ctx->iovcc)) {
> -		ret = PTR_ERR(ctx->iovcc);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to request iovcc regulator: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ctx->iovcc))
> +		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
> +				     "Failed to request iovcc regulator\n");
>   
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
> 

