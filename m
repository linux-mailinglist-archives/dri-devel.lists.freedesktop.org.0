Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21597630FF8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8491A10E285;
	Sat, 19 Nov 2022 17:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ED810E284
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:35:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20B51749;
 Sat, 19 Nov 2022 18:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879316;
 bh=gNZd6oRdjSF8gl1qxb0SKHdE0YdULnw0sFu+xuUXOu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=agMGW9TeKWyqcIA+8ErB6thVoPN2X+MoLY11tdk2DRN+DyLioHaOEARXNPMseOrKY
 98sjQbE6aG3WbhnBH0Pw94c2oExDnhSMnQWg8Bpyg2blwFG1rO4n+MvBTOVc7csHSp
 OdcA1+Y7qt5J2VCbdmgCQDWCNScu7ObcCenSc7X4=
Date: Sat, 19 Nov 2022 19:35:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 037/606] drm/bridge: tfp410: Convert to i2c's .probe_new()
Message-ID: <Y3kTxA+4gUo4x3FC@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-38-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-38-uwe@kleine-koenig.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:36:11PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index b9635abbad16..6db69df0e18b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -379,8 +379,7 @@ static struct platform_driver tfp410_platform_driver = {
>  
>  #if IS_ENABLED(CONFIG_I2C)
>  /* There is currently no i2c functionality. */
> -static int tfp410_i2c_probe(struct i2c_client *client,
> -			    const struct i2c_device_id *id)
> +static int tfp410_i2c_probe(struct i2c_client *client)
>  {
>  	int reg;
>  
> @@ -411,7 +410,7 @@ static struct i2c_driver tfp410_i2c_driver = {
>  		.of_match_table = of_match_ptr(tfp410_match),
>  	},
>  	.id_table	= tfp410_i2c_ids,
> -	.probe		= tfp410_i2c_probe,
> +	.probe_new	= tfp410_i2c_probe,
>  	.remove		= tfp410_i2c_remove,
>  };
>  #endif /* IS_ENABLED(CONFIG_I2C) */
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
