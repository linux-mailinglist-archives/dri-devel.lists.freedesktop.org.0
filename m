Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D543A4E5149
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C0110E69B;
	Wed, 23 Mar 2022 11:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65A10E689;
 Wed, 23 Mar 2022 11:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648034790; x=1679570790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=meqZnbbK7B8BK03iyZi+GqOjfSIM7QAQuJAs9z//UCY=;
 b=jJ2WoaqGww2Op/k0gTgNUXdS5Oip0mLFzyWxgBmYT/xTdH5OrPjQYkzm
 qcEgZDAtzIQ88mVLtsUJDjbzZsrsjhWYVppOUw+w0A7+GWzSfFGIMYokv
 6B11L1RSU9mUVYzdMA/3x14spzR0LieMZLVOzXCqjXTzfv0JlQ1C5D9yc
 McbEEF8MIFYo1Ijle/rgV+QhDqo2pggTn2Bucb6wL5Y288g6db1STC9Qb
 OmghijSfX5Yt/Af6AQzKjthOtwUXKrshGAmtmzsGsDZ/HdMR00NR2I/Y1
 n9WGjso+rnaAkX9TjWU2DpJsYQwYE9k1Fv/ArYDr39PtPVKJgUOxiB8o1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="238028784"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238028784"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 04:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="544154191"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2022 04:26:27 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWz8E-000K0P-HM; Wed, 23 Mar 2022 11:26:26 +0000
Date: Wed, 23 Mar 2022 19:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Message-ID: <202203231911.crbWBIZj-lkp@intel.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 kbuild-all@lists.01.org, matthew.auld@intel.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arunpravin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on a678f97326454b60ffbbde6abf52d23997d71a27]

url:    https://github.com/0day-ci/linux/commits/Arunpravin-Paneer-Selvam/drm-amdgpu-add-drm-buddy-support-to-amdgpu/20220323-142749
base:   a678f97326454b60ffbbde6abf52d23997d71a27
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220323/202203231911.crbWBIZj-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5aa85728d353f9bcca7e25e17f800d014d77dee2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin-Paneer-Selvam/drm-amdgpu-add-drm-buddy-support-to-amdgpu/20220323-142749
        git checkout 5aa85728d353f9bcca7e25e17f800d014d77dee2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:73,
                    from drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:29:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:29:10: fatal error: amdgpu_vram_mgr.h: No such file or directory
      29 | #include "amdgpu_vram_mgr.h"
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:73,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ttm.h:29:10: fatal error: amdgpu_vram_mgr.h: No such file or directory
      29 | #include "amdgpu_vram_mgr.h"
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:3049:26: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
    3049 |                 uint64_t temp;
         |                          ^~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:73,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:44:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ttm.h: At top level:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ttm.h:29:10: fatal error: amdgpu_vram_mgr.h: No such file or directory
      29 | #include "amdgpu_vram_mgr.h"
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +29 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h

    26	
    27	#include <linux/dma-direction.h>
    28	#include <drm/gpu_scheduler.h>
  > 29	#include "amdgpu_vram_mgr.h"
    30	#include "amdgpu.h"
    31	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
