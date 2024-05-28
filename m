Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED48D264C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 22:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7BB1125B1;
	Tue, 28 May 2024 20:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlYXMc9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59794112788
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716929198; x=1748465198;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+6fP9tXmEFHyue4ceGUMpeEtPT8nsuUYNqXUkRYSWio=;
 b=ZlYXMc9TOmXR3Y30mO4HSHXal6XGlwiziEWXh408upoF0EnUHMMMQBgu
 eLY6A5F36sis8iAaELo6PjsDHqbs5SoqgcEEkv7+GZP9QM2QyNveqL0ux
 SGDFSpSEQu3w0lVfvhIW9qA/iO7SNpOnRieSO4eVDzBSe7y63/OzqPL5M
 DvZHwUJ7Zb1KkMWA5/k8RGprCDQsHq8IPWeoDAZX3V1yaLaxehALLpv8R
 4o1Tl/Jm2N0tKacggmv/6wDkEIf45cUQW5tBemRRN2/A5r9NxjWLWfef3
 C9KKLdKUdqBhSH6iJkMhJqIoAigikoE0ETIjI61oWuxhwFQfMxCaCqmyE w==;
X-CSE-ConnectionGUID: oVZ9Oij4QY67fIIN7PvZFg==
X-CSE-MsgGUID: ZObRJi4+Tc6wJXEnuQEmBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30803749"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="30803749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:46:38 -0700
X-CSE-ConnectionGUID: hh61DQeEQtyU6MjDkmcEWw==
X-CSE-MsgGUID: 2oYes5x/QFC4pVR8mF3ZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35801777"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 28 May 2024 13:46:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sC3iL-000Ck5-2P;
 Tue, 28 May 2024 20:46:33 +0000
Date: Wed, 29 May 2024 04:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 10/29] drm_connector_test.c:undefined
 reference to `drm_hdmi_compute_mode_clock'
Message-ID: <202405290438.TOYhXMIn-lkp@intel.com>
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
head:   c7ce956bb6d0f32ab921b6ffba1a6a834df96f21
commit: abb6f74973e20956d42e8227dde6fb4e92502c14 [10/29] drm/tests: Add HDMI TDMS character rate tests
config: arc-randconfig-002-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290438.TOYhXMIn-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290438.TOYhXMIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290438.TOYhXMIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc':
>> drm_connector_test.c:(.text+0x140): undefined reference to `drm_hdmi_compute_mode_clock'
>> arc-elf-ld: drm_connector_test.c:(.text+0x140): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc':
   drm_connector_test.c:(.text+0x288): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drm_connector_test.c:(.text+0x288): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc':
   drm_connector_test.c:(.text+0x3d0): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o:drm_connector_test.c:(.text+0x3d0): more undefined references to `drm_hdmi_compute_mode_clock' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
   Selected by [y]:
   - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
