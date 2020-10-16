Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4730290C15
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 21:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144196EE75;
	Fri, 16 Oct 2020 19:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F96EE75
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 19:04:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 13BBD80623;
 Fri, 16 Oct 2020 21:04:49 +0200 (CEST)
Date: Fri, 16 Oct 2020 21:04:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: remove redundant null check
Message-ID: <20201016190447.GB1345100@ravnborg.org>
References: <20200930081859.52431-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930081859.52431-1-vulab@iscas.ac.cn>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=hVaCtnEc0TjjHIDlNK8A:9
 a=1Kb86hCPPUzEXHOj:21 a=4AxGUG8XqSeI4mlC:21 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yu Wang

On Wed, Sep 30, 2020 at 08:18:59AM +0000, Xu Wang wrote:
> Because clk_disable_unprepare already checked NULL clock parameter,
> so the additional checks are unnecessary, just remove it
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Thanks, applied to drm-misc-next. I will appear in linux-next in a few
weeks.

	Sam

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b6e19ecbc84..1b01836f1eb1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -819,8 +819,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>  
> -	if (pdata->refclk)
> -		clk_disable_unprepare(pdata->refclk);
> +	clk_disable_unprepare(pdata->refclk);
>  
>  	pm_runtime_put_sync(pdata->dev);
>  }
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
