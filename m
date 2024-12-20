Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5F9F93F2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CFD10E399;
	Fri, 20 Dec 2024 14:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUHUJbdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11410E076;
 Fri, 20 Dec 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734703654; x=1766239654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iri6H3nmdhP6/8IE99rvnbXZ3uixxk5Q0ccMzHM9kxY=;
 b=kUHUJbdKo+JUpVTKaQvt1/YZQVZHqnvE9BzryjrKOLgUz/l6mWPjjy9J
 EFdxpLXpfOawaC0BSkul0JfEnuOLVoyflS05Ss9Ay1l+xMG8xDBOOuefl
 q2wR33wTBpkkR5f/BZY2FiPr94lK9NPIdqR2pyw8NjeHgQyCBbdtXrRCJ
 V7L3WeNiFaBqbfBfqLImdRqGPQCHalH5pZqsIn6M4MDPmbRCA6gV3uNBy
 hAOarlfaTreAEqtOxFqHYHHTtgXM0pnyAVFaZsmv8lNo1wETptTaKumaZ
 PYhismCmK93DjsNGeanVJd+5tSOLKNcer5Yjb17DFJMWlP7WAH47ELI9M g==;
X-CSE-ConnectionGUID: iR3H0qxWTzCm8+NSlFu3/Q==
X-CSE-MsgGUID: uo3744O2RlybXT+FONwhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38936299"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="38936299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:07:33 -0800
X-CSE-ConnectionGUID: pl7KR/3FSV682XCpZDutGg==
X-CSE-MsgGUID: e0vfaQZmTfClFJZ4RroT5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99346134"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 06:07:29 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOdf4-0001Cx-2A;
 Fri, 20 Dec 2024 14:07:26 +0000
Date: Fri, 20 Dec 2024 22:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
Message-ID: <202412202144.SalviKDh-lkp@intel.com>
References: <20241212190909.28559-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212190909.28559-2-andrealmeid@igalia.com>
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

