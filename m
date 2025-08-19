Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562DB2BF0D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A109C10E58B;
	Tue, 19 Aug 2025 10:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGGU74g+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EFC10E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755599758; x=1787135758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lEqqlSoiP/VHSItgElRylFsVcFhLCEIOadYg72sdtpg=;
 b=RGGU74g+XiFPUPZkPN6+KLTkmE+0/EWUadngdpU5jse6Ng+6prccgtu2
 50YqpE6sbUfqV8o72sxdNuSEHL8hb2jm1OYQNwnWRWW7ntMOs6fKExasI
 fFrPUGjmCvWBkOWEwbph9eV0nInbrjo/lcEidVmUnXpq/eFjHsQq/qCtW
 0ag5z5O1jPcomxIWo3MH9TG9uHh4ckDO9TxAXvPbu9yk7Lsd19K6a9HWT
 B3tZa4YD1y0u3qaN06MUPgVh1/E0GK4z4sqaY585+mYr/b1/ADu2DsdV1
 FlQJh6On//XG1+HjMeOje09msMDu/KNbCCId8HMVSD2HkGnVBopSMNldK Q==;
X-CSE-ConnectionGUID: NH9PJzg3TlmfnDGLVMlRpQ==
X-CSE-MsgGUID: MaT9e9q9RpiC/X78+dmVvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83264729"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="83264729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 03:35:58 -0700
X-CSE-ConnectionGUID: geLXWB/pRLuVa4XimsBReA==
X-CSE-MsgGUID: 3wBDJ+lPRyWBQKn5uSYQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167320718"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2025 03:35:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uoJh0-000Gkt-0k;
 Tue, 19 Aug 2025 10:35:51 +0000
Date: Tue, 19 Aug 2025 18:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 willy@infradead.org, sidhartha.kumar@oracle.com
Subject: Re: [PATCH 1/6] drm: Convert aux_idr to XArray
Message-ID: <202508191844.VZB7euYb-lkp@intel.com>
References: <20250818190046.157962-2-sidhartha.kumar@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818190046.157962-2-sidhartha.kumar@oracle.com>
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

Hi Sidhartha,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16]
[also build test ERROR on next-20250819]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.17-rc2 v6.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidhartha-Kumar/drm-Convert-aux_idr-to-XArray/20250819-031755
base:   v6.16
patch link:    https://lore.kernel.org/r/20250818190046.157962-2-sidhartha.kumar%40oracle.com
patch subject: [PATCH 1/6] drm: Convert aux_idr to XArray
config: x86_64-buildonly-randconfig-002-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191844.VZB7euYb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191844.VZB7euYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191844.VZB7euYb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_aux_dev.c:85:5: error: passing 'struct xa_limit' to parameter of incompatible type 'void *'
      85 |                                 XA_LIMIT(0, DRM_AUX_MINORS - 1), aux_dev, GFP_KERNEL);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:248:30: note: expanded from macro 'XA_LIMIT'
     248 | #define XA_LIMIT(_min, _max) (struct xa_limit) { .min = _min, .max = _max }
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:872:9: note: passing argument to parameter 'entry' here
     872 |                 void *entry, struct xa_limit limit, gfp_t gfp)
         |                       ^
   1 error generated.


vim +85 drivers/gpu/drm/display/drm_dp_aux_dev.c

    71	
    72	static struct drm_dp_aux_dev *alloc_drm_dp_aux_dev(struct drm_dp_aux *aux)
    73	{
    74		struct drm_dp_aux_dev *aux_dev;
    75		int err;
    76	
    77		aux_dev = kzalloc(sizeof(*aux_dev), GFP_KERNEL);
    78		if (!aux_dev)
    79			return ERR_PTR(-ENOMEM);
    80		aux_dev->aux = aux;
    81		atomic_set(&aux_dev->usecount, 1);
    82		kref_init(&aux_dev->refcount);
    83	
    84		err = xa_alloc(&aux_xa, &aux_dev->index,
  > 85					XA_LIMIT(0, DRM_AUX_MINORS - 1), aux_dev, GFP_KERNEL);
    86		if (err < 0) {
    87			kfree(aux_dev);
    88			return ERR_PTR(err);
    89		}
    90	
    91		return aux_dev;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
