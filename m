Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43590900B04
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 19:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AB310E737;
	Fri,  7 Jun 2024 17:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pif+r2aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935EA10E737;
 Fri,  7 Jun 2024 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717780287; x=1749316287;
 h=date:from:to:cc:subject:message-id;
 bh=0atbEib8jggjVoNOJeZLkHRB29d07ESMfM1kYkJSA2E=;
 b=Pif+r2aHDUSZ8Nuf5nDd9U2Of1rC1L/MOvWaI5Co93OHZK7rxRGH0N0I
 zW8BMOQenxb/i4UBvuUzdq7/jWv7mey5L+9ywIQ01iT1SotG/ntt4eQmJ
 AuawJ9EkJ2UhQJ64OiKAN7P+7os2D1KbSnMbfWcxcLEIsiuRnTLuqYXlO
 3x7zcp3/1K15tDbwfOdQ03UEUYuVwAMhn/E7XFtVqFg3cRc+0p0rzOeBX
 JDpniCDooGFCVxFvFMZI1gWtQJKd14a2kdP54INccV6JbRF0snis/jLmL
 85gksI/orRJ7i4WLXba0gVYN9S0x83kwEBWUTEcHl/XhwW4XPh+U851aa g==;
X-CSE-ConnectionGUID: 7TC+xdF0QGySG6stqT40UQ==
X-CSE-MsgGUID: roqB4NlUTiqnna//NHaw/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25085261"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25085261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:11:26 -0700
X-CSE-ConnectionGUID: DdJMks8UTbeojCtA2cQ2kQ==
X-CSE-MsgGUID: I4mpLO82Tt+W36pAVdWw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43308590"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 07 Jun 2024 10:11:23 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sFd7Y-0000B1-1r;
 Fri, 07 Jun 2024 17:11:20 +0000
