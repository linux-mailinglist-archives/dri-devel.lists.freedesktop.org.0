Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C59B3BB3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 21:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6A10E21E;
	Mon, 28 Oct 2024 20:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njavdh9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5ED10E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730147565; x=1761683565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GXke4S11OGUxM+oXTk5LOHFA3kzYd2kP62er2e1iwlQ=;
 b=njavdh9uh+JDE/1B5JBBVq5VKjQOSPorKWUxiq2eep3MDJfvDDXoI4kE
 mLEDkcMWzIINabYlENVRC+pAseVX87fd+scuBqYBAs2VgnYSmDdP8830g
 itWxNQ6DD55VvbRM4XG+q9jDGx46jvj2tQuiTY5dgpIhTZqQ84Vdv9Rdb
 tD+vKyjljyykB0nSsrvCtiZ6JzhM55w1OyQtnH2WEz7+jB41p1p6LwASO
 tnXolmRJ/KyTRLWo8r2V3s/fUqyM2vCw3t8zRMNiIzfeg5j8lySzmoyhy
 VYI+pd3AI/Dr0p7rR2D2BdRA7giCrj+Zmc66Mvo3wU+Ep/CrcZmd5Kx03 Q==;
X-CSE-ConnectionGUID: 3Aoshf83RYeXfbfbnC/X6g==
X-CSE-MsgGUID: RcI45bLnRtm73H+luti/rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41126942"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="41126942"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 13:32:25 -0700
X-CSE-ConnectionGUID: mq1v9KTKR4O+iffjbSkq9A==
X-CSE-MsgGUID: 8efRSY0JSr+enrf6CYiT8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="82148253"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 13:32:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t5WPU-000cqq-1O;
 Mon, 28 Oct 2024 20:32:20 +0000
Date: Tue, 29 Oct 2024 04:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
Message-ID: <202410290452.XKXQkwp1-lkp@intel.com>
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
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

Hi Gonzalo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.12-rc5 next-20241028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gonzalo-Silvalde-Blanco/fbdev-udl-Make-CONFIG_FB_DEVICE-optional/20241025-172653
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241025092538.38339-1-gonzalo.silvalde%40gmail.com
patch subject: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
config: riscv-randconfig-r073-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290452.XKXQkwp1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290452.XKXQkwp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290452.XKXQkwp1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/udlfb.c:19:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/video/fbdev/udlfb.c:1485:35: warning: unused variable 'edid_attr' [-Wunused-const-variable]
    1485 | static const struct bin_attribute edid_attr = {
         |                                   ^~~~~~~~~
>> drivers/video/fbdev/udlfb.c:1493:38: warning: unused variable 'fb_device_attrs' [-Wunused-const-variable]
    1493 | static const struct device_attribute fb_device_attrs[] = {
         |                                      ^~~~~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/edid_attr +1485 drivers/video/fbdev/udlfb.c

7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1484  
598b2eedfc3fbe drivers/video/fbdev/udlfb.c   Bhumika Goyal      2017-08-18 @1485  static const struct bin_attribute edid_attr = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1486  	.attr.name = "edid",
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1487  	.attr.mode = 0666,
b9f03a3cd06c6f drivers/video/udlfb.c         Paul Mundt         2011-01-06  1488  	.size = EDID_LENGTH,
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1489  	.read = edid_show,
8ef8cc4fca4a92 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  1490  	.write = edid_store
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1491  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1492  
fa738a5c4b2a6b drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16 @1493  static const struct device_attribute fb_device_attrs[] = {
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1494  	__ATTR_RO(metrics_bytes_rendered),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1495  	__ATTR_RO(metrics_bytes_identical),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1496  	__ATTR_RO(metrics_bytes_sent),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1497  	__ATTR_RO(metrics_cpu_kcycles_used),
926c11151e3b82 drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2010-11-18  1498  	__ATTR(metrics_reset, S_IWUSR, NULL, metrics_reset_store),
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1499  };
7d9485e2c53caa drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  1500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
