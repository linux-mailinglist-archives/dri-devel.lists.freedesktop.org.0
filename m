Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452F692386
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3007510E072;
	Fri, 10 Feb 2023 16:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CD610E072
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676047243; x=1707583243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RUZgZBx3oQiMxDCthkthnTbvBLMr0fJ2Gimhu2vEwQs=;
 b=A7iJTqUizJ/aYBT3tsBeWLuSShXwvZFUeS/i2yug76qlQl2ZP0GpeImW
 cpxcaB4sTjiPLAqtl7RVZfwl10iANF3HlyZ6Y2W7kFdpimdazrPYgQwql
 Iop/PASHrfMtWhsd7tANiuV3J3UVuFmvFRMO59NiNl/1AK8sSeMVgqB5T
 ZLb1gx94biPAsbRo1zrfZNTArlawAjYd9wz72zi92JCvLtSZQjkPP0XfD
 BFGAiRC2mwZWU7rSfssdUtxt4Mmiqml7yxaO6TWxYnOWXDgZGi6xzoDy3
 KECHg77qkdz23GhznY9nLw+97SnpJqhEL+DNXwt6aHuppoFDbZJcGVK06 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416685950"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="416685950"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 08:40:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="617939668"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="617939668"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 10 Feb 2023 08:40:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pQWS0-0005ub-0E;
 Fri, 10 Feb 2023 16:40:40 +0000
Date: Sat, 11 Feb 2023 00:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/v3d: New debugfs end-points to query GPU usage stats.
Message-ID: <202302110040.uoXcpWUN-lkp@intel.com>
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
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jose,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-Maria-Casanova-Crespo/drm-v3d-New-debugfs-end-points-to-query-GPU-usage-stats/20230210-223726
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230210143421.1879915-1-jmcasanova%40igalia.com
patch subject: [PATCH] drm/v3d: New debugfs end-points to query GPU usage stats.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302110040.uoXcpWUN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/890feddd5e794bae0b486a18c0b905c78309d445
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jose-Maria-Casanova-Crespo/drm-v3d-New-debugfs-end-points-to-query-GPU-usage-stats/20230210-223726
        git checkout 890feddd5e794bae0b486a18c0b905c78309d445
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110040.uoXcpWUN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/v3d/v3d_sched.c:140:1: warning: no previous prototype for 'v3d_sched_stats_add_job' [-Wmissing-prototypes]
     140 | v3d_sched_stats_add_job(struct v3d_queue_stats *queue_stats,
         | ^~~~~~~~~~~~~~~~~~~~~~~


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
