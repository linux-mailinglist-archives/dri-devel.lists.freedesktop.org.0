Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041CAB9C8D
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67A510EAA9;
	Fri, 16 May 2025 12:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YT+EYV87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4C610EAA9;
 Fri, 16 May 2025 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747399786; x=1778935786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/8f/jSS6gLVAzhPFW0vE1+5UJ8HssoY0+ZN5Yf2qqIo=;
 b=YT+EYV87ciCIXSzUscS3u8E7RWok7mAURlU1/ndu2qfuSlIaHB3ZDs6/
 OVLtyYwXptHa8uv6tkbF6+ZOWSkmP2lNDukT19/SBsz4V75Mm7PmvuHC8
 WWpFhYgy1koRH1393QicwurLKwX4ycappAlFVoB+mqa13ykeRJJZ5fdbd
 sHLDEWnLVgtJ6z2/D+ojsIycVuWAQYwd+s+BZi5U9tOXU+8tDzPNk9FBU
 6xGpzCBLEop5R1YPa4iVQPob1HUs00SuoaFw3eukF1wh64yQl/H5P2oW5
 weLxaezwiOA4Kfo29MOqHkx5r+g/EnG51r9gNmUmiOALWfYtokJlhrE7w w==;
X-CSE-ConnectionGUID: BDHlNEy+Qc2ln7wv4txBog==
X-CSE-MsgGUID: faJ9XtL5Tr6ScFlRcSQyrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49526764"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49526764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:49:46 -0700
X-CSE-ConnectionGUID: vir2mYIiQrOA2wDbVj7+LQ==
X-CSE-MsgGUID: a070JebaRO+dCo493+BkhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169623060"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 16 May 2025 05:49:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFuVQ-000JLv-0y;
 Fri, 16 May 2025 12:49:40 +0000
Date: Fri, 16 May 2025 20:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Gomes <leonardodasigomes@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, derick.william.moraes@gmail.com,
 Leonardo Gomes <leonardodasigomes@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function
 with prefix to help in ftrace
Message-ID: <202505162041.ftJ48E6X-lkp@intel.com>
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514174306.82693-1-leonardodasigomes@gmail.com>
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

Hi Leonardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Gomes/drm-amd-display-Adjust-set_value-function-with-prefix-to-help-in-ftrace/20250515-151114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250514174306.82693-1-leonardodasigomes%40gmail.com
patch subject: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function with prefix to help in ftrace
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505162041.ftJ48E6X-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505162041.ftJ48E6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162041.ftJ48E6X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.c:65:25: error: static declaration of 'dal_hw_gpio_get_value' follows non-static declaration
      65 | static enum gpio_result dal_hw_gpio_get_value(
         |                         ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_gpio.h:122:18: note: previous declaration of 'dal_hw_gpio_get_value' with type 'enum gpio_result(const struct hw_gpio_pin *, uint32_t *)' {aka 'enum gpio_result(const struct hw_gpio_pin *, unsigned int *)'}
     122 | enum gpio_result dal_hw_gpio_get_value(
         |                  ^~~~~~~~~~~~~~~~~~~~~


vim +/dal_hw_gpio_get_value +65 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.c

    64	
  > 65	static enum gpio_result dal_hw_gpio_get_value(
    66		const struct hw_gpio_pin *ptr,
    67		uint32_t *value)
    68	{
    69		struct hw_hpd *hpd = HW_HPD_FROM_BASE(ptr);
    70		uint32_t hpd_delayed = 0;
    71	
    72		/* in Interrupt mode we ask for SENSE bit */
    73	
    74		if (ptr->mode == GPIO_MODE_INTERRUPT) {
    75	
    76			REG_GET(int_status,
    77				DC_HPD_SENSE_DELAYED, &hpd_delayed);
    78	
    79			*value = hpd_delayed;
    80			return GPIO_RESULT_OK;
    81		}
    82	
    83		/* in any other modes, operate as normal GPIO */
    84	
    85		return dal_hw_gpio_get_value(ptr, value);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
