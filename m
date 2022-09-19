Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B15BD7CC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 01:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621E010E010;
	Mon, 19 Sep 2022 23:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B3A10E010
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663628845; x=1695164845;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=705WJOdue58NafhZ3jROr0GP9JgBUxIfi5dZH5hR6WA=;
 b=AWbpcuzxL0uvn27TLIDdn9o5rAO05RZr+f5gXX6xiY41A7QIqCXyvihi
 GamgraO8Mi3TrlehnX46yO1McGvXt/dRGind8usFh8NiZLiPsqyMYaR0Z
 SCkGD7blH6zZoLJ9L80lCnAlrCuy6bjwYDlKvAzZbTz0J5aYXMk5kra4R
 NVnnspPjcJP2VNKGfldhiV8GcpBoI0b92r4O0xiygNCg6e1ZgH55hDWF9
 gQ7gPk82m5EW6hYfw6Xtk3Em1hSNpBZexj4GNqGBkfruO6LPwk3Swp5PS
 vGgm9jQHxIqN1jhDi4XvE2YcYBa4X+tQcDFcx7BH1ZnW5cGdyOeDUykv0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279925496"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="279925496"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 16:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="569841395"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 19 Sep 2022 16:07:22 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oaPrF-0002Hl-1e;
 Mon, 19 Sep 2022 23:07:21 +0000
Date: Tue, 20 Sep 2022 07:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
Message-ID: <6328f608.UcWATT4z3JbSJozt%lkp@intel.com>
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
Cc: linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 4c9ca5b1597e3222177ba2a94658f78fa5ef4f58  Add linux-next specific files for 20220919

Error/Warning reports:

