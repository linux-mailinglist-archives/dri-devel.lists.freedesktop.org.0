Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C483694DD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD1D6E101;
	Fri, 23 Apr 2021 14:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C136E101
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:38:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso43561987otb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NRE9QbrX/aDzI7BokRhqkKTHnKj1gy2yobJ+pmPUges=;
 b=JnjnE8scoMKiMsn2WI2JJGApFjwHhkXV2h1hZ6aowI6ySX76qoFvwJEeJ5b8u3MHfO
 DIeUi4Tp72ybADLKCPQwCAfW5e0KYT+TW7nLX/wTaFpY8DIyRIGOOFf9eNa+kewocn1y
 fPGI1GPbbbkQPwQN2tJjZ23JgJi2jB+mgXEt2ZBVL+yRtxJIyBNW6uwqvgt2MBkj6iWJ
 65C0DcxS23+1iCUJkamBc1gdTDF1D05rxtam11/PJOx18XhXES1x45j1T5fTMe6oLyZo
 lM/oTkbkS8PK+ILWbvqR7HJOzjQYnkOTaDC5+X51lz9dWoV/U2CnLG1TvtLVZ76pgqt1
 nBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NRE9QbrX/aDzI7BokRhqkKTHnKj1gy2yobJ+pmPUges=;
 b=VeVJS1tXdSvbzgOkraK3kppNtmpzN1PkN4xXrhavOymmR9Lk5Q6ZHCCToq6kmjDJ5Q
 ve9woQCxiN4w/0PFf9UpLsuvE7DTNrjHrSMad/57bWxgT7sVjr2dDj0CgXeqhZgU6pM+
 4mQ95uMoJzXUHg/oXPXpybJyuhQWCMxLbjkcKOCqJypFjqfe1t9oe17jKIe8wrOoxzcE
 zaEaUE23vOmCw5hwTKhkKGS+HvsioDtoaJ+Voa3/pGpuy+US1R5u7FzZBkuS/Mp5qwYQ
 EDhwhx0ey3tPfw962rK0bUJtGvBrafRYE3aJUTSvWl3q2U6XWyfUG7GxF7wIxERhYAQD
 hCyA==
X-Gm-Message-State: AOAM531Wfah6CD+Cb/5coMu4S/PvSfD9/CwuKT6ZU0bNzylk+5YWVR/7
 Q9G2jYyAfC8wNGgbCIe1bTa8lg==
X-Google-Smtp-Source: ABdhPJyIuk+s7BfatZ+LX3Jze2EUeAMDwGu3pEcnv7gx4wV+urxaFqMUx6OtitjHOT/734tTtUfVEA==
X-Received: by 2002:a05:6830:1af7:: with SMTP id
 c23mr3799532otd.3.1619188692103; 
 Fri, 23 Apr 2021 07:38:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w84sm1308335oig.20.2021.04.23.07.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:38:11 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:38:09 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 11/27] drm/bridge: ti-sn65dsi86: Add local var for
 "dev" to simplify probe
Message-ID: <YILb0Q79huUgGgd1@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
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

> Tiny cleanup for probe so we don't keep having to specify
> "&client->dev" or "pdata->dev". No functional changes intended.
> 

Nice

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 0c6aa99ddc99..2cbf619fbd27 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1226,6 +1226,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>  static int ti_sn65dsi86_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> +	struct device *dev = &client->dev;
>  	struct ti_sn65dsi86 *pdata;
>  	int ret;
>  
> @@ -1234,8 +1235,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>  
> -	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
> -			     GFP_KERNEL);
> +	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
>  
> @@ -1246,26 +1246,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return PTR_ERR(pdata->regmap);
>  	}
>  
> -	pdata->dev = &client->dev;
> +	pdata->dev = dev;
>  
> -	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> -					  &pdata->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
>  	if (ret) {
>  		DRM_ERROR("could not find any panel node\n");
>  		return ret;
>  	}
>  
> -	dev_set_drvdata(&client->dev, pdata);
> +	dev_set_drvdata(dev, pdata);
>  
> -	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
> -					    GPIOD_OUT_LOW);
> +	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(pdata->enable_gpio)) {
>  		DRM_ERROR("failed to get enable gpio from DT\n");
>  		ret = PTR_ERR(pdata->enable_gpio);
>  		return ret;
>  	}
>  
> -	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
> +	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
>  
>  	ret = ti_sn65dsi86_parse_regulators(pdata);
>  	if (ret) {
> @@ -1273,7 +1271,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	pdata->refclk = devm_clk_get_optional(dev, "refclk");
>  	if (IS_ERR(pdata->refclk))
>  		return PTR_ERR(pdata->refclk);
>  
> @@ -1281,23 +1279,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(pdata->dev);
> +	pm_runtime_enable(dev);
>  
>  	ret = ti_sn_setup_gpio_controller(pdata);
>  	if (ret) {
> -		pm_runtime_disable(pdata->dev);
> +		pm_runtime_disable(dev);
>  		return ret;
>  	}
>  
>  	i2c_set_clientdata(client, pdata);
>  
>  	pdata->aux.name = "ti-sn65dsi86-aux";
> -	pdata->aux.dev = pdata->dev;
> +	pdata->aux.dev = dev;
>  	pdata->aux.transfer = ti_sn_aux_transfer;
>  	drm_dp_aux_init(&pdata->aux);
>  
>  	pdata->bridge.funcs = &ti_sn_bridge_funcs;
> -	pdata->bridge.of_node = client->dev.of_node;
> +	pdata->bridge.of_node = dev->of_node;
>  
>  	drm_bridge_add(&pdata->bridge);
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
