Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B3630FE0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E35F10E27C;
	Sat, 19 Nov 2022 17:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFA810E283
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:32:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B26749;
 Sat, 19 Nov 2022 18:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879149;
 bh=+8+diQJh+LD70K5MTLeNUtS/aDsme1R5nvV6QKR/EcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueHtmYmQltexzcvLFxbqRiXwthcevxufvGOBpz1SNGDMqdhqrOEQdlRgg9d4eR4XE
 Ixfksp+ms/jwnW0farb0f4RXRibn4xk7z3A6g+4rScVgUxbDbf2JK8dubM2TeXCzmI
 gtAmEO9DP2SZZedcudEtr1TTobYgY2OjUboMy2ZU=
Date: Sat, 19 Nov 2022 19:32:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 036/606] drm/bridge: ti-sn65dsi86: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTHfyR2De/W7wu@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-37-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-37-uwe@kleine-koenig.org>
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:36:10PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 3c3561942eb6..856d28dec4bf 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1850,8 +1850,7 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>  				       pdata->supplies);
>  }
>  
> -static int ti_sn65dsi86_probe(struct i2c_client *client,
> -			      const struct i2c_device_id *id)
> +static int ti_sn65dsi86_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ti_sn65dsi86 *pdata;
> @@ -1950,7 +1949,7 @@ static struct i2c_driver ti_sn65dsi86_driver = {
>  		.of_match_table = ti_sn65dsi86_match_table,
>  		.pm = &ti_sn65dsi86_pm_ops,
>  	},
> -	.probe = ti_sn65dsi86_probe,
> +	.probe_new = ti_sn65dsi86_probe,
>  	.id_table = ti_sn65dsi86_id,
>  };
>  
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
