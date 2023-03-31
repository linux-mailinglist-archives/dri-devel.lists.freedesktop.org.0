Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6C6D13DD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18A010F0AF;
	Fri, 31 Mar 2023 00:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61210E30E;
 Fri, 31 Mar 2023 00:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680221359; x=1711757359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y1UGoh+X/Y6FFXF7tNti3+usX6qoDVhQef5Jl5rCiWg=;
 b=IaLi7MPWzRNon4RgS9Mi8/VsvmO2J9+YEFk6iA/JbPzifCgVoSWeic6D
 wENYAMj8URQHJdNX84KcSHETWTZACycgzCDgKwcXDv99cAHgd7NVhdwNo
 z2e8+Pypeh8ZHG22pWfFpUu0adhULdi2UKCJTmmGGnLyc+576esCiUwa5
 wPXhwlNGRXm6r2KTXZ7LGszIFmQLodsvOm19LR94k3c9JnJL3R7OmpStQ
 WIbddxElPAN7hiWYolR1svVwvvrNgS9eeUVTwxCrzBncOSf8vB6n7ZpD0
 TPVDSeRlAKAQ+ROEXE8/waDOLyghtxb0wlq6ig3VeIxj1V06iW0lHV2WC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="369102854"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="369102854"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 17:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687448080"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="687448080"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2023 17:09:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pi2KS-000LKq-0n;
 Fri, 31 Mar 2023 00:09:16 +0000
Date: Fri, 31 Mar 2023 08:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch
 points operation
Message-ID: <202303310739.oWaXssZp-lkp@intel.com>
References: <20230327184339.125016-27-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327184339.125016-27-jonathan.kim@amd.com>
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
Cc: Felix.Kuehling@amd.com, llvm@lists.linux.dev, Jonathan.kim@amd.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20230330]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next-fixes linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230327184339.125016-27-jonathan.kim%40amd.com
patch subject: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch points operation
config: arm64-randconfig-r014-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310739.oWaXssZp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8c5e1781294f7e41d41632cb46e533c598933cd8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
        git checkout 8c5e1781294f7e41d41632cb46e533c598933cd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310739.oWaXssZp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: warning: no previous prototype for function 'kgd_gfx_aldebaran_clear_address_watch' [-Wmissing-prototypes]
   uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
   ^
   static 
   1 warning generated.
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:781:10: warning: no previous prototype for function 'kgd_gfx_v11_clear_address_watch' [-Wmissing-prototypes]
   uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
   ^
   static 
   1 warning generated.


vim +/kgd_gfx_aldebaran_clear_address_watch +164 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c

   163	
 > 164	uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
   165						uint32_t watch_id)
   166	{
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
