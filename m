Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E5532875
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 13:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06FF10EC59;
	Tue, 24 May 2022 11:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A810E9DB;
 Tue, 24 May 2022 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653390217; x=1684926217;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CntG2zT79s+rUqc/RwF4HmNc6O2cBy1aTPUYDsYRjjE=;
 b=dh2PDazC+Hias72hL+YjkQm+4NV8DToFrS9UKRxKmiS3wgYrkk72n1tB
 4HB9DvustuCf75leTsWV2XTHhp/g+hpBKnjrdGuwzenebYvPq94XzybWQ
 s1zPvooRPuxUqQc58hHj1Cq7cjoBqvpzVDjfb98Wbo4j8xSw5I9hLE9wb
 tRHKJV2SdjpVuqjKnF7vHEArIBNa7kuAcpq7eJf2rKGc5fr5CAZ5dQyk1
 VdQKcyihYFN9IuqXbLDzGRljMC7A+9nwHXaUA/KRi9xsK8iRezZJCDrWe
 y61FScKe9PRfstwWtCrQcDW0AHHOXQVMLSQa0AVm+V4d3ZYUIquxtL5Bu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="334144541"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="334144541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 04:03:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="745175110"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 04:03:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] drm/i915: fix typos in comments
In-Reply-To: <20220521111145.81697-90-Julia.Lawall@inria.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220521111145.81697-90-Julia.Lawall@inria.fr>
Date: Tue, 24 May 2022 14:03:29 +0300
Message-ID: <87ee0jw5tq.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 May 2022, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> Spelling mistakes (triple letters) in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks, pushed to drm-intel-next.

BR,
Jani.

>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c           |    2 +-
>  drivers/gpu/drm/i915/display/intel_pps.c             |    2 +-
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c |    2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c           |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 34128c9c635c..a27ce874a9e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1638,7 +1638,7 @@ static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
>  	/*
>  	 * Enable 10bit gamma for D13
>  	 * ToDo: Extend to Logarithmic Gamma once the new UAPI
> -	 * is acccepted and implemented by a userspace consumer
> +	 * is accepted and implemented by a userspace consumer
>  	 */
>  	else if (DISPLAY_VER(i915) >= 13)
>  		gamma_mode |= GAMMA_MODE_MODE_10BIT;
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index 5a598dd06039..4bc0563dde92 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -509,7 +509,7 @@ static void wait_panel_power_cycle(struct intel_dp *intel_dp)
>  
>  	drm_dbg_kms(&i915->drm, "Wait for panel power cycle\n");
>  
> -	/* take the difference of currrent time and panel power off time
> +	/* take the difference of current time and panel power off time
>  	 * and then make panel wait for t11_t12 if needed. */
>  	panel_power_on_time = ktime_get_boottime();
>  	panel_power_off_duration = ktime_ms_delta(panel_power_on_time, intel_dp->pps.panel_power_off_time);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 86f7a9ac1c39..aa0d2bbbbcc4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1350,7 +1350,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>  			 * submission. If we don't cancel the timer now,
>  			 * we will see that the timer has expired and
>  			 * reschedule the tasklet; continually until the
> -			 * next context switch or other preeemption event.
> +			 * next context switch or other preemption event.
>  			 *
>  			 * Since we have decided to reschedule based on
>  			 * consumption of this timeslice, if we submit the
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 78d2989fe917..02311ad90264 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -588,7 +588,7 @@ int intel_guc_log_relay_open(struct intel_guc_log *log)
>  	/*
>  	 * We require SSE 4.1 for fast reads from the GuC log buffer and
>  	 * it should be present on the chipsets supporting GuC based
> -	 * submisssions.
> +	 * submissions.
>  	 */
>  	if (!i915_has_memcpy_from_wc()) {
>  		ret = -ENXIO;
>

-- 
Jani Nikula, Intel Open Source Graphics Center
