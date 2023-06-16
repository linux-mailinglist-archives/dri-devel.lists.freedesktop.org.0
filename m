Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069E73388F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 20:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CC010E67B;
	Fri, 16 Jun 2023 18:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0B410E67C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QtdadqZe3bGh02cJVk7iY9HH/+4XMF3+uoZaqczA5oc=;
 b=cR8KHWueHAI/394r1KhYfVgtwf29icW5RgZdwN2D11w6D1JPrLzMzRNFEHyUGBVK4C++syKZYKRMq
 zZnBqTmlPfPHEQE8Ueso2CN+umrSf14ISjrvBcS7736XSAiyBU1ChjPTgeESQoEYd5wvCdzbeeTDeP
 VEBEltWiEhkgnT/rBg6ej2j4r0p/oNVdk97MHkO3cJHlVePWNzDbIJEHPbmd+jkIJcF70KtLhVJrag
 LFq2/y34CPYVT0VkmBI6anRe3iqaxvKM3n+hM5YMCTiWy53PE0mTJAi67r/MWODRz6YI8h4UD+rIyC
 wILBockyJM47z0f/bqnfVluGKBAjIcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QtdadqZe3bGh02cJVk7iY9HH/+4XMF3+uoZaqczA5oc=;
 b=zsjHOzgyTuQ5GAagMN6jpsxNxicuFI7ccQF6q6wDdxjMdUJUazxutTwtBNR9xsedES2u3yFQKfVoQ
 JCWbphNCw==
X-HalOne-ID: a81a27da-0c77-11ee-a879-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id a81a27da-0c77-11ee-a879-6f01c1d0a443;
 Fri, 16 Jun 2023 18:57:37 +0000 (UTC)
Date: Fri, 16 Jun 2023 20:57:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358764: Use BIT() macro for actual bits
Message-ID: <20230616185735.GE1697490@ravnborg.org>
References: <20230615201635.565973-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201635.565973-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:16:35PM +0200, Marek Vasut wrote:
> None of these four bits are bitfields, use BIT() macro and treat
> them as bits. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
I always find FLD_VAL() hard to follow.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358764.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index f85654f1b1045..6a4cd313f5281 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -42,10 +42,10 @@
>  
>  /* Video path registers */
>  #define VP_CTRL			0x0450 /* Video Path Control */
> -#define VP_CTRL_MSF(v)		FLD_VAL(v, 0, 0) /* Magic square in RGB666 */
> -#define VP_CTRL_VTGEN(v)	FLD_VAL(v, 4, 4) /* Use chip clock for timing */
> -#define VP_CTRL_EVTMODE(v)	FLD_VAL(v, 5, 5) /* Event mode */
> -#define VP_CTRL_RGB888(v)	FLD_VAL(v, 8, 8) /* RGB888 mode */
> +#define VP_CTRL_MSF		BIT(0) /* Magic square in RGB666 */
> +#define VP_CTRL_VTGEN		BIT(4) /* Use chip clock for timing */
> +#define VP_CTRL_EVTMODE		BIT(5) /* Event mode */
> +#define VP_CTRL_RGB888		BIT(8) /* RGB888 mode */
>  #define VP_CTRL_VSDELAY(v)	FLD_VAL(v, 31, 20) /* VSYNC delay */
>  #define VP_CTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
>  #define VP_CTRL_DEPOL		BIT(18) /* Polarity of DE signal */
> @@ -233,8 +233,8 @@ static int tc358764_init(struct tc358764 *ctx)
>  	tc358764_write(ctx, DSI_STARTDSI, DSI_RX_START);
>  
>  	/* configure video path */
> -	tc358764_write(ctx, VP_CTRL, VP_CTRL_VSDELAY(15) | VP_CTRL_RGB888(1) |
> -		       VP_CTRL_EVTMODE(1) | VP_CTRL_HSPOL | VP_CTRL_VSPOL);
> +	tc358764_write(ctx, VP_CTRL, VP_CTRL_VSDELAY(15) | VP_CTRL_RGB888 |
> +		       VP_CTRL_EVTMODE | VP_CTRL_HSPOL | VP_CTRL_VSPOL);
>  
>  	/* reset PHY */
>  	tc358764_write(ctx, LV_PHY0, LV_PHY0_RST(1) |
> -- 
> 2.39.2
