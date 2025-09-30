Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78277BAAF39
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 04:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CACD10E263;
	Tue, 30 Sep 2025 02:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3iCXDkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477110E03E;
 Tue, 30 Sep 2025 02:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759198123; x=1790734123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QLcP8VioUUVE468697aTbUKcfrRDxRDEldaMyrFQrsw=;
 b=K3iCXDkROR1nwcDPJ/kgB2pbX/e2TAK8Bas7njhMAnzr+3IBcBHWdRX1
 gsE2bhJ190hv6ZhN9LCY1S8CvnglKqSWUeKm76AU79XWCNb5jHllT65Uj
 XtsDJAQZwLC13IitWyEdj4xLgY3F+wV26ZmMvpUxAwrUckgLTyZLLLao/
 VVOnIiznR+o+ZFK3KdnMdpIw577GGhXJBB9+Hpz3W24J6je2S8+FWrrcg
 9J/udugTpyf0etvt3aV38dGy0P+DN6VueQzzs6WKjdhx2PZFHEy0NcpnF
 2WEowIPWArKJ79WL4Ln/m+/eV1gG0RYxG17bVa9HczP1whdtoCoAjlDo0 Q==;
X-CSE-ConnectionGUID: C749Cmh0Rv66JKWhy1Yk3Q==
X-CSE-MsgGUID: jhlMNVtNT26WhaUl3yRfkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72063913"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="72063913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 19:08:41 -0700
X-CSE-ConnectionGUID: gRB5QKrVQEi5uUCj3oml3Q==
X-CSE-MsgGUID: /m3pSyIfSVWfun+PqsZzQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="209339801"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2025 19:08:40 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3PnC-0000pD-0f;
 Tue, 30 Sep 2025 02:08:38 +0000
Date: Tue, 30 Sep 2025 10:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Introduce the usage of drm_ras with
 supported HW errors
Message-ID: <202509300919.eiP7GKSP-lkp@intel.com>
References: <20250929214415.326414-6-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929214415.326414-6-rodrigo.vivi@intel.com>
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

Hi Rodrigo,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-misc/drm-misc-next drm-tip/drm-tip next-20250929]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20250930-054726
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250929214415.326414-6-rodrigo.vivi%40intel.com
patch subject: [PATCH 2/2] drm/xe: Introduce the usage of drm_ras with supported HW errors
config: parisc-randconfig-002-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300919.eiP7GKSP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300919.eiP7GKSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300919.eiP7GKSP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_hw_error.c:8:
>> include/linux/find.h:6:2: error: #error only <linux/bitmap.h> can be included directly
       6 | #error only <linux/bitmap.h> can be included directly
         |  ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:64:2: note: in expansion of macro 'ERR_INFO'
      64 |  ERR_INFO(XE_GT_ERROR, "GT Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:64:2: note: in expansion of macro 'ERR_INFO'
      64 |  ERR_INFO(XE_GT_ERROR, "GT Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:65:2: note: in expansion of macro 'ERR_INFO'
      65 |  ERR_INFO(XE_SGGI_DATA_PARITY_ERROR, "SGGI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:65:2: note: in expansion of macro 'ERR_INFO'
      65 |  ERR_INFO(XE_SGGI_DATA_PARITY_ERROR, "SGGI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:66:2: note: in expansion of macro 'ERR_INFO'
      66 |  ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:66:2: note: in expansion of macro 'ERR_INFO'
      66 |  ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:67:2: note: in expansion of macro 'ERR_INFO'
      67 |  ERR_INFO(XE_SGDI_DATA_PARITY_ERROR, "SGDI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:67:2: note: in expansion of macro 'ERR_INFO'
      67 |  ERR_INFO(XE_SGDI_DATA_PARITY_ERROR, "SGDI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:68:2: note: in expansion of macro 'ERR_INFO'
      68 |  ERR_INFO(XE_GSC_ERROR, "GSC Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:68:2: note: in expansion of macro 'ERR_INFO'
      68 |  ERR_INFO(XE_GSC_ERROR, "GSC Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:69:2: note: in expansion of macro 'ERR_INFO'
      69 |  ERR_INFO(XE_SGLI_DATA_PARITY_ERROR, "SGLI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:69:2: note: in expansion of macro 'ERR_INFO'
      69 |  ERR_INFO(XE_SGLI_DATA_PARITY_ERROR, "SGLI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:70:2: note: in expansion of macro 'ERR_INFO'
      70 |  ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:70:2: note: in expansion of macro 'ERR_INFO'
      70 |  ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:71:2: note: in expansion of macro 'ERR_INFO'
      71 |  ERR_INFO(XE_SGCI_DATA_PARITY_ERROR, "SGCI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:71:2: note: in expansion of macro 'ERR_INFO'
      71 |  ERR_INFO(XE_SGCI_DATA_PARITY_ERROR, "SGCI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }


vim +6 include/linux/find.h

47d8c15615c0a2 Yury Norov 2021-08-14  4  
47d8c15615c0a2 Yury Norov 2021-08-14  5  #ifndef __LINUX_BITMAP_H
47d8c15615c0a2 Yury Norov 2021-08-14 @6  #error only <linux/bitmap.h> can be included directly
47d8c15615c0a2 Yury Norov 2021-08-14  7  #endif
47d8c15615c0a2 Yury Norov 2021-08-14  8  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
