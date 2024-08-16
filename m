Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E995532C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68410E4F1;
	Fri, 16 Aug 2024 22:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilGfg/Yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164610E4D7;
 Fri, 16 Aug 2024 22:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723846401; x=1755382401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sPcUp1FQS2BRbEA2yt5YHsThRQwelt/WuH30iu1Cc4U=;
 b=ilGfg/YlLYUUbaqvhKMIq96dE0Cyco6CZwum1yLQb6laKMkuPxQ9u+y5
 bUdS5Tr9lGIUweQNDdp76toIdD2KiX7FPYfCtVHpgmLWXj1GvOzHbcCpl
 KNn+dm1+L3bJShB4XXf8oqH/5jJ2ls3vXVJugqqvyHxJYqPtwCM1hvVu6
 CzwzTr8Lm1jjVpojylUZzMINgEiMaRX6ORML7RQZWMwZAcCnqxfs30H5+
 PKPoimwLOLwiFh8vx3bg/zSryhSg/a0J4QTodFUc7zR4KjEb/UZzFo5+c
 fy/h8ZhfGYYV5sISc42Z07ptGcfOBNJsyF7AelpdAGA4DcYBni9nu6eFO w==;
X-CSE-ConnectionGUID: 3MVtuVDuSZSIiOrkLoCrHA==
X-CSE-MsgGUID: Zy7vO67/Qay3Dhuxcauosg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22327720"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22327720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 15:13:20 -0700
X-CSE-ConnectionGUID: BMT6QSXbReKZXtItx2hrTg==
X-CSE-MsgGUID: UQSLSOLpSeSzL/Jy46GsEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59641948"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 16 Aug 2024 15:13:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sf5C6-0006zK-2I;
 Fri, 16 Aug 2024 22:13:14 +0000
Date: Sat, 17 Aug 2024 06:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dipendra Khadka <kdipendra88@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, hRodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dipendra Khadka <kdipendra88@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix warning: symbol 'dcn3_14_ip' was not declared.
 Should it be static? in dcn314_fpu.c
Message-ID: <202408170525.gIOPwT8A-lkp@intel.com>
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
config: x86_64-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170525.gIOPwT8A-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170525.gIOPwT8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170525.gIOPwT8A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dcn3_14_ip
   >>> referenced by dcn314_resource.c:0 (drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn314/dcn314_resource.c:0)
   >>>               drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.o:(dcn314_create_resource_pool) in archive vmlinux.a
   >>> referenced by dcn314_resource.c:1093 (drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn314/dcn314_resource.c:1093)
   >>>               drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.o:(dcn314_create_resource_pool) in archive vmlinux.a
   >>> referenced by dcn314_resource.c:1093 (drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn314/dcn314_resource.c:1093)
   >>>               drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.o:(dcn314_create_resource_pool) in archive vmlinux.a
   >>> referenced 13 more times
   >>> did you mean: dcn3_15_ip
   >>> defined in: vmlinux.a(drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
