Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DDC6B88C3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 03:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0946C10E6C5;
	Tue, 14 Mar 2023 02:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67BF10E6C5;
 Tue, 14 Mar 2023 02:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678762513; x=1710298513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NFzAXXoB1e7+XH5IaSm2cBjMNsWm1wKGgsZ/Zq0L7zA=;
 b=mYg8aS8U5MfWvtKLKb/bBAbooF3ABj6Ye/7ddLldZe1GriOcNRWypmlq
 DBIyDmoSBprzaNIBdKLWFDloYgbczWMxrtPFagtyATGZ/gZqCByxeHkp5
 dPSbnEbmJYokf6Ma7mv/Ym1I8zJpfu9kLOsO4pn4PO0A90CySZpul1E6J
 y+NKml4NQrGds6qI09MKQ8zzuCRDXXXY4N3RbgVt9bL9O6T53bOA0WPbR
 7+cfy4mjJMzo5IDGDiN7qyq6kyEzDxF+tA4SST2fUtRPUGWdSY0PTwRLC
 9yxDco9BxDJw9UPcMKiJKnyP2FKsWW3wyMTzf+qeLcCy0pojpisaw5HR6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399904818"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="399904818"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 19:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789166479"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789166479"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2023 19:55:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pbuof-0006Qq-0g;
 Tue, 14 Mar 2023 02:55:09 +0000
Date: Tue, 14 Mar 2023 10:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/guc: Disable PL1 power limit when loading
 GuC firmware
