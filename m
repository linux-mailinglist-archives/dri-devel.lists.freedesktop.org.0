Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B8631013
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314FB10E28E;
	Sat, 19 Nov 2022 17:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA5510E28E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:42:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8046D749;
 Sat, 19 Nov 2022 18:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879724;
 bh=Vsw7ZhU9I2vfw8KkpV/hQt1mmj1j28Cc7TsxslkjcR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xtn+dcYNuAbrirLULOVJlcJtM1N4m+S7MlACjHSoAk3+tVeu/f1t2CXvhAnSqq8+l
 +WPhwQzmhuWq/S54c6vgf4yjzmZlhcLQxSCE+Hof+dKDasthMpVn5/31MKcTtHVw/5
 hJlPhpFi5nGuysVVgWnkSyqQ/TwVlQTcSxL90zE0=
Date: Sat, 19 Nov 2022 19:41:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 014/606] drm/bridge: adv7511: Convert to i2c's .probe_new()
Message-ID: <Y3kVXfxsPJNkq++H@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-15-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-15-uwe@kleine-koenig.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, kernel@pengutronix.de,
 Jonas Karlman <jonas@kwiboo.se>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Angel Iglesias <ang.iglesiasg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:48PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index e7a6e456ed0d..ddceafa7b637 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1185,8 +1185,9 @@ static int adv7511_parse_dt(struct device_node *np,
>  	return 0;
>  }
>  
> -static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
> +static int adv7511_probe(struct i2c_client *i2c)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
>  	struct adv7511_link_config link_config;
>  	struct adv7511 *adv7511;
>  	struct device *dev = &i2c->dev;
> @@ -1392,7 +1393,7 @@ static struct i2c_driver adv7511_driver = {
>  		.of_match_table = adv7511_of_ids,
>  	},
>  	.id_table = adv7511_i2c_ids,
> -	.probe = adv7511_probe,
> +	.probe_new = adv7511_probe,
>  	.remove = adv7511_remove,
>  };
>  
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
