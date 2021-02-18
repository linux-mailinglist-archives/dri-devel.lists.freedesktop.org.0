Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451931EBED
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36B6EA2F;
	Thu, 18 Feb 2021 16:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BE46EA32
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLLtZPx/WCVOTnXSsy/JatPvxuCHdJJNlBU9i3LFq9g=; b=S1w2AJl9Qg0k0Ra/KpPo3c83gl
 RlX5s3YwjMzvXvzCeof48MejpivZbTfHKYq86YuxIDCDZxrIBzUTe9vF9oIwwqRJzrCUQV1BkwV9p
 22ev3SvWlfwxMQy3ySPomu2EbQHZrZ01kGIZipiqKn234dYp7eICZOcVJWneh3Nkoj7iDOrqIzX/t
 jbl7kHeOHdwMO7cbks9B0+LubmOQWAfNH1au2KteOMJoNhN/pYiocemzv+dxV6Od25Liz91cVRTDT
 lRrLSTW1Pb+OPuJgX0mr/QteqoCxAH2QCpLSw74FS2DBL/pDoWjKdWwLCdtchxXUGIDJ2//AomX2x
 4pRn7GUA==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lClj9-0002OX-35; Thu, 18 Feb 2021 18:00:27 +0200
MIME-Version: 1.0
Date: Thu, 18 Feb 2021 18:00:23 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Dario Binacchi <dariobin@libero.it>
Subject: Re: [RESEND PATCH] drm/tilcdc: fix raster control register setting
In-Reply-To: <20210216202225.12861-1-dariobin@libero.it>
References: <20210216202225.12861-1-dariobin@libero.it>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0e1595a66d8539339a5e31927ef59857@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-16 22:22, Dario Binacchi wrote:
> The fdd property of the tilcdc_panel_info structure must set the reqdly
> bit field  (bit 12 to 19) of the raster control register. The previous
> statement set the least significant bit instead.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks for a good catch. I'll merge to this drm-misc-next soon.

Best regards,
Jyri

> 
> ---
> 
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 30213708fc99..238068e28729 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -393,7 +393,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc 
> *crtc)
>  			return;
>  		}
>  	}
> -	reg |= info->fdd < 12;
> +	reg |= info->fdd << 12;
>  	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
> 
>  	if (info->invert_pxl_clk)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
