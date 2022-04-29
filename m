Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687755146DD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB0A10E7A9;
	Fri, 29 Apr 2022 10:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BAF10E7A9;
 Fri, 29 Apr 2022 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651228662; x=1682764662;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4OZhsqmR2au0DmNIvEXATzin+QYbOtBayivNtuiR7yA=;
 b=EPror3BqeMNrk9O4YN4EJlNYiG+0TI9qNd5AWitM8hk3PMOy4TPeXbRq
 9UUCmJ53XT4GwHZ5Q7+IZ52cG0n2ZgCsJ96Lufbyg449R4ciJtRxqpIMe
 zdlfCfxqJzjwgHEjAc/W4xxkFObKmduFfZW1WZHwAyVqYB2vrDMa5Qx1L
 x5GdaVsGWSRC2IFUHi3ZSBhKpfjdAteWWpMNMuqPOVIOIquV/AfvLcWQj
 gEF6hCOLuk/apg/8LYHmuNY+ZlHe+9LGY1yRK/S6uTBiytOfB9vh0s9zz
 //RbuAcZhpEEbG1iQ55odfbeYMFTrLQP4/Qhulr6r1V4r6oJiWxu2yGwA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="353035902"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="353035902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:37:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="534423064"
Received: from agerasym-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.133.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:37:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL] gvt-next-2022-04-29
In-Reply-To: <9c2fc678-2e6e-a9d5-a540-2a6bfda31196@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <9c2fc678-2e6e-a9d5-a540-2a6bfda31196@intel.com>
Date: Fri, 29 Apr 2022 13:37:34 +0300
Message-ID: <87zgk4rx8x.fsf@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi folks:
>
> Here is the pull of gvt-next which fixes the compilation error and warnings
> for the the GVT-g refactor patches: 
>
> - Fix a compiling warning of non-static function only having one caller.
> - Fix a potential NULL pointer reference in the code re-factor.
> - Fix a compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
>
> I also tried to apply this pull on the latest drm-inte-next and it succeeded
> without error and warnings.

Thanks again, pulled to drm-intel-next.

BR,
Jani.

>
> The following changes since commit 5e9ae5c47052e28a31fb4f55a6e735c28d4c3948:
>
>   drm/i915/gvt: Add missing symbol export. (2022-04-26 04:18:43 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-29
>
> for you to fetch changes up to 419f8299ddad6070a6c95aaedf78e50265871f36:
>
>   i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers (2022-04-28 17:06:02 -0400)
>
> ----------------------------------------------------------------
> gvt-next-2022-04-29
>
> Introduce fixes from previous pull.
> - Fix a compiling warning of non-static funtion only having one caller.
> - Fix a potential NULL pointer reference in the code re-factor.
> - Fix a compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
>
> ----------------------------------------------------------------
> Wan Jiabing (1):
>       i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers
>
> Zhi Wang (2):
>       drm/i915/gvt: Make intel_gvt_match_device() static
>       drm/i915/gvt: Fix the compiling error when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
>
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>  drivers/gpu/drm/i915/intel_gvt.c    | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
