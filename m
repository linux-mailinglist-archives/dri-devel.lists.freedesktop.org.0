Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB46BF8724
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 22:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E5810E33E;
	Tue, 21 Oct 2025 19:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2yBqVxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25FC10E33D;
 Tue, 21 Oct 2025 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761076799; x=1792612799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cliFJ/Qa1dJFS3oowifvoOtDGZ1EsLF04oZzQ0lotlg=;
 b=m2yBqVxn7rw4vnisZ093l9pHS2hshr+6s3yFUAd4N35Qqny5DDaNqsbQ
 Nnb8rGoNZMmKErayxrWtkGXhuay3FTwQjW0cZx3nBFgMGPLGoPy7q9MP8
 TnX6w4wJ0fpoLRka6y5i49H7iqW0NawlV1IAhptt9ipZuh+TE9Wb9Siur
 Ufm6utN3oXEDwQISDt3DRR8xqiTx4HJzjzO9MAL5UrIk6gQ1dNi5T0pGJ
 K25QoMfRQcU85KeKo/koytkSR+dJM9hgGo5d3p18ML3QAQSccVf/EGVNa
 hWlVn32rU7s3e+MZNa3NNSXM6SSRgbb7JJZTDkkK6suXE68IDeokpdjqe Q==;
X-CSE-ConnectionGUID: n9AqY5Q0TkaxwdBvLsVwJw==
X-CSE-MsgGUID: obQuxpxcSBWlHhha4310Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67079270"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67079270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:59:59 -0700
X-CSE-ConnectionGUID: 4xoHEzZ5SHC/cgN3p53LgQ==
X-CSE-MsgGUID: pB69CAyPQvSRdA+DfBKqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182841167"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 12:59:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBIWP-000BNc-1X;
 Tue, 21 Oct 2025 19:59:53 +0000
Date: Wed, 22 Oct 2025 03:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, simona.vetter@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/mm: replace drm_print.h include with a forward
 declaration
Message-ID: <202510220305.rfiVr2PC-lkp@intel.com>
References: <05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[also build test ERROR on v6.18-rc2]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.18-rc2 v6.18-rc1 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-mm-replace-drm_print-h-include-with-a-forward-declaration/20251022-003212
base:   next-20251021
patch link:    https://lore.kernel.org/r/05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula%40intel.com
patch subject: [PATCH 1/3] drm/mm: replace drm_print.h include with a forward declaration
config: x86_64-buildonly-randconfig-006-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220305.rfiVr2PC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220305.rfiVr2PC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220305.rfiVr2PC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_queue_get_syncwait_obj':
>> drivers/gpu/drm/panthor/panthor_sched.c:877:13: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     877 |         if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
         |             ^~~~~~~~~~~
         |             VM_WARN_ON
   drivers/gpu/drm/panthor/panthor_sched.c: In function 'csg_slot_sync_state_locked':
