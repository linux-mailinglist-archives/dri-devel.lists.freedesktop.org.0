Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED433BC556F
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227B10E818;
	Wed,  8 Oct 2025 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMsPGqlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E620710E817;
 Wed,  8 Oct 2025 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759932146; x=1791468146;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RuoZ2dtx6i0vO8J+VnYW3QE3ak4U7HtJNueIdgNvDQo=;
 b=SMsPGqlzZMUPPilYdBT1bcTq12MMCyEVdEGVgw7CYNaBQAg/i139wBn6
 TW8AzMD4aXeAUkXvWJf4+1QgU0cA7dKtP+rr3NQdBl93u6H5rCRG7mrXq
 8dfRJskxcfDptQISDlSmPSauUdBH8DaMGopdUbeyaJYgRDmD5TkLd1ZAQ
 84BVge0FbXSJn2604XyFuVsoOEcOmE4Ahjkb6PwxOx/4HfAtkZxF/5F6s
 P3mbq/LK7trl77DF9jhVmjZxAZWErc0l2F5VKYE2SpPJnIEijoUD1Hc0M
 Ur/G3xdFwQS7uYqnNZr1AigD9EA0dwbPXc/VRvxk7h3AS2khSS4UYhMRQ w==;
X-CSE-ConnectionGUID: nArqGoa6T2u+YZnfMBiHuQ==
X-CSE-MsgGUID: klSF4aMcTqu3A5TWe+DKsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64742799"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="64742799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:02:26 -0700
X-CSE-ConnectionGUID: QOT0cXtRRUe0KFNapZjzbw==
X-CSE-MsgGUID: Xl5sZ9ZuSNK4oN/hl7mF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="184714912"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:02:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>, Simona Vetter
 <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>, Janusz
 Krzysztofik <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915: force getparam ioctl return bool for
 HAS_CONTEXT_ISOLATION
In-Reply-To: <20251008115632.16333-4-krzysztof.niemiec@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
 <20251008115632.16333-4-krzysztof.niemiec@intel.com>
Date: Wed, 08 Oct 2025 17:02:18 +0300
Message-ID: <e82b1f8d327398e7c7d4197b3492cf2a250513de@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Oct 2025, Krzysztof Niemiec <krzysztof.niemiec@intel.com> wrote:
> From: Adrian Larumbe <adrian.larumbe@collabora.com>
>
> In a previous commit, the uAPI documentation for this param was updated
> to reflect the actual usage expected by Iris. Now make sure the driver
> does indeed return a boolean value rather than an engine bitmask.
>
> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 14 ++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
>  drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 833987015b8b..1f8e2bc540a9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -324,3 +324,17 @@ unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915)
>  
>  	return which;
>  }
> +
> +bool engines_context_isolated(struct drm_i915_private *i915)

Please see other functions exposed from the file, and use name prefixing
accordingly.

BR,
Jani.


> +{
> +	struct intel_engine_cs *engine;
> +
> +	if (!DRIVER_CAPS(i915)->has_logical_contexts)
> +		return false;
> +
> +	for_each_uabi_engine(engine, i915)
> +		if (!engine->default_state)
> +			return false;
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.h b/drivers/gpu/drm/i915/gt/intel_engine_user.h
> index 3dc7e8ab9fbc..760167db07d5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.h
> @@ -15,6 +15,7 @@ struct intel_engine_cs *
>  intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance);
>  
>  unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915);
> +bool engines_context_isolated(struct drm_i915_private *i915);
>  
>  void intel_engine_add_user(struct intel_engine_cs *engine);
>  void intel_engines_driver_register(struct drm_i915_private *i915);
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 6fcda6d7b5b7..34999ab51a6f 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -163,7 +163,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>  			value = -EINVAL;
>  		break;
>  	case I915_PARAM_HAS_CONTEXT_ISOLATION:
> -		value = intel_engines_has_context_isolation(i915);
> +		value = engines_context_isolated(i915);
>  		break;
>  	case I915_PARAM_SLICE_MASK:
>  		/* Not supported from Xe_HP onward; use topology queries */

-- 
Jani Nikula, Intel
