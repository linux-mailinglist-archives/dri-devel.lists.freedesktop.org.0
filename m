Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B0CD3D81
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 10:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D855B10E0B4;
	Sun, 21 Dec 2025 09:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVdORnI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F310E021;
 Sun, 21 Dec 2025 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766308802; x=1797844802;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uxixjlrd6VxMa53vWWDqTRdQ0NyGFDuQGcVMJ5vbUso=;
 b=bVdORnI3l2u2mT6rhXwLhBHiE0kPUkeDbfe6ZTWtT8+vBW1cZQG3TrEg
 EQePKX7UTrOoqNWM2MYfTWcdPM4x87gfGE2N15paQeWEilu8wB/q9cgAy
 2rs7Krfcq6yQRZwvFvKhIWlHRdlrOh+lLqPYEwf1NamIN3ftPAjuOKmw/
 C4MHrUbRa4BMMCk31Mv+pyYzZAklawSt97yQxmZKkO1J/J5FrGHZNDIGq
 BZ23bVIwNYpH6Me6hGUfJR7g/nNkt2Fme8ZnHdzDIsWgAcCAfufEvWIaL
 cIJxBOiwS99nQu7V+Mu1sYdiWVL/AYL+5Bcmile/CC3rqK2NgmWZujSzC g==;
X-CSE-ConnectionGUID: 43HHaAfQTlezRslhfK4+SQ==
X-CSE-MsgGUID: wIsXwrnoTc+wRMEkUhJ2pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72047772"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="72047772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 01:20:01 -0800
X-CSE-ConnectionGUID: s/g2az6DRLKE8uIYKDHl6Q==
X-CSE-MsgGUID: wp2QsmbKT4CJsQDpO+KijA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 01:19:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXFbX-00000000504-16m0;
 Sun, 21 Dec 2025 09:19:55 +0000
Date: Sun, 21 Dec 2025 10:19:52 +0100
From: kernel test robot <lkp@intel.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, siqueira@igalia.com,
 mario.limonciello@amd.com, wayne.lin@amd.com, roman.li@amd.com,
 timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
Message-ID: <202512211051.rcNkAntw-lkp@intel.com>
References: <20251218063512.4572-1-suryasaimadhu369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218063512.4572-1-suryasaimadhu369@gmail.com>
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

