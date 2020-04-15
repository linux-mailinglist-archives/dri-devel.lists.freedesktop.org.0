Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713A1A9AD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 12:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC516E95E;
	Wed, 15 Apr 2020 10:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487336E95E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:38:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d27so9312901wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IrPL0bBBQDeF29Z4aLgq8ImOYXP6kd9vk4rNs7ZTqws=;
 b=yIAMMnZu4/5XkjVkCq32hl9Pn9SikmiyUmlKUEu7u/JAwTn5UxxsMyK4Mz2TFYtBJK
 8bK9XO32DspPZRUWcNCWbt434F5d59Z8Gp6+JI7VNiygAxfdd+dK18ew602ZlIrASmTB
 f+O8iv9zsJpKyROuS7I6KJHsds1z/or0RLiYq85eCFBcyejyW54bjjsycwzLwCGj81jO
 M5mgoA6CFO2R78EETs8ZwxWQ497GCVAIWtench+iCvLlMVYhQVf+KEUmYIFf/OsCqb7E
 u+lhG72eBlNLj5HqiKBPiX6FLhcupVCkG3ru861qNkNNR30/I6gDKk8HUXt2PeCOnnOi
 NGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IrPL0bBBQDeF29Z4aLgq8ImOYXP6kd9vk4rNs7ZTqws=;
 b=F+4LOz9cSnxq/gqMjBfqGQuenSAzf4Ozx/v41xza5sy2MVuBQVkCib9sjYy2EiKIaG
 G8H01WduGuc8IvAm7DHdD6mWF9v9gkZXG/70AwO9B1vbs2+lf9OKjH7RLkDTX5udF84H
 JCsqFI2xOt/Rgdr+CTeVKv+6Ib/QHSWNKIwQpcTKZAWR2LI9Chl0SbIQpFsqwuRykr8Z
 3KtU2l2Nyp9QO72UX8Xt13uXsXemLvhDPXI2cH5wjjP2JDCHhY0b4Wj9gVrrzmO4QkUM
 FuinS2WpwGIW5af3s4DemJharsRJIbksZhVhIvH+dAMlMwd8Yxti1a+bej197aqVcnwy
 waVA==
X-Gm-Message-State: AGi0PuZqx7u5lbiefssrkG3ZoaSGT5TBUDXV+n0+jKNUPdtsqlFzWUI4
 Qr6UvqRYoVnungNc2nS3S5W4SA==
X-Google-Smtp-Source: APiQypJfhW8S65Wxra9t0NaoxN8IlVd9vyp0bk8pl+XOImR8b/3RISiU1lKFKzoqVOuvy3de4k5SGA==
X-Received: by 2002:adf:e54c:: with SMTP id z12mr17403476wrm.276.1586947126830; 
 Wed, 15 Apr 2020 03:38:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z15sm10599204wrs.47.2020.04.15.03.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 03:38:46 -0700 (PDT)
Date: Wed, 15 Apr 2020 11:38:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200415103844.vnjccybvy5wtnrq6@holly.lan>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 10:09:59PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/tosa_lcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
> index e8ab583e5098..113116d3585c 100644
> --- a/drivers/video/backlight/tosa_lcd.c
> +++ b/drivers/video/backlight/tosa_lcd.c
> @@ -107,7 +107,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
>  	/* TG LCD GVSS */
>  	tosa_tg_send(spi, TG_PINICTL, 0x0);
>  
> -	if (!data->i2c) {
> +	if (IS_ERR_OR_NULL(data->i2c)) {
>  		/*
>  		 * after the pannel is powered up the first time,
>  		 * we can access the i2c bus so probe for the DAC
> @@ -119,7 +119,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
>  			.addr	= DAC_BASE,
>  			.platform_data = data->spi,
>  		};
> -		data->i2c = i2c_new_device(adap, &info);
> +		data->i2c = i2c_new_client_device(adap, &info);
>  	}
>  }
>  
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
