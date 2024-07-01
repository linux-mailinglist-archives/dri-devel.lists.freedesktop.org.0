Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4891DDD7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F3210E3B8;
	Mon,  1 Jul 2024 11:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+jOYvLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEB010E3A8;
 Mon,  1 Jul 2024 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719833316; x=1751369316;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ishV9SIgTo+P4uJJnBEbVkSZqU83ln8iKZ0MMjriOFg=;
 b=f+jOYvLzmOR2gacdZAms7Nrz66rahzcO9Rlbr1qlclnjy+Qz7WywyKMB
 v0dston9RxBSXnTYrBvnBB+OkComtuuCdd1tOTWNWacx7fhRwq334zpEg
 9ySke8VNDM86A6wJo4LjiGhIwiuYlcC1DjNG5Un0i+ef5dDkh4V0w8pPP
 8CAqkENpcEBTS28ja8PXHE61kT6ARpiipNIaLstdwCnFAlH5P8rgCOCsL
 g7RsuN3NeBz1UiESTpcp7q4pkCEglD586EZ3D2/thZCbP9DAzjw+yLSwY
 4KfIyTifPKJdZAKal2jEf9PdmncFe5Z1l1KIb4+4Qi/QAjVMycUSVmN9d A==;
X-CSE-ConnectionGUID: HZ5IRzXvSvulrig04++egg==
X-CSE-MsgGUID: d53zfJpIR7K/CsidEgDNXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17171478"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17171478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 04:28:36 -0700
X-CSE-ConnectionGUID: Sa15lhXXQRSnQYWzDFBqkA==
X-CSE-MsgGUID: dWL5Ys1aTyegahbPL50Hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45488151"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 04:28:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/i915: Dump DSC state to dmesg/debugfs
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240628164451.1177612-1-imre.deak@intel.com>
Date: Mon, 01 Jul 2024 14:28:31 +0300
Message-ID: <87sewt9wrk.fsf@intel.com>
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

On Fri, 28 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> This is v2 of [1], renaming the helpers from drm_x16 to fxp_q4 as
> suggested by Jani.
>
> [1] https://lore.kernel.org/all/20240614173911.3743172-1-imre.deak@intel.com
>
> Cc: Jani Nikula <jani.nikula@intel.com>

No detailed review, but on the approach and naming,

Acked-by: Jani Nikula <jani.nikula@intel.com>



>
> Imre Deak (9):
>   drm: Add helpers for q4 fixed point values
>   drm/display/dsc: Add a helper to dump the DSC configuration
>   drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
>   drm/i915: Replace to_bpp_int() with fxp_q4_to_int()
>   drm/i915: Replace to_bpp_int_roundup() with fxp_q4_to_int_roundup()
>   drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
>   drm/i915: Replace BPP_X16_FMT()/ARGS() with FXP_Q4_FMT()/ARGS()
>   drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
>   drm/i915: Remove DSC register dump
>
>  drivers/gpu/drm/display/drm_dp_helper.c       |  5 +-
>  drivers/gpu/drm/display/drm_dsc_helper.c      | 91 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  9 +-
>  drivers/gpu/drm/i915/display/intel_audio.c    |  5 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  5 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
>  .../drm/i915/display/intel_crtc_state_dump.c  |  3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  7 +-
>  .../drm/i915/display/intel_display_debugfs.c  |  4 +
>  .../drm/i915/display/intel_display_types.h    | 23 -----
>  drivers/gpu/drm/i915/display/intel_dp.c       | 51 ++++++-----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 26 +++---
>  drivers/gpu/drm/i915/display/intel_fdi.c      |  6 +-
>  drivers/gpu/drm/i915/display/intel_link_bw.c  |  4 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     | 51 ++++++-----
>  drivers/gpu/drm/i915/display/intel_vdsc.h     |  4 +
>  include/drm/display/drm_dsc_helper.h          |  3 +
>  include/drm/drm_fixed.h                       | 23 +++++
>  18 files changed, 222 insertions(+), 103 deletions(-)

-- 
Jani Nikula, Intel
