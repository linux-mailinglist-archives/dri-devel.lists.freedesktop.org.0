Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B784C0560
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB79410E24F;
	Tue, 22 Feb 2022 23:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBA310E24F;
 Tue, 22 Feb 2022 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645572730; x=1677108730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pnHkLzQtPiiFEa4hGqqSmZ+Uh+AOGtvt5T/1sNx+pQY=;
 b=GLLJ6LLea/wnfl2RyIo+xvZbk7p8wDMawqwmQlLoDpraNBiym61w89so
 GyaWZgIjKCacLeRreWRkP7L68nVK1g4p4F/KbubuCTXqRJvsWSaxBWqR+
 dYNffFZMZ2YBj1DMI6mLhgkmu3JQJ1/UCe/UX78GRVZOmQy5OKSNTOOkF
 su5vlRIjbld0iTCNP9q2i6DQTxjLxPs2VVwufci4uDFbwn/k25eqRvgVj
 EjRTA56Df2ZGw0k0B11fmtdGMltUPiBBmh3JaybMEqBN2yHXFkcMmNV8s
 1sP063ix3G9n6NapFErX5y/n6hh7yZGZIbL01J3zVKSdl+chm6qw8+SZi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250663018"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="250663018"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 15:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="532438636"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 15:32:07 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMeda-0000jt-SH; Tue, 22 Feb 2022 23:32:06 +0000
Date: Wed, 23 Feb 2022 07:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] drm_cache: Add logic for wbvind_on_all_cpus
Message-ID: <202202230701.l0i1vncs-lkp@intel.com>
References: <20220222172649.331661-2-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222172649.331661-2-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, kbuild-all@lists.01.org,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, michael.cheng@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: openrisc-randconfig-r025-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230701.l0i1vncs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3aaa40c95b16a78c9059a77536de70bb08ce05e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Move-define-wbvind_on_all_cpus/20220223-012853
        git checkout 3aaa40c95b16a78c9059a77536de70bb08ce05e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/gpu/drm/vgem/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_cache.h:37,
                    from drivers/gpu/drm/vgem/vgem_drv.h:33,
                    from drivers/gpu/drm/vgem/vgem_fence.c:28:
>> arch/openrisc/include/asm/smp.h:15: warning: "raw_smp_processor_id" redefined
      15 | #define raw_smp_processor_id()  (current_thread_info()->cpu)
         | 
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:62,
                    from include/linux/vmalloc.h:5,
                    from include/asm-generic/io.h:911,
                    from arch/openrisc/include/asm/io.h:36,
                    from include/linux/io.h:13,
                    from include/linux/iosys-map.h:9,
                    from include/linux/dma-buf.h:16,
                    from drivers/gpu/drm/vgem/vgem_fence.c:23:
   include/linux/smp.h:191: note: this is the location of the previous definition
     191 | #define raw_smp_processor_id()                  0
         | 


vim +/raw_smp_processor_id +15 arch/openrisc/include/asm/smp.h

8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  14  
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11 @15  #define raw_smp_processor_id()	(current_thread_info()->cpu)
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  16  #define hard_smp_processor_id()	mfspr(SPR_COREID)
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  17  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
