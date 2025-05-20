Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094CABD483
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA4610E463;
	Tue, 20 May 2025 10:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJ0W9N3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640B410E454;
 Tue, 20 May 2025 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736674; x=1779272674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=endErVGpQjxta/KTr96xkgpmOkR7qlg7T/hckMIwnjQ=;
 b=CJ0W9N3tIVgTOddE0Vkq94rSbaDfwklsLGMw1xUsGfsOheWQpA6zCaED
 7xrMxceSXYJZcd5OUgzVUKCFD0ZijkvfjoEUA6G1f9h7ps80KZRJy8/kG
 XdMBYJZTzVvXj+JbRfoFYSrjetAxRgVrtR/QU7erm6v9kLqqxuA9HDB4C
 f8iYEdljvlrtVqTZ+i9w+r1x78q2rJ/Ng23JVqMcIn2W4WEG1ek8BtR9i
 16JX7CQ/UOgQHgea7QSgB7Z7+tQ5UaLvXL33ZDyxPYLR2i5+QqcFVz7Ol
 e/ThHNRYpsXWnpNwjoQpjPq/Z+bMQCn2F+D/WsbDZiEaLMu6DSb18PLsG w==;
X-CSE-ConnectionGUID: WZJmxaNiRGKdjcRSa1VlFA==
X-CSE-MsgGUID: Vwh7ycS4Tt+4COSZqfiAIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48916851"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48916851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:24:23 -0700
X-CSE-ConnectionGUID: kxcMZYrZR4W7lCa2oqxpaQ==
X-CSE-MsgGUID: YNq439FoTKqw1inqHa7Qmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139553449"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 03:24:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uHK8x-000MRY-01;
 Tue, 20 May 2025 10:24:19 +0000
Date: Tue, 20 May 2025 18:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 03/10] drm/i915/display: Add strength and winsize register
Message-ID: <202505201824.ifVWlBHl-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20250516]
[cannot apply to linus/master drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Introduce-sharpness-strength-property/20250519-203316
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250519122644.3685679-4-nemesa.garg%40intel.com
patch subject: [PATCH 03/10] drm/i915/display: Add strength and winsize register
config: x86_64-randconfig-161-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201824.ifVWlBHl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201824.ifVWlBHl-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_casf.c:52 intel_casf_compute_win_size() warn: always true condition '(total_pixels <= (1920 * 1080)) => (0-u16max <= 2073600)'

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_casf.c:54 intel_casf_compute_win_size() warn: always true condition '(total_pixels <= (3840 * 2160)) => (0-u16max <= 8294400)'

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
