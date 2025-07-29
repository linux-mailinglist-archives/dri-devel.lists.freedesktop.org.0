Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF40B1550B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 00:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2343210E32D;
	Tue, 29 Jul 2025 22:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1Vk+a50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECF410E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753826655; x=1785362655;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Yj6Uw7XZYwabKay4EUz5CpSYhnTflDXam2A4Y3mNxvM=;
 b=R1Vk+a50/Q3YeUYQv9cb194j0Vk6VrJwIuFIh/92EKaLHHrs/lOSg+aj
 ns/tn8K5YDA4Go+Z3LKE+rJnqhX22KmazbkbfMhGtcg4cpMlEoPIUAkgm
 Syh0srVnhK4lR5oG+FXlccK/Mo5JoAjzYJw8+QH1EpsWHDJGAAWhvqz5b
 ZGcOTaNtpiDZ9Uy/KNX+e9huzR0e95CRW2X+nosK4ASZLQ4uBTs9rx6rw
 XW6SZSeLVdSgPIYFM/IVuF8dqre8ba5FxPSvydO98ETKhHi0TLD/9nyDC
 Cx2dv/VMcKoG/7rrt5Vh7NdqNlLUd4b1yMZxDG8ztrFntoCHlq9ZwEcdl A==;
X-CSE-ConnectionGUID: FR3SKfHXSvGqIncjxkdRWw==
X-CSE-MsgGUID: w9Zsav9kTYOiWuwrbfGZWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55324821"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55324821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 15:04:14 -0700
X-CSE-ConnectionGUID: I8pQO0sUQyGv0wBnn4tHIA==
X-CSE-MsgGUID: k/A3GetoQxSTTFezBkx0dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167026945"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 15:04:12 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugsQc-0001jH-1w;
 Tue, 29 Jul 2025 22:04:10 +0000
Date: Wed, 30 Jul 2025 06:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [drm-exynos:exynos-drm-misc-next 1286/1301]
 drivers/accel/rocket/rocket_job.c:393:16: error:
 'DRM_GPU_SCHED_STAT_NOMINAL' undeclared; did you mean
 'DRM_GPU_SCHED_STAT_NO_HANG'?
Message-ID: <202507300607.O0gDZwRJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-misc-next
head:   01ac6e4e53b6351df42c97d217b0d2dbeef5c917
commit: 0810d5ad88a18f1e6d549853a388ad0316f74e36 [1286/1301] accel/rocket: Add job submission IOCTL
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250730/202507300607.O0gDZwRJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300607.O0gDZwRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300607.O0gDZwRJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/rocket/rocket_job.c: In function 'rocket_job_timedout':
>> drivers/accel/rocket/rocket_job.c:393:16: error: 'DRM_GPU_SCHED_STAT_NOMINAL' undeclared (first use in this function); did you mean 'DRM_GPU_SCHED_STAT_NO_HANG'?
     393 |         return DRM_GPU_SCHED_STAT_NOMINAL;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                DRM_GPU_SCHED_STAT_NO_HANG
   drivers/accel/rocket/rocket_job.c:393:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/accel/rocket/rocket_job.c: In function 'rocket_ioctl_submit_job':
