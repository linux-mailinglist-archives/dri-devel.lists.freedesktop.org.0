Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D59D6889
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 11:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709B610E344;
	Sat, 23 Nov 2024 10:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVygJJJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FE410E1A0;
 Sat, 23 Nov 2024 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732356335; x=1763892335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VfFjtMVJJGAyXRv2MDPvzehn2J0t4usVdu6w1H6HT4o=;
 b=DVygJJJJQaBbMkZ72GkS6vDts++hwhXFLNLnJSu35JCFgcz8aiyWT/KR
 J8/Hw1YMyB3z8jgkhKEffEepYS3NJRnXxgenDJqNEJ0cX+uGvmdCC/H+I
 s0SBWSJT7U+BJc1X0mcowSwpMOGTADI5qbpE2I8GZk45oZ22CXNvi/Q1j
 7uTFqYUcff/bfmNDOXIIi4F0Ljxkekfj81YHRX3jJ+jPeqRA2SFkkZCTX
 Zu+o+V7Rdn3MhuUYsNQt/ntQiwsgyT+NZ1kXbylG7/GEEQ+U1y1a/+IFq
 0RXLNxfOdyqJ/+suiQfBAoF3brlUZ0wJU62vY8sB5eJzhZXce6FAIjLcY Q==;
X-CSE-ConnectionGUID: if5SDLfLQp2rOMG85j3K7g==
X-CSE-MsgGUID: bmSxtB1TQ9GC72yzoPvqyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="55016039"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; d="scan'208";a="55016039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2024 02:05:34 -0800
X-CSE-ConnectionGUID: hw0wb8yPRbu/4r9ZMEGp4w==
X-CSE-MsgGUID: mDTNnOiESrmz+mqlvhquBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; d="scan'208";a="114087048"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 23 Nov 2024 02:05:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tEn17-0004YV-05;
 Sat, 23 Nov 2024 10:05:29 +0000
Date: Sat, 23 Nov 2024 18:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Laitio <lamikr@gmail.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Hawking.Zhang@amd.com, sunil.khatri@amd.com, lijo.lazar@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ammdgpu fix for gfx1103 queue evict/restore crash
Message-ID: <202411231721.vBNjHNvr-lkp@intel.com>
References: <20241121195233.10679-1-lamikr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121195233.10679-1-lamikr@gmail.com>
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

Hi Mika,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip v6.12 next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Laitio/ammdgpu-fix-for-gfx1103-queue-evict-restore-crash/20241122-035602
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241121195233.10679-1-lamikr%40gmail.com
patch subject: [PATCH] ammdgpu fix for gfx1103 queue evict/restore crash
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411231721.vBNjHNvr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231721.vBNjHNvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231721.vBNjHNvr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c: In function 'restore_process_queues_cpsch':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:1354:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
    1354 | out_unlock:
         | ^~~~~~~~~~


vim +/out_unlock +1354 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c

  1292	
  1293	static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
  1294						struct qcm_process_device *qpd)
  1295	{
  1296		struct queue *q;
  1297		struct device *dev = dqm->dev->adev->dev;
  1298		struct kfd_process_device *pdd;
  1299		uint64_t eviction_duration;
  1300		int retval = 0;
  1301	
  1302		// gfx1103 APU fails to remove the queue usually after 10-50 attempts
  1303		if (dqm->dev->adev->flags & AMD_IS_APU)
  1304			goto out;
  1305		pdd = qpd_to_pdd(qpd);
  1306	
  1307		dqm_lock(dqm);
  1308		if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
  1309			goto out;
  1310		if (qpd->evicted > 1) { /* ref count still > 0, decrement & quit */
  1311			qpd->evicted--;
  1312			goto out;
  1313		}
  1314	
  1315		/* The debugger creates processes that temporarily have not acquired
  1316		 * all VMs for all devices and has no VMs itself.
  1317		 * Skip queue restore on process restore.
  1318		 */
  1319		if (!pdd->drm_priv)
  1320			goto vm_not_acquired;
  1321	
  1322		pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
  1323				    pdd->process->pasid);
  1324	
  1325		/* Update PD Base in QPD */
  1326		qpd->page_table_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
  1327		pr_debug("Updated PD address to 0x%llx\n", qpd->page_table_base);
  1328	
  1329		/* activate all active queues on the qpd */
  1330		list_for_each_entry(q, &qpd->queues_list, list) {
  1331			q->properties.is_evicted = false;
  1332			if (!QUEUE_IS_ACTIVE(q->properties))
  1333				continue;
  1334	
  1335			q->properties.is_active = true;
  1336			increment_queue_count(dqm, &pdd->qpd, q);
  1337	
  1338			if (dqm->dev->kfd->shared_resources.enable_mes) {
  1339				retval = add_queue_mes(dqm, q, qpd);
  1340				if (retval) {
  1341					dev_err(dev, "Failed to restore queue %d\n",
  1342						q->properties.queue_id);
  1343					goto out;
  1344				}
  1345			}
  1346		}
  1347		if (!dqm->dev->kfd->shared_resources.enable_mes)
  1348			retval = execute_queues_cpsch(dqm,
  1349						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
  1350		eviction_duration = get_jiffies_64() - pdd->last_evict_timestamp;
  1351		atomic64_add(eviction_duration, &pdd->evict_duration_counter);
  1352	vm_not_acquired:
  1353		qpd->evicted = 0;
> 1354	out_unlock:
  1355		dqm_unlock(dqm);
  1356	out:
  1357		return retval;
  1358	}
  1359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
