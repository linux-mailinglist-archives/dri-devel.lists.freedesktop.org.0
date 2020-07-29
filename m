Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE838231B31
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 10:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E8A6E484;
	Wed, 29 Jul 2020 08:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jul 2020 08:27:38 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0686E484
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596011256;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=9zdws2zuzZZAu+H/QBGvrmGigxGLouB5lHhHSby5FRY=;
 b=WNCeFWVStTH3wtv4iac/z+GOR8U+5xlFiUDb/GvSdHYi5YTI+ZTkN2D03ryAseYMBf
 qI2zmG0bx34xFnDnZu4K5qcrlrU9amfY11E8B0FibUW+Kgj7st0CJ8z5ueIBtwUKRAvQ
 YhOsJ1IDj6QSszCknAJ4v6Hw4pDDGhR6mQJQ+l30PSmIa6xBrcYHs1SZzkZVfljTWFcu
 VG2CdlLVpANlSLl5EYJ2Rbv5qLtmKkeueRHR0vDWd+ps2mMKO6Gflb2EA7ttQbrJMj5P
 MV0sSl4yHuAyMrQcYVx9TfqoH0AwoC/0oYoeM5jEwNEYKoSvBbnlzk4XJk17FgCooJms
 sPUg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8IcrHBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6T8LYZfR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Jul 2020 10:21:34 +0200 (CEST)
Date: Wed, 29 Jul 2020 10:21:25 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/mcde: Rename flow function
Message-ID: <20200729082125.GA867@gerhold.net>
References: <20200728214319.143213-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728214319.143213-1-linus.walleij@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 11:43:18PM +0200, Linus Walleij wrote:
> The function mcde_display_send_one_frame() has a historical
> name that stems from being implemented when the driver
> only supported single frame updates.
> 
> Rename it mcde_start_flow() so that it reflects the current
> usage.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index 1d8ea8830a17..a99cc3fd5ef4 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -994,7 +994,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>  	dev_info(drm->dev, "MCDE display is disabled\n");
>  }
>  
> -static void mcde_display_send_one_frame(struct mcde *mcde)
> +static void mcde_start_flow(struct mcde *mcde)
>  {
>  	/* Request a TE ACK */
>  	if (mcde->te_sync)
> @@ -1092,7 +1092,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>  			 * is not active yet.
>  			 */
>  			if (mcde->flow_active == 0)
> -				mcde_display_send_one_frame(mcde);
> +				mcde_start_flow(mcde);
>  		}
>  		dev_info_once(mcde->dev, "sent first display update\n");
>  	} else {
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