>> drivers/gpu/drm/panthor/panthor_sched.c:1262:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
    1262 |                 drm_err(&ptdev->base, "Invalid state on CSG %d (state=%d)",
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_fatal_event_locked':
>> drivers/gpu/drm/panthor/panthor_sched.c:1372:17: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
    1372 |                 drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
         |                 ^~~~~~~~
         |                 dev_warn
--
   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_gpu_coherency_init':
>> drivers/gpu/drm/panthor/panthor_device.c:40:9: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
      40 |         drm_err(&ptdev->base, "Coherency not supported by the device");
         |         ^~~~~~~
         |         pr_err
   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_clk_init':
>> drivers/gpu/drm/panthor/panthor_device.c:64:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
      64 |         drm_info(&ptdev->base, "clock rate = %lu\n", clk_get_rate(ptdev->clks.core));
         |         ^~~~~~~~
         |         pr_info
   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_device_unplug':
>> drivers/gpu/drm/panthor/panthor_device.c:96:9: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
      96 |         drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
         |         ^~~~~~~~~~~
         |         VM_WARN_ON
--
   drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_submit_ctx_update_job_sync_signal_fences':
>> drivers/gpu/drm/panthor/panthor_drv.c:515:21: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     515 |                 if (drm_WARN_ON(&ptdev->base, !sig_sync))
         |                     ^~~~~~~~~~~
         |                     VM_WARN_ON
   drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_gpu_show_fdinfo':
>> drivers/gpu/drm/panthor/panthor_drv.c:1519:17: error: implicit declaration of function 'drm_printf'; did you mean 'seq_printf'? [-Wimplicit-function-declaration]
    1519 |                 drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
         |                 ^~~~~~~~~~
         |                 seq_printf
--
   drivers/gpu/drm/panthor/panthor_hw.c: In function 'panthor_hw_info_init':
>> drivers/gpu/drm/panthor/panthor_hw.c:101:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
     101 |         drm_info(&ptdev->base,
         |         ^~~~~~~~
         |         pr_info
--
   drivers/gpu/drm/panthor/panthor_devfreq.c: In function 'panthor_devfreq_get_dev_status':
>> drivers/gpu/drm/panthor/panthor_devfreq.c:110:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
     110 |         drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
         |         ^~~~~~~
         |         dev_dbg
   drivers/gpu/drm/panthor/panthor_devfreq.c: In function 'panthor_devfreq_init':
>> drivers/gpu/drm/panthor/panthor_devfreq.c:151:25: error: implicit declaration of function 'DRM_DEV_ERROR'; did you mean 'TIME_ERROR'? [-Wimplicit-function-declaration]
     151 |                         DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
         |                         ^~~~~~~~~~~~~
         |                         TIME_ERROR
>> drivers/gpu/drm/panthor/panthor_devfreq.c:240:17: error: implicit declaration of function 'DRM_DEV_INFO' [-Wimplicit-function-declaration]
     240 |                 DRM_DEV_INFO(dev, "Failed to register cooling device\n");
         |                 ^~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_devfreq.c: In function 'panthor_devfreq_resume':
>> drivers/gpu/drm/panthor/panthor_devfreq.c:254:9: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     254 |         drm_WARN_ON(&ptdev->base, devfreq_resume_device(pdevfreq->devfreq));
         |         ^~~~~~~~~~~
         |         VM_WARN_ON
--
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_l2_config_set':
>> drivers/gpu/drm/panthor/panthor_gpu.c:65:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
      65 |                 drm_err(&ptdev->base, "Custom ASN hash not supported by the device");
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_irq_handler':
>> drivers/gpu/drm/panthor/panthor_gpu.c:85:17: error: implicit declaration of function 'drm_warn'; did you mean 'pr_warn'? [-Wimplicit-function-declaration]
      85 |                 drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
         |                 ^~~~~~~~
         |                 pr_warn
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_l2_power_on':
>> drivers/gpu/drm/panthor/panthor_gpu.c:261:17: error: implicit declaration of function 'drm_info_once'; did you mean 'dev_info_once'? [-Wimplicit-function-declaration]
     261 |                 drm_info_once(&ptdev->base, "using only 1st core group (%lu cores from %lu)\n",
         |                 ^~~~~~~~~~~~~
         |                 dev_info_once
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_flush_caches':
>> drivers/gpu/drm/panthor/panthor_gpu.c:292:14: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     292 |         if (!drm_WARN_ON(&ptdev->base,
         |              ^~~~~~~~~~~
         |              VM_WARN_ON
--
   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_kernel_bo_destroy':
>> drivers/gpu/drm/panthor/panthor_gem.c:97:13: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
      97 |         if (drm_WARN_ON(bo->obj->dev,
         |             ^~~~~~~~~~~
         |             VM_WARN_ON
   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_kernel_bo_set_label':
>> drivers/gpu/drm/panthor/panthor_gem.c:334:17: error: implicit declaration of function 'drm_warn'; did you mean 'pr_warn'? [-Wimplicit-function-declaration]
     334 |                 drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
         |                 ^~~~~~~~
         |                 pr_warn
--
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_fw_get_csg_iface':
>> drivers/gpu/drm/panthor/panthor_fw.c:296:13: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     296 |         if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS))
         |             ^~~~~~~~~~~
         |             VM_WARN_ON
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_fw_binary_iter_read':
>> drivers/gpu/drm/panthor/panthor_fw.c:370:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
     370 |                 drm_err(&ptdev->base, "Firmware too small\n");
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_fw_load_section_entry':
>> drivers/gpu/drm/panthor/panthor_fw.c:536:17: error: implicit declaration of function 'drm_warn'; did you mean 'pr_warn'? [-Wimplicit-function-declaration]
     536 |                 drm_warn(&ptdev->base,
         |                 ^~~~~~~~
         |                 pr_warn
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_fw_read_build_info':
>> drivers/gpu/drm/panthor/panthor_fw.c:668:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
     668 |         drm_info(&ptdev->base, "Firmware git sha: %s\n",
         |         ^~~~~~~~
         |         pr_info
--
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'alloc_pt':
>> drivers/gpu/drm/panthor/panthor_mmu.c:432:17: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     432 |                 drm_WARN_ON(&vm->ptdev->base, vm->op_ctx);
         |                 ^~~~~~~~~~~
         |                 VM_WARN_ON
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'wait_ready':
>> drivers/gpu/drm/panthor/panthor_mmu.c:506:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
     506 |                 drm_err(&ptdev->base, "AS_ACTIVE bit stuck\n");
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'mmu_hw_do_operation_locked':
>> drivers/gpu/drm/panthor/panthor_mmu.c:575:17: error: implicit declaration of function 'drm_WARN'; did you mean 'dev_WARN'? [-Wimplicit-function-declaration]
     575 |                 drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
         |                 ^~~~~~~~
         |                 dev_WARN
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_vm_unmap_pages':
>> drivers/gpu/drm/panthor/panthor_mmu.c:908:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
     908 |         drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
         |         ^~~~~~~
         |         dev_dbg
--
   drivers/gpu/drm/panthor/panthor_heap.c: In function 'panthor_heap_pool_destroy':
>> drivers/gpu/drm/panthor/panthor_heap.c:604:17: error: implicit declaration of function 'drm_WARN_ON'; did you mean 'VM_WARN_ON'? [-Wimplicit-function-declaration]
     604 |                 drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
         |                 ^~~~~~~~~~~
         |                 VM_WARN_ON
--
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_get_format':
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:126:17: error: implicit declaration of function 'DRM_WARN'; did you mean 'VM_WARN'? [-Wimplicit-function-declaration]
     126 |                 DRM_WARN("Format not supported - fallback to XRGB8888\n");
         |                 ^~~~~~~~
         |                 VM_WARN
   drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_pipe_check':
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:285:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
     285 |                 drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
         |                 ^~~~~~~
         |                 pr_err
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n] && COMMON_CLK [=y]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +877 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  862  
de85488138247d Boris Brezillon 2024-02-29  863  static void *
de85488138247d Boris Brezillon 2024-02-29  864  panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue *queue)
de85488138247d Boris Brezillon 2024-02-29  865  {
de85488138247d Boris Brezillon 2024-02-29  866  	struct panthor_device *ptdev = group->ptdev;
de85488138247d Boris Brezillon 2024-02-29  867  	struct panthor_gem_object *bo;
de85488138247d Boris Brezillon 2024-02-29  868  	struct iosys_map map;
de85488138247d Boris Brezillon 2024-02-29  869  	int ret;
de85488138247d Boris Brezillon 2024-02-29  870  
de85488138247d Boris Brezillon 2024-02-29  871  	if (queue->syncwait.kmap)
de85488138247d Boris Brezillon 2024-02-29  872  		return queue->syncwait.kmap + queue->syncwait.offset;
de85488138247d Boris Brezillon 2024-02-29  873  
de85488138247d Boris Brezillon 2024-02-29  874  	bo = panthor_vm_get_bo_for_va(group->vm,
de85488138247d Boris Brezillon 2024-02-29  875  				      queue->syncwait.gpu_va,
de85488138247d Boris Brezillon 2024-02-29  876  				      &queue->syncwait.offset);
de85488138247d Boris Brezillon 2024-02-29 @877  	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
de85488138247d Boris Brezillon 2024-02-29  878  		goto err_put_syncwait_obj;
de85488138247d Boris Brezillon 2024-02-29  879  
de85488138247d Boris Brezillon 2024-02-29  880  	queue->syncwait.obj = &bo->base.base;
8f5c4871a014cf Dmitry Osipenko 2025-03-23  881  	ret = drm_gem_vmap(queue->syncwait.obj, &map);
de85488138247d Boris Brezillon 2024-02-29  882  	if (drm_WARN_ON(&ptdev->base, ret))
de85488138247d Boris Brezillon 2024-02-29  883  		goto err_put_syncwait_obj;
de85488138247d Boris Brezillon 2024-02-29  884  
de85488138247d Boris Brezillon 2024-02-29  885  	queue->syncwait.kmap = map.vaddr;
de85488138247d Boris Brezillon 2024-02-29  886  	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
de85488138247d Boris Brezillon 2024-02-29  887  		goto err_put_syncwait_obj;
de85488138247d Boris Brezillon 2024-02-29  888  
de85488138247d Boris Brezillon 2024-02-29  889  	return queue->syncwait.kmap + queue->syncwait.offset;
de85488138247d Boris Brezillon 2024-02-29  890  
de85488138247d Boris Brezillon 2024-02-29  891  err_put_syncwait_obj:
de85488138247d Boris Brezillon 2024-02-29  892  	panthor_queue_put_syncwait_obj(queue);
de85488138247d Boris Brezillon 2024-02-29  893  	return NULL;
de85488138247d Boris Brezillon 2024-02-29  894  }
de85488138247d Boris Brezillon 2024-02-29  895  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
