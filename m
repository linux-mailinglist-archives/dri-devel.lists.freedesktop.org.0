Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663B852855
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 06:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAD910E836;
	Tue, 13 Feb 2024 05:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqapkzhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3910E830;
 Tue, 13 Feb 2024 05:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707803062; x=1739339062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XwYxTCi3Vrffvqu5sWo94/cUOA0oYGVkWlFbOTubhzg=;
 b=jqapkzhhmZhqGLWVv4Rs1h+ezacS6q1P+Lst6Px1MER1AbVIVeoQP1Dk
 ECSuzY80JsPdLkH0PXkIGpMZ1Qnm/rNtzRL95KNFny2U2m13zvAk7XKTa
 2qsKzhoOfkEdqo99tXe5VWhjwSEJQHkgg+ddMS3E6pI3oW1G9LKZqZRZy
 JKDkNIy7CBPCxqqTUG77lKsw/Qm4Ifm5v0O8j1+ReIemyGMGlskacd2aD
 nvLIiF3SgimB8VdA/aPhWQuxddq1dwUSPcYmXJSXGQ0dO1NPvCJ+JSAvq
 G0j5vxvbzaaJ4XvrWDT5C2tYOTcQSp2sSZa4di9+nZvXa93Ap+m3huSAk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1924497"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1924497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 21:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="33876227"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2024 21:44:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rZlaa-0007Xe-37;
 Tue, 13 Feb 2024 05:44:16 +0000