Date: Sat, 08 Jun 2024 01:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 d35b2284e966c0bef3e2182a5c5ea02177dd32e4
Message-ID: <202406080138.Fk0ftkDF-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: d35b2284e966c0bef3e2182a5c5ea02177dd32e4  Add linux-next specific files for 20240607

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406071624.o81nLJmG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406071658.Sq9UXHmz-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406071806.BRjaC5FF-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406072132.gK2rPSm1-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/hwmon/pmbus/mp2975.c:1069:34: warning: 'mp2975_of_match' defined but not used [-Wunused-const-variable=]
drivers/hwmon/pmbus/mp2975.c:1069:34: warning: unused variable 'mp2975_of_match' [-Wunused-const-variable]
kernel/trace/fgraph.c:1154:12: warning: 'fgraph_pid_func' defined but not used [-Wunused-function]
kernel/trace/fgraph.c:1174:28: warning: unused variable 'gops' [-Wunused-variable]
kernel/trace/fgraph.c:1175:28: warning: unused variable 'op' [-Wunused-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

{standard input}:1233: Warning: overflow in branch to .L144; converted into longer instruction sequence
{standard input}:1244: Warning: overflow in branch to .L146; converted into longer instruction sequence
{standard input}:1247: Warning: overflow in branch to .L147; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-randconfig-001-20240607
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- i386-randconfig-062-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|-- loongarch-randconfig-002-20240607
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- microblaze-allmodconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allnoconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allyesconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-defconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- mips-randconfig-r121-20240607
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- nios2-randconfig-r111-20240607
|   |-- drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- nios2-randconfig-r133-20240607
|   `-- drivers-clk-qcom-camcc-sm7150.c:sparse:sparse:symbol-camcc_sm7150_hws-was-not-declared.-Should-it-be-static
|-- parisc-randconfig-002-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
|-- s390-randconfig-r113-20240607
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- sh-randconfig-r011-20220321
|   |-- standard-input:Warning:overflow-in-branch-to-.L144-converted-into-longer-instruction-sequence
|   |-- standard-input:Warning:overflow-in-branch-to-.L146-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L147-converted-into-longer-instruction-sequence
|-- x86_64-buildonly-randconfig-002-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
`-- x86_64-randconfig-161-20240607
    `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
clang_recent_errors
|-- x86_64-buildonly-randconfig-003-20240607
|   |-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:unused-variable-mp2975_of_match
|-- x86_64-randconfig-012-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:unused-variable-mp2975_of_match
`-- x86_64-randconfig-r051-20240607
    `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration

elapsed time: 739m

configs tested: 188
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240607   gcc  
arc                   randconfig-002-20240607   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240607   gcc  
arm                   randconfig-002-20240607   clang
arm                   randconfig-003-20240607   clang
arm                   randconfig-004-20240607   gcc  
arm                       spear13xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240607   gcc  
arm64                 randconfig-002-20240607   clang
arm64                 randconfig-003-20240607   clang
arm64                 randconfig-004-20240607   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240607   gcc  
csky                  randconfig-002-20240607   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240607   clang
hexagon               randconfig-002-20240607   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240607   clang
i386         buildonly-randconfig-002-20240607   clang
i386         buildonly-randconfig-003-20240607   clang
i386         buildonly-randconfig-004-20240607   clang
i386         buildonly-randconfig-005-20240607   clang
i386         buildonly-randconfig-006-20240607   clang
i386                                defconfig   clang
i386                  randconfig-001-20240607   gcc  
i386                  randconfig-002-20240607   gcc  
i386                  randconfig-003-20240607   gcc  
i386                  randconfig-004-20240607   gcc  
i386                  randconfig-005-20240607   gcc  
i386                  randconfig-006-20240607   gcc  
i386                  randconfig-011-20240607   clang
i386                  randconfig-012-20240607   gcc  
i386                  randconfig-013-20240607   clang
i386                  randconfig-014-20240607   clang
i386                  randconfig-015-20240607   clang
i386                  randconfig-016-20240607   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240607   gcc  
loongarch             randconfig-002-20240607   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           gcw0_defconfig   clang
mips                           ip28_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240607   gcc  
nios2                 randconfig-002-20240607   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240607   gcc  
parisc                randconfig-002-20240607   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-001-20240607   gcc  
powerpc               randconfig-002-20240607   gcc  
powerpc               randconfig-003-20240607   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240607   gcc  
powerpc64             randconfig-002-20240607   clang
powerpc64             randconfig-003-20240607   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240607   gcc  
riscv                 randconfig-002-20240607   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240607   clang
s390                  randconfig-002-20240607   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240607   gcc  
sh                    randconfig-002-20240607   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240607   gcc  
sparc64               randconfig-002-20240607   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240607   clang
um                    randconfig-002-20240607   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240607   gcc  
x86_64       buildonly-randconfig-002-20240607   gcc  
x86_64       buildonly-randconfig-003-20240607   clang
x86_64       buildonly-randconfig-004-20240607   gcc  
x86_64       buildonly-randconfig-005-20240607   gcc  
x86_64       buildonly-randconfig-006-20240607   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240607   gcc  
x86_64                randconfig-002-20240607   gcc  
x86_64                randconfig-003-20240607   clang
x86_64                randconfig-004-20240607   clang
x86_64                randconfig-005-20240607   clang
x86_64                randconfig-006-20240607   gcc  
x86_64                randconfig-011-20240607   gcc  
x86_64                randconfig-012-20240607   clang
x86_64                randconfig-013-20240607   gcc  
x86_64                randconfig-014-20240607   gcc  
x86_64                randconfig-015-20240607   clang
x86_64                randconfig-016-20240607   clang
x86_64                randconfig-071-20240607   gcc  
x86_64                randconfig-072-20240607   clang
x86_64                randconfig-073-20240607   gcc  
x86_64                randconfig-074-20240607   clang
x86_64                randconfig-075-20240607   gcc  
x86_64                randconfig-076-20240607   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240607   gcc  
xtensa                randconfig-002-20240607   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
