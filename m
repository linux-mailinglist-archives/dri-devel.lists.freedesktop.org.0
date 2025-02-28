Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DBA48FD2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 04:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919410EBE5;
	Fri, 28 Feb 2025 03:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGaGWUXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073DF10EBE5;
 Fri, 28 Feb 2025 03:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740714267; x=1772250267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=piPSJeKsAzse+Qlz6LA0inN02V2FwQ/BiO/HAZqPHLk=;
 b=LGaGWUXeSAl0DR1bAoMOXzQJs6595ekTAUVSbMS3u3JE0o9QI3ftFgal
 uUu34seLbpjkJnM1DVskAI6yTM0Wa+DJysuK8ExyImsTWCpndKnKvoqIG
 v4SdoA5rK7QCdzC8WB99ehHF1+d/Oirr05Zu5o6JrtWs+4JJwdgrtGKkf
 u7esRjxSQJ949Iw+0ZHZnQfuKPv/vNZrSVvYtNqs/amPHDuio8kcFrbjO
 xcNiDwAaXAzJrL8TJePOyEgFq1FY92W+hW8MBAmCASnwoiesspwqDjaic
 XpLBD/omMhAMthmQnHY33m5o+N5zEbgGTWk4mMB0Ak05igxCyB5QuYFmq g==;
X-CSE-ConnectionGUID: NAvvECrfSVOP2zABP6LN1A==
X-CSE-MsgGUID: c2l8HaWHQPWaTmE+DzbEtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59045517"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="59045517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 19:44:26 -0800
X-CSE-ConnectionGUID: O2sJrFilQl+vJWvf8bsa7Q==
X-CSE-MsgGUID: kbWFrUReTXOm2AmS4DKZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117018258"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 27 Feb 2025 19:44:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnrIT-000EOE-0u;
 Fri, 28 Feb 2025 03:44:21 +0000
Date: Fri, 28 Feb 2025 11:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 jonathan.cavitt@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, jianxun.zhang@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <202502281118.XNrfLzlo-lkp@intel.com>
References: <20250227191457.84035-9-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227191457.84035-9-jonathan.cavitt@intel.com>
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

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250227]
[cannot apply to linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Disallow-writes-to-read-only-VMAs/20250228-032204
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250227191457.84035-9-jonathan.cavitt%40intel.com
patch subject: [PATCH v2 8/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
config: i386-buildonly-randconfig-002-20250228 (https://download.01.org/0day-ci/archive/20250228/202502281118.XNrfLzlo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281118.XNrfLzlo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281118.XNrfLzlo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:3267:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3267 |                 struct xe_exec_queue_ban_entry *entry;
         |                 ^
   1 warning generated.


vim +3267 drivers/gpu/drm/xe/xe_vm.c

  3260	
  3261	static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
  3262	{
  3263		u32 size = 0;
  3264	
  3265		switch (property) {
  3266		case DRM_XE_VM_GET_PROPERTY_FAULTS:
> 3267			struct xe_exec_queue_ban_entry *entry;
  3268	
  3269			spin_lock(&vm->bans.lock);
  3270			list_for_each_entry(entry, &vm->bans.list, list) {
  3271				struct xe_pagefault *pf = entry->pf;
  3272	
  3273				size += pf ? sizeof(struct drm_xe_ban) : 0;
  3274			}
  3275			spin_unlock(&vm->bans.lock);
  3276			return size;
  3277		case DRM_XE_VM_GET_PROPERTY_BANS:
  3278			spin_lock(&vm->bans.lock);
  3279			size = vm->bans.len * sizeof(struct drm_xe_ban);
  3280			spin_unlock(&vm->bans.lock);
  3281			return size;
  3282		case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
  3283			return 0;
  3284		default:
  3285			return -EINVAL;
  3286		}
  3287	}
  3288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
