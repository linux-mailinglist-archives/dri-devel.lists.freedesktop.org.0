Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79E7DDEF1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86710E6A3;
	Wed,  1 Nov 2023 10:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA1F10E6A2;
 Wed,  1 Nov 2023 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698833208; x=1730369208;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=p5R2iZQRJG+abCenQeDgAs1cs0KVgUBJ1kB6ME2nghA=;
 b=jYgWGcIWOsBfBnK9IKGV2IMwgBKCEl4WyULC4MxjJo3WcLqUKQgy9JyO
 zxUTSOU0IRJuxrGHKVJlPmpucUKuoiAokrJNgXPeVfs+DZmYdcmEGziXt
 a3wLqhQS5KicHDR8YNvjf/fUWfsmTbpqXTQnqadBJW3LY8JBGmHLH38uD
 CEa8iK29sF+NtP5ZnM+k7thaikeMchX1X17Y+QNERIAsC0QJH0+2+Gfwy
 ngyV89GB/l25iGRxMwWLtJGNPHa9VQQIvcG+caXBHUWm2CB0VtXuAVkYn
 A91wXnMaLFZiL6A6x1Pcs65HdMMX6H5ANA62sQL6zdp2MchZlXtGmcRNc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387352401"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="387352401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 03:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092307405"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="1092307405"
Received: from sartorig-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.166])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 03:06:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Remove unused for_each_uabi_class_engine
In-Reply-To: <20231101100124.303739-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231101100124.303739-1-tvrtko.ursulin@linux.intel.com>
Date: Wed, 01 Nov 2023 12:06:42 +0200
Message-ID: <87sf5p4wjx.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Unused macro after 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")
> removed some code.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

\o/

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Could I persuade you to move for_each_engine(),
for_each_engine_masked(), rb_to_uabi_engine(), and
for_each_uabi_engine() to a more suitable header?

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index bfcbe93bd9fe..744c8c4a50fa 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -418,11 +418,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>  	     (engine__); \
>  	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>  
> -#define for_each_uabi_class_engine(engine__, class__, i915__) \
> -	for ((engine__) = intel_engine_lookup_user((i915__), (class__), 0); \
> -	     (engine__) && (engine__)->uabi_class == (class__); \
> -	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
> -
>  #define INTEL_INFO(i915)	((i915)->__info)
>  #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
>  #define DRIVER_CAPS(i915)	(&(i915)->caps)

-- 
Jani Nikula, Intel
