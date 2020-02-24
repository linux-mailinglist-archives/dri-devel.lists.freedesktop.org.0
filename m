Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E411816A87D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 15:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B34C6E50E;
	Mon, 24 Feb 2020 14:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892676E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 14:37:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so10663362wru.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9+dEXm0EW4AqC+rVEUCsC6kfYVjwM2LHbBTMjmfwX+0=;
 b=T/K12c8BM2KGNjae4ESXgmmX434EVW2tgxnu5qr9T/urQ4KqQxduG0ppOaXbA+KzB9
 R2df5S1skJnnx9QeeT1RrlBXExEKxPKtAmvQbwoGn3QaCdulIvHUfDY3q4OEqAtkVNVQ
 NfGWqpHLHLIVnK0hCNpCscvpylrdhM10knOvP94kb/mYAYIKdf2zbhSlmH6oAAZg/hCh
 weqxmaH+6XetTuD4Of2arJpXmu2dC4dQOGyG/3p2iPN6nAUP0LbFLZUktas5CHcE+gXm
 43xo6P7qMPy4suktSbzwcLT4yvvJ1DtLgwKaqJw461CqKzizPW6pp/QRa/sUn7PlVRGJ
 5T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9+dEXm0EW4AqC+rVEUCsC6kfYVjwM2LHbBTMjmfwX+0=;
 b=B97VkfYke+8s0si5mCoj6/ugR82d098+MnTrFhsp8XZQFPWGyj3NUgtpLjz8UGCTF4
 bLKqAgtuzMnNLa2/w7byFAhkJA1YVjtF5v+isu0JaZQBDgATsveZ3/IjKTodI0J6JCDP
 FCDZnV4NuJTOO/bRLaGKb1x9lFQBJSkEw7zPugDXrTDTrt7wr4jZx5EXjqdSHuPEAISD
 c3n3fUNWQOIogBYKDL9MiHqf1KyGtT+5VSSJcJJ8lzY5BlQMhkyqlsBWasYaU96KzOJh
 bd/l8NhFALYKhUpHh83wsoyD/ktPJjNsKQfV6Gn1XkbGe9HpaPSxLVQVCPg9kyb5Nj9m
 GE2Q==
X-Gm-Message-State: APjAAAV+PMPC29GXKkhZvMZu/TMWQrSCmDiLcrh6nvmUwKIBkMvR3CN1
 FJ7s/a5Q/SnFCWwOg4F9CAjLXA==
X-Google-Smtp-Source: APXvYqzwYD1PoLIfQsVjOS6Sm0sNQ5F8CCnPX/8OqfcJBAxeuNDjV+ugt84otU30yh5VP4rX2h2s9Q==
X-Received: by 2002:a5d:5264:: with SMTP id l4mr15650576wrc.275.1582555055097; 
 Mon, 24 Feb 2020 06:37:35 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f127sm17713682wma.4.2020.02.24.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:37:34 -0800 (PST)
Date: Mon, 24 Feb 2020 14:37:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Message-ID: <20200224143732.rreev3ypou26hvx3@holly.lan>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224140748.2182-1-jonathanh@nvidia.com>
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
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
> If probing the LP885x backlight fails after the regulators have been
> enabled, then the following warning is seen when releasing the
> regulators ...
> 
>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> 
>  ...
> 
>  Call trace:
>   _regulator_put.part.28+0x158/0x160
>   regulator_put+0x34/0x50
>   devm_regulator_release+0x10/0x18
>   release_nodes+0x12c/0x230
>   devres_release_all+0x34/0x50
>   really_probe+0x1c0/0x370
>   driver_probe_device+0x58/0x100
>   device_driver_attach+0x6c/0x78
>   __driver_attach+0xb0/0xf0
>   bus_for_each_dev+0x68/0xc8
>   driver_attach+0x20/0x28
>   bus_add_driver+0x160/0x1f0
>   driver_register+0x60/0x110
>   i2c_register_driver+0x40/0x80
>   lp855x_driver_init+0x20/0x1000 [lp855x_bl]
>   do_one_initcall+0x58/0x1a0
>   do_init_module+0x54/0x1d0
>   load_module+0x1d80/0x21c8
>   __do_sys_finit_module+0xe8/0x100
>   __arm64_sys_finit_module+0x18/0x20
>   el0_svc_common.constprop.3+0xb0/0x168
>   do_el0_svc+0x20/0x98
>   el0_sync_handler+0xf4/0x1b0
>   el0_sync+0x140/0x180
> 
> Fix this by ensuring that the regulators are disabled, if enabled, on
> probe failure.
> 
> Finally, ensure that the vddio regulator is disabled in the driver
> remove handler.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>



> ---
>  drivers/video/backlight/lp855x_bl.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
> index f68920131a4a..e94932c69f54 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -456,7 +456,7 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
>  		ret = regulator_enable(lp->enable);
>  		if (ret < 0) {
>  			dev_err(lp->dev, "failed to enable vddio: %d\n", ret);
> -			return ret;
> +			goto disable_supply;
>  		}
>  
>  		/*
> @@ -471,24 +471,34 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
>  	ret = lp855x_configure(lp);
>  	if (ret) {
>  		dev_err(lp->dev, "device config err: %d", ret);
> -		return ret;
> +		goto disable_vddio;
>  	}
>  
>  	ret = lp855x_backlight_register(lp);
>  	if (ret) {
>  		dev_err(lp->dev,
>  			"failed to register backlight. err: %d\n", ret);
> -		return ret;
> +		goto disable_vddio;
>  	}
>  
>  	ret = sysfs_create_group(&lp->dev->kobj, &lp855x_attr_group);
>  	if (ret) {
>  		dev_err(lp->dev, "failed to register sysfs. err: %d\n", ret);
> -		return ret;
> +		goto disable_vddio;
>  	}
>  
>  	backlight_update_status(lp->bl);
> +
>  	return 0;
> +
> +disable_vddio:
> +	if (lp->enable)
> +		regulator_disable(lp->enable);
> +disable_supply:
> +	if (lp->supply)
> +		regulator_disable(lp->supply);
> +
> +	return ret;
>  }
>  
>  static int lp855x_remove(struct i2c_client *cl)
> @@ -497,6 +507,8 @@ static int lp855x_remove(struct i2c_client *cl)
>  
>  	lp->bl->props.brightness = 0;
>  	backlight_update_status(lp->bl);
> +	if (lp->enable)
> +		regulator_disable(lp->enable);
>  	if (lp->supply)
>  		regulator_disable(lp->supply);
>  	sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
