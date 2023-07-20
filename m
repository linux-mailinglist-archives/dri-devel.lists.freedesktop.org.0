Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9575A985
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A72A10E15F;
	Thu, 20 Jul 2023 08:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940F610E0C5;
 Thu, 20 Jul 2023 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689842591; x=1721378591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=di9h+46ohxqoEGRZiCGzN9lOQ5UWLl/5Mvmelef0gBg=;
 b=O/SvxBb00TKPFu1nljjRDo8QsrtRjTy13T5SVzb0qXgPd2ZFUDrOSJWF
 xjT9lq4oJM88jRTe0+c7MW1RDkCoQGmk/oLmjNFcbV+GteLMtIsVWWCIP
 TV/d+uDCKG2tKn6IaRaz7gKBPuqfNXobtu5tH2jQ7Zls6m+x3NZxXFx8K
 idAP8EmJyOIcUabtQJmhM75s6PoMIbOCX/+iQIi/bk0+Kszi7YCp7PqCI
 PyJnDbvkga0SDvzHwQDNGMFzQ782/7iXzbfXg/jrqSyd35wAH/z6xtwrv
 fUPAG3et0kZprTDyeLzI84ztjGwpT4UOd5YeYNIfME/xvB7FaJnrYBdAd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365558097"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="365558097"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="718317662"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="718317662"
Received: from ctuohy-mobl1.ger.corp.intel.com (HELO [10.213.193.21])
 ([10.213.193.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:43:07 -0700
Message-ID: <1a2aeca6-12f7-6316-c6e2-8474fd17255e@linux.intel.com>
Date: Thu, 20 Jul 2023 09:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/i915: Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, emma@anholt.net,
 mwen@igalia.com
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
 <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-2-36ed8fc8faea@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-2-36ed8fc8faea@kernel.org>
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/07/2023 22:44, Nathan Chancellor wrote:
> A proposed update to clang's -Wconstant-logical-operand to warn when the
> left hand side is a constant shows the following instance in
> nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a multiple of HZ,
> such as CONFIG_HZ=300:
> 
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      189 |         if (NSEC_PER_SEC % HZ &&
>          |             ~~~~~~~~~~~~~~~~~ ^
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: use '&' for a bitwise operation
>      189 |         if (NSEC_PER_SEC % HZ &&
>          |                               ^~
>          |                               &
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: remove constant to silence this warning
>    1 warning generated.
> 
> Turn this into an explicit comparison against zero to make the
> expression a boolean to make it clear this should be a logical check,
> not a bitwise one.

So -Wconstant-logical-operand only triggers when it is a constant but 
not zero constant? Why does that make sense is not a kludge to avoid too 
much noise?

Personally, it all feels a bit over the top as a warning,  since code in 
both cases should optimise away. And we may end up papering over it if 
it becomes a default.

Then again this patch IMO does make the code more readable, so I am 
happy to take this one via our tree. Or either give ack to bring it in 
via drm-misc-next:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Let me know which route works best.

Regards,

Tvrtko

> Link: https://reviews.llvm.org/D142609
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 4a33ad2d122b..d4b918fb11ce 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -186,7 +186,7 @@ i915_gem_object_wait(struct drm_i915_gem_object *obj,
>   static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
>   {
>   	/* nsecs_to_jiffies64() does not guard against overflow */
> -	if (NSEC_PER_SEC % HZ &&
> +	if ((NSEC_PER_SEC % HZ) != 0 &&
>   	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
>   		return MAX_JIFFY_OFFSET;
>   
> 
