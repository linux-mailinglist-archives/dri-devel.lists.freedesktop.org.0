Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40037ABDE
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88076E155;
	Tue, 11 May 2021 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AED46E155
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:25:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s6so23561732edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F0uOLys0/2HYQqBj7Sg1fWalxyUnexlt3yrwG3XhMjI=;
 b=I9uuE7pL/nDXlUY2Hcq+RLsDqtuucyAAwsW5fdRkEi6JcI52AWCq6MdCXiRVEU9rKP
 CC+xGhMgzBnI/AWwT1CNs1+efSg+CWcqEe7TCa15zKAIyG4LxpjNRHu+PwzrtEXipc5w
 ViYzSA1ycX1QMG/B+2RAr/2TMF3gBMGEpFnvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F0uOLys0/2HYQqBj7Sg1fWalxyUnexlt3yrwG3XhMjI=;
 b=G2Cnkdn3rYThaUJ4wUscai3QsE+tkwSZocE/+i+gsztJTHRJR00b5tHJoML/xV6rZt
 CZ6k1nMt4CdVVurZjyALCa0rg3g3LYHlec9VE02k8jjn7r6K0fmKDkkp15EmOejp1RvC
 38REToAX+kwm9ZZiuQM9Iy613VwfDRTcMRVzX9fUgEM6t5P566m8CmoYPvv58P3k5LKc
 RWQf1oEsfNJo71thdWZ/fUMdm7LscHWy6VpWvLy9FcsvEeuNCHXUAdt+m3p3mNzgIhpd
 lmpRcUOTAAsCdXBq8byoNmk6H0PuYOlbvhGzqLcZkbMQiYZnXxcALHlOjgpTypYC2e0U
 TRpg==
X-Gm-Message-State: AOAM531J86bHyeGrZu3HuMl3sLRtX7bycCvV032sgaVf7aDPEsZTisHP
 HsCuCFEcftZ31WNsu5v6Nmh2Sw==
X-Google-Smtp-Source: ABdhPJzJl7dj7EvTkRuluWTC0U2oWW6bJBKjPHOhT4gGxGAUs+e4lp3pNRKWm0Jrm7gt+vx4far41A==
X-Received: by 2002:a05:6402:348d:: with SMTP id
 v13mr4387653edc.63.1620750335923; 
 Tue, 11 May 2021 09:25:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j7sm15136480edv.40.2021.05.11.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:25:35 -0700 (PDT)
Date: Tue, 11 May 2021 18:25:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 68/97] drm/i915/guc: Handle context reset
 notification
Message-ID: <YJqv/XLM2iPkn+aR@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-69-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-69-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:14:22PM -0700, Matthew Brost wrote:
> GuC will issue a reset on detecting an engine hang and will notify
> the driver via a G2H message. The driver will service the notification
> by resetting the guilty context to a simple state or banning it
> completely.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Entirely aside, but I wonder whether we shouldn't just make
non-recoverable contexts the only thing we support. But probably a too big
can of worms.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++++++++++++
>  drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 277b4496a20e..a2abe1c422e3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -263,6 +263,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>  					  const u32 *msg, u32 len);
>  int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>  				     const u32 *msg, u32 len);
> +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> +					const u32 *msg, u32 len);
>  
>  void intel_guc_submission_reset_prepare(struct intel_guc *guc);
>  void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index b3194d753b13..9c84b2ba63a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -941,6 +941,12 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>  			CT_ERROR(ct, "schedule context failed %x %*ph\n",
>  				  action, 4 * len, payload);
>  		break;
> +	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
> +		ret = intel_guc_context_reset_process_msg(guc, payload, len);
> +		if (unlikely(ret))
> +			CT_ERROR(ct, "context reset notification failed %x %*ph\n",
> +				  action, 4 * len, payload);
> +		break;
>  	default:
>  		ret = -EOPNOTSUPP;
>  		break;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 2c3791fc24b7..940017495731 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2192,6 +2192,41 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>  	return 0;
>  }
>  
> +static void guc_context_replay(struct intel_context *ce)
> +{
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +
> +	__guc_reset_context(ce, true);
> +	i915_sched_engine_hi_kick(sched_engine);
> +}
> +
> +static void guc_handle_context_reset(struct intel_guc *guc,
> +				     struct intel_context *ce)
> +{
> +	trace_intel_context_reset(ce);
> +	guc_context_replay(ce);
> +}
> +
> +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> +					const u32 *msg, u32 len)
> +{
> +	struct intel_context *ce;
> +	int desc_idx = msg[0];
> +
> +	if (unlikely(len != 1)) {
> +		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	ce = g2h_context_lookup(guc, desc_idx);
> +	if (unlikely(!ce))
> +		return -EPROTO;
> +
> +	guc_handle_context_reset(guc, ce);
> +
> +	return 0;
> +}
> +
>  void intel_guc_log_submission_info(struct intel_guc *guc,
>  				   struct drm_printer *p)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 97c2e83984ed..c095c4d39456 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -929,6 +929,11 @@ DECLARE_EVENT_CLASS(intel_context,
>  		      __entry->guc_sched_state_no_lock)
>  );
>  
> +DEFINE_EVENT(intel_context, intel_context_reset,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
>  DEFINE_EVENT(intel_context, intel_context_register,
>  	     TP_PROTO(struct intel_context *ce),
>  	     TP_ARGS(ce)
> @@ -1026,6 +1031,11 @@ trace_i915_request_out(struct i915_request *rq)
>  {
>  }
>  
> +static inline void
> +trace_intel_context_reset(struct intel_context *ce)
> +{
> +}
> +
>  static inline void
>  trace_intel_context_register(struct intel_context *ce)
>  {
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
