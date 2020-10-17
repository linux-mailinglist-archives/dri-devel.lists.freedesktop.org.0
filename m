Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1129100E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 08:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C326E19A;
	Sat, 17 Oct 2020 06:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943CE6E19A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 06:19:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BBA9780573;
 Sat, 17 Oct 2020 08:19:53 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:19:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Liu Shixin <liushixin2@huawei.com>
Subject: Re: [PATCH -next] drm/panel: simplify the return expression of
 rb070d30_panel_enable()
Message-ID: <20201017061952.GE2242298@ravnborg.org>
References: <20200915032623.1772361-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915032623.1772361-1-liushixin2@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=Sa3K4Do9iwlq6gi14jcA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu

On Tue, Sep 15, 2020 at 11:26:23AM +0800, Liu Shixin wrote:
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Thanks, applied to drm-misc-next.
The patch will appear in drm-misc-next in a few weeks.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index 535c8d1cca21..a3782830ae3c 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -75,13 +75,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
>  static int rb070d30_panel_enable(struct drm_panel *panel)
>  {
>  	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
> -	int ret;
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
>  }
>  
>  static int rb070d30_panel_disable(struct drm_panel *panel)
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
