Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44848868
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 20:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6FB10EC88;
	Sat,  3 Feb 2024 19:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuhPDqUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEFE10EB3B
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706987609; x=1738523609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pHok6RksrsEONhRmSw62ZPWwkRDVQiY7VhfooE0bS7I=;
 b=RuhPDqUAWMmDQ7UmDnI2Vd0SkYiZfmlNpO8Y/KELZWEvUFDSSESdk29Z
 xzkbEK0vQ7Nhsl40VF/3w0YU/kgcMu5mWcs6NexJNzl869a8E/PLu5Nz7
 AzrRMux3/6SqF3fNNRMGh97HeuSe5WYSbm9xL285Ho7GBOXTKC7/k9Uun
 NSsWpE6TI/KXQSEb1VpmE392hADM9bnzPVRVz0odzw5N+J1LwoLRqqHdy
 dP/vlO11nfmaqx3H9p9xioL+f8MDzUxX3lfCwsMKgLM64w1cbpi71hdLj
 xVu04kRQuWsMCTptTuwDj9HYd+nRxQnF3Sfw/8sgvObHUfFszGKX5Aqyp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435476118"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; d="scan'208";a="435476118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 11:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4973109"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 11:13:21 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWLS2-0005Ug-1p;
 Sat, 03 Feb 2024 19:13:18 +0000
Date: Sun, 4 Feb 2024 03:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/8] firmware/sysfb: Set firmware-framebuffer parent
 device
Message-ID: <202402040214.GFutmkRC-lkp@intel.com>
References: <20240202120140.3517-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202120140.3517-4-tzimmermann@suse.de>
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
[also build test ERROR on drm-tip/drm-tip linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/video-Add-helpers-for-decoding-screen_info/20240202-200314
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240202120140.3517-4-tzimmermann%40suse.de
patch subject: [PATCH v2 3/8] firmware/sysfb: Set firmware-framebuffer parent device
config: i386-buildonly-randconfig-002-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040214.GFutmkRC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040214.GFutmkRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040214.GFutmkRC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/sysfb.c: In function 'sysfb_init':
>> drivers/firmware/sysfb.c:104:8: error: too many arguments to function 'sysfb_create_simplefb'
      pd = sysfb_create_simplefb(si, &mode, parent);
           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/sysfb.c:36:0:
   include/linux/sysfb.h:105:39: note: declared here
    static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
                                          ^~~~~~~~~~~~~~~~~~~~~


vim +/sysfb_create_simplefb +104 drivers/firmware/sysfb.c

    83	
    84	static __init int sysfb_init(void)
    85	{
    86		struct screen_info *si = &screen_info;
    87		struct device *parent;
    88		struct simplefb_platform_data mode;
    89		const char *name;
    90		bool compatible;
    91		int ret = 0;
    92	
    93		mutex_lock(&disable_lock);
    94		if (disabled)
    95			goto unlock_mutex;
    96	
    97		sysfb_apply_efi_quirks();
    98	
    99		parent = sysfb_parent_dev(si);
   100	
   101		/* try to create a simple-framebuffer device */
   102		compatible = sysfb_parse_mode(si, &mode);
   103		if (compatible) {
 > 104			pd = sysfb_create_simplefb(si, &mode, parent);
   105			if (!IS_ERR(pd))
   106				goto unlock_mutex;
   107		}
   108	
   109		/* if the FB is incompatible, create a legacy framebuffer device */
   110		if (si->orig_video_isVGA == VIDEO_TYPE_EFI)
   111			name = "efi-framebuffer";
   112		else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
   113			name = "vesa-framebuffer";
   114		else if (si->orig_video_isVGA == VIDEO_TYPE_VGAC)
   115			name = "vga-framebuffer";
   116		else if (si->orig_video_isVGA == VIDEO_TYPE_EGAC)
   117			name = "ega-framebuffer";
   118		else
   119			name = "platform-framebuffer";
   120	
   121		pd = platform_device_alloc(name, 0);
   122		if (!pd) {
   123			ret = -ENOMEM;
   124			goto unlock_mutex;
   125		}
   126	
   127		pd->dev.parent = parent;
   128	
   129		sysfb_set_efifb_fwnode(pd);
   130	
   131		ret = platform_device_add_data(pd, si, sizeof(*si));
   132		if (ret)
   133			goto err;
   134	
   135		ret = platform_device_add(pd);
   136		if (ret)
   137			goto err;
   138	
   139		goto unlock_mutex;
   140	err:
   141		platform_device_put(pd);
   142	unlock_mutex:
   143		mutex_unlock(&disable_lock);
   144		return ret;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
