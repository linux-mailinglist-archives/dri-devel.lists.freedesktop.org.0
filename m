Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749C5AC40F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FFF10E00E;
	Sun,  4 Sep 2022 11:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ACD10E009;
 Sun,  4 Sep 2022 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662289435; x=1693825435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4xFvZorPNgarWpqxdvR5B56hPUE5VZ8Xelhg2+9k5mE=;
 b=F/N2V5QyOrjhU42Migqzbqwdg4O/IFM/Rn9EbctrVsgFMHgaqciUthQz
 gYfq8DITuqa/BFpzylrs0c0XDbyPPolq3M8Zh4+Y6jh1kJq2cOmixYWZg
 ymX9qVpg4yHSYYI9yMSS5q+Xr513iROzlZg+gF7E0VT0mv7fETD0zsj5p
 qERcEeWtVX4Db+RKXOQdxvGsq4BDXAOvJqpMYguSgb9ol083sFbu230V/
 GnlAZLVPiscGg2rFcgKn+CsYSu2ogY8mHdre4aiNopI8FtvVfxpnqaZKU
 zEoCNyKojtoh+6EOd4Dlz70xccGtZCmC7azOKcz1mErDU7DWoMC3JkzlN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="279247945"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="279247945"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 04:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="681754228"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2022 04:03:50 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oUnPq-0002zT-0A;
 Sun, 04 Sep 2022 11:03:50 +0000
Date: Sun, 4 Sep 2022 19:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, mario.limonciello@amd.com,
 Hawking.Zhang@amd.com, andrey.grodzovsky@amd.com, solomon.chiu@amd.com
Subject: Re: [PATCH] drm: amd: This is a patch to the amdgpu_drv.c file that
 fixes some warnings and errors found by the checkpatch.pl tool
