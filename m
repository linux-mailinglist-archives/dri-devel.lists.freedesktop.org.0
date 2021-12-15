Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA804759AE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F131C10E295;
	Wed, 15 Dec 2021 13:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126CA10E27B;
 Wed, 15 Dec 2021 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639575066; x=1671111066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k866ifHnZPwQQfxaHvaMlY4Jgk6Yu0xwg2XFEW7LZyw=;
 b=gRG8wGB/69lFmtF16ltlCm3lvp733dpCp6aGItYnXefHvW+TJLcdTKxv
 qF7F3qn9saohYB2MzYTLU7Bhp45reBMtxBkuSo8EjP3WGKP15cchFnhCD
 E4P03kxAQ+YP8I2Fqk38R56pqK4a2sFJG4nvcvU+ebEglRB9cFSHZg7Ap
 pc009DkXsyBXxaytEvAOULRaLgfRJ7iEQjprInVi/oUwUA6nkl0eQ7SB2
 3M+4Igmz0+E4jwIikNkufa16O0WWKxb4sXvzz33co9BJh+xG0Kq8yPNEa
 U2jFYxh3msl7kMUalHSIuMCSmQ7WKsasUv7XLpQM4cymEuFXC1rsCabHJ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226507069"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226507069"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 05:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="482389228"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 05:31:02 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxUN3-0001pa-UZ; Wed, 15 Dec 2021 13:31:01 +0000
Date: Wed, 15 Dec 2021 21:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v3] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
Message-ID: <202112152115.sqAqnvG7-lkp@intel.com>
References: <20211215063551.2810601-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215063551.2810601-1-ray.huang@amd.com>
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
Cc: kbuild-all@lists.01.org, amd-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Huang,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Rui/drm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence/20211215-143731
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20211215/202112152115.sqAqnvG7-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/a47becf231b123760625c45242e89f5e5b5b4915
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Huang-Rui/drm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence/20211215-143731
        git checkout a47becf231b123760625c45242e89f5e5b5b4915
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:631: warning: expecting prototype for amdgpu_fence_clear_job_fences(). Prototype was for amdgpu_fence_driver_clear_job_fences() instead


vim +631 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   623	
   624	/**
   625	 * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
   626	 *
   627	 * @ring: fence of the ring to be cleared
   628	 *
   629	 */
   630	void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 > 631	{
   632		int i;
   633		struct dma_fence *old, **ptr;
   634	
   635		for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
   636			ptr = &ring->fence_drv.fences[i];
   637			old = rcu_dereference_protected(*ptr, 1);
   638			if (old && old->ops == &amdgpu_job_fence_ops)
   639				RCU_INIT_POINTER(*ptr, NULL);
   640		}
   641	}
   642	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
