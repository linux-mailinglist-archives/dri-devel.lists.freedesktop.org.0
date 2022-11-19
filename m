Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEE8631008
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5310E28C;
	Sat, 19 Nov 2022 17:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E709110E28C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:39:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D05749;
 Sat, 19 Nov 2022 18:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879573;
 bh=KLORL0n/eeuSzLDMfgx0jgrjdSgC3DFFC/4yiTROnhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SfeAl0PWgVPzjz8cJiuwEIAVbgeaeTijrZwOPZmyYPddFO2aFui906JzJjkt6eGcd
 i6MkHUSslGrlHdS1H20eCQdEuP5qibdOa+QbLsnhtkztt77qoiHMO32bsIjRd4RAWZ
 chXaNrTR0kNN0sx0FgtVJ87LPjeNheOOinw9FyD8=
Date: Sat, 19 Nov 2022 19:39:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 016/606] drm/bridge/analogix/anx78xx: Convert to i2c's
 .probe_new()
Message-ID: <Y3kUxUbA6CvABcho@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-17-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-17-uwe@kleine-koenig.org>
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:50PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 5997049fde5b..a3a38bbe2786 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1214,8 +1214,7 @@ static const u16 anx78xx_chipid_list[] = {
>  	0x7818,
>  };
>  
> -static int anx78xx_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int anx78xx_i2c_probe(struct i2c_client *client)
>  {
>  	struct anx78xx *anx78xx;
>  	struct anx78xx_platform_data *pdata;
> @@ -1390,7 +1389,7 @@ static struct i2c_driver anx78xx_driver = {
>  		   .name = "anx7814",
>  		   .of_match_table = of_match_ptr(anx78xx_match_table),
>  		  },
> -	.probe = anx78xx_i2c_probe,
> +	.probe_new = anx78xx_i2c_probe,
>  	.remove = anx78xx_i2c_remove,
>  	.id_table = anx78xx_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
