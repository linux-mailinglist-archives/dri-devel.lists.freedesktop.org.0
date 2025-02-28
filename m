Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C9A49598
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98DE10EC43;
	Fri, 28 Feb 2025 09:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5UBlL3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD410EC43;
 Fri, 28 Feb 2025 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735843; x=1772271843;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QID8NpX170ELrC0HaYoORlWMpM5ERhgKyzAxvDirRFg=;
 b=h5UBlL3xCtIUmVVC39pSchLqVNP8EB8dM8ehXcfwRfYdvOe326M43mr9
 w5jGaRifFkzeKhILesgPqk5rtiLY07mCA13nPveIlxCy23IEMU+p/6ZZ8
 OO5VVrHdZOMEr16IudZvavOFVWQk3FZH8l9Q9Y+HU8Lr3+NQj7E7YJlpt
 zWqL7txX/6Zi8ah5QxEjz/oJCGS0lWO9j723RccjpPtXeyawY3La9wMdE
 O+QaApBAACL40WACumr98qI/RpqNEv/K1IuYV7rh3erXo88t+8HKcFOTO
 0TlQx3ATwIFSZG+uHDR1+3FcMCJ0FMeumCxyyr1ksGgr/k6I6UZk2fOBH w==;
X-CSE-ConnectionGUID: kNlmPakoQL6yVU4bFttClg==
X-CSE-MsgGUID: OC48cQIzSTS0t4OjDvWUGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41506355"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41506355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:44:03 -0800
X-CSE-ConnectionGUID: Ix0yo7TMRRqv42n1pvdN9w==
X-CSE-MsgGUID: ITIQt7eoQO+w5IYYjgn2aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121408326"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.24])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:44:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.saarinen@intel.com
Subject: Re: [PATCH v10 1/9] drm/i915/fbc: remove one duplicate forward
 declaration
In-Reply-To: <20250228093802.27091-2-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
 <20250228093802.27091-2-vinod.govindapillai@intel.com>
Date: Fri, 28 Feb 2025 11:43:58 +0200
Message-ID: <878qpq2yld.fsf@intel.com>
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

On Fri, 28 Feb 2025, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> Remove the duplicate "intel_display"declaration from intel_fbc.h
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Mea culpa,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbc.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
> index df20e63d6102..2e1dd7e8a18f 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.h
> @@ -13,7 +13,6 @@ struct intel_atomic_state;
>  struct intel_crtc;
>  struct intel_crtc_state;
>  struct intel_display;
> -struct intel_display;
>  struct intel_fbc;
>  struct intel_plane;
>  struct intel_plane_state;

-- 
Jani Nikula, Intel
