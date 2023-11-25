Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76F7F8BE4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 16:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AF010E043;
	Sat, 25 Nov 2023 15:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18C10E043
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700924493; x=1732460493;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bR4/NLnAkxO/N2pV3HU+9K7s8T/yX3HbmvNxu1UjHyc=;
 b=YahqxB7bU/onQJZmKcUktnqsL7BdpKhehXR3CJ+wh5TaVTNC0YMzTdhY
 swZtL2xJpq22AgaQp3KtNmAyM2NFbpHfiB9De46xXRHLQyBUUExMpTcho
 s+HPGStRzUN+j31FCFsw+lokZ2B6CbjfLrikYM2/GFONKD4VsW+EDAOy5
 UvZTzyChmKhzLzIeBInFkNW+uYXdmlu18bmlqzcnGPFakmJG0SxqLknU4
 VXquoiN9qTG50v8zJcBKeOczLTSz8bGeypnenM27xtskQtbwvF5dUnWN1
 DgULbMK3eR+z3XfaUQMoSlQckVQBYQammGdTgqxUaKoJLEwAuUhgwqHMm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377562196"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; d="scan'208";a="377562196"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2023 07:01:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="796829560"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; d="scan'208";a="796829560"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2023 07:01:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6u9w-00046u-0u;
 Sat, 25 Nov 2023 15:01:28 +0000
Date: Sat, 25 Nov 2023 23:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: [drm-misc:for-linux-next 2/3]
 drivers/gpu/drm/nouveau/nouveau_sched.c:21:34: error: use of undeclared
 identifier 'DRM_SCHED_PRIORITY_MIN'
Message-ID: <202311252109.WgbJsSkG-lkp@intel.com>
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
config: x86_64-randconfig-123-20231125 (https://download.01.org/0day-ci/archive/20231125/202311252109.WgbJsSkG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252109.WgbJsSkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252109.WgbJsSkG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_sched.c:21:34: error: use of undeclared identifier 'DRM_SCHED_PRIORITY_MIN'
           NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
                                           ^
   drivers/gpu/drm/nouveau/nouveau_sched.c:436:38: error: use of undeclared identifier 'DRM_SCHED_PRIORITY_MIN'
           ret = drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
                                               ^
   2 errors generated.


vim +/DRM_SCHED_PRIORITY_MIN +21 drivers/gpu/drm/nouveau/nouveau_sched.c

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
