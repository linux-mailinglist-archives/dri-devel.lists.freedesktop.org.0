Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C25F5B4D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 22:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC21810E781;
	Wed,  5 Oct 2022 20:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86210E780;
 Wed,  5 Oct 2022 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665003516; x=1696539516;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5wlRgmXMX0YGl2ggsHILuTzXon7D/FQk/Yadywfyb3M=;
 b=ktTtNZQ0pWludlu/99xnu2tOAVic6m0mvmS/CUAvrAenTGkIbElr56Un
 SigpVqyM+TKWFSiYwhcauK5s7cFtdD3VhYpe6QK3qL3FZJpeNuRHBN4qX
 QOZAQvtMf55ZL5ZC20ndusiS5vsJpv77vzz12p3Fux2RG6Z1a7WucCmj3
 7JsAmLblrwDKTJnswxFEJtlGoeevwC7387m4V+jk7MKyy4x/c5ofKXHnr
 qKRx/BfkgsRVCFjZJpzmT40BXshONAFirP4XYK93b1O6EG49K7m0XGImt
 wOv+G+Kd+8m5xrCrMTdErd4idCeHjsn9Ktp8X/ivts0vtglrORkQlBh5D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="329687226"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="329687226"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 13:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="953343839"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="953343839"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 05 Oct 2022 13:58:32 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ogBTM-0001d5-07;
 Wed, 05 Oct 2022 20:58:32 +0000
Date: Thu, 06 Oct 2022 04:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 67ae4f7434cee86ee318d46fb10b8a9840ad2e81
Message-ID: <633deff4.q8bW3fyM79Uz0A/F%lkp@intel.com>
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
Cc: kvm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 67ae4f7434cee86ee318d46fb10b8a9840ad2e81  Add linux-next specific files for 20221005

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com
https://lore.kernel.org/llvm/202210041553.k9dc1Joc-lkp@intel.com
https://lore.kernel.org/llvm/202210060148.UXBijOcS-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/loongarch/kernel/traps.c:250 die() warn: variable dereferenced before check 'regs' (see line 244)
arch/loongarch/mm/init.c:166:24: warning: variable 'new' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6: warning: no previous prototype for 'virtual_disable_link_output' [-Wmissing-prototypes]
drivers/gpu/drm/bridge/ite-it6505.c:2712 it6505_extcon_work() warn: pm_runtime_get_sync() also returns 1 on success
drivers/platform/loongarch/loongson-laptop.c:377 loongson_laptop_get_brightness() warn: impossible condition '(level < 0) => (0-255 < 0)'
drivers/vfio/pci/vfio_pci_core.c:775 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'pdev->resource' [w]
drivers/vfio/pci/vfio_pci_core.c:855 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'vdev->region' [r]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_417' declared with attribute error: FIELD_GET: mask is not constant
kernel/bpf/memalloc.c:500 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
net/mac80211/iface.c:251 ieee80211_can_powered_addr_change() warn: inconsistent returns '&local->mtx'.

Unverified Error/Warning (likely false positive, please contact us if interested):

ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/ghash_s390.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/sha512_s390.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [fs/binfmt_misc.ko] undefined!
ERROR: modpost: "__tsan_memcpy" [fs/pstore/ramoops.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/ghash_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [arch/s390/crypto/sha512_s390.ko] undefined!
ERROR: modpost: "__tsan_memset" [fs/autofs/autofs4.ko] undefined!
ERROR: modpost: "__tsan_memset" [fs/binfmt_misc.ko] undefined!
ERROR: modpost: "__tsan_memset" [fs/cramfs/cramfs.ko] undefined!
ERROR: modpost: "__tsan_memset" [fs/pstore/ramoops.ko] undefined!
s390x-linux-ld: self.c:(.text+0xf6): undefined reference to `__tsan_memcpy'
thread_self.c:(.text+0xe4): undefined reference to `__tsan_memcpy'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- alpha-randconfig-s042-20221002
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-data-got-void-noderef-__iomem-assigned-pvtmon
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void-devdata
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- arc-randconfig-s051-20221002
|   |-- drivers-gpu-drm-tiny-simpledrm.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-vaddr-got-void-noderef-__iomem-screen_base
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-got-restricted-__le16-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
|   `-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
|-- arc-randconfig-s053-20221002
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
|   `-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-c023-20221005
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
clang_recent_errors
|-- arm-randconfig-r016-20221003
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|-- arm-randconfig-r033-20221002
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm64-buildonly-randconfig-r002-20221003
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|   `-- ld.lld:error:assignment-to-symbol-__efistub_kernel_size-does-not-converge
|-- hexagon-randconfig-r013-20221002
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- hexagon-randconfig-r025-20221003
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- hexagon-randconfig-r031-20221002
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- hexagon-randconfig-r041-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r045-20221002
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a002-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a005-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a006-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-r001-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- mips-loongson1c_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- mips-randconfig-r006-20221002
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:

elapsed time: 729m

configs tested: 94
configs skipped: 3

gcc tested configs:
i386                                defconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
arm                            pleb_defconfig
alpha                             allnoconfig
powerpc                      chrp32_defconfig
i386                             allyesconfig
arc                          axs101_defconfig
x86_64                               rhel-8.3
riscv                             allnoconfig
arc                    vdk_hs38_smp_defconfig
arm                                 defconfig
powerpc                 linkstation_defconfig
i386                 randconfig-a014-20221003
sh                             espt_defconfig
sh                               allmodconfig
csky                              allnoconfig
x86_64                           allyesconfig
i386                 randconfig-a011-20221003
arc                               allnoconfig
arm                           h3600_defconfig
x86_64               randconfig-a011-20221003
i386                 randconfig-a012-20221003
arm64                            allyesconfig
s390                       zfcpdump_defconfig
sparc64                             defconfig
x86_64               randconfig-a015-20221003
i386                 randconfig-a013-20221003
sh                   sh7770_generic_defconfig
m68k                             allmodconfig
x86_64               randconfig-a014-20221003
arm                              allyesconfig
powerpc                       maple_defconfig
arc                              allyesconfig
sh                             shx3_defconfig
ia64                             allmodconfig
m68k                            q40_defconfig
i386                 randconfig-a015-20221003
x86_64               randconfig-a012-20221003
arm                       imx_v6_v7_defconfig
i386                 randconfig-a016-20221003
mips                            ar7_defconfig
alpha                            allyesconfig
x86_64               randconfig-a013-20221003
arm                          gemini_defconfig
m68k                                defconfig
x86_64               randconfig-a016-20221003
m68k                             allyesconfig
i386                          randconfig-c001
mips                          rb532_defconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
riscv                            allyesconfig

clang tested configs:
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a006-20221003
arm                        neponset_defconfig
x86_64               randconfig-a005-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
riscv                          rv32_defconfig
i386                 randconfig-a005-20221003
hexagon              randconfig-r041-20221003
x86_64                        randconfig-k001
riscv                randconfig-r042-20221002
i386                 randconfig-a006-20221003
hexagon              randconfig-r041-20221002
s390                 randconfig-r044-20221002
mips                     loongson1c_defconfig
hexagon              randconfig-r045-20221002
powerpc                 mpc8272_ads_defconfig
hexagon              randconfig-r045-20221003
powerpc                          allyesconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