Message-ID: <202303141032.GnWWCyaD-lkp@intel.com>
References: <20230313234936.2005565-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313234936.2005565-1-ashutosh.dixit@intel.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 oe-kbuild-all@lists.linux.dev, Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ashutosh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.3-rc2 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashutosh-Dixit/drm-i915-guc-Disable-PL1-power-limit-when-loading-GuC-firmware/20230314-075114
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230313234936.2005565-1-ashutosh.dixit%40intel.com
patch subject: [PATCH v2] drm/i915/guc: Disable PL1 power limit when loading GuC firmware
config: x86_64-randconfig-a016-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141032.GnWWCyaD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/931e5a87acb79926043e557341fb0dfd68a9b88d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ashutosh-Dixit/drm-i915-guc-Disable-PL1-power-limit-when-loading-GuC-firmware/20230314-075114
        git checkout 931e5a87acb79926043e557341fb0dfd68a9b88d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141032.GnWWCyaD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_uc.c:483:6: warning: variable 'pl1en' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ret)
               ^~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:572:28: note: uninitialized use occurs here
           hwm_power_max_restore(gt, pl1en); /* Restore PL1 limit */
                                     ^~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:483:2: note: remove the 'if' if its condition is always false
           if (ret)
           ^~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:474:6: warning: variable 'pl1en' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!intel_uc_fw_is_loadable(&guc->fw)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:572:28: note: uninitialized use occurs here
           hwm_power_max_restore(gt, pl1en); /* Restore PL1 limit */
                                     ^~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:474:2: note: remove the 'if' if its condition is always false
           if (!intel_uc_fw_is_loadable(&guc->fw)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:464:26: note: initialize the variable 'pl1en' to silence this warning
           int ret, attempts, pl1en;
                                   ^
                                    = 0
   2 warnings generated.


vim +483 drivers/gpu/drm/i915/gt/uc/intel_uc.c

afd088ac05f120 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  457  
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  458  static int __uc_init_hw(struct intel_uc *uc)
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  459  {
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  460  	struct intel_gt *gt = uc_to_gt(uc);
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  461  	struct drm_i915_private *i915 = gt->i915;
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  462  	struct intel_guc *guc = &uc->guc;
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  463  	struct intel_huc *huc = &uc->huc;
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  464  	int ret, attempts, pl1en;
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  465  
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  466  	GEM_BUG_ON(!intel_uc_supports_guc(uc));
bfe5a40a7b9a96 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  467  	GEM_BUG_ON(!intel_uc_wants_guc(uc));
356c484822e6ac drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-16  468  
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  469  	print_fw_ver(gt, &guc->fw);
afd088ac05f120 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  470  
afd088ac05f120 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  471  	if (intel_uc_uses_huc(uc))
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  472  		print_fw_ver(gt, &huc->fw);
afd088ac05f120 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  473  
42f96e5bd41e91 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  474  	if (!intel_uc_fw_is_loadable(&guc->fw)) {
6fbeda0bfd210f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  475  		ret = __uc_check_hw(uc) ||
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  476  		      intel_uc_fw_is_overridden(&guc->fw) ||
202c98e7169248 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  477  		      intel_uc_wants_guc_submission(uc) ?
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  478  		      intel_uc_fw_status_to_error(guc->fw.status) : 0;
ae7a3166a708be drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  479  		goto err_out;
ae7a3166a708be drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  480  	}
ae7a3166a708be drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  481  
63064d822c964c drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  482  	ret = uc_init_wopcm(uc);
63064d822c964c drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30 @483  	if (ret)
63064d822c964c drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  484  		goto err_out;
63064d822c964c drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  485  
e5a1ad035938e6 drivers/gpu/drm/i915/gt/uc/intel_uc.c Matthew Brost          2021-07-26  486  	intel_guc_reset_interrupts(guc);
61b5c1587dd82a drivers/gpu/drm/i915/intel_uc.c       Michał Winiarski       2017-12-13  487  
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  488  	/* WaEnableuKernelHeaderValidFix:skl */
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  489  	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
c816723b6b8a62 drivers/gpu/drm/i915/gt/uc/intel_uc.c Lucas De Marchi        2021-06-05  490  	if (GRAPHICS_VER(i915) == 9)
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  491  		attempts = 3;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  492  	else
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  493  		attempts = 1;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  494  
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  495  	/* Disable PL1 limit before raising freq */
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  496  	hwm_power_max_disable(gt, &pl1en);
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  497  
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  498  	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  499  
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  500  	while (attempts--) {
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  501  		/*
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  502  		 * Always reset the GuC just before (re)loading, so
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  503  		 * that the state and timing are fairly predictable
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  504  		 */
771051eaa74661 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-02  505  		ret = __uc_sanitize(uc);
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  506  		if (ret)
61b5c1587dd82a drivers/gpu/drm/i915/intel_uc.c       Michał Winiarski       2017-12-13  507  			goto err_out;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  508  
a8dc0f6d187bcc drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  509  		intel_huc_fw_upload(huc);
386e300fe9fae7 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2019-05-27  510  		intel_guc_ads_reset(guc);
2bf8fb39eb70b6 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-24  511  		intel_guc_write_params(guc);
e8668bbcb0f91c drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-10-16  512  		ret = intel_guc_fw_upload(guc);
52b832606038c5 drivers/gpu/drm/i915/intel_uc.c       Robert M. Fosha        2019-03-29  513  		if (ret == 0)
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  514  			break;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  515  
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  516  		gt_dbg(gt, "GuC fw load failed (%pe) will reset and retry %d more time(s)\n",
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  517  		       ERR_PTR(ret), attempts);
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  518  	}
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  519  
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  520  	/* Did we succeded or run out of retries? */
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  521  	if (ret)
ac58d2ab0ad9c8 drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  522  		goto err_log_capture;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  523  
789a625158b0c0 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  524  	ret = guc_enable_communication(guc);
789a625158b0c0 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  525  	if (ret)
ac58d2ab0ad9c8 drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  526  		goto err_log_capture;
789a625158b0c0 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  527  
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  528  	/*
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  529  	 * GSC-loaded HuC is authenticated by the GSC, so we don't need to
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  530  	 * trigger the auth here. However, given that the HuC loaded this way
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  531  	 * survive GT reset, we still need to update our SW bookkeeping to make
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  532  	 * sure it reflects the correct HW status.
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  533  	 */
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  534  	if (intel_huc_is_loaded_by_gsc(huc))
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  535  		intel_huc_update_auth_status(huc);
6f67930af78f10 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  536  	else
a8dc0f6d187bcc drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  537  		intel_huc_auth(huc);
0dfa1cee613e03 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-12-06  538  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  539  	if (intel_uc_uses_guc_submission(uc)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  540  		ret = intel_guc_submission_enable(guc);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  541  		if (ret)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  542  			goto err_log_capture;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  543  	}
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  544  
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  545  	if (intel_uc_uses_guc_slpc(uc)) {
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  546  		ret = intel_guc_slpc_enable(&guc->slpc);
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  547  		if (ret)
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  548  			goto err_submission;
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  549  	} else {
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  550  		/* Restore GT back to RPn for non-SLPC path */
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  551  		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  552  	}
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  553  
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  554  	hwm_power_max_restore(gt, pl1en); /* Restore PL1 limit */
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  555  
4fd4fde8e42e16 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-06  556  	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
4fd4fde8e42e16 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-06  557  	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  558  
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  559  	return 0;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  560  
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  561  	/*
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  562  	 * We've failed to load the firmware :(
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  563  	 */
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  564  err_submission:
63c0eb30bfe926 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  565  	intel_guc_submission_disable(guc);
ac58d2ab0ad9c8 drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  566  err_log_capture:
32ff76e80c2400 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-02  567  	__uc_capture_load_err_log(uc);
121981fafe699d drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-12-06  568  err_out:
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  569  	/* Return GT back to RPn */
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  570  	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
1c40d40f6835cd drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  571  
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  572  	hwm_power_max_restore(gt, pl1en); /* Restore PL1 limit */
931e5a87acb799 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-03-13  573  
ca7b2c1bbede61 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-13  574  	__uc_sanitize(uc);
89195bab5d8c54 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2019-05-22  575  
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  576  	if (!ret) {
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  577  		gt_notice(gt, "GuC is uninitialized\n");
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  578  		/* We want to run without GuC submission */
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  579  		return 0;
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  580  	}
ee402140274e87 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  581  
2f8c06cb6622b5 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  582  	gt_probe_error(gt, "GuC initialization failed %pe\n", ERR_PTR(ret));
a5f978c3609f02 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  583  
a5f978c3609f02 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  584  	/* We want to keep KMS alive */
a5f978c3609f02 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  585  	return -EIO;
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  586  }
6cd5a72c357732 drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
