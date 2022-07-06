Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A99569270
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 21:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953B11BD23;
	Wed,  6 Jul 2022 19:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79C11BD23
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657134744; x=1688670744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DZdncc++SX6z3qvBj/0o2B0yIiwG2l2LTgHc5TLKSbU=;
 b=SYpH9nlHR5VcTzwpRet5cr9M6bBK0l2N5ooZNh0vWVA/LJsqusajdKSe
 wtygPD4QuUV+7b1eTPFbSs29Y/apsQqiQoacGVz5Edip4ManverpF8LVY
 71L7oY83EK7ZfUVHFMBbiobTuvxFApbMUeAKf5D3Bs25GrF6l8xq478cB
 DgON9MhOUt/lhpWI0kO6NVYnBSi0KP0YAJvgCX1nAMZQ6GE4AiS2C7JiC
 UH+i2UsqNwP2UDpCJGrKG2+jbFAKYAIo1PE8b6oIbQjuepwDBJeW0/n/0
 V+DJBgSPAXFkVIQefGkCvOOZAMZQpdCJ54Vww/jxBcyllSMdmuk56HB2W w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347830722"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="347830722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 12:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="568197894"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by orsmga006.jf.intel.com with SMTP; 06 Jul 2022 12:12:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Jul 2022 22:12:19 +0300
Date: Wed, 6 Jul 2022 22:12:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm: xlnx: add <linux/io.h> for readl/writel
Message-ID: <YsXekxslwDbfk4ax@intel.com>
References: <20220706184224.29116-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706184224.29116-1-rdunlap@infradead.org>
X-Patchwork-Hint: comment
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 11:42:24AM -0700, Randy Dunlap wrote:
> Add a header file to prevent build errors:
> 
> ../drivers/gpu/drm/xlnx/zynqmp_dp.c: In function ‘zynqmp_dp_write’:
> ../drivers/gpu/drm/xlnx/zynqmp_dp.c:335:9: error: implicit declaration of function ‘writel’ [-Werror=implicit-function-declaration]
>   335 |         writel(val, dp->iomem + offset);
> ../drivers/gpu/drm/xlnx/zynqmp_dp.c: In function ‘zynqmp_dp_read’:
> ../drivers/gpu/drm/xlnx/zynqmp_dp.c:340:16: error: implicit declaration of function ‘readl’ [-Werror=implicit-function-declaration]
>   340 |         return readl(dp->iomem + offset);
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")

Should be
Fixes: a204f9743b68 ("drm: Remove linux/i2c.h from drm_crtc.h")
probably?

allmodconfig caught a few other drivers needing io.h but somehow
this one built for me without that header on both arm and x86.
Was this on some other architecture, or maybe there's some weird
config dependency that pulls in io.h for allmodconfig?

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -25,6 +25,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>

-- 
Ville Syrjälä
Intel