Message-ID: <202209041839.rob9XU3V-lkp@intel.com>
References: <20220904083912.1006262-1-jingyuwang_vip@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904083912.1006262-1-jingyuwang_vip@163.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyu-Wang/drm-amd-This-is-a-patch-to-the-amdgpu_drv-c-file-that-fixes-some-warnings-and-errors-found-by-the-checkpatch-pl-tool/20220904-165633
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209041839.rob9XU3V-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/639ddf37854dd71c3ee836591db7518b146ae8ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingyu-Wang/drm-amd-This-is-a-patch-to-the-amdgpu_drv-c-file-that-fixes-some-warnings-and-errors-found-by-the-checkpatch-pl-tool/20220904-165633
        git checkout 639ddf37854dd71c3ee836591db7518b146ae8ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:290:17: warning: missing terminating " character
     290 |                 "for passthrough or sriov, 10000 for all jobs.
         |                 ^
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/drm/drm_print.h:32,
                    from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:28:
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:290:17: error: missing terminating " character
     290 |                 "for passthrough or sriov, 10000 for all jobs.
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:289:1: note: in expansion of macro 'MODULE_PARM_DESC'
     289 | MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and 60000 for compute jobs; "
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:291:17: error: expected ',' or ';' before numeric constant
     291 |                 0: keep default value. negative: infinity timeout),
         |                 ^
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:289:1: note: in expansion of macro 'MODULE_PARM_DESC'
     289 | MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and 60000 for compute jobs; "
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:292:83: warning: missing terminating " character
     292 |                 format: for bare metal [Non-Compute] or [GFX,Compute,SDMA,Video]; "
         |                                                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:292:83: error: missing terminating " character
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:293:17: error: expected identifier or '(' before string constant
     293 |                 "for passthrough or sriov [all jobs] or [GFX,Compute,SDMA,Video].");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:604:9: warning: missing terminating " character
     604 |         "reserve gtt for smu debug usage, 0 = disable,
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:605:76: warning: missing terminating " character
     605 |                 0x1 = 256Mbyte, 0x2 = 512Mbyte, 0x4 = 1 Gbyte, 0x8 = 2GByte");
         |                                                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2799:45: error: unterminated argument list invoking macro "MODULE_PARM_DESC"
    2799 | MODULE_LICENSE("GPL and additional rights");
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:603:1: error: expected '=', ',', ';', 'asm' or '__attribute__' at end of input
     603 | MODULE_PARM_DESC(smu_memory_pool_size,
         | ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:186:13: warning: 'amdgpu_drv_delayed_reset_work_handler' used but never defined
     186 | static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +290 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

   185	
 > 186	static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
   187	
   188	struct amdgpu_mgpu_info mgpu_info = {
   189		.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
   190		.delayed_reset_work = __DELAYED_WORK_INITIALIZER(
   191				mgpu_info.delayed_reset_work,
   192				amdgpu_drv_delayed_reset_work_handler, 0),
   193	};
   194	int amdgpu_ras_enable = -1;
   195	uint amdgpu_ras_mask = 0xffffffff;
   196	int amdgpu_bad_page_threshold = -1;
   197	struct amdgpu_watchdog_timer amdgpu_watchdog_timer = {
   198		.timeout_fatal_disable = false,
   199		.period = 0x0, /* default to 0x0 (timeout disable) */
   200	};
   201	
   202	/**
   203	 * DOC: vramlimit (int)
   204	 * Restrict the total amount of VRAM in MiB for testing.  The default is 0 (Use full VRAM).
   205	 */
   206	MODULE_PARM_DESC(vramlimit, "Restrict VRAM for testing, in megabytes");
   207	module_param_named(vramlimit, amdgpu_vram_limit, int, 0600);
   208	
   209	/**
   210	 * DOC: vis_vramlimit (int)
   211	 * Restrict the amount of CPU visible VRAM in MiB for testing.  The default is 0 (Use full CPU visible VRAM).
   212	 */
   213	MODULE_PARM_DESC(vis_vramlimit, "Restrict visible VRAM for testing, in megabytes");
   214	module_param_named(vis_vramlimit, amdgpu_vis_vram_limit, int, 0444);
   215	
   216	/**
   217	 * DOC: gartsize (uint)
   218	 * Restrict the size of GART in Mib (32, 64, etc.) for testing. The default is -1 (The size depends on asic).
   219	 */
   220	MODULE_PARM_DESC(gartsize, "Size of GART to setup in megabytes (32, 64, etc., -1=auto)");
   221	module_param_named(gartsize, amdgpu_gart_size, uint, 0600);
   222	
   223	/**
   224	 * DOC: gttsize (int)
   225	 * Restrict the size of GTT domain in MiB for testing. The default is -1 (It's VRAM size if 3GB < VRAM < 3/4 RAM,
   226	 * otherwise 3/4 RAM size).
   227	 */
   228	MODULE_PARM_DESC(gttsize, "Size of the GTT domain in megabytes (-1 = auto)");
   229	module_param_named(gttsize, amdgpu_gtt_size, int, 0600);
   230	
   231	/**
   232	 * DOC: moverate (int)
   233	 * Set maximum buffer migration rate in MB/s. The default is -1 (8 MB/s).
   234	 */
   235	MODULE_PARM_DESC(moverate, "Maximum buffer migration rate in MB/s. (32, 64, etc., -1=auto, 0=1=disabled)");
   236	module_param_named(moverate, amdgpu_moverate, int, 0600);
   237	
   238	/**
   239	 * DOC: audio (int)
   240	 * Set HDMI/DPAudio. Only affects non-DC display handling. The default is -1 (Enabled), set 0 to disabled it.
   241	 */
   242	MODULE_PARM_DESC(audio, "Audio enable (-1 = auto, 0 = disable, 1 = enable)");
   243	module_param_named(audio, amdgpu_audio, int, 0444);
   244	
   245	/**
   246	 * DOC: disp_priority (int)
   247	 * Set display Priority (1 = normal, 2 = high). Only affects non-DC display handling. The default is 0 (auto).
   248	 */
   249	MODULE_PARM_DESC(disp_priority, "Display Priority (0 = auto, 1 = normal, 2 = high)");
   250	module_param_named(disp_priority, amdgpu_disp_priority, int, 0444);
   251	
   252	/**
   253	 * DOC: hw_i2c (int)
   254	 * To enable hw i2c engine. Only affects non-DC display handling. The default is 0 (Disabled).
   255	 */
   256	MODULE_PARM_DESC(hw_i2c, "hw i2c engine enable (0 = disable)");
   257	module_param_named(hw_i2c, amdgpu_hw_i2c, int, 0444);
   258	
   259	/**
   260	 * DOC: pcie_gen2 (int)
   261	 * To disable PCIE Gen2/3 mode (0 = disable, 1 = enable). The default is -1 (auto, enabled).
   262	 */
   263	MODULE_PARM_DESC(pcie_gen2, "PCIE Gen2 mode (-1 = auto, 0 = disable, 1 = enable)");
   264	module_param_named(pcie_gen2, amdgpu_pcie_gen2, int, 0444);
   265	
   266	/**
   267	 * DOC: msi (int)
   268	 * To disable Message Signaled Interrupts (MSI) functionality (1 = enable, 0 = disable). The default is -1 (auto, enabled).
   269	 */
   270	MODULE_PARM_DESC(msi, "MSI support (1 = enable, 0 = disable, -1 = auto)");
   271	module_param_named(msi, amdgpu_msi, int, 0444);
   272	
   273	/**
   274	 * DOC: lockup_timeout (string)
   275	 * Set GPU scheduler timeout value in ms.
   276	 *
   277	 * The format can be [Non-Compute] or [GFX,Compute,SDMA,Video]. That is there can be one or
   278	 * multiple values specified. 0 and negative values are invalidated. They will be adjusted
   279	 * to the default timeout.
   280	 *
   281	 * - With one value specified, the setting will apply to all non-compute jobs.
   282	 * - With multiple values specified, the first one will be for GFX.
   283	 *   The second one is for Compute. The third and fourth ones are
   284	 *   for SDMA and Video.
   285	 *
   286	 * By default(with no lockup_timeout settings), the timeout for all non-compute(GFX, SDMA and Video)
   287	 * jobs is 10000. The timeout for compute is 60000.
   288	 */
   289	MODULE_PARM_DESC(lockup_timeout, "GPU lockup timeout in ms (default: for bare metal 10000 for non-compute jobs and 60000 for compute jobs; "
 > 290			"for passthrough or sriov, 10000 for all jobs.
   291			0: keep default value. negative: infinity timeout),
   292			format: for bare metal [Non-Compute] or [GFX,Compute,SDMA,Video]; "
   293			"for passthrough or sriov [all jobs] or [GFX,Compute,SDMA,Video].");
   294	module_param_string(lockup_timeout, amdgpu_lockup_timeout, sizeof(amdgpu_lockup_timeout), 0444);
   295	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
