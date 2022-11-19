Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A3630FB1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052FF10E0FB;
	Sat, 19 Nov 2022 17:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDD110E0FB
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:23:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76FC4749;
 Sat, 19 Nov 2022 18:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668878596;
 bh=yKjqlouakS4ZziOyomg5hVmvoPadAxmtK7XqQoUHbtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qoTNmJehnuoK5I5UmqSNgivm03UxiVAo5ttq0IoZx6/9hV9/8xd/HeDm0h2WE8b2x
 WHqPlwsZ26QSUKk3VUy//3Uk/iAFCZjy3bYTkAVqrpgvG2s2XAhk2H7jlvl4x8hqlF
 nj5BFB0x6o77oXkOrQcwidWM2zyLyrh+kHlZsyrg=
Date: Sat, 19 Nov 2022 19:23:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 019/606] drm/bridge: chrontel-ch7033: Convert to i2c's
 .probe_new()
Message-ID: <Y3kQ9NoW21l/LhlZ@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-20-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-20-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:35:53PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index b94f39a86846..339b759e4c81 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -528,8 +528,7 @@ static const struct regmap_config ch7033_regmap_config = {
>  	.max_register = 0x7f,
>  };
>  
> -static int ch7033_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ch7033_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ch7033_priv *priv;
> @@ -604,7 +603,7 @@ static const struct i2c_device_id ch7033_ids[] = {
>  MODULE_DEVICE_TABLE(i2c, ch7033_ids);
>  
>  static struct i2c_driver ch7033_driver = {
> -	.probe = ch7033_probe,
> +	.probe_new = ch7033_probe,
>  	.remove = ch7033_remove,
>  	.driver = {
>  		.name = "ch7033",

-- 
Regards,

Laurent Pinchart
