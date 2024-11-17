Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F19D01E4
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 03:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8994F10E03C;
	Sun, 17 Nov 2024 02:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxytppLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF35210E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 02:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731811423; x=1763347423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xl/LUcVrd6dmSIr6nGl/n2X7RZ7jp9nSo28XTx5Qzak=;
 b=hxytppLEWtX5mXf+BcPmRFjepmwRQGUP85WdiDLN/+8jvUy/aClcVbpA
 pKQe3D5j070+PiOmouS2yNMQriqc28NUMfAlu5JFnZGdXcKZO2jb4XfWA
 Zd3mPwj3dj7CYXrkECWlhwFlBb/nIijTS2MEcp54rMfXX5tE+w0N9rNc/
 CbUmlEqoXE2uzq9IODKeHTqxlA09nXJ+Fmb/i+8FAd6fwrHjARS6+66Zd
 vKqdCnowWLg3GpAdCedtWca7HnMNrZyuwJJZhgRpBvJ167TdFF/UcjbT3
 AqVaBFZHhmM73Kc+jffgSGmTKXE8nnUkGeohgCBRhDfFcI9Eh/v0tQmEZ w==;
X-CSE-ConnectionGUID: d7KZy1XDQsSI9OIFEfzZqQ==
X-CSE-MsgGUID: wAst45gsQPWDETuV1psrdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42434168"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="42434168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2024 18:43:42 -0800
X-CSE-ConnectionGUID: wGCL00g4SUOclNMxZ0Tiww==
X-CSE-MsgGUID: 0yg3kuyDSleNsOTORDEOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="93362302"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2024 18:43:35 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tCVG9-0001Ft-06;
 Sun, 17 Nov 2024 02:43:33 +0000
Date: Sun, 17 Nov 2024 10:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com, mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com, tvrtko.ursulin@igalia.com
Cc: oe-kbuild-all@lists.linux.dev,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v6 2/7] drm/sched: store the drm client_id in
 drm_sched_fence
Message-ID: <202411171023.eCuLAjlT-lkp@intel.com>
References: <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20241115]
[cannot apply to linus/master drm-misc/drm-misc-next v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-debugfs-output-client_id-in-in-drm_clients_info/20241114-180547
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241114100113.150647-3-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v6 2/7] drm/sched: store the drm client_id in drm_sched_fence
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411171023.eCuLAjlT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171023.eCuLAjlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171023.eCuLAjlT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_vm_bind_job_create':
>> drivers/gpu/drm/panthor/panthor_mmu.c:2472:15: error: too few arguments to function 'drm_sched_job_init'
    2472 |         ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/panthor/panthor_mmu.c:10:
   include/drm/gpu_scheduler.h:571:5: note: declared here
     571 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_job_create':
