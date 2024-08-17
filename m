Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7D9558FE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 18:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB8F10E0C7;
	Sat, 17 Aug 2024 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oab+Z/fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5A10E0C4;
 Sat, 17 Aug 2024 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723912549; x=1755448549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cIq6tITWCPVOHi1mX6/s16HXzCeadnclsTCFYqbtJEc=;
 b=Oab+Z/fopfxu/9sUxddJceNzwgI+g4i1tgQ271J4AXDze6gzhp7m1buM
 PzWYD9ZclYac/n7a+G2h1HEgNEn0DNntKPj75XkAYUfZSWvZzuyFlJpN5
 maq3TtrpEJr1n1JGnwW3oIL7c+1Qh2vsAWGjQpqsPb2KIjLAlnAdFi+uK
 yTE4ElbZ4S0WRjiZUZUglDE97kKqxe6oq84FLP7vFKMhJvmsyFPrGEGKM
 TXK1sgSmF3siNKzq0qE8cjxcjRoXqAowakYoF0upYemb4qF8JruKatTp5
 Dc19USCvazHbbNrpuQDmYm0PefDJBSveTmcEAW4zh0mLY7/4RKLWPVXJb A==;
X-CSE-ConnectionGUID: ttUURejRTX+IsDVvURTvvg==
X-CSE-MsgGUID: fA3vBwBfQtSpSMcghvPWNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44714188"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="44714188"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 09:35:49 -0700
X-CSE-ConnectionGUID: ivkCYo+uTKmkApLP69OaLQ==
X-CSE-MsgGUID: iKcGbF2DSc6ONgQ1wSvleQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64919725"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 17 Aug 2024 09:35:46 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfMP1-0007e6-14;
 Sat, 17 Aug 2024 16:35:43 +0000
Date: Sun, 18 Aug 2024 00:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dipendra Khadka <kdipendra88@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, hRodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Dipendra Khadka <kdipendra88@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix warning: symbol 'dcn3_14_ip' was not declared.
 Should it be static? in dcn314_fpu.c
Message-ID: <202408180054.z1Y6Mfuo-lkp@intel.com>
References: <20240815185629.65725-1-kdipendra88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815185629.65725-1-kdipendra88@gmail.com>
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

Hi Dipendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dipendra-Khadka/Fix-warning-symbol-dcn3_14_ip-was-not-declared-Should-it-be-static-in-dcn314_fpu-c/20240816-025925
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240815185629.65725-1-kdipendra88%40gmail.com
patch subject: [PATCH] Fix warning: symbol 'dcn3_14_ip' was not declared. Should it be static? in dcn314_fpu.c
config: x86_64-randconfig-121-20240816 (https://download.01.org/0day-ci/archive/20240818/202408180054.z1Y6Mfuo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180054.z1Y6Mfuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180054.z1Y6Mfuo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "dcn3_14_ip" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
