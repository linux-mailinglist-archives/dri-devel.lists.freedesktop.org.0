Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CFDA2396C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 06:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D795710EA17;
	Fri, 31 Jan 2025 05:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cTQ6Mt/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7022F10EA17
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 05:48:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso1555068f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 21:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738302534; x=1738907334; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ipqnOsyfrju212SW/de3YbA7kXao55VqDRWRMe5iZjM=;
 b=cTQ6Mt/vXCAYJIO6EN6L1k3ZJMMavAt/cxRp8e3sPX5cDCT4b9kgRayTv1rYrp6ZP/
 ZLHGYiOCmTcJ/nhe0cOQQyGxcPqEQlW5aL9Uz4cZCMQVv8pvK+CveuEtFH+MGCyBjDY2
 bE5p2nwOc3SJx1uMzeHvj+u3/QjL/SPvFys5a0gzazLq6lJETYO75ddZ+nBbPZV42NOe
 FiehiOCdZKOKhQJg5mQS7Jsm9fFiEbrcBV9X9QpALGloTouvp6QqiC+qeLgW2YguLrdo
 J2239KWGx5wbaX7QXo/7c4KMSvOlK08O9Bd1UYBFPKrMV8env09NW4ieXsUDLdNG9Pin
 JmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738302534; x=1738907334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipqnOsyfrju212SW/de3YbA7kXao55VqDRWRMe5iZjM=;
 b=mi41d0YbjUrf3pDtT/z29XXDaDRGEFFW5hvw80kf7sYAdCPGVWlFxgs7jNKOpcj0f3
 fEOaCWs4SBbEmTsh0kjuqRWB4Nl5iepLPqTm2/SoZRB9FEvDsgn66q0fX4q9raSWDr3f
 QhwXp+lERO2f8+GIZnrAbjjGCsNZAgLlfHh7rjSKbE7tjGfNzY8WotE7Ht/Ggv5EXczC
 Gpy4y4nZaf5R/44buIwx/DDtQJWxFFzUXqgMht6+ynkF40/aXIh/3QUvOjhtsgYgeHB3
 a+ugrOTqXc78XOIsvOL4ICkwHuvG/FAsyyWrIlbEN8M77PPWcREW1TK9rklfrPmX0HGZ
 smGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYbTty7LrKR2A1uv/AVC5Lfo8dbyAKJDv85wARHdnfoW6z9iLFLHAq0EdJ3zfEhacPagdyiq+Hycs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHfpQHn6IJTeAg8Y0mS7brymy1wZRFL2x5XY5BMAQoZGqYfZdK
 Ulebnqmj2ZHPWya4zUKAXOfn2WD8M2icxPfCdroepik+1jdwLH/dna6jYQ2TdTE=
X-Gm-Gg: ASbGncvZrHEc+hCoDrsBQpQJ5LDNkzh2yKhxquXmwWkCteKls+UeA0baafG0NmhVqlq
 W3yuAjq1FmY+/SD9EfHd+RsW29XDKNedkwSnyVAXVjXUTODwI+J93BCOdOVA5+US1MKYm5RJMym
 G/MfvmpjpBtTrRb36sSSOZz3EhKMSXr9Uy4Z644IfgDhwAY6P0CJS/zf/FDYF/NFnQiRNNAYk6C
 00SaAktQpnuHhZCptXNFXRBcS3F3WyHNBhLOguYOngG1vFRWkyvIK+aCf11ToHhMRbNWi7MVV0H
 Hqg5qZJEd+2NIed38wVx
X-Google-Smtp-Source: AGHT+IE6Kvkz6eWsm/uHeQ8rAvBvZhd3/ICwJhrsFTfp4+AyK4yMDjJwpHtTQAGSOcKH8BF+6KZIPw==
X-Received: by 2002:a05:6000:2a6:b0:38c:2745:2df3 with SMTP id
 ffacd0b85a97d-38c51e95dc8mr10018488f8f.37.1738302533859; 
 Thu, 30 Jan 2025 21:48:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438d75de282sm63103555e9.2.2025.01.30.21.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 21:48:53 -0800 (PST)
Date: Fri, 31 Jan 2025 08:48:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3] drm/bridge: display-connector: implement the error
 path of .probe()
Message-ID: <349b0a91-fd0f-4feb-9351-f8c31ee7bbe2@stanley.mountain>
References: <20250131051918.549781-1-joe@pf.is.s.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131051918.549781-1-joe@pf.is.s.u-tokyo.ac.jp>
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

Unrelated to this patch but from a naive reading of the code the

	conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);

assignment can fail with -EPROBE_DEFER if CONFIG_GPIOLIB_IRQCHIP is
enabled.  The driver can function without an IRQ so we just ignore
the error, but probably it would be better to propogate it back?

On Fri, Jan 31, 2025 at 02:19:18PM +0900, Joe Hattori wrote:
> Current implementation of .probe() leaks a reference of i2c_adapter.
> Implement an error path and call put_device() on the obtained
> i2c_adapter in it to fix this refcount bug.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V3:
> - Removed shadowed variables (ret).
> 
> Changes in V2:
> - Omit the null check before calling i2c_put_adapter().
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 31 +++++++++++++---------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 72bc508d4e6e..411f9372e064 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -329,35 +329,39 @@ static int display_connector_probe(struct platform_device *pdev)
>  
>  	/* Get the DP PWR for DP connector. */
>  	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
> -		int ret;
> -
>  		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
> -		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
> +		if (ret < 0) {
> +			ret = dev_err_probe(&pdev->dev, ret,
                        ^^^                             ^^^
This is a "ret = ret" assignment.  There is no need for that.  Just
call dev_err_probe() without saving the return value.

> +					    "failed to get DP PWR regulator\n");
> +			goto err_put;
> +		}
>  	}
>  
>  	/* enable DDC */
>  	if (type == DRM_MODE_CONNECTOR_HDMIA) {
> -		int ret;
> -
>  		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
>  						       GPIOD_OUT_HIGH);
>  
>  		if (IS_ERR(conn->ddc_en)) {
>  			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
> -			return PTR_ERR(conn->ddc_en);
> +			ret = PTR_ERR(conn->ddc_en);
> +			goto err_put;
>  		}
>  
>  		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
> -		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
> +		if (ret < 0) {
> +			ret = dev_err_probe(
> +				&pdev->dev, ret,
> +				"failed to get HDMI +5V Power regulator\n");

Same.

> +			goto err_put;
> +		}
>  	}
>  
>  	if (conn->supply) {
>  		ret = regulator_enable(conn->supply);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
> -			return ret;
> +			goto err_put;
>  		}
>  	}
>  
> @@ -383,6 +387,10 @@ static int display_connector_probe(struct platform_device *pdev)
>  	drm_bridge_add(&conn->bridge);
>  
>  	return 0;
> +
> +err_put:
> +	i2c_put_adapter(conn->bridge.ddc);
> +	return ret;
>  }
>  
>  static void display_connector_remove(struct platform_device *pdev)
> @@ -397,8 +405,7 @@ static void display_connector_remove(struct platform_device *pdev)
>  
>  	drm_bridge_remove(&conn->bridge);
>  
> -	if (!IS_ERR(conn->bridge.ddc))
> -		i2c_put_adapter(conn->bridge.ddc);
> +	i2c_put_adapter(conn->bridge.ddc);

This change is a nice cleanup and perhaps it silences a warning in your
static checker?  It should be mentioned in the commit message.

regards,
dan carpenter