>> drivers/accel/rocket/rocket_job.c:553:15: error: too few arguments to function 'drm_sched_job_init'; expected 5, have 4
     553 |         ret = drm_sched_job_init(&rjob->base,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/accel/rocket/rocket_core.h:7,
                    from drivers/accel/rocket/rocket_job.c:15:
   include/drm/gpu_scheduler.h:655:5: note: declared here
     655 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~


vim +393 drivers/accel/rocket/rocket_job.c

   381	
   382	static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
   383	{
   384		struct rocket_job *job = to_rocket_job(sched_job);
   385		struct rocket_device *rdev = job->rdev;
   386		struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
   387	
   388		dev_err(core->dev, "NPU job timed out");
   389	
   390		atomic_set(&core->reset.pending, 1);
   391		rocket_reset(core, sched_job);
   392	
 > 393		return DRM_GPU_SCHED_STAT_NOMINAL;
   394	}
   395	
   396	static void rocket_reset_work(struct work_struct *work)
   397	{
   398		struct rocket_core *core;
   399	
   400		core = container_of(work, struct rocket_core, reset.work);
   401		rocket_reset(core, NULL);
   402	}
   403	
   404	static const struct drm_sched_backend_ops rocket_sched_ops = {
   405		.run_job = rocket_job_run,
   406		.timedout_job = rocket_job_timedout,
   407		.free_job = rocket_job_free
   408	};
   409	
   410	static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
   411	{
   412		struct rocket_core *core = data;
   413	
   414		rocket_job_handle_irq(core);
   415	
   416		return IRQ_HANDLED;
   417	}
   418	
   419	static irqreturn_t rocket_job_irq_handler(int irq, void *data)
   420	{
   421		struct rocket_core *core = data;
   422		u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
   423	
   424		WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
   425		WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
   426	
   427		if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
   428		      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
   429			return IRQ_NONE;
   430	
   431		rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
   432	
   433		return IRQ_WAKE_THREAD;
   434	}
   435	
   436	int rocket_job_init(struct rocket_core *core)
   437	{
   438		struct drm_sched_init_args args = {
   439			.ops = &rocket_sched_ops,
   440			.num_rqs = DRM_SCHED_PRIORITY_COUNT,
   441			.credit_limit = 1,
   442			.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
   443			.name = dev_name(core->dev),
   444			.dev = core->dev,
   445		};
   446		int ret;
   447	
   448		INIT_WORK(&core->reset.work, rocket_reset_work);
   449		spin_lock_init(&core->fence_lock);
   450		mutex_init(&core->job_lock);
   451	
   452		core->irq = platform_get_irq(to_platform_device(core->dev), 0);
   453		if (core->irq < 0)
   454			return core->irq;
   455	
   456		ret = devm_request_threaded_irq(core->dev, core->irq,
   457						rocket_job_irq_handler,
   458						rocket_job_irq_handler_thread,
   459						IRQF_SHARED, dev_name(core->dev),
   460						core);
   461		if (ret) {
   462			dev_err(core->dev, "failed to request job irq");
   463			return ret;
   464		}
   465	
   466		core->reset.wq = alloc_ordered_workqueue("rocket-reset-%d", 0, core->index);
   467		if (!core->reset.wq)
   468			return -ENOMEM;
   469	
   470		core->fence_context = dma_fence_context_alloc(1);
   471	
   472		args.timeout_wq = core->reset.wq;
   473		ret = drm_sched_init(&core->sched, &args);
   474		if (ret) {
   475			dev_err(core->dev, "Failed to create scheduler: %d.", ret);
   476			goto err_sched;
   477		}
   478	
   479		return 0;
   480	
   481	err_sched:
   482		drm_sched_fini(&core->sched);
   483	
   484		destroy_workqueue(core->reset.wq);
   485		return ret;
   486	}
   487	
   488	void rocket_job_fini(struct rocket_core *core)
   489	{
   490		drm_sched_fini(&core->sched);
   491	
   492		cancel_work_sync(&core->reset.work);
   493		destroy_workqueue(core->reset.wq);
   494	}
   495	
   496	int rocket_job_open(struct rocket_file_priv *rocket_priv)
   497	{
   498		struct rocket_device *rdev = rocket_priv->rdev;
   499		struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores, sizeof(scheds),
   500								  GFP_KERNEL);
   501		unsigned int core;
   502		int ret;
   503	
   504		for (core = 0; core < rdev->num_cores; core++)
   505			scheds[core] = &rdev->cores[core].sched;
   506	
   507		ret = drm_sched_entity_init(&rocket_priv->sched_entity,
   508					    DRM_SCHED_PRIORITY_NORMAL,
   509					    scheds,
   510					    rdev->num_cores, NULL);
   511		if (WARN_ON(ret))
   512			return ret;
   513	
   514		return 0;
   515	}
   516	
   517	void rocket_job_close(struct rocket_file_priv *rocket_priv)
   518	{
   519		struct drm_sched_entity *entity = &rocket_priv->sched_entity;
   520	
   521		kfree(entity->sched_list);
   522		drm_sched_entity_destroy(entity);
   523	}
   524	
   525	int rocket_job_is_idle(struct rocket_core *core)
   526	{
   527		/* If there are any jobs in this HW queue, we're not idle */
   528		if (atomic_read(&core->sched.credit_count))
   529			return false;
   530	
   531		return true;
   532	}
   533	
   534	static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
   535					   struct drm_rocket_job *job)
   536	{
   537		struct rocket_device *rdev = to_rocket_device(dev);
   538		struct rocket_file_priv *file_priv = file->driver_priv;
   539		struct rocket_job *rjob = NULL;
   540		int ret = 0;
   541	
   542		if (job->task_count == 0)
   543			return -EINVAL;
   544	
   545		rjob = kzalloc(sizeof(*rjob), GFP_KERNEL);
   546		if (!rjob)
   547			return -ENOMEM;
   548	
   549		kref_init(&rjob->refcount);
   550	
   551		rjob->rdev = rdev;
   552	
 > 553		ret = drm_sched_job_init(&rjob->base,
   554					 &file_priv->sched_entity,
   555					 1, NULL);
   556		if (ret)
   557			goto out_put_job;
   558	
   559		ret = rocket_copy_tasks(dev, file, job, rjob);
   560		if (ret)
   561			goto out_cleanup_job;
   562	
   563		ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
   564					     job->in_bo_handle_count, &rjob->in_bos);
   565		if (ret)
   566			goto out_cleanup_job;
   567	
   568		rjob->in_bo_count = job->in_bo_handle_count;
   569	
   570		ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
   571					     job->out_bo_handle_count, &rjob->out_bos);
   572		if (ret)
   573			goto out_cleanup_job;
   574	
   575		rjob->out_bo_count = job->out_bo_handle_count;
   576	
   577		rjob->domain = rocket_iommu_domain_get(file_priv);
   578	
   579		ret = rocket_job_push(rjob);
   580		if (ret)
   581			goto out_cleanup_job;
   582	
   583	out_cleanup_job:
   584		if (ret)
   585			drm_sched_job_cleanup(&rjob->base);
   586	out_put_job:
   587		rocket_job_put(rjob);
   588	
   589		return ret;
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
