Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20DBA48D03
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 00:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9C610EBB9;
	Thu, 27 Feb 2025 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loZzMNaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0410EBB9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740700773; x=1772236773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/agnUZDgWlxSvKeQY3JUoMYzB/+byrjfvzVqkXRYtNQ=;
 b=loZzMNaSUR+y7Led+MxNsyAwsEBzp9tLNdhqGRah/haOu5vdFvjw+fDB
 K/VFCYgDJAKe2f8gPlIMLc/yIM6llqn2n+W0ByUw0g7V2fRPiN21Q0rgV
 6x74hdZvo1rTJWPWhgNZ6YKf/kHLqo/rvNIJnKDT3mFlrrcFEOfy6UbG9
 iyB8D4/f6E2IeYSHBrVfdRWxP1lec2AEKsSLwCXDYLlkMBwLypAh6U1sH
 zT8xb0LPro/R1E59RPu5CUJHDlDSV/OHp+ihbd8P488RBGpv/w0SIE6y1
 qTPM4Svj0EUfbTHxzDEkTyJkNG96c5LJzod0vLh+eSVOzRdfw17SfCkkX Q==;
X-CSE-ConnectionGUID: O633CftTSyWM+FA/s/N83A==
X-CSE-MsgGUID: ATTY+wGLRhSruTlHSr/XBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45398274"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45398274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:59:33 -0800
X-CSE-ConnectionGUID: ojAs1k/MS9SEC9VHc3zyCA==
X-CSE-MsgGUID: Z4S+jU04ThCLAbI6XFSa+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="140399632"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 15:59:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnnmo-000ECu-3C;
 Thu, 27 Feb 2025 23:59:26 +0000
Date: Fri, 28 Feb 2025 07:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <202502280748.oNKTNuMK-lkp@intel.com>
References: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
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

Hi Aditya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Garg/drm-format-helper-Add-conversion-from-XRGB8888-to-BGR888/20250224-214352
base:   linus/master
patch link:    https://lore.kernel.org/r/844C1D39-4891-4DC2-8458-F46FA1B59FA0%40live.com
patch subject: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280748.oNKTNuMK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280748.oNKTNuMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280748.oNKTNuMK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_primary_plane_duplicate_state':
>> drivers/gpu/drm/tiny/appletbdrm.c:524:40: warning: variable 'old_appletbdrm_state' set but not used [-Wunused-but-set-variable]
     524 |         struct appletbdrm_plane_state *old_appletbdrm_state;
         |                                        ^~~~~~~~~~~~~~~~~~~~


vim +/old_appletbdrm_state +524 drivers/gpu/drm/tiny/appletbdrm.c

   520	
   521	static struct drm_plane_state *appletbdrm_primary_plane_duplicate_state(struct drm_plane *plane)
   522	{
   523		struct drm_shadow_plane_state *new_shadow_plane_state;
 > 524		struct appletbdrm_plane_state *old_appletbdrm_state;
   525		struct appletbdrm_plane_state *appletbdrm_state;
   526	
   527		if (WARN_ON(!plane->state))
   528			return NULL;
   529	
   530		old_appletbdrm_state = to_appletbdrm_plane_state(plane->state);
   531		appletbdrm_state = kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
   532		if (!appletbdrm_state)
   533			return NULL;
   534	
   535		/* Request and response are not duplicated and are allocated in .atomic_check */
   536		appletbdrm_state->request = NULL;
   537		appletbdrm_state->response = NULL;
   538	
   539		appletbdrm_state->request_size = 0;
   540		appletbdrm_state->frames_size = 0;
   541	
   542		new_shadow_plane_state = &appletbdrm_state->base;
   543	
   544		__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
   545	
   546		return &new_shadow_plane_state->base;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
