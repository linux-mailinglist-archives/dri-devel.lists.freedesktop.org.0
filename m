Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA34703D8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 16:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8C10E857;
	Fri, 10 Dec 2021 15:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE1010E882;
 Fri, 10 Dec 2021 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639150058; x=1670686058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=41OkHryt8MZcDNl8Shd1uQUUlxidAZfGNk5+1Vr5xRY=;
 b=IqyOeJiA9qV9jzOzbGh7qASaGGqxhdgAKuRAmng/VXGwSWwhL6xy8J4I
 M2meCNCVeeDXbH8ZuG5vGOZVnIWbLe01RlV05wIiqNRnGmHc+E73XOGD6
 l6I7kuVNn3hKT7GGXm8Grq1fLWIo+2AHCqPFqFJ3PJJtZWidylwzJ1jno
 uvlh2UfH6ZWmwY4mG4zAru2au5R9RybzuqCzuDqqUW7b2/hfpYGpBoy9X
 vo9BNyJLExhRJNujeuFPt6Av6TIbh6SgnDhA7c8WxxPiJ0uLKRntKHVIF
 YDzUOyuRyiu0dQYrKiDSp+1mjOus8WpncUFbqpFgaTeMhWZHY2uE2L2eR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="301748148"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="301748148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 07:27:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="462574434"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 07:27:38 -0800
Date: Fri, 10 Dec 2021 07:27:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v7 08/11] drm/i915/pxp: Use to_gt() helper
Message-ID: <20211210152736.GA2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-9-andi.shyti@linux.intel.com>
 <20211210010756.6423-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210010756.6423-1-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 03:07:56AM +0200, Andi Shyti wrote:
> Use to_gt() helper consistently throughout the codebase.
> Pure mechanical s/i915->gt/to_gt(i915). No functional changes.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> Hi,
> 
> the inline of i915_dev_to_pxp() was accidentally removed in v6.
> Thanks Matt.
> 
> Andi
> 
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 5d169624ad60..195b2323ec00 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -16,7 +16,9 @@
>  
>  static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
>  {
> -	return &kdev_to_i915(i915_kdev)->gt.pxp;
> +	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
> +
> +	return &to_gt(i915)->pxp;
>  }
>  
>  static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
