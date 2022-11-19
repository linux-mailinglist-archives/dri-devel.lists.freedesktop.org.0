Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8611630FE3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB2B10E27D;
	Sat, 19 Nov 2022 17:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891E10E27D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:32:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA941997;
 Sat, 19 Nov 2022 18:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879174;
 bh=vCSnsXti52M8cQmWHjjQRkKkW0Zzm1RY+fm63qKhsco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vxTHDQNK+bnLKLtYTIk4nm5wW22of5CElmcUf5+bXlq+TQmruBW2WcyHVQwgQdUMU
 Q1iazqftnVCfEVUUJUo3UIYjYku5LxmgVk5+padIPwXsjjc5CcxIj8gK7gKfA29SZY
 z0pkR1j8obNwCABYL7e5fPusefvDmAvsgkz1Wado=
Date: Sat, 19 Nov 2022 19:32:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 027/606] drm/bridge: nxp-ptn3460: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTNrvjnUjqM8CS@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-28-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-28-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:01PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 0851101a8c72..cd292a2f894c 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -257,8 +257,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.get_edid = ptn3460_get_edid,
>  };
>  
> -static int ptn3460_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> +static int ptn3460_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ptn3460_bridge *ptn_bridge;
> @@ -336,7 +335,7 @@ MODULE_DEVICE_TABLE(of, ptn3460_match);
>  
>  static struct i2c_driver ptn3460_driver = {
>  	.id_table	= ptn3460_i2c_table,
> -	.probe		= ptn3460_probe,
> +	.probe_new	= ptn3460_probe,
>  	.remove		= ptn3460_remove,
>  	.driver		= {
>  		.name	= "nxp,ptn3460",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
