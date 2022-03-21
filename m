Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B84E23FA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 11:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4873410E349;
	Mon, 21 Mar 2022 10:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE110E349;
 Mon, 21 Mar 2022 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647857280; x=1679393280;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=/YxNXyvnjwnCsBMu/jU1CbFq8M9LxaFWE/cJKWIY71I=;
 b=lUVKzYN6qKe8jHFmUiR5+2AfqIcfRjVBVGLfkrhwGFJ6TfTWGIH/vtqu
 twk5uNvE6cjUlre0IDVB1mdHJZ7h/s9T2pXSQARFbQHLgApZNxyCPQvvL
 Wu+aoCGe4WW8g2m1qlxGTbFY2MwDy4R+68heQouPPiLn1qF7ZKI3YK5xi
 oVFY7SKi/IDxAIsyCELA1R2RtzYm5lBn20rDQ87qFyKHscoWUiMFuP3W4
 TATKA2/E8G9UwxBf4fnL2dHC3rcwXeCbZmQof6dPbyp0kfYZHh0+ZkpBx
 VxRYtScRSvuhsC1E1V29dIKPap9VJLEJttiiTi+bvzOrqvXiv1Rxu95c0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="239671779"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="239671779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:07:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="559801022"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.57.103])
 ([10.252.57.103])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:07:57 -0700
Message-ID: <5abfaaae-a240-2629-1dea-3a3618542d45@linux.intel.com>
Date: Mon, 21 Mar 2022 11:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm/i915: Use the memcpy_from_wc
 function from drm
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, Jani Nikula <jani.nikula@intel.com>,
 lucas.demarchi@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 siva.mullati@intel.com, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

looks good to me overall but I would get others r-b.

Patches 1-3 Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Patches 4-7 Acked-by: Nirmoy Das <nirmoy.das@intel.com>

On 03/03/2022 19:00, Balasubramani Vivekanandan wrote:
> drm_memcpy_from_wc() performs fast copy from WC memory type using
> non-temporal instructions. Now there are two similar implementations of
> this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
> another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
> drm_memcpy_from_wc() was the recent addition through the series
> https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6
>
> The goal of this patch series is to change all users of
> i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
> implementation in drm and eventually remove the copy from i915.
>
> Another benefit of using memcpy functions from drm is that
> drm_memcpy_from_wc() is available for non-x86 architectures.
> i915_memcpy_from_wc() is implemented only for x86 and prevents building
> i915 for ARM64.
> drm_memcpy_from_wc() does fast copy using non-temporal instructions for
> x86 and for other architectures makes use of memcpy() family of
> functions as fallback.
>
> Another major difference is unlike i915_memcpy_from_wc(),
> drm_memcpy_from_wc() will not fail if the passed address argument is not
> alignment to be used with non-temporal load instructions or if the
> platform lacks support for those instructions (non-temporal load
> instructions are provided through SSE4.1 instruction set extension).
> Instead drm_memcpy_from_wc() continues with fallback functions to
> complete the copy.
> This relieves the caller from checking the return value of
> i915_memcpy_from_wc() and explicitly using a fallback.
>
> Follow up series will be created to remove the memcpy_from_wc functions
> from i915 once the dependency is completely removed.
>
> v2: Fixed missing check to find if the address is from system memory or
>      io memory and use the right initialization function to construct the
>      iosys_map structure (Review feedback from Lucas)
>
> Cc: Jani Nikula<jani.nikula@intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>  
> Cc: David Airlie<airlied@linux.ie>
> Cc: Daniel Vetter<daniel@ffwll.ch>
> Cc: Chris Wilson<chris.p.wilson@intel.com>  
> Cc: Thomas Hellstr_m<thomas.hellstrom@linux.intel.com>  
> Cc: Joonas Lahtinen<joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin<tvrtko.ursulin@linux.intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
>
> Balasubramani Vivekanandan (7):
>    drm: Relax alignment constraint for destination address
>    drm: Add drm_memcpy_from_wc() variant which accepts destination
>      address
>    drm/i915: use the memcpy_from_wc call from the drm
>    drm/i915/guc: use the memcpy_from_wc call from the drm
>    drm/i915/selftests: use the memcpy_from_wc call from the drm
>    drm/i915/gt: Avoid direct dereferencing of io memory
>    drm/i915: Avoid dereferencing io mapped memory
>
>   drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 15 ++-
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
>   .../drm/i915/selftests/intel_memory_region.c  | 41 +++++---
>   include/drm/drm_cache.h                       |  3 +
>   7 files changed, 174 insertions(+), 55 deletions(-)
>
