Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCF630FF4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D8510E283;
	Sat, 19 Nov 2022 17:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566810E283
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:34:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C82B7749;
 Sat, 19 Nov 2022 18:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879295;
 bh=1g/K4Q02GnI/IYZ+h0gHHHav57k1o5cBeGx4EARI3KI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJ1HJmIiA7HrCz6PFVgdYFbVM9QcVLos/nTXDCSmh0OPGVBwdV/jcstBUzsSCUea/
 jy4EgVYA+wWeb+tHwiQoWYto3qv+vASIDJNVNAr2UCZZl6s962jWW9dNAJEGFR1f69
 vRuR4Sigzw/1JrvLP0RvoaxzeioWnHH7EXiarPrA=
Date: Sat, 19 Nov 2022 19:34:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 025/606] drm/bridge: lt9611uxc: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTr8O9GJybmnWY@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-26-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-26-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:35:59PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index fa1ee6264d92..583daacf3705 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -844,8 +844,7 @@ static const struct attribute_group *lt9611uxc_attr_groups[] = {
>  	NULL,
>  };
>  
> -static int lt9611uxc_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int lt9611uxc_probe(struct i2c_client *client)
>  {
>  	struct lt9611uxc *lt9611uxc;
>  	struct device *dev = &client->dev;
> @@ -1012,7 +1011,7 @@ static struct i2c_driver lt9611uxc_driver = {
>  		.of_match_table = lt9611uxc_match_table,
>  		.dev_groups = lt9611uxc_attr_groups,
>  	},
> -	.probe = lt9611uxc_probe,
> +	.probe_new = lt9611uxc_probe,
>  	.remove = lt9611uxc_remove,
>  	.id_table = lt9611uxc_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
