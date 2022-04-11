Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A54FC7EC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97B210E50B;
	Mon, 11 Apr 2022 22:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E1D10E4FE;
 Mon, 11 Apr 2022 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649717903; x=1681253903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4Z9VI6tEyTt8ATI/3X1UsbKKq6JOuVqvsq8x+y0yhEY=;
 b=N8O79R8n1UZa4D3FIdsE1caQ+raAY4O6zOcV9zoSGVb6Ix/bnobQ38fh
 wlVj0zEqXSRxfkAZMjw4rzyxRA0/6og8lO3sE3wPwaw5CE3S5bkJDdzB/
 Zh5a3HS2WTmEcUohaaX655eaxmJfqdzPDlXhlCxOUgNOhhJJjpRVo5AZx
 WjzjEYVsolHMkjgRABhDvQoKKnotJaXIsHd8CVZrSedNQvSWj6I7ypriK
 s1R+XXnVRrPz+8EBpL8sSdsaPADIxpe9Fwf8M1hCZg+2VsCQBJAY8RDIw
 fWdvikLanHGqj7YNdNrx4WKRpojayrVM9A1p2NhdM2X4ZynxVSdAJfSyD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242171939"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="242171939"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="525761722"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 11 Apr 2022 15:58:19 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ne2zC-0002IA-Ba;
 Mon, 11 Apr 2022 22:58:18 +0000
Date: Tue, 12 Apr 2022 06:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Gong <richard.gong@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, xinhui.pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Message-ID: <202204120618.4I6dOUw9-lkp@intel.com>
References: <20220408190502.4103670-1-richard.gong@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408190502.4103670-1-richard.gong@amd.com>
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
Cc: kbuild-all@lists.01.org, richard.gong@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Richard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Gong/drm-amdgpu-disable-ASPM-on-Intel-AlderLake-based-systems/20220409-030656
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20220412/202204120618.4I6dOUw9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bb9a037cafa91918c2ece823591d1d04b812ae17
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Richard-Gong/drm-amdgpu-disable-ASPM-on-Intel-AlderLake-based-systems/20220409-030656
        git checkout bb9a037cafa91918c2ece823591d1d04b812ae17
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/mutex.h:19,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/gpu/drm/amd/amdgpu/vi.c:24:
   drivers/gpu/drm/amd/amdgpu/vi.c: In function 'intel_core_apsm_chk':
   arch/um/include/asm/processor-generic.h:103:19: error: called object is not a function or function pointer
     103 | #define cpu_data (&boot_cpu_data)
         |                  ~^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vi.c:1144:34: note: in expansion of macro 'cpu_data'
    1144 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/vi.c:1146:18: error: invalid use of undefined type 'struct cpuinfo_x86'
    1146 |         return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
         |                  ^~
   drivers/gpu/drm/amd/amdgpu/vi.c:1146:33: error: invalid use of undefined type 'struct cpuinfo_x86'
    1146 |         return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
         |                                 ^~
   drivers/gpu/drm/amd/amdgpu/vi.c:1150:1: error: control reaches end of non-void function [-Werror=return-type]
    1150 | }
         | ^
   cc1: some warnings being treated as errors


vim +1146 drivers/gpu/drm/amd/amdgpu/vi.c

  1140	
  1141	static bool intel_core_apsm_chk(void)
  1142	{
  1143	#if IS_ENABLED(CONFIG_X86_64)
  1144		struct cpuinfo_x86 *c = &cpu_data(0);
  1145	
> 1146		return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
  1147	#else
  1148		return false;
  1149	#endif
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
