Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38FB5A2241
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 09:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81B10E6DD;
	Fri, 26 Aug 2022 07:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E6010E6DD;
 Fri, 26 Aug 2022 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661500226; x=1693036226;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lz2nlc39lwdcTUXOc/Lv9g64tJOeRWMEspIuHmIzNNU=;
 b=SyUo64oxtmMOpPvPIvcKUWUJhmUIaIZluUcLKuczYkJZyf25UudVAxcs
 K52rvhLXPoIFnA3oxPf5JT5mHyuKdYwdA+3wR0yPYuPH5aSuDz0lfOhVz
 tPgCluAkDqImKjcHXEjGQaUZx5SyNA9urktbW2kOly/ExNGTQu6rWIk56
 SWqcRI7s/+BXpfuTn3BGoJrpDQ+q1P/okSEZgUBd5L+hGft0arnhDrryf
 kWPHhoh62j/GGNP/QS1LdtNPYJ86XBQDRcbFJnse69P1UcHRqx4cXUrds
 wUaQn1H97asZvjp0GQjosPBEaKG6324WmLnR1CJrjxghMbm60nPmQ+yUY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="294454009"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="294454009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 00:50:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="639965788"
Received: from plomuzio-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 00:50:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <20220826123636.72fbea19@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826123636.72fbea19@canb.auug.org.au>
Date: Fri, 26 Aug 2022 10:50:00 +0300
Message-ID: <87k06vh2af.fsf@intel.com>
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 John Harrison <John.C.Harrison@Intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Aug 2022, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/i915/gt/uc/intel_guc.c: In function 'intel_guc_dump_time_info':
> drivers/gpu/drm/i915/gt/uc/intel_guc.c:399:9: error: implicit declaration of function 'intel_device_info_print_runtime'; did you mean 'intel_device_info_print'? [-Werror=implicit-function-declaration]
>   399 |         intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |         intel_device_info_print
>
> Caused by commit
>
>   c7d3c8447b26 ("drm/i915: combine device info printing into one")
>
> interacting with commit
>
>   368d179adbac ("drm/i915/guc: Add GuC <-> kernel time stamp translation information")
>
> from the drm tree.

There's commit f0c70d41e4e8 ("drm/i915/guc: remove runtime info printing
from time stamp logging") in drm-intel-gt-next removing that line
altogether.

BR,
Jani.

>
> I have applied the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 26 Aug 2022 12:30:19 +1000
> Subject: [PATCH] fix up for "drm/i915/guc: Add GuC <-> kernel time stamp translation information"
>
> interacting with "drm/i915: combine device info printing into one".
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index ab4aacc516aa..977278d71182 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -396,7 +396,7 @@ void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
>  	u32 stamp = 0;
>  	u64 ktime;
>  
> -	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
> +	intel_device_info_print(INTEL_INFO(gt->i915), RUNTIME_INFO(gt->i915), p);
>  
>  	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
>  		stamp = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
> -- 
> 2.35.1

-- 
Jani Nikula, Intel Open Source Graphics Center
