Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400084DD3B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7B310E505;
	Thu,  8 Feb 2024 09:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejfPyVKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87410E505
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707385658; x=1738921658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B8cqTdsl61hbTwAme0/u6L8Z4DeauMK0xgKqDax73kI=;
 b=ejfPyVKnXXRXyNsklI39PmygINOHjpM4SEoDyJAJJhtdINz/oBy2undC
 Z7UhPWoMoyric4MxDQ6tn1WVZZciSXIVtOom5OCMOov+ZbgQcRsT4QBJJ
 VjYCamBoghwcDasz2vNMlrWlybUf61fLPfIUuD6cFkCoYfxepsht+MFcz
 xSPt2o3rcwgIQp8Rxokmp7T3wnbh/seL6feOwjHNaaTQbAnz8B75U7kr8
 wK/2mz+Wp4sXy7DLuaRwRa94PszlSm/4tTAY28r5s5FbktJuHMvb7kdBY
 Cjfr6doxZjiGZPUz8c8kPM0PUyAFFd/SzO02LN2LAangx+6RP5IemK5lh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="23663295"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="23663295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1894976"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 01:47:35 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rY10G-0003aQ-0h;
 Thu, 08 Feb 2024 09:47:32 +0000
Date: Thu, 8 Feb 2024 17:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 sui.jingfeng@linux.dev, pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/8] firmware/sysfb: Set firmware-framebuffer parent
 device
Message-ID: <202402081758.cylLKURZ-lkp@intel.com>
References: <20240207134932.7321-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207134932.7321-4-tzimmermann@suse.de>
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
[also build test ERROR on drm-tip/drm-tip linus/master v6.8-rc3 next-20240208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/video-Add-helpers-for-decoding-screen_info/20240207-215100
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240207134932.7321-4-tzimmermann%40suse.de
patch subject: [PATCH v3 3/8] firmware/sysfb: Set firmware-framebuffer parent device
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240208/202402081758.cylLKURZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081758.cylLKURZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081758.cylLKURZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/sysfb.c:36:
>> include/linux/sysfb.h:108:1: error: expected identifier or '('
     108 | {
         | ^
   1 error generated.


vim +108 include/linux/sysfb.h

e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  104  
9e121040e54abe include/linux/sysfb.h        Javier Martinez Canillas 2022-06-07  105  static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
c0a4e7e120d3e9 include/linux/sysfb.h        Thomas Zimmermann        2024-02-07  106  							    const struct simplefb_platform_data *mode,
c0a4e7e120d3e9 include/linux/sysfb.h        Thomas Zimmermann        2024-02-07  107  							    struct device *parent);
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02 @108  {
9e121040e54abe include/linux/sysfb.h        Javier Martinez Canillas 2022-06-07  109  	return ERR_PTR(-EINVAL);
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  110  }
e3263ab389a7bc arch/x86/include/asm/sysfb.h David Rheinsberg         2013-08-02  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
