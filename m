Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69EB02EAA
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 07:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695BB10E00C;
	Sun, 13 Jul 2025 05:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7ROsNEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836E010E00C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752383464; x=1783919464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fzQhQxxcINMwQn7nMRVM6TE8GI5gfDJ9zcHTCJjF9jI=;
 b=Z7ROsNEYzRo9IatDoKuSfQmJ0qWhut1LrG4ConU+lXzty2r4YB1BN15K
 86ygVBIx8OwALNoDCeWqgXM3nnhtGmW9/DiEphpc9m+bMxH1iF5MEXtvY
 VTcq+hFXspxXz4CLRtrAc+It8byKqgdH6y6ru4VUKzYK7PWdsBxGIrfk7
 GuMVeCn/Ap4ABHWh+ydzMzfqoiE684RbzGnoYg4ruk8omL1VV2QGdNpzX
 eKFAJSa7M+EBS/9EKy/wMKkllo7fDTqi7BOaEuxxy7JrtXFwvhv7fiyjv
 G0zOXHvxdGElU8doN0L2s1OaT5zkXq+SpNV1KS2Lz2DE+fOjhYoFLvVqq w==;
X-CSE-ConnectionGUID: Hch6RU5sR8+orgBJBwLRIw==
X-CSE-MsgGUID: 7XPC7nmnTc2t+usXWoZ2ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77156591"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="77156591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2025 22:11:04 -0700
X-CSE-ConnectionGUID: lYgPMPK1T7u3wTMvj+zltg==
X-CSE-MsgGUID: fC5whkkXRcKFXLcfNvvVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="180356311"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2025 22:11:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uaozK-0007tf-2B;
 Sun, 13 Jul 2025 05:10:58 +0000
Date: Sun, 13 Jul 2025 13:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] panthor: save task pid and comm in panthor_group
Message-ID: <202507131246.VXxAzjGd-lkp@intel.com>
References: <20250713030831.3227607-3-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713030831.3227607-3-olvaffe@gmail.com>
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

Hi Chia-I,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250711]
[also build test WARNING on v6.16-rc5]
[cannot apply to linus/master v6.16-rc5 v6.16-rc4 v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-I-Wu/panthor-set-owner-field-for-driver-fops/20250713-111248
base:   next-20250711
patch link:    https://lore.kernel.org/r/20250713030831.3227607-3-olvaffe%40gmail.com
patch subject: [PATCH v2 2/3] panthor: save task pid and comm in panthor_group
config: i386-buildonly-randconfig-003-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131246.VXxAzjGd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131246.VXxAzjGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131246.VXxAzjGd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'runnable' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'idle' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'waiting' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'has_ref' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'in_progress' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:317 Excess struct member 'stopped_groups' description in 'panthor_scheduler'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'mem' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'input' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'output' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'input_fw_va' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'output_fw_va' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'gpu_va' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'ref' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'gt' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'sync64' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'bo' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'offset' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'kmap' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'lock' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'id' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'seqno' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'last_fence' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'slots' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'slot_count' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:489 Excess struct member 'seqno' description in 'panthor_queue'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:707 Excess struct member 'data' description in 'panthor_group'
>> Warning: drivers/gpu/drm/panthor/panthor_sched.c:707 Excess struct member 'pid' description in 'panthor_group'
>> Warning: drivers/gpu/drm/panthor/panthor_sched.c:707 Excess struct member 'comm' description in 'panthor_group'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'start' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'size' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'latest_flush' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'start' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'end' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'mask' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:843 Excess struct member 'slot' description in 'panthor_job'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:1770 function parameter 'ptdev' not described in 'panthor_sched_report_fw_events'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:1770 function parameter 'events' not described in 'panthor_sched_report_fw_events'
   Warning: drivers/gpu/drm/panthor/panthor_sched.c:2663 function parameter 'ptdev' not described in 'panthor_sched_report_mmu_fault'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
