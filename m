Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD57878BA8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 00:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4469F112897;
	Mon, 11 Mar 2024 23:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOWK4nTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF47D10FB92;
 Mon, 11 Mar 2024 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710201185; x=1741737185;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=p48JOH9V4XWyzs3yJclUYkG1DZg+f1rPC2Al4AQV1wg=;
 b=YOWK4nTzJRYqneqEXVaHacTvCWzUpofek82ZuQWPp89CeFmO6nzRSd84
 q4HmU6vyv7p/BdbnEjDBVBpxcr8OKDAR8rKv9JV5x853moh4H9RP3+7cz
 kc5InKDSeCKWnTUI0IHsHeJs+Gaudtw9OMFhiu4Q0pOI+DlSePMttKlD+
 KBMAIsb8RPpR8/rzO3x5kK2lLFYfn7BKZyu2LGnlZN0TA4oaa2G5yAFFv
 cdOZjYhSnmWxe8wHNn4g1UT6eu83Fv0LyJ4epimKDSc+2a4MJ28UXB+fG
 PlOs1tpSvM1SOahKj1F8/KO8L3Vt8GmRlDkd+5eogpwLo2LHpTLsl/2NU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5026469"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5026469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 16:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15990183"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 11 Mar 2024 16:53:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjpS0-0009YN-1U;
 Mon, 11 Mar 2024 23:53:00 +0000
Date: Tue, 12 Mar 2024 07:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: [drm-intel:for-linux-next 4/6]
 drivers/gpu/drm/i915/display/intel_bios.c:3417:24: error: implicit
 declaration of function 'intel_opregion_vbt_present'; did you mean
 'intel_opregion_asle_present'?
Message-ID: <202403120756.JTkGHCip-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next
head:   0e7dd6fe96020e6b7f5e068bf1c66078e0b145d3
commit: 9d9bb71f3e115b75ec5e38f087e159a87fc0413a [4/6] drm/i915: Extract opregion vbt presence check
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403120756.JTkGHCip-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120756.JTkGHCip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120756.JTkGHCip-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_bios.c: In function 'intel_bios_is_lvds_present':
>> drivers/gpu/drm/i915/display/intel_bios.c:3417:24: error: implicit declaration of function 'intel_opregion_vbt_present'; did you mean 'intel_opregion_asle_present'? [-Werror=implicit-function-declaration]
    3417 |                 return intel_opregion_vbt_present(i915);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        intel_opregion_asle_present
   cc1: some warnings being treated as errors


vim +3417 drivers/gpu/drm/i915/display/intel_bios.c

  3374	
  3375	/**
  3376	 * intel_bios_is_lvds_present - is LVDS present in VBT
  3377	 * @i915:	i915 device instance
  3378	 * @i2c_pin:	i2c pin for LVDS if present
  3379	 *
  3380	 * Return true if LVDS is present. If no child devices were parsed from VBT,
  3381	 * assume LVDS is present.
  3382	 */
  3383	bool intel_bios_is_lvds_present(struct drm_i915_private *i915, u8 *i2c_pin)
  3384	{
  3385		const struct intel_bios_encoder_data *devdata;
  3386	
  3387		if (list_empty(&i915->display.vbt.display_devices))
  3388			return true;
  3389	
  3390		list_for_each_entry(devdata, &i915->display.vbt.display_devices, node) {
  3391			const struct child_device_config *child = &devdata->child;
  3392	
  3393			/* If the device type is not LFP, continue.
  3394			 * We have to check both the new identifiers as well as the
  3395			 * old for compatibility with some BIOSes.
  3396			 */
  3397			if (child->device_type != DEVICE_TYPE_INT_LFP &&
  3398			    child->device_type != DEVICE_TYPE_LFP)
  3399				continue;
  3400	
  3401			if (intel_gmbus_is_valid_pin(i915, child->i2c_pin))
  3402				*i2c_pin = child->i2c_pin;
  3403	
  3404			/* However, we cannot trust the BIOS writers to populate
  3405			 * the VBT correctly.  Since LVDS requires additional
  3406			 * information from AIM blocks, a non-zero addin offset is
  3407			 * a good indicator that the LVDS is actually present.
  3408			 */
  3409			if (child->addin_offset)
  3410				return true;
  3411	
  3412			/* But even then some BIOS writers perform some black magic
  3413			 * and instantiate the device without reference to any
  3414			 * additional data.  Trust that if the VBT was written into
  3415			 * the OpRegion then they have validated the LVDS's existence.
  3416			 */
> 3417			return intel_opregion_vbt_present(i915);
  3418		}
  3419	
  3420		return false;
  3421	}
  3422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
