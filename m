Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7B978BAE
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 01:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF80F10E15E;
	Fri, 13 Sep 2024 23:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah/1mmTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CDB10E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 23:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726268794; x=1757804794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1GPrf+aOP1Wb6hv1CV4Q9bpX6pTqgU0R8e3l68zJf20=;
 b=ah/1mmTeMIuSKvFKoxNG/PU1ILOvFkwBiZVaHWd369zzIkKf3uFaeQSP
 v6+lcMNCBcWAd/FqKphQX82bcOigCX4/oVe0iNfkAEI9dqrrdTRivF2bv
 gkfLOq8TqgnVTvkjevqaaRvYSGfPU8CxVE6pWr3Sb9bk/22nhsrTtAUoK
 wbJSSycdFpO4v8gCD/1vYcoBRkoWuRH2Vm1Cw6NEwNUWNTHKkF5GLCfzW
 rIbdPntz+p+cs0fKVUea6kDfNArs0+ERwJxJJBWE1cpO8r3sthmWkSFFL
 U+G0Feip/knbUKUMIadQcu5ydxIsn/drAy46Q+yMN49cWPSZbLjNTB+hm Q==;
X-CSE-ConnectionGUID: t28uFUlFTMGCkbWgDhS0KQ==
X-CSE-MsgGUID: UE9aZ/bIQp2p9vRpTVuuYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36533418"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="36533418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 16:06:34 -0700
X-CSE-ConnectionGUID: UR+FZ7rpQqOBkpAlsNLeaQ==
X-CSE-MsgGUID: a7hG6zERQWaJzL+RlP4RLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="68733765"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 16:06:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spFMy-00077e-2R;
 Fri, 13 Sep 2024 23:06:28 +0000
Date: Sat, 14 Sep 2024 07:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
Message-ID: <202409140642.ZDKf0cja-lkp@intel.com>
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
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

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc7 next-20240913]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-use-drm_file-name-in-fdinfo/20240911-230058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240911145836.734080-1-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140642.ZDKf0cja-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140642.ZDKf0cja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140642.ZDKf0cja-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_ioctl.c:553:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *user_ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/drm_ioctl.c:553:18: sparse:     expected void *user_ptr
   drivers/gpu/drm/drm_ioctl.c:553:18: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/drm_ioctl.c:555:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void *user_ptr @@
   drivers/gpu/drm/drm_ioctl.c:555:36: sparse:     expected void const [noderef] __user *
   drivers/gpu/drm/drm_ioctl.c:555:36: sparse:     got void *user_ptr

vim +553 drivers/gpu/drm/drm_ioctl.c

   542	
   543	static int drm_set_name(struct drm_device *dev, void *data,
   544				struct drm_file *file_priv)
   545	{
   546		struct drm_set_name *name = data;
   547		void *user_ptr;
   548		char *new_name;
   549	
   550		if (name->name_len >= NAME_MAX)
   551			return -EINVAL;
   552	
 > 553		user_ptr = u64_to_user_ptr(name->name);
   554	
 > 555		new_name = memdup_user_nul(user_ptr, name->name_len);
   556	
   557		if (IS_ERR(new_name))
   558			return PTR_ERR(new_name);
   559	
   560		mutex_lock(&file_priv->name_lock);
   561		if (file_priv->name)
   562			kvfree(file_priv->name);
   563		file_priv->name = new_name;
   564		mutex_unlock(&file_priv->name_lock);
   565	
   566		return 0;
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
