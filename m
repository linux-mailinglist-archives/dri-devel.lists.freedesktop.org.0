Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7179B5915D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4FE10E491;
	Tue, 16 Sep 2025 08:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kB/igW9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786AB10E491;
 Tue, 16 Sep 2025 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758013021; x=1789549021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pbq7Fg6km+vSK3XhOw3pH9x+c5/40sqmbcoljcAnXqE=;
 b=kB/igW9yr96F3NagS52TwovLs4/P58C0WwIncK76TurNQxYNOU6+VOhz
 BLFBtg2Dz5snsYBULbLh7736OgfLI8+rc0BinmgRJ+EXzxYSheQP1t2HS
 PmX0CiISA1MGNZH/IvqeAmWCq8QccyqYnwsJIvEXk+3dsFQtMvIXevS44
 505u8+GfScRRHT4IWhzSPiY91wEY2P7bi21zQkDPDMxBZNLuz3cwOUjAm
 nM55Q17gt3hytB9PLgUhO7TexrLg0AucSA8mhPNaN4HdTFKob/e2mIWUk
 EJcFAQnh8w/JYVwhuDUWDcEAA/NUWhm0a+RBfRvrQkbSrtWyT3DmL8r9I w==;
X-CSE-ConnectionGUID: JuLRsb4NT7Km13pPvmIpXQ==
X-CSE-MsgGUID: ngrCr6LXRkOVSIaYws8kRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71384398"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="71384398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:57:01 -0700
X-CSE-ConnectionGUID: mphnIQIbSXiE58UfDmyuAg==
X-CSE-MsgGUID: M0xJ0hWdSf+emppOs6vYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179165957"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:56:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Refactoring the code as per review comment
In-Reply-To: <20250916072704.2351591-4-s.sebinraj@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
 <20250916072704.2351591-4-s.sebinraj@intel.com>
Date: Tue, 16 Sep 2025 11:56:55 +0300
Message-ID: <4f495d7ee43a7ddc7ada573f8ab6f69c6e0011f4@intel.com>
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

On Tue, 16 Sep 2025, S Sebinraj <s.sebinraj@intel.com> wrote:
> Moved the trace file header to appropriate path
> "include/drm" and updated the code as per the same.

You're not supposed to address code review in independent patches, but
rather modify the original patches. This is kernel development basics.

BR,
Jani.

>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/drm_gpu_frequency_trace.c              | 2 +-
>  drivers/gpu/drm/xe/xe_gpu_freq_trace.h                 | 2 +-
>  {drivers/gpu => include}/drm/drm_gpu_frequency_trace.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename {drivers/gpu => include}/drm/drm_gpu_frequency_trace.h (96%)
>
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> index b5fa5134226d..e33df068752d 100644
> --- a/drivers/gpu/drm/drm_gpu_frequency_trace.c
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> @@ -9,7 +9,7 @@
>  #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
>  
>  #define CREATE_TRACE_POINTS
> -#include "drm_gpu_frequency_trace.h"
> +#include <drm/drm_gpu_frequency_trace.h>
>  
>  EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> index f188d529ae60..c15d41761296 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GPU_FREQ_TRACE_H_
>  #define _XE_GPU_FREQ_TRACE_H_
>  
> -#include "../drm_gpu_frequency_trace.h"
> +#include <drm/drm_gpu_frequency_trace.h>
>  
>  /* Convert MHz to KHz for tracepoint */
>  #define MHZ_TO_KHZ(freq_mhz)	((freq_mhz) * 1000)
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/include/drm/drm_gpu_frequency_trace.h
> similarity index 96%
> rename from drivers/gpu/drm/drm_gpu_frequency_trace.h
> rename to include/drm/drm_gpu_frequency_trace.h
> index cf6337847b3a..47f32fd295a4 100644
> --- a/drivers/gpu/drm/drm_gpu_frequency_trace.h
> +++ b/include/drm/drm_gpu_frequency_trace.h
> @@ -42,6 +42,6 @@ static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id)
>  
>  #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
>  #undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
> +#define TRACE_INCLUDE_PATH ../../include/drm
>  #include <trace/define_trace.h>
>  #endif

-- 
Jani Nikula, Intel
