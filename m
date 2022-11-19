Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FAA630FD7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1AA10E27A;
	Sat, 19 Nov 2022 17:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B83C10E27A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:31:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D1AC749;
 Sat, 19 Nov 2022 18:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879114;
 bh=lbkr7YBcW0ueg2z/rT5cJvA8hhkU5ohuFZ2XGyeXLZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuOUPPG3RRR6IHsgthCXztfrxJtQmISEZO/RxM7Hk7AN0Tp9Z/Y6nK5wd2WFaoTl7
 b0gK2+yQT9vKZZdN7nERG5WDu5SfkNjcGGjwpR8r0E4Y8tKeZSU9Uocf9CGsORaXOL
 UJOv9nnvwh8y75ri9UXmUHnQrBFPlFJH6PYlCz4w=
Date: Sat, 19 Nov 2022 19:31:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 021/606] drm/bridge: it66121: Convert to i2c's .probe_new()
Message-ID: <Y3kS+kIgi7OTiXPx@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-22-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-22-uwe@kleine-koenig.org>
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
 Grant Likely <grant.likely@linaro.org>, Phong LE <ple@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:55PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 4f6f1deba28c..7476cfbf9585 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1512,8 +1512,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>  	return PTR_ERR_OR_ZERO(ctx->audio.pdev);
>  }
>  
> -static int it66121_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int it66121_probe(struct i2c_client *client)
>  {
>  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>  	struct device_node *ep;
> @@ -1649,7 +1648,7 @@ static struct i2c_driver it66121_driver = {
>  		.name	= "it66121",
>  		.of_match_table = it66121_dt_match,
>  	},
> -	.probe = it66121_probe,
> +	.probe_new = it66121_probe,
>  	.remove = it66121_remove,
>  	.id_table = it66121_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
