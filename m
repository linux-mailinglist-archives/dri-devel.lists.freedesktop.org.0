Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A69A5DA5D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 11:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1110E0F2;
	Wed, 12 Mar 2025 10:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJ0SkTcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94810E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741774894; x=1773310894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=41QWwJfAFHDyzTTvXUw28+dvX6bb0jw45B0uM9j0CvY=;
 b=aJ0SkTcu4SiwLvSXwGyXgUBkygC9cuWlDY+n3JIdhvnFYsLbBAU5OGSb
 /g84wcQFPl5o9KlZ50S/tqq638C59k35vr3f3c7pjGzWTBg3mBaKe4yH+
 t8eGFTiDLYXo33fIlcGBWbEEILxoSqnEp8sI8+lQh/x9CDlGq1KLXB97j
 dSduoMRJKHLaj73C7EZF9AYKQ7R0jCHAl43SL8t/wjY+hnkGpKLYvXlEQ
 vZbkO10S4DvnO3YoiQBaB+SSod4hhZ7iufuEAg4Dl9AMkMO1qstFAxh/1
 XWzqtAgJwILYG7slhxEsHHTt2vxZZXNQb3H2m0wuHaH4vhfcdnd0eDga3 w==;
X-CSE-ConnectionGUID: 0Be1lz8mRcmu+wpcIBmVlA==
X-CSE-MsgGUID: 6x0uVMusSM6o3zWIecKgtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65306444"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65306444"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:21:34 -0700
X-CSE-ConnectionGUID: B/5+MFx7QrW63VAKxIyfyg==
X-CSE-MsgGUID: g4KEu2WDSN6abvwq00/fpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125643020"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 03:21:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tsJDM-0008O0-2h;
 Wed, 12 Mar 2025 10:21:28 +0000
Date: Wed, 12 Mar 2025 18:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH 1/2] fbcon: Register sysfs groups through device_add_group
Message-ID: <202503121852.0x6J0c7a-lkp@intel.com>
References: <20250311112856.1020095-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311112856.1020095-1-oushixiong1025@163.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc6 next-20250311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbcon-Change-return-value-type-to-void/20250311-193230
base:   linus/master
patch link:    https://lore.kernel.org/r/20250311112856.1020095-1-oushixiong1025%40163.com
patch subject: [PATCH 1/2] fbcon: Register sysfs groups through device_add_group
config: sparc-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121852.0x6J0c7a-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121852.0x6J0c7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121852.0x6J0c7a-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_deinit_device':
>> drivers/video/fbdev/core/fbcon.c:3390:37: error: 'fb_info' undeclared (first use in this function)
    3390 |                 device_remove_group(fb_info->dev, &fbcon_device_attr_group);
         |                                     ^~~~~~~
   drivers/video/fbdev/core/fbcon.c:3390:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/fb_info +3390 drivers/video/fbdev/core/fbcon.c

  3388	
  3389		if (fbcon_has_sysfs) {
> 3390			device_remove_group(fb_info->dev, &fbcon_device_attr_group);
  3391	
  3392			fbcon_has_sysfs = 0;
  3393		}
  3394	}
  3395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
