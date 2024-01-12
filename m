Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79A82BA41
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 05:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A2810E6D1;
	Fri, 12 Jan 2024 04:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4D10E6D1;
 Fri, 12 Jan 2024 04:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705032588; x=1736568588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pVRB3MRByX33opvAG8pnOGwsL58VgShsQteTI0gaCFc=;
 b=ZQV865OG9GkVfEVxJdXsOy6fRStUcNtM4mptgyy63/By++5DK/XdzG9i
 SoO6Lz6iAq8yGnx4dGOPnXh712voyX5TLZQzjKkXFzJRIiAID+3jnb4bU
 yPksdAIpWXsVw9xL9QQ5eKDWsmClHB/rUWOawr57LP5aCzw+GOFFfWiLX
 QlG/Gtq/9uFMrCEWwJXc4p7inHyCfBAFqIaVjkC7+YSWKLuFhbNwsnYrd
 F6VMPaTvpuwHnxMWb6poNgVUWcV8TP9uHTTOsycnGmzNiuFE5twZxVrMs
 s+N4aVvxEqhvYwO2znI2LEswDHy6GnfpWEUKbpqNsj7KABJQ00rqaNbyb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463357607"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; d="scan'208";a="463357607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 20:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873258213"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; d="scan'208";a="873258213"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2024 20:09:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rO8rQ-000932-2r;
 Fri, 12 Jan 2024 04:09:36 +0000
Date: Fri, 12 Jan 2024 12:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
Message-ID: <202401121126.i9VGrvMb-lkp@intel.com>
References: <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
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
Cc: Pan@freedesktop.org, jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7 next-20240111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-nouveau-acr-ga102-remove-unused-but-set-variable/20240111-014206
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula%40intel.com
patch subject: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401121126.i9VGrvMb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121126.i9VGrvMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121126.i9VGrvMb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_kiq_init_ring':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Wformat-truncation=]
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


vim +332 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

   306	
   307	int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev,
   308				     struct amdgpu_ring *ring,
   309				     struct amdgpu_irq_src *irq, int xcc_id)
   310	{
   311		struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
   312		int r = 0;
   313	
   314		spin_lock_init(&kiq->ring_lock);
   315	
   316		ring->adev = NULL;
   317		ring->ring_obj = NULL;
   318		ring->use_doorbell = true;
   319		ring->xcc_id = xcc_id;
   320		ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
   321		ring->doorbell_index =
   322			(adev->doorbell_index.kiq +
   323			 xcc_id * adev->doorbell_index.xcc_doorbell_range)
   324			<< 1;
   325	
   326		r = amdgpu_gfx_kiq_acquire(adev, ring, xcc_id);
   327		if (r)
   328			return r;
   329	
   330		ring->eop_gpu_addr = kiq->eop_gpu_addr;
   331		ring->no_scheduler = true;
 > 332		snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
   333			 xcc_id, ring->me, ring->pipe, ring->queue);
   334		r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
   335				     AMDGPU_RING_PRIO_DEFAULT, NULL);
   336		if (r)
   337			dev_warn(adev->dev, "(%d) failed to init kiq ring\n", r);
   338	
   339		return r;
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
