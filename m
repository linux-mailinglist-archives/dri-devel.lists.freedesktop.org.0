Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B272630FBE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086310E11F;
	Sat, 19 Nov 2022 17:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FFA10E11F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47EC1749;
 Sat, 19 Nov 2022 18:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879015;
 bh=mUYbRT6nX+OeulAZg/N76uGCkrEGdDqtwFU8gR/gAZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgqwcejVPSNwbopUpyKubhsbkwzTIzpVVrcMm4D1lwAuuNxSEwMmYdRNJtW6ywdF4
 F8pHdEeQiocelDGfAuQpAY6JNSV4YNfRd8q5Tf3frYvvmf4t8C/q9hMETmLhQc0Z1w
 C+5CXPSv5h3m7a/09pOdDNyco3l3NbJk6S27O2no=
Date: Sat, 19 Nov 2022 19:29:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 023/606] drm/bridge: lt9211: Convert to i2c's .probe_new()
Message-ID: <Y3kSl5PWjnZLq9Ml@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-24-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-24-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:35:57PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
> index 933ca028d612..3e19fff6547a 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -720,8 +720,7 @@ static int lt9211_host_attach(struct lt9211 *ctx)
>  	return 0;
>  }
>  
> -static int lt9211_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int lt9211_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct lt9211 *ctx;
> @@ -786,7 +785,7 @@ static const struct of_device_id lt9211_match_table[] = {
>  MODULE_DEVICE_TABLE(of, lt9211_match_table);
>  
>  static struct i2c_driver lt9211_driver = {
> -	.probe = lt9211_probe,
> +	.probe_new = lt9211_probe,
>  	.remove = lt9211_remove,
>  	.id_table = lt9211_id,
>  	.driver = {
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
