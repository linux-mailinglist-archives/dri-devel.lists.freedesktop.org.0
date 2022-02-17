Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BC4BAD8A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3906810E8C0;
	Thu, 17 Feb 2022 23:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C5A10E83D;
 Thu, 17 Feb 2022 23:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645142050; x=1676678050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=92Ff743k9f5xb7UqMnuVpZi3B3e1//FHbyHUAo9IICU=;
 b=JK5svN9Z6vaZn9g+Iv8+yrkvoeHxHomoK6NaGg96iEDxyzWj0RgT9z7x
 X0je9/QsET9zBfdLvb8uvmnkw+aeMukUNeIPEpCSIw+ruNZTzhGd3zHDK
 PdCmdifWudWZ7kYfyUSKCP0Ej4LSdF5LG5JaBp/xUCByNdbSkLPsBRD3l
 pNoV8ibQOBsKs3RgYeBAnZ+7aXUYymn47YMwfPgLJatg1PQn6ONKQxf07
 6Z1mlE4BdQWEelPYSxUcAs0qAsFkvzH3p7KGwApk3wiv762mv2H592yVg
 ioae7ReUdz9MOKaQZsvXDMX4cHHsdWQnkrxXE6btQ4z3CDbQAyH7IFLdm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250761854"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="250761854"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 15:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="775019261"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 15:54:07 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKqb8-0000kq-KC; Thu, 17 Feb 2022 23:54:06 +0000
Date: Fri, 18 Feb 2022 07:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <202202180713.xhySMQW4-lkp@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
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
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220218/202202180713.xhySMQW4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andi-Shyti/Introduce-multitile-support/20220217-224547
        git checkout b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6_residency_ms_show) in archive drivers/built-in.a
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6p_residency_ms_show) in archive drivers/built-in.a
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6pp_residency_ms_show) in archive drivers/built-in.a
   >>> referenced 1 more times

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
