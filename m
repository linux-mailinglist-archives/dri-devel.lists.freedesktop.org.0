Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E94353A6C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 02:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609166E0C6;
	Mon,  5 Apr 2021 00:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98E96E0C6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 00:51:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C631D40;
 Mon,  5 Apr 2021 02:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617583885;
 bh=IR5QuCE16OnKgCno85EZqwUpJO280F01ynF352kgnfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtyUxr6juP+LNikWRhPkJwkhvCA0U20HpeduOMx2Up0DgxtXjZZWEwxNx6X8xLz+2
 nDhSaTpi99wCz6SX1/L11JdVDM+0HzfjhXsJN3hQZnt2tcMXOWqGf4JovGSD/TiEh+
 vouDRr1GRDWKP0Bykw1eiWI7+MWMOXbX4fHO4D+I=
Date: Mon, 5 Apr 2021 03:50:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 03/12] drm/bridge: ti-sn65dsi86: Remove incorrectly
 tagged kerneldoc comment
Message-ID: <YGpe3xThcRcmIFc3@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:37PM -0700, Douglas Anderson wrote:
> A random comment inside a function had "/**" in front of it. That
> doesn't make sense. Remove.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 96fe8f2c0ea9..76f43af6735d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -788,7 +788,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	/* set dsi clk frequency value */
>  	ti_sn_bridge_set_dsi_rate(pdata);
>  
> -	/**
> +	/*
>  	 * The SN65DSI86 only supports ASSR Display Authentication method and
>  	 * this method is enabled by default. An eDP panel must support this
>  	 * authentication method. We need to enable this method in the eDP panel

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
