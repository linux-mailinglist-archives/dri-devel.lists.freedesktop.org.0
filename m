Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1DAEA8DE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342DE10E2F1;
	Thu, 26 Jun 2025 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVH0+HGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB2C10E2F1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 21:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750973331; x=1782509331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PLZzAdX+5PzAgrtD7ATf2kU/OYqwm6guag3uzHDX384=;
 b=OVH0+HGaFJbdI515+Ix3IhEXRqlZGLFJokikQhBO0rJ3p1HarwGJZ8ZE
 UhQ1jTsZ9B5q+4oxw68A/h7sb6RQZwmqnBS0RzW/H3PzxiTPrEWPuSiXI
 VoEegrhH4OP2k9zTmnOvT16506GU1BmvpTpHy70nxbrvj2DaHHHpb2iha
 jGNmIINNkNBmL4YK6Xgj9TytF2T/mVX4COGqwPOwQNXSeBEMw5Jr0V1vv
 SsmtRyN3QAWJyqm/7KLtAKNe5tBoF+3zGSIporSvyTk9XdIOfiMuT22EO
 degbxGCKlZEX/lP7u94g/ADLG7ishPCf9cAlNJT5dnXWGo0lMQ9oUUY9S w==;
X-CSE-ConnectionGUID: d78DWyVwQFK86sMP4Djs5A==
X-CSE-MsgGUID: oVK48qaCSGu0Bep7+UB7zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53008182"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53008182"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:28:51 -0700
X-CSE-ConnectionGUID: dA2POMMHSBGcOFw3AQerzw==
X-CSE-MsgGUID: 8Nwjcn/pS7iKXdke8f6K5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153149425"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 14:28:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUu9G-000VYE-0p;
 Thu, 26 Jun 2025 21:28:46 +0000
Date: Fri, 27 Jun 2025 05:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
Message-ID: <202506270558.awnEnyeN-lkp@intel.com>
References: <20250626094937.515552-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626094937.515552-1-oushixiong1025@163.com>
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc3 next-20250626]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbdev-efifb-do-not-load-efifb-if-PCI-BAR-has-changed-but-not-fixuped/20250626-175111
base:   linus/master
patch link:    https://lore.kernel.org/r/20250626094937.515552-1-oushixiong1025%40163.com
patch subject: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed but not fixuped
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250627/202506270558.awnEnyeN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270558.awnEnyeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270558.awnEnyeN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:110:
   In file included from arch/arm/include/asm/setup.h:14:
>> include/linux/screen_info.h:145:6: warning: no previous prototype for function 'screen_info_is_useful' [-Wmissing-prototypes]
     145 | bool screen_info_is_useful(void)
         |      ^
   include/linux/screen_info.h:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | bool screen_info_is_useful(void)
         | ^
         | static 
   1 warning generated.


vim +/screen_info_is_useful +145 include/linux/screen_info.h

   139	
   140	#if defined(CONFIG_PCI)
   141	bool screen_info_is_useful(void);
   142	void screen_info_apply_fixups(void);
   143	struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
   144	#else
 > 145	bool screen_info_is_useful(void)
   146	{
   147		return true;
   148	}
   149	static inline void screen_info_apply_fixups(void)
   150	{ }
   151	static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
   152	{
   153		return NULL;
   154	}
   155	#endif
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
