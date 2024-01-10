Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5262082945F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 08:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2EA10E736;
	Wed, 10 Jan 2024 07:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138B710E722;
 Wed, 10 Jan 2024 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704872058; x=1736408058;
 h=date:from:to:cc:subject:message-id;
 bh=mlJF8jp++SLe39s0DK6tQMqZgUcFqm+beDhANEWQzLQ=;
 b=kn+J42ZwYDURt6vOYy0WNx7PUnx7uVfoL5xxFcou+0O1NVCfTuowSRZY
 EWXCfSneQotkBNIoyWReb3ZpPbDBeOVP8MBt3arFknj6uRpDRJ0Y4hJci
 vmFLwxrEztnCkP+mPzFN5av7ajCbgC0hVn4XsNDJZV3cHQMXEFNeWP34R
 aAkWfBPD7qMJpZMkPXcY40k9MNceDGvDH4H7ksnhIbF+MiTnbIWnBTain
 VBzKBBvWUJ7MKPGiDBgJQf224lfCVouq+c7mQNbPuJfXlK81lXBP51mku
 Ex04FnjJGEEu0B/wrMFLQQQ81Mq1e5M511+8k7vsaffB4SJPkA3+BvB3q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5187358"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5187358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 23:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="16547477"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2024 23:34:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rNT6A-0006k4-25;
 Wed, 10 Jan 2024 07:34:09 +0000
