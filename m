Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92430CC1CAA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E101610E91F;
	Tue, 16 Dec 2025 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiP/wvst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED8310E954
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877414; x=1797413414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fc3bNIa1t3C77KLd0XpaNTmKo0iNt12Zzg/CpEqmdnQ=;
 b=UiP/wvstqms1DU0+kEQe62WVRB4x0tX/LCuhydECQyDqMD1NpHrSdKSF
 nNDTKHg1I4SmNGk7iNiCvzCdseKOVxn4FEAa4qDMM+nx3pgjiwS639upl
 cwKngE+4VKSXK6XEk9wa9mQw9VIwaPIkeg9gh4u4AchGpQpiy0KDNCJHD
 uDargbngiWOyzHqipILi8jmUKV1T6IAgPajoYhM69IjPK5MLRzhazBDRs
 4sZiDrdkAzVJaKlnDxkKVXKwRpqFeKRY7EE1SolftMrrfupa01/wkpdof
 67NRNykgFvjlPBKQPbWo8jsiQG9kzle18fDsBcbVcFrI45tmRV6rsfpah g==;
X-CSE-ConnectionGUID: brjIDpYlS5OvrG9COzBD2w==
X-CSE-MsgGUID: ECZO2b5ZRDywprcTq086Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67945847"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67945847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:30:14 -0800
X-CSE-ConnectionGUID: V3EuYVLYQW6yx47/pHlzZg==
X-CSE-MsgGUID: KGq6RbFySpq/qNAiM4vzfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197865381"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2025 01:30:10 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vVRNf-000000001Rs-49aY;
 Tue, 16 Dec 2025 09:30:07 +0000
Date: Tue, 16 Dec 2025 17:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group
 and queue errors
Message-ID: <202512161757.nqIBsB07-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251216/202512161757.nqIBsB07-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161757.nqIBsB07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161757.nqIBsB07-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_group_get_state':
>> drivers/gpu/drm/panthor/panthor_sched.c:3968:42: error: 'struct panthor_group' has no member named 'fault'
    3968 |         get_state->exception_type = group->fault.exception_type;
         |                                          ^~
   drivers/gpu/drm/panthor/panthor_sched.c:3969:39: error: 'struct panthor_group' has no member named 'fault'
    3969 |         get_state->access_type = group->fault.access_type;
         |                                       ^~
   drivers/gpu/drm/panthor/panthor_sched.c:3970:37: error: 'struct panthor_group' has no member named 'fault'
    3970 |         get_state->source_id = group->fault.source_id;
         |                                     ^~
   drivers/gpu/drm/panthor/panthor_sched.c:3971:41: error: 'struct panthor_group' has no member named 'fault'
    3971 |         get_state->valid_address = group->fault.valid_address;
         |                                         ^~
   drivers/gpu/drm/panthor/panthor_sched.c:3972:35: error: 'struct panthor_group' has no member named 'fault'
    3972 |         get_state->address = group->fault.address;
         |                                   ^~


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
