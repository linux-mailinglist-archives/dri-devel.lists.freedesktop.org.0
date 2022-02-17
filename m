Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38D4BAB47
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77510E819;
	Thu, 17 Feb 2022 20:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7C310E849;
 Thu, 17 Feb 2022 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645131116; x=1676667116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RzLJ7qARqo1zEQriDFsSiiW9QNzWwHgLR5CxegsqsYU=;
 b=ddj/Du/kI8/yX3NnzN+ErHLbLm+3XIGv4l6XxRgXGS5bmTzQyKQ8Orsx
 FBs9UABdS35Zmu8na5YAYK6njnfQXnHCAmBxvMq4w/dEml4BpfEq9RSA4
 gBpILo4l+7hlzAPIo/KbazeFHB1n7EHv9kdzx9UR3nnZWstn+87grbEfJ
 u2GAvXj0M8uGc4784heK9Po3MvyeYuScU4VYKETlaOhP3jOsjyvdKIUt9
 JiFwSFBsU9Dj8rj27vYpw+Dsd+hz0R+BUsAQzcjs+UIfvW3Tm79Apfq2N
 DxUSiOL5auMfSxOYBRe9HoryVyjzpUxRyYxFZBKfSnVUz2quJvNIbWasD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231601433"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="231601433"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="774912862"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 12:50:03 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKnj1-0000dT-3e; Thu, 17 Feb 2022 20:50:03 +0000
Date: Fri, 18 Feb 2022 04:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <202202180400.pPkEh3Z4-lkp@intel.com>
References: <20220217144158.21555-6-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217144158.21555-6-andi.shyti@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, kbuild-all@lists.01.org,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andi-Shyti/Introduce-multitile-support/20220217-224547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220218/202202180400.pPkEh3Z4-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andi-Shyti/Introduce-multitile-support/20220217-224547
        git checkout b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o: in function `sysfs_gt_attribute_r_func.isra.0':
>> intel_gt_sysfs_pm.c:(.text+0x1b2): undefined reference to `__divdi3'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
