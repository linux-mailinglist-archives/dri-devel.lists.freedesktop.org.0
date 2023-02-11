Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BA692F31
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 08:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8910E121;
	Sat, 11 Feb 2023 07:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A6110E121
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676101685; x=1707637685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0bh2UKJYJLBhHtu24tSOZS3avHyLam90tgF7aQHJxoM=;
 b=MIVQn0L5wvHR8Nn1cy3/uOZ+r7y3zQnDvlR8WMB+nCebHFl+1r70UY9j
 3PROlWWVcL4PEc1kpS6qcYUVicvXp3kxtQ2Gld+JYT5u4k8wp0sKRV0Qs
 HppokBwhG03OSfZdsG0j3PmuGG7X+yeHvyRvvpGNnQCVRTMUWdpoUdunW
 p7w5wwwSKoujGdWiN/ZKMapeposPpFR8cdQ6rEmvmaf3e+ncfpPbVoTwt
 SHhqvQyf4h01UeqNsHOkohCGEoXjxLJFjKMsBZncpO47H3LL2F8xWoseC
 joPknSpC1NIOi9GhwRxxS6YHdLk7sItIFBpwOyxsGQH0V2kp5w9I3IjPX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310226573"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; d="scan'208";a="310226573"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 23:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="661638622"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; d="scan'208";a="661638622"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 10 Feb 2023 23:48:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pQkc4-0006L7-3C;
 Sat, 11 Feb 2023 07:48:01 +0000
Date: Sat, 11 Feb 2023 15:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/v3d: New debugfs end-points to query GPU usage stats.
Message-ID: <202302111549.NR71LTx9-lkp@intel.com>
References: <20230210143421.1879915-1-jmcasanova@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143421.1879915-1-jmcasanova@igalia.com>
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
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jose,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.2-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-Maria-Casanova-Crespo/drm-v3d-New-debugfs-end-points-to-query-GPU-usage-stats/20230210-223726
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230210143421.1879915-1-jmcasanova%40igalia.com
patch subject: [PATCH] drm/v3d: New debugfs end-points to query GPU usage stats.
config: hexagon-randconfig-r025-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111549.NR71LTx9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/890feddd5e794bae0b486a18c0b905c78309d445
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jose-Maria-Casanova-Crespo/drm-v3d-New-debugfs-end-points-to-query-GPU-usage-stats/20230210-223726
        git checkout 890feddd5e794bae0b486a18c0b905c78309d445
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/v3d/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111549.NR71LTx9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/v3d/v3d_sched.c:24:
   In file included from drivers/gpu/drm/v3d/v3d_drv.h:9:
   In file included from include/drm/drm_encoder.h:28:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/v3d/v3d_sched.c:24:
   In file included from drivers/gpu/drm/v3d/v3d_drv.h:9:
   In file included from include/drm/drm_encoder.h:28:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/v3d/v3d_sched.c:24:
   In file included from drivers/gpu/drm/v3d/v3d_drv.h:9:
   In file included from include/drm/drm_encoder.h:28:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/v3d/v3d_sched.c:140:1: warning: no previous prototype for function 'v3d_sched_stats_add_job' [-Wmissing-prototypes]
   v3d_sched_stats_add_job(struct v3d_queue_stats *queue_stats,
   ^
   drivers/gpu/drm/v3d/v3d_sched.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   7 warnings generated.


vim +/v3d_sched_stats_add_job +140 drivers/gpu/drm/v3d/v3d_sched.c

   134	
   135	/*
   136	 * Updates the queue usage adding the information of a new job that is
   137	 * about to be sent to the GPU to be executed.
   138	 */
   139	int
 > 140	v3d_sched_stats_add_job(struct v3d_queue_stats *queue_stats,
   141				struct drm_sched_job *sched_job)
   142	{
   143	
   144		struct v3d_queue_pid_stats *pid_stats = NULL;
   145		struct v3d_job *job = sched_job?to_v3d_job(sched_job):NULL;
   146		struct v3d_queue_pid_stats *cur;
   147		struct list_head *pid_stats_list = &queue_stats->pid_stats_list;
   148		int ret = 0;
   149	
   150		mutex_lock(&queue_stats->lock);
   151	
   152		/* Completion of previous job requires an update of its runtime */
   153		v3d_sched_stats_update(queue_stats);
   154	
   155		queue_stats->last_exec_start = local_clock();
   156		queue_stats->last_exec_end = 0;
   157		queue_stats->jobs_sent++;
   158		queue_stats->last_pid = job->client_pid;
   159	
   160		/* gpu usage stats by process are being collected */
   161		if (queue_stats->collect_pid_stats) {
   162			list_for_each_entry(cur, pid_stats_list, list) {
   163				if (cur->pid == job->client_pid) {
   164					pid_stats = cur;
   165					break;
   166				}
   167			}
   168			/* client pid_stats is moved to the head of the list. */
   169			if (pid_stats) {
   170				list_move(&pid_stats->list, pid_stats_list);
   171			} else {
   172				pid_stats = kzalloc(sizeof(struct v3d_queue_pid_stats),
   173						    GFP_KERNEL);
   174				if (!pid_stats) {
   175					ret = -ENOMEM;
   176					goto err_mem;
   177				}
   178				pid_stats->pid = job->client_pid;
   179				list_add(&pid_stats->list, pid_stats_list);
   180			}
   181			pid_stats->jobs_sent++;
   182			pid_stats->timeout_purge = jiffies + V3D_QUEUE_STATS_TIMEOUT;
   183		}
   184	
   185	err_mem:
   186		mutex_unlock(&queue_stats->lock);
   187		return ret;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
