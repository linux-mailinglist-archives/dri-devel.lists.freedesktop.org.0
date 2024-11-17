Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E529D0244
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 08:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D9E10E20E;
	Sun, 17 Nov 2024 07:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hieMX+jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCEA10E202;
 Sun, 17 Nov 2024 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731827591; x=1763363591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+6pi0xIObDperUsi3dpTgjgdsIwz20tURcMA7WHB4XA=;
 b=hieMX+jj9KrTAFaqjlZkZ7ZLtwaSdna6+W8Ll677pPccQmSzDCIv0p2J
 EJdn7S0wVfd8yM90gL/n1Q1NpW5SePXo5C6ha0n70ISpBZ4iJGr47ChmI
 tAJX+PlaTVOyMLvA0bDLErE4//h6qNPLQf1roBXDfdI8sc7eKVCHVXDD8
 vclpQKmqHyAvQ/WkRLMBA/zQtnYXfhrqu1l1HxZtuo/j9aq0D9N8csxAT
 Y2oE1GdQGFK4FVzDL4wrh+SSAXHGZLnyvXmjWtsUxihYcYKHI9dqAv1Ij
 0zKpc6k/FweVjyxdgmC8xwpHGIWYWhma/yh0FoCju27+aCq6FaqevkFVb A==;
X-CSE-ConnectionGUID: 5WV1Frb8RruDPudygw7XlQ==
X-CSE-MsgGUID: ZeI5d+0vQIWpGgegs+Jp2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31638530"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="31638530"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2024 23:13:10 -0800
X-CSE-ConnectionGUID: c+Q90LuaTiGhlOrutJk4Hg==
X-CSE-MsgGUID: Fh4MVNReQK2D/0NCK2enQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="89094163"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 16 Nov 2024 23:13:07 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tCZSx-0001cR-37;
 Sun, 17 Nov 2024 07:13:03 +0000
Date: Sun, 17 Nov 2024 15:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?unknown-8bit?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, 
 kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7] drm/vmwgfx: start to phase out ttm_exec
Message-ID: <202411171454.yXzqqhti-lkp@intel.com>
References: <20241114153020.6209-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114153020.6209-4-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-qxl-switch-to-using-drm_exec-v2/20241115-014610
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241114153020.6209-4-christian.koenig%40amd.com
patch subject: [PATCH 3/7] drm/vmwgfx: start to phase out ttm_exec
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241117/202411171454.yXzqqhti-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171454.yXzqqhti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171454.yXzqqhti-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:521: warning: Function parameter or struct member 'bo' not described in 'vmw_resource_check_buffer'
>> drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:521: warning: Excess function parameter 'val_buf' description in 'vmw_resource_check_buffer'


vim +521 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c

