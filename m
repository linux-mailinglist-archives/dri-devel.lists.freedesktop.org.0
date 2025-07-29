Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E30B1546E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFBA10E091;
	Tue, 29 Jul 2025 20:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="disDFIUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CD10E091
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753822328; x=1785358328;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xZnDqYfZp++x0/DN0UUEZ5XM4Gkj0oem8RcYxEurlqY=;
 b=disDFIUj1VweESXROCp0T4k0tGk4Lutdo80yIBj3cSITJdEHqXRb1q2s
 lWT88viwRWHuE7QdU6YuH3ZvLp0HMaGRs6DQNt3t0LHqu63ktR2ZDIOXq
 PrntQDsq4iWH1Ulw9/VlFn7CISuWFAtE6FnTXKQXlYCdIujGjHoanWtvz
 CmgCvlsNXipU0Yx/e+g2aYSlx99RlA9ob3RJ6+BdgRzXZ85RVrKdLnNo+
 lbnQxApSgVAEisx416ov0kXwJuO7jfkYcsrJlbKnRDI/byeP5BRymKSPC
 M+R3SR19fBJA8e5SwOGqjNHhiAeDzASqiRuqLf25GQdva7cfxlYfdMAv1 Q==;
X-CSE-ConnectionGUID: MeV9LWAzToiw/ZLrc9FMBA==
X-CSE-MsgGUID: 8Phf1b0vT6WdaGNv+Czrww==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66385334"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66385334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 13:52:08 -0700
X-CSE-ConnectionGUID: rPwT96cuTdiNZ2LnrfqRBg==
X-CSE-MsgGUID: eRbw2ZOIR5qkbe1bHZEo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162387011"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2025 13:52:06 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugrIq-0001fv-1l;
 Tue, 29 Jul 2025 20:52:04 +0000
Date: Wed, 30 Jul 2025 04:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>
Subject: [drm-exynos:exynos-drm-misc-next 1284/1301]
 drivers/accel/rocket/rocket_drv.c:235:31: error: 'rocket_pm_ops' undeclared
 here (not in a function); did you mean 'rocket_probe'?
Message-ID: <202507300402.elg6gqoj-lkp@intel.com>
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
commit: ed98261b41687323ffa02ca20fef1e60b38fd1aa [1284/1301] accel/rocket: Add a new driver for Rockchip's NPU
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250730/202507300402.elg6gqoj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300402.elg6gqoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300402.elg6gqoj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:36,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/drm/drm_file.h:34,
                    from include/drm/drm_accel.h:11,
                    from drivers/accel/rocket/rocket_drv.c:4:
>> drivers/accel/rocket/rocket_drv.c:235:31: error: 'rocket_pm_ops' undeclared here (not in a function); did you mean 'rocket_probe'?
     235 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                               ^~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/accel/rocket/rocket_drv.c:235:23: note: in expansion of macro 'pm_ptr'
     235 |                 .pm = pm_ptr(&rocket_pm_ops),
         |                       ^~~~~~


vim +235 drivers/accel/rocket/rocket_drv.c

   229	
   230	static struct platform_driver rocket_driver = {
   231		.probe = rocket_probe,
   232		.remove = rocket_remove,
   233		.driver	 = {
   234			.name = "rocket",
 > 235			.pm = pm_ptr(&rocket_pm_ops),
   236			.of_match_table = dt_match,
   237		},
   238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
