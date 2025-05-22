Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E81AC1339
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313610E0F1;
	Thu, 22 May 2025 18:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR0GcOin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170E410E9EC;
 Thu, 22 May 2025 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747938198; x=1779474198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IPz6iHro3xzs3U8WhYMAIESZje4l1V6nQ/pXxbjhE/Y=;
 b=mR0GcOinnZHkCEBs6nyufF7iFiNC038p+FV1sLRf8cfsBjwLkHuKEtgQ
 yPju1bluY2kEFrDE8MMFFUPvj3iyErZwoPCJSEN6JUCEN+3mKvpoj/wKh
 YV0Dm3lDf2ihwJNoM/oowW2rYe+QrglPI7+OXxD4gBOs54xAVd9zjNyw9
 Wxt6+Wdcd9A2SpJfdBHG2ioLvtN25n/NjEetoqu6ef84PkSbg4QKtSAr1
 jYRP/U0XVwdRt80KLPJX5buIYo5T6Cx7dzfsRpsffZ8gTLvVvfhWoTzY6
 dv+PQsb13G8dkbxH/G6gNNxae/qh/ZrRebJ9U4rBMq+XRYb3sz5/w4mA3 Q==;
X-CSE-ConnectionGUID: HcQnUXUSRkyqkQtgZI1piA==
X-CSE-MsgGUID: NhmjQ8kLSeGGC+cqybV/jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72510105"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="72510105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 11:23:17 -0700
X-CSE-ConnectionGUID: 7fYqMXkFRhyO9qBsjd8dIA==
X-CSE-MsgGUID: qgZNGhYgT9ukTIZ8jCM+Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141247235"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 22 May 2025 11:23:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIAZU-000PbE-0a;
 Thu, 22 May 2025 18:23:12 +0000
Date: Fri, 23 May 2025 02:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 03/10] drm/i915/display: Add strength and winsize register
Message-ID: <202505230242.YWyBlwSE-lkp@intel.com>
References: <20250519122644.3685679-4-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519122644.3685679-4-nemesa.garg@intel.com>
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

Hi Nemesa,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20250522]
[cannot apply to linus/master drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Introduce-sharpness-strength-property/20250519-203316
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250519122644.3685679-4-nemesa.garg%40intel.com
patch subject: [PATCH 03/10] drm/i915/display: Add strength and winsize register
config: i386-randconfig-004-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230242.YWyBlwSE-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230242.YWyBlwSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230242.YWyBlwSE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_casf.c:52:19: error: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      52 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_casf.c:54:24: error: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      54 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +52 drivers/gpu/drm/i915/display/intel_casf.c

    46	
    47	static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
    48	{
    49		const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
    50		u16 total_pixels = mode->hdisplay * mode->vdisplay;
    51	
  > 52		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
    53			crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
    54		else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
    55			crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
    56		else
    57			crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
