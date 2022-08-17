Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB708596C8C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 12:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0818B1D6;
	Wed, 17 Aug 2022 10:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CB118B068;
 Wed, 17 Aug 2022 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660730827; x=1692266827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VY9HmC06/GiqH+NWWRi/loTPdaF13nBoTTrKrW/3CaY=;
 b=Tj4FjMk5JyEkC/3y0K9p+qQls48kI+ROXwaWT0oDpXaoDwFdrhz4SESd
 jagJbmAbtdCTeoKHj7ZuZPAr0CA1+CIJTe75kUrquCI8OZZyxpGcIeFSd
 G8g+YewEZpKKmu6tG+l2yC6I8YTYjD0Wjr+7I3Wi2qzo/9MiXRVgTT2Z2
 IjZp4lfpvaPuddIIkNM8sgRhbNxsN3XSvO3D/iXAns0fqKfInKFNZPBhQ
 Wr3Ffjrh1Ra+ytultSvjdoT/C2ZvMRyZp16KEnbvcZ86ySc2zyvTzTyvx
 590qwZY2FVbk1MekLc98C4o1CyCw6hg+F8bukm/ajEiE9Ds2BJwMHbLzl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292451538"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="292451538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 03:07:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="667548356"
Received: from sbammi-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 03:07:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bo Liu <liubo03@inspur.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: Fix all occurences of the "the the" typo
In-Reply-To: <20220816094919.5419-1-liubo03@inspur.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220816094919.5419-1-liubo03@inspur.com>
Date: Wed, 17 Aug 2022 13:07:01 +0300
Message-ID: <87h72bp4je.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Bo Liu <liubo03@inspur.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Aug 2022, Bo Liu <liubo03@inspur.com> wrote:
> There is an unexpected word "the" in the file i915_irq.c,
> fix it.
>
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Thanks for the patch, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 73cebc6aa650..783a6ca41a61 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -65,7 +65,7 @@
>  
>  /*
>   * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the the GPU so interrupts from a device which
> + * interrupt originated from the GPU so interrupts from a device which
>   * shares the interrupt line are not accounted.
>   */
>  static inline void pmu_irq_stats(struct drm_i915_private *i915,

-- 
Jani Nikula, Intel Open Source Graphics Center
