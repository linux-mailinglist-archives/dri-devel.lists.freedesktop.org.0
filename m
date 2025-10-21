Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA194BF8AD0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 22:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C8F10E340;
	Tue, 21 Oct 2025 20:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xt5KUG6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6E10E340;
 Tue, 21 Oct 2025 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761077676; x=1792613676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4zzryxXIJnp3UT5ralaMXQBJCNZ6O30bAF0+aUqZ3VE=;
 b=Xt5KUG6p9AloyZHc14WEU5Sd14UzIUr70lBG1YukNGytJSQ2R6w4SZrm
 q5idwh5F/H/fBrvQa0kKvedEnYc9SeFs/c/0N50vvki6FjjkJp1jxaywM
 9rWPrkXehBe1jS1aLfpjMGHS8fwoqaWVhua/38w59wkU0csHNSwUlOjmW
 R0gH8xc/EOzjrvOzWQCEXLv9Di/RfNLfp9ISnkR86yDclADAtRDFaTQSd
 rIoBNgi/+eek/Mu/5A281AAKMYc6ux8EnQkogC7QT/OjTQ4wsMk5a9dNa
 32Dv66W1GdyXEUVMQhNkS3IT6nFZOD6+28wN3dsX9PfJCJ79BN5vRfWFo g==;
X-CSE-ConnectionGUID: 1Gcf8B1OSY62NPGdt5sMBA==
X-CSE-MsgGUID: stxCQt/nQjmny7GcXVv/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63119047"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63119047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 13:14:35 -0700
X-CSE-ConnectionGUID: ZHqmMbnmQpWB2sf2t4KijQ==
X-CSE-MsgGUID: rMl9DxJpQkeQLYQr+iXHcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188084569"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 13:14:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBIkT-000BZJ-0V;
 Tue, 21 Oct 2025 20:14:27 +0000
Date: Wed, 22 Oct 2025 04:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, simona.vetter@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/ttm: replace drm_print.h include with a forward
 declaration
Message-ID: <202510220338.7c7JsIXK-lkp@intel.com>
References: <8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.18-rc2 v6.18-rc1 v6.17 v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-mm-replace-drm_print-h-include-with-a-forward-declaration/20251022-003212
base:   next-20251021
patch link:    https://lore.kernel.org/r/8b92271e6b2a50ee6cf4f6dd015123e27be29678.1761063757.git.jani.nikula%40intel.com
patch subject: [PATCH 3/3] drm/ttm: replace drm_print.h include with a forward declaration
config: nios2-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220338.7c7JsIXK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220338.7c7JsIXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220338.7c7JsIXK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:236:20: error: expected declaration specifiers or '...' before string constant
    MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c:237:16: error: expected declaration specifiers or '...' before string constant
    MODULE_LICENSE("GPL and additional rights");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +236 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c

32d618e9463888 Karolina Stolarek 2024-06-12  235  
26149e6fe1e89d Jeff Johnson      2024-06-24 @236  MODULE_DESCRIPTION("KUnit tests for ttm with mock resource managers");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
