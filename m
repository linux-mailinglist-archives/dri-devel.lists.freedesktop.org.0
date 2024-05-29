Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E311B8D294F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3510E929;
	Wed, 29 May 2024 00:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFs8Oey5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223E10E929
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716941696; x=1748477696;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/WHlXx9rIIwP1V/JbyVMHDssBiIF+AfJKYBiHSL1WLk=;
 b=MFs8Oey5G8ZKzZupK7wkiYRphhTKDt9tGg0WPYEjy9AzZCnlw2VaLfHO
 Nu78+cJP8cswA6CJmk6NjLGrbjgAvBJ/CyC9JUidX+/iiZeXwXU5vd9ee
 WHG0nIyuVJfYLsJQR7C1JeRTD0X09Kb+BeHW8Sh1MJD8mub81YVxcWDis
 xj3uNdiIvtoX7rd/7qqxz5CrRriX1dUypZGYceb7N1if/+VhyVdX7kzi4
 TflRsq10H1elrAQhRNz0UgDj1THaaRo5xpTCLcfXBP3J6+hdVdKjJHABu
 SM2N1gpUHkCPE3omXCyAjCSkmdPKbfdiuPrBlDg3C0ZWsu53mcjP6L8Tg g==;
X-CSE-ConnectionGUID: 0eylG1USRHiIlNBZAO9TAw==
X-CSE-MsgGUID: +EoDrd4wQ/u+6NRS9fVNRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13167724"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13167724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 17:14:55 -0700
X-CSE-ConnectionGUID: WvWT+1SLRd6oty53MwfHLA==
X-CSE-MsgGUID: iuuzlohgQYeWnsjfhQHVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="66093147"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 28 May 2024 17:14:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sC6xu-000CuV-2h;
 Wed, 29 May 2024 00:14:50 +0000
Date: Wed, 29 May 2024 08:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 22/29] drm_hdmi_state_helper.c:undefined
 reference to `drm_hdmi_avi_infoframe_colorimetry'
Message-ID: <202405290803.c3178DYT-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   336dca397dcefc5d7436be1fee3c814ed6512996
commit: f378b77227bc4732922c57f92be89438bb1018a1 [22/29] drm/connector: hdmi: Add Infoframes generation
config: arc-randconfig-002-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290803.c3178DYT-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290803.c3178DYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290803.c3178DYT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc':
   drm_connector_test.c:(.text+0x230): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drm_connector_test.c:(.text+0x230): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc':
   drm_connector_test.c:(.text+0x378): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drm_connector_test.c:(.text+0x378): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc':
   drm_connector_test.c:(.text+0x4c0): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o:drm_connector_test.c:(.text+0x4c0): more undefined references to `drm_hdmi_compute_mode_clock' follow
   arc-elf-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
>> drm_hdmi_state_helper.c:(.text+0x824): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> arc-elf-ld: drm_hdmi_state_helper.c:(.text+0x824): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> arc-elf-ld: drm_hdmi_state_helper.c:(.text+0x82c): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> arc-elf-ld: drm_hdmi_state_helper.c:(.text+0x82c): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> arc-elf-ld: drm_hdmi_state_helper.c:(.text+0x866): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
>> arc-elf-ld: drm_hdmi_state_helper.c:(.text+0x866): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
   Selected by [y]:
   - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
