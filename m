Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E9E632F6F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 22:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9BB10E336;
	Mon, 21 Nov 2022 21:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764E210E336;
 Mon, 21 Nov 2022 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669067921; x=1700603921;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=YGG+x4h+hQ07FnMjwq53sHtrTnzTFjfIqyustOHRNCo=;
 b=RElKX99ffZZsvrnTyLyBFJitJLNTrDrWoqccOY/tlW6LfkHxiEdm6qXM
 cmjg5xwI2hiyfZHDstpZxTRfRLcg/bD54AcwVG1MMEqPAtkmZaYcHs9OB
 Ggq/cd26PIYR/Gl8hG/VFrQfTDJUzDLYFfOrijDNbKFCfQtwYVqHT45zC
 L7+HiNMBdFDOk4ONYJg2bMkMpdgL6q92U7d0pGAUkaJPffA78osQA/cN4
 t82pB/y4bbndULTVif21kKiCB09+8QGWuX8SJvdXuxJm++3UIQnzbtdTs
 CqD0CRmMW/CUegFuGsd/DLLwnBhcoefkKVaggFCbOMGF45ooYUC15evFQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="311300947"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="311300947"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 13:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="747080834"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="747080834"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2022 13:58:38 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oxEoH-0000mh-1q;
 Mon, 21 Nov 2022 21:58:37 +0000
Date: Tue, 22 Nov 2022 05:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
Message-ID: <637bf477.ORnAaf8quqxr/cRo%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, nouveau@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9  Add linux-next specific files for 20221121

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211130053.Np70VIdn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211191949.jqnWetUW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211200417.23aUOpyC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211211917.yLICUnMb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211212249.livTPi3Y-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211220547.7Jd7QBi7-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4939: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5075:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:139:43: warning: unused variable 'dmub_outbox_irq_info_funcs' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for function 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
include/linux/ftrace.h:126:16: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
include/linux/ftrace.h:126:16: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
microblaze-linux-ld: (.text+0x158): undefined reference to `drm_bridge_add'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3b4): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3b8): undefined reference to `drm_atomic_helper_bridge_destroy_state'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3c8): undefined reference to `drm_atomic_helper_bridge_reset'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn: variable dereferenced before check 'outp' (see line 232)
drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:116 nvkm_uoutp_mthd_infoframe() error: we previously assumed 'ior->func->hdmi' could be null (see line 114)
drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:250 nvkm_uoutp_mthd_acquire() error: we previously assumed 'outp->ior' could be null (see line 217)
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:133 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:480 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.
drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:232:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:263 gv100_gr_oneinit_sm_id() warn: potentially one past the end of array 'gpc_tpc_mask[gpc_table[gtpc]]'
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:350 nvkm_acr_lsfw_load_bl_sig_net() warn: passing zero to 'PTR_ERR'
drivers/mmc/host/renesas_sdhi_internal_dmac.c:327 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
drivers/mmc/host/renesas_sdhi_internal_dmac.c:341 renesas_sdhi_internal_dmac_dataend_dma() warn: set_bit() takes a bit number
drivers/mmc/host/renesas_sdhi_internal_dmac.c:444 renesas_sdhi_internal_dmac_issue_tasklet_fn() warn: set_bit() takes a bit number
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
mm/hugetlb.c:2073 alloc_pool_huge_page() error: uninitialized symbol 'folio'.
sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 160. [shiftTooManyBitsSigned]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-r022-20221120
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- arc-randconfig-r033-20221120
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-randconfig-c002-20221115
|   `-- drivers-gpu-drm-nouveau-nvkm-engine-gr-gv100.c:warning:use-of-uninitialized-value-unknown-CWE
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
clang_recent_errors
|-- powerpc-randconfig-r004-20221121
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-function-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:unused-variable-dmub_outbox_irq_info_funcs
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- riscv-randconfig-r042-20221120
|   `-- ld.lld:error:too-many-errors-emitted-stopping-now-(use-error-limit-to-see-all-errors)
`-- s390-randconfig-r044-20221120
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-function-to_dal_irq_source_dcn201
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:unused-variable-dmub_outbox_irq_info_funcs
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
    |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
    `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump

elapsed time: 730m

configs tested: 73
configs skipped: 4

gcc tested configs:
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
i386                             allyesconfig
x86_64               randconfig-a011-20221121
x86_64                               rhel-8.3
arc                  randconfig-r043-20221120
x86_64               randconfig-a013-20221121
i386                 randconfig-a011-20221121
riscv                randconfig-r042-20221121
i386                 randconfig-a013-20221121
x86_64                           allyesconfig
arm                                 defconfig
x86_64               randconfig-a012-20221121
i386                 randconfig-a012-20221121
x86_64               randconfig-a015-20221121
i386                 randconfig-a014-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a015-20221121
x86_64                            allnoconfig
arc                  randconfig-r043-20221121
arm                        oxnas_v6_defconfig
s390                 randconfig-r044-20221121
arm                           imxrt_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                         axm55xx_defconfig
powerpc                      cm5200_defconfig
mips                           ip32_defconfig
arm                             pxa_defconfig
powerpc                    adder875_defconfig
mips                        bcm47xx_defconfig
xtensa                       common_defconfig
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig

clang tested configs:
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
i386                 randconfig-a001-20221121
hexagon              randconfig-r041-20221120
i386                 randconfig-a003-20221121
hexagon              randconfig-r041-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
hexagon              randconfig-r045-20221120
x86_64               randconfig-a003-20221121
i386                 randconfig-a004-20221121
hexagon              randconfig-r045-20221121
i386                 randconfig-a006-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
