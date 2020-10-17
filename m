Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAB29100A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 08:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE556E1A7;
	Sat, 17 Oct 2020 06:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206396E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 06:16:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1286E8056A;
 Sat, 17 Oct 2020 08:16:51 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:16:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/panel: st7703: Make jh057n00900_panel_desc static
Message-ID: <20201017061650.GB2242298@ravnborg.org>
References: <20200912033809.142773-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912033809.142773-1-yanaijie@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=cynJMltkmim_MLd6XyEA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: megous@megous.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, thierry.reding@gmail.com, agx@sigxcpu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On Sat, Sep 12, 2020 at 11:38:09AM +0800, Jason Yan wrote:
> This eliminates the following sparse warning:
> 
> drivers/gpu/drm/panel/panel-sitronix-st7703.c:156:26: warning: symbol
> 'jh057n00900_panel_desc' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks, applied to drm-misc-next with Guidos suggestions.
The patch will appear in -next in a few weeks.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index c22e7c49e077..7c07a8fc8506 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -153,7 +153,7 @@ static const struct drm_display_mode jh057n00900_mode = {
>  	.height_mm   = 130,
>  };
>  
> -struct st7703_panel_desc jh057n00900_panel_desc = {
> +static struct st7703_panel_desc jh057n00900_panel_desc = {
>  	.mode = &jh057n00900_mode,
>  	.lanes = 4,
>  	.mode_flags = MIPI_DSI_MODE_VIDEO |
> -- 
> 2.25.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