>> drivers/gpu/drm/panthor/panthor_sched.c:3727:15: error: too few arguments to function 'drm_sched_job_init'
    3727 |         ret = drm_sched_job_init(&job->base,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/panthor/panthor_sched.c:8:
   include/drm/gpu_scheduler.h:571:5: note: declared here
     571 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~


vim +/drm_sched_job_init +2472 drivers/gpu/drm/panthor/panthor_mmu.c

647810ec247641e Boris Brezillon 2024-02-29  2435  
647810ec247641e Boris Brezillon 2024-02-29  2436  /**
647810ec247641e Boris Brezillon 2024-02-29  2437   * panthor_vm_bind_job_create() - Create a VM_BIND job
647810ec247641e Boris Brezillon 2024-02-29  2438   * @file: File.
647810ec247641e Boris Brezillon 2024-02-29  2439   * @vm: VM targeted by the VM_BIND job.
647810ec247641e Boris Brezillon 2024-02-29  2440   * @op: VM operation data.
647810ec247641e Boris Brezillon 2024-02-29  2441   *
647810ec247641e Boris Brezillon 2024-02-29  2442   * Return: A valid pointer on success, an ERR_PTR() otherwise.
647810ec247641e Boris Brezillon 2024-02-29  2443   */
647810ec247641e Boris Brezillon 2024-02-29  2444  struct drm_sched_job *
647810ec247641e Boris Brezillon 2024-02-29  2445  panthor_vm_bind_job_create(struct drm_file *file,
647810ec247641e Boris Brezillon 2024-02-29  2446  			   struct panthor_vm *vm,
647810ec247641e Boris Brezillon 2024-02-29  2447  			   const struct drm_panthor_vm_bind_op *op)
647810ec247641e Boris Brezillon 2024-02-29  2448  {
647810ec247641e Boris Brezillon 2024-02-29  2449  	struct panthor_vm_bind_job *job;
647810ec247641e Boris Brezillon 2024-02-29  2450  	int ret;
647810ec247641e Boris Brezillon 2024-02-29  2451  
647810ec247641e Boris Brezillon 2024-02-29  2452  	if (!vm)
647810ec247641e Boris Brezillon 2024-02-29  2453  		return ERR_PTR(-EINVAL);
647810ec247641e Boris Brezillon 2024-02-29  2454  
647810ec247641e Boris Brezillon 2024-02-29  2455  	if (vm->destroyed || vm->unusable)
647810ec247641e Boris Brezillon 2024-02-29  2456  		return ERR_PTR(-EINVAL);
647810ec247641e Boris Brezillon 2024-02-29  2457  
647810ec247641e Boris Brezillon 2024-02-29  2458  	job = kzalloc(sizeof(*job), GFP_KERNEL);
647810ec247641e Boris Brezillon 2024-02-29  2459  	if (!job)
647810ec247641e Boris Brezillon 2024-02-29  2460  		return ERR_PTR(-ENOMEM);
647810ec247641e Boris Brezillon 2024-02-29  2461  
647810ec247641e Boris Brezillon 2024-02-29  2462  	ret = panthor_vm_bind_prepare_op_ctx(file, vm, op, &job->ctx);
647810ec247641e Boris Brezillon 2024-02-29  2463  	if (ret) {
647810ec247641e Boris Brezillon 2024-02-29  2464  		kfree(job);
647810ec247641e Boris Brezillon 2024-02-29  2465  		return ERR_PTR(ret);
647810ec247641e Boris Brezillon 2024-02-29  2466  	}
647810ec247641e Boris Brezillon 2024-02-29  2467  
647810ec247641e Boris Brezillon 2024-02-29  2468  	INIT_WORK(&job->cleanup_op_ctx_work, panthor_vm_bind_job_cleanup_op_ctx_work);
647810ec247641e Boris Brezillon 2024-02-29  2469  	kref_init(&job->refcount);
647810ec247641e Boris Brezillon 2024-02-29  2470  	job->vm = panthor_vm_get(vm);
647810ec247641e Boris Brezillon 2024-02-29  2471  
647810ec247641e Boris Brezillon 2024-02-29 @2472  	ret = drm_sched_job_init(&job->base, &vm->entity, 1, vm);
647810ec247641e Boris Brezillon 2024-02-29  2473  	if (ret)
647810ec247641e Boris Brezillon 2024-02-29  2474  		goto err_put_job;
647810ec247641e Boris Brezillon 2024-02-29  2475  
647810ec247641e Boris Brezillon 2024-02-29  2476  	return &job->base;
647810ec247641e Boris Brezillon 2024-02-29  2477  
647810ec247641e Boris Brezillon 2024-02-29  2478  err_put_job:
647810ec247641e Boris Brezillon 2024-02-29  2479  	panthor_vm_bind_job_put(&job->base);
647810ec247641e Boris Brezillon 2024-02-29  2480  	return ERR_PTR(ret);
647810ec247641e Boris Brezillon 2024-02-29  2481  }
647810ec247641e Boris Brezillon 2024-02-29  2482  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
