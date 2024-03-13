Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC56687A61F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 11:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2510E616;
	Wed, 13 Mar 2024 10:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B74210E616
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:53:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F907139F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 03:53:58 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B4503F73F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 03:53:21 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:53:13 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 22/43] drm/arm/komeda: Use fbdev-dma
Message-ID: <ZfGFmTp__hsQhox5@e110455-lin.cambridge.arm.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-23-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312154834.26178-23-tzimmermann@suse.de>
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

On Tue, Mar 12, 2024 at 04:45:17PM +0100, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by komeda. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Liviu Dudau <liviu.dudau@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index cc57ea4e13ae6..ffdeec3b3f2ea 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -9,7 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_module.h>
>  #include <drm/drm_of.h>
>  #include "komeda_dev.h"
> @@ -80,7 +80,7 @@ static int komeda_platform_probe(struct platform_device *pdev)
>  	}
>  
>  	dev_set_drvdata(dev, mdrv);
> -	drm_fbdev_generic_setup(&mdrv->kms->base, 32);
> +	drm_fbdev_dma_setup(&mdrv->kms->base, 32);
>  
>  	return 0;
>  
> -- 
> 2.44.0
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
