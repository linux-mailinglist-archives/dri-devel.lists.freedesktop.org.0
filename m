Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85991CA1867
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 21:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D680C10E18B;
	Wed,  3 Dec 2025 20:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrW0Uydh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9D10E18B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764792693; x=1796328693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9IzenvfKKzIT8fJcRz2w7iqop5ypfGDzeiyLtYKHFig=;
 b=XrW0UydhADzKO53VsayuM3Y/CifQAU6GQYGGnI5pjrv2+IHgCSbs3XzD
 PoCiYUT/Yse0ORdJNc26n7Yq/lWQacK8szEQCDmovmaPLCJ85gqbrNjFO
 QJCuQw569NafctZZshpcwpd7KUcL/QBlH0achkKgOH4U0Dgvr8uhjsKzk
 0ZQlZD63yoaS4OVSZUEzbrgMZWq+DWTSaFdEDrfE7JrOvPdSixPjP6n/O
 heVTbgtahEFQhEKDZQ3m99QEZ7IQtqLu0RfuEr1c9zLRPCqDQCaJEvzgO
 0tyYhvAXYPjKIufih4qp/VolPCL0jl9/UYz6KYV/MJgtC7yVL55KZqEgn w==;
X-CSE-ConnectionGUID: 98+854FGS7uKvCtGSc4Wcw==
X-CSE-MsgGUID: xcnHwlM8RdGTOfD6bfscLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92278915"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="92278915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 12:11:33 -0800
X-CSE-ConnectionGUID: lPgHOSY+RAOXzzLkJzMP4A==
X-CSE-MsgGUID: soQb1XyBS32s94UqNWg/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="195203484"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 03 Dec 2025 12:11:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQtCB-00000000D71-3mmj;
 Wed, 03 Dec 2025 20:11:27 +0000
