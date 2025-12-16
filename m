Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C5CC1069
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE9010E65C;
	Tue, 16 Dec 2025 05:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m41uwFIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF0210E65C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 05:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765863967; x=1797399967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1XjP0mKFkNYKFLhPRTL97PmYp8Uie7/TKKOaVYmxSU0=;
 b=m41uwFIrXhEEIwyZFHWRlTlvZyFpDhK3PCNhZIaox4cikFFgrNLCw8sj
 iSf/BHYeyWwXc/7e9ibLtTUvzetN7siDJ9S5QBF9T1s9HnUG6uLk8E1s1
 8eJnXjolFbUT0l7cppigQQmWoqrfRXT+51rnOOuTegj6jNGU94NymQvwX
 x23V1Ip8muh2x1LK41d0Xmi8+c4pzVzSUniJvFpRU6vVUJMcG26UHKrah
 fett7QWdbN91IE/J3+589WbieqBrRXIyVbKgicFXgF5m9bUb1Zqf+fqMm
 Eg61ADW275pPFOlZxzwB/jdKlVitXmSS3NnAYsXKi46S8XaNp68aofWCA Q==;
X-CSE-ConnectionGUID: WzKAdwwaS1CiiigcIrnUvw==
X-CSE-MsgGUID: cdoNGonQSiCIe0qmzuKIhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85187795"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="85187795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 21:46:06 -0800
X-CSE-ConnectionGUID: j31l8sBpSmKaE5BQamH7ig==
X-CSE-MsgGUID: f3jvVeySTViGwe+AHKnECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="235326976"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 21:46:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vVNsl-000000001Cr-2Ym4;
 Tue, 16 Dec 2025 05:45:59 +0000
Date: Tue, 16 Dec 2025 13:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group
 and queue errors
Message-ID: <202512161359.YBFqhXuf-lkp@intel.com>
References: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
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

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20251216]
[cannot apply to linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Implement-CS_FAULT-propagation-to-userspace/20251215-195920
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215115457.2137485-6-lukas.zapolskas%40arm.com
patch subject: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group and queue errors
config: x86_64-buildonly-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161359.YBFqhXuf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161359.YBFqhXuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161359.YBFqhXuf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_sched.c:3968:37: error: no member named 'fault' in 'struct panthor_group'
    3968 |         get_state->exception_type = group->fault.exception_type;
         |                                     ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3969:34: error: no member named 'fault' in 'struct panthor_group'
    3969 |         get_state->access_type = group->fault.access_type;
         |                                  ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3970:32: error: no member named 'fault' in 'struct panthor_group'
    3970 |         get_state->source_id = group->fault.source_id;
         |                                ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3971:36: error: no member named 'fault' in 'struct panthor_group'
    3971 |         get_state->valid_address = group->fault.valid_address;
         |                                    ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3972:30: error: no member named 'fault' in 'struct panthor_group'
    3972 |         get_state->address = group->fault.address;
         |                              ~~~~~  ^
   5 errors generated.


vim +3968 drivers/gpu/drm/panthor/panthor_sched.c

  3938	
  3939	int panthor_group_get_state(struct panthor_file *pfile,
  3940				    struct drm_panthor_group_get_state *get_state,
  3941				    struct drm_panthor_queue_event *events, u32 count)
  3942	{
  3943		struct panthor_group_pool *gpool = pfile->groups;
  3944		struct panthor_device *ptdev = pfile->ptdev;
  3945		struct panthor_scheduler *sched = ptdev->scheduler;
  3946		struct panthor_group *group = NULL;
  3947		u32 fault_count;
  3948	
  3949		group = group_from_handle(gpool, get_state->group_handle);
  3950		if (!group)
  3951			return -EINVAL;
  3952	
  3953		guard(mutex)(&sched->lock);
  3954	
  3955		if (group->timedout)
  3956			get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
  3957		if (group->fatal_queues) {
  3958			get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
  3959			get_state->fatal_queues = group->fatal_queues;
  3960		}
  3961		if (group->innocent)
  3962			get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
  3963		if (group->fault_queues) {
  3964			get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
  3965			get_state->fault_queues = group->fault_queues;
  3966		}
  3967	
> 3968		get_state->exception_type = group->fault.exception_type;
  3969		get_state->access_type = group->fault.access_type;
  3970		get_state->source_id = group->fault.source_id;
  3971		get_state->valid_address = group->fault.valid_address;
  3972		get_state->address = group->fault.address;
  3973	
  3974		fault_count = panthor_group_count_faults(sched, group);
  3975	
  3976		if (!count && !events) {
  3977			get_state->faults.count = fault_count;
  3978			get_state->faults.stride = sizeof(struct drm_panthor_queue_event);
  3979			goto exit;
  3980		}
  3981	
  3982		panthor_group_get_faults(sched, group, events, min(get_state->faults.count, count));
  3983	
  3984	exit:
  3985		group_put(group);
  3986		return 0;
  3987	}
  3988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
