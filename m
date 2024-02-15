Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D7855A0F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 06:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D242D10E20A;
	Thu, 15 Feb 2024 05:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpse1m2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A9910E1C7;
 Thu, 15 Feb 2024 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707974161; x=1739510161;
 h=date:from:to:cc:subject:message-id;
 bh=qgdJhSSNO7rE+7kO4I8ld6UjUekfeRC5owY/T3MGV+g=;
 b=jpse1m2xQEqIWyt0ty6UhPufQEB8eqoSJiL5h4tyPehnibX6FSwV6Un3
 460gs3sqKWouwndWQBOvq87pZ6rQuIu7Rk8WromLTHUCKC8HvxkdTUQ0q
 Y9dWMRuO7dZ85XOIRaVIy5bjR2TsApJ2zbDFTPCRyCplU7JoRbmUA7kZu
 dfiNMn8BJi9hPamjW3gE8MNOD2z38nf87tJgvPjEmyBomsP6J0ddusb8T
 V5VhQitseZNdFRb1jcFAE85C3E82x2CP3f+9e0aTY3JP8XgtVN0DTFZ/b
 vM8ngIh/iDzncwu9ZrL8SfxcJnUNvUdgWG7muYSUN0KGgTNK0IVOqOtV9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5877730"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5877730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 21:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="26591598"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2024 21:15:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1raU5b-00008N-1L;
 Thu, 15 Feb 2024 05:15:23 +0000
Date: Thu, 15 Feb 2024 13:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-bcachefs@vger.kernel.org, nouveau@lists.freedesktop.org,
 ntfs3@lists.linux.dev
Subject: [linux-next:master] BUILD REGRESSION
 2c3b09aac00d7835023bbc4473ee06696be64fa8
Message-ID: <202402151350.ysyHLvEa-lkp@intel.com>
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
branch HEAD: 2c3b09aac00d7835023bbc4473ee06696be64fa8  Add linux-next specific files for 20240214

Error/Warning: (recently discovered and may have been fixed)

iptable_nat.c:(.ref.text+0x1a): undefined reference to `ipt_unregister_table_exit'
xtensa-linux-ld: iptable_nat.c:(.text+0x2b4): undefined reference to `ipt_register_table'
xtensa-linux-ld: iptable_nat.c:(.text+0x2b8): undefined reference to `ipt_unregister_table_exit'
xtensa-linux-ld: iptable_nat.c:(.text+0x2cf): undefined reference to `ipt_alloc_initial_table'
xtensa-linux-ld: net/ipv4/netfilter/iptable_nat.o:(.ref.text+0x4): undefined reference to `ipt_unregister_table_exit'
xtensa-linux-ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x88): undefined reference to `ipt_do_table'

Unverified Error/Warning (likely false positive, please contact us if interested):

