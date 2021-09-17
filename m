Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B840F8ED
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 15:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D716EC7C;
	Fri, 17 Sep 2021 13:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72646EC7C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 13:15:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 140so7351178wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=863rDzgm6GPiRv2oz/rPhhprRER5SGAc3WVRBtM2tnE=;
 b=TQKTNnByl8lrFJJnM6mkJKrtO151zspcTYnmNdL1C2FPpyL/letcPBZ/EOxBHLJqQs
 H78AN8Ji0C/IOOOm81ChYRSPbc5qjkO7y2Z9A1vGYluXDrCgR5woB8l29xee4I6HnsaK
 CsHj1pt//Jy4hJrRSLfu+qkCTLfymvmOWvVGqtvQ/LL/6EuFg/D7x1rCSg57dA9S40yx
 Zua8fZzlTWpcS9AQmsfn7ltaEhgCpDrrYUmCIi2CmHA3PG6/FQOsxqRVtOH3Sfh0m4pL
 +F3ZqDhAg9Qe2KCDZXsqewjFzRom5hLU8zoymoW9kauu+jvTdxOyr8oaaTMBFmWk6lov
 fjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=863rDzgm6GPiRv2oz/rPhhprRER5SGAc3WVRBtM2tnE=;
 b=m+P/psTx35wsdZ9MHqN27wjB0bPDQKCGzB6KCIC/BrElA5OB+sNjfFqHpaLaWLk7Pm
 u40/kA/7/yWEjXfuQSHKn+BO095SoSjp0Ws1LnJ4jlYcFLbk1KKZ5hT2Os2+w6yqgXGD
 dZAgn5vatJuPs3sz0fgsIIaWqHn9ifyfWF4ZEXyZ8Q9DVqy/E8qcxO/Jtb9wPXa9lICM
 QFH/wqWfo2dW7qgF2lcNEyasGuVVHmQf0ufnuHjERtbQu0/KciE3cwyOe/D+0FmtuPnI
 cmQFM+MNG4KzuXQKRrFoC+O5Y/KAb0SgA18QFmRjGX7Dkx4d6quF8xumvaPJffp1lGL9
 QO7A==
X-Gm-Message-State: AOAM530Gbw3jouNqlI6ddJA20PmT95r7upvhK5ONh7DcS0F/e0kAgCkp
 /SBZdNDcaDRV88hafl74h0GHyQ==
X-Google-Smtp-Source: ABdhPJwTAX3Mp0CKA9u+J2sMTE2qBrnRf02sEzm9iBGJV7sTxVQgo6eAjiU1eSdpqSp8hutpl4NI9A==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr15355800wmc.3.1631884531273; 
 Fri, 17 Sep 2021 06:15:31 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v10sm7031284wri.29.2021.09.17.06.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 06:15:30 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:15:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] video: backlight: Make use of the helper function
 dev_err_probe()
Message-ID: <20210917131529.3oc7xeb4xpvgq5og@maple.lan>
References: <20210917125324.18031-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917125324.18031-1-caihuoqing@baidu.com>
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

On Fri, Sep 17, 2021 at 08:53:23PM +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2: backlight patches are handled in one

This appears to leave a lot of backlight drivers with the same code
pattern that are not updated. As my last e-mail, please can you explain
why you selected these drivers and no others?

I would expect this type of change to be made with the assistance of a
script to automatically help you identify and change the code patterns
you are targetting. This would allow you to update all the backlight
drivers at once.


Daniel.


