Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E905E6BDC28
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063CE10E37B;
	Thu, 16 Mar 2023 22:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331810E363;
 Thu, 16 Mar 2023 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679007540; x=1710543540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FanJKZdvfkPE2HVNsz96lwgK9439sk6zYuCINzSOkVc=;
 b=IWPQr2RKB8ITyXP+MQxJFBrgun+8ppJZYg1VxseXHSWuUaRKN+yw9ab9
 vUu3h3WDX8VnFgCgG0Q9qpifd4ZcuudQburvE6NiwLzh0IINk6oRXeytg
 rvH69J8wKyklkv/NAElPnED/lqRlZi9q4n+4GQJQX+/W6XbelnbTFaFfO
 k7gUnM3V0i09FFwrZdBXP0P6IOZJ8zHlUymu4kRiM2eKo0nna55VsnF+Q
 QINVbNfTxNs2hx7JUlOQrN36N1kKxDNwI+ZUqcpSdWTne797H2+uT7+f7
 7IA0dXhSys97MLfKRz5CXwx2vZujRFVyAWxYC3Vu4bDrpyeiuOaQi06Xy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424402688"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="424402688"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 15:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854233469"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="854233469"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2023 15:58:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pcwYX-0008sU-2i;
 Thu, 16 Mar 2023 22:58:45 +0000
Date: Fri, 17 Mar 2023 06:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, stanislaw.gruszka@linux.intel.com,
 ogabbay@kernel.org, quic_jhugo@quicinc.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/tegra: allow compile test on !ARM
Message-ID: <202303170635.A2RsQ1Wu-lkp@intel.com>
References: <20230316082035.567520-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316082035.567520-3-christian.koenig@amd.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230316082035.567520-3-christian.koenig%40amd.com
patch subject: [Intel-gfx] [PATCH 2/7] drm/tegra: allow compile test on !ARM
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303170635.A2RsQ1Wu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8a2dbd34b0290b78a1ac2252d451abbcbcd50666
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
        git checkout 8a2dbd34b0290b78a1ac2252d451abbcbcd50666
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tegra/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170635.A2RsQ1Wu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_mmap':
>> drivers/gpu/drm/tegra/gem.c:188:24: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     188 |                 return vmap(obj->pages, obj->num_pages, VM_MAP,
         |                        ^~~~
         |                        kmap
>> drivers/gpu/drm/tegra/gem.c:188:57: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     188 |                 return vmap(obj->pages, obj->num_pages, VM_MAP,
         |                                                         ^~~~~~
         |                                                         VM_MTE
   drivers/gpu/drm/tegra/gem.c:188:57: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_munmap':
>> drivers/gpu/drm/tegra/gem.c:203:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     203 |                 vunmap(addr);
         |                 ^~~~~~
         |                 kunmap
   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_mmap':
   drivers/gpu/drm/tegra/gem.c:191:1: error: control reaches end of non-void function [-Werror=return-type]
     191 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_probe':
>> drivers/gpu/drm/tegra/fb.c:276:29: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                             ^~~~
         |                             kmap
>> drivers/gpu/drm/tegra/fb.c:276:60: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                                                            ^~~~~~
         |                                                            VM_MTE
   drivers/gpu/drm/tegra/fb.c:276:60: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_exit':
>> drivers/gpu/drm/tegra/fb.c:359:25: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     359 |                         vunmap(bo->vaddr);
         |                         ^~~~~~
         |                         kunmap
   cc1: some warnings being treated as errors


vim +188 drivers/gpu/drm/tegra/gem.c

de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  175  
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  176  static void *tegra_bo_mmap(struct host1x_bo *bo)
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  177  {
3be8274341499cf drivers/gpu/host1x/drm/gem.c Thierry Reding    2013-09-24  178  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
7938f4218168ae9 drivers/gpu/drm/tegra/gem.c  Lucas De Marchi   2022-02-04  179  	struct iosys_map map;
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  180  	int ret;
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  181  
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  182  	if (obj->vaddr) {
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  183  		return obj->vaddr;
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  184  	} else if (obj->gem.import_attach) {
f66d48c8cc8d996 drivers/gpu/drm/tegra/gem.c  Dmitry Osipenko   2022-10-17  185  		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  186  		return ret ? NULL : map.vaddr;
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  187  	} else {
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08 @188  		return vmap(obj->pages, obj->num_pages, VM_MAP,
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  189  			    pgprot_writecombine(PAGE_KERNEL));
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  190  	}
6619ccf1bb1d0eb drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  191  }
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  192  
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  193  static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  194  {
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  195  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
7938f4218168ae9 drivers/gpu/drm/tegra/gem.c  Lucas De Marchi   2022-02-04  196  	struct iosys_map map = IOSYS_MAP_INIT_VADDR(addr);
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  197  
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  198  	if (obj->vaddr)
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  199  		return;
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  200  	else if (obj->gem.import_attach)
f66d48c8cc8d996 drivers/gpu/drm/tegra/gem.c  Dmitry Osipenko   2022-10-17  201  		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  202  	else
7ecada3cc44798c drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08 @203  		vunmap(addr);
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  204  }
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
