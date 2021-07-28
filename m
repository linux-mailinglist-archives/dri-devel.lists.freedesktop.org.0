Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CC3D8885
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9146E0F0;
	Wed, 28 Jul 2021 07:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32056E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:06:34 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 610cdc4b-ef72-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 07:06:49 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 97CB5194B83;
 Wed, 28 Jul 2021 09:06:53 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:06:30 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
Message-ID: <YQEB9u3dAviUs5GG@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,
On Tue, Jul 27, 2021 at 05:31:14PM -0700, Anitha Chrisanthus wrote:
> From: Edmund Dea <edmund.j.dea@intel.com>
> 
> Added macros for date and version
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Your s-o-b is missing.

I find it of no use with macros here, as the figures are not used
anywhere else, but whatever.

With s-o-b fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 8 ++++----
>  drivers/gpu/drm/kmb/kmb_drv.h | 5 +++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index c0b1c6f99249..f54392ec4fab 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -425,10 +425,10 @@ static const struct drm_driver kmb_driver = {
>  	.fops = &fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
>  	.name = "kmb-drm",
> -	.desc = "KEEMBAY DISPLAY DRIVER ",
> -	.date = "20201008",
> -	.major = 1,
> -	.minor = 0,
> +	.desc = "KEEMBAY DISPLAY DRIVER",
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
>  };
>  
>  static int kmb_remove(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
> index 02e806712a64..ebbaa5f422d5 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.h
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -15,6 +15,11 @@
>  #define KMB_MAX_HEIGHT			1080 /*Max height in pixels */
>  #define KMB_MIN_WIDTH                   1920 /*Max width in pixels */
>  #define KMB_MIN_HEIGHT                  1080 /*Max height in pixels */
> +
> +#define DRIVER_DATE			"20210223"
> +#define DRIVER_MAJOR			1
> +#define DRIVER_MINOR			1
> +
>  #define KMB_LCD_DEFAULT_CLK		200000000
>  #define KMB_SYS_CLK_MHZ			500
>  
> -- 
> 2.25.1
