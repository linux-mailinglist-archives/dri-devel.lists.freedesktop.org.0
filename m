Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFCB3E4A14
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD178952F;
	Mon,  9 Aug 2021 16:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4689533
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 16:36:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h14so22236468wrx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wsbOX2l/L+55vr7jzqQCIZyjCXxyBvlWWtt/fTKg6Ow=;
 b=bfg4Q/TsHVzGHNgD6ShC/wmcN10E0X/YYzpuPtPA1ujHvDtpE/PYw7tJbHaS1S3o/q
 /2qmjOtC90G3kWwq2rgWRYv9N3anxXZvTWbpDksM1YDSr2v1s6LlLLOZdCyPUSpZnJK0
 IQuPrBSP9bNNhtgT3xyPXLIoAVsB+p+hSzxKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wsbOX2l/L+55vr7jzqQCIZyjCXxyBvlWWtt/fTKg6Ow=;
 b=crzAb4+/8SgoYLZJAlbDRyA8Kejv+nvkku2UC0nPOKe5Sq0mgqqzgmTAciTw9QkU3Q
 EIVTk/vTu6EWsoCeOSWnGHjBESk31HnE+5nXZnVmE0TXLMSoibjoQKOt4AgUOvesHoiG
 tI9tBEZfMDHlm/UgrKqc9JoeoCZxiVFnmtkdZA2Yo9UoD2JbjxzD5Me8EXh6I0H6d4Et
 1+e+u5vTdfOuCSqlqylDM+Sk6Bu0/DUfZd53pfF0QQvlkVb3HFtm1rsJRstdPofQIqod
 Rh2cU7RDLZ+OX2HaA1KVZj3kjHRzN2II3Eo/rVG30PzDEjuwaPwQUBxf/ODl+dJGxXa5
 2sZw==
X-Gm-Message-State: AOAM531F8jhY2A3Hiw15KYBUaAZq0lh7HP3/Ifh7mgOrCQfIVpq12xMG
 a/KIr9yDpJDmi7tBBiP+5xYYkwLp+myE/g==
X-Google-Smtp-Source: ABdhPJxgF/i6D8QOofT0qu7hQBgR0QDkCdavZj+5ks47a35ktbEN+eyNj5iRG9u5BOFjQCUMqNBzsA==
X-Received: by 2002:a5d:4f0c:: with SMTP id c12mr26885266wru.63.1628527006726; 
 Mon, 09 Aug 2021 09:36:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i14sm15566013wmq.40.2021.08.09.09.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 09:36:46 -0700 (PDT)
Date: Mon, 9 Aug 2021 18:36:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 25/46] drm/i915/guc: Update debugfs for GuC multi-lrc
Message-ID: <YRFZnGNvmHPr6DTL@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-26-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803222943.27686-26-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 03, 2021 at 03:29:22PM -0700, Matthew Brost wrote:
> Display the workqueue status in debugfs for GuC contexts that are in
> parent-child relationship.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 +++++++++++++------
>  1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 30df1c8db491..44a7582c9aed 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4527,31 +4527,53 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>  		gse_log_submission_info(guc->gse[i], p, i);
>  }
>  
> +static inline void guc_log_context(struct drm_printer *p,
> +				   struct intel_context *ce)
> +{
> +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> +	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> +	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> +		   ce->ring->head,
> +		   ce->lrc_reg_state[CTX_RING_HEAD]);
> +	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> +		   ce->ring->tail,
> +		   ce->lrc_reg_state[CTX_RING_TAIL]);
> +	drm_printf(p, "\t\tContext Pin Count: %u\n",
> +		   atomic_read(&ce->pin_count));
> +	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> +		   atomic_read(&ce->guc_id_ref));
> +	drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> +		   atomic_read(&ce->guc_num_rq_not_ready));
> +	drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> +		   ce->guc_state.sched_state,
> +		   atomic_read(&ce->guc_sched_state_no_lock));

It's all debugfs, but I think proper locking even there is good. It at
least reduces the confusion when the locking scheme is largely
undocumented. Also given how much we have rcu for everything would be good
to double-check all pointer dererences are properly protected.

> +}
> +
>  void intel_guc_submission_print_context_info(struct intel_guc *guc,
>  					     struct drm_printer *p)
>  {
>  	struct intel_context *ce;
>  	unsigned long index;
>  	xa_for_each(&guc->context_lookup, index, ce) {

xa_for_each doesn't provide any guarantees, so doesn't protect against
concurrent removeal or anything like that. We need to do better than that.
-Daniel

> -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> -		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> -		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> -			   ce->ring->head,
> -			   ce->lrc_reg_state[CTX_RING_HEAD]);
> -		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> -			   ce->ring->tail,
> -			   ce->lrc_reg_state[CTX_RING_TAIL]);
> -		drm_printf(p, "\t\tContext Pin Count: %u\n",
> -			   atomic_read(&ce->pin_count));
> -		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> -			   atomic_read(&ce->guc_id_ref));
> -		drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> -			   atomic_read(&ce->guc_num_rq_not_ready));
> -		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> -			   ce->guc_state.sched_state,
> -			   atomic_read(&ce->guc_sched_state_no_lock));
> +		GEM_BUG_ON(intel_context_is_child(ce));
>  
> +		guc_log_context(p, ce);
>  		guc_log_context_priority(p, ce);
> +
> +		if (intel_context_is_parent(ce)) {
> +			struct guc_process_desc *desc = __get_process_desc(ce);
> +			struct intel_context *child;
> +
> +			drm_printf(p, "\t\tWQI Head: %u\n",
> +				   READ_ONCE(desc->head));
> +			drm_printf(p, "\t\tWQI Tail: %u\n",
> +				   READ_ONCE(desc->tail));
> +			drm_printf(p, "\t\tWQI Status: %u\n\n",
> +				   READ_ONCE(desc->wq_status));
> +
> +			for_each_child(ce, child)
> +				guc_log_context(p, child);
> +		}
>  	}
>  }
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
