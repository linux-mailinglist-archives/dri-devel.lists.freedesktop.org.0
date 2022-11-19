Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B41630FE5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EC810E27E;
	Sat, 19 Nov 2022 17:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD3010E27E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:33:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0984749;
 Sat, 19 Nov 2022 18:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879195;
 bh=VDgLOR+TPIiHt/6X9LlZWhODnqBYFlbRjyka8jJDUqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aRaQ+sn3SAjuGkJz7Xd8ZdvP6qWasx6z8F4yKGkwwaVrOZ19ltMfBWhJLc8Z96JxQ
 ukfPeSSAIIjbIZ0TrKj6UIJ/hvRVSHWp0L6Qj7TLswhPvXK1VzaUBi+kgO9SNWccKn
 aWPrFAz/Tw/mb4mRbdsKiP6fOfxFTL32ktMMWdm4=
Date: Sat, 19 Nov 2022 19:32:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 030/606] drm/bridge: sii9234: Convert to i2c's .probe_new()
Message-ID: <Y3kTS3KFsaD/Aa4d@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-31-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-31-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:04PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii9234.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 5b3061d4b5c3..099b510ff285 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -886,8 +886,7 @@ static const struct drm_bridge_funcs sii9234_bridge_funcs = {
>  	.mode_valid = sii9234_mode_valid,
>  };
>  
> -static int sii9234_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int sii9234_probe(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
>  	struct sii9234 *ctx;
> @@ -961,7 +960,7 @@ static struct i2c_driver sii9234_driver = {
>  		.name	= "sii9234",
>  		.of_match_table = sii9234_dt_match,
>  	},
> -	.probe = sii9234_probe,
> +	.probe_new = sii9234_probe,
>  	.remove = sii9234_remove,
>  	.id_table = sii9234_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