https://lore.kernel.org/linux-doc/202209200314.tChS7q2Y-lkp@intel.com
https://lore.kernel.org/linux-doc/202209200341.be18yIBM-lkp@intel.com
https://lore.kernel.org/linux-mm/202209150141.WgbAKqmX-lkp@intel.com
https://lore.kernel.org/linux-mm/202209200603.Hpvoa8Ii-lkp@intel.com
https://lore.kernel.org/llvm/202209192243.d80zUWVW-lkp@intel.com
https://lore.kernel.org/llvm/202209200834.EFwaTsIj-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/clk/xilinx/clk-xlnx-clock-wizard.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
arch/parisc/lib/iomap.c:363:5: warning: no previous prototype for 'ioread64_lo_hi' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:373:5: warning: no previous prototype for 'ioread64_hi_lo' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:448:6: warning: no previous prototype for 'iowrite64_lo_hi' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:454:6: warning: no previous prototype for 'iowrite64_hi_lo' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/iommu/ipmmu-vmsa.c:946:34: warning: unused variable 'ipmmu_of_ids' [-Wunused-const-variable]
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/scsi/qla2xxx/qla_os.c:2854:25: error: implicit declaration of function 'trace_array_get_by_name'; did you mean 'trace_array_set_clr_event'? [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_os.c:2869:9: error: implicit declaration of function 'trace_array_put' [-Werror=implicit-function-declaration]
fs/btrfs/extent-io-tree.c:165: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
fs/btrfs/extent-io-tree.c:217: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
mm/hugetlb.c:5565:14: warning: variable 'reserve_alloc' set but not used [-Wunused-but-set-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/chacha_s390.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/ghash_s390.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/prng.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/sha3_512_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/chacha_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/ghash_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/prng.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/sha3_512_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [kernel/rcu/refscale.ko] undefined!
ERROR: modpost: "__tsan_memset" [kernel/scftorture.ko] undefined!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   `-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|-- alpha-randconfig-r026-20220919
|   `-- fs-btrfs-extent-io-tree.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r043-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- i386-defconfig
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-randconfig-a011-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- i386-randconfig-a012-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- i386-randconfig-a015-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- ia64-allmodconfig
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   `-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|-- loongarch-buildonly-randconfig-r004-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- loongarch-randconfig-r015-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- m68k-allmodconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- m68k-allyesconfig
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- fs-btrfs-extent-io-tree.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- nios2-randconfig-r025-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- openrisc-randconfig-r003-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- openrisc-randconfig-r004-20220919
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- parisc-allyesconfig
clang_recent_errors
|-- arm-buildonly-randconfig-r001-20220919
|   |-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|   `-- drivers-gpu-drm-tests-drm_mm_test.c:warning:stack-frame-size-()-exceeds-limit-()-in-__drm_test_mm_reserve
|-- arm-defconfig
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_aclk_pdispp_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_aclk_pdnpu_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_aclk_pdvi_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_cif_out2io_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_clk_isp_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_clk_ispp_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_clk_npu_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_cpll_gpll_hpll_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_cpll_hpll_gpll_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_dclk_vop_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_gpll_cpll_apll_hpll_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_gpll_cpll_hpll_p
|   |-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_gpll_usb480m_p
|   `-- drivers-clk-rockchip-clk-rv1126.c:warning:unused-variable-mux_mipicsi_out2io_p
|-- arm64-buildonly-randconfig-r005-20220919
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- arm64-randconfig-r033-20220919
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|-- hexagon-randconfig-r041-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- hexagon-randconfig-r045-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- i386-randconfig-a002-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- i386-randconfig-a005-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- i386-randconfig-a006-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- s390-randconfig-r005-20220919
|   |-- ERROR:__tsan_memcpy-arch-s390-crypto-chacha_s390.ko-undefined
|   |-- ERROR:__tsan_memcpy-arch-s390-crypto-ghash_s390.ko-undefined
|   |-- ERROR:__tsan_memcpy-arch-s390-crypto-prng.ko-undefined
|   |-- ERROR:__tsan_memcpy-arch-s390-crypto-sha3_512_s390.ko-undefined
|   |-- ERROR:__tsan_memset-arch-s390-crypto-chacha_s390.ko-undefined
|   |-- ERROR:__tsan_memset-arch-s390-crypto-ghash_s390.ko-undefined
|   |-- ERROR:__tsan_memset-arch-s390-crypto-prng.ko-undefined
|   |-- ERROR:__tsan_memset-arch-s390-crypto-sha3_512_s390.ko-undefined
|   |-- ERROR:__tsan_memset-kernel-rcu-refscale.ko-undefined
|   |-- ERROR:__tsan_memset-kernel-scftorture.ko-undefined
|   `-- drivers-iommu-ipmmu-vmsa.c:warning:unused-variable-ipmmu_of_ids
|-- x86_64-randconfig-a001-20220919
|   `-- fs-btrfs-extent-io-tree.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-a003-20220919
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- x86_64-randconfig-a006-20220919

elapsed time: 726m

configs tested: 57
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a012-20220919
x86_64                              defconfig
x86_64               randconfig-a011-20220919
x86_64               randconfig-a013-20220919
x86_64                               rhel-8.3
x86_64               randconfig-a014-20220919
powerpc                           allnoconfig
x86_64               randconfig-a015-20220919
x86_64               randconfig-a016-20220919
x86_64                           allyesconfig
i386                                defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20220919
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220919
arm64                            allyesconfig
i386                             allyesconfig
s390                 randconfig-r044-20220919
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                 randconfig-a012-20220919
i386                 randconfig-a011-20220919
i386                 randconfig-a013-20220919
i386                 randconfig-a014-20220919
m68k                             allmodconfig
i386                 randconfig-a015-20220919
arc                                 defconfig
alpha                               defconfig
m68k                             allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig

clang tested configs:
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a002-20220919
i386                 randconfig-a001-20220919
x86_64               randconfig-a004-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a002-20220919
x86_64               randconfig-a006-20220919
hexagon              randconfig-r041-20220919
x86_64               randconfig-a005-20220919
i386                 randconfig-a003-20220919
hexagon              randconfig-r045-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
