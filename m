Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41A4D64DF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 16:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FDB10E955;
	Fri, 11 Mar 2022 15:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2281910E953
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647013580; x=1678549580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=doA5l29ivmzlmpmnci4uIm0OjpcHK8laVi1C3PIPIXs=;
 b=JvUnylJ9VYSBk8/c0GozAz4WFIsEEjhHdAFsSy4A5kk+sWNUm0QXzKZc
 LfkkWM/HzTmfy1SZ0MDTxgnu+BfcI/TMioSq/V723cl+hNKUbJjCiyss8
 wwy5wc5zPaRCrUPRV/y96muv20BiY9PBLSdKPZ3o+kkQQSIdOj7AEQkJM
 g0aq2IrM1C2bPYp3zaN8zrJUApCkTPrZ6/vKQiAXnpZs5JIW1IsnJm6ET
 HKSsSKVWC3mCNgGDg27SBOMnVJt0mPZuFPvbPa4d8d9vIvYLOXH77Jh8S
 Av50nx+Zq37zrMuHGnH5UqdzTRP63npXS51KQSjHu8m26h8UNR64xGrm6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253157943"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="253157943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="597144417"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2022 07:46:17 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nShT6-0006fB-Ks; Fri, 11 Mar 2022 15:46:16 +0000
Date: Fri, 11 Mar 2022 23:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <202203112305.WcEordi2-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org,
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
config: microblaze-randconfig-r011-20220310 (https://download.01.org/0day-ci/archive/20220311/202203112305.WcEordi2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/088aa14c0f5cad378854823fa661ee145dd2c01b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/dma-buf-add-dma_fence_unwrap/20220311-190352
        git checkout 088aa14c0f5cad378854823fa661ee145dd2c01b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/dma-buf/st-dma-fence-unwrap.c:7:
   include/linux/dma-fence-unwrap.h: In function 'dma_fence_unwrap_array':
   include/linux/dma-fence-unwrap.h:44:25: error: implicit declaration of function 'dma_fence_chain_contained'; did you mean 'dma_fence_chain_init'? [-Werror=implicit-function-declaration]
      44 |         cursor->array = dma_fence_chain_contained(cursor->chain);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         dma_fence_chain_init
   include/linux/dma-fence-unwrap.h:44:23: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      44 |         cursor->array = dma_fence_chain_contained(cursor->chain);
         |                       ^
   include/linux/dma-fence-unwrap.h:46:16: error: implicit declaration of function 'dma_fence_array_first'; did you mean 'dma_fence_array_create'? [-Werror=implicit-function-declaration]
      46 |         return dma_fence_array_first(cursor->array);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                dma_fence_array_create
   include/linux/dma-fence-unwrap.h:46:16: warning: returning 'int' from a function with return type 'struct dma_fence *' makes pointer from integer without a cast [-Wint-conversion]
      46 |         return dma_fence_array_first(cursor->array);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-fence-unwrap.h: In function 'dma_fence_unwrap_next':
   include/linux/dma-fence-unwrap.h:77:15: error: implicit declaration of function 'dma_fence_array_next'; did you mean 'dma_fence_unwrap_next'? [-Werror=implicit-function-declaration]
      77 |         tmp = dma_fence_array_next(cursor->array, cursor->index);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               dma_fence_unwrap_next
   include/linux/dma-fence-unwrap.h:77:13: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      77 |         tmp = dma_fence_array_next(cursor->array, cursor->index);
         |             ^
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_array':
>> drivers/dma-buf/st-dma-fence-unwrap.c:133:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     133 |         int err = 0;
         |             ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain':
   drivers/dma-buf/st-dma-fence-unwrap.c:175:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     175 |         int err = 0;
         |             ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain_array':
   drivers/dma-buf/st-dma-fence-unwrap.c:217:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     217 |         int err = 0;
         |             ^~~
   cc1: some warnings being treated as errors


vim +/err +133 drivers/dma-buf/st-dma-fence-unwrap.c

   128	
   129	static int unwrap_array(void *arg)
   130	{
   131		struct dma_fence *fence, *f1, *f2, *array;
   132		struct dma_fence_unwrap iter;
 > 133		int err = 0;
   134	
   135		f1 = mock_fence();
   136		if (!f1)
   137			return -ENOMEM;
   138	
   139		f2 = mock_fence();
   140		if (!f2) {
   141			dma_fence_put(f1);
   142			return -ENOMEM;
   143		}
   144	
   145		array = mock_array(2, f1, f2);
   146		if (!array)
   147			return -ENOMEM;
   148	
   149		dma_fence_unwrap_for_each(fence, &iter, array) {
   150			if (fence == f1) {
   151				f1 = NULL;
   152			} else if (fence == f2) {
   153				f2 = NULL;
   154			} else {
   155				pr_err("Unexpected fence!\n");
   156				err = -EINVAL;
   157			}
   158		}
   159	
   160		if (f1 || f2) {
   161			pr_err("Not all fences seen!\n");
   162			err = -EINVAL;
   163		}
   164	
   165		dma_fence_signal(f1);
   166		dma_fence_signal(f2);
   167		dma_fence_put(array);
   168		return 0;
   169	}
   170	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
