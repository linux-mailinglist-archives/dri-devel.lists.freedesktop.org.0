Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7948745A5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 02:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8DD113664;
	Thu,  7 Mar 2024 01:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6sUaeyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ABB113664
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 01:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709775162; x=1741311162;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=E1EcUm9ag3k7MnElSSosUyv5GKo8/FtpJAk1gITdK/U=;
 b=b6sUaeyGChFrGxoJHJr67RItzHH8uA/xA0BxQYRAXhuDHTRmPcqjwME+
 ljZTYH3aLRiPKwCzC7ZEV2eSOuRxbXE/Pn9Wi/QbrCnzMBHsDjvgcU1t2
 /JG9prBwA1qnBIlkyh/gee4cK41MInn+fd4kz5yPDg8x6UO1IdWfxVTPS
 iCU/SxKBS2vHK52jHkY7UMoWjF6Q7OTJpMb/UxREKRRihdr+fTn515m0p
 EAOcxgxuy/OSaInVEDk7qS8rdk8NfexnZNxifoAqgmtP0IhFtSkLUIqco
 7lPQORQhH8/8PbleEnJwzywGuUldUPVcbk3m4f+PhkDKTXUIP7uTXhSht A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="26897630"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="26897630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 17:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="33099713"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2024 17:32:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ri2ce-0004gJ-39;
 Thu, 07 Mar 2024 01:32:36 +0000
Date: Thu, 7 Mar 2024 09:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [drm-misc:drm-misc-next 2/2]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: '%d' directive output
 may be truncated writing between 1 and 10 bytes into a region of size
 between 0 and 8
Message-ID: <202403070922.OGdsI4vn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f89632a9e5fa6c4787c14458cd42a9ef42025434
commit: f89632a9e5fa6c4787c14458cd42a9ef42025434 [2/2] drm: Add CONFIG_DRM_WERROR
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070922.OGdsI4vn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070922.OGdsI4vn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070922.OGdsI4vn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_kiq_init_ring':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Werror=format-truncation=]
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |                                                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argument in the range [0, 2147483647]
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |                                                  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 16
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +332 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

71c37505e7eaa0 Alex Deucher    2017-06-07  306  
71c37505e7eaa0 Alex Deucher    2017-06-07  307  int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev,
71c37505e7eaa0 Alex Deucher    2017-06-07  308  			     struct amdgpu_ring *ring,
def799c6596d07 Le Ma           2022-05-24  309  			     struct amdgpu_irq_src *irq, int xcc_id)
71c37505e7eaa0 Alex Deucher    2017-06-07  310  {
def799c6596d07 Le Ma           2022-05-24  311  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
71c37505e7eaa0 Alex Deucher    2017-06-07  312  	int r = 0;
71c37505e7eaa0 Alex Deucher    2017-06-07  313  
43ca8efa46d9b1 pding           2017-10-13  314  	spin_lock_init(&kiq->ring_lock);
71c37505e7eaa0 Alex Deucher    2017-06-07  315  
71c37505e7eaa0 Alex Deucher    2017-06-07  316  	ring->adev = NULL;
71c37505e7eaa0 Alex Deucher    2017-06-07  317  	ring->ring_obj = NULL;
71c37505e7eaa0 Alex Deucher    2017-06-07  318  	ring->use_doorbell = true;
def799c6596d07 Le Ma           2022-05-24  319  	ring->xcc_id = xcc_id;
3566938b3491bb Le Ma           2021-12-20  320  	ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
233bb3733bd439 Lijo Lazar      2023-01-19  321  	ring->doorbell_index =
233bb3733bd439 Lijo Lazar      2023-01-19  322  		(adev->doorbell_index.kiq +
233bb3733bd439 Lijo Lazar      2023-01-19  323  		 xcc_id * adev->doorbell_index.xcc_doorbell_range)
233bb3733bd439 Lijo Lazar      2023-01-19  324  		<< 1;
71c37505e7eaa0 Alex Deucher    2017-06-07  325  
def799c6596d07 Le Ma           2022-05-24  326  	r = amdgpu_gfx_kiq_acquire(adev, ring, xcc_id);
71c37505e7eaa0 Alex Deucher    2017-06-07  327  	if (r)
71c37505e7eaa0 Alex Deucher    2017-06-07  328  		return r;
71c37505e7eaa0 Alex Deucher    2017-06-07  329  
71c37505e7eaa0 Alex Deucher    2017-06-07  330  	ring->eop_gpu_addr = kiq->eop_gpu_addr;
a783910d5c8b45 Alex Deucher    2020-04-09  331  	ring->no_scheduler = true;
345a36c4f1baa0 Jani Nikula     2024-01-10 @332  	snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
345a36c4f1baa0 Jani Nikula     2024-01-10  333  		 xcc_id, ring->me, ring->pipe, ring->queue);
c107171b8d3241 Christian König 2021-02-02  334  	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
c107171b8d3241 Christian König 2021-02-02  335  			     AMDGPU_RING_PRIO_DEFAULT, NULL);
71c37505e7eaa0 Alex Deucher    2017-06-07  336  	if (r)
71c37505e7eaa0 Alex Deucher    2017-06-07  337  		dev_warn(adev->dev, "(%d) failed to init kiq ring\n", r);
71c37505e7eaa0 Alex Deucher    2017-06-07  338  
71c37505e7eaa0 Alex Deucher    2017-06-07  339  	return r;
71c37505e7eaa0 Alex Deucher    2017-06-07  340  }
71c37505e7eaa0 Alex Deucher    2017-06-07  341  

:::::: The code at line 332 was first introduced by commit
:::::: 345a36c4f1baa03275d88cd13747c6c1748b1fc0 drm/amdgpu: prefer snprintf over sprintf

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
