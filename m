Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C916AF92B9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85010EA1D;
	Fri,  4 Jul 2025 12:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAm1Wklo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B0710EA18;
 Fri,  4 Jul 2025 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632522; x=1783168522;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yWfDdZuxP19c25STbPLGzt/GvpHbQ49XXjWq1OiFibs=;
 b=VAm1WklowyZTpebYFsD7ca9H9aIQbXPTyIbywGkYzNL/S4s42AjhYwNk
 KnUjgSIWsNa+M3cWXlNCytKoP2J6o9MoOjy9mpqrkJVzOXMsZk3otg9vx
 CJC0328dSyrvpiYHrVzscoyiZ+JeggfLOlmaVf8dK4796x/W/Mc1blw+K
 aY2NsPCKFEqFzKDxNLmOJsGZRR/Equ/Jwo/oIrIjMgKy03ct7/WxSbhXT
 Ym4OK8vC0iz884ogSFpOWVk1abdOivZcXgML27KBwFusL4rhK6Rjf2UKB
 SC9TCLH6qyokj7hJgUa/IRcPqpTP3/PqJoMyd/hhcedLvr2DAm8RA54q+ w==;
X-CSE-ConnectionGUID: zhfeAMlcRXS2j5SUTVeBXA==
X-CSE-MsgGUID: cgQpR6xzRqyf5cq7v4gCkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56591518"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="56591518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:35:22 -0700
X-CSE-ConnectionGUID: L4/RD0YbR5C5RnFEQ9t6sw==
X-CSE-MsgGUID: srdX4L28RvW+ZP2tRzWKkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155212424"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:35:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 07/24] drm/i915: Add identifiers for intel color blocks
In-Reply-To: <20250702091936.3004854-8-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-8-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:35:13 +0300
Message-ID: <dfb22329c12ef1429cac39fead4ef5a377dbb351@intel.com>
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

On Wed, 02 Jul 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add macros to identify intel color blocks. It will help
> in mapping drm_color_ops to intel color HW blocks
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_limits.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
> index f0fa27e365ab..97c960cc16aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
> @@ -138,4 +138,17 @@ enum hpd_pin {
>  	HPD_NUM_PINS
>  };
>  
> +/*
> + * Intel Color Blocks
> + *
> + */
> +

How does the comment help anything? The name of the struct is
intel_color_block.

> +enum intel_color_block {
> +	CB_PLANE_PRE_CSC_LUT,
> +	CB_PLANE_CSC,
> +	CB_PLANE_POST_CSC_LUT,
> +
> +	I915_MAX_CB

Why I915? This has less and less to do with i915 nowadays. Maybe all of
these should be INTEL_ prefixed?

> +};
> +
>  #endif /* __INTEL_DISPLAY_LIMITS_H__ */

-- 
Jani Nikula, Intel
