Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA2B56A98C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466B211B2C8;
	Thu,  7 Jul 2022 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251FA11ABAE;
 Thu,  7 Jul 2022 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657214758; x=1688750758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MdJwEM9SKez18tnwXLE6OCtQENFxNIaTyAbVi0K5JJc=;
 b=DzLEQzvPy8UG3ohZK9HiF9lGQoijDleukigsbZr4wjJbQWiAzKnqQRY7
 WwAhor4aLCY90PzM+uZ+ed9tAnmPrmDcD1SRLaNQo2So54++t3RFR5Q41
 47RcuGle6Z9iiIJ497LT2aatyrNlrIrg6YusTFsfdr+g40DYn6liOoekr
 esZbvBwY2CledQlwbAOHZV0SZQL6Q1lLdWe9X/T+4rCjLMsHnowLeZ5Mp
 WUosGTuQGlXYqgfp5khGpLp0AfBTGkeEkzXCWXzzoLZlXRWTHKI7T4GwW
 z/yPv5dtPaVQ8Htik/X8Yjk2DGvs48pTWSVfkQyVhjkf4AHTPCVnBM2PF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264494802"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="264494802"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 10:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="543899076"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 07 Jul 2022 10:25:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9VGE-000MGY-3c;
 Thu, 07 Jul 2022 17:25:54 +0000
Date: Fri, 8 Jul 2022 01:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/ttm: rename and cleanup
 ttm_bo_init_reserved
Message-ID: <202207080122.B4DLOdD2-lkp@intel.com>
References: <20220707102453.3633-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707102453.3633-2-christian.koenig@amd.com>
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

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-rename-and-cleanup-ttm_bo_init_reserved/20220707-192538
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220708/202207080122.B4DLOdD2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/607b24f78509a1fb0e55c8f9f610113bb0421706
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-ttm-rename-and-cleanup-ttm_bo_init_reserved/20220707-192538
        git checkout 607b24f78509a1fb0e55c8f9f610113bb0421706
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ttm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_bo.c:99: warning: Function parameter or member 'bulk' not described in 'ttm_bo_set_bulk_move'
>> drivers/gpu/drm/ttm/ttm_bo.c:962: warning: expecting prototype for ttm_bo_init_validate(). Prototype was for ttm_bo_init_reserved() instead


