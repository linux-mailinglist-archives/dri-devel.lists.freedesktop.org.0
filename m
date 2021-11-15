Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA44507C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ADA6EB45;
	Mon, 15 Nov 2021 15:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C636EAAD;
 Mon, 15 Nov 2021 15:01:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="257202914"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="257202914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 07:01:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="603868528"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 07:01:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mmdTp-0077l8-Dv; Mon, 15 Nov 2021 17:01:09 +0200
Date: Mon, 15 Nov 2021 17:01:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 0/3] drm/i915, agp/intel-ggt: clean up includes
Message-ID: <YZJ2NcvP/SrD+WXU@smile.fi.intel.com>
References: <cover.1636977089.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1636977089.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 01:53:10PM +0200, Jani Nikula wrote:
> Took Andy's patch [1] and expanded on it a bit.

Thank you!
It's always good to have cleanups in the headers,
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for your changes (including ones that you've done against my patch).

> [1] https://patchwork.freedesktop.org/patch/msgid/20211110102857.59604-1-andriy.shevchenko@linux.intel.com
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Andy Shevchenko (1):
>   agp/intel-gtt: Replace kernel.h with the necessary inclusions
> 
> Jani Nikula (2):
>   drm/i915: include intel-gtt.h only where needed
>   agp/intel-gtt: reduce intel-gtt dependencies more
> 
>  drivers/char/agp/intel-gtt.c         | 1 +
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 ++
>  drivers/gpu/drm/i915/gt/intel_gt.c   | 2 ++
>  drivers/gpu/drm/i915/i915_drv.h      | 1 -
>  include/drm/intel-gtt.h              | 8 +++++---
>  5 files changed, 10 insertions(+), 4 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


