Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D786D927E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85510EB45;
	Thu,  6 Apr 2023 09:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19110EB3F;
 Thu,  6 Apr 2023 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680772609; x=1712308609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sqGmj3a2tDCvGA3OtpRq+9dCzXeSI0k9rvhzi55zoQM=;
 b=G5ui3FRWtjiVWwfND2eOvNEkSSbQcpOliDZFrr4ORNTZ6VjTS6F344YA
 irwvWyiPcfiE2pqgPC8Au+mYCM9MfRg4jU3i4RIoCxSKzAJPVCOwvkXpd
 LGxbY9aV5Rbthth5xlW7BPz7TO9mhg4PIeq87MIT9O/fIcdcQPT+NBsJ5
 JVk6r20YDFRveWq+Q4Xp2TPCrzt03VFUcDkiCHNcquJx++OHgTn0oKLGU
 7DWnjX1XtY98Bbw5MCQzBlTSDD450QDWGdAgb7Whb8a0I9krENbgVxgcm
 uK3jwDykm2BYn6Ywc0fl9SOJCYBO9/RTMkSrCOyS5H8B1YJzF0yRnMxOE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405474558"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="405474558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 02:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717379718"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="717379718"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 06 Apr 2023 02:16:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pkLjZ-000RGA-2W;
 Thu, 06 Apr 2023 09:16:45 +0000
Date: Thu, 6 Apr 2023 17:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Disable PL1 power limit
 when loading GuC firmware
