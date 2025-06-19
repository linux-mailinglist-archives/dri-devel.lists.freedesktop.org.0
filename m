Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F96ADFCBF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB7010E98F;
	Thu, 19 Jun 2025 05:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISNCg5O0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5626A10E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750309999; x=1781845999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DaAeSgOKa5+ihHQK/CsgUn/s98z+5cTpCLLRShbyFBw=;
 b=ISNCg5O03WbNijWXAXHru8LyRZJZGTPxW6o//sqEu2B+RDYRP2wprO5f
 M7Fw9/eB6Lw7cLMDn8JkPngeN6CHY/olUVg5dWkU/42gAIdI+l3I44AQB
 UiRzZFCoeU94RWiXr6xlGiAWqvtG0Ahxiw883NcYchj4WT6F+VEa1IVIZ
 rivcHjPlsEAheLGb0ix4h3RdReuQN7d+kJN6wSk+k/RhpuhBcY8VfmQ0B
 wEouITdyUO7NnCj41Ut8ou+8d8OxGooNi0Q++XTrHE53QLuCVHG917zlB
 E0jneZrhI3iPx9qjUDndTbYD23g0Oggx+V/TDwSsoo81kqxSWiWk5KNAA g==;
X-CSE-ConnectionGUID: nsZ9JeFRQFyWIf5BUZew/Q==
X-CSE-MsgGUID: xnU45y2tTNWniijn79Cd+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51784199"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="51784199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:13:19 -0700
X-CSE-ConnectionGUID: Iy8XfeYmQ6aW1bvPafNrJw==
X-CSE-MsgGUID: cOabNmcPQp+yFRjQVpbmpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="151106260"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2025 22:13:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uS7aJ-000KQE-1E;
 Thu, 19 Jun 2025 05:13:11 +0000
Date: Thu, 19 Jun 2025 13:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev, deller@gmx.de,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header
 file
Message-ID: <202506191230.WMfb29QM-lkp@intel.com>
References: <20250618122436.379013-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618122436.379013-13-tzimmermann@suse.de>
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

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on v6.16-rc2 next-20250618]
[cannot apply to lee-backlight/for-backlight-next lee-leds/for-leds-next drm-exynos/exynos-drm-next linus/master lee-backlight/for-backlight-fixes drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/platform-x86-dell-uart-backlight-Use-blacklight-power-constant/20250618-203011
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250618122436.379013-13-tzimmermann%40suse.de
patch subject: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header file
config: riscv-randconfig-001-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191230.WMfb29QM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191230.WMfb29QM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191230.WMfb29QM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/rt4831-backlight.c:215:49: error: array type has incomplete element type 'struct of_device_id'
     215 | static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
         |                                                 ^~~~~~~~~~~~~~~~~~


vim +215 drivers/video/backlight/rt4831-backlight.c

190ccab3185eee ChiYuan Huang 2021-05-17  214  
190ccab3185eee ChiYuan Huang 2021-05-17 @215  static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
190ccab3185eee ChiYuan Huang 2021-05-17  216  	{ .compatible = "richtek,rt4831-backlight", },
190ccab3185eee ChiYuan Huang 2021-05-17  217  	{}
190ccab3185eee ChiYuan Huang 2021-05-17  218  };
190ccab3185eee ChiYuan Huang 2021-05-17  219  MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
190ccab3185eee ChiYuan Huang 2021-05-17  220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
