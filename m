Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A9165F13
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 14:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6D46ED87;
	Thu, 20 Feb 2020 13:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4AD6ED87
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:47:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7EBF563;
 Thu, 20 Feb 2020 14:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582206422;
 bh=uiVkPCvjcZdbiY3qcGURFlvVQ3c1CcE3A2NnKP1Gewo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtgKWlPnwMeA86TLEK/5cvysfXWA1tk4Oq5Bi3hPaI8PFUv6u74R4gH6iBbDBz+lv
 9yuMr9/Yg1uwc31+VVI6mNTWIZbC+aCmorWGlxualPlBre5pNvFD2tQ36tJeb1ubBl
 ezWEmwz7OYlmwBlMRm4wDz3G54bdiGesQx1R2xVU=
Date: Thu, 20 Feb 2020 15:46:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: anx6345: Fix getting anx6345 regulators
Message-ID: <20200220134643.GB4998@pendragon.ideasonboard.com>
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-2-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220083508.792071-2-anarsoul@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vasily,

Thank you for the patch.

On Thu, Feb 20, 2020 at 12:35:03AM -0800, Vasily Khoruzhick wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> We don't need to pass '-supply' suffix to devm_get_regulator()
> 
> Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 56f55c53abfd..0d8d083b0207 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -712,14 +712,14 @@ static int anx6345_i2c_probe(struct i2c_client *client,
>  		DRM_DEBUG("No panel found\n");
>  
>  	/* 1.2V digital core power regulator  */
> -	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12-supply");
> +	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
>  	if (IS_ERR(anx6345->dvdd12)) {
>  		DRM_ERROR("dvdd12-supply not found\n");
>  		return PTR_ERR(anx6345->dvdd12);
>  	}
>  
>  	/* 2.5V digital core power regulator  */
> -	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25-supply");
> +	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
>  	if (IS_ERR(anx6345->dvdd25)) {
>  		DRM_ERROR("dvdd25-supply not found\n");
>  		return PTR_ERR(anx6345->dvdd25);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