Date: Tue, 13 Feb 2024 13:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
Message-ID: <202402131349.eg8DJ3MB-lkp@intel.com>
References: <20240212101712.23675-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212101712.23675-3-tzimmermann@suse.de>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8-rc4 next-20240212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-nouveau-Include-linux-backlight-h/20240212-181930
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240212101712.23675-3-tzimmermann%40suse.de
patch subject: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20240213/202402131349.eg8DJ3MB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131349.eg8DJ3MB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131349.eg8DJ3MB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/macintosh/via-pmu-backlight.c: In function '__pmu_backlight_update_status':
   drivers/macintosh/via-pmu-backlight.c:74:21: error: implicit declaration of function 'backlight_get_brightness'; did you mean 'pmu_backlight_get_level_brightness'? [-Werror=implicit-function-declaration]
      74 |         int level = backlight_get_brightness(bd);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     pmu_backlight_get_level_brightness
   drivers/macintosh/via-pmu-backlight.c: At top level:
   drivers/macintosh/via-pmu-backlight.c:108:21: error: variable 'pmu_backlight_data' has initializer but incomplete type
     108 | static const struct backlight_ops pmu_backlight_data = {
         |                     ^~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:109:10: error: 'const struct backlight_ops' has no member named 'update_status'
     109 |         .update_status  = pmu_backlight_update_status,
         |          ^~~~~~~~~~~~~
>> drivers/macintosh/via-pmu-backlight.c:109:27: warning: excess elements in struct initializer
     109 |         .update_status  = pmu_backlight_update_status,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:109:27: note: (near initialization for 'pmu_backlight_data')
   drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
   drivers/macintosh/via-pmu-backlight.c:136:37: error: storage size of 'props' isn't known
     136 |         struct backlight_properties props;
         |                                     ^~~~~
   drivers/macintosh/via-pmu-backlight.c:154:34: error: invalid application of 'sizeof' to incomplete type 'struct backlight_properties'
     154 |         memset(&props, 0, sizeof(struct backlight_properties));
         |                                  ^~~~~~
   drivers/macintosh/via-pmu-backlight.c:155:22: error: 'BACKLIGHT_PLATFORM' undeclared (first use in this function)
     155 |         props.type = BACKLIGHT_PLATFORM;
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:155:22: note: each undeclared identifier is reported only once for each function it appears in
   drivers/macintosh/via-pmu-backlight.c:157:14: error: implicit declaration of function 'backlight_device_register'; did you mean 'root_device_register'? [-Werror=implicit-function-declaration]
     157 |         bd = backlight_device_register(name, NULL, NULL, &pmu_backlight_data,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              root_device_register
   drivers/macintosh/via-pmu-backlight.c:166:19: error: invalid use of undefined type 'struct backlight_device'
     166 |         level = bd->props.max_brightness;
         |                   ^~
   drivers/macintosh/via-pmu-backlight.c:176:35: error: invalid use of undefined type 'struct backlight_device'
     176 |                                 bd->props.max_brightness / 15);
         |                                   ^~
   drivers/macintosh/via-pmu-backlight.c:179:11: error: invalid use of undefined type 'struct backlight_device'
     179 |         bd->props.brightness = level;
         |           ^~
   drivers/macintosh/via-pmu-backlight.c:180:11: error: invalid use of undefined type 'struct backlight_device'
     180 |         bd->props.power = FB_BLANK_UNBLANK;
         |           ^~
   drivers/macintosh/via-pmu-backlight.c:181:9: error: implicit declaration of function 'backlight_update_status'; did you mean 'pmu_backlight_update_status'? [-Werror=implicit-function-declaration]
     181 |         backlight_update_status(bd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         pmu_backlight_update_status
>> drivers/macintosh/via-pmu-backlight.c:136:37: warning: unused variable 'props' [-Wunused-variable]
     136 |         struct backlight_properties props;
         |                                     ^~~~~
   drivers/macintosh/via-pmu-backlight.c: At top level:
   drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of 'pmu_backlight_data' isn't known
     108 | static const struct backlight_ops pmu_backlight_data = {
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of 'pmu_backlight_data' isn't known
   cc1: some warnings being treated as errors


vim +109 drivers/macintosh/via-pmu-backlight.c

0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  106  
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  107  
acc2472ed33fc5 Lionel Debroux         2010-11-16  108  static const struct backlight_ops pmu_backlight_data = {
5474c120aafe78 Michael Hanselmann     2006-06-25 @109  	.update_status	= pmu_backlight_update_status,
599a52d1262939 Richard Purdie         2007-02-10  110  
5474c120aafe78 Michael Hanselmann     2006-06-25  111  };
5474c120aafe78 Michael Hanselmann     2006-06-25  112  
4b755999d6e0c1 Michael Hanselmann     2006-07-30  113  #ifdef CONFIG_PM
d565dd3b0824b6 Benjamin Herrenschmidt 2006-08-31  114  void pmu_backlight_set_sleep(int sleep)
4b755999d6e0c1 Michael Hanselmann     2006-07-30  115  {
4b755999d6e0c1 Michael Hanselmann     2006-07-30  116  	unsigned long flags;
4b755999d6e0c1 Michael Hanselmann     2006-07-30  117  
4b755999d6e0c1 Michael Hanselmann     2006-07-30  118  	spin_lock_irqsave(&pmu_backlight_lock, flags);
d565dd3b0824b6 Benjamin Herrenschmidt 2006-08-31  119  	sleeping = sleep;
fa19d63488bd10 Benjamin Herrenschmidt 2008-03-03  120  	if (pmac_backlight && uses_pmu_bl) {
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  121  		if (sleep) {
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  122  			struct adb_request req;
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  123  
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  124  			pmu_request(&req, NULL, 2, PMU_POWER_CTRL,
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  125  				    PMU_POW_BACKLIGHT | PMU_POW_OFF);
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  126  			pmu_wait_complete(&req);
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  127  		} else
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  128  			__pmu_backlight_update_status(pmac_backlight);
0094f2cdcfb6f2 Benjamin Herrenschmidt 2007-12-20  129  	}
4b755999d6e0c1 Michael Hanselmann     2006-07-30  130  	spin_unlock_irqrestore(&pmu_backlight_lock, flags);
4b755999d6e0c1 Michael Hanselmann     2006-07-30  131  }
d565dd3b0824b6 Benjamin Herrenschmidt 2006-08-31  132  #endif /* CONFIG_PM */
4b755999d6e0c1 Michael Hanselmann     2006-07-30  133  
00f7b29f6e9b8a Mathieu Malaterre      2017-12-26  134  void __init pmu_backlight_init(void)
5474c120aafe78 Michael Hanselmann     2006-06-25  135  {
a19a6ee6cad2b2 Matthew Garrett        2010-02-17 @136  	struct backlight_properties props;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