Message-ID: <202304061654.yjntbbxy-lkp@intel.com>
References: <20230406044522.3108359-3-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406044522.3108359-3-ashutosh.dixit@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ashutosh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashutosh-Dixit/drm-i915-hwmon-Get-mutex-and-rpm-ref-just-once-in-hwm_power_max_write/20230406-124659
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230406044522.3108359-3-ashutosh.dixit%40intel.com
patch subject: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Disable PL1 power limit when loading GuC firmware
config: i386-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061654.yjntbbxy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b4aa935db7f0b46437cdaa39f0149ad835ceb73c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ashutosh-Dixit/drm-i915-hwmon-Get-mutex-and-rpm-ref-just-once-in-hwm_power_max_write/20230406-124659
        git checkout b4aa935db7f0b46437cdaa39f0149ad835ceb73c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061654.yjntbbxy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_uc.c:484:6: warning: variable 'pl1en' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ret)
               ^~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:573:41: note: uninitialized use occurs here
           i915_hwmon_power_max_restore(gt->i915, pl1en);
                                                  ^~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:484:2: note: remove the 'if' if its condition is always false
           if (ret)
           ^~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:475:6: warning: variable 'pl1en' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!intel_uc_fw_is_loadable(&guc->fw)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:573:41: note: uninitialized use occurs here
           i915_hwmon_power_max_restore(gt->i915, pl1en);
                                                  ^~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:475:2: note: remove the 'if' if its condition is always false
           if (!intel_uc_fw_is_loadable(&guc->fw)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:465:12: note: initialize the variable 'pl1en' to silence this warning
           bool pl1en;
                     ^
                      = 0
   2 warnings generated.


vim +484 drivers/gpu/drm/i915/gt/uc/intel_uc.c

afd088ac05f120d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  457  
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  458  static int __uc_init_hw(struct intel_uc *uc)
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  459  {
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  460  	struct intel_gt *gt = uc_to_gt(uc);
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  461  	struct drm_i915_private *i915 = gt->i915;
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  462  	struct intel_guc *guc = &uc->guc;
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  463  	struct intel_huc *huc = &uc->huc;
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  464  	int ret, attempts;
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  465  	bool pl1en;
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  466  
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  467  	GEM_BUG_ON(!intel_uc_supports_guc(uc));
bfe5a40a7b9a967 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  468  	GEM_BUG_ON(!intel_uc_wants_guc(uc));
356c484822e6ac9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-16  469  
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  470  	print_fw_ver(gt, &guc->fw);
afd088ac05f120d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  471  
afd088ac05f120d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  472  	if (intel_uc_uses_huc(uc))
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  473  		print_fw_ver(gt, &huc->fw);
afd088ac05f120d drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2022-01-06  474  
42f96e5bd41e91f drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  475  	if (!intel_uc_fw_is_loadable(&guc->fw)) {
6fbeda0bfd210f9 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2020-01-10  476  		ret = __uc_check_hw(uc) ||
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  477  		      intel_uc_fw_is_overridden(&guc->fw) ||
202c98e71692484 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2020-02-18  478  		      intel_uc_wants_guc_submission(uc) ?
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  479  		      intel_uc_fw_status_to_error(guc->fw.status) : 0;
ae7a3166a708bee drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  480  		goto err_out;
ae7a3166a708bee drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  481  	}
ae7a3166a708bee drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  482  
63064d822c964c0 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  483  	ret = uc_init_wopcm(uc);
63064d822c964c0 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30 @484  	if (ret)
63064d822c964c0 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  485  		goto err_out;
63064d822c964c0 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-30  486  
e5a1ad035938e60 drivers/gpu/drm/i915/gt/uc/intel_uc.c Matthew Brost          2021-07-26  487  	intel_guc_reset_interrupts(guc);
61b5c1587dd82a8 drivers/gpu/drm/i915/intel_uc.c       Michał Winiarski       2017-12-13  488  
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  489  	/* WaEnableuKernelHeaderValidFix:skl */
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  490  	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
c816723b6b8a627 drivers/gpu/drm/i915/gt/uc/intel_uc.c Lucas De Marchi        2021-06-05  491  	if (GRAPHICS_VER(i915) == 9)
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  492  		attempts = 3;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  493  	else
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  494  		attempts = 1;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  495  
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  496  	/* Disable a potentially low PL1 power limit to allow freq to be raised */
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  497  	i915_hwmon_power_max_disable(gt->i915, &pl1en);
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  498  
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  499  	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  500  
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  501  	while (attempts--) {
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  502  		/*
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  503  		 * Always reset the GuC just before (re)loading, so
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  504  		 * that the state and timing are fairly predictable
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  505  		 */
771051eaa74661f drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-02  506  		ret = __uc_sanitize(uc);
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  507  		if (ret)
61b5c1587dd82a8 drivers/gpu/drm/i915/intel_uc.c       Michał Winiarski       2017-12-13  508  			goto err_out;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  509  
a8dc0f6d187bccc drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  510  		intel_huc_fw_upload(huc);
386e300fe9fae7e drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2019-05-27  511  		intel_guc_ads_reset(guc);
2bf8fb39eb70b6c drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-24  512  		intel_guc_write_params(guc);
e8668bbcb0f91c7 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-10-16  513  		ret = intel_guc_fw_upload(guc);
52b832606038c5b drivers/gpu/drm/i915/intel_uc.c       Robert M. Fosha        2019-03-29  514  		if (ret == 0)
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  515  			break;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  516  
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  517  		gt_dbg(gt, "GuC fw load failed (%pe) will reset and retry %d more time(s)\n",
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  518  		       ERR_PTR(ret), attempts);
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  519  	}
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  520  
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  521  	/* Did we succeded or run out of retries? */
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  522  	if (ret)
ac58d2ab0ad9c8b drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  523  		goto err_log_capture;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  524  
789a625158b0c0c drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  525  	ret = guc_enable_communication(guc);
789a625158b0c0c drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  526  	if (ret)
ac58d2ab0ad9c8b drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  527  		goto err_log_capture;
789a625158b0c0c drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-05-02  528  
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  529  	/*
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  530  	 * GSC-loaded HuC is authenticated by the GSC, so we don't need to
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  531  	 * trigger the auth here. However, given that the HuC loaded this way
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  532  	 * survive GT reset, we still need to update our SW bookkeeping to make
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  533  	 * sure it reflects the correct HW status.
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  534  	 */
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  535  	if (intel_huc_is_loaded_by_gsc(huc))
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  536  		intel_huc_update_auth_status(huc);
6f67930af78f10a drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2022-05-04  537  	else
a8dc0f6d187bccc drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  538  		intel_huc_auth(huc);
0dfa1cee613e03c drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-12-06  539  
cd414f4f59f64d7 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  540  	if (intel_uc_uses_guc_submission(uc)) {
cd414f4f59f64d7 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  541  		ret = intel_guc_submission_enable(guc);
cd414f4f59f64d7 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  542  		if (ret)
cd414f4f59f64d7 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  543  			goto err_log_capture;
cd414f4f59f64d7 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-17  544  	}
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  545  
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  546  	if (intel_uc_uses_guc_slpc(uc)) {
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  547  		ret = intel_guc_slpc_enable(&guc->slpc);
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  548  		if (ret)
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  549  			goto err_submission;
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  550  	} else {
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  551  		/* Restore GT back to RPn for non-SLPC path */
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  552  		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  553  	}
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  554  
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  555  	i915_hwmon_power_max_restore(gt->i915, pl1en);
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  556  
4fd4fde8e42e164 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-06  557  	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
4fd4fde8e42e164 drivers/gpu/drm/i915/gt/uc/intel_uc.c John Harrison          2023-02-06  558  	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  559  
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  560  	return 0;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  561  
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  562  	/*
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  563  	 * We've failed to load the firmware :(
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  564  	 */
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  565  err_submission:
63c0eb30bfe9269 drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-07-30  566  	intel_guc_submission_disable(guc);
ac58d2ab0ad9c8b drivers/gpu/drm/i915/intel_uc.c       Daniele Ceraolo Spurio 2017-05-22  567  err_log_capture:
32ff76e80c2400c drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-02  568  	__uc_capture_load_err_log(uc);
121981fafe699d9 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2017-12-06  569  err_out:
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  570  	/* Return GT back to RPn */
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  571  	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
1c40d40f6835cde drivers/gpu/drm/i915/gt/uc/intel_uc.c Vinay Belgaumkar       2021-12-16  572  
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  573  	i915_hwmon_power_max_restore(gt->i915, pl1en);
b4aa935db7f0b46 drivers/gpu/drm/i915/gt/uc/intel_uc.c Ashutosh Dixit         2023-04-05  574  
ca7b2c1bbede618 drivers/gpu/drm/i915/gt/uc/intel_uc.c Daniele Ceraolo Spurio 2019-07-13  575  	__uc_sanitize(uc);
89195bab5d8c540 drivers/gpu/drm/i915/intel_uc.c       Michal Wajdeczko       2019-05-22  576  
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  577  	if (!ret) {
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  578  		gt_notice(gt, "GuC is uninitialized\n");
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  579  		/* We want to run without GuC submission */
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  580  		return 0;
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  581  	}
ee402140274e870 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-18  582  
2f8c06cb6622b55 drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2023-01-28  583  	gt_probe_error(gt, "GuC initialization failed %pe\n", ERR_PTR(ret));
a5f978c3609f02a drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  584  
a5f978c3609f02a drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  585  	/* We want to keep KMS alive */
a5f978c3609f02a drivers/gpu/drm/i915/gt/uc/intel_uc.c Michal Wajdeczko       2019-08-11  586  	return -EIO;
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  587  }
6cd5a72c357732e drivers/gpu/drm/i915/intel_uc.c       Arkadiusz Hiler        2017-03-14  588  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
