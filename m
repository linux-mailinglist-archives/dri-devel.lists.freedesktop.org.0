Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F007598921D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 02:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448D310E071;
	Sun, 29 Sep 2024 00:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgGtaTUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166EC10E071
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 00:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727569568; x=1759105568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EwYvhotwgMeB4AfN253GUIcoDG6KLpKAA6s5FiZ2mT4=;
 b=BgGtaTUnaLDELYVrjZHozl35WG3eZTiUr+Kko8bIIck/1WpCMS9MtfOE
 810MOM8+yzu/RqYRUDhMy419p0r+ZR/x0T+VCqsEozXD93nxX6pcdk6uE
 e4CtrxG/d2I4WRPoR3T14SEgItxf+mXq3dma8oe6+FJpTIIWrImsGDMV2
 LVJvdTggSUNJHaSA4Ra0wX6YUgzwJLV/+BqQFPYKrrv+hhQHVTA9zsalt
 8wU4L9N52ncF0QfraXfx3u4GzRScjoTZB6QUo7Ek56JtnlLNWnYQya/lh
 NkE59KXgAk6x/kzyQuTKOgLjBJ5u0K7P/KQZaKRxAml71OFVca5IfBUKw w==;
X-CSE-ConnectionGUID: t6QUykoFRiOOjPI+u9hZ1w==
X-CSE-MsgGUID: KmWJMjDxQwqrfDkHQx2gVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26489610"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="26489610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 17:26:07 -0700
X-CSE-ConnectionGUID: IJEpIeM8S9G5HFY76Z8rCQ==
X-CSE-MsgGUID: w7lS5/EoSa6dINB4l2OmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="77427612"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 17:26:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1suhlB-000NmF-1f;
 Sun, 29 Sep 2024 00:26:01 +0000
Date: Sun, 29 Sep 2024 08:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
Message-ID: <202409291048.zLqDeqpO-lkp@intel.com>
References: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
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

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240927]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-introduce-job-cycle-and-timestamp-accounting/20240924-071018
base:   linus/master
patch link:    https://lore.kernel.org/r/20240923230912.2207320-4-adrian.larumbe%40collabora.com
patch subject: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
config: arm-randconfig-002-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291048.zLqDeqpO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291048.zLqDeqpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291048.zLqDeqpO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/gpu/drm/panthor/panthor_drv.c:7:
   drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_gpu_show_fdinfo':
>> drivers/gpu/drm/panthor/panthor_drv.c:1389:45: error: implicit declaration of function 'arch_timer_get_cntfrq' [-Wimplicit-function-declaration]
    1389 |                                             arch_timer_get_cntfrq()));
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:40:39: note: in definition of macro 'DIV_ROUND_DOWN_ULL'
      40 |         ({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
         |                                       ^~
   drivers/gpu/drm/panthor/panthor_drv.c:1388:28: note: in expansion of macro 'DIV_ROUND_UP_ULL'
    1388 |                            DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
         |                            ^~~~~~~~~~~~~~~~


vim +/arch_timer_get_cntfrq +1389 drivers/gpu/drm/panthor/panthor_drv.c

  1377	
  1378	static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
  1379					    struct panthor_file *pfile,
  1380					    struct drm_printer *p)
  1381	{
  1382		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
  1383			panthor_fdinfo_gather_group_samples(pfile);
  1384	
  1385		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
  1386	#ifdef CONFIG_ARM_ARCH_TIMER
  1387			drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
  1388				   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> 1389						    arch_timer_get_cntfrq()));
  1390	#endif
  1391		}
  1392		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
  1393			drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
  1394	
  1395		drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
  1396		drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
  1397	}
  1398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
