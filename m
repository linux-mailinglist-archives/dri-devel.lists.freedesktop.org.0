Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFC59A29D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B306D10F0F2;
	Fri, 19 Aug 2022 16:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA71610F0F2;
 Fri, 19 Aug 2022 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660927388; x=1692463388;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vJ4mT+GSo6ERAE1lxJMfjzM4MAvhWOC+o59SFQDfCMM=;
 b=SBR3JHOFyWGYQB0yrVUxASAMB6XA88zrHVJrL98MaQ9hTjpiwezFFjuW
 AzcUIVhtT72tjA49Ntp4VCxhJSZF4ds0kzd+fTwp2/BOAUGy+HjNK4NEk
 nE5OE37yNJ4vqFIAZplEiPavELkIoHN81UzGBISk4aQ7rRUT/ZNBkyuR+
 APzmt8tqQkS+m380xjBIlB/0D2CB9tjCdX92n6vjAOufzjokmauMmUZAx
 +a78vMrBTHdIgc80CLE9GG5Y7nfV87hwcUtzQqXHYTxPt3u/zRGKqy7Z/
 9ITqib1LAX01ZC3ghFoPOPXsNR901Vpk+2x1Z5A/f/b62Wqkkchx5uRan w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="291805989"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="291805989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 09:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="641311133"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2022 09:43:05 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oP55M-0001dr-1G;
 Fri, 19 Aug 2022 16:43:04 +0000
Date: Sat, 20 Aug 2022 00:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 8755ae45a9e8ae883fa7f4eb0162830c55aacf14
Message-ID: <62ffbd7c.64C1TF454zi41jGk%lkp@intel.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 sound-open-firmware@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8755ae45a9e8ae883fa7f4eb0162830c55aacf14  Add linux-next specific files for 20220819

Error/Warning reports:

https://lore.kernel.org/linux-doc/202208192207.a0rAM0nj-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/translations/zh_CN/process/5.Posting.rst:197: WARNING: undefined label: cn_email_clients (if the link has no caption the label must precede a section header)
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
sound/soc/sof/compress.c:330:13: warning: variable 'dai_posn' set but not used [-Wunused-but-set-variable]
sound/soc/sof/intel/hda-codec.c:216:17: error: too few arguments to function 'hda_codec_device_init'

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
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
|-- alpha-randconfig-r002-20220819
|   `-- sound-soc-sof-intel-hda-codec.c:error:too-few-arguments-to-function-hda_codec_device_init
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
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
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
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state

elapsed time: 723m

configs tested: 66
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220819
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
powerpc                           allnoconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                          randconfig-a016
openrisc                            defconfig
powerpc                      tqm8xx_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
sh                          lboxre2_defconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                           viper_defconfig
ia64                             allmodconfig
mips                    maltaup_xpa_defconfig
sh                         ap325rxa_defconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig

clang tested configs:
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
x86_64                        randconfig-a016
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a014
i386                          randconfig-a002
arm                           spitz_defconfig
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
mips                      maltaaprp_defconfig
powerpc                   lite5200b_defconfig
mips                      malta_kvm_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
