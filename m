Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19B9ECE6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 15:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CBD10EB61;
	Wed, 11 Dec 2024 14:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4MeffNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E246A10EB63
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733926749; x=1765462749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n/bW5X2P50IWGPskV8bddp7mr3+Mz84TOOqK8/Bw/oE=;
 b=N4MeffNGAJ+7FHMG5h6+j9JenskxqOhi4AYNZyvzVz+/IVwm+qY/Rtwb
 zuvibSyvJNREreHMSKIGpeT6/s9mu+J1dP99pgKbK/C4FUTL2uMTAdxST
 kpjJJeeO63r8o3uoGrRRolKPsByOw6VnLM1tdaal6aQTFc/Hlc4tfFEZY
 NzWCWAyF3xkKstES3SfmVpf4CVuKm38C/cr1CMhZGpRLgxzRPhb9HVSuy
 svfvxK5C+Vo77l5hNa4XYy9tKoiNXTvjX9KT13KPsCkJj4qBiQn09IOeK
 zRLrG5PC187i+CP2WOdHvDqMGnuCglgqlUEy6vNr/ydHMtMNd6ILvgAjU Q==;
X-CSE-ConnectionGUID: z1VY2UMERYKAfZocKlRdXQ==
X-CSE-MsgGUID: vVUYEloySxyYi11OKP7VaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38239168"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38239168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 06:19:09 -0800
X-CSE-ConnectionGUID: V+dO8e6fQuaP7J/uGnbsQg==
X-CSE-MsgGUID: 0Hp/6ujnREedJDCTms2R+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95885459"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 11 Dec 2024 06:19:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tLNYO-0006jh-1F;
 Wed, 11 Dec 2024 14:19:04 +0000
Date: Wed, 11 Dec 2024 22:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Message-ID: <202412112135.pzFeIjEo-lkp@intel.com>
References: <20241210142329.660801-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210142329.660801-2-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus drm/drm-next drm-exynos/exynos-drm-next linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Fix-recursive-dependencies-wrt-BACKLIGHT_CLASS_DEVICE/20241210-222618
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241210142329.660801-2-tzimmermann%40suse.de
patch subject: [PATCH 1/3] fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20241211/202412112135.pzFeIjEo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412112135.pzFeIjEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412112135.pzFeIjEo-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/video/fbdev/aty/radeon_backlight.o: in function `radeonfb_bl_init':
>> radeon_backlight.c:(.text+0x424): undefined reference to `backlight_device_register'
   loongarch64-linux-ld: drivers/video/fbdev/aty/radeon_backlight.o: in function `radeonfb_bl_exit':
>> radeon_backlight.c:(.text+0x560): undefined reference to `backlight_device_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