Date: Thu, 4 Dec 2025 04:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chu Guangqing <chuguangqing@inspur.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chu Guangqing <chuguangqing@inspur.com>
Subject: Re: [PATCH v11 1/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000
 soc chipset
Message-ID: <202512040420.tMzo2lns-lkp@intel.com>
References: <20251202022452.2636-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202022452.2636-2-chuguangqing@inspur.com>
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

Hi Chu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.18 next-20251203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chu-Guangqing/gpu-drm-add-support-for-YHGCH-ZX1000-soc-chipset/20251202-102817
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251202022452.2636-2-chuguangqing%40inspur.com
patch subject: [PATCH v11 1/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc chipset
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512040420.tMzo2lns-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040420.tMzo2lns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040420.tMzo2lns-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/yhgch/yhgch_drm_drv.c:27:12: error: static declaration of 'yhgch_dumb_create' follows non-static declaration
      27 | static int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
         |            ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/yhgch/yhgch_drm_drv.c:20:
   drivers/gpu/drm/yhgch/yhgch_drm_drv.h:48:5: note: previous declaration of 'yhgch_dumb_create' with type 'int(struct drm_file *, struct drm_device *, struct drm_mode_create_dumb *)'
      48 | int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/yhgch/yhgch_drm_drv.c: In function 'yhgch_dumb_create':
>> drivers/gpu/drm/yhgch/yhgch_drm_drv.c:32:15: error: implicit declaration of function 'drm_mode_size_dumb'; did you mean 'drm_mode_set_name'? [-Wimplicit-function-declaration]
      32 |         ret = drm_mode_size_dumb(dev, args, SZ_16, 0);
         |               ^~~~~~~~~~~~~~~~~~
         |               drm_mode_set_name
   drivers/gpu/drm/yhgch/yhgch_drm_drv.c: In function 'yhgch_kms_init':
>> drivers/gpu/drm/yhgch/yhgch_drm_drv.c:93:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
      93 |                 drm_err(dev, "failed to init de: %d\n", ret);
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/yhgch/yhgch_drm_drv.c: In function 'yhgch_pci_probe':
>> drivers/gpu/drm/yhgch/yhgch_drm_drv.c:262:17: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
     262 |                 drm_warn(dev, "enabling MSI failed: %d\n", ret);
         |                 ^~~~~~~~
         |                 dev_warn
--
   drivers/gpu/drm/yhgch/yhgch_drm_de.c: In function 'yhgch_plane_atomic_update':
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:73:13: error: implicit declaration of function 'drm_gem_fb_begin_cpu_access'; did you mean 'dma_buf_begin_cpu_access'? [-Wimplicit-function-declaration]
      73 |         if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             dma_buf_begin_cpu_access
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:78:17: error: implicit declaration of function 'drm_gem_fb_end_cpu_access'; did you mean 'dma_buf_end_cpu_access'? [-Wimplicit-function-declaration]
      78 |                 drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 dma_buf_end_cpu_access
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:68:24: warning: unused variable 'y' [-Wunused-variable]
      68 |         int offset, x, y;
         |                        ^
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:68:21: warning: unused variable 'x' [-Wunused-variable]
      68 |         int offset, x, y;
         |                     ^
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:68:13: warning: unused variable 'offset' [-Wunused-variable]
      68 |         int offset, x, y;
         |             ^~~~~~
   drivers/gpu/drm/yhgch/yhgch_drm_de.c: In function 'yhgch_de_init':
>> drivers/gpu/drm/yhgch/yhgch_drm_de.c:354:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
     354 |                 drm_err(dev, "failed to init plane: %d\n", ret);
         |                 ^~~~~~~
         |                 pr_err


vim +/yhgch_dumb_create +27 drivers/gpu/drm/yhgch/yhgch_drm_drv.c

    26	
  > 27	static int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
    28				     struct drm_mode_create_dumb *args)
    29	{
    30		int ret;
    31	
  > 32		ret = drm_mode_size_dumb(dev, args, SZ_16, 0);
    33		if (ret)
    34			return ret;
    35	
    36		return drm_gem_shmem_dumb_create(file, dev,  args);
    37	}
    38	
    39	static struct drm_driver yhgch_driver = {
    40		.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
    41		.fops = &yhgch_fops,
    42		.name = "yhgch",
    43		.desc = "yhgch drm driver",
    44		.major = 3,
    45		.minor = 1,
    46		.dumb_create = yhgch_dumb_create,
    47		DRM_FBDEV_SHMEM_DRIVER_OPS,
    48	};
    49	
    50	static int __maybe_unused yhgch_pm_suspend(struct device *dev)
    51	{
    52		struct drm_device *drm_dev = dev_get_drvdata(dev);
    53	
    54		return drm_mode_config_helper_suspend(drm_dev);
    55	}
    56	
    57	static int __maybe_unused yhgch_pm_resume(struct device *dev)
    58	{
    59		struct drm_device *drm_dev = dev_get_drvdata(dev);
    60	
    61		return drm_mode_config_helper_resume(drm_dev);
    62	}
    63	
    64	static const struct dev_pm_ops yhgch_pm_ops = {
    65		SET_SYSTEM_SLEEP_PM_OPS(yhgch_pm_suspend,
    66					yhgch_pm_resume)
    67	};
    68	
    69	static const struct drm_mode_config_funcs yhgch_mode_funcs = {
    70		.atomic_check = drm_atomic_helper_check,
    71		.atomic_commit = drm_atomic_helper_commit,
    72		.fb_create = drm_gem_fb_create_with_dirty,
    73	};
    74	
    75	static int yhgch_kms_init(struct yhgch_drm_private *priv)
    76	{
    77		struct drm_device *dev = &priv->dev;
    78		int ret;
    79	
    80		ret = drmm_mode_config_init(dev);
    81		if (ret)
    82			return ret;
    83	
    84		dev->mode_config.min_width = 0;
    85		dev->mode_config.min_height = 0;
    86		dev->mode_config.max_width = 1920;
    87		dev->mode_config.max_height = 1200;
    88		dev->mode_config.preferred_depth = 24;
    89		dev->mode_config.funcs = &yhgch_mode_funcs;
    90	
    91		ret = yhgch_de_init(priv);
    92		if (ret) {
  > 93			drm_err(dev, "failed to init de: %d\n", ret);
    94			return ret;
    95		}
    96	
    97		ret = yhgch_vdac_init(priv);
    98		if (ret) {
    99			drm_err(dev, "failed to init vdac: %d\n", ret);
   100			return ret;
   101		}
   102		drm_kms_helper_poll_init(dev);
   103	
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
