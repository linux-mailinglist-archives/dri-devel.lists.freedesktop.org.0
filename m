Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF363100A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593910E28D;
	Sat, 19 Nov 2022 17:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325BA10E28D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:39:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6C5A749;
 Sat, 19 Nov 2022 18:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879589;
 bh=h2B7/7mlxjGXL4NwzzxJOH/W59NbCN7UkcHN5MMdcpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5jgJPbYcMHt/Hnbenh2hjqGuOBYq2zsoL4yuST7gqzqmaOrWmtIpGrJ+BQzfqYUA
 GzGv843UbVg1/8J1GMKjzKmqWWkt7hpETq51/WIif8VaKm3flcF/5PVTBV7EY/LaQ4
 P2QX0v34/pBBfb153sdSfuDwVCCMengXOjuwvtWo=
Date: Sat, 19 Nov 2022 19:39:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 015/606] drm/bridge/analogix/anx6345: Convert to i2c's
 .probe_new()
Message-ID: <Y3kU1lPadbd4asa7@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-16-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-16-uwe@kleine-koenig.org>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Ajay Gupta <ajayg@nvidia.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:49PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 660a54857929..339e0f05b260 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -692,8 +692,7 @@ static bool anx6345_get_chip_id(struct anx6345 *anx6345)
>  	return false;
>  }
>  
> -static int anx6345_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int anx6345_i2c_probe(struct i2c_client *client)
>  {
>  	struct anx6345 *anx6345;
>  	struct device *dev;
> @@ -817,7 +816,7 @@ static struct i2c_driver anx6345_driver = {
>  		   .name = "anx6345",
>  		   .of_match_table = of_match_ptr(anx6345_match_table),
>  		  },
> -	.probe = anx6345_i2c_probe,
> +	.probe_new = anx6345_i2c_probe,
>  	.remove = anx6345_i2c_remove,
>  	.id_table = anx6345_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
