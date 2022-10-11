Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A625FB47B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497BD10E820;
	Tue, 11 Oct 2022 14:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3585E10E81A;
 Tue, 11 Oct 2022 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665498207; x=1697034207;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IQdYdytsQ14F+RQa0XUqfe3XcrqNymhxTMjeflg4QgQ=;
 b=DeVYghhRMLQyh8/CssJmpqEuInBoisCYfR6rawfmjA0tJ+o97jah1lK2
 AaGR1w/ocxhqsmrbuXAkNw6VNDgiZYRHGX2IRY00pok2vHplqST47Fx0j
 jMDy744IdGK2//HQFdCD9ppQVzIp993whBzcrl7NVAf2wp2Npm3mql8aY
 vQW+s3J5PjszIcSsxShY3eUrf1zXfRa7I2IXaGvx0GiBey13wJb+Zvlkn
 JOb/5VQfHiaIfyi6sPCHGOpcbA3Xqm2JDYGpYCoEFMW/9EBGuJkP0gTcm
 kmBR/qphfCOUAgOWk2zsYGevBk/ERlkOl9kMJTIal6yR/YtT/yJ6Rlo/3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="330997882"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="330997882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:23:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="955352557"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="955352557"
Received: from mhartiga-mobl.ger.corp.intel.com (HELO [10.213.228.219])
 ([10.213.228.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:23:25 -0700
Message-ID: <2c6001fe-a8bf-8bf0-7452-51420f117282@linux.intel.com>
Date: Tue, 11 Oct 2022 15:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/i915/trace: Removed unused frequency trace
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221011135940.367048-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221011135940.367048-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andi Shyti <andi@etezian.org>, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/2022 14:59, Andi Shyti wrote:
> Commit 3e7abf814193 ("drm/i915: Extract GT render power state management")
> removes the "trace_intel_gpu_freq_change()" trace points but
> their definition was left without users. Remove it.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/i915_trace.h | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 37b5c9e9d260..c70a02517e02 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -671,21 +671,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
>   		(u32)(__entry->val >> 32))
>   );
>   
> -TRACE_EVENT(intel_gpu_freq_change,
> -	    TP_PROTO(u32 freq),
> -	    TP_ARGS(freq),
> -
> -	    TP_STRUCT__entry(
> -			     __field(u32, freq)
> -			     ),
> -
> -	    TP_fast_assign(
> -			   __entry->freq = freq;
> -			   ),
> -
> -	    TP_printk("new_freq=%u", __entry->freq)
> -);
> -
>   /**
>    * DOC: i915_ppgtt_create and i915_ppgtt_release tracepoints
>    *

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
