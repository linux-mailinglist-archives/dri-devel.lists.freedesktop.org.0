Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D95989A0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 19:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382610E3F9;
	Thu, 18 Aug 2022 17:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AF710E316;
 Thu, 18 Aug 2022 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660842481; x=1692378481;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=OajO0ASt/ZPv6TOpBQulZOiOmqVfbqj+iY4/9LI5ksU=;
 b=Ak6I/bQWdOea0avJnenAckvZGh3lODsAdEfHj99rJqqBdyFhmpMLiIVO
 HjkOIG0ojsRI4MuX+YtixgHVFklPuntQru0FRikH0V0wT4QXrQnukzT9u
 wP7soD5Gv6WWVBtYT66zB7oqqN6ZuEJMyiRBfc3DwKNOXCmuO0E16Bn2w
 UxdND/Vmu/DzcA+Ib1iuBo9FCH44qPoYRl6bUf0BcUf0Tg9qFl8hdRAfd
 aITH6W3sV9TS4+tLa2QjZcEa1as0dQgRaMZLtRmtZSck11hNN/ajuN18z
 ruXRGFUqcx4VWuz342pIQLD1D8aAfgrHtoCSxx5Cm9uRqoqxEifCUJtCR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="272591126"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="272591126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 10:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="935889250"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 18 Aug 2022 10:07:58 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oOizt-0000JJ-1F;
 Thu, 18 Aug 2022 17:07:57 +0000
Date: Fri, 19 Aug 2022 01:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 5b6a4bf680d61b1dd26629840f848d0df8983c62
Message-ID: <62fe71b9.HTupW2Bu5CHrCfQc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 5b6a4bf680d61b1dd26629840f848d0df8983c62  Add linux-next specific files for 20220818

Error/Warning: (recently discovered and may have been fixed)

drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5: warning: no previous prototype for 'fill_dc_scaling_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6: warning: no previous prototype for 'handle_cursor_update' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6: warning: no previous prototype for 'modifier_has_dcc' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5: warning: no previous prototype for 'amdgpu_dm_plane_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10: warning: no previous prototype for 'modifier_gfx9_swizzle_mode' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5: warning: no previous prototype for 'fill_plane_buffer_attributes' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for 'amd_get_format_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6: warning: no previous prototype for 'fill_blending_from_plane_state' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5: warning: no previous prototype for 'dm_plane_helper_check_state' [-Wmissing-prototypes]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:905:28: warning: variable 'top' set but not used [-Wunused-but-set-variable]
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|-- alpha-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- alpha-buildonly-randconfig-r002-20220818
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|-- alpha-randconfig-r024-20220818
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|-- alpha-randconfig-r031-20220818
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state

elapsed time: 725m

configs tested: 64
configs skipped: 2

gcc tested configs:
x86_64                        randconfig-a011
um                             i386_defconfig
x86_64                        randconfig-a013
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                        randconfig-a015
arm                                 defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a001
arc                  randconfig-r043-20220818
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20220818
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20220818
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
i386                          randconfig-a014
arc                               allnoconfig
x86_64                        randconfig-a002
m68k                             allmodconfig
ia64                             allmodconfig
powerpc                          allmodconfig
i386                          randconfig-a005
x86_64                               rhel-8.3
alpha                             allnoconfig
x86_64                           rhel-8.3-syz
riscv                             allnoconfig
i386                             allyesconfig
arc                              allyesconfig
csky                              allnoconfig
i386                          randconfig-a012
arm64                            allyesconfig
sh                               allmodconfig
i386                          randconfig-a016
alpha                            allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                        randconfig-a006
powerpc                      cm5200_defconfig
arm                             pxa_defconfig
powerpc                      ppc40x_defconfig
powerpc                      mgcoge_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220818
hexagon              randconfig-r045-20220818
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
mips                        maltaup_defconfig
mips                     loongson1c_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
