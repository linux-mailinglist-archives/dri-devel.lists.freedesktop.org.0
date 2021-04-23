Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CFF3694E4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5B6E111;
	Fri, 23 Apr 2021 14:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802D96E111
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:38:58 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 i3-20020a4ad3830000b02901ef20f8cae8so3410748oos.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j7H66Q86PkqXddsGRSzDhW4KjXrdQxkyswMmMQ3oN5g=;
 b=mlD/Ib2JrhwFrgExe+x3hpDMlp3RSrHYB2tNVu80feRxTbqvMd2QpOlutN+Rvkuj+T
 jBH8i54eqXVT66gSXFoYtUnLqdwYCLUUJQFjkS4kt8REhBbXQWZcBYxwpoyMfx1yNMNo
 M913qVUpb3psQIYYSm6wx7eqSNIv080KznTJ0cIbr4jzW3P+2pTq49VJAqtFwpFB6idM
 Qv4uBcCraytQe0aAXGWs4XVIS5ufcxmo8HxWNQU2rX/v1bQ3TvRsrDyL+PAeheN7A7ib
 EV6NHRAjFz+0xzRqDpi9cLCKAbRRcj4ZrC69Zw/jTNcUD3ij2d5xAHXhHo7YrKZxZYBm
 du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j7H66Q86PkqXddsGRSzDhW4KjXrdQxkyswMmMQ3oN5g=;
 b=US3EOnlquyzH7sXil//GGYHYEV00rG7HuwxP8tqYZfUqUw8YEf8URITPqyNUrwrHUx
 i++xg3tJlkMIPcL6QRH7WfoEbX3H0OtZu11wUMrAe07X0xldz2f88CL+EgxaAfXDm+KB
 3xuuCWRmoze7Yh/win3ary27Mxczuu4DRRNmlek69mmJpIjcKo6YjJBcHI29eFBbq3CI
 YXQLtGeYpZXQ8ewHqJrfdlX1TEuFayCzVrbbxBwAg0Ov0b4Zi3MKcu/tFQEq7Y5O7nOG
 Iu7vG2oB+n133UTBt9PwEgEtMIG6H8XZ3wru7fG4VUYYXwlCVxsH3aDFrGnNRV081XQC
 /Ccg==
X-Gm-Message-State: AOAM531K8JlB7zqUa9sKY7T9F1xNCd3rvJJL971eFHK+2GdW3c3u5GUP
 fevKj9gd+38O1C5kPR1tfAFarA==
X-Google-Smtp-Source: ABdhPJzZGbgXls4SipwM18uE0byctPAhPmlAZL5eg5eOD8s1W1zn+bjHr0I25Veo5FZM9qcw9Km5YQ==
X-Received: by 2002:a4a:765c:: with SMTP id w28mr3325562ooe.8.1619188737811;
 Fri, 23 Apr 2021 07:38:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q23sm1395627otc.7.2021.04.23.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:38:57 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:38:55 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 12/27] drm/bridge: ti-sn65dsi86: Cleanup managing of
 drvdata
Message-ID: <YILb/xBRWvJH7UAL@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.12.If5d4d4e22e97bebcd493b76765c1759527705620@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.12.If5d4d4e22e97bebcd493b76765c1759527705620@changeid>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Let's:
> - Set the drvdata as soon as it's allocated. This just sets up a
>   pointer so there's no downside here.
> - Remove the useless call to i2c_set_clientdata() which is literally
>   the same thing as dev_set_drvdata().
> 
> No functional changes intended.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 2cbf619fbd27..a200e88fd006 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1238,6 +1238,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
> +	dev_set_drvdata(dev, pdata);
> +	pdata->dev = dev;
>  
>  	pdata->regmap = devm_regmap_init_i2c(client,
>  					     &ti_sn65dsi86_regmap_config);
> @@ -1246,16 +1248,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return PTR_ERR(pdata->regmap);
>  	}
>  
> -	pdata->dev = dev;
> -
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
>  	if (ret) {
>  		DRM_ERROR("could not find any panel node\n");
>  		return ret;
>  	}
>  
> -	dev_set_drvdata(dev, pdata);
> -
>  	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(pdata->enable_gpio)) {
>  		DRM_ERROR("failed to get enable gpio from DT\n");
> @@ -1287,8 +1285,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	i2c_set_clientdata(client, pdata);
> -
>  	pdata->aux.name = "ti-sn65dsi86-aux";
>  	pdata->aux.dev = dev;
>  	pdata->aux.transfer = ti_sn_aux_transfer;
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
