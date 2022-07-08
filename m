Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07456BD25
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 18:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E624E10E25A;
	Fri,  8 Jul 2022 16:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85F0210E1F4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 16:03:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995571063
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:03:51 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 093E63F66F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:03:50 -0700 (PDT)
Date: Fri, 8 Jul 2022 17:03:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH 1/3] drm/komeda - Add legacy FB support so VT's work as
 expected
Message-ID: <YshVZQmYlgE8dIao@e110455-lin.cambridge.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
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
Cc: dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 12:47:12PM +0100, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> The komeda driver doesn't come up with a visible text (FB) mode VT by
> default as it was missing legacy FB support. It's useful to have a
> working text VT on a system for debug and general usability, so enable
> it. You can always toggle CONFIG_FRAMEBUFFER_CONSOLE.
> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>


> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index e7933930a657..c0c7933a9631 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -9,6 +9,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/component.h>
>  #include <linux/pm_runtime.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_of.h>
>  #include "komeda_dev.h"
>  #include "komeda_kms.h"
> @@ -71,6 +72,7 @@ static int komeda_bind(struct device *dev)
>  	}
>  
>  	dev_set_drvdata(dev, mdrv);
> +	drm_fbdev_generic_setup(&mdrv->kms->base, 32);
>  
>  	return 0;
>  
> -- 
> 2.32.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