Hi André,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/drm-amdgpu-Use-device-wedged-event/20241213-031134
base:   linus/master
patch link:    https://lore.kernel.org/r/20241212190909.28559-2-andrealmeid%40igalia.com
patch subject: [PATCH 1/1] drm/amdgpu: Use device wedged event
config: s390-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202144.SalviKDh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202144.SalviKDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202144.SalviKDh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_gpu_recover':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:9: error: implicit declaration of function 'drm_dev_wedged_event' [-Wimplicit-function-declaration]
    6061 |         drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:49: error: 'DRM_WEDGE_RECOVERY_NONE' undeclared (first use in this function); did you mean 'DRM_MODE_ENCODER_NONE'?
    6061 |         drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 DRM_MODE_ENCODER_NONE
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/drm_dev_wedged_event +6061 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  5794	
  5795	/**
  5796	 * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  5797	 *
  5798	 * @adev: amdgpu_device pointer
  5799	 * @job: which job trigger hang
  5800	 * @reset_context: amdgpu reset context pointer
  5801	 *
  5802	 * Attempt to reset the GPU if it has hung (all asics).
  5803	 * Attempt to do soft-reset or full-reset and reinitialize Asic
  5804	 * Returns 0 for success or an error on failure.
  5805	 */
  5806	
  5807	int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
  5808				      struct amdgpu_job *job,
  5809				      struct amdgpu_reset_context *reset_context)
  5810	{
  5811		struct list_head device_list, *device_list_handle =  NULL;
  5812		bool job_signaled = false;
  5813		struct amdgpu_hive_info *hive = NULL;
  5814		struct amdgpu_device *tmp_adev = NULL;
  5815		int i, r = 0;
  5816		bool need_emergency_restart = false;
  5817		bool audio_suspended = false;
  5818		int retry_limit = AMDGPU_MAX_RETRY_LIMIT;
  5819	
  5820		/*
  5821		 * Special case: RAS triggered and full reset isn't supported
  5822		 */
  5823		need_emergency_restart = amdgpu_ras_need_emergency_restart(adev);
  5824	
  5825		/*
  5826		 * Flush RAM to disk so that after reboot
  5827		 * the user can read log and see why the system rebooted.
  5828		 */
  5829		if (need_emergency_restart && amdgpu_ras_get_context(adev) &&
  5830			amdgpu_ras_get_context(adev)->reboot) {
  5831			DRM_WARN("Emergency reboot.");
  5832	
  5833			ksys_sync_helper();
  5834			emergency_restart();
  5835		}
  5836	
  5837		dev_info(adev->dev, "GPU %s begin!\n",
  5838			need_emergency_restart ? "jobs stop":"reset");
  5839	
  5840		if (!amdgpu_sriov_vf(adev))
  5841			hive = amdgpu_get_xgmi_hive(adev);
  5842		if (hive)
  5843			mutex_lock(&hive->hive_lock);
  5844	
  5845		reset_context->job = job;
  5846		reset_context->hive = hive;
  5847		/*
  5848		 * Build list of devices to reset.
  5849		 * In case we are in XGMI hive mode, resort the device list
  5850		 * to put adev in the 1st position.
  5851		 */
  5852		INIT_LIST_HEAD(&device_list);
  5853		if (!amdgpu_sriov_vf(adev) && (adev->gmc.xgmi.num_physical_nodes > 1) && hive) {
  5854			list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
  5855				list_add_tail(&tmp_adev->reset_list, &device_list);
  5856				if (adev->shutdown)
  5857					tmp_adev->shutdown = true;
  5858			}
  5859			if (!list_is_first(&adev->reset_list, &device_list))
  5860				list_rotate_to_front(&adev->reset_list, &device_list);
  5861			device_list_handle = &device_list;
  5862		} else {
  5863			list_add_tail(&adev->reset_list, &device_list);
  5864			device_list_handle = &device_list;
  5865		}
  5866	
  5867		if (!amdgpu_sriov_vf(adev)) {
  5868			r = amdgpu_device_health_check(device_list_handle);
  5869			if (r)
  5870				goto end_reset;
  5871		}
  5872	
  5873		/* We need to lock reset domain only once both for XGMI and single device */
  5874		tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
  5875					    reset_list);
  5876		amdgpu_device_lock_reset_domain(tmp_adev->reset_domain);
  5877	
  5878		/* block all schedulers and reset given job's ring */
  5879		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
  5880	
  5881			amdgpu_device_set_mp1_state(tmp_adev);
  5882	
  5883			/*
  5884			 * Try to put the audio codec into suspend state
  5885			 * before gpu reset started.
  5886			 *
  5887			 * Due to the power domain of the graphics device
  5888			 * is shared with AZ power domain. Without this,
  5889			 * we may change the audio hardware from behind
  5890			 * the audio driver's back. That will trigger
  5891			 * some audio codec errors.
  5892			 */
  5893			if (!amdgpu_device_suspend_display_audio(tmp_adev))
  5894				audio_suspended = true;
  5895	
  5896			amdgpu_ras_set_error_query_ready(tmp_adev, false);
  5897	
  5898			cancel_delayed_work_sync(&tmp_adev->delayed_init_work);
  5899	
  5900			amdgpu_amdkfd_pre_reset(tmp_adev, reset_context);
  5901	
  5902			/*
  5903			 * Mark these ASICs to be reseted as untracked first
  5904			 * And add them back after reset completed
  5905			 */
  5906			amdgpu_unregister_gpu_instance(tmp_adev);
  5907	
  5908			drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
  5909	
  5910			/* disable ras on ALL IPs */
  5911			if (!need_emergency_restart &&
  5912			      amdgpu_device_ip_need_full_reset(tmp_adev))
  5913				amdgpu_ras_suspend(tmp_adev);
  5914	
  5915			for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
  5916				struct amdgpu_ring *ring = tmp_adev->rings[i];
  5917	
  5918				if (!amdgpu_ring_sched_ready(ring))
  5919					continue;
  5920	
  5921				drm_sched_stop(&ring->sched, job ? &job->base : NULL);
  5922	
  5923				if (need_emergency_restart)
  5924					amdgpu_job_stop_all_jobs_on_sched(&ring->sched);
  5925			}
  5926			atomic_inc(&tmp_adev->gpu_reset_counter);
  5927		}
  5928	
  5929		if (need_emergency_restart)
  5930			goto skip_sched_resume;
  5931	
  5932		/*
  5933		 * Must check guilty signal here since after this point all old
  5934		 * HW fences are force signaled.
  5935		 *
  5936		 * job->base holds a reference to parent fence
  5937		 */
  5938		if (job && dma_fence_is_signaled(&job->hw_fence)) {
  5939			job_signaled = true;
  5940			dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
  5941			goto skip_hw_reset;
  5942		}
  5943	
  5944	retry:	/* Rest of adevs pre asic reset from XGMI hive. */
  5945		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
  5946			r = amdgpu_device_pre_asic_reset(tmp_adev, reset_context);
  5947			/*TODO Should we stop ?*/
  5948			if (r) {
  5949				dev_err(tmp_adev->dev, "GPU pre asic reset failed with err, %d for drm dev, %s ",
  5950					  r, adev_to_drm(tmp_adev)->unique);
  5951				tmp_adev->asic_reset_res = r;
  5952			}
  5953		}
  5954	
  5955		/* Actual ASIC resets if needed.*/
  5956		/* Host driver will handle XGMI hive reset for SRIOV */
  5957		if (amdgpu_sriov_vf(adev)) {
  5958			if (amdgpu_ras_get_fed_status(adev) || amdgpu_virt_rcvd_ras_interrupt(adev)) {
  5959				dev_dbg(adev->dev, "Detected RAS error, wait for FLR completion\n");
  5960				amdgpu_ras_set_fed(adev, true);
  5961				set_bit(AMDGPU_HOST_FLR, &reset_context->flags);
  5962			}
  5963	
  5964			r = amdgpu_device_reset_sriov(adev, reset_context);
  5965			if (AMDGPU_RETRY_SRIOV_RESET(r) && (retry_limit--) > 0) {
  5966				amdgpu_virt_release_full_gpu(adev, true);
  5967				goto retry;
  5968			}
  5969			if (r)
  5970				adev->asic_reset_res = r;
  5971		} else {
  5972			r = amdgpu_do_asic_reset(device_list_handle, reset_context);
  5973			if (r && r == -EAGAIN)
  5974				goto retry;
  5975		}
  5976	
  5977		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
  5978			/*
  5979			 * Drop any pending non scheduler resets queued before reset is done.
  5980			 * Any reset scheduled after this point would be valid. Scheduler resets
  5981			 * were already dropped during drm_sched_stop and no new ones can come
  5982			 * in before drm_sched_start.
  5983			 */
  5984			amdgpu_device_stop_pending_resets(tmp_adev);
  5985		}
  5986	
  5987	skip_hw_reset:
  5988	
  5989		/* Post ASIC reset for all devs .*/
  5990		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
  5991	
  5992			for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
  5993				struct amdgpu_ring *ring = tmp_adev->rings[i];
  5994	
  5995				if (!amdgpu_ring_sched_ready(ring))
  5996					continue;
  5997	
  5998				drm_sched_start(&ring->sched, 0);
  5999			}
  6000	
  6001			if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
  6002				drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
  6003	
  6004			if (tmp_adev->asic_reset_res)
  6005				r = tmp_adev->asic_reset_res;
  6006	
  6007			tmp_adev->asic_reset_res = 0;
  6008	
  6009			if (r) {
  6010				/* bad news, how to tell it to userspace ?
  6011				 * for ras error, we should report GPU bad status instead of
  6012				 * reset failure
  6013				 */
  6014				if (reset_context->src != AMDGPU_RESET_SRC_RAS ||
  6015				    !amdgpu_ras_eeprom_check_err_threshold(tmp_adev))
  6016					dev_info(tmp_adev->dev, "GPU reset(%d) failed\n",
  6017						atomic_read(&tmp_adev->gpu_reset_counter));
  6018				amdgpu_vf_error_put(tmp_adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
  6019			} else {
  6020				dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
  6021				if (amdgpu_acpi_smart_shift_update(adev_to_drm(tmp_adev), AMDGPU_SS_DEV_D0))
  6022					DRM_WARN("smart shift update failed\n");
  6023			}
  6024		}
  6025	
  6026	skip_sched_resume:
  6027		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
  6028			/* unlock kfd: SRIOV would do it separately */
  6029			if (!need_emergency_restart && !amdgpu_sriov_vf(tmp_adev))
  6030				amdgpu_amdkfd_post_reset(tmp_adev);
  6031	
  6032			/* kfd_post_reset will do nothing if kfd device is not initialized,
  6033			 * need to bring up kfd here if it's not be initialized before
  6034			 */
  6035			if (!adev->kfd.init_complete)
  6036				amdgpu_amdkfd_device_init(adev);
  6037	
  6038			if (audio_suspended)
  6039				amdgpu_device_resume_display_audio(tmp_adev);
  6040	
  6041			amdgpu_device_unset_mp1_state(tmp_adev);
  6042	
  6043			amdgpu_ras_set_error_query_ready(tmp_adev, true);
  6044		}
  6045	
  6046		tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
  6047						    reset_list);
  6048		amdgpu_device_unlock_reset_domain(tmp_adev->reset_domain);
  6049	
  6050	end_reset:
  6051		if (hive) {
  6052			mutex_unlock(&hive->hive_lock);
  6053			amdgpu_put_xgmi_hive(hive);
  6054		}
  6055	
  6056		if (r)
  6057			dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
  6058	
  6059		atomic_set(&adev->reset_domain->reset_res, r);
  6060	
> 6061		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
  6062	
  6063		return r;
  6064	}
  6065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
