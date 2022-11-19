Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CDD630FD4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98610E279;
	Sat, 19 Nov 2022 17:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E5110E273
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:31:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15DE1749;
 Sat, 19 Nov 2022 18:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879079;
 bh=yW91zXtP9MEsIH/A1q5d7M++OzfZLIE9H/uR5h2Gjyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnYNUBetfY8zWWlcKgsh5UmA62Q1W9K60w+Ut0hBhtaW76R1nLiSdo9hQm581ZgB/
 NNifhN6XMeVLAVbm58rmrtsz9Y5s+9s0cplfC3X1qMtDf5QzoyiDDoTjPeoeslnIre
 tH7h/wbT6d28XeUWHJyTwIucEy1UFOqy12XL0DV8=
Date: Sat, 19 Nov 2022 19:31:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 026/606] drm/bridge: megachips: Convert to i2c's
 .probe_new()
Message-ID: <Y3kS13bmm8cL8Y/x@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-27-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-27-uwe@kleine-koenig.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Peter Senna Tschudin <peter.senna@gmail.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de, Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:36:00PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 97359f807bfc..4ee4a825a936 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -336,8 +336,7 @@ static int ge_b850v3_register(void)
>  			"ge-b850v3-lvds-dp", ge_b850v3_lvds_ptr);
>  }
>  
> -static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
> -				       const struct i2c_device_id *id)
> +static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c)
>  {
>  	struct device *dev = &stdp4028_i2c->dev;
>  	int ret;
> @@ -376,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
>  
>  static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
>  	.id_table	= stdp4028_ge_b850v3_fw_i2c_table,
> -	.probe		= stdp4028_ge_b850v3_fw_probe,
> +	.probe_new	= stdp4028_ge_b850v3_fw_probe,
>  	.remove		= stdp4028_ge_b850v3_fw_remove,
>  	.driver		= {
>  		.name		= "stdp4028-ge-b850v3-fw",
> @@ -384,8 +383,7 @@ static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
>  	},
>  };
>  
> -static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c,
> -				       const struct i2c_device_id *id)
> +static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c)
>  {
>  	struct device *dev = &stdp2690_i2c->dev;
>  	int ret;
> @@ -424,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
>  
>  static struct i2c_driver stdp2690_ge_b850v3_fw_driver = {
>  	.id_table	= stdp2690_ge_b850v3_fw_i2c_table,
> -	.probe		= stdp2690_ge_b850v3_fw_probe,
> +	.probe_new	= stdp2690_ge_b850v3_fw_probe,
>  	.remove		= stdp2690_ge_b850v3_fw_remove,
>  	.driver		= {
>  		.name		= "stdp2690-ge-b850v3-fw",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
