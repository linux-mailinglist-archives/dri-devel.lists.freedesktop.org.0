Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76F430B32
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BF96E81B;
	Sun, 17 Oct 2021 17:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA326E81B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:24:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0bb457bc-2f6f-11ec-ac3c-0050568cd888;
 Sun, 17 Oct 2021 17:24:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2B4FF194B1A;
 Sun, 17 Oct 2021 19:24:10 +0200 (CEST)
Date: Sun, 17 Oct 2021 19:24:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan Johansen <strit@manjaro.org>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Marius Gripsgard <marius@ubports.com>
Subject: Re: [PATCH] drm/panel:Adjust sync values for Feixin K101-IM2BYL02
 panel
Message-ID: <YWxcMPo9PzsIsMRZ@ravnborg.org>
References: <20210818214818.298089-1-strit@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818214818.298089-1-strit@manjaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Wed, Aug 18, 2021 at 11:48:18PM +0200, Dan Johansen wrote:
> This adjusts sync values according to the datasheet
> 
> Fixes: 	1c243751c095bb95e2795f076ea7a0bcdd60a93a ("drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel")
> Co-developed-by: Marius Gripsgard <marius@ubports.com>
> Signed-off-by: Dan Johansen <strit@manjaro.org>

Sorry for not picking this up sooner - I have been away for a while.

The patch is now applied to drm-misc-fixes and will show up in the
upstream kernel in 1-2 week from now.
I updated the subject and the fixes tag while applying.

The Co-developed-by: is supposed to be paired with a Signed-off-by:
by the same person. Something to do right next time.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 0145129d7c66..534dd7414d42 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -590,14 +590,14 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
>  	.clock		= 69700,
>  
>  	.hdisplay	= 800,
> -	.hsync_start	= 800 + 6,
> -	.hsync_end	= 800 + 6 + 15,
> -	.htotal		= 800 + 6 + 15 + 16,
> +	.hsync_start	= 800 + 52,
> +	.hsync_end	= 800 + 52 + 8,
> +	.htotal		= 800 + 52 + 8 + 48,
>  
>  	.vdisplay	= 1280,
> -	.vsync_start	= 1280 + 8,
> -	.vsync_end	= 1280 + 8 + 48,
> -	.vtotal		= 1280 + 8 + 48 + 52,
> +	.vsync_start	= 1280 + 16,
> +	.vsync_end	= 1280 + 16 + 6,
> +	.vtotal		= 1280 + 16 + 6 + 15,
>  
>  	.width_mm	= 135,
>  	.height_mm	= 217,
> -- 
> 2.32.0
