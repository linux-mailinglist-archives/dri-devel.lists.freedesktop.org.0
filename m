Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCAE9916B7
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 14:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE8D10E297;
	Sat,  5 Oct 2024 12:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5oC2KK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACB910E008;
 Sat,  5 Oct 2024 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728131171; x=1759667171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Igr48R498Wzu0SIf228phB0bu1PcY52H7/B8xqNLydo=;
 b=d5oC2KK54U7W3ZmeEacI+5Q+i83WAn8NIq9zNOiVPA2+JrS8tAcDx/1t
 JqivAbT8LYTgegy6axzE2Rj+PR8nzlwCDhFmHf8SMrpbEWVCpb07CnbzV
 Mb4cBz4SMJnB4LGpnI9RFN7HrV4LgPFtZVCN6qoU+W5XfipMdEWgXDFEg
 Yo+pXHVb8khQwTQCgRkVIZEb9MTXgXBpYQWBH/KISMXRVCY15JaBITpIF
 RskVUMVsKHY5zbliqFdbMpCFQXAq0WhmbHx2gdBAJZjPbmuetc5EbnvqW
 mdevdqsVWPrmBLjC92zk+ONVbHDmMUvr6cxEUl1qSwqZcY+ZR4b2hnyKr Q==;
X-CSE-ConnectionGUID: H8LrPY3ASqW4w28ziM64+A==
X-CSE-MsgGUID: VveF8M+qSP2f0e8OVxqsfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27429819"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="27429819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 05:26:10 -0700
X-CSE-ConnectionGUID: 2NomVjyjQzWUt5gJo29ZQQ==
X-CSE-MsgGUID: ny8EpOLHSRetJCf7ThMBbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="98279561"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2024 05:26:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sx3rJ-0002vc-2t;
 Sat, 05 Oct 2024 12:26:05 +0000
Date: Sat, 5 Oct 2024 20:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v6 29/44] drm/amd/display: Add support for sRGB EOTF in
 BLND block
Message-ID: <202410052046.3g21jba1-lkp@intel.com>
References: <20241003200129.1732122-30-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-30-harry.wentland@amd.com>
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
[also build test WARNING on drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-30-harry.wentland%40amd.com
patch subject: [PATCH v6 29/44] drm/amd/display: Add support for sRGB EOTF in BLND block
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410052046.3g21jba1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052046.3g21jba1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052046.3g21jba1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1296:46: warning: variable 'blend_size' is uninitialized when used here [-Wuninitialized]
    1296 |                 return __set_input_tf(NULL, tf, blend_lut, blend_size);
         |                                                            ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1278:21: note: initialize the variable 'blend_size' to silence this warning
    1278 |         uint32_t blend_size;
         |                            ^
         |                             = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/blend_size +1296 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

  1273	
  1274		struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
  1275		struct drm_colorop *colorop = colorop_state->colorop;
  1276		struct drm_device *drm = colorop->dev;
  1277		const struct drm_color_lut *blend_lut;
  1278		uint32_t blend_size;
  1279	
  1280		if (colorop->type != DRM_COLOROP_1D_CURVE &&
  1281		    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
  1282			return -EINVAL;
  1283	
  1284		if (colorop_state->bypass) {
  1285			tf->type = TF_TYPE_BYPASS;
  1286			tf->tf = TRANSFER_FUNCTION_LINEAR;
  1287			return 0;
  1288		}
  1289	
  1290		drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
  1291	
  1292		if (colorop->type == DRM_COLOROP_1D_CURVE) {
  1293			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
  1294			tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
  1295			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> 1296			return __set_input_tf(NULL, tf, blend_lut, blend_size);
  1297		}
  1298	
  1299		return -EINVAL;
  1300	}
  1301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
