Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0DB8CDC5
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 19:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC80110E2CC;
	Sat, 20 Sep 2025 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghvFS/Sh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AE210E28D;
 Sat, 20 Sep 2025 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758388726; x=1789924726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zACYCvDKSg9NbKn5+8/3Nzd9e4uV+Cia1xFbwQVW02Q=;
 b=ghvFS/Shc9VLneq9R/AsHtnWes9Skdf8uhEmGNvGW7xuruD1pEpXF/cH
 E0XaEnC2qQirvU3MIEJLRyjWooQGyxAZpXmyI7NchLARaDPTDxrI+JXQ6
 N3SQefI6EeEslKHV8Kv8Yn9sVT160ePkxcgintUKXtoqbst7OhO1glBtL
 m6Ig5e9jx+vGCZHemaMXqV5c9LSasKN5n/kSWD/dsTp3ZuxNCv6PHDpn2
 Eo+G8Sb7YKBHViR6kWEaejL+a7QEIHR6p+Pd7pDT531HgSMhKcNp2JpuL
 lY0XFaNy6y4g+dRJyJHEza0HXPnWau7FCgKqPEwHv8mLni5wI/DMwC/4q Q==;
X-CSE-ConnectionGUID: QYQmygVpQX+Og3NNb/Yf5w==
X-CSE-MsgGUID: GxNoKh/NQwC0404sEJB9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="64530090"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; d="scan'208";a="64530090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2025 10:18:46 -0700
X-CSE-ConnectionGUID: wvKUIrDsQ8erWjHUjSCNdg==
X-CSE-MsgGUID: EptLQ0H6SHeft2SE0WZMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; d="scan'208";a="213261025"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7)
 ([10.91.175.65])
 by orviesa001.jf.intel.com with ESMTP; 20 Sep 2025 10:18:43 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1v01EO-000000003Th-26n1;
 Sat, 20 Sep 2025 17:18:40 +0000
Date: Sat, 20 Sep 2025 19:18:02 +0200
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 1/5] drm/dp: Add quirk for Synaptics DSC throughput
 link-bpp limit
Message-ID: <202509201934.m60n3RyN-lkp@intel.com>
References: <20250918211223.209674-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918211223.209674-2-imre.deak@intel.com>
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

Hi Imre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp-Add-quirk-for-Synaptics-DSC-throughput-link-bpp-limit/20250919-052049
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250918211223.209674-2-imre.deak%40intel.com
patch subject: [PATCH 1/5] drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
reproduce: (https://download.01.org/0day-ci/archive/20250920/202509201934.m60n3RyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201934.m60n3RyN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:476: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   WARNING: ./include/drm/display/drm_dp_helper.h:823 Incorrect use of kernel-doc format:          * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT
   WARNING: ./include/drm/display/drm_dp_helper.h:826 Enum value ' */ DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT' not described in enum 'drm_dp_quirk'
>> Documentation/gpu/drm-kms-helpers:266: ./include/drm/display/drm_dp_helper.h:804: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/hdmi.h
   ERROR: Cannot find file ./include/linux/hdmi.h
   WARNING: No kernel-doc for file ./include/linux/hdmi.h
   WARNING: ./include/drm/drm_gpuvm.h:1059 struct member 'map' not described in 'drm_gpuvm_map_req'
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2547: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