>  drivers/video/backlight/bd6107.c      | 16 +++++--------
>  drivers/video/backlight/l4f00242t03.c | 34 ++++++++++-----------------
>  2 files changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
> index 515184fbe33a..e21b793302a2 100644
> --- a/drivers/video/backlight/bd6107.c
> +++ b/drivers/video/backlight/bd6107.c
> @@ -120,7 +120,6 @@ static int bd6107_probe(struct i2c_client *client,
>  	struct backlight_device *backlight;
>  	struct backlight_properties props;
>  	struct bd6107 *bd;
> -	int ret;
>  
>  	if (pdata == NULL) {
>  		dev_err(&client->dev, "No platform data\n");
> @@ -148,11 +147,9 @@ static int bd6107_probe(struct i2c_client *client,
>  	 * the reset.
>  	 */
>  	bd->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(bd->reset)) {
> -		dev_err(&client->dev, "unable to request reset GPIO\n");
> -		ret = PTR_ERR(bd->reset);
> -		return ret;
> -	}
> +	if (IS_ERR(bd->reset))
> +		return dev_err_probe(&client->dev, PTR_ERR(bd->reset),
> +				     "unable to request reset GPIO\n");
>  
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
> @@ -164,10 +161,9 @@ static int bd6107_probe(struct i2c_client *client,
>  					      dev_name(&client->dev),
>  					      &bd->client->dev, bd,
>  					      &bd6107_backlight_ops, &props);
> -	if (IS_ERR(backlight)) {
> -		dev_err(&client->dev, "failed to register backlight\n");
> -		return PTR_ERR(backlight);
> -	}
> +	if (IS_ERR(backlight))
> +		return dev_err_probe(&client->dev, PTR_ERR(backlight),
> +				     "failed to register backlight\n");
>  
>  	backlight_update_status(backlight);
>  	i2c_set_clientdata(client, backlight);
> diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
> index 46f97d1c3d21..8d81d4dec3c6 100644
> --- a/drivers/video/backlight/l4f00242t03.c
> +++ b/drivers/video/backlight/l4f00242t03.c
> @@ -179,37 +179,29 @@ static int l4f00242t03_probe(struct spi_device *spi)
>  	priv->spi = spi;
>  
>  	priv->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(priv->reset)) {
> -		dev_err(&spi->dev,
> -			"Unable to get the lcd l4f00242t03 reset gpio.\n");
> -		return PTR_ERR(priv->reset);
> -	}
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(&spi->dev, PTR_ERR(priv->reset),
> +				     "Unable to get the lcd l4f00242t03 reset gpio.\n");
>  	gpiod_set_consumer_name(priv->reset, "lcd l4f00242t03 reset");
>  
>  	priv->enable = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
> -	if (IS_ERR(priv->enable)) {
> -		dev_err(&spi->dev,
> -			"Unable to get the lcd l4f00242t03 data en gpio.\n");
> -		return PTR_ERR(priv->enable);
> -	}
> +	if (IS_ERR(priv->enable))
> +		return dev_err_probe(&spi->dev, PTR_ERR(priv->enable),
> +				     "Unable to get the lcd l4f00242t03 data en gpio.\n");
>  	gpiod_set_consumer_name(priv->enable, "lcd l4f00242t03 data enable");
>  
>  	priv->io_reg = devm_regulator_get(&spi->dev, "vdd");
> -	if (IS_ERR(priv->io_reg)) {
> -		dev_err(&spi->dev, "%s: Unable to get the IO regulator\n",
> -		       __func__);
> -		return PTR_ERR(priv->io_reg);
> -	}
> +	if (IS_ERR(priv->io_reg))
> +		return dev_err_probe(&spi->dev, PTR_ERR(priv->io_reg),
> +				     "%s: Unable to get the IO regulator\n", __func__);
>  
>  	priv->core_reg = devm_regulator_get(&spi->dev, "vcore");
> -	if (IS_ERR(priv->core_reg)) {
> -		dev_err(&spi->dev, "%s: Unable to get the core regulator\n",
> -		       __func__);
> -		return PTR_ERR(priv->core_reg);
> -	}
> +	if (IS_ERR(priv->core_reg))
> +		return dev_err_probe(&spi->dev, PTR_ERR(priv->core_reg),
> +				     "%s: Unable to get the core regulator\n", __func__);
>  
>  	priv->ld = devm_lcd_device_register(&spi->dev, "l4f00242t03", &spi->dev,
> -					priv, &l4f_ops);
> +					    priv, &l4f_ops);
>  	if (IS_ERR(priv->ld))
>  		return PTR_ERR(priv->ld);
>  
> -- 
> 2.25.1
> 