Hi suryasaimadhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18]
[also build test WARNING on next-20251219]
[cannot apply to drm-misc/drm-misc-next linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/suryasaimadhu/drm-amdgpu-dm-Convert-IRQ-logging-to-drm_-helpers/20251218-144203
base:   v6.18
patch link:    https://lore.kernel.org/r/20251218063512.4572-1-suryasaimadhu369%40gmail.com
patch subject: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512211051.rcNkAntw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211051.rcNkAntw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211051.rcNkAntw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c: In function 'amdgpu_dm_irq_register_interrupt':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:308:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     308 |         if (false == validate_irq_registration_params(int_params, ih))
         |         ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:310:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     310 |                 return DAL_INVALID_IRQ_HANDLER_IDX;
         |                 ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c: In function 'amdgpu_dm_irq_unregister_interrupt':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:375:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     375 |         if (false == validate_irq_unregistration_params(irq_source, ih))
         |         ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:377:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     377 |                 return;
         |                 ^~~~~~


vim +/if +308 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c

4562236b3bc0a2 Harry Wentland       2017-09-12  258  
d3a1c5548c1f21 suryasaimadhu        2025-12-18  259  static bool validate_irq_unregistration_params(
d3a1c5548c1f21 suryasaimadhu        2025-12-18  260  	enum dc_irq_source irq_source,
4562236b3bc0a2 Harry Wentland       2017-09-12  261  	irq_handler_idx handler_idx)
4562236b3bc0a2 Harry Wentland       2017-09-12  262  {
2d0b69fc712c07 Srinivasan Shanmugam 2023-06-22  263  	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
4562236b3bc0a2 Harry Wentland       2017-09-12  264  		return false;
4562236b3bc0a2 Harry Wentland       2017-09-12  265  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  266  
4562236b3bc0a2 Harry Wentland       2017-09-12  267  	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
4562236b3bc0a2 Harry Wentland       2017-09-12  268  		return false;
4562236b3bc0a2 Harry Wentland       2017-09-12  269  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  270  
4562236b3bc0a2 Harry Wentland       2017-09-12  271  	return true;
4562236b3bc0a2 Harry Wentland       2017-09-12  272  }
4562236b3bc0a2 Harry Wentland       2017-09-12  273  /******************************************************************************
4562236b3bc0a2 Harry Wentland       2017-09-12  274   * Public functions.
4562236b3bc0a2 Harry Wentland       2017-09-12  275   *
4562236b3bc0a2 Harry Wentland       2017-09-12  276   * Note: caller is responsible for input validation.
4562236b3bc0a2 Harry Wentland       2017-09-12  277   *****************************************************************************/
4562236b3bc0a2 Harry Wentland       2017-09-12  278  
b8592b48450b99 Leo Li               2018-09-14  279  /**
b8592b48450b99 Leo Li               2018-09-14  280   * amdgpu_dm_irq_register_interrupt() - Register a handler within DM.
b8592b48450b99 Leo Li               2018-09-14  281   * @adev: The base driver device containing the DM device.
b8592b48450b99 Leo Li               2018-09-14  282   * @int_params: Interrupt parameters containing the source, and handler context
b8592b48450b99 Leo Li               2018-09-14  283   * @ih: Function pointer to the interrupt handler to register
b8592b48450b99 Leo Li               2018-09-14  284   * @handler_args: Arguments passed to the handler when the interrupt occurs
b8592b48450b99 Leo Li               2018-09-14  285   *
b8592b48450b99 Leo Li               2018-09-14  286   * Register an interrupt handler for the given IRQ source, under the given
b8592b48450b99 Leo Li               2018-09-14  287   * context. The context can either be high or low. High context handlers are
b8592b48450b99 Leo Li               2018-09-14  288   * executed directly within ISR context, while low context is executed within a
b8592b48450b99 Leo Li               2018-09-14  289   * workqueue, thereby allowing operations that sleep.
b8592b48450b99 Leo Li               2018-09-14  290   *
b8592b48450b99 Leo Li               2018-09-14  291   * Registered handlers are called in a FIFO manner, i.e. the most recently
b8592b48450b99 Leo Li               2018-09-14  292   * registered handler will be called first.
b8592b48450b99 Leo Li               2018-09-14  293   *
b8592b48450b99 Leo Li               2018-09-14  294   * Return: Handler data &struct amdgpu_dm_irq_handler_data containing the IRQ
b8592b48450b99 Leo Li               2018-09-14  295   *         source, handler function, and args
b8592b48450b99 Leo Li               2018-09-14  296   */
e637525659ed04 Alex Deucher         2017-10-11  297  void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
4562236b3bc0a2 Harry Wentland       2017-09-12  298  				       struct dc_interrupt_params *int_params,
4562236b3bc0a2 Harry Wentland       2017-09-12  299  				       void (*ih)(void *),
4562236b3bc0a2 Harry Wentland       2017-09-12  300  				       void *handler_args)
4562236b3bc0a2 Harry Wentland       2017-09-12  301  {
d3a1c5548c1f21 suryasaimadhu        2025-12-18  302  	struct drm_device *dev = adev_to_drm(adev);
4562236b3bc0a2 Harry Wentland       2017-09-12  303  	struct list_head *hnd_list;
4562236b3bc0a2 Harry Wentland       2017-09-12  304  	struct amdgpu_dm_irq_handler_data *handler_data;
4562236b3bc0a2 Harry Wentland       2017-09-12  305  	unsigned long irq_table_flags;
4562236b3bc0a2 Harry Wentland       2017-09-12  306  	enum dc_irq_source irq_source;
4562236b3bc0a2 Harry Wentland       2017-09-12  307  
4562236b3bc0a2 Harry Wentland       2017-09-12 @308  	if (false == validate_irq_registration_params(int_params, ih))
d3a1c5548c1f21 suryasaimadhu        2025-12-18  309  		drm_err(dev, "DM_IRQ: invalid registration parameters\n");
4562236b3bc0a2 Harry Wentland       2017-09-12  310  		return DAL_INVALID_IRQ_HANDLER_IDX;
4562236b3bc0a2 Harry Wentland       2017-09-12  311  
4562236b3bc0a2 Harry Wentland       2017-09-12  312  	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
4562236b3bc0a2 Harry Wentland       2017-09-12  313  	if (!handler_data) {
d3a1c5548c1f21 suryasaimadhu        2025-12-18  314  		drm_err(dev, "DM_IRQ: failed to allocate irq handler!\n");
4562236b3bc0a2 Harry Wentland       2017-09-12  315  		return DAL_INVALID_IRQ_HANDLER_IDX;
4562236b3bc0a2 Harry Wentland       2017-09-12  316  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  317  
a7fbf17aa8bfaa Leo Li               2018-09-18  318  	init_handler_common_data(handler_data, ih, handler_args, &adev->dm);
4562236b3bc0a2 Harry Wentland       2017-09-12  319  
4562236b3bc0a2 Harry Wentland       2017-09-12  320  	irq_source = int_params->irq_source;
4562236b3bc0a2 Harry Wentland       2017-09-12  321  
4562236b3bc0a2 Harry Wentland       2017-09-12  322  	handler_data->irq_source = irq_source;
4562236b3bc0a2 Harry Wentland       2017-09-12  323  
4562236b3bc0a2 Harry Wentland       2017-09-12  324  	/* Lock the list, add the handler. */
4562236b3bc0a2 Harry Wentland       2017-09-12  325  	DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
4562236b3bc0a2 Harry Wentland       2017-09-12  326  
4562236b3bc0a2 Harry Wentland       2017-09-12  327  	switch (int_params->int_context) {
4562236b3bc0a2 Harry Wentland       2017-09-12  328  	case INTERRUPT_HIGH_IRQ_CONTEXT:
4562236b3bc0a2 Harry Wentland       2017-09-12  329  		hnd_list = &adev->dm.irq_handler_list_high_tab[irq_source];
4562236b3bc0a2 Harry Wentland       2017-09-12  330  		break;
4562236b3bc0a2 Harry Wentland       2017-09-12  331  	case INTERRUPT_LOW_IRQ_CONTEXT:
4562236b3bc0a2 Harry Wentland       2017-09-12  332  	default:
b6f91fc183f758 Xiaogang Chen        2021-02-25  333  		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
b6f91fc183f758 Xiaogang Chen        2021-02-25  334  		INIT_WORK(&handler_data->work, dm_irq_work_func);
4562236b3bc0a2 Harry Wentland       2017-09-12  335  		break;
4562236b3bc0a2 Harry Wentland       2017-09-12  336  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  337  
a7fbf17aa8bfaa Leo Li               2018-09-18  338  	list_add_tail(&handler_data->list, hnd_list);
4562236b3bc0a2 Harry Wentland       2017-09-12  339  
4562236b3bc0a2 Harry Wentland       2017-09-12  340  	DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
4562236b3bc0a2 Harry Wentland       2017-09-12  341  
4562236b3bc0a2 Harry Wentland       2017-09-12  342  	/* This pointer will be stored by code which requested interrupt
4562236b3bc0a2 Harry Wentland       2017-09-12  343  	 * registration.
4562236b3bc0a2 Harry Wentland       2017-09-12  344  	 * The same pointer will be needed in order to unregister the
2d0b69fc712c07 Srinivasan Shanmugam 2023-06-22  345  	 * interrupt.
2d0b69fc712c07 Srinivasan Shanmugam 2023-06-22  346  	 */
4562236b3bc0a2 Harry Wentland       2017-09-12  347  
4562236b3bc0a2 Harry Wentland       2017-09-12  348  	DRM_DEBUG_KMS(
4562236b3bc0a2 Harry Wentland       2017-09-12  349  		"DM_IRQ: added irq handler: %p for: dal_src=%d, irq context=%d\n",
4562236b3bc0a2 Harry Wentland       2017-09-12  350  		handler_data,
4562236b3bc0a2 Harry Wentland       2017-09-12  351  		irq_source,
4562236b3bc0a2 Harry Wentland       2017-09-12  352  		int_params->int_context);
4562236b3bc0a2 Harry Wentland       2017-09-12  353  
4562236b3bc0a2 Harry Wentland       2017-09-12  354  	return handler_data;
4562236b3bc0a2 Harry Wentland       2017-09-12  355  }
4562236b3bc0a2 Harry Wentland       2017-09-12  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
