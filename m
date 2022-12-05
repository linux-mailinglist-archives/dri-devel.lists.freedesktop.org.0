Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AFF642E54
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311610E25C;
	Mon,  5 Dec 2022 17:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86FD10E25A;
 Mon,  5 Dec 2022 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670260031; x=1701796031;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vvR/NEhNegklDAJADBM+PimCCqdG/cVpS9hvSwcjzi8=;
 b=FCW71pXcEn4bDz6rxXCdjFs7NDv6zwqT1r2C+Hbl6fTRE3mS1hTJ+zGP
 iE174hz75P0KqGSw8Spd2iSrGSGxP3Vpz3p+doJnyR3EtYqbUUJUup6BN
 6O7DpAwspSbhqKEdjplV2yXVoZ3nP4EuX814rDBVkH0eqcoTkFplbDxaf
 LnBw1NY5VDekl9akbAcq49221GL0cljv6636EBupBysj0wPkiS0rxafPT
 IDc8+WRVvXXSqY7/iBKBJGr0DnxNvp3YHObiSwsKHM7g2zFVC7mle2iWF
 kYX7O39IhgHxtAFAogOf8exFma6xnPrl1VLHVwTMJ6QZrzMe32cosCjnV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="299832389"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="299832389"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 09:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="714470671"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="714470671"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2022 09:05:59 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1p2Euk-0000Ez-37;
 Mon, 05 Dec 2022 17:05:58 +0000
Date: Tue, 06 Dec 2022 01:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 ee9bda616d36d2dc864aa294c2656fad88c9efa0
Message-ID: <638e24c5.oS0rVB5y1Y/NpbHH%lkp@intel.com>
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: ee9bda616d36d2dc864aa294c2656fad88c9efa0  Add linux-next specific files for 20221205

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301840.y7rROb13-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212011005.7X5XAsmG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212032205.IeHBbyyp-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212051759.cEv6fyHy-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c:353:5: warning: no previous prototype for 'amdgpu_mcbp_scan' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c:373:5: warning: no previous prototype for 'amdgpu_mcbp_trigger_preempt' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/irqchip/irq-loongarch-cpu.c:96:12: warning: no previous prototype for 'loongarch_cpu_irq_of_init' [-Wmissing-prototypes]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: sparse:    int
drivers/regulator/tps65219-regulator.c:370:26: sparse:    struct regulator_dev *[assigned] rdev
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]
fs/btrfs/btrfs.o: warning: objtool: __btrfs_map_block+0x1c67: unreachable instruction
pahole: .tmp_vmlinux.btf: No such file or directory

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/x86/kvm/vmx/hyperv.c:108:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
arch/x86/kvm/vmx/hyperv.c:110:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
arch/x86/kvm/vmx/hyperv.c:112:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
arch/x86/kvm/vmx/hyperv.c:114:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
arch/x86/kvm/vmx/hyperv.c:116:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
arch/x86/kvm/vmx/hyperv.c:118:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
arch/x86/kvm/vmx/hyperv.c:120:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
arch/x86/kvm/vmx/hyperv.c:122:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
arch/x86/kvm/vmx/hyperv.c:124:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
arch/x86/kvm/vmx/hyperv.c:126:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
arch/x86/kvm/vmx/hyperv.c:130:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
arch/x86/kvm/vmx/hyperv.c:132:9: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
arch/x86/kvm/vmx/hyperv.c:134:9: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
arch/x86/kvm/vmx/hyperv.c:136:9: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
arch/x86/kvm/vmx/hyperv.c:22:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
arch/x86/kvm/vmx/hyperv.c:24:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
arch/x86/kvm/vmx/hyperv.c:253:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
arch/x86/kvm/vmx/hyperv.c:26:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
arch/x86/kvm/vmx/hyperv.c:28:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
arch/x86/kvm/vmx/hyperv.c:30:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
arch/x86/kvm/vmx/hyperv.c:32:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
arch/x86/kvm/vmx/hyperv.c:34:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
arch/x86/kvm/vmx/hyperv.c:36:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
arch/x86/kvm/vmx/hyperv.c:38:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
arch/x86/kvm/vmx/hyperv.c:40:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
arch/x86/kvm/vmx/hyperv.c:42:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
arch/x86/kvm/vmx/hyperv.c:44:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
arch/x86/kvm/vmx/hyperv.c:46:9: sparse: sparse: cast truncates bits from constant value (80008 becomes 8)
arch/x86/kvm/vmx/hyperv.c:52:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
arch/x86/kvm/vmx/hyperv.c:54:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
arch/x86/kvm/vmx/hyperv.c:56:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
arch/x86/kvm/vmx/hyperv.c:58:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
arch/x86/kvm/vmx/hyperv.c:60:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
arch/x86/kvm/vmx/hyperv.c:62:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
arch/x86/kvm/vmx/hyperv.c:64:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
arch/x86/kvm/vmx/hyperv.c:66:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
arch/x86/kvm/vmx/hyperv.c:68:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
arch/x86/kvm/vmx/hyperv.c:70:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
arch/x86/kvm/vmx/hyperv.c:76:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
arch/x86/kvm/vmx/hyperv.c:78:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
arch/x86/kvm/vmx/hyperv.c:80:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
arch/x86/kvm/vmx/hyperv.c:82:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
arch/x86/kvm/vmx/hyperv.c:84:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
arch/x86/kvm/vmx/hyperv.c:86:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
arch/x86/kvm/vmx/hyperv.c:88:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
arch/x86/kvm/vmx/hyperv.c:90:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
arch/x86/kvm/vmx/hyperv.c:92:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
arch/x86/kvm/vmx/hyperv.c:94:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
arch/x86/kvm/vmx/hyperv.c:96:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
arch/x86/kvm/vmx/hyperv.c:98:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- alpha-randconfig-r032-20221205
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|-- alpha-randconfig-s032-20221205
|   |-- drivers-regulator-tps65219-regulator.c:sparse:int
|   |-- drivers-regulator-tps65219-regulator.c:sparse:sparse:incompatible-types-for-operation-(-):
|   `-- drivers-regulator-tps65219-regulator.c:sparse:struct-regulator_dev-assigned-rdev
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arc-randconfig-r024-20221204
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
clang_recent_errors
|-- arm-randconfig-r046-20221205
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
`-- s390-randconfig-r036-20221205
    `-- pahole:.tmp_vmlinux.btf:No-such-file-or-directory

elapsed time: 721m

configs tested: 59
configs skipped: 3

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
i386                                defconfig
s390                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
i386                 randconfig-a014-20221205
i386                 randconfig-a013-20221205
alpha                            allyesconfig
sh                               allmodconfig
arm                              allyesconfig
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
mips                             allyesconfig
m68k                             allyesconfig
i386                 randconfig-a011-20221205
i386                 randconfig-a016-20221205
m68k                             allmodconfig
powerpc                          allmodconfig
i386                             allyesconfig
arc                  randconfig-r043-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a014-20221205
x86_64               randconfig-a013-20221205
ia64                             allmodconfig
x86_64               randconfig-a015-20221205
s390                 randconfig-r044-20221205
x86_64               randconfig-a012-20221205
riscv                randconfig-r042-20221205
x86_64               randconfig-a016-20221205

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a004-20221205
i386                 randconfig-a001-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a005-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a003-20221205
i386                 randconfig-a006-20221205
i386                 randconfig-a005-20221205
hexagon              randconfig-r045-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