vim +962 drivers/gpu/drm/ttm/ttm_bo.c

ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   923  
607b24f78509a1f Christian König   2022-07-07   924  /**
607b24f78509a1f Christian König   2022-07-07   925   * ttm_bo_init_validate
607b24f78509a1f Christian König   2022-07-07   926   *
607b24f78509a1f Christian König   2022-07-07   927   * @bdev: Pointer to a ttm_device struct.
607b24f78509a1f Christian König   2022-07-07   928   * @bo: Pointer to a ttm_buffer_object to be initialized.
607b24f78509a1f Christian König   2022-07-07   929   * @type: Requested type of buffer object.
607b24f78509a1f Christian König   2022-07-07   930   * @placement: Initial placement for buffer object.
607b24f78509a1f Christian König   2022-07-07   931   * @alignment: Data alignment in pages.
607b24f78509a1f Christian König   2022-07-07   932   * @ctx: TTM operation context for memory allocation.
607b24f78509a1f Christian König   2022-07-07   933   * @sg: Scatter-gather table.
607b24f78509a1f Christian König   2022-07-07   934   * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
607b24f78509a1f Christian König   2022-07-07   935   * @destroy: Destroy function. Use NULL for kfree().
607b24f78509a1f Christian König   2022-07-07   936   *
607b24f78509a1f Christian König   2022-07-07   937   * This function initializes a pre-allocated struct ttm_buffer_object.
607b24f78509a1f Christian König   2022-07-07   938   * As this object may be part of a larger structure, this function,
607b24f78509a1f Christian König   2022-07-07   939   * together with the @destroy function, enables driver-specific objects
607b24f78509a1f Christian König   2022-07-07   940   * derived from a ttm_buffer_object.
607b24f78509a1f Christian König   2022-07-07   941   *
607b24f78509a1f Christian König   2022-07-07   942   * On successful return, the caller owns an object kref to @bo. The kref and
607b24f78509a1f Christian König   2022-07-07   943   * list_kref are usually set to 1, but note that in some situations, other
607b24f78509a1f Christian König   2022-07-07   944   * tasks may already be holding references to @bo as well.
607b24f78509a1f Christian König   2022-07-07   945   * Furthermore, if resv == NULL, the buffer's reservation lock will be held,
607b24f78509a1f Christian König   2022-07-07   946   * and it is the caller's responsibility to call ttm_bo_unreserve.
607b24f78509a1f Christian König   2022-07-07   947   *
607b24f78509a1f Christian König   2022-07-07   948   * If a failure occurs, the function will call the @destroy function. Thus,
607b24f78509a1f Christian König   2022-07-07   949   * after a failure, dereferencing @bo is illegal and will likely cause memory
607b24f78509a1f Christian König   2022-07-07   950   * corruption.
607b24f78509a1f Christian König   2022-07-07   951   *
607b24f78509a1f Christian König   2022-07-07   952   * Returns
607b24f78509a1f Christian König   2022-07-07   953   * -ENOMEM: Out of memory.
607b24f78509a1f Christian König   2022-07-07   954   * -EINVAL: Invalid placement flags.
607b24f78509a1f Christian König   2022-07-07   955   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
607b24f78509a1f Christian König   2022-07-07   956   */
607b24f78509a1f Christian König   2022-07-07   957  int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
607b24f78509a1f Christian König   2022-07-07   958  			 enum ttm_bo_type type, struct ttm_placement *placement,
607b24f78509a1f Christian König   2022-07-07   959  			 uint32_t alignment, struct ttm_operation_ctx *ctx,
607b24f78509a1f Christian König   2022-07-07   960  			 struct sg_table *sg, struct dma_resv *resv,
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   961  			 void (*destroy) (struct ttm_buffer_object *))
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  @962  {
d79025c7f5e3764 Christian König   2021-02-16   963  	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
bfa3357ef9abc9d Christian König   2021-04-15   964  	int ret;
57de4ba959b290f Jerome Glisse     2011-11-11   965  
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   966  	kref_init(&bo->kref);
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   967  	INIT_LIST_HEAD(&bo->ddestroy);
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   968  	bo->bdev = bdev;
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   969  	bo->type = type;
607b24f78509a1f Christian König   2022-07-07   970  	bo->page_alignment = alignment;
607b24f78509a1f Christian König   2022-07-07   971  	bo->destroy = destroy;
deb0814b43f370a Christian König   2020-09-21   972  	bo->pin_count = 0;
129b78bfca591e7 Dave Airlie       2012-04-02   973  	bo->sg = sg;
fee2ede155423b0 Christian König   2022-01-24   974  	bo->bulk_move = NULL;
607b24f78509a1f Christian König   2022-07-07   975  	if (resv)
2e3c9ec4d151c04 Gerd Hoffmann     2019-08-05   976  		bo->base.resv = resv;
607b24f78509a1f Christian König   2022-07-07   977  	else
2e3c9ec4d151c04 Gerd Hoffmann     2019-08-05   978  		bo->base.resv = &bo->base._resv;
8af8a109b34fa88 Christian König   2020-10-01   979  	atomic_inc(&ttm_glob.bo_count);
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   980  
bfa3357ef9abc9d Christian König   2021-04-15   981  	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
bfa3357ef9abc9d Christian König   2021-04-15   982  	if (unlikely(ret)) {
bfa3357ef9abc9d Christian König   2021-04-15   983  		ttm_bo_put(bo);
bfa3357ef9abc9d Christian König   2021-04-15   984  		return ret;
bfa3357ef9abc9d Christian König   2021-04-15   985  	}
bfa3357ef9abc9d Christian König   2021-04-15   986  
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   987  	/*
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   988  	 * For ttm_bo_type_device buffers, allocate
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   989  	 * address space from the device.
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   990  	 */
607b24f78509a1f Christian König   2022-07-07   991  	if (bo->type == ttm_bo_type_device || bo->type == ttm_bo_type_sg) {
9d6f4484e81c000 Gerd Hoffmann     2019-09-05   992  		ret = drm_vma_offset_add(bdev->vma_manager, &bo->base.vma_node,
607b24f78509a1f Christian König   2022-07-07   993  					 PFN_UP(bo->base.size));
607b24f78509a1f Christian König   2022-07-07   994  		if (ret)
607b24f78509a1f Christian König   2022-07-07   995  			goto err_put;
607b24f78509a1f Christian König   2022-07-07   996  	}
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10   997  
f4f4e3e3e9f3bde Maarten Lankhorst 2014-01-09   998  	/* passed reservation objects should already be locked,
f4f4e3e3e9f3bde Maarten Lankhorst 2014-01-09   999  	 * since otherwise lockdep will be angered in radeon.
f4f4e3e3e9f3bde Maarten Lankhorst 2014-01-09  1000  	 */
607b24f78509a1f Christian König   2022-07-07  1001  	if (!resv)
607b24f78509a1f Christian König   2022-07-07  1002  		WARN_ON(!dma_resv_trylock(bo->base.resv));
607b24f78509a1f Christian König   2022-07-07  1003  	else
607b24f78509a1f Christian König   2022-07-07  1004  		dma_resv_assert_held(resv);
5e338405119a80a Maarten Lankhorst 2013-06-27  1005  
6fead44a4c5897c Christian König   2017-04-12  1006  	ret = ttm_bo_validate(bo, placement, ctx);
607b24f78509a1f Christian König   2022-07-07  1007  	if (unlikely(ret))
607b24f78509a1f Christian König   2022-07-07  1008  		goto err_unlock;
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  1009  
607b24f78509a1f Christian König   2022-07-07  1010  	return 0;
607b24f78509a1f Christian König   2022-07-07  1011  
607b24f78509a1f Christian König   2022-07-07  1012  err_unlock:
c2c139cf435b189 Nicolai Hähnle    2017-02-14  1013  	if (!resv)
607b24f78509a1f Christian König   2022-07-07  1014  		dma_resv_unlock(bo->base.resv);
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  1015  
607b24f78509a1f Christian König   2022-07-07  1016  err_put:
f44907593d746d4 Thomas Zimmermann 2018-06-21  1017  	ttm_bo_put(bo);
c2c139cf435b189 Nicolai Hähnle    2017-02-14  1018  	return ret;
c2c139cf435b189 Nicolai Hähnle    2017-02-14  1019  }
ca9cf68de1e7429 Nicolai Hähnle    2017-02-16  1020  EXPORT_SYMBOL(ttm_bo_init_reserved);
ca9cf68de1e7429 Nicolai Hähnle    2017-02-16  1021  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
