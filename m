Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E025A4EEE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0E10F13C;
	Mon, 29 Aug 2022 14:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0B110F13C;
 Mon, 29 Aug 2022 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661782471; x=1693318471;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+4TOCeNd5iz1aL0fhEmhVh+hpLbLwO+LY5ZaMMmawU0=;
 b=OmSwFbBjgFQ16k+3n5jxRTl9oqvEdtu7Fv4e38PiTqonGl9QRH5c7Djw
 f+DCWlqRjyJ2fzZxKbnMWpuujTp42vTLi48JdloI9yQ2y22SchLltKETr
 cwd9HNcAZJU4SP5YW3cAxhbc0vRYmTxPjb82ZKtnEG5metJpyyAttJ34z
 K9ytXpF/ww7hSjjgnFOEr1leDeJrrMfO6gDgjnRe3j3FDs3NWSU0hsecy
 d8JziBc8SArC/i/tbbNWkyWNM/BNLTzXR0e1WGGsKdOB2iBUGUoIqEgi3
 Lny5+4dSjzODwC/ie8YnLNPSRmxJDmzkOhz5OrfXX+Ib5ubwRnHgV93DU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="293647245"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="293647245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 07:14:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="939591027"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 07:14:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: wangjianli <wangjianli@cdjrlc.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: fix repeated words in comments
In-Reply-To: <20220823141639.13053-1-wangjianli@cdjrlc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220823141639.13053-1-wangjianli@cdjrlc.com>
Date: Mon, 29 Aug 2022 17:14:02 +0300
Message-ID: <87y1v7dtn9.fsf@intel.com>
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
Cc: wangjianli <wangjianli@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Aug 2022, wangjianli <wangjianli@cdjrlc.com> wrote:
>  Delete the redundant word 'the'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Already fixed by commit 78f48aa6f50b ("drm/i915/irq: Fix a "the the"
typo").

What is this sudden influx of patches fixing repeated words everywhere?

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
