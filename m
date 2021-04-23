Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9C36951D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F486EBC4;
	Fri, 23 Apr 2021 14:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D516EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:51:31 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u16so32107776oiu.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EJM6pcyl5JpVhByUSBnFL3WnPUaWSbf6IkyIpm5v1k0=;
 b=BZlG4390wuLg5aXUToizN7kM6ql25OpmR5pOWw+rrhzNUcGe4Bcnt0O2J4gM35lPEb
 JxjMmMF0XSlrFkhrgqHzh9pYerbsZWdHKJVrQMcekzegzPGarMTIV/B7SK20ajESfOMe
 OnXYqeGxvoIH1+D4ua/SCEbLInqQDZglV4gERWblGVvYFrJu1jqjW7YbrZSOMqTALYWP
 HikgNxpLniYY8CRv9ii4L9utkPxgg5x1ZQ11Fo0kQVmRgIJEMq0fTJBTgM47a1NRxESu
 sdypenaNA7+K5ZVeF9S4OyJL0Dzv81Hm8JboWGoGizNbZZsLFZflqy2wqT8n3cj7vWiW
 euCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EJM6pcyl5JpVhByUSBnFL3WnPUaWSbf6IkyIpm5v1k0=;
 b=j5EWVryOzeBhcsG2w6mDfY/3v0O9ZUqG2iRVPkJhIVqReLajNuJeXRopOfrb00JNld
 kQr+Ru2L/kbi8RK45/MGoShjLzSNDsjW0+z8PDujZL5PJ6GZWfdjhHX8MXg2US3nIMoq
 RqrAMUj0cnZXwmT2XbZMlxn1EdKti6V50h0Rt09UTc4gmXD7kAGwy/b6TjYZCSKlteoV
 DY/V+ZJFUkoC7gqrbBKLGmsyIlICJoznpW1HBG55UCkNxPSTeks86lqDjF4QtEGksvWj
 wdsfbj1b5haJeOPt5oeiCw6oYJMcVSKkZH3QyINW5XFueM24sA+lWklhujdStikCAs6c
 kU+A==
X-Gm-Message-State: AOAM531NIM71C+A15/JEgWQ5FPC8eM5YMZIiSzJMEglHF1ENUA/+swJz
 1WFNk15hd+8jyKQniYHYox3eyw==
X-Google-Smtp-Source: ABdhPJypPkXURU9wCcUA9qAGTFRHLghubKiKXtHZ1oSHCwTXEJQAGZNqpwuAdUzgZLo69Ia2QRkSEA==
X-Received: by 2002:aca:4749:: with SMTP id u70mr3017886oia.34.1619189490542; 
 Fri, 23 Apr 2021 07:51:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w9sm1288105oiv.8.2021.04.23.07.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:51:30 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:51:28 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 17/27] drm/bridge: ti-sn65dsi86: Use pm_runtime
 autosuspend
Message-ID: <YILe8KziQNalL994@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
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

> Let's make the bridge use autosuspend with a 500ms delay. This is in
> preparation for promoting DP AUX transfers to their own sub-driver so
> that we're not constantly powering up and down the device as we
> transfer all the chunks.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 44edcf6f5744..a98abf496190 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
>  		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
>  	}
>  
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	return 0;
>  }
> @@ -292,7 +292,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	if (!edid) {
>  		pm_runtime_get_sync(pdata->dev);
>  		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put(pdata->dev);
> +		pm_runtime_put_autosuspend(pdata->dev);
>  	}
>  
>  	if (edid && drm_edid_is_valid(edid)) {
> @@ -418,7 +418,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	/* check if continuous dsi clock is required or not */
>  	pm_runtime_get_sync(pdata->dev);
>  	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  	if (!(val & DPPLL_CLK_SRC_DSICLK))
>  		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
>  
> @@ -1049,7 +1049,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  	 */
>  	pm_runtime_get_sync(pdata->dev);
>  	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	if (ret)
>  		return ret;
> @@ -1100,7 +1100,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
>  	 * it off and when it comes back it will have lost all state, but
>  	 * that's OK because the default is input and we're now an input.
>  	 */
> -	pm_runtime_put(pdata->dev);
> +	pm_runtime_put_autosuspend(pdata->dev);
>  
>  	return 0;
>  }
> @@ -1126,7 +1126,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
>  				 SN_GPIO_MUX_OUTPUT << shift);
>  	if (ret) {
>  		clear_bit(offset, pdata->gchip_output);
> -		pm_runtime_put(pdata->dev);
> +		pm_runtime_put_autosuspend(pdata->dev);
>  	}
>  
>  	return ret;
> @@ -1408,6 +1408,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>  	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
>  	if (ret)
>  		return ret;
> +	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
> +	pm_runtime_use_autosuspend(pdata->dev);
>  
>  	ti_sn65dsi86_debugfs_init(pdata);
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
