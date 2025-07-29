Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B9B15524
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 00:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED87010E33E;
	Tue, 29 Jul 2025 22:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYdUiTGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528710E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753827315; x=1785363315;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qE1irq/pkCQwmhZPfMF3CXokwHdwGrZidyftnMHCe8I=;
 b=NYdUiTGhwcEPA8ly98XQHOoP+U5kEvz33POViPfQCXzeGuERlbYT8+DD
 hhdX5Xo3mt3SF5TjapF0K4cswRLchwUwsH3YE8Dxtdoqe0M8Fy7WEvLoh
 DQiMrTCl8+neds7xYZU6ULR2ZqeSTiq0x1hMFrMkO9m30Ui9rn02p57SI
 WV+NOKpELXZuqyt5SyWc1fbcFBSLDa1h1JZQ7WScKZ8/2gQ6VEqk+8d3p
 k+oLF561geIGjyQaY99YZbW5vtR5QrzwSJXBpgSCYuMdWuEGTTXo2vigR
 zateCyRD2Q+E9BXmyZhN+A+vgeRrWnmmfIqPSU5aj4Ac5hagHpI1A6kyh A==;
X-CSE-ConnectionGUID: /Y8UQ673T2qw93B5kn3pKA==
X-CSE-MsgGUID: CjQk13o6RLOX6f3xk5X4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55325438"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55325438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 15:15:15 -0700
X-CSE-ConnectionGUID: FPF3SlkNRIy0/qGZEhLtig==
X-CSE-MsgGUID: +CUeqjg2ROGcCmtrwDNOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167028736"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 15:15:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugsbH-0001jP-2M;
 Tue, 29 Jul 2025 22:15:11 +0000
Date: Wed, 30 Jul 2025 06:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [drm-exynos:exynos-drm-misc-next 1286/1301]
 drivers/accel/rocket/rocket_job.c:394:1: warning: control reaches end of
 non-void function
Message-ID: <202507300648.T4M5aAzS-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250730/202507300648.T4M5aAzS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300648.T4M5aAzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300648.T4M5aAzS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/rocket/rocket_job.c: In function 'rocket_job_timedout':
   drivers/accel/rocket/rocket_job.c:393:16: error: 'DRM_GPU_SCHED_STAT_NOMINAL' undeclared (first use in this function); did you mean 'DRM_GPU_SCHED_STAT_NO_HANG'?
     393 |         return DRM_GPU_SCHED_STAT_NOMINAL;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                DRM_GPU_SCHED_STAT_NO_HANG
   drivers/accel/rocket/rocket_job.c:393:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/accel/rocket/rocket_job.c: In function 'rocket_ioctl_submit_job':
   drivers/accel/rocket/rocket_job.c:553:15: error: too few arguments to function 'drm_sched_job_init'
     553 |         ret = drm_sched_job_init(&rjob->base,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/accel/rocket/rocket_core.h:7,
                    from drivers/accel/rocket/rocket_job.c:15:
   include/drm/gpu_scheduler.h:655:5: note: declared here
     655 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/accel/rocket/rocket_job.c: In function 'rocket_job_timedout':
>> drivers/accel/rocket/rocket_job.c:394:1: warning: control reaches end of non-void function [-Wreturn-type]
     394 | }
         | ^


vim +394 drivers/accel/rocket/rocket_job.c

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
   393		return DRM_GPU_SCHED_STAT_NOMINAL;
 > 394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
