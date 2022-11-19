Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFC630FD5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1A10E278;
	Sat, 19 Nov 2022 17:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14F310E27B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:31:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5462E749;
 Sat, 19 Nov 2022 18:31:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879098;
 bh=8TB93WgIpAtf7DBooyWu57a5/dN7O8GVgJGifX0hUnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7K+SgwRPG9GcmBge/PBta55KiYriA0x8A2A2UHSjBy9k9ytPB/icvh2f1cYafsKb
 rvJg+/If+ToTSuL8N3TNf2WjpOIX2Fxn4mgAAaAJTtBHZfD1djcTWvnFD1J11Gvfgs
 UGtrQ5BuTxKIfP8nMmVJ6QS6KD3lfyP4HQFH30nQ=
Date: Sat, 19 Nov 2022 19:31:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 018/606] drm/bridge: icn6211: Convert to i2c's .probe_new()
Message-ID: <Y3kS6iA3oRta/IQP@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-19-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-19-uwe@kleine-koenig.org>
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
 Angel Iglesias <ang.iglesiasg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:52PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index bf920c3503aa..0e37840cd7a8 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -740,8 +740,7 @@ static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
>  	return ret;
>  }
>  
> -static int chipone_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int chipone_i2c_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct chipone *icn;
> @@ -796,7 +795,7 @@ static struct i2c_device_id chipone_i2c_id[] = {
>  MODULE_DEVICE_TABLE(i2c, chipone_i2c_id);
>  
>  static struct i2c_driver chipone_i2c_driver = {
> -	.probe = chipone_i2c_probe,
> +	.probe_new = chipone_i2c_probe,
>  	.id_table = chipone_i2c_id,
>  	.driver = {
>  		.name = "chipone-icn6211-i2c",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
