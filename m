Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A29593BA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 06:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5B510E579;
	Wed, 21 Aug 2024 04:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFF0R0Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D15F10E246;
 Wed, 21 Aug 2024 04:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724215988; x=1755751988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e9cRXMHPwsjc4eS2oAVv7CuGsm4fG7al7v4a8+Qf4YQ=;
 b=IFF0R0Rk2BBRxqM+Sfh7Ay3swad8636F5MV7LOEdPwPEULKu5gozbbZX
 SlACGoEg074CvDGFG94jHU7qstIiOZ5ngmxMTc8jF/G2JorNbhO91DlO/
 DnbDAAZCY3Ki13fqIlvm82aJbfTV6lgZcUTrWVOModmCEGTayf8NXC1dL
 JKP0Dwh9J1XBGpO7Z7vdcOzA7ZHK1tZFmONAa9Xlrbq9c9UcOdJAEBccx
 ejOAytH+kuaQWAl5PYKCEvPoZMmx37rO7ekN5KIOONHZBjpE2vA7OmqrW
 dTC0VdPX0C7+OV450JmANnadj+82vcwicwCPZwFySMc/l1Eq0XciqTk55 A==;
X-CSE-ConnectionGUID: G+SY/DhIQuG+ssT8v5t2CQ==
X-CSE-MsgGUID: MyA0bPmERJu9PvuPo5E83w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40011067"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="40011067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 21:53:08 -0700
X-CSE-ConnectionGUID: Qg/IaytxTMqaEHocC/oEOA==
X-CSE-MsgGUID: 5DNhF1n/SRaUggpClAtcTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="65846597"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 20 Aug 2024 21:53:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sgdLF-000Aug-0Z;
 Wed, 21 Aug 2024 04:53:05 +0000
Date: Wed, 21 Aug 2024 12:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 28/44] drm/amd/display: Add support for sRGB Inverse
 EOTF in SHAPER block
Message-ID: <202408211241.xAvubshv-lkp@intel.com>
References: <20240819205714.316380-29-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819205714.316380-29-harry.wentland@amd.com>
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

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-29-harry.wentland%40amd.com
patch subject: [PATCH v5 28/44] drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
config: x86_64-randconfig-003-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211241.xAvubshv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211241.xAvubshv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211241.xAvubshv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1232:42: warning: variable 'shaper_size' is uninitialized when used here [-Wuninitialized]
    1232 |                 return __set_output_tf(tf, shaper_lut, shaper_size, false);
         |                                                        ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1214:22: note: initialize the variable 'shaper_size' to silence this warning
    1214 |         uint32_t shaper_size;
         |                             ^
         |                              = 0
   1 warning generated.


vim +/shaper_size +1232 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

  1205	
  1206	static int
  1207	__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
  1208			       struct drm_colorop_state *colorop_state)
  1209	{
  1210		struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
  1211		struct drm_colorop *colorop = colorop_state->colorop;
  1212		struct drm_device *drm = colorop->dev;
  1213		const struct drm_color_lut *shaper_lut;
  1214		uint32_t shaper_size;
  1215	
  1216		if (colorop->type != DRM_COLOROP_1D_CURVE &&
  1217		    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
  1218			return -EINVAL;
  1219	
  1220		if (colorop_state->bypass) {
  1221			tf->type = TF_TYPE_BYPASS;
  1222			tf->tf = TRANSFER_FUNCTION_LINEAR;
  1223			return 0;
  1224		}
  1225	
  1226		drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
  1227	
  1228		if (colorop->type == DRM_COLOROP_1D_CURVE) {
  1229			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
  1230			tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
  1231			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> 1232			return __set_output_tf(tf, shaper_lut, shaper_size, false);
  1233		}
  1234	
  1235		return -EINVAL;
  1236	}
  1237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
