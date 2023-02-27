Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7C6A3D93
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB5910E378;
	Mon, 27 Feb 2023 08:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0178B10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677488201; x=1709024201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lCC+LpArDsElTqLzHDdD4VJ/uyUDDXNb2P7ArOra3VY=;
 b=EaRkcJ5fY5SDJ/bJc3OfDDZP6jDzGDLRDBkcLpNNyITIfXPsGgBOT2LP
 qCSDuMA8oNy2OyMlV/Z1vYGxk2FQ+YCRyzL808OQS5BKUD9bpuv37cH5P
 oSkWgYwCTU/BMRsWQgGWB4RNkAwiwkjiJVnZrVQS8D/z7GcAPfCtKNUvZ
 ARiQ4fB1tsAwm6ob/as9ZOoNA72VrOEYC9+xizypso+pxpfdF3cz6XRvQ
 M/4bIj808N+imzdmVGZ3Fd9NM3NcZoGreODnGzOWakaghYhY8fNgY/5X1
 O1a/gO39BA6DJuNttLUzqHbfGsU5NhqH4E83RQuwuqY0j7Ptd7yELDda9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="420077969"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="420077969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675778849"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="675778849"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 00:56:33 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pWZJA-0004Fj-1k;
 Mon, 27 Feb 2023 08:56:32 +0000
Date: Mon, 27 Feb 2023 16:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 05/10] drm/shmem-helper: Add memory shrinker
Message-ID: <202302271639.sq28B3aR-lkp@intel.com>
References: <20230227060219.904986-6-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227060219.904986-6-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-shmem-helper-Factor-out-pages-alloc-release-from-drm_gem_shmem_get-put_pages/20230227-140619
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230227060219.904986-6-dmitry.osipenko%40collabora.com
patch subject: [PATCH v11 05/10] drm/shmem-helper: Add memory shrinker
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302271639.sq28B3aR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c4d106484ddbebccf4219dacbc2a9975909f4c2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/drm-shmem-helper-Factor-out-pages-alloc-release-from-drm_gem_shmem_get-put_pages/20230227-140619
        git checkout c4d106484ddbebccf4219dacbc2a9975909f4c2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271639.sq28B3aR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_shmem_helper.c:832:18: warning: no previous prototype for 'drm_gem_shmem_get_pages_sgt_locked' [-Wmissing-prototypes]
     832 | struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_shrinker_scan_objects':
   drivers/gpu/drm/drm_gem_shmem_helper.c:1015:47: error: passing argument 3 of 'drm_gem_lru_scan' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1015 |                                   nr_to_scan, &remaining,
         |                                               ^~~~~~~~~~
         |                                               |
         |                                               long unsigned int *
   In file included from include/drm/drm_gem_shmem_helper.h:12,
                    from drivers/gpu/drm/drm_gem_shmem_helper.c:22:
   include/drm/drm_gem.h:490:39: note: expected 'bool (*)(struct drm_gem_object *)' {aka '_Bool (*)(struct drm_gem_object *)'} but argument is of type 'long unsigned int *'
     490 |                                bool (*shrink)(struct drm_gem_object *obj));
         |                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:1014:18: error: too many arguments to function 'drm_gem_lru_scan'
    1014 |         freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
         |                  ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:489:15: note: declared here
     489 | unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
         |               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:1021:63: error: passing argument 3 of 'drm_gem_lru_scan' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1021 |                                           nr_to_scan - freed, &remaining,
         |                                                               ^~~~~~~~~~
         |                                                               |
         |                                                               long unsigned int *
   include/drm/drm_gem.h:490:39: note: expected 'bool (*)(struct drm_gem_object *)' {aka '_Bool (*)(struct drm_gem_object *)'} but argument is of type 'long unsigned int *'
     490 |                                bool (*shrink)(struct drm_gem_object *obj));
         |                                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:1020:26: error: too many arguments to function 'drm_gem_lru_scan'
    1020 |                 freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
         |                          ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:489:15: note: declared here
     489 | unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
         |               ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_gem_shmem_get_pages_sgt_locked +832 drivers/gpu/drm/drm_gem_shmem_helper.c

   831	
 > 832	struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
   833	{
   834		struct drm_gem_object *obj = &shmem->base;
   835		int ret;
   836		struct sg_table *sgt;
   837	
   838		if (shmem->sgt)
   839			return shmem->sgt;
   840	
   841		drm_WARN_ON(obj->dev, obj->import_attach);
   842	
   843		ret = drm_gem_shmem_get_pages(shmem);
   844		if (ret)
   845			return ERR_PTR(ret);
   846	
   847		sgt = drm_gem_shmem_get_sg_table(shmem);
   848		if (IS_ERR(sgt)) {
   849			ret = PTR_ERR(sgt);
   850			goto err_put_pages;
   851		}
   852		/* Map the pages for use by the h/w. */
   853		ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
   854		if (ret)
   855			goto err_free_sgt;
   856	
   857		shmem->sgt = sgt;
   858	
   859		drm_gem_shmem_update_pages_state(shmem);
   860	
   861		return sgt;
   862	
   863	err_free_sgt:
   864		sg_free_table(sgt);
   865		kfree(sgt);
   866	err_put_pages:
   867		drm_gem_shmem_put_pages(shmem);
   868		return ERR_PTR(ret);
   869	}
   870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
