Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471516A86FB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318E810E244;
	Thu,  2 Mar 2023 16:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE83E10E244;
 Thu,  2 Mar 2023 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677775241; x=1709311241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ddpeYcd3jay+u6BOc2MfT/dx3rtowzXoAJkEj3v7qeY=;
 b=PTCcSwn3ghOu5d976NgkmO7LneM6m8t+U+KkAh1HFzyAhy674VqlQnwL
 PLXs5FqexV7IOU7F2K1REI8tCSActvxaeKXhw1I8yL84rYEPx91w1UR4Q
 D9jwPKB63muWqVZALELoX1Xz6PXT8Pv9MOAljK/hRUmGDyo5CgONrLqZz
 Bn7xPnziOTHqOrulSfgzAaeICGuCKIxmm3wAZkhJglO7zzN5Pd0jYNoWW
 8yNeD1NO6hVw60xxnSg6YuYU7zmrkANi7rj6qiAUhzcc0/uiJrLM7e3pJ
 34Pz7cQInEVFvneSsoOBmi7WAoKUaGgK9fkkboT15FaAJyaF+OoflaejH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397362795"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="397362795"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 08:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="798896500"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="798896500"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 08:40:22 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pXlyf-0000fE-0K;
 Thu, 02 Mar 2023 16:40:21 +0000
Date: Fri, 3 Mar 2023 00:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH RESEND] drm/tests: Suballocator test
Message-ID: <202303030056.CNeZGRQR-lkp@intel.com>
References: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-tests-Suballocator-test/20230302-163704
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230302083422.76608-1-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [PATCH RESEND] drm/tests: Suballocator test
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303030056.CNeZGRQR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e970911bccf3145b76cd755e2d78c0c0f7f22ca1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-tests-Suballocator-test/20230302-163704
        git checkout e970911bccf3145b76cd755e2d78c0c0f7f22ca1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030056.CNeZGRQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/gpu/drm/tests/drm_suballoc_test.o: in function `drm_test_suballoc':
>> drm_suballoc_test.c:(.text.drm_test_suballoc+0xcbc): undefined reference to `__udivdi3'
>> mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xd20): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xd84): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xde8): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xe40): undefined reference to `__udivdi3'
   mips-linux-ld: drivers/gpu/drm/tests/drm_suballoc_test.o:drm_suballoc_test.c:(.text.drm_test_suballoc+0xfb4): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
