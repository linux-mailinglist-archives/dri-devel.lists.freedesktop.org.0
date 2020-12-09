Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810082D47C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 18:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708DB6E1A7;
	Wed,  9 Dec 2020 17:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512A16E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 17:22:35 +0000 (UTC)
IronPort-SDR: FtDDlkKj63Aaw/BxUt0TuIUKU8Vutm8ZXKc7HuPOVyVB8siKeyPQ1xzuE24pUquSRUtbDPFi7U
 86LAlKvbl3HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174258059"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
 d="gz'50?scan'50,208,50";a="174258059"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 09:22:33 -0800
IronPort-SDR: WV7sOilvZDSnt+zn+tVBMwA6QPWZhU4/S4ijEBe9qSdfFLTiq/zMg4k/jlC8qCUv/wcuzCWGbP
 OFTU89YFnlXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
 d="gz'50?scan'50,208,50";a="484083043"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 09 Dec 2020 09:22:31 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kn3Ad-0000Ms-1j; Wed, 09 Dec 2020 17:22:31 +0000
Date: Thu, 10 Dec 2020 01:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: cleanup BO size handling v2
Message-ID: <202012100114.pVkhTQKw-lkp@intel.com>
References: <20201209141000.1794-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209141000.1794-1-christian.koenig@amd.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20201209]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master drm/drm-next v5.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/drm-ttm-cleanup-BO-size-handling-v2/20201209-221144
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a012-20201209 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/d00372c14267d592b785c5d0c72ec167d48ade73
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-ttm-cleanup-BO-size-handling-v2/20201209-221144
        git checkout d00372c14267d592b785c5d0c72ec167d48ade73
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_bo.c: In function 'ttm_bo_mem_space_debug':
>> drivers/gpu/drm/ttm/ttm_bo.c:75:48: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      75 |  drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
         |                                              ~~^
         |                                                |
         |                                                long unsigned int
         |                                              %u
      76 |      bo, bo->mem.num_pages, bo->base.size >> 10,
         |                             ~~~~~~~~~~~~~~~~~~~ 
         |                                           |
         |                                           size_t {aka unsigned int}
   drivers/gpu/drm/ttm/ttm_bo.c:75:54: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      75 |  drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
         |                                                    ~~^
         |                                                      |
         |                                                      long unsigned int
         |                                                    %u
      76 |      bo, bo->mem.num_pages, bo->base.size >> 10,
      77 |      bo->base.size >> 20);
         |      ~~~~~~~~~~~~~~~~~~~                              
         |                    |
         |                    size_t {aka unsigned int}

vim +75 drivers/gpu/drm/ttm/ttm_bo.c

420457acfb3060 Tom St Denis    2018-01-24  67  
fb53f8621a3fab Jerome Glisse   2009-12-09  68  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
fb53f8621a3fab Jerome Glisse   2009-12-09  69  					struct ttm_placement *placement)
fb53f8621a3fab Jerome Glisse   2009-12-09  70  {
0f6be2c09af65a Michel Dänzer   2018-11-30  71  	struct drm_printer p = drm_debug_printer(TTM_PFX);
9de59bc201496f Dave Airlie     2020-08-04  72  	struct ttm_resource_manager *man;
48e07c23cbeba2 Christian König 2020-09-10  73  	int i, mem_type;
fb53f8621a3fab Jerome Glisse   2009-12-09  74  
0f6be2c09af65a Michel Dänzer   2018-11-30 @75  	drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
d00372c14267d5 Christian König 2020-12-09  76  		   bo, bo->mem.num_pages, bo->base.size >> 10,
d00372c14267d5 Christian König 2020-12-09  77  		   bo->base.size >> 20);
fb53f8621a3fab Jerome Glisse   2009-12-09  78  	for (i = 0; i < placement->num_placement; i++) {
48e07c23cbeba2 Christian König 2020-09-10  79  		mem_type = placement->placement[i].mem_type;
0f6be2c09af65a Michel Dänzer   2018-11-30  80  		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
f1217ed09f827e Christian König 2014-08-27  81  			   i, placement->placement[i].flags, mem_type);
9eca33f4a13919 Dave Airlie     2020-08-04  82  		man = ttm_manager_type(bo->bdev, mem_type);
9de59bc201496f Dave Airlie     2020-08-04  83  		ttm_resource_manager_debug(man, &p);
fb53f8621a3fab Jerome Glisse   2009-12-09  84  	}
fb53f8621a3fab Jerome Glisse   2009-12-09  85  }
fb53f8621a3fab Jerome Glisse   2009-12-09  86  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--y0ulUmNC+osPPQO6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--y0ulUmNC+osPPQO6--
