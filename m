Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53D894DEA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED510FB70;
	Tue,  2 Apr 2024 08:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJITJYSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD910FB70;
 Tue,  2 Apr 2024 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712047757; x=1743583757;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dfoiwse3oa5e6gddCIwtXK3HtQFEaxoSIBUcdnNM9VQ=;
 b=MJITJYSVKFdXgb0gt3rgHfVZ7paQm949ONgMBpabxWfKwAz6SG1WDPhw
 InDpWMoRswoSHsuerhEgIEqaklX3ZXERp1Q2LT+f6vDWbzAWNcJb9fOlI
 L4nOMpJ1KJQfyIniD+m2US9N+u10S02XwqrNBXMS9HB9RmrlAUcHpJrLF
 9VevAAnDryyVeEDMKgNacW+Z2Ao8aL2Wykl4Ws5EWITarZk9YWGwnPA/w
 VhfNYCuf80OMYq8wcDE+1hh1TqdLkgui3CFl5DpQdRZ1+jov3bmCFol7m
 F3DEPDsFj+bOZ5D6sldn3k5DjOogeqS45MJsBzvOJn+9ZqurA6NNJCbxZ Q==;
X-CSE-ConnectionGUID: jV1rZEaCRaW2ALerZkmJOA==
X-CSE-MsgGUID: S2cth9l/T/OXYe+hy4VmoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7044608"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7044608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="49005123"
Received: from zkatz1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.111])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:49:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH 0/4] drm/edid & drm/i915: vendor and product id logging
 improvements
In-Reply-To: <cover.1711015462.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1711015462.git.jani.nikula@intel.com>
Date: Tue, 02 Apr 2024 11:49:00 +0300
Message-ID: <87zfucdu9v.fsf@intel.com>
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

On Thu, 21 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Jani Nikula (4):
>   drm/edid: add drm_edid_get_product_id()
>   drm/edid: add drm_edid_print_product_id()
>   drm/i915/bios: switch to struct drm_edid and struct
>     drm_edid_product_id
>   drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()

Ping for reviews please? This should be helpful in eradicating one class
of drm_edid_raw() uses.

BR,
Jani.


>
>  drivers/gpu/drm/drm_edid.c                | 50 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_bios.c | 49 ++++++++++------------
>  include/drm/drm_edid.h                    | 28 ++++++++++---
>  3 files changed, 94 insertions(+), 33 deletions(-)

-- 
Jani Nikula, Intel
