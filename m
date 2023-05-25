Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A171023B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7010110E623;
	Thu, 25 May 2023 01:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399A410E488;
 Thu, 25 May 2023 01:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684977214; x=1716513214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J6PiiNN65SAkxEE9Kw6L/fdlPaOlqkkPzRVNGIcSzos=;
 b=lsgFZ28L6tNJJOp1nphOrFM3ZMRgZcPQv6bPpeZwSScH3EZiScgUuwcM
 T1kt9rfvnFsT/xnv71Dvyz5Fdjul66qonORJdcZE9LOus38YCDkI2j+Nj
 k+whtttQl6pHo3VjFXrOjqFfUmwO0XhbWx2WP0WX3x5H4ydfxAf2gz9gT
 Rkq+3YNFxrRpQbfu0j253sgkjQwZy8qJHYPFoiuq+JY7ZyjjG6kzBCIQ+
 Zwf67R8hWp18ppTymTpwLrJSb3din7ptIekWp/bljfk0c4srAgCykZ2zj
 /FIW4ThpaLhrkEk7DE5ttLlCTJo1dURtLWqynY6lmAefZTGlQ9eORD8KC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356974931"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="356974931"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 18:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655010263"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655010263"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 24 May 2023 18:13:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q1zXk-000FKj-01;
 Thu, 25 May 2023 01:13:28 +0000
Date: Thu, 25 May 2023 09:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 21/36] drm/amd/display: add CRTC 3D LUT support
Message-ID: <202305250946.OXXF7YXr-lkp@intel.com>
References: <20230523221520.3115570-22-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523221520.3115570-22-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 oe-kbuild-all@lists.linux.dev,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc3 next-20230524]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-drm_mode_object-increase-max-objects-to-accommodate-new-color-props/20230524-062917
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230523221520.3115570-22-mwen%40igalia.com
patch subject: [PATCH 21/36] drm/amd/display: add CRTC 3D LUT support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230525/202305250946.OXXF7YXr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/be212490fea8837eece5d56fa4a4963c0a21626f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Melissa-Wen/drm-drm_mode_object-increase-max-objects-to-accommodate-new-color-props/20230524-062917
        git checkout be212490fea8837eece5d56fa4a4963c0a21626f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305250946.OXXF7YXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:515: warning: expecting prototype for amdgpu_dm_lut3d_size(). Prototype was for amdgpu_dm_get_lut3d_size() instead


vim +515 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

   504	
   505	/**
   506	 * amdgpu_dm_lut3d_size - get expected size according to hw color caps
   507	 * @adev: amdgpu device
   508	 * @lut_size: default size
   509	 *
   510	 * Return:
   511	 * lut_size if DC 3D LUT is supported, zero otherwise.
   512	 */
   513	static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
   514						 uint32_t lut_size)
 > 515	{
   516		return adev->dm.dc->caps.color.mpc.num_3dluts ? lut_size : 0;
   517	}
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
