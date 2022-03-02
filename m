Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777D4CA05A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5D10F206;
	Wed,  2 Mar 2022 09:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7F7D10F205
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:09:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47B6B1396;
 Wed,  2 Mar 2022 01:09:57 -0800 (PST)
Received: from [10.57.37.244] (unknown [10.57.37.244])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F45B3F66F;
 Wed,  2 Mar 2022 01:09:56 -0800 (PST)
Message-ID: <5263b251-53ee-aebd-80e3-79a8d47335eb@arm.com>
Date: Wed, 2 Mar 2022 09:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/panfrost: cleanup comments
Content-Language: en-GB
To: trix@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220301124339.264544-1-trix@redhat.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220301124339.264544-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/03/2022 12:43, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> For spdx
> change tab to space delimiter
> Use // for *.c
> 
> Replacements
> commited to committed, use multiline comment style
> regsiters to registers
> initialze to initialize
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks, most of the changes look reasonable (although I've never
understood the reason for using // for SPDX comments), but there's one
below that I think needs rethinking.

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c          | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_issues.h       | 6 ++++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.c          | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_regs.h         | 2 +-
>  5 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 96bb5a4656278..94b6f0a19c83a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -562,7 +562,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  
>  	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
>  
> -	/* Allocate and initialze the DRM device. */
> +	/* Allocate and initialize the DRM device. */
>  	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
>  	if (IS_ERR(ddev))
>  		return PTR_ERR(ddev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> index b0142341e2235..77e7cb6d1ae3b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0
>  /* Copyright (C) 2019 Arm Ltd.
>   *
>   * Based on msm_gem_freedreno.c:
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index 8e59d765bf19f..4e7cf979ee67a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -13,8 +13,10 @@
>   * to care about.
>   */
>  enum panfrost_hw_issue {
> -	/* Need way to guarantee that all previously-translated memory accesses
> -	 * are commited */
> +	/*
> +	 * Need way to guarantee that all previously-translated memory accesses
> +	 * are committed
> +	 */

This file has a whole load of multiline comments that don't technically
follow the coding style. Fixing just one comment makes the file
inconsistent. Note we recently had a discussion about this[1] and
decided to leave the comment style as is. And I have to admit in this
instance avoiding the extra mostly-blank lines makes the list easier to
read. The typo fix is obviously welcomed though!

[1] https://lore.kernel.org/r/c7331489-ad04-0f35-224e-164f144fb819%40arm.com

>  	HW_ISSUE_6367,
>  
>  	/* On job complete with non-done the cache is not flushed */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 39562f2d11a47..d3f82b26a631d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier:	GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  
>  #include <drm/panfrost_drm.h>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 6c5a11ef1ee87..efe4b75149d35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -292,7 +292,7 @@
>  #define AS_FAULTADDRESS_LO(as)		(MMU_AS(as) + 0x20) /* (RO) Fault Address for address space n, low word */
>  #define AS_FAULTADDRESS_HI(as)		(MMU_AS(as) + 0x24) /* (RO) Fault Address for address space n, high word */
>  #define AS_STATUS(as)			(MMU_AS(as) + 0x28) /* (RO) Status flags for address space n */
> -/* Additional Bifrost AS regsiters */
> +/* Additional Bifrost AS registers */
>  #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
>  #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
>  #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */

