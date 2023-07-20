Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC375A64D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74010E55F;
	Thu, 20 Jul 2023 06:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D095010E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689834397; x=1721370397;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=g9Bjk+ImggViYijgQA4YSam0gggLDny1/aeRuTXiyx0=;
 b=ZFb5U5F69Y7/aZ9UWrgYpsH8nbWF/ZNdwAnjeP3kDWePSfNadvcu8JCa
 u+c8JIJkiw/TgC6RpZbJuo3d3QeYxsKdQUexqUgIvbVqixfnq2OvHD9CU
 /jHNQZCS2famGdHgcDsf+TNgCSTqCbKt1jqOYWzJ15Z7gWh83k1YXUINs
 P9Rm37xCq7R7I5iGAuC+YE5ahb8WYf3WCO6WoOlOsBSzKxZiTI8bW0rFr
 MW8Pjl5wlgYM5UIqcBq4RgnyD6VE4kG+JEkGP7vnSJuzTn+SAuB0ExKMx
 6HTxMhxMmUwoxYARffb7R3YRHPso0NNCnARbmkxAHuM47c1fHhAIQAnjK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430412035"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430412035"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 23:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="718256630"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="718256630"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 19 Jul 2023 23:26:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMN7O-0005oX-1h;
 Thu, 20 Jul 2023 06:26:30 +0000
Date: Thu, 20 Jul 2023 14:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 2/2] drivers/gpu/drm/drm_debugfs.c:212:28:
 warning: cast from pointer to integer of different size
Message-ID: <202307201445.Dc5d5leO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   4f66feeab173bd73e71028b8c2e1dcea07e32dd5
commit: 4f66feeab173bd73e71028b8c2e1dcea07e32dd5 [2/2] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307201445.Dc5d5leO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201445.Dc5d5leO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201445.Dc5d5leO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_debugfs.c: In function 'drm_debugfs_gpuva_info':
>> drivers/gpu/drm/drm_debugfs.c:212:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     212 |                            (u64)va->gem.obj, va->gem.offset);
         |                            ^


vim +212 drivers/gpu/drm/drm_debugfs.c

   178	
   179	/**
   180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
   181	 * @m: pointer to the &seq_file to write
   182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
   183	 *
   184	 * Dumps the GPU VA mappings of a given DRM GPU VA manager.
   185	 *
   186	 * For each DRM GPU VA space drivers should call this function from their
   187	 * &drm_info_list's show callback.
   188	 *
   189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
   190	 */
   191	int drm_debugfs_gpuva_info(struct seq_file *m,
   192				   struct drm_gpuva_manager *mgr)
   193	{
   194		struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
   195	
   196		if (!mgr->name)
   197			return -ENODEV;
   198	
   199		seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
   200			   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
   201		seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
   202			   kva->va.addr, kva->va.addr + kva->va.range);
   203		seq_puts(m, "\n");
   204		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
   205		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
   206		drm_gpuva_for_each_va(va, mgr) {
   207			if (unlikely(va == kva))
   208				continue;
   209	
   210			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
   211				   va->va.addr, va->va.range, va->va.addr + va->va.range,
 > 212				   (u64)va->gem.obj, va->gem.offset);
   213		}
   214	
   215		return 0;
   216	}
   217	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
