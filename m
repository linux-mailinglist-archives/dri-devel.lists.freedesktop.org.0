Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCA478B31
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 13:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9510EBEB;
	Fri, 17 Dec 2021 12:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C310EBEB;
 Fri, 17 Dec 2021 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639743315; x=1671279315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WaZLnIsliWvdIOqFBG7CzikYKTfNgwGDsX9roA6gPyA=;
 b=bn261p8QEY+QurzUjlC042t4ZguFNDJtlQDm8G1pjdK6d48QbuQpEoeb
 NdBWCbTe0soon+ezwlEp7/WDaKntUVxOsyjFQw42UXAoavGPXs5yBkHxH
 nGfP4IbWziqBdO0lQNiTm2FxtVlMU6fmxVS2m00UGv2Hiv/6yYV0To7LR
 2Ex0xDevcYTJeVsxPwdunQLH3E3Q+1mpD47mLYP5o+fVEd06ToKfWhzDm
 fiEbVtWLw40odNb+z7evlVD8SZGpaG/yJvfCX8TnoV2CyTKKS3E9m86pI
 jmtC3j8ctJkqJ+Eunv9kpscPoC01yxi2opfZcy8MpbCNlhcfVbsOuM6cC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227029441"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="227029441"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 04:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="506744738"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 04:15:12 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myC8l-0004iQ-G2; Fri, 17 Dec 2021 12:15:11 +0000
Date: Fri, 17 Dec 2021 20:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/i915: Use vma resources for async
 unbinding
Message-ID: <202112172015.HCePn2cg-lkp@intel.com>
References: <20211217091929.105781-7-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217091929.105781-7-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 llvm@lists.linux.dev, kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20211216]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211217-172108
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-r021-20211216 (https://download.01.org/0day-ci/archive/20211217/202112172015.HCePn2cg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/45f1249183a30dea38defee195b33c7f6753d9f9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211217-172108
        git checkout 45f1249183a30dea38defee195b33c7f6753d9f9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma_resource.c:379:39: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
           pr_err("vma resource size is %lu\n", sizeof(struct i915_vma_resource));
                                        ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                        %u
   include/linux/printk.h:493:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +379 drivers/gpu/drm/i915/i915_vma_resource.c

   376	
   377	int __init i915_vma_resource_module_init(void)
   378	{
 > 379		pr_err("vma resource size is %lu\n", sizeof(struct i915_vma_resource));

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
