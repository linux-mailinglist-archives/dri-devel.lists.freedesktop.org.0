Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF263100F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3079D10E295;
	Sat, 19 Nov 2022 17:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EDD10E28E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:41:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A464D749;
 Sat, 19 Nov 2022 18:41:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879704;
 bh=tmILVvcrsIp++jwRB0Fo8wY9/8Iov6cSsmrYrOa125E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZI5TFASwFUYMBxhTEnFCTZxDq65nFajKo7w2NoQ/Ko6ZC6J7AZvMikOeaw/PaqWOM
 /guSY/9x96ni0s7Ht5mYTGA822xtuvGcoksvcbjN4xXY9W5fPgt5yF210cXkkBHh8Q
 tl3rtu5cMvgME3/TQ25BygQqsA7682hQCmzurIMg=
Date: Sat, 19 Nov 2022 19:41:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 017/606] drm/bridge: anx7625: Convert to i2c's .probe_new()
Message-ID: <Y3kVSfaZ9IWAFgNB@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-18-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-18-uwe@kleine-koenig.org>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Marek Vasut <marex@denx.de>,
 Lee Jones <lee.jones@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:35:51PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index b0ff1ecb80a5..86a52c5f4fbc 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2562,8 +2562,7 @@ static void anx7625_runtime_disable(void *data)
>  	pm_runtime_disable(data);
>  }
>  
> -static int anx7625_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int anx7625_i2c_probe(struct i2c_client *client)
>  {
>  	struct anx7625_data *platform;
>  	struct anx7625_platform_data *pdata;
> @@ -2756,7 +2755,7 @@ static struct i2c_driver anx7625_driver = {
>  		.of_match_table = anx_match_table,
>  		.pm = &anx7625_pm_ops,
>  	},
> -	.probe = anx7625_i2c_probe,
> +	.probe_new = anx7625_i2c_probe,
>  	.remove = anx7625_i2c_remove,
>  
>  	.id_table = anx7625_id,
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
