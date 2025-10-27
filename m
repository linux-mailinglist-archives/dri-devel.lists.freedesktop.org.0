Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDEC0F7D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49010E507;
	Mon, 27 Oct 2025 16:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PsnPkIfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469C510E507;
 Mon, 27 Oct 2025 16:58:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E3426035B;
 Mon, 27 Oct 2025 16:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3E5C4CEF1;
 Mon, 27 Oct 2025 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1761584324;
 bh=u/8LtKb/YZnTr0SdDWDpj3HXO1hrnkgpetw9i1zPxcs=;
 h=Date:From:To:Subject:From;
 b=PsnPkIfRXGQfwzNPMddGOxap3bFroka8vH7pZstmVC0R8MCrGjypFNyM0EHqQeq1B
 bY0V7E0ibdQcGJ2N6pqoVS0EFBmQRvIn3wwtvZ7T//Jf0TamYbRAAE/k2+2VwK16if
 A/JkYzptOebkQchA24VGtSwHMv2VFUH9aE5CaY8Y=
Date: Mon, 27 Oct 2025 09:58:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Fw: [linux-next:master] BUILD REGRESSION
 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
Message-Id: <20251027095843.1594c40cbcacbc3ebf8c575c@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fyi, drivers/gpu/drm/amd/amdgpu has a 32-bit glitch.


Begin forwarded message:

Date: Tue, 28 Oct 2025 00:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87


tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87  Add linux-next specific files for 20251027

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202510211913.5a4SfQab-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202510230222.gjGA0A40-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202510230749.0FuAVuUT-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202510271906.1346pSIO-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202510272037.nf7xzQxk-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510210011.tanwPBXz-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510222101.dxkptxL9-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510222308.6LSfjKDk-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510241912.s8uQLYlp-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510242155.afchO66g-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510242250.ZzaqW0pV-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510242322.aWclvr7e-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510250132.FdNONf4v-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202510271426.wQOlaeao-lkp@intel.com

    ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
    ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
    include/linux/device/devres.h:59:(.text.unlikely+0xa3): undefined reference to `codec_info_list'
    ld: sound/soc/sof/intel/hda.c:1172:(.text.unlikely+0xca): undefined reference to `asoc_sdw_get_codec_info_list_count'
    ld: sound/soc/sof/intel/hda.c:1184:(.text.unlikely+0xf1): undefined reference to `codec_info_list'
    sound/soc/sof/intel/hda.c:1179:(.text.unlikely+0x95): undefined reference to `codec_info_list'

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:512 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core' could be null (see line 508)
    drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:531 ras_core_ras_interrupt_detected() error: we previously assumed 'ras_core' could be null (see line 527)
    drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:210 ras_umc_log_pending_bad_bank() warn: variable dereferenced before check 'ecc_node' (see line 208)
    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1002 amdgpu_cs_parser_bos() warn: inconsistent returns '&p->bo_list->bo_list_mutex'.
    drivers/gpu/drm/vkms/vkms_configfs.c:223 make_crtc_group() error: dereferencing freed memory 'crtc' (line 222)
    drivers/gpu/drm/vkms/vkms_configfs.c:377 make_plane_group() error: dereferencing freed memory 'plane' (line 376)
    drivers/gpu/drm/vkms/vkms_configfs.c:491 make_encoder_group() error: dereferencing freed memory 'encoder' (line 490)
    drivers/gpu/drm/vkms/vkms_configfs.c:656 make_connector_group() error: dereferencing freed memory 'connector' (line 655)
    drivers/gpu/drm/vkms/vkms_configfs.c:770 make_device_group() error: dereferencing freed memory 'dev' (line 769)
    drivers/gpu/drm/xe/xe_pmu.c:517 set_supported_events() error: uninitialized symbol 'gt'.
    drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:684 stmmac_mdio_register() error: buffer overflow 'new_bus->irq' 32 <= 32
    mm/userfaultfd.c:858 mfill_atomic() warn: inconsistent returns '&ctx->map_changing_lock'.

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-002-20251027
|   `-- ERROR:__aeabi_uldivmod-drivers-gpu-drm-amd-amdgpu-amdgpu.ko-undefined
|-- i386-randconfig-015-20251027
|   |-- include-linux-device-devres.h:(.text.unlikely):undefined-reference-to-codec_info_list
|   |-- ld:sound-soc-sof-intel-hda.c:(.text.unlikely):undefined-reference-to-asoc_sdw_get_codec_info_list_count
|   |-- ld:sound-soc-sof-intel-hda.c:(.text.unlikely):undefined-reference-to-codec_info_list
|   `-- sound-soc-sof-intel-hda.c:(.text.unlikely):undefined-reference-to-codec_info_list
|-- i386-randconfig-141-20251027
|   |-- drivers-gpu-drm-amd-amdgpu-..-ras-rascore-ras_core.c-ras_core_get_utc_second_timestamp()-error:we-previously-assumed-ras_core-could-be-null-(see-line-)
|   |-- drivers-gpu-drm-amd-amdgpu-..-ras-rascore-ras_core.c-ras_core_ras_interrupt_detected()-error:we-previously-assumed-ras_core-could-be-null-(see-line-)
|   |-- drivers-gpu-drm-amd-amdgpu-..-ras-rascore-ras_umc.c-ras_umc_log_pending_bad_bank()-warn:variable-dereferenced-before-check-ecc_node-(see-line-)
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_cs.c-amdgpu_cs_parser_bos()-warn:inconsistent-returns-p-bo_list-bo_list_mutex-.
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_virt.c-amdgpu_virt_init_critical_region()-warn:unsigned-init_hdr_offset-is-never-less-than-zero.
|   |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_connector_group()-error:dereferencing-freed-memory-connector-(line-)
|   |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_crtc_group()-error:dereferencing-freed-memory-crtc-(line-)
|   |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_device_group()-error:dereferencing-freed-memory-dev-(line-)
|   |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_encoder_group()-error:dereferencing-freed-memory-encoder-(line-)
|   |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_plane_group()-error:dereferencing-freed-memory-plane-(line-)
|   |-- drivers-gpu-drm-xe-xe_pmu.c-set_supported_events()-error:uninitialized-symbol-gt-.
|   `-- mm-userfaultfd.c-mfill_atomic()-warn:inconsistent-returns-ctx-map_changing_lock-.
|-- microblaze-allmodconfig
|   `-- ERROR:__udivdi3-drivers-gpu-drm-amd-amdgpu-amdgpu.ko-undefined
|-- parisc-allmodconfig
|   `-- ERROR:__udivdi3-drivers-gpu-drm-amd-amdgpu-amdgpu.ko-undefined
|-- um-randconfig-001-20251027
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- um-randconfig-r073-20251025
|   `-- drivers-net-ethernet-stmicro-stmmac-stmmac_mdio.c-stmmac_mdio_register()-error:buffer-overflow-new_bus-irq
`-- x86_64-randconfig-161-20251027
    |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_connector_group()-error:dereferencing-freed-memory-connector-(line-)
    |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_crtc_group()-error:dereferencing-freed-memory-crtc-(line-)
    |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_device_group()-error:dereferencing-freed-memory-dev-(line-)
    |-- drivers-gpu-drm-vkms-vkms_configfs.c-make_encoder_group()-error:dereferencing-freed-memory-encoder-(line-)
    `-- drivers-gpu-drm-vkms-vkms_configfs.c-make_plane_group()-error:dereferencing-freed-memory-plane-(line-)

elapsed time: 728m

configs tested: 139
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-002-20251027    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251027    gcc-13.4.0
riscv                 randconfig-002-20251027    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251027    clang-22
s390                  randconfig-002-20251027    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251027    gcc-12.5.0
sh                    randconfig-002-20251027    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251027    gcc-12.5.0
sparc                 randconfig-002-20251027    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251027    gcc-14.3.0
sparc64               randconfig-002-20251027    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251027    clang-22
um                    randconfig-002-20251027    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251027    gcc-12.5.0
xtensa                randconfig-002-20251027    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
