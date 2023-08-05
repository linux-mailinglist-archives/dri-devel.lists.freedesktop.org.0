Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79E770FFC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBBE10E1A4;
	Sat,  5 Aug 2023 13:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CEE10E1A4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691243554; x=1722779554;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=BT4EVbm/Xd97Q23srPDkAK2n9Z78c+n/3Cuj4BupOR4=;
 b=QNKKtLTAubBu7KfkmeYlQX5XzK79JIPyq5z5RVUf+x2pon8oQJb2r/NG
 LXQ/bGQzVkDtNXC79t+wFwHlP7o8nqzpYVJzHTMi9gyVp/SY2AEgPaYTS
 /Qn1bKr2iKXEToF+OWj0vuVZ3J5RG4Huc27CMGw7zWIC5q0cIVbnxlzWD
 fwmvpuyg2BMq8VU6SdrCHQWg3ITzWQrkHQnl/kkfjeZWgMKMgGVcVxYSf
 Hk1NU1MY87KUK+Def9gQCUn+5JVld9k+P29Af/zqpgTaukTKd5vq84SNg
 qcDNTR4dGKqVerFIgdLEhh4mAaSjAI1KkF8riehRcYTGwr8Tnllz+rfLw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="350624211"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="350624211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2023 06:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="854124030"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="854124030"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 05 Aug 2023 06:52:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qSHhn-0003Xb-1v;
 Sat, 05 Aug 2023 13:52:31 +0000
Date: Sat, 5 Aug 2023 21:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 7/12]
 drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: error: 'chunk' undeclared
Message-ID: <202308052132.ZChgsQnz-lkp@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   82d750e9d2f5d0594c8f7057ce59127e701af781
commit: 7f2a0b50b2b20308a19602b51c647566c62e144c [7/12] drm/nouveau: fence: separate fence alloc and emit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308052132.ZChgsQnz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308052132.ZChgsQnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308052132.ZChgsQnz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_dmem.c: In function 'nouveau_dmem_migrate_chunk':
>> drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: error: 'chunk' undeclared (first use in this function)
     681 |                 nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
         |                                           ^~~~~
   drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/chunk +681 drivers/gpu/drm/nouveau/nouveau_dmem.c

   664	
   665	static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
   666			struct nouveau_svmm *svmm, struct migrate_vma *args,
   667			dma_addr_t *dma_addrs, u64 *pfns)
   668	{
   669		struct nouveau_fence *fence;
   670		unsigned long addr = args->start, nr_dma = 0, i;
   671	
   672		for (i = 0; addr < args->end; i++) {
   673			args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
   674					args->src[i], dma_addrs + nr_dma, pfns + i);
   675			if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
   676				nr_dma++;
   677			addr += PAGE_SIZE;
   678		}
   679	
   680		if (!nouveau_fence_new(&fence))
 > 681			nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
   682		migrate_vma_pages(args);
   683		nouveau_dmem_fence_done(&fence);
   684		nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
   685	
   686		while (nr_dma--) {
   687			dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
   688					DMA_BIDIRECTIONAL);
   689		}
   690		migrate_vma_finalize(args);
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
