Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317F81872B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4FB10E47C;
	Tue, 19 Dec 2023 12:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C3110E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702988026; x=1734524026;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NbpGaU86Dh+d0lsvNilUWVTLLuLAoIs0JgUxolFsr84=;
 b=f17Gdrti72vED8xkk4BqLXK9H8A7Hef8zvKS5fU0ugGj8cIiSUKpXafr
 BvaGrYjoTZcCVzQvXqEJd/o5J0cVvv7O6TuWz7rv2J4yyZFAlacKnv9BH
 GA6xzm2KjYyeuX4vNUkBtZ3FWNSxUcGNTj26mYExBsxAH1MBpgcycvBC9
 Sx3rt7Lm1tn8n9flsNk4L8gDUVw2hutcTUOjhdYfY3nnppq6qjDMtxaFV
 u08fZUr7H9nReIDPazFKAjFLmNnFU25mQEUSw6kGT1RWeyu4a90oO5T6/
 ab1Md0AX6Gie4ewEXeC0TRdcskN1qTR3iigaG3L0uFury+S1x0hWbxt4S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394526824"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="394526824"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779461794"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="779461794"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:13:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/hisilicon: include drm/drm_edid.h only where needed
In-Reply-To: <20231212142530.3826692-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231212142530.3826692-1-jani.nikula@intel.com>
Date: Tue, 19 Dec 2023 14:13:40 +0200
Message-ID: <87le9qtmob.fsf@intel.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Reduce the need for rebuilds when drm_edid.h is modified by including it
> only where needed.

Ping?

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index f957552c6c50..207aa3f660b0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -18,7 +18,6 @@
>  #include <linux/i2c-algo-bit.h>
>  #include <linux/i2c.h>
>  
> -#include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
>  
>  struct hibmc_connector {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 8c6d2ea2a472..94e2c573a7af 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -14,6 +14,7 @@
>  #include <linux/io.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_simple_kms_helper.h>

-- 
Jani Nikula, Intel
