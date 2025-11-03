Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D612C2AB85
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0310E391;
	Mon,  3 Nov 2025 09:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dovoiEzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87510E38F;
 Mon,  3 Nov 2025 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762161967; x=1793697967;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0+8O8IQ8U0kV20x53Wn5EU5fTLeflJ75PULxjkLclzI=;
 b=dovoiEzNUZaeyA+Eq383l+FFjjhOQYct2zcpEOl+3MrtlMfHnlfSaw1D
 maJIqUzLkFuTIT0pS7j3QAfMgQbNg5K5d4GrNt+CpbsLEBS1tyPovCiFh
 So2QxZOPPg9BIqCuz39g9KuqtzQgHCMMPnO/hRHOmXaBNGUV6d8NjUV2c
 4e+Z6bsmQQLqIx2YyUsCr+Zo5atk5ZsxEDAr/+aWHCWFPwM0H+vAeM0NT
 PgMw0oCtexV8t94vs85BCNG0YGm1PGirseQTD/Q1dfymV9q/5X4tSxNzn
 nk5U9uEwKmEcJ6A5JgK7qABsgnm/UsGOMVSCCjIg9L2FJUyRd9y2CQ1Zn A==;
X-CSE-ConnectionGUID: c0yJ4Ps+SHq8m32ZOs8MAw==
X-CSE-MsgGUID: J3LzbHl1RiWFYUPdKul6WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="68093548"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="68093548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:26:06 -0800
X-CSE-ConnectionGUID: Zithr4brRoGAkRPrr4mi5g==
X-CSE-MsgGUID: DFXSxedURhS+pgCRxTJGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="187272974"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:26:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20251103112418.031b3f8c@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103112418.031b3f8c@canb.auug.org.au>
Date: Mon, 03 Nov 2025 11:26:01 +0200
Message-ID: <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 03 Nov 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c: In function 'rzg2l_du_probe':
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c:173:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
>   173 |         drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>       |         ^~~~~~~~
>       |         pr_info
>
> Presumably caused by commit
>
>   9695c143b72a ("drm/buddy: replace drm_print.h include with a forward declaration")
> or
>   ea722522d505 ("drm/mm: replace drm_print.h include with a forward declaration")
> or
>   d7a849d126d0 ("drm/ttm: replace drm_print.h include with a forward declaration")
>
> I have applied the following fix patch for today:

Thanks for the report, the fix (same as yours) is at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/04f617d5fe37f92d750efbb73065df3997f5c6b5.1762161597.git.jani.nikula@intel.com


>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 3 Nov 2025 11:12:27 +1100
> Subject: [PATCH] fix up for dropping drm_print.h includes
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index e1aa6a719529..c34b1a13e685 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
>  
>  #include "rzg2l_du_drv.h"
>  #include "rzg2l_du_kms.h"
> -- 
> 2.51.1
>
> Which lead to this:
>
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_convert_format':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:17: error: implicit declaration of function 'DRM_ERROR'; did you mean 'SO_ERROR'? [-Wimplicit-function-declaration]
>   215 |                 DRM_ERROR("unsupported format[%08x]\n", format);
>       |                 ^~~~~~~~~
>       |                 SO_ERROR
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rockchip_vop2_mod_supported':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:33: error: implicit declaration of function 'drm_dbg_kms' [-Wimplicit-function-declaration]
>   395 |                                 drm_dbg_kms(vop2->drm,
>       |                                 ^~~~~~~~~~~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_setup_scale':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:25: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
>   602 |                         drm_dbg(vop2->drm, "%s dst_w[%d] should align as 2 pixel\n",
>       |                         ^~~~~~~
>       |                         dev_dbg
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_core_clks_prepare_enable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>   763 |                 drm_err(vop2->drm, "failed to enable hclk - %d\n", ret);
>       |                 ^~~~~~~
>       |                 pr_err
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic_disable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:17: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
>   967 |                 drm_info(vop2->drm, "wait for vp%d dsp_hold timeout\n", vp->id);
>       |                 ^~~~~~~~
>       |                 pr_info
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic_enable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1758:41: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
>  1758 |                                         drm_warn(vop2->drm,
>       |                                         ^~~~~~~~
>       |                                         dev_warn
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rk3576_vp_isr':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2198:17: error: implicit declaration of function 'drm_err_ratelimited'; did you mean 'pr_err_ratelimited'? [-Wimplicit-function-declaration]
>  2198 |                 drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY irq err at vp%d\n", vp->id);
>       |                 ^~~~~~~~~~~~~~~~~~~
>       |                 pr_err_ratelimited
>
> So, I have instead used the drm-misc tree from next-20251031 for today.

-- 
Jani Nikula, Intel
