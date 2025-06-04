Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8DACE606
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 23:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4F210E80C;
	Wed,  4 Jun 2025 21:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQWn6HVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D7610E803;
 Wed,  4 Jun 2025 21:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749071258; x=1780607258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+aP6EC+eEY6gI1jwkX7gm1sYMGLTGh0R2J82KxeSTFA=;
 b=iQWn6HVjHeQ8XVGTty6Vz3qOFZDZ6irw3zozfgrwNjFPqs9kdJnX9wRn
 GFPh8iPyy2n8B0so8F5ZPY/02l56cjZhWWOGW9yxiGjYHyYA7CzfsKn9U
 liOpcNdJPD8Vxgopaqnr8Mpik+Z5Fu+G6Fx4guYR/VLyWHAbaemJCAMwA
 WbmKKGXslmBoComEJK3YWZ+Bl9hwWPZoRtFlvpq+I/7/OHVViwpQ7VkuE
 sV2/kevtBAu1o/B67HcLGT7jJzSHXrERZUdY9o61932BSFBVd5zv/VQtN
 9JP1KhbCwJokDPVXLqBamJKpSDERNzO79Cwgp7C9nITxjlfP4lThkpkcl A==;
X-CSE-ConnectionGUID: 4ixN9OheT463NzzgpXZ/Kw==
X-CSE-MsgGUID: ZGeCLqVsQLSXq69tSAtZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="76570950"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="76570950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:07:38 -0700
X-CSE-ConnectionGUID: wCp201vdQNiWO75VYWMwbQ==
X-CSE-MsgGUID: ltuljgd3Q3qquYusvlTWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145895723"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 14:07:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uMvKe-0003TR-0N;
 Wed, 04 Jun 2025 21:07:32 +0000
Date: Thu, 5 Jun 2025 05:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/pagemap: Add a populate_mm op
Message-ID: <202506050405.9sHdzAlO-lkp@intel.com>
References: <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604093536.95982-3-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250604]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-gpusvm-drm-pagemap-Move-migration-functionality-to-drm_pagemap/20250604-173757
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250604093536.95982-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 2/3] drm/pagemap: Add a populate_mm op
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250605/202506050405.9sHdzAlO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050405.9sHdzAlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050405.9sHdzAlO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_pagemap.c:315: warning: Function parameter or struct member 'timeslice_ms' not described in 'drm_pagemap_migrate_to_devmem'
>> drivers/gpu/drm/drm_pagemap.c:833: warning: Function parameter or struct member 'timeslice_ms' not described in 'drm_pagemap_populate_mm'
--
   loongarch64-linux-ld: arch/loongarch/kernel/head.o: relocation R_LARCH_B26 overflow 0xffffffffef55fa70
   arch/loongarch/kernel/head.o: in function `smpboot_entry':
>> (.ref.text+0x160): relocation truncated to fit: R_LARCH_B26 against symbol `start_secondary' defined in .text section in arch/loongarch/kernel/smp.o
   loongarch64-linux-ld: final link failed: bad value


vim +833 drivers/gpu/drm/drm_pagemap.c

   813	
   814	/**
   815	 * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
   816	 * @dpagemap: Pointer to the drm_pagemap managing the device memory
   817	 * @start: Start of the virtual range to populate.
   818	 * @end: End of the virtual range to populate.
   819	 * @mm: Pointer to the virtual address space.
   820	 *
   821	 * Attempt to populate a virtual range with device memory pages,
   822	 * clearing them or migrating data from the existing pages if necessary.
   823	 * The function is best effort only, and implementations may vary
   824	 * in how hard they try to satisfy the request.
   825	 *
   826	 * Return: 0 on success, negative error code on error. If the hardware
   827	 * device was removed / unbound the function will return -ENODEV;
   828	 */
   829	int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
   830				    unsigned long start, unsigned long end,
   831				    struct mm_struct *mm,
   832				    unsigned long timeslice_ms)
 > 833	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