{standard input}:508: Warning: overflow in branch to .L76; converted into longer instruction sequence
{standard input}:631: Warning: overflow in branch to .L88; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-randconfig-001-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- csky-randconfig-r064-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-buildonly-randconfig-004-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-005-20240214
|   |-- iptable_nat.c:(.text):undefined-reference-to-ipt_alloc_initial_table
|   `-- ld:net-ipv4-netfilter-iptable_nat.o:(.rodata):undefined-reference-to-ipt_do_table
|-- i386-randconfig-004-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-014-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- microblaze-randconfig-r053-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-randconfig-001-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- parisc64-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- sh-randconfig-c004-20220215
|   `-- standard-input:Warning:overflow-in-branch-to-.L88-converted-into-longer-instruction-sequence
|-- sh-randconfig-r022-20230722
|   `-- standard-input:Warning:overflow-in-branch-to-.L76-converted-into-longer-instruction-sequence
|-- sparc-allmodconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc-randconfig-002-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sparc64-allmodconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc64-allyesconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc64-randconfig-002-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- um-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-buildonly-randconfig-003-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-002-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-004-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-013-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-014-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-076-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- x86_64-randconfig-102-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-161-20240214
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   `-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|-- xtensa-buildonly-randconfig-r001-20220206
|   |-- iptable_nat.c:(.ref.text):undefined-reference-to-ipt_unregister_table_exit
|   |-- xtensa-linux-ld:iptable_nat.c:(.text):undefined-reference-to-ipt_alloc_initial_table
|   |-- xtensa-linux-ld:iptable_nat.c:(.text):undefined-reference-to-ipt_register_table
|   |-- xtensa-linux-ld:iptable_nat.c:(.text):undefined-reference-to-ipt_unregister_table_exit
|   |-- xtensa-linux-ld:net-ipv4-netfilter-iptable_nat.o:(.ref.text):undefined-reference-to-ipt_unregister_table_exit
|   `-- xtensa-linux-ld:net-ipv4-netfilter-iptable_nat.o:(.rodata):undefined-reference-to-ipt_do_table
`-- xtensa-randconfig-002-20240214
    `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-randconfig-001-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-randconfig-004-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-randconfig-002-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- arm64-randconfig-004-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-001-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-002-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-buildonly-randconfig-006-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-002-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-005-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-016-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- i386-randconfig-052-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-141-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   `-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|-- mips-randconfig-r062-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-randconfig-001-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc-randconfig-002-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc-randconfig-003-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- s390-randconfig-001-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-buildonly-randconfig-006-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-003-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- x86_64-randconfig-005-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-011-20240214
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_get_wptr
|   |-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_irq_rearm
|   `-- drivers-gpu-drm-amd-amdgpu-ih_v7_0.c:warning:Function-parameter-or-struct-member-ih-not-described-in-ih_v7_0_set_rptr
|-- x86_64-randconfig-015-20240214
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-072-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-074-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-101-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-103-20240214
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
`-- x86_64-randconfig-104-20240214
    `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg

elapsed time: 1451m

configs tested: 178
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240214   gcc  
arc                   randconfig-002-20240214   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240214   clang
arm                   randconfig-002-20240214   gcc  
arm                   randconfig-003-20240214   clang
arm                   randconfig-004-20240214   clang
arm                        realview_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240214   clang
arm64                 randconfig-002-20240214   clang
arm64                 randconfig-003-20240214   gcc  
arm64                 randconfig-004-20240214   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240214   gcc  
csky                  randconfig-002-20240214   gcc  
hexagon                          alldefconfig   clang
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240214   clang
hexagon               randconfig-002-20240214   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240214   clang
i386         buildonly-randconfig-002-20240214   clang
i386         buildonly-randconfig-003-20240214   clang
i386         buildonly-randconfig-004-20240214   gcc  
i386         buildonly-randconfig-005-20240214   gcc  
i386         buildonly-randconfig-006-20240214   clang
i386                                defconfig   clang
i386                  randconfig-001-20240214   clang
i386                  randconfig-002-20240214   clang
i386                  randconfig-003-20240214   clang
i386                  randconfig-004-20240214   gcc  
i386                  randconfig-005-20240214   clang
i386                  randconfig-006-20240214   gcc  
i386                  randconfig-011-20240214   clang
i386                  randconfig-012-20240214   gcc  
i386                  randconfig-013-20240214   gcc  
i386                  randconfig-014-20240214   gcc  
i386                  randconfig-015-20240214   clang
i386                  randconfig-016-20240214   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240214   gcc  
loongarch             randconfig-002-20240214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240214   gcc  
nios2                 randconfig-002-20240214   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240214   gcc  
parisc                randconfig-002-20240214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240214   clang
powerpc               randconfig-002-20240214   clang
powerpc               randconfig-003-20240214   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240214   clang
powerpc64             randconfig-002-20240214   clang
powerpc64             randconfig-003-20240214   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240214   clang
riscv                 randconfig-002-20240214   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240214   clang
s390                  randconfig-002-20240214   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240214   gcc  
sh                    randconfig-002-20240214   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240214   gcc  
sparc64               randconfig-002-20240214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240214   clang
um                    randconfig-002-20240214   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240214   gcc  
x86_64       buildonly-randconfig-002-20240214   clang
x86_64       buildonly-randconfig-003-20240214   gcc  
x86_64       buildonly-randconfig-004-20240214   gcc  
x86_64       buildonly-randconfig-005-20240214   gcc  
x86_64       buildonly-randconfig-006-20240214   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240214   clang
x86_64                randconfig-002-20240214   gcc  
x86_64                randconfig-003-20240214   clang
x86_64                randconfig-004-20240214   gcc  
x86_64                randconfig-005-20240214   clang
x86_64                randconfig-006-20240214   clang
x86_64                randconfig-011-20240214   clang
x86_64                randconfig-012-20240214   clang
x86_64                randconfig-013-20240214   gcc  
x86_64                randconfig-014-20240214   gcc  
x86_64                randconfig-015-20240214   clang
x86_64                randconfig-016-20240214   clang
x86_64                randconfig-071-20240214   gcc  
x86_64                randconfig-072-20240214   clang
x86_64                randconfig-073-20240214   gcc  
x86_64                randconfig-074-20240214   clang
x86_64                randconfig-075-20240214   clang
x86_64                randconfig-076-20240214   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240214   gcc  
xtensa                randconfig-002-20240214   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
