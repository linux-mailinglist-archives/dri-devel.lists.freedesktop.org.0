Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5AB28A09
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 04:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533AC10E2C3;
	Sat, 16 Aug 2025 02:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjvIG5MB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5610E0ED;
 Sat, 16 Aug 2025 02:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755310943; x=1786846943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zN4OcRDdLbpY1W3ggye7Zz0tj5nwJJ/VPiLjEbQYupo=;
 b=ZjvIG5MBxEEzlEgPY06OedA8xb8crBurkigZ3E/vkAzbeXqglP+0k+ZR
 lK959I4UDvm3I2jCKoaNXubhtXcnBZz6BPoqfyvFak4xSIdyB5fzaJCB0
 b6HpCjZUngdEVazQv766VY4mzPSDFb8xDUabbBNmIV5K15RwjYCtsHSYs
 8cQ/VFV4lJO8OtY6zr0U3yh9Ku135h35FKZtz3FmEVSNHbA9PGBSAhfQo
 ch0mDNSU2zG+UVEvRMbzfpZ7JQu2qbCXys4RqvLCdJGuknzaGjGNKesHs
 OuFHGEbJKppwIgbIv5px3UApL+l81Ne5D4oFVi5IQT0dYV7ymN76TBsLA w==;
X-CSE-ConnectionGUID: Ocu3YB03QhKDJOT4pVjRgQ==
X-CSE-MsgGUID: LAnERHjFQ7GkGiS0HGqKMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="80208672"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="80208672"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 19:22:23 -0700
X-CSE-ConnectionGUID: D7Z5p0x8T36LSycCTd3p+Q==
X-CSE-MsgGUID: 8P41UBWLSDWEaWegFqvdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172355567"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2025 19:22:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1un6Yf-000CVY-21;
 Sat, 16 Aug 2025 02:22:13 +0000
Date: Sat, 16 Aug 2025 10:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 alex.hung@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com
Subject: Re: [PATCH V11 28/47] drm/amd/display: Add support for sRGB EOTF in
 BLND block
Message-ID: <202508161043.tvyKbLyZ-lkp@intel.com>
References: <20250815035047.3319284-29-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815035047.3319284-29-alex.hung@amd.com>
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250815-120435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250815035047.3319284-29-alex.hung%40amd.com
patch subject: [PATCH V11 28/47] drm/amd/display: Add support for sRGB EOTF in BLND block
config: arm64-randconfig-002-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161043.tvyKbLyZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161043.tvyKbLyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161043.tvyKbLyZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1295:35: warning: variable 'blend_lut' is uninitialized when used here [-Wuninitialized]
    1295 |                 return __set_input_tf(NULL, tf, blend_lut, blend_size);
         |                                                 ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1276:39: note: initialize the variable 'blend_lut' to silence this warning
    1276 |         const struct drm_color_lut *blend_lut;
         |                                              ^
         |                                               = NULL
   1 warning generated.


vim +/blend_lut +1295 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

  1272	
  1273		struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
  1274		struct drm_colorop *colorop = colorop_state->colorop;
  1275		struct drm_device *drm = colorop->dev;
  1276		const struct drm_color_lut *blend_lut;
  1277		uint32_t blend_size = 0;
  1278	
  1279		if (colorop->type != DRM_COLOROP_1D_CURVE &&
  1280		    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
  1281			return -EINVAL;
  1282	
  1283		if (colorop_state->bypass) {
  1284			tf->type = TF_TYPE_BYPASS;
  1285			tf->tf = TRANSFER_FUNCTION_LINEAR;
  1286			return 0;
  1287		}
  1288	
  1289		drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
  1290	
  1291		if (colorop->type == DRM_COLOROP_1D_CURVE) {
  1292			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
  1293			tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
  1294			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> 1295			return __set_input_tf(NULL, tf, blend_lut, blend_size);
  1296		}
  1297	
  1298		return -EINVAL;
  1299	}
  1300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