c0951b797e7d0f Thomas Hellstrom  2012-11-20  503  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  504  /**
c0951b797e7d0f Thomas Hellstrom  2012-11-20  505   * vmw_resource_check_buffer - Check whether a backup buffer is needed
c0951b797e7d0f Thomas Hellstrom  2012-11-20  506   *                             for a resource and in that case, allocate
c0951b797e7d0f Thomas Hellstrom  2012-11-20  507   *                             one, reserve and validate it.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  508   *
05436815fdb475 Tom Rix           2022-07-30  509   * @ticket:         The ww acquire context to use, or NULL if trylocking.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  510   * @res:            The resource for which to allocate a backup buffer.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  511   * @interruptible:  Whether any sleeps during allocation should be
c0951b797e7d0f Thomas Hellstrom  2012-11-20  512   *                  performed while interruptible.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  513   * @val_buf:        On successful return contains data about the
c0951b797e7d0f Thomas Hellstrom  2012-11-20  514   *                  reserved and validated backup buffer.
c0951b797e7d0f Thomas Hellstrom  2012-11-20  515   */
ecff665f5e3f1c Maarten Lankhorst 2013-06-27  516  static int
19f976ab01a6bb Thomas Hellstrom  2018-06-19  517  vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
19f976ab01a6bb Thomas Hellstrom  2018-06-19  518  			  struct vmw_resource *res,
c0951b797e7d0f Thomas Hellstrom  2012-11-20  519  			  bool interruptible,
0b48fc98b52ea2 Christian König   2024-11-14  520  			  struct ttm_buffer_object **bo)
c0951b797e7d0f Thomas Hellstrom  2012-11-20 @521  {
19be5570107108 Christian König   2017-04-12  522  	struct ttm_operation_ctx ctx = { true, false };
c0951b797e7d0f Thomas Hellstrom  2012-11-20  523  	struct list_head val_list;
668b206601c5f5 Zack Rusin        2023-01-30  524  	bool guest_memory_dirty = false;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  525  	int ret;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  526  
668b206601c5f5 Zack Rusin        2023-01-30  527  	if (unlikely(!res->guest_memory_bo)) {
c0951b797e7d0f Thomas Hellstrom  2012-11-20  528  		ret = vmw_resource_buf_alloc(res, interruptible);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  529  		if (unlikely(ret != 0))
c0951b797e7d0f Thomas Hellstrom  2012-11-20  530  			return ret;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  531  	}
c0951b797e7d0f Thomas Hellstrom  2012-11-20  532  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  533  	INIT_LIST_HEAD(&val_list);
668b206601c5f5 Zack Rusin        2023-01-30  534  	ttm_bo_get(&res->guest_memory_bo->tbo);
0b48fc98b52ea2 Christian König   2024-11-14  535  
0b48fc98b52ea2 Christian König   2024-11-14  536  	*bo = &res->guest_memory_bo->tbo;
0b48fc98b52ea2 Christian König   2024-11-14  537  	if (ticket)
0b48fc98b52ea2 Christian König   2024-11-14  538  		ww_acquire_init(ticket, &reservation_ww_class);
0b48fc98b52ea2 Christian König   2024-11-14  539  
0b48fc98b52ea2 Christian König   2024-11-14  540  	ret = ttm_bo_reserve(*bo, interruptible, (ticket == NULL), ticket);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  541  	if (unlikely(ret != 0))
c0951b797e7d0f Thomas Hellstrom  2012-11-20  542  		goto out_no_reserve;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  543  
668b206601c5f5 Zack Rusin        2023-01-30  544  	if (res->func->needs_guest_memory && !vmw_resource_mob_attached(res))
c0951b797e7d0f Thomas Hellstrom  2012-11-20  545  		return 0;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  546  
668b206601c5f5 Zack Rusin        2023-01-30  547  	guest_memory_dirty = res->guest_memory_dirty;
668b206601c5f5 Zack Rusin        2023-01-30  548  	vmw_bo_placement_set(res->guest_memory_bo, res->func->domain,
39985eea5a6dd1 Zack Rusin        2023-01-30  549  			     res->func->busy_domain);
668b206601c5f5 Zack Rusin        2023-01-30  550  	ret = ttm_bo_validate(&res->guest_memory_bo->tbo,
668b206601c5f5 Zack Rusin        2023-01-30  551  			      &res->guest_memory_bo->placement,
19be5570107108 Christian König   2017-04-12  552  			      &ctx);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  553  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  554  	if (unlikely(ret != 0))
c0951b797e7d0f Thomas Hellstrom  2012-11-20  555  		goto out_no_validate;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  556  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  557  	return 0;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  558  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  559  out_no_validate:
0b48fc98b52ea2 Christian König   2024-11-14  560  	dma_resv_unlock((*bo)->base.resv);
0b48fc98b52ea2 Christian König   2024-11-14  561  	if (ticket)
0b48fc98b52ea2 Christian König   2024-11-14  562  		ww_acquire_fini(ticket);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  563  out_no_reserve:
0b48fc98b52ea2 Christian König   2024-11-14  564  	ttm_bo_put(*bo);
668b206601c5f5 Zack Rusin        2023-01-30  565  	if (guest_memory_dirty)
91398b413d0366 Zack Rusin        2023-09-28  566  		vmw_user_bo_unref(&res->guest_memory_bo);
c0951b797e7d0f Thomas Hellstrom  2012-11-20  567  
c0951b797e7d0f Thomas Hellstrom  2012-11-20  568  	return ret;
c0951b797e7d0f Thomas Hellstrom  2012-11-20  569  }
c0951b797e7d0f Thomas Hellstrom  2012-11-20  570  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