Date: Wed, 10 Jan 2024 15:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
Message-ID: <202401101510.WIXlGTha-lkp@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 kvm@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, kasan-dev@googlegroups.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 0f067394dd3b2af3263339cf7183bdb6ee0ac1f8  Add linux-next specific files for 20240109

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401101414.8GvBGMXw-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x2cc): undefined reference to `phylink_ethtool_nway_reset'
drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x2f0): undefined reference to `phylink_ethtool_ksettings_get'
drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x318): undefined reference to `phylink_ethtool_ksettings_set'
tools/testing/selftests/net/tcp_ao/bench-lookups.c:202: undefined reference to `sqrt'

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80a08 becomes a08)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (80d08 becomes d08)
arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
drivers/usb/gadget/function/f_ncm.c:1688:32: sparse: sparse: incorrect type in assignment (different base types)
{standard input}:50469: Warning: overflow in branch to .L4505; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- arc-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arc-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arc-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- arm-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arm-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arm-randconfig-r111-20240109
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|-- arm64-defconfig
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l0_free_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l0_prealloc_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l1_free_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l1_prealloc_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-pvr_dev-description-in-pvr_mmu_backing_page
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-sgt-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-sgt_offset-description-in-pvr_mmu_op_context
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- csky-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- csky-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- csky-randconfig-002-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- csky-randconfig-r132-20240109
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- i386-randconfig-013-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- loongarch-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- m68k-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- m68k-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- m68k-randconfig-r121-20240109
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- m68k-randconfig-r122-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- microblaze-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- microblaze-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- mips-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- nios2-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- nios2-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- openrisc-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- openrisc-randconfig-r112-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- parisc-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- parisc-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- parisc-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- parisc-randconfig-002-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- parisc-randconfig-r002-20221104
|   |-- drivers-net-ethernet-wangxun-libwx-wx_ethtool.c:(.text):undefined-reference-to-phylink_ethtool_ksettings_get
|   |-- drivers-net-ethernet-wangxun-libwx-wx_ethtool.c:(.text):undefined-reference-to-phylink_ethtool_ksettings_set
|   `-- drivers-net-ethernet-wangxun-libwx-wx_ethtool.c:(.text):undefined-reference-to-phylink_ethtool_nway_reset
|-- powerpc64-randconfig-r131-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- riscv-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- riscv-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- s390-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- s390-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- sh-allmodconfig
|   |-- include-linux-syscalls.h:internal-compiler-error:in-change_address_1-at-emit-rtl.cc
|   `-- standard-input:Error:pcrel-too-far
|-- sh-allnoconfig
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:overflow-in-branch-to-.L1609-converted-into-longer-instruction-sequence
|-- sh-allyesconfig
|   |-- include-linux-syscalls.h:internal-compiler-error:in-change_address_1-at-emit-rtl.cc
|   `-- standard-input:Error:pcrel-too-far
|-- sh-randconfig-001-20240109
|   |-- include-linux-syscalls.h:internal-compiler-error:in-change_address_1-at-emit-rtl.cc
|   `-- standard-input:Error:pcrel-too-far
|-- sh-randconfig-002-20240109
|   |-- include-linux-syscalls.h:internal-compiler-error:in-change_address_1-at-emit-rtl.cc
|   `-- standard-input:Error:pcrel-too-far
|-- sh-randconfig-r013-20230304
|   `-- standard-input:Warning:overflow-in-branch-to-.L4505-converted-into-longer-instruction-sequence
|-- sparc-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- sparc-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- sparc64-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- sparc64-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- sparc64-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- sparc64-randconfig-002-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- um-randconfig-r113-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|-- x86_64-allnoconfig
|   |-- Documentation-usb-gadget-testing.rst:WARNING:Malformed-table.
|   |-- Warning:file-Documentation-ABI-testing-sysfs-platform-silicom:
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-curr1_crit-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-energy1_input-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-in0_input-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_crit-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_max-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_max_interval-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   `-- Warning:sys-devices-...-hwmon-hwmon-i-power1_rated_max-is-defined-times:Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|-- x86_64-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|-- x86_64-randconfig-121-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   `-- mm-kasan-common.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-gfp_t-usertype-flags-got-unsigned-long-usertype-size
|-- x86_64-randconfig-122-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   `-- drivers-usb-cdns3-cdns3-gadget.c:sparse:sparse:restricted-__le32-degrades-to-integer
|-- x86_64-randconfig-123-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_state.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- x86_64-rhel-8.3-bpf
|   `-- tools-testing-selftests-net-tcp_ao-bench-lookups.c:undefined-reference-to-sqrt
`-- xtensa-randconfig-001-20240109
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
    `-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arm64-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l0_free_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l0_prealloc_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l1_free_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-l1_prealloc_tables-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-pvr_dev-description-in-pvr_mmu_backing_page
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-sgt-description-in-pvr_mmu_op_context
|   |-- drivers-gpu-drm-imagination-pvr_mmu.c:warning:Excess-struct-member-sgt_offset-description-in-pvr_mmu_op_context
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- arm64-randconfig-004-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- arm64-randconfig-r111-20240109
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   |-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- sound-pci-hda-tas2781_hda_i2c.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-data-got-restricted-__be32-usertype
|-- hexagon-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- hexagon-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- hexagon-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- i386-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- i386-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- i386-buildonly-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-002-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- i386-randconfig-005-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- i386-randconfig-006-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- i386-randconfig-061-20231217
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(120b92-becomes-b92)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1a069a-becomes-69a)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b001b-becomes-1b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b009b-becomes-9b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b011b-becomes-11b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b039b-becomes-39b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b049b-becomes-49b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b051b-becomes-51b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(1b059b-becomes-59b)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(80a08-becomes-a08)
|   |-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(80d08-becomes-d08)
|   `-- arch-x86-kvm-vmx-hyperv_evmcs.h:sparse:sparse:cast-truncates-bits-from-constant-value-(b000b-becomes-b)
|-- i386-randconfig-061-20240109
|   |-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|   |-- fs-bcachefs-btree_iter.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   `-- fs-bcachefs-btree_locking.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|-- i386-randconfig-062-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- i386-randconfig-063-20240109
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- i386-randconfig-141-20240110
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- powerpc-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- powerpc-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- powerpc-randconfig-003-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- powerpc64-randconfig-001-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- x86_64-allmodconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- x86_64-allyesconfig
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   |-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_encoder.c:warning:Excess-struct-member-debugfs_root-description-in-dpu_encoder_virt
|-- x86_64-buildonly-randconfig-004-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-006-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
|-- x86_64-randconfig-012-20240109
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
|   |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
|   `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here
`-- x86_64-randconfig-075-20240109
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-dst_addr-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-filled_descs_num-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-size-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-src_addr-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:Function-parameter-or-struct-member-sw_desc-not-described-in-xdma_fill_descs
    |-- drivers-dma-xilinx-xdma.c:warning:operator:has-lower-precedence-than-will-be-evaluated-first
    `-- drivers-dma-xilinx-xdma.c:warning:variable-desc-is-uninitialized-when-used-here

elapsed time: 1532m

configs tested: 177
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240109   gcc  
arc                   randconfig-002-20240109   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20240109   clang
arm                   randconfig-002-20240109   clang
arm                   randconfig-003-20240109   clang
arm                   randconfig-004-20240109   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240109   clang
arm64                 randconfig-002-20240109   clang
arm64                 randconfig-003-20240109   clang
arm64                 randconfig-004-20240109   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240109   gcc  
csky                  randconfig-002-20240109   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240109   clang
hexagon               randconfig-002-20240109   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240109   clang
i386         buildonly-randconfig-002-20240109   clang
i386         buildonly-randconfig-003-20240109   clang
i386         buildonly-randconfig-004-20240109   clang
i386         buildonly-randconfig-005-20240109   clang
i386         buildonly-randconfig-006-20240109   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240109   clang
i386                  randconfig-002-20240109   clang
i386                  randconfig-003-20240109   clang
i386                  randconfig-004-20240109   clang
i386                  randconfig-005-20240109   clang
i386                  randconfig-006-20240109   clang
i386                  randconfig-011-20240109   gcc  
i386                  randconfig-012-20240109   gcc  
i386                  randconfig-013-20240109   gcc  
i386                  randconfig-014-20240109   gcc  
i386                  randconfig-015-20240109   gcc  
i386                  randconfig-016-20240109   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240109   gcc  
loongarch             randconfig-002-20240109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240109   gcc  
nios2                 randconfig-002-20240109   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240109   gcc  
parisc                randconfig-002-20240109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc               randconfig-001-20240109   clang
powerpc               randconfig-002-20240109   clang
powerpc               randconfig-003-20240109   clang
powerpc                     redwood_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240109   clang
powerpc64             randconfig-002-20240109   clang
powerpc64             randconfig-003-20240109   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240109   clang
riscv                 randconfig-002-20240109   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240109   gcc  
s390                  randconfig-002-20240109   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240109   gcc  
sh                    randconfig-002-20240109   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240109   gcc  
sparc64               randconfig-002-20240109   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240109   clang
um                    randconfig-002-20240109   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240109   clang
x86_64       buildonly-randconfig-002-20240109   clang
x86_64       buildonly-randconfig-003-20240109   clang
x86_64       buildonly-randconfig-004-20240109   clang
x86_64       buildonly-randconfig-005-20240109   clang
x86_64       buildonly-randconfig-006-20240109   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240109   gcc  
x86_64                randconfig-002-20240109   gcc  
x86_64                randconfig-003-20240109   gcc  
x86_64                randconfig-004-20240109   gcc  
x86_64                randconfig-005-20240109   gcc  
x86_64                randconfig-006-20240109   gcc  
x86_64                randconfig-011-20240109   clang
x86_64                randconfig-012-20240109   clang
x86_64                randconfig-013-20240109   clang
x86_64                randconfig-014-20240109   clang
x86_64                randconfig-015-20240109   clang
x86_64                randconfig-016-20240109   clang
x86_64                randconfig-071-20240109   clang
x86_64                randconfig-072-20240109   clang
x86_64                randconfig-073-20240109   clang
x86_64                randconfig-074-20240109   clang
x86_64                randconfig-075-20240109   clang
x86_64                randconfig-076-20240109   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240109   gcc  
xtensa                randconfig-002-20240109   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
