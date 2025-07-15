Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18076B05179
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 08:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405710E363;
	Tue, 15 Jul 2025 06:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKnvHPu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A436C10E363
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752559522; x=1784095522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4s0NpdOUBcdw8nBgpKG7viU5jz793opptwLWmA1YS38=;
 b=nKnvHPu9UFL5spTANlv7vjFLevLX0zKtl0vELKc0hQMPlbkaa/Wq5P8E
 1VK+UlE5tf9yFUOHvq6kj/xM0kDSF8gpajXqd8ADmQCpOJM4Zq+QxIJX4
 Oq/Wlumi3aTgBfwu/eUSQdSt3s6uGbgYpkDxn6ACAujy/1FNO1v6UrAlp
 QmpdoGxPZzNW9G0Wy08EE0blAwhWEDYNigAKPReVbPaBFVHRfxf8yiaKu
 YC6IAzYxPQ4LMlPdjtmkMfTKEQBgozgiX3d1PlOJnk4oTpGO3W2huzK6j
 /v7hB/fotH1pNcwoL2c6v1AfLnluKVDtLjpS7IMHIzIcNU/w4sPJHsOn5 Q==;
X-CSE-ConnectionGUID: leoP9N+5TdesKomTeMk4QA==
X-CSE-MsgGUID: PxspNGv4QBuyt/9rHWT4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54473566"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54473566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 23:05:22 -0700
X-CSE-ConnectionGUID: PSlCRGZIQQmcUVw1SqSz1w==
X-CSE-MsgGUID: zTaZorvJTBGg1ZWmckAnoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="156778778"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 23:05:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ubYmy-0009iV-2o;
 Tue, 15 Jul 2025 06:05:16 +0000
Date: Tue, 15 Jul 2025 14:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Yao <richard@scandent.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/panel: ilitek-ili9881c: Add Tianxinwei
 TWX700100S0 support
Message-ID: <202507151301.sFo3NzXA-lkp@intel.com>
References: <20250714191729.2416-4-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714191729.2416-4-richard@scandent.com>
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

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.16-rc6]
[cannot apply to drm-exynos/exynos-drm-next next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Yao/dt-bindings-vendor-prefixes-Add-Tianxinwei-name/20250715-031929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250714191729.2416-4-richard%40scandent.com
patch subject: [PATCH 3/3] drm/panel: ilitek-ili9881c: Add Tianxinwei TWX700100S0 support
config: arm-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151301.sFo3NzXA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151301.sFo3NzXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151301.sFo3NzXA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-ilitek-ili9881c.c:1850:3: error: field designator 'lanes' does not refer to any field in type 'const struct ili9881c_desc'
    1850 |         .lanes = 4,
         |         ~^~~~~~~~~
   1 error generated.


vim +1850 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c

  1844	
  1845	static const struct ili9881c_desc txw700100s0_desc = {
  1846		.init = txw700100s0_init,
  1847		.init_length = ARRAY_SIZE(txw700100s0_init),
  1848		.mode = &txw700100s0_default_mode,
  1849		.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO,
> 1850		.lanes = 4,
  1851	};
  1852	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
