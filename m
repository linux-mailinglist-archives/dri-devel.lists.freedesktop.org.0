Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED74D67A1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9665310E5A7;
	Fri, 11 Mar 2022 17:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7450410E5A7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647019782; x=1678555782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=icNk0QqUK4xYwGy7RzSXOYunnwxl8oLQQKUMhnVt744=;
 b=Li45OcpH/mmWdd7UunfVmSga5NDlZ4pg5cDYZh6pkAoziMaH/gDwHkoH
 5WkJckcTbxveT0QOP3enTyw7qDwuwXvF3hpZ1byIXwlQF2bwAXhzCrChq
 wgf3UDpvYuJCq9mbTAXplHJNklIiDT/Gt3L86eGYN/S3zL/F6K6q5DyTL
 7v3NBQX/i2Izx4r8PCtNmI16RWD7mpubFEcAZN/OpcsbBVgWuG0PharDt
 lRqP8IjbIQ3TpQCNjAX515tY0wsaIxkEJSko7c7tn/60zUdqvx1JRy14q
 5qDzGxtdnXRLa0JOGRXUVzU6ghZzLJIf8UFwMZF+4HeboQ6leQdmYNDZp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="316337525"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="316337525"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 09:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="689120408"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2022 09:29:39 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSj58-0006rD-NW; Fri, 11 Mar 2022 17:29:38 +0000
Date: Sat, 12 Mar 2022 01:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <202203120114.jpyQmShC-lkp@intel.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311110244.1245-1-christian.koenig@amd.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 79b00034e9dcd2b065c1665c8b42f62b6b80a9be
config: hexagon-randconfig-r045-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120114.jpyQmShC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/088aa14c0f5cad378854823fa661ee145dd2c01b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
        git checkout 088aa14c0f5cad378854823fa661ee145dd2c01b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
   include/linux/dma-fence-unwrap.h:44:18: error: implicit declaration of function 'dma_fence_chain_contained' [-Werror,-Wimplicit-function-declaration]
           cursor->array = dma_fence_chain_contained(cursor->chain);
                           ^
   include/linux/dma-fence-unwrap.h:44:18: note: did you mean 'dma_fence_chain_init'?
   include/linux/dma-fence-chain.h:108:6: note: 'dma_fence_chain_init' declared here
   void dma_fence_chain_init(struct dma_fence_chain *chain,
        ^
   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
>> include/linux/dma-fence-unwrap.h:44:16: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           cursor->array = dma_fence_chain_contained(cursor->chain);
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h:46:9: error: implicit declaration of function 'dma_fence_array_first' [-Werror,-Wimplicit-function-declaration]
           return dma_fence_array_first(cursor->array);
                  ^
   include/linux/dma-fence-unwrap.h:46:9: note: did you mean 'dma_fence_array_create'?
   include/linux/dma-fence-array.h:77:25: note: 'dma_fence_array_create' declared here
   struct dma_fence_array *dma_fence_array_create(int num_fences,
                           ^
   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
>> include/linux/dma-fence-unwrap.h:46:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct dma_fence *' [-Wint-conversion]
           return dma_fence_array_first(cursor->array);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h:77:8: error: implicit declaration of function 'dma_fence_array_next' [-Werror,-Wimplicit-function-declaration]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
                 ^
   include/linux/dma-fence-unwrap.h:77:6: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           tmp = dma_fence_array_next(cursor->array, cursor->index);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/st-dma-fence-unwrap.c:133:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   drivers/dma-buf/st-dma-fence-unwrap.c:175:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   drivers/dma-buf/st-dma-fence-unwrap.c:217:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err = 0;
               ^
   6 warnings and 3 errors generated.


vim +44 include/linux/dma-fence-unwrap.h

    33	
    34	/**
    35	 * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
    36	 * @cursor: cursor to initialize
    37	 *
    38	 * Helper function to unwrap dma_fence_array containers, don't touch directly.
    39	 * Use dma_fence_unwrap_first/next instead.
    40	 */
    41	static inline struct dma_fence *
    42	dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
    43	{
  > 44		cursor->array = dma_fence_chain_contained(cursor->chain);
    45		cursor->index = 0;
  > 46		return dma_fence_array_first(cursor->array);
    47	}
    48	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
