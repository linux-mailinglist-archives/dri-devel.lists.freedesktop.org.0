Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96971595F83
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B262B10E4CE;
	Tue, 16 Aug 2022 15:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE68BB29;
 Tue, 16 Aug 2022 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660664759; x=1692200759;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=+iQ63kE0PzIS7sChTLoQskV1wRb2XpAS+UEE3rIsNUQ=;
 b=NKKihUOTAJZNCGtfot/xF21RR06i8jIPaxmJGJkE6Cah9RWwIvcVivYt
 kNsEe4nv9sGQVZeCf/FOPFH2Kb0y6ZXc8t/Q7rLb+4QjFWvmLReiTkJyW
 sIUqdjvAIoCESY76DtAIC0rkh4kESDr4Xkt/+aUGupqkOCkWvyZ2Erezf
 N4lE7438O/bDyFsibuY7la6loqvYsglzkrh2/FkC9SUzY2grC7LDxUKIY
 OUD5AWzydgaQyeOuQNyoXyGe+I1WVJndyheaiODSsnUxiMyg7Rg5xmTm/
 rpk518xr0LUxu0FmxXyI5VvsLxdX8r+l+J4+v1UcfQ865H4Uo1j83Fu5G A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="356257354"
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="356257354"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 08:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="675265674"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2022 08:45:56 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oNylP-00002s-2Y;
 Tue, 16 Aug 2022 15:45:55 +0000
Date: Tue, 16 Aug 2022 23:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 e1084bacab44f570691c0fdaa1259acf93ed0098
Message-ID: <62fbbba7.FTVctBJTzk0OdnQC%lkp@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: e1084bacab44f570691c0fdaa1259acf93ed0098  Add linux-next specific files for 20220816

Error/Warning reports:

https://lore.kernel.org/linux-doc/202208162058.7apPivKL-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
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
include/linux/random.h:25:46: error: 'latent_entropy' undeclared (first use in this function); did you mean 'add_latent_entropy'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
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
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm64-allyesconfig
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
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state

elapsed time: 697m

configs tested: 48
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
mips                             allyesconfig
arm                           h3600_defconfig
arm                                 defconfig
m68k                        m5272c3_defconfig
arm                      integrator_defconfig
mips                          rb532_defconfig
m68k                        m5307c3_defconfig
mips                         bigsur_defconfig
riscv                    nommu_k210_defconfig
arm                         at91_dt_defconfig
powerpc                      chrp32_defconfig
xtensa                generic_kc705_defconfig
sh                            shmin_defconfig
powerpc                     redwood_defconfig
xtensa                              defconfig
xtensa                  nommu_kc705_defconfig
sh                        sh7785lcr_defconfig
powerpc                     sequoia_defconfig
arm                           corgi_defconfig
ia64                      gensparse_defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig

clang tested configs:
powerpc                      acadia_defconfig
mips                          rm200_defconfig
arm                       versatile_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        multi_v5_defconfig
powerpc                      ppc64e_defconfig
arm                        spear3xx_defconfig
arm                         lpc32xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
