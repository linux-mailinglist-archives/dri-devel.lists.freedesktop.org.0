Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760657F8AD7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 13:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C8310E12B;
	Sat, 25 Nov 2023 12:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4499A10E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700916522; x=1732452522;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=49UF7quVFWoOmF1nI/9pA/70ajHVZqDe5eIOSq+0XC0=;
 b=mG5jWGss5JMcK7BCXR3Iopwx61J+Q14snlHWUu6m3KQTBbqb7OX3M/rn
 qiB9K3yULwkLtiFzJhAimOr0Ha7WCt8UvP/9fri9rn3H2VHVAHNy36c1G
 cJuWXjz6dTU06qXvZGzpv8w76A/EF1ZNk1SfaBTVSVf2buXImQZMGi4Vs
 tdnJ9eeBo2Uz5AlM6GfZDYKUfLgRe1ViuXGUADwCuNQbbw+BPOzzmgpRr
 7CVvpB0rA1tElj18lLLLbPGnddtxi9c3mcihyd2TbgcJ2e0w8wWOWJam1
 PN89YO8RxN4mJrpbZwJXTxeg17hYxnNKd1Ez/cUBjmRcn9Qyz7EE9w3Ik Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5745031"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="5745031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2023 04:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9363874"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 04:48:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6s5O-0003yk-0I;
 Sat, 25 Nov 2023 12:48:38 +0000
Date: Sat, 25 Nov 2023 20:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: [drm-misc:for-linux-next 2/3]
 drivers/gpu/drm/nouveau/nouveau_sched.c:21:34: error:
 'DRM_SCHED_PRIORITY_MIN' undeclared here (not in a function); did you mean
 'DRM_SCHED_PRIORITY_HIGH'?
Message-ID: <202311251951.TDzBeR5F-lkp@intel.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luben,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   38f922a563aac3148ac73e73689805917f034cb5
commit: fe375c74806dbd30b00ec038a80a5b7bf4653ab7 [2/3] drm/sched: Rename priority MIN to LOW
config: i386-buildonly-randconfig-001-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251951.TDzBeR5F-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251951.TDzBeR5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251951.TDzBeR5F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_sched.c:21:34: error: 'DRM_SCHED_PRIORITY_MIN' undeclared here (not in a function); did you mean 'DRM_SCHED_PRIORITY_HIGH'?
      21 |  NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                  DRM_SCHED_PRIORITY_HIGH


vim +21 drivers/gpu/drm/nouveau/nouveau_sched.c

b88baab828713c Danilo Krummrich 2023-08-04  16  
5f03a507b29e44 Danilo Krummrich 2023-11-14  17  /* Starts at 0, since the DRM scheduler interprets those parameters as (initial)
5f03a507b29e44 Danilo Krummrich 2023-11-14  18   * index to the run-queue array.
5f03a507b29e44 Danilo Krummrich 2023-11-14  19   */
5f03a507b29e44 Danilo Krummrich 2023-11-14  20  enum nouveau_sched_priority {
5f03a507b29e44 Danilo Krummrich 2023-11-14 @21  	NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
5f03a507b29e44 Danilo Krummrich 2023-11-14  22  	NOUVEAU_SCHED_PRIORITY_COUNT,
5f03a507b29e44 Danilo Krummrich 2023-11-14  23  };
5f03a507b29e44 Danilo Krummrich 2023-11-14  24  

:::::: The code at line 21 was first introduced by commit
:::::: 5f03a507b29e44a848f315c7240c19894dd8be4f drm/nouveau: implement 1:1 scheduler - entity relationship

:::::: TO: Danilo Krummrich <dakr@redhat.com>
:::::: CC: Danilo Krummrich <dakr@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
