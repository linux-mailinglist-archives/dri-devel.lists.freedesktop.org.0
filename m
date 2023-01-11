Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39B665C50
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FC910E741;
	Wed, 11 Jan 2023 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7547A10E740;
 Wed, 11 Jan 2023 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673443123; x=1704979123;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3l8tH/svRoHiWV0nFuPhew5+bOgwQBLCJyTpdJqR1UA=;
 b=BQpmc91MEHKw+eaxeHOrho7mEGkiVg7ajHH5iV5kT7dhPASD/OpAbw0U
 Wo+03aF7l/7JNlNZM+dfdbOoJqsIeXUY683+BXmALxAvD+wXeDwA277gH
 7oypUMTr/O8bO4byyaZ7iJpXLQsHgq++sRYw8e6k37DWkYNnXswjj7Fvp
 k8cKyjUgXiu4q/IsiyAlHor52a9Pc1UeJT0RGVrwcGqJsqxVO4RysfXXs
 xLJoYorzAWWwkHrYxeAZN4zs5iUPuIqX9G1krSoW2z3yupWvcSbXCy5Yh
 8Oxa0TBINQIZq4se9Y+n/4bg/pXy8ywFZ+2BddS0AsjCyMGYbczd+M+w+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323475650"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="323475650"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:18:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659366618"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="659366618"
Received: from mmgriffi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:18:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
In-Reply-To: <20230111104447.338136-1-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
Date: Wed, 11 Jan 2023 15:18:38 +0200
Message-ID: <87a62pi501.fsf@intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
> During module load not all the punit transaction have completed
> and we might end up timing out, as shown by the following
> warning:

Root cause?

>
>    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
>
> Wait 10 seconds for the punit to settle and complete any
> outstanding transactions upon module load.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
>

No blank lines between the tag lines please.

> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> index a234d9b4ed14..3db2ba439bb5 100644
> --- a/drivers/gpu/drm/i915/intel_pcode.c
> +++ b/drivers/gpu/drm/i915/intel_pcode.c
> @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>  #undef COND
>  }
>  
> +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> +{
> +	if (__intel_wait_for_register_fw(uncore,
> +					 GEN6_PCODE_MAILBOX,
> +					 GEN6_PCODE_READY, 0,
> +					 500, timeout_ms,
> +					 NULL))
> +		return -EPROBE_DEFER;

This is already done within skl_pcode_request -> skl_pcode_try_request
-> __snb_pcode_rw path, with waits in skl_pcode_request.

Is there anyone who still understands what's being waited for, where,
for how long, and why in the different code paths? I know I don't, and
this isn't helping.

There's also no explanation on the -EPROBE_DEFER return in the commit
message or comments or anywhere.

Again, root cause?

BR,
Jani.


> +
> +	return skl_pcode_request(uncore,
> +				 DG1_PCODE_STATUS,
> +				 DG1_UNCORE_GET_INIT_STATUS,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> +}
> +
>  int intel_pcode_init(struct intel_uncore *uncore)
>  {
> +	int err;
> +
>  	if (!IS_DGFX(uncore->i915))
>  		return 0;
>  
> -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> -				 DG1_UNCORE_GET_INIT_STATUS,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> +	/*
> +	 * Wait 10 seconds so that the punit to settle and complete
> +	 * any outstanding transactions upon module load
> +	 */
> +	err = pcode_init_wait(uncore, 10000);
> +
> +	if (err) {
> +		drm_notice(&uncore->i915->drm,
> +			   "Waiting for HW initialisation...\n");
> +		err = pcode_init_wait(uncore, 180000);
> +	}
> +
> +	return err;
>  }
>  
>  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)

-- 
Jani Nikula, Intel Open Source Graphics Center
