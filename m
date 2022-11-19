Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47575630FE7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E410E27F;
	Sat, 19 Nov 2022 17:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAB210E27F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:33:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4735E749;
 Sat, 19 Nov 2022 18:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879218;
 bh=qb+DtyPGnqHLki0PE911QgLlJ2I1/jXnP9YLT5h0d+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OruFA3N18YfSqufN1EupAaMCLQtDFW0qAnRBQknY02WwUmC0Hqnt9DGFDo30o8qee
 6aHBDro/53DI+2tMH0mtLQu8DXcSKmCVG1w+0TWaY7CbAYqYBS01K1GY0uIMyyPbnO
 0V7htj6hMF/f/jB4TYInP5o9z22MY4vZe73mRvv4=
Date: Sat, 19 Nov 2022 19:33:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 033/606] drm/bridge: tc358768: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTYhVib7nQDD1G@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-34-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-34-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:07PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358768.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 4c4b77ce8aba..839b8832b9b5 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1018,8 +1018,7 @@ static int tc358768_get_regulators(struct tc358768_priv *priv)
>  	return ret;
>  }
>  
> -static int tc358768_i2c_probe(struct i2c_client *client,
> -			      const struct i2c_device_id *id)
> +static int tc358768_i2c_probe(struct i2c_client *client)
>  {
>  	struct tc358768_priv *priv;
>  	struct device *dev = &client->dev;
> @@ -1085,7 +1084,7 @@ static struct i2c_driver tc358768_driver = {
>  		.of_match_table = tc358768_of_ids,
>  	},
>  	.id_table = tc358768_i2c_ids,
> -	.probe = tc358768_i2c_probe,
> +	.probe_new = tc358768_i2c_probe,
>  	.remove	= tc358768_i2c_remove,
>  };
>  module_i2c_driver(tc358768_driver);
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
