Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447494C14C3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CCB10F1AF;
	Wed, 23 Feb 2022 13:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0865110F4AE;
 Wed, 23 Feb 2022 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645622496; x=1677158496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=emMjXN/y5MukTqZE/gPCnQAiCoJ5pERvBHX+dRTKZLQ=;
 b=AQLFZnU/mAV368fkcQcWT4CVvFmULc3VfUPMiwrRNqAzGJC5a4IWUhRU
 uOXOyFk9nlV5GWTWlhXypZJO6OD8rRiOW/HZWouRwSWhete1IZDmvj2QF
 hJAX0dez93y/aI5mR0L+vG3F7io6aqQVWMkkwTQ4lYVwDvJRLfIuIdwtm
 IbapXkI0VTIt6vHv0wPi1lyh2LAQhsLrqpsHABe3oMqPj4LEfi+iisQLD
 xdNbf3yMEU5RzY1Z3z62KfhIbK8UVmyc2nIAErDodfFzUIe93f1GVhjqi
 H0okYYQ5mxgJjmyangFNUgfKuDXHKzVw9O01Ce0WmBdX1i3PSBaTsj9PJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235467590"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="235467590"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:21:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="532679042"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.63.194])
 ([10.252.63.194])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:21:33 -0800
Message-ID: <bff82174-db91-f021-83e2-c607b55e26e1@linux.intel.com>
Date: Wed, 23 Feb 2022 14:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/7] drm/i915: Use the memcpy_from_wc function
 from drm
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <02d3850b-5481-d142-f1d4-b408ea2b2431@linux.intel.com>
 <YhYVyZM3TsC5wtL5@bvivekan-mobl.gar.corp.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <YhYVyZM3TsC5wtL5@bvivekan-mobl.gar.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 13:51:45 +0000
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, Jani Nikula <jani.nikula@intel.com>,
 lucas.demarchi@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 siva.mullati@intel.com, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/02/2022 12:08, Balasubramani Vivekanandan wrote:
> On 23.02.2022 10:02, Das, Nirmoy wrote:
>> On 22/02/2022 15:51, Balasubramani Vivekanandan wrote:
>>> drm_memcpy_from_wc() performs fast copy from WC memory type using
>>> non-temporal instructions. Now there are two similar implementations of
>>> this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
>>> another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
>>> drm_memcpy_from_wc() was the recent addition through the series
>>> https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6
>>>
>>> The goal of this patch series is to change all users of
>>> i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
>>> implementation in drm and eventually remove the copy from i915.
>>>
>>> Another benefit of using memcpy functions from drm is that
>>> drm_memcpy_from_wc() is available for non-x86 architectures.
>>> i915_memcpy_from_wc() is implemented only for x86 and prevents building
>>> i915 for ARM64.
>>> drm_memcpy_from_wc() does fast copy using non-temporal instructions for
>>> x86 and for other architectures makes use of memcpy() family of
>>> functions as fallback.
>>>
>>> Another major difference is unlike i915_memcpy_from_wc(),
>>> drm_memcpy_from_wc() will not fail if the passed address argument is not
>>> alignment to be used with non-temporal load instructions or if the
>>> platform lacks support for those instructions (non-temporal load
>>> instructions are provided through SSE4.1 instruction set extension).
>>> Instead drm_memcpy_from_wc() continues with fallback functions to
>>> complete the copy.
>>> This relieves the caller from checking the return value of
>>> i915_memcpy_from_wc() and explicitly using a fallback.
>>>
>>> Follow up series will be created to remove the memcpy_from_wc functions
>>> from i915 once the dependency is completely removed.
>> Overall the series looks good to me but I think you can add another patch to
>> remove
>>
>> i915_memcpy_from_wc() as I don't see any other usages left after this series, may be I
>> am missing something?
> I have changed all users of i915_memcpy_from_wc() to drm function. But
> this is another function i915_unaligned_memcpy_from_wc() in
> i915_memcpy.c which is blocking completely eliminating the i915_memcpy.c
> file from i915.
> This function accepts unaligned source address and does fast copy only
> for the aligned region of memory and remaining part is copied using
> memcpy function.
> Either I can move i915_unaligned_memcpy_from_wc() also to drm but I am
> concerned since it is more a platform specific handling, does it make
> sense to keep it in drm.
> Else I have retain to i915_unaligned_memcpy_from_wc() inside i915 and
> refactor the function to use drm_memcpy_from_wc() instead of the
> __memcpy_ntdqu().


I think for completeness it makes sense to remove i915_memcpy_from_wc() 
and its helper functions

in this series.  I don't think we can have 
i915_unaligned_memcpy_from_wc() if want i915 on ARM[0] so I think

you can remove usages of i915_unaligned_memcpy_from_wc() as well.


[0]IIUC  CI_BUG_ON() check in i915_unaligned_memcpy_from_wc() will 
raise  a build error on ARM


Regards,

Nirmoy


> But before I could do more changes, I wanted feedback on the current
> change. So I decided to go ahead with creating series for review.
>
> Regards,
> Bala
>
>> Regards,
>> Nirmoy
>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Chris Wilson <chris.p.wilson@intel.com>
>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>
>>> Balasubramani Vivekanandan (7):
>>>     drm: Relax alignment constraint for destination address
>>>     drm: Add drm_memcpy_from_wc() variant which accepts destination
>>>       address
>>>     drm/i915: use the memcpy_from_wc call from the drm
>>>     drm/i915/guc: use the memcpy_from_wc call from the drm
>>>     drm/i915/selftests: use the memcpy_from_wc call from the drm
>>>     drm/i915/gt: Avoid direct dereferencing of io memory
>>>     drm/i915: Avoid dereferencing io mapped memory
>>>
>>>    drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    |  8 +-
>>>    drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 ++-
>>>    drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
>>>    .../drm/i915/selftests/intel_memory_region.c  |  8 +-
>>>    include/drm/drm_cache.h                       |  3 +
>>>    7 files changed, 148 insertions(+), 46 deletions(-)
>>>
