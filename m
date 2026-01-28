Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MfHL2sNemmS2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:21:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A42A20D7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E8310E6EB;
	Wed, 28 Jan 2026 13:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjkLZO9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0463210E2BA;
 Wed, 28 Jan 2026 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769606502; x=1801142502;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IBtvxcFQH17EFb7APUsEEaA1PasU3giQo88bh1kk8LI=;
 b=NjkLZO9GspLJfyjyO5NT2rQhzX7VNhUwuSpByVG/VETQGcKf92fFTroH
 hIcZeGXN1t3y54rOIYHMrtVaa/IupCXGW4JeTJz0CEX+Zxfn5kiL5tbUe
 b78Lf17aY4E3Da8pydy+vy6ww1KKlHzo25F6L7cRQ7tCbZcCm+3MJmPfB
 FQ/kCo3+5uQXq1cRUy6+iOXmmZrD7ucqkksJQ6VvM0r6ORWMfoXvT+pLv
 8X4IvyaGn1rp7CEHp3KX73CNrHiv95TNHAlK24xZLUOUjLy9RfXI0lN8V
 bmdAEPwbQsZCy27W/IDx5nL9KXIo/+3tsV8LcmcMc+wRQAN8i1Bx1Yp7m w==;
X-CSE-ConnectionGUID: uwf9DEhXTaKqf3IJIzI3Dg==
X-CSE-MsgGUID: EhP3RTplQ7i56Yt1asqJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82184141"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82184141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:21:42 -0800
X-CSE-ConnectionGUID: UOTjtR7UQHO3E0a1uQjRoQ==
X-CSE-MsgGUID: f7tU4Gj4QDShAnjUhX6aFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208280486"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 05:21:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vl5UG-00000000ZhM-1Cs0;
 Wed, 28 Jan 2026 13:21:36 +0000
Date: Wed, 28 Jan 2026 21:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/11] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
Message-ID: <202601282153.4kuaeoS5-lkp@intel.com>
References: <20260126133518.2486-5-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126133518.2486-5-pierre-eric.pelloux-prayer@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url]
X-Rspamd-Queue-Id: 71A42A20D7
X-Rspamd-Action: no action

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260123]
[cannot apply to drm-misc/drm-misc-next v6.19-rc7 v6.19-rc6 v6.19-rc5 linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-amdgpu-remove-gart_window_lock-usage-from-gmc-v12_1/20260126-214013
base:   next-20260123
patch link:    https://lore.kernel.org/r/20260126133518.2486-5-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v6 04/11] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601282153.4kuaeoS5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282153.4kuaeoS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282153.4kuaeoS5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c: In function 'vce_v1_0_ensure_vcpu_bo_32bit_addr':
>> drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:533:13: warning: unused variable 'gpu_addr' [-Wunused-variable]
     533 |         u64 gpu_addr = amdgpu_bo_gpu_offset(adev->vce.vcpu_bo);
         |             ^~~~~~~~


vim +/gpu_addr +533 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c

d4a640d4b9f34a Timur Kristóf              2025-11-07  516  
221cadb9c6bc2e Timur Kristóf              2025-11-07  517  /**
221cadb9c6bc2e Timur Kristóf              2025-11-07  518   * vce_v1_0_ensure_vcpu_bo_32bit_addr() - ensure the VCPU BO has a 32-bit address
221cadb9c6bc2e Timur Kristóf              2025-11-07  519   *
221cadb9c6bc2e Timur Kristóf              2025-11-07  520   * @adev: amdgpu_device pointer
221cadb9c6bc2e Timur Kristóf              2025-11-07  521   *
221cadb9c6bc2e Timur Kristóf              2025-11-07  522   * Due to various hardware limitations, the VCE1 requires
221cadb9c6bc2e Timur Kristóf              2025-11-07  523   * the VCPU BO to be in the low 32 bit address range.
221cadb9c6bc2e Timur Kristóf              2025-11-07  524   * Ensure that the VCPU BO has a 32-bit GPU address,
221cadb9c6bc2e Timur Kristóf              2025-11-07  525   * or return an error code when that isn't possible.
221cadb9c6bc2e Timur Kristóf              2025-11-07  526   *
221cadb9c6bc2e Timur Kristóf              2025-11-07  527   * To accomodate that, we put GART to the LOW address range
221cadb9c6bc2e Timur Kristóf              2025-11-07  528   * and reserve some GART pages where we map the VCPU BO,
221cadb9c6bc2e Timur Kristóf              2025-11-07  529   * so that it gets a 32-bit address.
221cadb9c6bc2e Timur Kristóf              2025-11-07  530   */
221cadb9c6bc2e Timur Kristóf              2025-11-07  531  static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
221cadb9c6bc2e Timur Kristóf              2025-11-07  532  {
221cadb9c6bc2e Timur Kristóf              2025-11-07 @533  	u64 gpu_addr = amdgpu_bo_gpu_offset(adev->vce.vcpu_bo);
221cadb9c6bc2e Timur Kristóf              2025-11-07  534  	u64 bo_size = amdgpu_bo_size(adev->vce.vcpu_bo);
221cadb9c6bc2e Timur Kristóf              2025-11-07  535  	u64 max_vcpu_bo_addr = 0xffffffff - bo_size;
221cadb9c6bc2e Timur Kristóf              2025-11-07  536  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
221cadb9c6bc2e Timur Kristóf              2025-11-07  537  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
221cadb9c6bc2e Timur Kristóf              2025-11-07  538  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  539  	u64 vce_gart_start;
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  540  	int r;
221cadb9c6bc2e Timur Kristóf              2025-11-07  541  
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  542  	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  543  					 &adev->vce.node, num_pages,
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  544  					 DRM_MM_INSERT_LOW);
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  545  	if (r)
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  546  		return r;
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  547  
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  548  	vce_gart_start = adev->vce.node.start * AMDGPU_GPU_PAGE_SIZE;
221cadb9c6bc2e Timur Kristóf              2025-11-07  549  
221cadb9c6bc2e Timur Kristóf              2025-11-07  550  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  551  	if (adev->gmc.gart_start + vce_gart_start > max_vcpu_bo_addr)
221cadb9c6bc2e Timur Kristóf              2025-11-07  552  		return -EINVAL;
221cadb9c6bc2e Timur Kristóf              2025-11-07  553  
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  554  	amdgpu_gart_map_vram_range(adev, pa, adev->vce.node.start,
221cadb9c6bc2e Timur Kristóf              2025-11-07  555  				   num_pages, flags, adev->gart.ptr);
6e8defc22cdff6 Pierre-Eric Pelloux-Prayer 2026-01-26  556  	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start;
221cadb9c6bc2e Timur Kristóf              2025-11-07  557  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
221cadb9c6bc2e Timur Kristóf              2025-11-07  558  		return -EINVAL;
221cadb9c6bc2e Timur Kristóf              2025-11-07  559  
221cadb9c6bc2e Timur Kristóf              2025-11-07  560  	return 0;
221cadb9c6bc2e Timur Kristóf              2025-11-07  561  }
221cadb9c6bc2e Timur Kristóf              2025-11-07  562  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
